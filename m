Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB4298990
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350139; cv=none; b=pPB8ssnIm4bu/oN1BJ+pscmBPNAQ3/qhLlBonuIHE5Z53ypQQMY/nhLLXmTwy6w54GoZbj/EteLte8ao5em2DILWou9Xray/sBMmVm++ZCP61IsHTFsOeSkoLiDQ+POFTK8A26DT01o2HrBxUOuIvi8Qd2RDEdlFPF1bKeN4tIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350139; c=relaxed/simple;
	bh=zi+/HiEvwS3E0QajGfqQJ4f+3skWIus+SdC9r+0htYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iz6ni8UTv3RpbmsFHQews4ZIkrgug+uII8AevrwZee/sdZLdSdvocIToQ4QH95Pu5VQ0beRIUm2cBl5Qv063LqmnPUQY2FVgrc56gTdUepe8HzKmzHZN9ehhTcNdbKZOt5OuB18X9HNcE6yqQlCeODM8Wp/kpNnUGh9DnBdb8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXEQAQwi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXEQAQwi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35646C4CEE5;
	Fri, 11 Apr 2025 05:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350139;
	bh=zi+/HiEvwS3E0QajGfqQJ4f+3skWIus+SdC9r+0htYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXEQAQwiyzigsHPyAkVDnFJ+0mQG/VfVY2hlEwlLdAZd28lBReMLl2cjUdgBBJ1X6
	 fI/B5paRm5ZWR5KSvUQGCVu2EV+X/Qc4bBil7FdVi0IA6f9yCjNoUskoNbEvG3p7X+
	 8VgiTA1vZBR75Oq0MQUzXNmUeiMSHv2YJ4wn2x18MOPXB35MWsUAwPa5VtsZgdF0rG
	 9gRokl61o1IhYJJShaYff23CvYSAh//PFZQQvyLe8D/3E3EhW22aJXdbJzwqTJueCE
	 fMFQdyhGJjk7ZGTfYeDfoiHGJfnOA8Pd5tjP/rjjmu4xzR1G7WIho9a2FmuZyptYhX
	 Y9E2VJWf/imZw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 28/53] x86/alternatives: Remove the tp_vec indirection
Date: Fri, 11 Apr 2025 07:40:40 +0200
Message-ID: <20250411054105.2341982-29-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point we are always working out of an uptodate
text_poke_array, there's no need for smp_text_poke_int3_handler()
to read via the int3_vec indirection - remove it.

This simplifies the code:

   1 file changed, 5 insertions(+), 15 deletions(-)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d1647aa46db5..4da6a64dcb0a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2466,15 +2466,6 @@ struct smp_text_poke_loc {
 	u8 old;
 };
 
-struct text_poke_int3_vec {
-	int nr_entries;
-	struct smp_text_poke_loc *vec;
-};
-
-static DEFINE_PER_CPU(atomic_t, int3_refs);
-
-static struct text_poke_int3_vec int3_vec;
-
 #define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
 
 static struct smp_text_poke_array {
@@ -2482,15 +2473,17 @@ static struct smp_text_poke_array {
 	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
 } text_poke_array;
 
+static DEFINE_PER_CPU(atomic_t, int3_refs);
+
 static __always_inline
-struct text_poke_int3_vec *try_get_desc(void)
+struct smp_text_poke_array *try_get_desc(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &int3_vec;
+	return &text_poke_array;
 }
 
 static __always_inline void put_desc(void)
@@ -2519,7 +2512,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct text_poke_int3_vec *desc;
+	struct smp_text_poke_array *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2529,7 +2522,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * int3_vec with non-zero refcount:
+	 * text_poke_array with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2633,12 +2626,9 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 	WARN_ON_ONCE(tp != text_poke_array.vec);
 	WARN_ON_ONCE(nr_entries != text_poke_array.nr_entries);
 
-	int3_vec.vec = tp;
-	int3_vec.nr_entries = nr_entries;
-
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date int3_vec data.
+	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

