Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4D1F03D9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261598; cv=none; b=tq4slNbv1TIAHLw/5K9dRvdBnE0h9OWIGieI7xmwcyVaWAyhiP/bD9K6/W8maqHWTTr4pCKMhfkbc4tdtcZTwIq8qNl67pjjUYzrVKpe1ROslkhiS0vlQpFym0vLU47KmtDAJGzMg8ZSR53z36H654XvIGhArkHsU91bqQWFZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261598; c=relaxed/simple;
	bh=GoqoUKEOL5IUWnXmEDfw86Ld9dJCSES2ioFEM/HLjOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMiI4sTdbYRxmxWWQnQ2JltsUB0kKdTPZw1DBbBGdgsaM8A2gF+ao+CaVLHE1GrXKwEK9y6Mnao/VXdhq5ip8oAKB9L5LppPrFsxI7Lc9zsxorZGH9jEXtxjHcSvNFnJCuzh/77MfkzeF8c+nNLe+6wpD+lLVZwPlyhqGu/QCYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Voh5ewVl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Voh5ewVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5515FC4CEEF;
	Mon, 21 Apr 2025 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261597;
	bh=GoqoUKEOL5IUWnXmEDfw86Ld9dJCSES2ioFEM/HLjOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Voh5ewVlaFS1w/yX0iZogeIJHOQjg8klS3jZ9ynZIRhKBGKcQTxqtiDxO3Ewpzfv1
	 dv5wgTxe+xkrUtDyI7ZuOqWoldBEjr7hfIsRbZlxUbA55/oIReFcSc6/BonCdNFHh+
	 HyI3uHQjXW+OLXd+9p3XTYKEPEk+xQvu7v5oohWGL9RI567l7gqY04RiFiLaRFaBpz
	 1XdrqWhlep9CGVFVapSU9PFniyGPpkQqNH6HjU31nmTPMc4uZYqJG84qFuFxDVDTJj
	 0PIHqI6HSObKy25li4hWbb79bhJvQf1/wggP3Ex4sEP1w1nX36434Rg5PJB/gkIiaH
	 QBv7sNC6WeHBw==
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
Subject: [PATCH 10/29] x86/boot/e820: Use 'u64' consistently instead of 'unsigned long long'
Date: Mon, 21 Apr 2025 20:51:50 +0200
Message-ID: <20250421185210.3372306-11-mingo@kernel.org>
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

There's a number of structure fields and local variables related
to E820 entry physical addresses that are defined as 'unsigned long long',
but then are compared to u64 fields.

Make the types all consistently u64.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 3eab0908ca71..7d100e653554 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -338,7 +338,7 @@ struct change_member {
 	/* Pointer to the original entry: */
 	struct e820_entry	*entry;
 	/* Address for this change point: */
-	unsigned long long	addr;
+	u64			addr;
 };
 
 static struct change_member	change_point_list[2*E820_MAX_ENTRIES]	__initdata;
@@ -386,7 +386,7 @@ int __init e820__update_table(struct e820_table *table)
 	struct e820_entry *entries = table->entries;
 	u32 max_nr_entries = ARRAY_SIZE(table->entries);
 	enum e820_type current_type, last_type;
-	unsigned long long last_addr;
+	u64 last_addr;
 	u32 new_nr_entries, overlap_entries;
 	u32 i, chg_idx, chg_nr;
 
@@ -683,13 +683,13 @@ static void __init e820__update_table_kexec(void)
  */
 static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsize)
 {
-	unsigned long long last = MAX_GAP_END;
+	u64 last = MAX_GAP_END;
 	int i = e820_table->nr_entries;
 	int found = 0;
 
 	while (--i >= 0) {
-		unsigned long long start = e820_table->entries[i].addr;
-		unsigned long long end = start + e820_table->entries[i].size;
+		u64 start = e820_table->entries[i].addr;
+		u64 end = start + e820_table->entries[i].size;
 
 		/*
 		 * Since "last" is at most 4GB, we know we'll
-- 
2.45.2

