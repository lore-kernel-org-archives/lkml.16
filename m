Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42C5103F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468026; cv=none; b=nSF6MXxz5d5S3GEfPU4igYKtYk5LTjPqVN13JODu0FzGGTwJmiM/fMng3wYPdZ//J7g0jVERU1U4y4ZiR9X6eESGYX55Ny5g8TCQe9PDpp8Fy8hgqeCIJLj/k3KRgmrg8vkOf1GrUIV+CKdbWAKbIYsoiiCSulKlUix/5Bz9J68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468026; c=relaxed/simple;
	bh=G2S+kADUjNDXPGSvJ2lFXkUK8jl7yc+Lr/8e1wxVTn0=;
	h=To:Cc:Message-ID:From:Subject:Date; b=tspkizMiJ0Eq0Vkl2x1fjx43BOCA0i1+5+MmYxEUEq5DcqnCmtHhXQwnuR9V/gyzwpsT8Qx4uO+0mYRwXWJsqmASXqUyIR34i3eRuJZ6IPM5Xbc80iD5+Xfahr9rjpKKlC2Is/2+PpcARSd2EtfDpDTG1cuDWwK9hdnv5I8tvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IhVgbG6h; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IhVgbG6h"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id CFADC13845BE;
	Mon, 31 Mar 2025 20:40:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 31 Mar 2025 20:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743468021; x=1743554421; bh=Iciseiak7nvInZNQZRPG5m8A9WfB
	Z0Xuz2aSe/2RWgA=; b=IhVgbG6hmqM2YwWCUvejjYBsEkbnATFByylWy8dGh2nv
	3DaRzQ9InLxDfK+AAWir/UdO1G/nIEXDtv3ffVPyie8pB1Xj+EZeXhNeV9iqa26+
	SYm8s2HvCBc4HTGBG4Z6QyhVre3hPTk28etTgq77a+uR3xC/HrWC3LfLwWBbpeFn
	VLF8X+blntvRcUy3+dzZIzEDZsDifVgDJ5BUQTMgDYze9cWZ+vIdgY87Zpn8QYGc
	ZpM0KQYX0rFSrENjTU0AdCrJAEfoW6c/wdDfLXSfR+ip6LyYHoLz6Re5P8Kqg15y
	FyqVJYZbGLzfGWHWXEP0Bv5sqhzZw55e46jC/SS4Qw==
X-ME-Sender: <xms:9DXrZx9ApF1ZgyTvM7CBr2SXRIxf8iFillkI7JK5Twmz2S0TuI58ig>
    <xme:9DXrZ1tDFbchlciW1Dn8VKjtAeNFjaVXP2avtqN-VwDv3MEskvq_C9ph3iJSV6cuO
    FjFNJUYvohnJktP96Q>
X-ME-Received: <xmr:9DXrZ_DH1QeAqYSreN2RY7sRBCRfVMW7IAkajnHH-JFlMf0bj_kVUcHk8VOZQeEmBaosblysF5Wiqzo77sQXT7YVpM6SjGX98wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedufeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepvfevkffhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpefgheduvdegffektdehjeejhfekieelleffgffgjeff
    hfffueefgefhvdevudegtdenucffohhmrghinhephhgvrggurdhssgenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhu
    gidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthho
    pegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehkse
    hlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9DXrZ1ctyx2kcqd6NzNMqZyljqfIrSA3zRsMoEZDryl8AKiEOyVAfQ>
    <xmx:9DXrZ2M8trSyU1sIZqfqqZgX-IJDomnVx3aYt5gofZVFYmjXEYI08g>
    <xmx:9DXrZ3lEA7KH5wByeKB2Jr_rCuGGj4T5aEkAO5mh_z5uzdQYbYKE8w>
    <xmx:9DXrZwtvEjula_5SnJv8LVOK_5FO8fO76Zr5jOR3RvkR7D17KJoJNQ>
    <xmx:9TXrZzpgGOyDwGbDRET18PBL1scHXkwbEBMD07lwEBI9WTZlcsxF4lEW>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 20:40:17 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Daniel Palmer" <daniel@0x0f.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <d1d4328e5aa9a87bd8352529ce62b767731c0530.1743467205.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] m68k/mvme147: Don't unregister boot console needlessly
Date: Tue, 01 Apr 2025 11:26:44 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
generate console output. That will continue to work even after
debug_cons_nputs() becomes unavailable so there's no need to
unregister the boot console.

Take the opportunity to remove a repeated MACH_IS_* test. Use the
actual .write method (instead of a wrapper) and test that pointer
instead. This means adding an unused parameter to debug_cons_nputs() for
consistency with the struct console API.

early_printk.c is only built when CONFIG_EARLY_PRINTK=y. As of late,
head.S is only built when CONFIG_MMU_MOTOROLA=y. So let the former symbol
depend on the latter, to obviate some ifdef conditionals.

Cc: Daniel Palmer <daniel@0x0f.com>
Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/Kconfig.debug         |  2 +-
 arch/m68k/kernel/early_printk.c | 33 ++++++++++-----------------------
 arch/m68k/kernel/head.S         |  8 ++++----
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 30638a6e8edc..d036f903864c 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -10,7 +10,7 @@ config BOOTPARAM_STRING
 
 config EARLY_PRINTK
 	bool "Early printk"
-	depends on !(SUN3 || M68000 || COLDFIRE)
+	depends on MMU_MOTOROLA
 	help
 	  Write kernel log output directly to a serial port.
 	  Where implemented, output goes to the framebuffer as well.
diff --git a/arch/m68k/kernel/early_printk.c b/arch/m68k/kernel/early_printk.c
index f11ef9f1f56f..1f85517fbc0d 100644
--- a/arch/m68k/kernel/early_printk.c
+++ b/arch/m68k/kernel/early_printk.c
@@ -16,25 +16,10 @@
 #include "../mvme147/mvme147.h"
 #include "../mvme16x/mvme16x.h"
 
-asmlinkage void __init debug_cons_nputs(const char *s, unsigned n);
-
-static void __ref debug_cons_write(struct console *c,
-				   const char *s, unsigned n)
-{
-#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
-      defined(CONFIG_COLDFIRE))
-	if (MACH_IS_MVME147)
-		mvme147_scc_write(c, s, n);
-	else if (MACH_IS_MVME16x)
-		mvme16x_cons_write(c, s, n);
-	else
-		debug_cons_nputs(s, n);
-#endif
-}
+asmlinkage void __init debug_cons_nputs(struct console *c, const char *s, unsigned int n);
 
 static struct console early_console_instance = {
 	.name  = "debug",
-	.write = debug_cons_write,
 	.flags = CON_PRINTBUFFER | CON_BOOT,
 	.index = -1
 };
@@ -44,6 +29,12 @@ static int __init setup_early_printk(char *buf)
 	if (early_console || buf)
 		return 0;
 
+	if (MACH_IS_MVME147)
+		early_console_instance.write = mvme147_scc_write;
+	else if (MACH_IS_MVME16x)
+		early_console_instance.write = mvme16x_cons_write;
+	else
+		early_console_instance.write = debug_cons_nputs;
 	early_console = &early_console_instance;
 	register_console(early_console);
 
@@ -55,16 +46,12 @@ early_param("earlyprintk", setup_early_printk);
  * debug_cons_nputs() defined in arch/m68k/kernel/head.S cannot be called
  * after init sections are discarded (for platforms that use it).
  */
-#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
-      defined(CONFIG_COLDFIRE))
 
 static int __init unregister_early_console(void)
 {
-	if (!early_console || MACH_IS_MVME16x)
-		return 0;
+	if (early_console && early_console->write == debug_cons_nputs)
+		return unregister_console(early_console);
 
-	return unregister_console(early_console);
+	return 0;
 }
 late_initcall(unregister_early_console);
-
-#endif
diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 6465333d5f7c..2e4ef0358887 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -3263,8 +3263,8 @@ func_return	putn
  *	turns around and calls the internal routines.  This routine
  *	is used by the boot console.
  *
- *	The calling parameters are:
- *		void debug_cons_nputs(const char *str, unsigned length)
+ *	The function signature is -
+ *		void debug_cons_nputs(struct console *c, const char *s, unsigned int n)
  *
  *	This routine does NOT understand variable arguments only
  *	simple strings!
@@ -3273,8 +3273,8 @@ ENTRY(debug_cons_nputs)
 	moveml	%d0/%d1/%a0,%sp@-
 	movew	%sr,%sp@-
 	ori	#0x0700,%sr
-	movel	%sp@(18),%a0		/* fetch parameter */
-	movel	%sp@(22),%d1		/* fetch parameter */
+	movel	%sp@(22),%a0		/* char *s */
+	movel	%sp@(26),%d1		/* unsigned int n */
 	jra	2f
 1:
 #ifdef CONSOLE_DEBUG
-- 
2.45.3

