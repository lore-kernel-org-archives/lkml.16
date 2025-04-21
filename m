Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE4F1EEA3B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261584; cv=none; b=g0/pvmK4C0OaCvd7WnbwwphWMCST2HyU7v28nEcsB5gx6dorD2n8IktBNWGh3mdOEaR71Jin1x6iovIHZDDq7KXYlSSla6oFV62KW/Yz/J5rXqkNEnv5iSrLpSPme8cF+iv93TUgYxE0Tppw6stNACeQRcavBwRqzIBlMwgAPZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261584; c=relaxed/simple;
	bh=LP2D+HLFeAICx5kFnVqbT4i5U0kN48Tpqo6HL2ellsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhg5vdmC+LGBMPTAm+KW494W2fZV9H3+uys5n1SXSwM1zfGZ+ABSes3Fq6g1qFYNSKIqF7vJLvD4A5ctqKo7n3Ps7Vmy+3rgKYhVHojRwBOgI0+U5NDQ93lQ1v/G+XYpugdpoejPRQ4kstkk8uXdyRaUkDDUOSEGGK1W8cC3ALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/UWrYX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/UWrYX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28487C4CEE4;
	Mon, 21 Apr 2025 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261583;
	bh=LP2D+HLFeAICx5kFnVqbT4i5U0kN48Tpqo6HL2ellsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o/UWrYX8O5Tw00G+NW3i3tWs3FBC6kDp3eSdUyqV/Oe0NG2r6gzCJYJwzVNR7VBOT
	 l5A1ZLJzxgCqo0f8xuEbrDBjJgU7dFNbAlM5qhXzz1u+OeJNGGeVhg16GJWEoQ+eES
	 d3GcmRbD3awrHRiqUqxyOAJv5haj9EVAoSWITh2Ngv3MLEWr3MJO/VCPArOl2oqczq
	 YxPicD1PWTKbPs/2OsdiA7lEDZx2ospqR26Kmhy1t43ogkS7a2v8LZc7fnG0aA2VU3
	 c2GNklfG8SDdQBKpHLjFRmLh8VNrMtiqHHNon+K/AYhjb0kQ02G/Bd5loDqQxTvzB0
	 r5f4/0/1uFYIg==
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
Subject: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Date: Mon, 21 Apr 2025 20:51:45 +0200
Message-ID: <20250421185210.3372306-6-mingo@kernel.org>
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

Gaps in the E820 table are not obvious at a glance and can
easily be overlooked.

Print out gaps in the E820 table:

Before:

	BIOS-provided physical RAM map:
	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
After:

	BIOS-provided physical RAM map:
	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]
	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]
	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff]
	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]
	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]
	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff]
	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved

Also warn about badly ordered E820 table entries:

	BUG: out of order E820 entry!

( this is printed before the entry is printed, so there's no need to
  print any additional data with the warning. )

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 4244b6d53fd0..a8edfa375fbd 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -201,18 +201,32 @@ static void __init e820_print_type(enum e820_type type)
 
 static void __init e820__print_table(const char *who)
 {
+	u64 range_end_prev = 0;
 	int i;
 
 	for (i = 0; i < e820_table->nr_entries; i++) {
 		struct e820_entry *entry = e820_table->entries + i;
+		u64 range_start, range_end;
 
-		pr_info("%s: [mem %#018Lx-%#018Lx] ",
-			who,
-			entry->addr,
-			entry->addr + entry->size-1);
+		range_start = entry->addr;
+		range_end   = entry->addr + entry->size;
 
+		/* Out of order E820 maps should not happen: */
+		if (range_start < range_end_prev)
+			pr_info("BUG: out of order E820 entry!\n");
+
+		if (range_start > range_end_prev) {
+			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
+				who,
+				range_end_prev,
+				range_start-1);
+		}
+
+		pr_info("%s: [mem %#018Lx-%#018Lx] ", who, range_start, range_end-1);
 		e820_print_type(entry->type);
 		pr_cont("\n");
+
+		range_end_prev = range_end;
 	}
 }
 
-- 
2.45.2

