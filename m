Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2829617F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350132; cv=none; b=OkMSjfZxh1e+Ei8hoy17Nf2Az43lh2GQpIERn26sny2vNa4jSpa4Fq74R4jyKa8wzX6r88+4PtfC4zsfFQaiNkwfD5dDUJGbuxS36FNklWG96v65F50eTwJn9A6qJwMmw8j9UIjy1HYfSsxt8bM5Ey+/DNFLtNE1P+5NfuFqOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350132; c=relaxed/simple;
	bh=rmBlT3JpJLSXrIQpkHLjkV255q8JcC/6mq08ZERslzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LP7/UJuNuwrRZmw1Yj32b6vClRS3ikRiTF7mmRfEZSdHJ2b0voCvX0ViEGg8LED8gX6i+48CUI7Hhwuxr/yC/e7KKf8sBJbDZTdyTOmW9ae5VKKD9XNVI+/SMUOE+MSdH6OmcxW2c579jZWXRTrYIJEtSCe67/pj8yyGCF1WYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2RMHBBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2RMHBBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF4C4CEE5;
	Fri, 11 Apr 2025 05:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350132;
	bh=rmBlT3JpJLSXrIQpkHLjkV255q8JcC/6mq08ZERslzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2RMHBBMnozvjbIVy7ymXRYeAoHCdTxpZrU+L8QFhAogovZl2jDMfLd/48YV2LCrd
	 AbPkWCtXv2i2yW3PwLBKgiYA23qnT5SlU2f5dxr/96nrBaw943FB0Lmd0ahvKRDe2Q
	 3+/71XSKBqnfEBoRfzDHr4SiWERu16Os5KVDnRh8ezCxqC3nYTPsUdT8TbtAFWtSRe
	 Xm+6TWkoDnnHnEDJ99DHZ+rO1lzDgAOgT3/4pBLmHA6/p8rLocFVqg2RrpFMmC6D1k
	 J/NvOlH6aJIzYP7nurRB3NA/6AIJrdYJFhEQexoEaT2b7ofdTMEEh74uwi83FnuKhU
	 pF2ip6Hu+SxJw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 25/53] x86/alternatives: Assert that smp_text_poke_int3_handler() can only ever handle 'tp_vec[]' based requests
Date: Fri, 11 Apr 2025 07:40:37 +0200
Message-ID: <20250411054105.2341982-26-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 09c6be8900d3..aa369870dfce 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2510,6 +2510,10 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
+#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
+static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
+static int tp_vec_nr;
+
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct text_poke_int3_vec *desc;
@@ -2534,6 +2538,8 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	if (!desc)
 		return 0;
 
+	WARN_ON_ONCE(desc->vec != tp_vec);
+
 	/*
 	 * Discount the INT3. See smp_text_poke_batch_process().
 	 */
@@ -2592,10 +2598,6 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	return ret;
 }
 
-#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
-static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
-static int tp_vec_nr;
-
 /**
  * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
  * @tp:			vector of instructions to patch
-- 
2.45.2

