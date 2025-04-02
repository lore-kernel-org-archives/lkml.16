Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC0236A61
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587165; cv=none; b=jgG+ALaQjG5KR4w4jHG8Z6+2zYhQncLZwOfkzhvvKl8kMSv1SwqwoPD7UFPjd1u0XJyG9BFXYMZpknKA2Ifg1SA5GdaaswpKGWKjcfSHQo2cFEqlXgS3fnvIopeDQImSoisj8ySzVwdTP5/0rK0jNgu4qM8tkil+xlXPqo92Ieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587165; c=relaxed/simple;
	bh=757HnKsVV0oCVcNBFomeoHSBU+IWDVTrWkUMqXu+k1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoU7QjSwHgeVUwzDwTmRDasVCp3aZfe86QoN1b+1D/AxNERaYEwjDD1zWknfHdnZiTThnUzxJGUv85t3DTkvG0ggn+UdwFPlSbNb6xGYzGhR4/eFN1Lv/Lzr0iQv+dwhn2yXx99SkupvHu6P0Ag/1T3yxt+cYil7aIItdSqg2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piXOuXaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piXOuXaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BD7C4CEEA;
	Wed,  2 Apr 2025 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587165;
	bh=757HnKsVV0oCVcNBFomeoHSBU+IWDVTrWkUMqXu+k1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=piXOuXaDYIXtNUuLOnLxvwt3/874ttIDI+lHYvdLCxwFDPGMst7GCIqcVhB6VCcgi
	 fJL5UgSp/G/FmbosSmj7Ca2VbXfkxlrpzbL/p2dalLOanBuJJifsbhR+/THQVF0agw
	 yNJJsJsMx8vtGZEQFqmJxQ+EOiGRo0thEImlWR1CSsbkum+qZqmMJgAOCrEqSqoSa1
	 jwAvVD+/3ZPmw4EWhCASyc/LOgALV/vUDw9UCoepmhtZG45HRRjiK0GFS1xRxiRm7T
	 31ktE77eUEKv4A/zis4s5VGDNSB+JnUpRj11M9vmigPPV3YkSNdUvPPXeJZpIOoqMH
	 A9cgZ7fJZbyjg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 2/7] x86/events, x86/insn-eval: Remove incorrect current->active_mm references
Date: Wed,  2 Apr 2025 11:45:35 +0200
Message-ID: <20250402094540.3586683-3-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Lutomirski <luto@kernel.org>

When decoding an instruction or handling a perf event that references an
LDT segment, if we don't have a valid user context, trying to access the
LDT by any means other than SLDT is racy.  Certainly, using
current->active_mm is wrong, as active_mm can point to a real user mm when
CR3 and LDTR no longer reference that mm.

Clean up the code.  If nmi_uaccess_okay() says we don't have a valid
context, just fail.  Otherwise use current->mm.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.433533770@infradead.org
---
 arch/x86/events/core.c   |  9 ++++++++-
 arch/x86/lib/insn-eval.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 6866cc5acb0b..95118b52b606 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2803,8 +2803,15 @@ static unsigned long get_segment_base(unsigned int segment)
 #ifdef CONFIG_MODIFY_LDT_SYSCALL
 		struct ldt_struct *ldt;
 
+		/*
+		 * If we're not in a valid context with a real (not just lazy)
+		 * user mm, then don't even try.
+		 */
+		if (!nmi_uaccess_okay())
+			return 0;
+
 		/* IRQs are off, so this synchronizes with smp_store_release */
-		ldt = READ_ONCE(current->active_mm->context.ldt);
+		ldt = smp_load_acquire(&current->mm->context.ldt);
 		if (!ldt || idx >= ldt->nr_entries)
 			return 0;
 
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index 98631c0e7a11..f786401ac15d 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -631,14 +631,21 @@ static bool get_desc(struct desc_struct *out, unsigned short sel)
 		/* Bits [15:3] contain the index of the desired entry. */
 		sel >>= 3;
 
-		mutex_lock(&current->active_mm->context.lock);
-		ldt = current->active_mm->context.ldt;
+		/*
+		 * If we're not in a valid context with a real (not just lazy)
+		 * user mm, then don't even try.
+		 */
+		if (!nmi_uaccess_okay())
+			return false;
+
+		mutex_lock(&current->mm->context.lock);
+		ldt = current->mm->context.ldt;
 		if (ldt && sel < ldt->nr_entries) {
 			*out = ldt->entries[sel];
 			success = true;
 		}
 
-		mutex_unlock(&current->active_mm->context.lock);
+		mutex_unlock(&current->mm->context.lock);
 
 		return success;
 	}
-- 
2.45.2

