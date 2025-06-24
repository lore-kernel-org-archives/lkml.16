Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BB1E32B9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735691; cv=none; b=XfkzA2OvowW7tMC9owXj3p6qv0hdjJNidi1oOKyTzVOqgIgvuHrtIU4DBDaBKHiX+AucTtXAzUhrSZ0vMxYhGBvLxjydQpFBXoL4lnI9TJYkKIGTxBZjTcI1stRzhCEDDd9lVR7/G1j1HbuZGPAmOJRiUjMj/ok3Cavj5Zw6ZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735691; c=relaxed/simple;
	bh=nhmDOnyhNSm/GM78QvuNqf1euT1YRwPkp6GB9AGQ3Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uwzoCyiRCuCEsi9Noh2bB7/3ZoxY7ijMpN2TOVER+dbngTPG8pFQkpawqlHz65OUKA9KyW6dPosysP/ultFQbzvnd4RJ52hVvHQYhqDZYqhP4m+pzJrPYy9Kl5XGACwTBT/imqifWxVeiwmUPTKvfzP9L3bVK5nFm5Trg14L4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bOKHZfhY; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bOKHZfhY"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4DF7BC0003EF;
	Mon, 23 Jun 2025 20:28:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4DF7BC0003EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750735688;
	bh=nhmDOnyhNSm/GM78QvuNqf1euT1YRwPkp6GB9AGQ3Q0=;
	h=From:To:Cc:Subject:Date:From;
	b=bOKHZfhYwMeA2D+tTuCm7LJ//j3j+zUoleg992VsCPKkPzQOcsHEi+qmFRPtNFsZa
	 vBj1a9DmHUS9+qobgrKZvfJbfNJRZq2tSITQN2yPJcPh8egX88W4h+MUHhRZCOHdnr
	 Vp6CCZXifKW7P9JIw3/AyorjQtrzBVQN/w/QAQLo=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E76F21800052E;
	Mon, 23 Jun 2025 20:28:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2] scripts/gdb: Fix interrupts.py after maple tree conversion
Date: Mon, 23 Jun 2025 20:27:45 -0700
Message-Id: <20250624032751.1094840-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 721255b9826b ("genirq: Use a maple tree for interrupt
descriptor management"), the irq_desc_tree was replaced with a
sparse_irqs tree using a maple tree structure.

A new module (mapletree.py) is added whose mtree_load() implementation
is largely copied after the C version and uses the same variable and
intermediate function names wherever possible to ensure that both the C
and Python version be updated in the future.

Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt descriptor management")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
Changes in v2:

- do a proper Python implementation of mtree_load() since we cannot
  assume that context in which we will be interfacing with the target
  permits making direct function calls from the kernel.

 scripts/gdb/linux/constants.py.in |   7 +
 scripts/gdb/linux/interrupts.py   |  10 +-
 scripts/gdb/linux/mapletree.py    | 252 ++++++++++++++++++++++++++++++
 scripts/gdb/linux/xarray.py       |  28 ++++
 4 files changed, 292 insertions(+), 5 deletions(-)
 create mode 100644 scripts/gdb/linux/mapletree.py
 create mode 100644 scripts/gdb/linux/xarray.py

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index d5e3069f42a7..c3886739a028 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -20,6 +20,7 @@
 #include <linux/of_fdt.h>
 #include <linux/page_ext.h>
 #include <linux/radix-tree.h>
+#include <linux/maple_tree.h>
 #include <linux/slab.h>
 #include <linux/threads.h>
 #include <linux/vmalloc.h>
@@ -93,6 +94,12 @@ LX_GDBPARSED(RADIX_TREE_MAP_SIZE)
 LX_GDBPARSED(RADIX_TREE_MAP_SHIFT)
 LX_GDBPARSED(RADIX_TREE_MAP_MASK)
 
+/* linux/maple_tree.h */
+LX_VALUE(MAPLE_NODE_SLOTS)
+LX_VALUE(MAPLE_RANGE64_SLOTS)
+LX_VALUE(MAPLE_ARANGE64_SLOTS)
+LX_GDBPARSED(MAPLE_NODE_MASK)
+
 /* linux/vmalloc.h */
 LX_VALUE(VM_IOREMAP)
 LX_VALUE(VM_ALLOC)
diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index 8bd0d7108ae0..1401be6a28fb 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -7,7 +7,7 @@ import gdb
 from linux import constants
 from linux import cpus
 from linux import utils
-from linux import radixtree
+from linux import mapletree
 
 irq_desc_type = utils.CachedType("struct irq_desc")
 
@@ -23,12 +23,12 @@ def irqd_is_level(desc):
 def show_irq_desc(prec, irq):
     text = ""
 
-    desc = radixtree.lookup(gdb.parse_and_eval("&irq_desc_tree"), irq)
+    desc = mapletree.mtree_load(gdb.parse_and_eval("&sparse_irqs"), irq)
     if desc is None:
         return text
 
-    desc = desc.cast(irq_desc_type.get_type())
-    if desc is None:
+    desc = desc.cast(irq_desc_type.get_type().pointer())
+    if desc == 0:
         return text
 
     if irq_settings_is_hidden(desc):
@@ -221,7 +221,7 @@ class LxInterruptList(gdb.Command):
             gdb.write("CPU%-8d" % cpu)
         gdb.write("\n")
 
-        if utils.gdb_eval_or_none("&irq_desc_tree") is None:
+        if utils.gdb_eval_or_none("&irq_desc_tree") or utils.gdb_eval_or_none("&sparse_irqs") is None:
             return
 
         for irq in range(nr_irqs):
diff --git a/scripts/gdb/linux/mapletree.py b/scripts/gdb/linux/mapletree.py
new file mode 100644
index 000000000000..d52d51c0a03f
--- /dev/null
+++ b/scripts/gdb/linux/mapletree.py
@@ -0,0 +1,252 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+#  Maple tree helpers
+#
+# Copyright (c) 2025 Broadcom
+#
+# Authors:
+#  Florian Fainelli <florian.fainelli@broadcom.com>
+
+import gdb
+
+from linux import utils
+from linux import constants
+from linux import xarray
+
+maple_tree_root_type = utils.CachedType("struct maple_tree")
+maple_node_type = utils.CachedType("struct maple_node")
+maple_enode_type = utils.CachedType("void")
+
+maple_dense = 0
+maple_leaf_64 = 1
+maple_range_64 = 2
+maple_arange_64 = 3
+
+class Mas(object):
+    ma_active = 0
+    ma_start = 1
+    ma_root = 2
+    ma_none = 3
+    ma_pause = 4
+    ma_overflow = 5
+    ma_underflow = 6
+    ma_error = 7
+
+    def __init__(self, mt, first, end):
+        if mt.type == maple_tree_root_type.get_type().pointer():
+            self.tree = mt.dereference()
+        elif mt.type != maple_tree_root_type.get_type():
+            raise gdb.GdbError("must be {} not {}"
+                               .format(maple_tree_root_type.get_type().pointer(), mt.type))
+        self.tree = mt
+        self.index = first
+        self.last = end
+        self.node = None
+        self.status = self.ma_start
+        self.min = 0
+        self.max = -1
+
+    def is_start(self):
+        # mas_is_start()
+        return self.status == self.ma_start
+
+    def is_ptr(self):
+        # mas_is_ptr()
+        return self.status == self.ma_root
+
+    def is_none(self):
+        # mas_is_none()
+        return self.status == self.ma_none
+
+    def root(self):
+        # mas_root()
+        return self.tree['ma_root'].cast(maple_enode_type.get_type().pointer())
+
+    def start(self):
+        # mas_start()
+        if self.is_start() is False:
+            return None
+
+        self.min = 0
+        self.max = ~0
+
+        while True:
+            self.depth = 0
+            root = self.root()
+            if xarray.xa_is_node(root):
+                self.depth = 0
+                self.status = self.ma_active
+                self.node = mte_safe_root(root)
+                self.offset = 0
+                if mte_dead_node(self.node) is True:
+                    continue
+
+                return None
+
+            self.node = None
+            # Empty tree
+            if root is None:
+                self.status = self.ma_none
+                self.offset = constants.LX_MAPLE_NODE_SLOTS
+                return None
+
+            # Single entry tree
+            self.status = self.ma_root
+            self.offset = constants.LX_MAPLE_NODE_SLOTS
+
+            if self.index != 0:
+                return None
+
+            return root
+
+        return None
+
+    def reset(self):
+        # mas_reset()
+        self.status = self.ma_start
+        self.node = None
+
+def mte_safe_root(node):
+    if node.type != maple_enode_type.get_type().pointer():
+        raise gdb.GdbError("{} must be {} not {}"
+                           .format(mte_safe_root.__name__, maple_enode_type.get_type().pointer(), node.type))
+    ulong_type = utils.get_ulong_type()
+    indirect_ptr = node.cast(ulong_type) & ~0x2
+    val = indirect_ptr.cast(maple_enode_type.get_type().pointer())
+    return val
+
+def mte_node_type(entry):
+    ulong_type = utils.get_ulong_type()
+    val = None
+    if entry.type == maple_enode_type.get_type().pointer():
+        val = entry.cast(ulong_type)
+    elif entry.type == ulong_type:
+        val = entry
+    else:
+        raise gdb.GdbError("{} must be {} not {}"
+                           .format(mte_node_type.__name__, maple_enode_type.get_type().pointer(), entry.type))
+    return (val >> 0x3) & 0xf
+
+def ma_dead_node(node):
+    if node.type != maple_node_type.get_type().pointer():
+        raise gdb.GdbError("{} must be {} not {}"
+                           .format(ma_dead_node.__name__, maple_node_type.get_type().pointer(), node.type))
+    ulong_type = utils.get_ulong_type()
+    parent = node['parent']
+    indirect_ptr = node['parent'].cast(ulong_type) & ~constants.LX_MAPLE_NODE_MASK
+    return indirect_ptr == node
+
+def mte_to_node(enode):
+    ulong_type = utils.get_ulong_type()
+    if enode.type == maple_enode_type.get_type().pointer():
+        indirect_ptr = enode.cast(ulong_type)
+    elif enode.type == ulong_type:
+        indirect_ptr = enode
+    else:
+        raise gdb.GdbError("{} must be {} not {}"
+                           .format(mte_to_node.__name__, maple_enode_type.get_type().pointer(), enode.type))
+    indirect_ptr = indirect_ptr & ~constants.LX_MAPLE_NODE_MASK
+    return indirect_ptr.cast(maple_node_type.get_type().pointer())
+
+def mte_dead_node(enode):
+    if enode.type != maple_enode_type.get_type().pointer():
+        raise gdb.GdbError("{} must be {} not {}"
+                           .format(mte_dead_node.__name__, maple_enode_type.get_type().pointer(), enode.type))
+    node = mte_to_node(enode)
+    return ma_dead_node(node)
+
+def ma_is_leaf(tp):
+    result = tp < maple_range_64
+    return tp < maple_range_64
+
+def mt_pivots(t):
+    if t == maple_dense:
+        return 0
+    elif t == maple_leaf_64 or t == maple_range_64:
+        return constants.LX_MAPLE_RANGE64_SLOTS - 1
+    elif t == maple_arange_64:
+        return constants.LX_MAPLE_ARANGE64_SLOTS - 1
+
+def ma_pivots(node, t):
+    if node.type != maple_node_type.get_type().pointer():
+        raise gdb.GdbError("{}: must be {} not {}"
+                           .format(ma_pivots.__name__, maple_node_type.get_type().pointer(), node.type))
+    if t == maple_arange_64:
+        return node['ma64']['pivot']
+    elif t == maple_leaf_64 or t == maple_range_64:
+        return node['mr64']['pivot']
+    else:
+        return None
+
+def ma_slots(node, tp):
+    if node.type != maple_node_type.get_type().pointer():
+        raise gdb.GdbError("{}: must be {} not {}"
+                           .format(ma_slots.__name__, maple_node_type.get_type().pointer(), node.type))
+    if tp == maple_arange_64:
+        return node['ma64']['slot']
+    elif tp == maple_range_64 or tp == maple_leaf_64:
+        return node['mr64']['slot']
+    elif tp == maple_dense:
+        return node['slot']
+    else:
+        return None
+
+def mt_slot(mt, slots, offset):
+    ulong_type = utils.get_ulong_type()
+    return slots[offset].cast(ulong_type)
+
+def mtree_lookup_walk(mas):
+    ulong_type = utils.get_ulong_type()
+    n = mas.node
+
+    while True:
+        node = mte_to_node(n)
+        tp = mte_node_type(n)
+        pivots = ma_pivots(node, tp)
+        end = mt_pivots(tp)
+        offset = 0
+        while True:
+            if pivots[offset] >= mas.index:
+                break
+            if offset >= end:
+                break
+            offset += 1
+
+        slots = ma_slots(node, tp)
+        n = mt_slot(mas.tree, slots, offset)
+        if ma_dead_node(node) is True:
+            mas.reset()
+            return None
+            break
+
+        if ma_is_leaf(tp) is True:
+            break
+
+    return n
+
+def mtree_load(mt, index):
+    ulong_type = utils.get_ulong_type()
+    # MT_STATE(...)
+    mas = Mas(mt, index, index)
+    entry = None
+
+    while True:
+        entry = mas.start()
+        if mas.is_none():
+            return None
+
+        if mas.is_ptr():
+            if index != 0:
+                entry = None
+            return entry
+
+        entry = mtree_lookup_walk(mas)
+        if entry is None and mas.is_start():
+            continue
+        else:
+            break
+
+    if xarray.xa_is_zero(entry):
+        return None
+
+    return entry
diff --git a/scripts/gdb/linux/xarray.py b/scripts/gdb/linux/xarray.py
new file mode 100644
index 000000000000..f4477b5def75
--- /dev/null
+++ b/scripts/gdb/linux/xarray.py
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+#  Xarray helpers
+#
+# Copyright (c) 2025 Broadcom
+#
+# Authors:
+#  Florian Fainelli <florian.fainelli@broadcom.com>
+
+import gdb
+
+from linux import utils
+from linux import constants
+
+def xa_is_internal(entry):
+    ulong_type = utils.get_ulong_type()
+    return ((entry.cast(ulong_type) & 3) == 2)
+
+def xa_mk_internal(v):
+    return ((v << 2) | 2)
+
+def xa_is_zero(entry):
+    ulong_type = utils.get_ulong_type()
+    return entry.cast(ulong_type) == xa_mk_internal(257)
+
+def xa_is_node(entry):
+    ulong_type = utils.get_ulong_type()
+    return xa_is_internal(entry) and (entry.cast(ulong_type) > 4096)
-- 
2.34.1

