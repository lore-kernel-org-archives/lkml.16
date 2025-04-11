Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8C27D77E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350081; cv=none; b=VxzIMz4whHO7s1JmTSHjR6PHVvKEicdj0UhhnLBOqDLiUfatMh2xXOQSazAoAl+YErNlHEqbVTKVOPmjrmJtYZWehxrMIgdwGlV/34wBbPdmouANxID/21S+Ba7Ko6iAK4vFiVfgefxrfSipAOAGN+a4TwcBOn5/pfhWhP2L85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350081; c=relaxed/simple;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioBGlUlnYeShDtdaiYyyBtMMEG+WPL5grh5S4a3p0uREz7DupOPNs4eFFrclRU9GuYgIJO0frHQQ6NgHBf557DJWcFx05tB3xPp85fw5UfJEibcIol8IPOatNACNfRinx71E9VUm6yd6EVUz94DB9/XXktXqKLssiv7nppvHlSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY5+qAAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY5+qAAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55AAC4CEE5;
	Fri, 11 Apr 2025 05:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350079;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IY5+qAAYDcVMHLMqg+70X2eDnPR9P52FZkiOxRnnSB1p1xSoj6rh2SSmXhx39fI26
	 lr1DNg0aX9v8dwlDkcr74M+WfnWI4f/fOhr5QtbfO1jbiG+fwgUq3q7nvsvklAh3YW
	 xk3PBHm0wvjYoVwO9Md879dUtS5dNClV7fh6rYY5SWUDBlmn0pBHnA15P5HFmY+HTK
	 De6K7vXJZo5I0HV+Fz8U50PDr9+MAOWLDDtR/5BySQ7OaAkyog7vztlh6x/qTPODE+
	 G/MVqwCpovgzZKRQA9MxWMEK8kmFCXCpH+SkGxjgTxH06oNvqWvl6OteOsocuKAkkO
	 /HZZGDcR0Rdmw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 03/53] x86/alternatives: Rename 'struct bp_patching_desc' to 'struct int3_patching_desc'
Date: Fri, 11 Apr 2025 07:40:15 +0200
Message-ID: <20250411054105.2341982-4-mingo@kernel.org>
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
 arch/x86/kernel/alternative.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5f448142aa99..4e932e95c744 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2471,17 +2471,17 @@ struct text_poke_loc {
 	u8 old;
 };
 
-struct bp_patching_desc {
+struct int3_patching_desc {
 	struct text_poke_loc *vec;
 	int nr_entries;
 };
 
 static DEFINE_PER_CPU(atomic_t, bp_refs);
 
-static struct bp_patching_desc bp_desc;
+static struct int3_patching_desc bp_desc;
 
 static __always_inline
-struct bp_patching_desc *try_get_desc(void)
+struct int3_patching_desc *try_get_desc(void)
 {
 	atomic_t *refs = this_cpu_ptr(&bp_refs);
 
@@ -2517,7 +2517,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int poke_int3_handler(struct pt_regs *regs)
 {
-	struct bp_patching_desc *desc;
+	struct int3_patching_desc *desc;
 	struct text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
-- 
2.45.2

