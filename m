Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5DD29AB15
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310801; cv=none; b=ai/9nDlEMniqA8qcGFFeUv8HTnaYVOGGlUGdcDiYX7Y8C7oJ53inGZ595EOm7VEc74Q6LvKxX/aO1QWvt5gb5g7tA8LmzMvtImaP5rVuFXLRLmkGJjo5RG2NmrwRou7mw84bKutgRgl6I7opQxeZj04VYweFTlDAZR9lp0deJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310801; c=relaxed/simple;
	bh=ouXUvj0RiTmifto5Z9N/f7U2etYpf1iuNLM8tYM3QuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WipHHGr2fcNVkkpvYN8Gy7cxwhPgb28jeAcW43IIrwxOBDXg3haAUw7MLaZqHwbUQMTq7fm9DBY7Ge3M0dp3U3pNmpp44ptCIZuYQz93B6Pte7RDNge5Za1nkTCU10Lg8zhOYaKZgAgfDcWWNNZADNEsEoyR0JaXmxRZeGXsjkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEw//Dqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEw//Dqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6447EC4CEE9;
	Thu, 15 May 2025 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310801;
	bh=ouXUvj0RiTmifto5Z9N/f7U2etYpf1iuNLM8tYM3QuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EEw//DqwMN9FLl5VqZqXRxe1kUlc4nj6oQchfDA4VYn1MmXrQLZkNrdOYTPhOaLxZ
	 FI6r5JVxALwHX8z+D4oxP5aHbM6EQYSDEAmBDxrN6zaJAyxq4ZZGbL5N9uG3Gca/s6
	 DO4Ayk3op4tGHkHVUk0xpwLR6ONu77OMeGKf+3aVzjW2D/Q9QXiXM5Q6dnFrPlXXRR
	 OHBEaM+V83fCg9e3K2WktOJr/vwl0zjEZJWEkwuINp21hbq+du4FZIIzDunv4s2jGo
	 BNMKJugZNzh8Ody2lWTIpeCNPuftrQ2bX8bmSGEhtxa2/nFX3q2hwHLAPYpchfld1C
	 Rjq383IH7C4fg==
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
Subject: [PATCH 13/32] x86/boot/e820: Improve e820_print_type() messages
Date: Thu, 15 May 2025 14:05:29 +0200
Message-ID: <20250515120549.2820541-14-mingo@kernel.org>
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

For E820_TYPE_RESERVED, print:

  'reserved'  -> 'device reserved'

For E820_TYPE_PRAM and E820_TYPE_PMEM:

  'persistent' -> 'persistent RAM'

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index c9bb808c4888..6cb1e23dfc89 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,15 +187,15 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" System RAM");			break;
-	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
-	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
-	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
-	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");			break;
-	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");			break;
+	case E820_TYPE_RAM:		pr_cont(" System RAM");				break;
+	case E820_TYPE_RESERVED:	pr_cont(" device reserved");			break;
+	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");			break;
+	case E820_TYPE_ACPI:		pr_cont(" ACPI data");				break;
+	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");				break;
+	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");				break;
 	case E820_TYPE_PMEM:		/* Fall through: */
-	case E820_TYPE_PRAM:		pr_cont(" persistent (type %u)", type);	break;
-	default:			pr_cont(" type %u", type);		break;
+	case E820_TYPE_PRAM:		pr_cont(" persistent RAM (type %u)", type);	break;
+	default:			pr_cont(" type %u", type);			break;
 	}
 }
 
-- 
2.45.2

