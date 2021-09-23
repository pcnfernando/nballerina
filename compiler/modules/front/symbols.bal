import wso2/nballerina.bir;
import wso2/nballerina.types as t;
import wso2/nballerina.front.syntax as s;
// import wso2/nballerina.err;

type ModuleDefns table<s:ModuleLevelDefn> key(name);

// This is the module-level symbol table.
type ModuleSymbols record {|
    ModuleDefns defns = table [];
    map<Import>[] partPrefixes = [];
    t:Context tc;
|};

type Import record {|
    s:ImportDecl decl;
    bir:ModuleId moduleId;
    ModuleExports defns;
    boolean used = false;
|};

public type ExportedDefn bir:FunctionSignature|t:SemType|s:ResolvedConst;

public type ModuleExports readonly & map<ExportedDefn>;

function symbolToString(ModuleSymbols mod, int partIndex, bir:Symbol sym) returns string {
    string prefix;
    if sym is bir:InternalSymbol {
        prefix = "";
    }
    else {
        bir:ModuleId modId = sym.module;
        string? importPrefix = getPrefixForModuleId(mod, partIndex, modId);
        if importPrefix == () {
            string? org = modId.org;
            string orgString = org == () ? "" : org + "/";
            prefix = "{" + orgString  + ".".'join(...sym.module.names) + "}";
        }
        else {
            prefix = importPrefix + ":";
        }
    }
    return prefix + sym.identifier;
}

function getPrefixForModuleId(ModuleSymbols mod, int partIndex, bir:ModuleId id) returns string? {
    foreach var [prefix, { moduleId }] in mod.partPrefixes[partIndex].entries() {
        if moduleId == id {
            return prefix;
        }
    }
    return ();
}

function createExports(ModuleSymbols mod) returns ModuleExports {
    map<ExportedDefn> exports = {};
    foreach var defn in mod.defns {
        ExportedDefn|false? export;
        if defn.vis != "public" {
            continue;
        }
        if defn is s:FunctionDefn {
            export = defn.signature;
        }
        else if defn is s:ConstDefn {
            export = defn.resolved;
        }
        else {
            export = defn.semType;
        }
        exports[defn.name] = <ExportedDefn>export;
    }
    return exports.cloneReadOnly();
}

function moduleIdDefaultPrefix(bir:ModuleId id) returns string {
    // JBUG Bad, sad without `names` variable
    string[] names = id.names;
    return names[names.length() - 1];
}

function moduleIdToString(bir:ModuleId id) returns string {
    string m = ".".'join(...id.names);
    if id.org != "" {
        return id.org + "/"  + m;
    }
    else {
        return m;
    }
}
