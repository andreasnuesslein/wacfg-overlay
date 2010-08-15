#!/usr/bin/env python
import os
from wacfg import WaCfg, tools, main

class WordPress(WaCfg):
    def src_config(self):
        if not os.path.isfile("wp-config.php"):
            tools.cp("wp-sample-config.php","wp-config.php")
        tools.server_own(recursive=True)

main(WordPress, source="%(P)s.tar.gz")
