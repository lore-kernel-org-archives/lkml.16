Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B17298992
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350141; cv=none; b=cgw9ixVRaoipKzNRuB5oBlZXlJcSEzxeDfbNBonGs64dra1jiKyGUvNiikhO7wWGOmji0d/GgCfNIHKyZll7XL6xye9F/S8zMP3vjkwufpJ/iAvO3mvrB2/2n+bXxgsgX0kREE92k2f5WTNf/f2OszHW/5wHVCyIMvtu5wb0cCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350141; c=relaxed/simple;
	bh=IbZURKeJ3vzy/tXLxxQltXi7cPQ66zkmzEzSAd4LpiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d99z3lmOCc3pZsap66EPwm6tZlI5FGIpafdvi4w7W2NNUyMdIdLVrPATsK5YT3WiIdfgMqbmfpV3103FcqbtAkswArl8dqJPTte5kxnMRMsv/VlKVfAyhbrf98Z9sEQKsPNUZVAPb2xXa0sQreQM/K6MSHKdQxB+d5EVXL1V7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5nNHFDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5nNHFDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B3BC4CEE2;
	Fri, 11 Apr 2025 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350141;
	bh=IbZURKeJ3vzy/tXLxxQltXi7cPQ66zkmzEzSAd4LpiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5nNHFDkrIQZkZt/r/DfNKPMuFbkpE+qmIQstnQVzUX4Ramexfdw4g5sm+mNPkh+c
	 SlMK8enxczrg4wzCqLGeIVJLrhrqjTGBXVh+NRY+xTu1XeofrrEAo7C15MmikEP4L0
	 ruDpYdE4lvaR6OV6CpmLGtzhP3A9MoRe79KS2ALmtCzwjVfEFlFd9yZeltWdpEorE6
	 X2NY/a/lFb+JceCkRl9DRIH520Ulns7cwa8jSOlypd0kdKIMrFFYctHYaUrdWsYc3i
	 BPhfThVTOu+F+Ar2lin+pBRDfzc+Eqf+82JCjvGtbCy3OdKoSj8U9VIJdzsokKFEz/
	 eiIOwm/9aHlmQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 29/53] x86/alternatives: Rename 'try_get_desc()' to 'try_get_text_poke_array()'
Date: Fri, 11 Apr 2025 07:40:41 +0200
Message-ID: <20250411054105.2341982-30-mingo@kernel.org>
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

This better reflects what the underlying code is doing,
there's no 'descriptor' indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4da6a64dcb0a..2bec5ba866ec 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2476,7 +2476,7 @@ static struct smp_text_poke_array {
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static __always_inline
-struct smp_text_poke_array *try_get_desc(void)
+struct smp_text_poke_array *try_get_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2530,7 +2530,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	 */
 	smp_rmb();
 
-	desc = try_get_desc();
+	desc = try_get_text_poke_array();
 	if (!desc)
 		return 0;
 
@@ -2627,7 +2627,7 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 	WARN_ON_ONCE(nr_entries != text_poke_array.nr_entries);
 
 	/*
-	 * Corresponds to the implicit memory barrier in try_get_desc() to
+	 * Corresponds to the implicit memory barrier in try_get_text_poke_array() to
 	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
 	 */
 	for_each_possible_cpu(i)
-- 
2.45.2

