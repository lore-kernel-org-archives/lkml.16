Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDA1F09AC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261601; cv=none; b=MhLkov7Sc8SPMzryOt+vOI+EvrCj5/ERf4ruqfp+yCr8P34e/invDw1xGLhLrPkaJaqC1zK5OkYckivI5hCYG9psx0heHpog6f3Y4m0zibpAh6CWQihhDnQCSOOs/wZTjUK/q++RYr910ssP5D3R9z/bKfPQQ5BNVNw80S8uhBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261601; c=relaxed/simple;
	bh=/yo+hTFhPqTBW5TtbJV/pbX5P9QGqDQIM5lkxby/Kxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGAF2XhRaB0jHYxXckyXldb9jR/JDS0Wx4Lc/RfAYdJ95aOLqm7yphQuxlUI7hKLRvhpBOvu/FBSAH6/nIvdohzNVRjF9rqQwLKUOxj8UwDT5IK6ZbaBJUY7nn4HIEkWPFg4KI+qufdqkKKBKgBvYUMH0px8b8bGv7B16LCsPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPAy/Teb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPAy/Teb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29205C4CEEB;
	Mon, 21 Apr 2025 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261600;
	bh=/yo+hTFhPqTBW5TtbJV/pbX5P9QGqDQIM5lkxby/Kxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPAy/Teb75tONTMAsi6A0lE2CnftXwiW+sCIo16ZNS9mEvYXAHMHeTOe3jl7B3eQ1
	 pp2/hPig5V//OWRaqMMc9IBNUjdsLW/lHmhSLfwNtCz0W53fFuPRTBhrm82oYXto8f
	 qeiiKi38cjo1VfwPcp95cMsr1PLeYnU+MK+pEiA4V91vZKcF3Ygps5neqOjavk9UbG
	 fz0564wAlatqt+ONgfjTr6IVZdiXvhU3Gs7GfwhO5b9oSLgtayELOFVltufz5oPprq
	 ff4iIdyK1zJbzYtpmOCZSxBnNYcPoxIjnif34JIRt38gmjzqajA3Nb51ZZzDf0BwfQ
	 1nZ2/XOlrB6GQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 11/29] x86/boot/e820: Remove pointless early_panic() indirection
Date: Mon, 21 Apr 2025 20:51:51 +0200
Message-ID: <20250421185210.3372306-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_panic() is a pointless wrapper around panic():

	static void __init early_panic(char *msg)
	{
		early_printk(msg);
		panic(msg);
	}

panic() will already do a printk() of 'msg', and an early_printk() if
earlyprintk is enabled. There's no need to print it separately.

Remove the function.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 7d100e653554..8fcf4edd832e 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -935,12 +935,6 @@ unsigned long __init e820__end_of_low_ram_pfn(void)
 	return e820__end_ram_pfn(1UL << (32 - PAGE_SHIFT));
 }
 
-static void __init early_panic(char *msg)
-{
-	early_printk(msg);
-	panic(msg);
-}
-
 static int userdef __initdata;
 
 /* The "mem=nopentium" boot option disables 4MB page tables on 32-bit kernels: */
@@ -1060,7 +1054,7 @@ void __init e820__finish_early_params(void)
 {
 	if (userdef) {
 		if (e820__update_table(e820_table) < 0)
-			early_panic("Invalid user supplied memory map");
+			panic("Invalid user supplied memory map");
 
 		pr_info("user-defined physical RAM map:\n");
 		e820__print_table("user");
-- 
2.45.2

