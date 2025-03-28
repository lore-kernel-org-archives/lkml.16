Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08C221DAA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168507; cv=none; b=IN2g4HufvJdxEGQqTbA+p56552ys4/5bdGBXazO7MDjrPm11G61m6paPvTI9CfMpcM+JGZK/wU+DGPSjlb+Eb6MpaFiZclgBHzzXvZyYbPMakC3KCncT8leb9RXF+DJuflYZ27h7lV7K2Cxup0C8DjIoz6VgFD0U0UIg32dlkRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168507; c=relaxed/simple;
	bh=SSyOClHhqELj+2bJ2fcjNnX9/KncGhy59igRJXLeIxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+Az/Dq3XRyPbD+XTNR2EPQ/rBzV3zrRtqPC0fdzHYGSlnMP3KeS9XbOHHkxxWtu4tzhlfI4qONSe9fjpDhIedpjuJQdHIW4ybLTUgVdmvDqYKs/Wkqhm1WCbUePCWg8BTMvQjTH81h1H5BhNvD9yB0BLZtGFgHQ5ZKIlmBMNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3iXrxSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3iXrxSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF3AC4CEE4;
	Fri, 28 Mar 2025 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168506;
	bh=SSyOClHhqELj+2bJ2fcjNnX9/KncGhy59igRJXLeIxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3iXrxSXQ1AMhNy9VlAXjBS4Kd1lcPJjNiKOEekCZxm+Tdq4608cCZn/lmXlEDOjl
	 p4bwtSkwCDn+CQUKCGBAFmXrvRXSfJTKl/pRP2XPy1Gx6CPzCP1m5/e4xDIB0N2WI2
	 6lIY98o/sJ7xi8FSwXcDflXy2NZHlyd6LPNMZmwuKY0UzsIFmdATRUPteC1P9T5RE2
	 V/1PIFTNIsYhStahYpGoA9UFScar8BNv7WwT0QRRu3bWQfRwfTsSf93rWB+7pnNc4f
	 ZbBE/EhOmw1H+EN2NhOl1o+UhJWS8arIfOW+4LgbbL6eVpkt6uYGMk1qey6SS9ld/b
	 icBqMfVHwO6iw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 26/49] x86/alternatives: Remove the tp_vec indirection
Date: Fri, 28 Mar 2025 14:26:41 +0100
Message-ID: <20250328132704.1901674-27-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point we are always working out of an uptodate
text_poke_array, there's no need for smp_text_poke_int3_trap_handler()
to read via the int3_vec indirection - remove it.

This simplifies the code:

   1 file changed, 5 insertions(+), 15 deletions(-)

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index b4b5e4db8cf9..82808deb1501 100644
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
 
 noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 {
-	struct text_poke_int3_vec *desc;
+	struct smp_text_poke_array *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
@@ -2529,7 +2522,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 
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

