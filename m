Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844D1FFC49
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108922; cv=none; b=i42Q9fY3R4sXmslNkgL1oRtZjllADTg6CuOt/A/VBpPLoS3CoFI+woU5ImC/X5DSkYqeFYX2O54uu1Rh+y72FKAMoXt+VUUmd3ycgFpq4T22fNlf0DB2dF3teyz0m8FuHCmubD75kapDH/5pM6772Lw4hSMoo5BsKHeSs0vtOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108922; c=relaxed/simple;
	bh=+zk0eyrSgNMye3/IquBat7SMnI+wWDUbA9GFx8uB25M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK8ZCM+/1AqSSteQx8etCkSWlrkLTl68+edycejBZw/UQ9uVCGS+lP8ZbWSoPr2xrMF7RKmJ9MY7Tm8C2Pd1gkCm2/c/fRyMGVDgkUD9AAUhC+45SB581DIEBMVUChytqXqnl4o4kXrUBoxN+lxD5PWCvAmku4Ifow/B1ls9+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDMaLTgs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDMaLTgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222B0C4CEDD;
	Thu, 27 Mar 2025 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108922;
	bh=+zk0eyrSgNMye3/IquBat7SMnI+wWDUbA9GFx8uB25M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDMaLTgsajV6qKqbDeNpuebV3GicPgQO2pxsenbGhKPJoa5MZjPuccdgHc/l0fTIw
	 mxDMn9+USvtmySrjodBuVF9Es7a0OGzv4+EED8PN8pJrglUVzIZ9jpcIOk8fojZ49M
	 MqDGkuPzGTBJJDLSuFIVeR8OcKKyj3lOduRgD8ufX+ueVIpXI8juNMMnzUCn8b8oJ7
	 UqpWtarp4yphltNFIVm0KT60u2DdNd3QhakxxoOX7czR0Uz9D7UDq3ejg2/A/qPlNi
	 rNDjm1dmTY+3SrAHumN/JHOn8RFEM/WqGmOW/MhL6vspQH916Ch9HKmt29n8TEOSnG
	 b2E1IqkKw8RRQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 34/41] x86/alternatives: Rename 'int3_refs' to 'tp_array_refs'
Date: Thu, 27 Mar 2025 21:53:47 +0100
Message-ID: <20250327205355.378659-35-mingo@kernel.org>
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

Make it clear that these reference counts lock access
to tp_array.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6c3850527bd5..3ab40b0f5245 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2473,11 +2473,11 @@ static struct text_poke_int3_array {
 	struct text_poke_int3_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
 } tp_array;
 
-static DEFINE_PER_CPU(atomic_t, int3_refs);
+static DEFINE_PER_CPU(atomic_t, tp_array_refs);
 
 static bool try_get_tp_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&tp_array_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return false;
@@ -2487,7 +2487,7 @@ static bool try_get_tp_array(void)
 
 static __always_inline void put_tp_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&tp_array_refs);
 
 	smp_mb__before_atomic();
 	raw_atomic_dec(refs);
@@ -2522,9 +2522,9 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	 * Having observed our INT3 instruction, we now must observe
 	 * tp_array with non-zero refcount:
 	 *
-	 *	int3_refs = 1		INT3
+	 *	tp_array_refs = 1		INT3
 	 *	WMB			RMB
-	 *	write INT3		if (int3_refs != 0)
+	 *	write INT3		if (tp_array_refs != 0)
 	 */
 	smp_rmb();
 
@@ -2623,7 +2623,7 @@ static void text_poke_int3_batch_process(void)
 	 * ensure reading a non-zero refcount provides up to date tp_array data.
 	 */
 	for_each_possible_cpu(i)
-		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
+		atomic_set_release(per_cpu_ptr(&tp_array_refs, i), 1);
 
 	/*
 	 * Function tracing can enable thousands of places that need to be
@@ -2745,7 +2745,7 @@ static void text_poke_int3_batch_process(void)
 	 * unused.
 	 */
 	for_each_possible_cpu(i) {
-		atomic_t *refs = per_cpu_ptr(&int3_refs, i);
+		atomic_t *refs = per_cpu_ptr(&tp_array_refs, i);
 
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
-- 
2.45.2

