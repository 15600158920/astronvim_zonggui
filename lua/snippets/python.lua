local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  s ("imodel",t{
"import configparser",
"import logging",
"import datetime",
"import os",
"",
"",
"class etl_mysql_2_csv():",
"    def __init__(self, conf):",
"        # 获取当前时间作为开始时间",
"        self.start_time = datetime.datetime.now()",
"        # 读取配置文件",
"        self.conf = etl_mysql_2_csv.get_config_msg(conf)",
"        # 初始化日志",
"        self.LOG = etl_mysql_2_csv.init_log(self)",
"        self.LOG.info(\"============================== init ===========================\")",
"        self.LOG.info(\"Logging initialized successfully.\")",
"        self.LOG.info(\"read config file success, filename is:  [\" + os.path.dirname(",
"            os.path.abspath(__file__)) + \"conf\\\\\" + conf + \"]\")",
"        ",
"		",
"	def get_config_msg(conf):",
"        \"\"\"",
"        读取指定配置文件",
"        \"\"\"",
"        cf = configparser.ConfigParser()",
"        cf.read(os.path.join(os.path.dirname(os.path.abspath(__file__)), \"conf\", conf), encoding='utf-8')",
"        return cf",
"",
"    def init_log(self):",
"        \"\"\"",
"        初始化 logging 配置",
"        \"\"\"",
"        log_path = self.conf.get(\"file_msg\", \"log_path\")",
"        log_file = self.conf.get(\"file_msg\", \"log_file\")",
"        LOG = logging.getLogger()",
"        LOG.setLevel(logging.DEBUG)  ## 设置输出级别",
"        fh = logging.FileHandler(os.path.join(log_path, log_file  + \"_\" +  time.strftime('%Y%m', time.localtime()) + \".log\"))",
"        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')",
"        fh.setFormatter(formatter)  # 把formater绑定到fh上",
"        LOG.addHandler(fh)",
"        return LOG",
"		",
"if __name__ == '__main__':",
"	m2c = etl_mysql_2_csv(\"config.ini\")",
"	pass",
  })
}



