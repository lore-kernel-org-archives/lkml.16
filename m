Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C7299934
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310796; cv=none; b=Tdf5cCgs+lDwQs7DiaSOxru+Qw5QYwN6nDSoQDYpwq0qR+m/Xx3bC9PrcrF1RHS6kRmnHT7NWmovYMqN/HrJoqNXSuMENXhpqm6pwDQlDztJneWWgYgiknFiUchQ/uCoYenInDESNvRcLmrfPxV5KxoqevN1V5uF+5bQJkqFYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310796; c=relaxed/simple;
	bh=zlz2LW2psILmMeSA56Usw5WtFYzlc2S3xQ0OTXXfHQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNmFhTS6EJRLBJIkW4NzcQg0CDBFIfr2y65h+ULkL8r+B+rBteQy2IGnU/NG4HShLXsM+tuMQveeDDbZRGfoiUlsngobJF3raIldTBHaq2SIUSIkTMz2jUyeJljgz969KARZf6Syi9x5+tsNC+ddrs6PCMQoE8ehjD5D5in/wFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/VRUt1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/VRUt1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E12C4CEE7;
	Thu, 15 May 2025 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310794;
	bh=zlz2LW2psILmMeSA56Usw5WtFYzlc2S3xQ0OTXXfHQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/VRUt1r8NKxyYNJq97M8HdR5MSwiBdm39AHEGwF6hIIykV5/WfEeLov4RZKMTBeM
	 S2byg+UGFgfOHjpjkTOdU02JMhTi6jKB0SG13WPRklPlIfKilLrqDL++I3OK0/ViKb
	 iXSzZ7B8OnOAY9XQWHq8A9CePIi4mEQmTlfT7qLqj/ME6r1nBxOyOrajYCErnLNZBO
	 Imwjp6LKIje//fqQ2MED96FMV57/sIiVWpVcQIPJOJRYFseItMDoO0IpfYdtPNvYku
	 XAVHENkVlz3MLabgUAp45W+lsc9CfUMAt3PyrgP/Osi+6DDjAtU4nlvojupfjua6xT
	 JMEbKHH6FuEww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 11/32] x86/boot/e820: Remove pointless early_panic() indirection
Date: Thu, 15 May 2025 14:05:27 +0200
Message-ID: <20250515120549.2820541-12-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
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
index ba957f2ef210..5eb0849b492f 100644
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

