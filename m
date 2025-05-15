Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95889298C18
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310771; cv=none; b=AytkQL8y9uDGbix9c8MSXlQE0+1WlJ+S5dhiLE/TLUMs+sT9z28l8MVVg/wpbRmlQsx7cdIEt7hR0ImeVq0aFONOx+h9A/YcgImx28yR2qVYXjxiPptHpSX20hCLLHInG7Zju9IooFAuzKVxjdCuV4R4J2a30zsvzOHSGAevdXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310771; c=relaxed/simple;
	bh=upyXvboQNP6OB56g1KHwVmRbpdgsLNWFMyyDrRGxVQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAmfe+b3id0ibCHXKdZkuecR2Qx0vYbMJZGqEyjMXVu4J0fCG3FGWEo2B/EaZqUsbmc0sFRq7e73irtUXvddlJc+tSvH1ouTOxBSND73rbZIkrvsbPx8eWP34HSP/eqxyIowszCxXoJQHPLWK1ugn6QzYhSoVudp6+tgJdwZylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYY2yZFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYY2yZFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3DCC4CEE9;
	Thu, 15 May 2025 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310770;
	bh=upyXvboQNP6OB56g1KHwVmRbpdgsLNWFMyyDrRGxVQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bYY2yZFzCIf0imNVcs41i5EMC/EKWFJJKYqo4VCtnKWPDMIUd1QaGd2KjeqIEFs0Q
	 4ITC7CmdWGBZVtT6rnN84ryD3rifLPGOvO4Y7Nmsmk7UvMW+PsKQLtPGYyTZIT4Y7g
	 7lG58Dn6HPwPTZBC0uzDslgwHa/xHDLI0fImh/9sZ69iaKUW1el2si4SsopbusV7ST
	 7kBbvx81h/F+YU3ij7ugDp+63CyGaiurmR/VFQXWvYfmRKFbuNzsdSbnw2X8qVfFiH
	 /di0EeVPiIS7+aAg8JIl3rlB3w19lEfmhFcERF2drmsomi7BxUYVxdv9oUYVcz7wE7
	 RkoqrZVc1FoYg==
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
Subject: [PATCH 04/32] x86/boot/e820: Mark e820__print_table() static
Date: Thu, 15 May 2025 14:05:20 +0200
Message-ID: <20250515120549.2820541-5-mingo@kernel.org>
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

There are no external users of this function left.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/api.h | 1 -
 arch/x86/kernel/e820.c          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index c83645d5b2a8..54427b77bc19 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -19,7 +19,6 @@ extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enu
 extern u64  e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
 extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
 
-extern void e820__print_table(char *who);
 extern int  e820__update_table(struct e820_table *table);
 extern void e820__update_table_print(void);
 
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 904925159560..c7911d2054fe 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -199,7 +199,7 @@ static void __init e820_print_type(enum e820_type type)
 	}
 }
 
-void __init e820__print_table(char *who)
+static void __init e820__print_table(const char *who)
 {
 	int i;
 
-- 
2.45.2

