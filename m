Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E623C8A0
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275601; cv=none; b=RY3tNTTIJEgq6TtdIKoHjQdmHZ0UPn4YYAX9E8EdX/uoc2MI6tQxCs+B9xYCi3T1MIJnHDq8NiUi9hAZeEjkLJ5/HguW1idoJwj4hGr0+pxIvblPWbxvQrW8w4NJA8K1MEV33a5v94i64Gr+oPkZAv/eXLo1kx1lCC7Yz7HDlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275601; c=relaxed/simple;
	bh=7VwqOQ1B6A6o2ZFcNmUabN51pycZSGdQEcuVft8P+e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHF9g3qXmxEguWCqaGIni6hplVAOUGLfBf62J596Iad3PUutejaz49ZCLOw3LtxKnk8BAJam1law779yxuXx9aWl9+mJHoFuM2LdGVDkvXHF2JThcWMUAXe7P/qDHpqF2uYAQN6bd1jo4yWy/LGr11791j+l1SoM3uMD6bJJBGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=Rdb8pL96; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="Rdb8pL96"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 19BC1180074
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:33:10 +0200 (CEST)
Received: (qmail 32699 invoked by uid 988); 3 May 2025 12:33:10 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 03 May 2025 14:33:09 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Rommel <mail@florommel.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Brendan Jackman <jackmanb@google.com>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH 2/2] scripts/gdb: Update documentation for lx_per_cpu
Date: Sat,  3 May 2025 14:32:32 +0200
Message-ID: <20250503123234.2407184-3-illia@yshyn.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503123234.2407184-1-illia@yshyn.com>
References: <20250503123234.2407184-1-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: ------
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.993668) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1)
X-Rspamd-Score: -6.093668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=7VwqOQ1B6A6o2ZFcNmUabN51pycZSGdQEcuVft8P+e0=;
	b=Rdb8pL96+syTStK0BchiK4705i66yKnPFQZbZpATRKfwbFMmop+oDfUztwAlPfU6zKt4uU6UhA
	faQ6SHgw+dRG54AAkKTQbfMlNILf/HIxKVOP4mlD8k21fac43PaOt4wKVaHP/4lGh4cJ4LG6bG04
	t7xlzwDZss5Am/r50S6SwHpRlqCEOj2+HEQz9TYHfsFKxQ3pLh/F+E3QtnXYO3mEEebGgoi+HSCF
	t1hrgigWrtxYvY617HfjuYA5D4DEd1Jl1h/Fj2C5TL7t2sAT6zG/PKe30+vhDu6OU694gT48ynIx
	q8unX3CfFkmcF26vOGI5BmRn09cIp0r+gkRSWUkA==

Commit db08c53fdd542bb7f83b ("scripts/gdb: fix parameter handling in
$lx_per_cpu") changed the parameter handling of lx_per_cpu to use
GdbValue instead of parsing the variable name.  Update the documentation
to reflect the new lx_per_cpu usage.  Update the hrtimer_bases example
to use rb_tree instead of the timerqueue_head.next pointer removed in
commit 511885d7061eda3eb1fa ("lib/timerqueue: Rely on rbtree semantics
for next timer").

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 .../debugging/gdb-kernel-debugging.rst        | 34 ++++++++-----------
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst  | 34 ++++++++-----------
 .../zh_TW/dev-tools/gdb-kernel-debugging.rst  | 34 ++++++++-----------
 scripts/gdb/linux/cpus.py                     |  4 +--
 4 files changed, 47 insertions(+), 59 deletions(-)

diff --git a/Documentation/process/debugging/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
index 895285c037c7..9475c759c722 100644
--- a/Documentation/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/process/debugging/gdb-kernel-debugging.rst
@@ -127,35 +127,31 @@ Examples of using the Linux-provided gdb helpers
 
 - Make use of the per-cpu function for the current or a specified CPU::
 
-    (gdb) p $lx_per_cpu("runqueues").nr_running
+    (gdb) p $lx_per_cpu(runqueues).nr_running
     $3 = 1
-    (gdb) p $lx_per_cpu("runqueues", 2).nr_running
+    (gdb) p $lx_per_cpu(runqueues, 2).nr_running
     $4 = 0
 
 - Dig into hrtimers using the container_of helper::
 
-    (gdb) set $next = $lx_per_cpu("hrtimer_bases").clock_base[0].active.next
-    (gdb) p *$container_of($next, "struct hrtimer", "node")
+    (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
+    (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
     $5 = {
       node = {
         node = {
-          __rb_parent_color = 18446612133355256072,
-          rb_right = 0x0 <irq_stack_union>,
-          rb_left = 0x0 <irq_stack_union>
+          __rb_parent_color = 18446612686384860673,
+          rb_right = 0xffff888231da8b00,
+          rb_left = 0x0
         },
-        expires = {
-          tv64 = 1835268000000
-        }
+        expires = 1228461000000
       },
-      _softexpires = {
-        tv64 = 1835268000000
-      },
-      function = 0xffffffff81078232 <tick_sched_timer>,
-      base = 0xffff88003fd0d6f0,
-      state = 1,
-      start_pid = 0,
-      start_site = 0xffffffff81055c1f <hrtimer_start_range_ns+20>,
-      start_comm = "swapper/2\000\000\000\000\000\000"
+      _softexpires = 1228461000000,
+      function = 0xffffffff8137ab20 <tick_nohz_handler>,
+      base = 0xffff888231d9b4c0,
+      state = 1 '\001',
+      is_rel = 0 '\000',
+      is_soft = 0 '\000',
+      is_hard = 1 '\001'
     }
 
 
diff --git a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
index 3c133a918f30..282aacd33442 100644
--- a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
@@ -120,35 +120,31 @@ Kgdb内核调试器、QEMU等虚拟机管理程序或基于JTAG的硬件接口
 
 - 对当前或指定的CPU使用per-cpu函数::
 
-    (gdb) p $lx_per_cpu("runqueues").nr_running
+    (gdb) p $lx_per_cpu(runqueues).nr_running
     $3 = 1
-    (gdb) p $lx_per_cpu("runqueues", 2).nr_running
+    (gdb) p $lx_per_cpu(runqueues, 2).nr_running
     $4 = 0
 
 - 使用container_of查看更多hrtimers信息::
 
-    (gdb) set $next = $lx_per_cpu("hrtimer_bases").clock_base[0].active.next
-    (gdb) p *$container_of($next, "struct hrtimer", "node")
+    (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
+    (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
     $5 = {
       node = {
         node = {
-          __rb_parent_color = 18446612133355256072,
-          rb_right = 0x0 <irq_stack_union>,
-          rb_left = 0x0 <irq_stack_union>
+          __rb_parent_color = 18446612686384860673,
+          rb_right = 0xffff888231da8b00,
+          rb_left = 0x0
         },
-        expires = {
-          tv64 = 1835268000000
-        }
+        expires = 1228461000000
       },
-      _softexpires = {
-        tv64 = 1835268000000
-      },
-      function = 0xffffffff81078232 <tick_sched_timer>,
-      base = 0xffff88003fd0d6f0,
-      state = 1,
-      start_pid = 0,
-      start_site = 0xffffffff81055c1f <hrtimer_start_range_ns+20>,
-      start_comm = "swapper/2\000\000\000\000\000\000"
+      _softexpires = 1228461000000,
+      function = 0xffffffff8137ab20 <tick_nohz_handler>,
+      base = 0xffff888231d9b4c0,
+      state = 1 '\001',
+      is_rel = 0 '\000',
+      is_soft = 0 '\000',
+      is_hard = 1 '\001'
     }
 
 
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
index c881e8872b19..b595af59ba78 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
@@ -116,35 +116,31 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
 
 - 對當前或指定的CPU使用per-cpu函數::
 
-    (gdb) p $lx_per_cpu("runqueues").nr_running
+    (gdb) p $lx_per_cpu(runqueues).nr_running
     $3 = 1
-    (gdb) p $lx_per_cpu("runqueues", 2).nr_running
+    (gdb) p $lx_per_cpu(runqueues, 2).nr_running
     $4 = 0
 
 - 使用container_of查看更多hrtimers信息::
 
-    (gdb) set $next = $lx_per_cpu("hrtimer_bases").clock_base[0].active.next
-    (gdb) p *$container_of($next, "struct hrtimer", "node")
+    (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
+    (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
     $5 = {
       node = {
         node = {
-          __rb_parent_color = 18446612133355256072,
-          rb_right = 0x0 <irq_stack_union>,
-          rb_left = 0x0 <irq_stack_union>
+          __rb_parent_color = 18446612686384860673,
+          rb_right = 0xffff888231da8b00,
+          rb_left = 0x0
         },
-        expires = {
-          tv64 = 1835268000000
-        }
+        expires = 1228461000000
       },
-      _softexpires = {
-        tv64 = 1835268000000
-      },
-      function = 0xffffffff81078232 <tick_sched_timer>,
-      base = 0xffff88003fd0d6f0,
-      state = 1,
-      start_pid = 0,
-      start_site = 0xffffffff81055c1f <hrtimer_start_range_ns+20>,
-      start_comm = "swapper/2\000\000\000\000\000\000"
+      _softexpires = 1228461000000,
+      function = 0xffffffff8137ab20 <tick_nohz_handler>,
+      base = 0xffff888231d9b4c0,
+      state = 1 '\001',
+      is_rel = 0 '\000',
+      is_soft = 0 '\000',
+      is_hard = 1 '\001'
     }
 
 
diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index f506965ea759..6edf4ef61636 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -141,7 +141,7 @@ LxCpus()
 class PerCpu(gdb.Function):
     """Return per-cpu variable.
 
-$lx_per_cpu("VAR"[, CPU]): Return the per-cpu variable called VAR for the
+$lx_per_cpu(VAR[, CPU]): Return the per-cpu variable called VAR for the
 given CPU number. If CPU is omitted, the CPU of the current context is used.
 Note that VAR has to be quoted as string."""
 
@@ -158,7 +158,7 @@ PerCpu()
 class PerCpuPtr(gdb.Function):
     """Return per-cpu pointer.
 
-$lx_per_cpu_ptr("VAR"[, CPU]): Return the per-cpu pointer called VAR for the
+$lx_per_cpu_ptr(VAR[, CPU]): Return the per-cpu pointer called VAR for the
 given CPU number. If CPU is omitted, the CPU of the current context is used.
 Note that VAR has to be quoted as string."""
 
-- 
2.47.2

