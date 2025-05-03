Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C5421E092
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275598; cv=none; b=lbuIYJuCMG6s9XyR8P+pD728JgBdxB/7OUYPNICeIC8aSwoQC6M4v77Kj6Cuk4tePWWq/5ffLMX7n8hR6Z2snRCzTuJ+zDsEmqYiF9NY2MGBSNmusW7gxd1FvNI190zH3oC+Szlu/1D/cudKuJdVcd4ztAqOyBZGIkB+mjtV1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275598; c=relaxed/simple;
	bh=lJNyUkEpl4POw7D78aLfLgI0cVslgX0RSwoBn58qELs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VP465INdjRLphQj3ieNUgnWb+cuH4/qhC/H8e9gWcOC2lGMDTXP4ikkWT6OEp6G5dRjft/kKS/2H6kn+8jopLvHWxhbg0ClGUpiKwgYOLGnaajSSxjINa/A9gEczhPY9zc1+FmiTsLfZz534dn3UJ+hCSBaAdCHRPSzcZuDVmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=hvxV69iN; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="hvxV69iN"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id D8D8517F885
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:33:08 +0200 (CEST)
Received: (qmail 32661 invoked by uid 988); 3 May 2025 12:33:08 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 03 May 2025 14:33:08 +0200
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
Subject: [PATCH 1/2] scripts/gdb: Fix kgdb probing on single-core systems
Date: Sat,  3 May 2025 14:32:31 +0200
Message-ID: <20250503123234.2407184-2-illia@yshyn.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503123234.2407184-1-illia@yshyn.com>
References: <20250503123234.2407184-1-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.59353) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.19353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=lJNyUkEpl4POw7D78aLfLgI0cVslgX0RSwoBn58qELs=;
	b=hvxV69iNPEfMHUjYq+0ZrmNQ/UWATeFZ0JGd/zsH1UbJOhMxWyogj9ZlkaZB5wYyx7hjJ5/2hd
	T8hTZJ5L413f5zCdcXF/g8n2E7pN1NVlvpx0HAE3O4ZzNcKi7TiQSyQcsCwehXFFcKueWasKr736
	DD2ifC0qK6Tkc9NpgQY0lV35KpLygbQkH6vmxNCXknVkmAhsnGVlZ1yZtF7MMyJeCxHpdCliaNvN
	M0YGNDceaZGK1Pp7m5a4JeIksfGpATKoqpDbckLbUluhCi9BIXwdmE+E5vRcnnDoFPNzrBCDGP6n
	NcWFJ0glK6Sm8ecqc7EgUIzuok9c6RVYqq9GDuhQ==

When requested the list of threads via qfThreadInfo, gdb_cmd_query in
kernel/debug/gdbstub.c first returns "shadow" threads for CPUs followed
by the actual tasks in the system.  Extended qThreadExtraInfo queries
yield "shadowCPU%d" as the name for the CPU core threads.

This behavior is used by get_gdbserver_type() to probe for KGDB by
matching the name for the thread 2 against "shadowCPU".  This breaks
down on single-core systems, where thread 2 is the first nonshadow
thread.  Request the name for thread 1 instead.

As GDB assigns thread IDs in the order of their appearance, it is safe
to assume shadowCPU0 at ID 1 as long as CPU0 is not hotplugged.

Before:

(gdb) info threads
  Id   Target Id                      Frame
  1    Thread 4294967294 (shadowCPU0) kgdb_breakpoint ()
* 2    Thread 1 (swapper/0)           kgdb_breakpoint ()
  3    Thread 2 (kthreadd)            0x0000000000000000 in ?? ()
  ...
(gdb) p $lx_current().comm
Sorry, obtaining the current CPU is not yet supported with this gdb server.

After:

(gdb) info threads
  Id   Target Id                      Frame
  1    Thread 4294967294 (shadowCPU0) kgdb_breakpoint ()
* 2    Thread 1 (swapper/0)           kgdb_breakpoint ()
  3    Thread 2 (kthreadd)            0x0000000000000000 in ?? ()
  ...
(gdb) p $lx_current().comm
$1 = "swapper/0\000\000\000\000\000\000"

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 scripts/gdb/linux/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index 03ebdccf5f69..877404e92dbb 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -200,7 +200,7 @@ def get_gdbserver_type():
 
     def probe_kgdb():
         try:
-            thread_info = gdb.execute("info thread 2", to_string=True)
+            thread_info = gdb.execute("info thread 1", to_string=True)
             return "shadowCPU" in thread_info
         except gdb.error:
             return False
-- 
2.47.2

