Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B425394C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633747; cv=none; b=F9qyxdrNQZlJbFNbiPi2RltmP683IR4mYJ6t4raetThdNf1tMlqNfeR1orCaTpV6S3nTJZL4flxubOQ7SRItR2SPiX+cMAkV5W5GkQbbN+Yu7DwWtFH8gHoA7dpDv/HEzNFI3ItMCMKRGwV7+GjI9Pa2J8OW4XOeQOYY4rvsXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633747; c=relaxed/simple;
	bh=OzIhnUie/Ctxfm+QEMkyUANhfsCLwQddvZkNgATaxKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYFrwO68G0T7KIUkFwe0bHweRuWAI9AjmyaQoCeODvwcuN40hRXKnB/4iKmPxishFFXxCABY91VZvrrPEBt7cDMCFIWJ+IDkSXerhhoB1t4KvvP0Q2NvF3BOFBFCylqxA1GyhqT/P+YG4FiHuwvVYvdKKs6r+xjHsBBiOKwaX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ozsJbD3Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zQIT3kbf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ozsJbD3Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zQIT3kbf"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HNZsp0JlEkXQwt3qtPmvEy68Xqh0vFAuSqvlPQb0tk=;
	b=ozsJbD3ZX1b1TkGONklwnRC0Ny/GSAJX3OYVI2fzjIY09e9Qll0amtsZ9Xjm8U1SjSQy7I
	gOKqJ/zoKv4EjJgrFsJQ64y4n256ijE1hDSKDqxEXZmbAXTVU/pUt4TNXWew1aJ3p155IN
	/9Xl5Qmo6F2LcYDF2fI5w+3WzRpOYDCKlbmjaC4Lhrl3FuZMbTuXGuftDMJR6DIl0ErsuC
	Fg0HI3rpR37M1bhnLWifsYAguK2vPpQGZ94K93n7e7gCTA4xbgVoREGrzONkF0ZoNAAsJZ
	qIzSYy4j6l6mf06OI6YpzYD+4o23q/yN5V0mrupshSzA9a109J3BDcwUfZzznA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HNZsp0JlEkXQwt3qtPmvEy68Xqh0vFAuSqvlPQb0tk=;
	b=zQIT3kbfh9XJgCN+qaxlUHW7+ex3ON7H/WPvvQYs1eD7SwosJIekGb6djwQYLbfgUwzAou
	RM9OkwLNLwiFfuBg==
Date: Wed, 11 Jun 2025 11:22:12 +0200
Subject: [PATCH v3 1/3] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1184;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OzIhnUie/Ctxfm+QEMkyUANhfsCLwQddvZkNgATaxKY=;
 b=SugqQlUcXcgVYUV2XtDiRrHWg6Doywxp9o305XEyBXMEA9Un62vvg09cf86xsaWlEwuAbkgFS
 LdMCSp/k8ELAG8PmZTTud1hV41V8Jio68n3rixW1dpWRLbEL1HwCdhO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO objects need the same treatment.
To make changes to both the list of objects and the list of removed flags
easier, introduce a helper variable.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/kernel/vdso/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9ebb5e590f93a3228c451dca58e6d5cfbbc03ff7..c19c3c76f7c9f6b2f7523a59269de3b683656323 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -49,9 +49,10 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
 endif
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
-CFLAGS_REMOVE_getrandom.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
-CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
+CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
+CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
 
 # Force dependency
 $(obj)/vdso.o: $(obj)/vdso.so

-- 
2.49.0

