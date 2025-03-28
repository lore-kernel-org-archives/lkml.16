Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080E21D00E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168492; cv=none; b=tsrkjf6j85Lan9Rql3tTKYY9wtHuW28o7KGYSGtkxVqW9176jb55Veg7N5fSruA9SJnH92UzKFdedStHAP5l68sd5HXiR5kfzXoHb3T/1mw8+4WiTlVDxBWJOQqyvM5sPoQvOxinTGrPcZ4JYGG0qogfmBMWPJKv5FT4el8zkUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168492; c=relaxed/simple;
	bh=3Vbu6ubLpA0ZqAfgQmNZ68niwPxvET/82ncm/nT3hDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYquLfw2XRMGrL7de8XAsrNSB+/gTxqKTSrWhL79X9Svz7z8OeqKNNXgw9O2SALLGgTjE68aOi/Rs2WWKd27hv1VZdv4w6s6C+BbjCUuIPe7/qoccFi2jgTTo0vbbcxOORHFpQJ7ldxtqyNnrK2s7JtO5cbwHcnieONSNjTkSzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwrHk9Uc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwrHk9Uc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B673C4CEE5;
	Fri, 28 Mar 2025 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168492;
	bh=3Vbu6ubLpA0ZqAfgQmNZ68niwPxvET/82ncm/nT3hDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwrHk9UcsOeOh6aVMIANnSVAdhwoA0m/WnCUNKzFwvdgR3fT/m4bAW/3Z7rV1Ku1s
	 ew7LO64NtoJISRxlOjaL6/Im+/GuC/QFO67yGCpcjjYX4aLRko5GN+3A20oP6BM+HY
	 bXFcTyzoPR9euqXBdFb/sy5sQZUvbeAywo8Yif3a+EE/sOKnaFlrXlDHpGPCkj7p33
	 tjwmoNjtbHUxYcMR2/fpGXzUQtdWzkjBhChuroSeGa+2tolVq3CPlT2eQwg0efWREn
	 YFw5HzTe1+vPbOZwuTGMSdwZUdQ8Idk+Iq+qDiMGoZIYTTrRGvhDbK2eVe524N5Yjz
	 R3mHXZvvKI5OA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 20/49] x86/alternatives: Assert that smp_text_poke_int3_trap_handler() can only ever handle 'tp_vec[]' based requests
Date: Fri, 28 Mar 2025 14:26:35 +0100
Message-ID: <20250328132704.1901674-21-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 378db5f0b59b..5fe54f3c6211 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2510,6 +2510,10 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
+#define TP_VEC_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
+static struct smp_text_poke_loc tp_vec[TP_VEC_MAX];
+static int tp_vec_nr;
+
 noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 {
 	struct text_poke_int3_vec *desc;
@@ -2534,6 +2538,8 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	if (!desc)
 		return 0;
 
+	WARN_ON_ONCE(desc->vec != tp_vec);
+
 	/*
 	 * Discount the INT3. See smp_text_poke_batch_process().
 	 */
@@ -2592,10 +2598,6 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
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

