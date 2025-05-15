Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5703298C1C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310773; cv=none; b=u7HGaxmOmwBtV6eAhWEGWVCk6SNwmTK2Hi8TElig6jJ8CigT2LvPKq5DHTAFpo/iBQ7QLhatTy4xW69p7WQaKth4uTPAH5oA3PAFppE2zwUOTvGz2564cN8OvMQgFwQoHE6WXlXvYJ82Bn2bGq8wJiWuLzNJBLzapJEpOGCGXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310773; c=relaxed/simple;
	bh=qnej4L0lOeFTPoLPsMDFf5FZ9eFt0NnAXBwokH8CudI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+EIxOQh2ZOljUEAaj0/W8hO5Va1eRNcNp9kIjTUXI7q1wvoF2l+HhXg0jREkJBb+i+D39SrlJMSMEsCL+T+AEubblt255r0El1HkPPJY0k46vfNfac57R606AyhEmGF4EfgcVe0vtdarfG7LWgHOoIOsApGTGGIPvshX1ppcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUDrUmdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUDrUmdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84218C4CEE7;
	Thu, 15 May 2025 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310773;
	bh=qnej4L0lOeFTPoLPsMDFf5FZ9eFt0NnAXBwokH8CudI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUDrUmdGi+3nQHO3It5Jg402UI467svRLFyr/oTJC1UvI2UEqCeJNx2B+tq19KtCd
	 4YShu35kbxz3d60eRn8Hl2MqrRqWwE1Xqia/W6Ol5uKjwNQdzM30Hl+PV2uBkNtz/n
	 w6jTFwBkI/Z3RB/uEZnmYq+9xxaef0sQXHQKF+XctCdJPaCsrwtDkrWmY7KvNlkmSe
	 Vs5weUnb0u2TeWQdQ/Bfh0gYsoZWVU7q/tj+qi+rkaGtPhOnzRxJSKn5D7GMbrUcrC
	 boINDmg/oSlG8rij77yUu3dg1PRXcmzkxZl40adoSGseetaQ2jx6VI4hsE5xJJJmZe
	 u5bRc3DWDdJ1w==
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
Subject: [PATCH 05/32] x86/boot/e820: Print gaps in the E820 table
Date: Thu, 15 May 2025 14:05:21 +0200
Message-ID: <20250515120549.2820541-6-mingo@kernel.org>
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
index c7911d2054fe..c8833ac9cbf9 100644
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
+			pr_info(FW_BUG "out of order E820 entry!\n");
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

