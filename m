Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66051A08A3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696731; cv=none; b=DHjSAF8hy0D8gavVVw+A/RuVabE9uZw9zY2w002V0tatmy9JuguYZydiZzNDC9xMEjHVHROY5pVuIEPJFRjbFdCAFoeePacQUNMP+I+Ux1h/ShuLCy/ZicuSFDPmSBX84ReU9Elgw7I1x0ZP+6PqkgUi97p9r5smQS/rgmXF158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696731; c=relaxed/simple;
	bh=5T7niRpvRqV81ZSiKDZXBdR/opDw/u9UVJycxopuszA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1tPcvpc83I3OFv/A2vCIecH/fjiH7BVKNueSB44mqtv5PbxKl/Z26OfG/wQV/q0A3xFFDpeHj8hE+HhvqTQiMxZPCYj4fTtTsX7NPOewkrjnxOos24uph+VrjPJxOeCM3BZnLg3mlL9eiM2zZRmVTo2iaNSgFWhIkzg6TB8YNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GtaYOkcD; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GtaYOkcD"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C1D70C0005D7;
	Mon, 23 Jun 2025 09:38:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C1D70C0005D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750696722;
	bh=5T7niRpvRqV81ZSiKDZXBdR/opDw/u9UVJycxopuszA=;
	h=From:To:Cc:Subject:Date:From;
	b=GtaYOkcDSpPgtioljQWvVwjUyaIJ0HWSvWpMn0xyOjrUEV+4hQGORsLM9VhmUBBkn
	 OZtJ2yLzi3hC0wfvqUkJSFF/naoBSfxVr5CbQk/ytffmSigKZsCEAK69dLDAh6mjqT
	 mRVHQ9mbuIyOrExTdviuH1nB7LaZzroRCvgvym7M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7068B18000530;
	Mon, 23 Jun 2025 09:38:42 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] scripts/gdb: Fix interrupts display after MCP on x86
Date: Mon, 23 Jun 2025 09:38:26 -0700
Message-ID: <20250623163836.745702-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The text line would not be appended to as it should have, it should have
been a '+=' but ended up being a '==', fix that.

Fixes: b0969d7687a7 ("scripts/gdb: print interrupts")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 scripts/gdb/linux/interrupts.py       |   2 +-
 scripts/gdb/linux/irq.py              |  47 ++++++++++
 scripts/gdb/linux/mtree_load_debug.py | 122 ++++++++++++++++++++++++++
 3 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gdb/linux/irq.py
 create mode 100644 scripts/gdb/linux/mtree_load_debug.py

diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index a48b5874663e..419ab98d2e2b 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -141,7 +141,7 @@ def x86_show_interupts(prec):
 
     if constants.LX_CONFIG_X86_MCE:
         text += x86_show_mce(prec, "&mce_exception_count", "MCE", "Machine check exceptions")
-        text == x86_show_mce(prec, "&mce_poll_count", "MCP", "Machine check polls")
+        text += x86_show_mce(prec, "&mce_poll_count", "MCP", "Machine check polls")
 
     text += show_irq_err_count(prec)
 
diff --git a/scripts/gdb/linux/irq.py b/scripts/gdb/linux/irq.py
new file mode 100644
index 000000000000..b2a3f0e01336
--- /dev/null
+++ b/scripts/gdb/linux/irq.py
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# linux/scripts/gdb/linux/interrupts.py
+#
+# List IRQs using irq_to_desc() backed by maple tree
+
+import gdb
+
+class LxIrqs(gdb.Command):
+    """List active IRQs via irq_to_desc()."""
+
+    def __init__(self):
+        super(LxIrqs, self).__init__("lx-irqs", gdb.COMMAND_USER)
+
+    def invoke(self, arg, from_tty):
+        try:
+            max_irqs = int(gdb.parse_and_eval("nr_irqs"))
+        except gdb.error:
+            max_irqs = 4096  # Fallback value
+
+        print("{:<20} {:<6} {:<20} {}".format("Address", "IRQ", "Handler", "Name"))
+        print("-" * 50)
+
+        for irq in range(max_irqs):
+            try:
+                desc = gdb.parse_and_eval(f"irq_to_desc({irq})")
+                if desc == 0:
+                    continue
+
+                ptr = desc
+                desc = desc.dereference()
+                action = desc["action"]
+                if int(action) == 0:
+                    continue
+
+                name = action["name"]
+                handler = action["handler"]
+
+                name_str = name.string() if name else "<no name>"
+                print("{:<20} {:<6} {:<20} {}".format(str(ptr), irq, str(handler), name_str))
+
+            except gdb.error:
+                continue
+
+
+LxIrqs()
+
diff --git a/scripts/gdb/linux/mtree_load_debug.py b/scripts/gdb/linux/mtree_load_debug.py
new file mode 100644
index 000000000000..374fe01f2b4f
--- /dev/null
+++ b/scripts/gdb/linux/mtree_load_debug.py
@@ -0,0 +1,122 @@
+import gdb
+
+class MTreeLoad(gdb.Command):
+    def __init__(self):
+        super(MTreeLoad, self).__init__("mtree-load", gdb.COMMAND_USER)
+
+    def invoke(self, arg, from_tty):
+        try:
+            args = gdb.string_to_argv(arg)
+            if len(args) != 2:
+                print("Usage: mtree-load <symbol> <key>")
+                return
+
+            sym_name = args[0]
+            key = int(args[1])
+
+            sym = gdb.parse_and_eval(sym_name)
+            root_val = sym['ma_root']
+            root_ptr_val = root_val.cast(gdb.lookup_type("void").pointer())
+            root_ptr_int = int(root_ptr_val)
+
+            print(f"[debug] Starting at root: {hex(root_ptr_int)}")
+
+            if root_ptr_int == 0 or root_ptr_int == 0xffffffffffffffff:
+                print("[error] Empty or invalid tree root.")
+                return
+
+            clean_ptr_val = root_ptr_val.cast(gdb.lookup_type("unsigned long"))
+            clean_addr = int(clean_ptr_val) & ~0xf
+            print(f"[debug] Untagged node ptr: {hex(clean_addr)}")
+
+            node_ptr_val = gdb.Value(clean_addr).cast(
+                gdb.lookup_type("void").pointer()).cast(
+                gdb.lookup_type("struct maple_node").pointer())
+            node = node_ptr_val.dereference()
+
+            self.walk_node(node)
+
+        except Exception as e:
+            print(f"Initialization or lookup error: {e}")
+
+    def get_slot_count(self, node):
+        try:
+            base = int(node.address.cast(gdb.lookup_type("unsigned long")))
+            meta_end_offset = 264
+            end_ptr = gdb.Value(base + meta_end_offset).cast(
+                gdb.lookup_type('unsigned char').pointer())
+            count = int(end_ptr.dereference())
+            print(f"[debug] Extracted count from meta.end @ {hex(base + meta_end_offset)} = {count}")
+            return count
+        except Exception as e:
+            print(f"[error] Could not determine slot count: {e}")
+            raise
+
+    def walk_node(self, node):
+        count = self.get_slot_count(node)
+        print(f"[debug] Brute-force scanning node with count = {count}")
+
+        base = int(node.address.cast(gdb.lookup_type("unsigned long")))
+        slot_offset = 8
+        pointer_size = gdb.lookup_type("void").pointer().sizeof
+
+        for i in range(count + 1):
+            slot_addr = base + slot_offset + i * pointer_size
+            try:
+                val = gdb.Value(slot_addr).cast(gdb.lookup_type("unsigned long").pointer()).dereference()
+                addr = int(val)
+            except Exception as e:
+                print(f"[error] Failed to read raw slot[{i}] at {hex(slot_addr)}: {e}")
+                continue
+
+            if addr == 0 or addr == 0xffffffffffffffff:
+                print(f"[debug] Skipping null/invalid slot[{i}] = {hex(addr)}")
+                continue
+
+            clean_ptr = addr & ~0xf
+
+            # Attempt to treat it as irq_desc
+            try:
+                irq_desc_ptr = gdb.Value(clean_ptr).cast(
+                    gdb.lookup_type("struct irq_desc").pointer())
+                _ = irq_desc_ptr.dereference()
+                self.print_irq_desc(clean_ptr)
+                continue
+            except:
+                pass
+
+            # If not irq_desc, maybe it's another node
+            try:
+                subnode_ptr = gdb.Value(clean_ptr).cast(
+                    gdb.lookup_type("void").pointer()).cast(
+                    gdb.lookup_type("struct maple_node").pointer())
+                subnode = subnode_ptr.dereference()
+                print(f"[debug] Recursively walking subnode from slot[{i}] = {hex(clean_ptr)}")
+                self.walk_node(subnode)
+            except Exception as e:
+                print(f"[debug] Slot[{i}] @ {hex(clean_ptr)} is not a known structure: {e}")
+
+    def print_irq_desc(self, ptr):
+        try:
+            print(f"[debug] Attempting to print irq_desc at {hex(ptr)}")
+            irq_desc_ptr = gdb.Value(ptr).cast(
+                gdb.lookup_type("struct irq_desc").pointer())
+            irq_desc = irq_desc_ptr.dereference()
+
+            irq_number = int(irq_desc['irq_data']['irq'])
+
+            try:
+                chip = irq_desc['irq_data']['chip']
+                chip_name = chip.dereference().type.name
+            except Exception:
+                chip_name = "<unavailable>"
+
+            print("""--- IRQ Descriptor ---
+  IRQ number: {}
+  Chip type: {}
+----------------------""".format(irq_number, chip_name))
+
+        except Exception as e:
+            print(f"[error] Could not print IRQ descriptor: {e}")
+
+MTreeLoad()
-- 
2.43.0

