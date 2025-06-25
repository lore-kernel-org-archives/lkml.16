Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E91D7984
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873972; cv=none; b=SD+DL717Fu+57VuYlPAosvwWL8tc1wsYzjzjk2HHNqPq325xkkXprRh77jPMK0DvIPH86ERjPuN8ygmfuUWear6rwx5nmAyJI/YtjM6OIzfqXVubIjLUJbMbHk/IBDanMWKljFeAMhvPhEbpXdFlv0UO1ecLzSApBMrDCg/cN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873972; c=relaxed/simple;
	bh=diUs+emJ1PgouBHKc8p0tTDSS6ZydLFUrIltWRKGTSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCaQgIkgL88W3GsvDX0+5ms472aiCCOVvLRTjU7RD8C52vbiPzUr+0nbzQKJuy1JD3EflKAlC+tr37fMK2s1JJZk3kOHHdYujrjsGdwP6Cs+t+TEeV7U7H4KGehp6Pgpl7J2Pd9Cnd8FVGxYII7pgtmLGMNIPyDnDx0HUymVPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y+gCQtRU; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y+gCQtRU"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id DF31DC002827;
	Wed, 25 Jun 2025 10:52:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com DF31DC002827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750873962;
	bh=diUs+emJ1PgouBHKc8p0tTDSS6ZydLFUrIltWRKGTSM=;
	h=From:To:Cc:Subject:Date:From;
	b=Y+gCQtRUvMs4FWolx1t2qnTYkLBjTIqwFBRJuaHPdB2PShGBgMe3CPnPwekcUHPB7
	 Bb31zWcpKKe4UJp8OCUCVnBtWNrIW+0jM+cdj8omRcHqTzCVgt9pEqbRn7uE4yxoOq
	 e1h3mlbiT68Pw91x0Ec5aHoteuo0BhV1FuYFHXmc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 8FBCD18000530;
	Wed, 25 Jun 2025 10:52:42 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	jan.kiszka@siemens.com,
	kbingham@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH] MAINTAINERS: Associate GDB scripts with their subsystems
Date: Wed, 25 Jun 2025 10:52:38 -0700
Message-ID: <20250625175239.1099848-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GDB scripts under scripts/gdb/linux are very useful for inspecting
kernel data structures however they depend upon the internal APIs and
data structures which are updated without much consideration for those
scripts. This results in a near constant catching up with fixing the
scripts so they continue to work.

Associate the GDB scripts with their subsystems in the hope that they
get more love and attention.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee92683..ffd08e63cd20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5979,6 +5979,7 @@ F:	include/dt-bindings/clock/
 F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
+F:	scripts/gdb/linux/clk.py
 F:	rust/helpers/clk.c
 F:	rust/kernel/clk.rs
 X:	drivers/clk/clkdev.c
@@ -7374,6 +7375,7 @@ F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
+F:	scripts/gdb/linux/device.py
 
 DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
 M:	Nishanth Menon <nm@ti.com>
@@ -10119,6 +10121,7 @@ F:	Documentation/devicetree/bindings/power/power?domain*
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
 F:	drivers/pmdomain/
 F:	include/linux/pm_domain.h
+F:	scripts/gdb/linux/genpd.py
 
 GENERIC RADIX TREE
 M:	Kent Overstreet <kent.overstreet@linux.dev>
@@ -10126,6 +10129,7 @@ S:	Supported
 C:	irc://irc.oftc.net/bcache
 F:	include/linux/generic-radix-tree.h
 F:	lib/generic-radix-tree.c
+F:	scripts/gdb/linux/radixtree.py
 
 GENERIC RESISTIVE TOUCHSCREEN ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
@@ -12750,6 +12754,7 @@ F:	include/linux/irqnr.h
 F:	include/linux/irqreturn.h
 F:	kernel/irq/
 F:	lib/group_cpus.c
+F:	scripts/gdb/linux/interrupts.py
 
 IRQCHIP DRIVERS
 M:	Thomas Gleixner <tglx@linutronix.de>
@@ -12985,6 +12990,7 @@ F:	include/linux/kasan*.h
 F:	lib/Kconfig.kasan
 F:	mm/kasan/
 F:	scripts/Makefile.kasan
+F:	scripts/gdb/linux/kasan.py
 
 KCONFIG
 M:	Masahiro Yamada <masahiroy@kernel.org>
@@ -14464,6 +14470,7 @@ F:	include/linux/maple_tree.h
 F:	include/trace/events/maple_tree.h
 F:	lib/maple_tree.c
 F:	lib/test_maple_tree.c
+F:	scripts/gdb/linux/mapletree.py
 F:	tools/testing/radix-tree/maple.c
 F:	tools/testing/shared/linux/maple_tree.h
 
@@ -15748,6 +15755,10 @@ F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
 F:	include/trace/events/ksm.h
 F:	mm/
+F:	scripts/gdb/linux/mm.py
+F:	scripts/gdb/linux/page_owner.py
+F:	scripts/gdb/linux/pgtable.py
+F:	scripts/gdb/linux/slab.py
 F:	tools/mm/
 F:	tools/testing/selftests/mm/
 N:	include/linux/page[-_]*
@@ -16809,6 +16820,7 @@ F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
 F:	lib/tests/module/
+F:	scripts/gdb/linux/modules.py
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 F:	tools/testing/selftests/module/
@@ -19430,6 +19442,7 @@ F:	arch/*/include/asm/percpu.h
 F:	include/linux/percpu*.h
 F:	lib/percpu*.c
 F:	mm/percpu*.c
+F:	scripts/gdb/linux/cpus.py
 
 PER-TASK DELAY ACCOUNTING
 M:	Balbir Singh <bsingharora@gmail.com>
@@ -19771,6 +19784,7 @@ F:	include/trace/events/timer*
 F:	kernel/time/itimer.c
 F:	kernel/time/posix-*
 F:	kernel/time/namespace.c
+F:	scripts/gdb/linux/timerlist.py
 
 POWER MANAGEMENT CORE
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
@@ -19886,6 +19900,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
 F:	include/linux/printk.h
 F:	kernel/printk/
+F:	scripts/gdb/linux/dmesg.py
 
 PRINTK INDEXING
 R:	Chris Down <chris@chrisdown.name>
@@ -19901,6 +19916,7 @@ S:	Maintained
 F:	Documentation/filesystems/proc.rst
 F:	fs/proc/
 F:	include/linux/proc_fs.h
+F:	scripts/gdb/linux/proc.py
 F:	tools/testing/selftests/proc/
 
 PROC SYSCTL
@@ -26440,6 +26456,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/vmalloc.h
 F:	mm/vmalloc.c
 F:	lib/test_vmalloc.c
+F:	scripts/gdb/linux/vmalloc.py
 
 VME SUBSYSTEM
 L:	linux-kernel@vger.kernel.org
@@ -26949,6 +26966,7 @@ F:	include/linux/xarray.h
 F:	lib/idr.c
 F:	lib/test_xarray.c
 F:	lib/xarray.c
+F:	scripts/gdb/linux/xarray.py
 F:	tools/testing/radix-tree
 
 XARRAY API [RUST]
-- 
2.43.0

