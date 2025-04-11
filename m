Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8C2980C7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350134; cv=none; b=cWvLTa76IDzLA+LVGjbriMHg5p0O3pSNz7iaG4edt1XKpH4FZWOel7YiwHfvSmDAc5khNY2Ld3WUnL7W/gMHKkm/cvMebRJZn8Ucg8EFNqIX3Abg8FmuVnTNagDvYD7f605e1WhGQ2Ak61W+emQmkDf9CjAQPVF+AEkuo3CUerw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350134; c=relaxed/simple;
	bh=ksgKsThUr934SDiegLpXIFwyJxxeAEKWgbZq2X+31d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2ztJMw8sNR2NIV0ljVyE+hwTPAlNbrFvtjXVH7+1ySavLTm7qT42rzg5JcQn/BnFrh8L9WFuyhzBq5P5Jsy3lqK76hqwxHfS4bi9THmBAewlyigLpVQnjS42h+kkcWz67hIgA6zV/N2OniDhurW1IXrNNTWlI03WSCEm26TFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KroPtlNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KroPtlNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C648C4CEE2;
	Fri, 11 Apr 2025 05:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350134;
	bh=ksgKsThUr934SDiegLpXIFwyJxxeAEKWgbZq2X+31d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KroPtlNSnjk3T0QrcLHrKVQsODTR8VdxddVkzwQUF1jOADMlLVMZ8zuDdHcRO01/m
	 dcgu3BjSUpU4HbAtfaB+MX742Jy2LNYiIRyJuAcglNwdxWGmTHAp62rNdqTlMETWYj
	 qNr+pJApemRR+x89nBVld8AFtf+5D9SKZ4cvbV+k+ejTzweED/v8OE/OTMfv6S/vIi
	 koL9VMycb9o0AaksfwOLmiQ4/HFPe8t9NRI18td6ajau9WTJ0EhVVnEoKN/IUAFFqR
	 71bhl/8XJocC7o9QzsiY33ppVIU3PCrnvzy8dI73yBp8fYC+aA+iGQ9JONUNyDvuK1
	 LJjd3+lUYPFxg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 26/53] x86/alternatives: Assert input parameters in smp_text_poke_batch_process()
Date: Fri, 11 Apr 2025 07:40:38 +0200
Message-ID: <20250411054105.2341982-27-mingo@kernel.org>
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

At this point the 'tp' input parameter must always be the
global 'tp_vec' array, and 'nr_entries' must always be equal
to 'tp_vec_nr'.

Assert these conditions - which will allow the removal of
a layer of indirection between these values.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index aa369870dfce..ee6ff7660563 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2627,6 +2627,9 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	lockdep_assert_held(&text_mutex);
 
+	WARN_ON_ONCE(tp != tp_vec);
+	WARN_ON_ONCE(nr_entries != tp_vec_nr);
+
 	int3_vec.vec = tp;
 	int3_vec.nr_entries = nr_entries;
 
-- 
2.45.2

