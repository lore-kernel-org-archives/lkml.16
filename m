Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E991E1DF9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108862; cv=none; b=R8/IAmvPI9yzX0SnomAleFoSkYUdKH8RhzNpzpuhaCMbmeId+ifzfJH4z3rrK1bhBDH0Sxy9aOgrhlxE3Nztn2PQmq/zVRfEOPJkGEm66jtGRtTX+rq7ErHvSoaaAEUe6zrUay5sYFBC4FClrqd9AffKLYX9kCNxA5CkLEn74zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108862; c=relaxed/simple;
	bh=Mf5NDjQds/8951zPAHI8EXZwxWU5Ec1f5rgl3VV1i1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P59lIl64UXCqHON2akNTkJwak6pFi7eg+sAB/KZaLd1p+LhTc2neDFGphTGIZrYLfXQ1ioAVSVhm/3hW6omlQs6BvSpFrjtU3qfb+mQz5VN48bY+u6/Z6cZZTPNSw2U1xVyeRxOICoSLmeu2k7fUZcGLYNbc5AnZX39yP7V87to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTfB9VvA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTfB9VvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C70C4CEEB;
	Thu, 27 Mar 2025 20:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108862;
	bh=Mf5NDjQds/8951zPAHI8EXZwxWU5Ec1f5rgl3VV1i1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTfB9VvA0nKP7vIA0V57z6mIbkx+OyY4eNQ/t0C+9i5G/sGpon8nD88tXBAIp+U8O
	 kHIHzXyaSfJWO6tZWL4n2Oj8wIGEisJ6ssE+QN/2EW2FbWBcquGC2o8zQaAt7xRPSf
	 I0zGCX2+dAth6ievCYGi6LiJWEem3qE2tpiyom4ASe9QJS9uLeYw9IHcCmJvGQy9BM
	 8B/CuqwwqZqCIpAEi0rQCeuo7VXgG7qbiF9Efg9sFq9y5Rx3qi2Ouo1ID12sO0PyAn
	 pHAfOcl5L10wq88b5uCFE5SCIcbICFzuXc/4EQfPqenDyB/kgjHBhkTzKqHd/PF1wY
	 2qdcRUvlpYkpQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 09/41] x86/alternatives: Rename 'bp_desc' to 'int3_desc'
Date: Thu, 27 Mar 2025 21:53:22 +0100
Message-ID: <20250327205355.378659-10-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8c4bfb6d9a95..44b8e2826808 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2478,7 +2478,7 @@ struct int3_patching_desc {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct int3_patching_desc bp_desc;
+static struct int3_patching_desc int3_desc;
 
 static __always_inline
 struct int3_patching_desc *try_get_desc(void)
@@ -2488,7 +2488,7 @@ struct int3_patching_desc *try_get_desc(void)
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &bp_desc;
+	return &int3_desc;
 }
 
 static __always_inline void put_desc(void)
@@ -2527,7 +2527,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * bp_desc with non-zero refcount:
+	 * int3_desc with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2630,12 +2630,12 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 
 	lockdep_assert_held(&text_mutex);
 
-	bp_desc.vec = tp;
-	bp_desc.nr_entries = nr_entries;
+	int3_desc.vec = tp;
+	int3_desc.nr_entries = nr_entries;
 
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date bp_desc data.
+	 * ensure reading a non-zero refcount provides up to date int3_desc data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

