Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168529A9F5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310791; cv=none; b=S86vr3NOeX9YRfA4ezzuRcsqx1kDoNLALFnqrS+c1KRvVEKS/ULZkIK45cqKtH8XjbG3h/OrNBK/IVj/7IuDkWGQFBCzteiuvTt3Xyne1MgKhfq6hFBmyisX4B3Nf3duu7xFwfbgC/uRNLav2LXYYi3FHhFhSMxJ6jT1w9s21Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310791; c=relaxed/simple;
	bh=W1E1N3ZODGKITdBep/9WVCTUKzob6ru3/jorkoGAU/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHugTkmwbJouk3djec+9IihPsvbL3BTwq0TLnnZUME6RnXtw9fcqv/olCS+XrtcYzspoOzz/VL3Gux+nOIOjFE2H6TV544iMOySTB5AX2kYCPZgOu+4Lnpp5IS/o6GPNGjWiUJb4nj1ei2PKoL8pY9eLELPE54oXG3VUApMrLDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNZsgyr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNZsgyr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BE5C4CEE9;
	Thu, 15 May 2025 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310790;
	bh=W1E1N3ZODGKITdBep/9WVCTUKzob6ru3/jorkoGAU/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNZsgyr6+8NKQr+i9Rq/F5Oir1Eb4Y5dM08ToizdoSjba8nAwPDGgj2MBfnInRmgz
	 y6CIdSbb/eNu7G0FQx+dIE7xwRteTGnH0TULAxi0XHuSp4b/Y7/ZtuFSpapoKtKC5P
	 QSCl2+AfSdQ36Z2RqgQDV0PqehHf4lvwmTbjIVwaqY17rvQQ4zEgHl4N8krLLOVk93
	 89arT/MVgJtIg4egPRn/Z420oh57gVbado8iKEdsOqfP0yUoEw8VzdTUVx4iwCeRl+
	 FkKLRr/IV+S4QmYQ+ZaMlcLIuGebh+vEhT1tIDQgB6zulSqfaL8gHwB3v0Cta73e42
	 rnf8nUPLt3enQ==
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
Subject: [PATCH 10/32] x86/boot/e820: Use 'u64' consistently instead of 'unsigned long long'
Date: Thu, 15 May 2025 14:05:26 +0200
Message-ID: <20250515120549.2820541-11-mingo@kernel.org>
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
index d85623c9ee1b..ba957f2ef210 100644
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

