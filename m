Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321529A311
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310847; cv=none; b=RuYcc8kCSre6lDEIj8Ud0ngSO5RqQz6+REk/I70LMryTxUKuWEOuSiqVAD4/9ULGUkQ435QYRP68N7hIGUCuZIlsPh8Bly9oEH2uqyhWP/f0AIx86a6ODX3+G5Ou90X8NPBxroADbwof5TFNBiLPHG8GA2g65ZEoFG+t+iDqwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310847; c=relaxed/simple;
	bh=RpiPBoEFrgVjyePw9jzNJG3wRbbb0PIjPyOlwIFuRd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCawVLzmH6ulzl4ZelvvwbGhTN7sOYTlrlGdymw8ccdXyhnEnvIzDCgcBPl/fE2PQRbBlKO/Q7DTR8XcZNSyU5N19yF91UaHAd1/S0UoNBfIlSOZT7I5NiCS9mV/R0oi2eXW9LcnngubpDAPaTFSpImw3/toUyANh4F7EukdyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIR8RAPs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIR8RAPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34F3C4CEE7;
	Thu, 15 May 2025 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310846;
	bh=RpiPBoEFrgVjyePw9jzNJG3wRbbb0PIjPyOlwIFuRd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIR8RAPsRAuwPe+4Hp0cQ5p+4RIA1YWkH+D/94WIb9noEaOYYVx235Y+EF087c4M+
	 35tEkG0ZbRBkKWkp544N0GQKEeguJnFRDFfAynjrWKbPwTYy2Yk3YA4FTTA7BNXj0K
	 5nYHayJlKWpAdFqxQiTzItlDMs4aoN09PqTkI9GPnzqFMyWHwEu/DKk6VT4+hlALwj
	 4AlFM1UPynj1C2S21CKzwAEuMbU/PVV2kM29Ebk/McIyBm67seJ3B5oUOLo5/SxSuR
	 iuqIjyCaHZxYQpWVDzzCwJSEVwHthqoaIW1jG+lWQYzG/89ddlPobGH2lkx9hKlFNF
	 Z8+fPgMc8bg6w==
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
Subject: [PATCH 26/32] x86/boot/e820: Remove e820__range_remove()'s unused return parameter
Date: Thu, 15 May 2025 14:05:42 +0200
Message-ID: <20250515120549.2820541-27-mingo@kernel.org>
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

None of the usage sites make use of the 'real_removed_size'
return parameter of e820__range_remove(), and it's hard
to contemplate much constructive use: E820 maps can have
holes, and removing a fixed range may result in removal
of any number of bytes from 0 to the requested size.

So remove this pointless calculation. This simplifies
the function a bit:

   text       data        bss        dec        hex    filename
   7645      44072          0      51717       ca05    e820.o.before
   7597      44072          0      51669       c9d5    e820.o.after

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/api.h | 2 +-
 arch/x86/kernel/e820.c          | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index 54427b77bc19..9cf416f7a84f 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -16,7 +16,7 @@ extern bool e820__mapped_all(u64 start, u64 end, enum e820_type type);
 
 extern void e820__range_add   (u64 start, u64 size, enum e820_type type);
 extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
-extern u64  e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
+extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
 extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
 
 extern int  e820__update_table(struct e820_table *table);
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 22bfcad7b723..0fc77ab72c5f 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -590,11 +590,10 @@ __init u64 e820__range_update_table(struct e820_table *t, u64 start, u64 size,
 }
 
 /* Remove a range of memory from the E820 table: */
-__init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
+__init void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type)
 {
 	u32 idx;
 	u64 end;
-	u64 real_removed_size = 0;
 
 	if (size > (ULLONG_MAX - start))
 		size = ULLONG_MAX - start;
@@ -617,7 +616,6 @@ __init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 
 		/* Completely covered? */
 		if (entry->addr >= start && entry_end <= end) {
-			real_removed_size += entry->size;
 			memset(entry, 0, sizeof(*entry));
 			continue;
 		}
@@ -626,7 +624,6 @@ __init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 		if (entry->addr < start && entry_end > end) {
 			e820__range_add(end, entry_end - end, entry->type);
 			entry->size = start - entry->addr;
-			real_removed_size += size;
 			continue;
 		}
 
@@ -636,8 +633,6 @@ __init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 		if (final_start >= final_end)
 			continue;
 
-		real_removed_size += final_end - final_start;
-
 		/*
 		 * Left range could be head or tail, so need to update
 		 * the size first:
@@ -648,7 +643,6 @@ __init u64 e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool
 
 		entry->addr = final_end;
 	}
-	return real_removed_size;
 }
 
 __init void e820__update_table_print(void)
-- 
2.45.2

