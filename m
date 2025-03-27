Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A31F8726
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108905; cv=none; b=m8zfAtp/QHcfBNjylkjey3AzOzs7HR5QoZYPFM6/eocJXu+TIpHPs5J82NHv2L8xgk0CY0vyFCD+4Y4cdFCSHG4atQfSnJgm1vn9I4vRpEq6f1sxaxoOEpGBGHAmroZha5pSVgfxFhtHWvT47Ns7MMQp5veNveF90vcxEVolh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108905; c=relaxed/simple;
	bh=5xR7PRjLVC0Rruw4fQdXxcv3j63d8tKbS7U0OIHAEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAmrkQtl+iCeZ4dmq/8QkEXhSE48H6BNaG1aj2M6yRholuMOC6nX///3ybWi0zyF4zyNCYdgS65r5I7gw1yj0my7E5dNGDMfVJ/+bKLCFsDWEJxFzRbE8CwsGEo36LD9JeFRnxDLNZZJuQvCb7uKncmq/VuGpZL4kWtyBGps4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFnzJJ+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFnzJJ+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388A7C4CEEE;
	Thu, 27 Mar 2025 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108905;
	bh=5xR7PRjLVC0Rruw4fQdXxcv3j63d8tKbS7U0OIHAEdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFnzJJ+WXfUIrXgkkfWjx9SDH++Rr66vRKKz4J7q39s0eahecIeWcIP45mHAJyG1E
	 HCUvyCmySIkTdDV1w1rLmZRxZ9AUGJuu56resBA/jlICip9K6EJhlgKTg1LLgjp3+K
	 RdTl3IZ9WJzioREzug3fr8+ZbeemZ3MSGJOxtsvzFAU0nsxmaJqaY2A0AGnO7YVLnb
	 UJY5wlPcU9x6mspVCOu9pkkgqOfDiVSPLxDwHYX91QhLAPCnMpJ1PQCjp4GVw/Wx8I
	 j1GDWExVLK+uHxC21UuX5wgDemOXIcSYypGQdUhXnO3l6htLZtpOxRGGdRlq8d45Mv
	 cRijaSx1lPEVA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 27/41] x86/alternatives: Remove the tp_vec indirection
Date: Thu, 27 Mar 2025 21:53:40 +0100
Message-ID: <20250327205355.378659-28-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point we are always working out of an uptodate
tp_array, there's no need for text_poke_int3_handler()
to read via the int3_vec indirection - remove it.

This simplifies the code:

   1 file changed, 5 insertions(+), 15 deletions(-)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cf3bcaa97957..3baef1827f3c 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2466,15 +2466,6 @@ struct text_poke_int3_loc {
 	u8 old;
 };
 
-struct text_poke_int3_vec {
-	int nr_entries;
-	struct text_poke_int3_loc *vec;
-};
-
-static DEFINE_PER_CPU(atomic_t, int3_refs);
-
-static struct text_poke_int3_vec int3_vec;
-
 #define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct text_poke_int3_loc))
 
 static struct text_poke_int3_array {
@@ -2482,15 +2473,17 @@ static struct text_poke_int3_array {
 	struct text_poke_int3_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
 } tp_array;
 
+static DEFINE_PER_CPU(atomic_t, int3_refs);
+
 static __always_inline
-struct text_poke_int3_vec *try_get_desc(void)
+struct text_poke_int3_array *try_get_desc(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &int3_vec;
+	return &tp_array;
 }
 
 static __always_inline void put_desc(void)
@@ -2519,7 +2512,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct text_poke_int3_vec *desc;
+	struct text_poke_int3_array *desc;
 	struct text_poke_int3_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2529,7 +2522,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * int3_vec with non-zero refcount:
+	 * tp_array with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2633,12 +2626,9 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 	WARN_ON_ONCE(tp != tp_array.vec);
 	WARN_ON_ONCE(nr_entries != tp_array.nr_entries);
 
-	int3_vec.vec = tp;
-	int3_vec.nr_entries = nr_entries;
-
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date int3_vec data.
+	 * ensure reading a non-zero refcount provides up to date tp_array data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

