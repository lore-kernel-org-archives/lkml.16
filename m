Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFA1A5BA3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168490; cv=none; b=kulF+eDVrpYdN66uuX/LRDPYFFagprvPVCJx0R7EJ+K0OEh4wQqKlIKjyCPU/i+x8MznbMuZdyT/wtN0ZK7HKhshhnR4NfbQ07p4ITzIy7LC+BJje8soWrqde7ko+Vesu/zpbJPLQ+sv5K8NvCJmdl12RQnDEQjBEWZ9tbbybjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168490; c=relaxed/simple;
	bh=r8Z2fP6YHKxTr2SeyufPmLln62c4toqKQlKYqjpgris=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXzHV2aMFg+jAjQqKb7uDn1xTnXqYgLIh3rx7/T8jazm1DvKySzEKSyInRJOuSOXl66QMt4vgQM+12QdgTbUipO+o6hx11aOFdCkv7CnIm7+9I16Qa9cI2x0d0GS1D2lXemHrMny69v93iDgM2KAhjB6oXy6DxWkXWZYpL+dPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HY1NjDeC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HY1NjDeC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1914C4CEEA;
	Fri, 28 Mar 2025 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168489;
	bh=r8Z2fP6YHKxTr2SeyufPmLln62c4toqKQlKYqjpgris=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HY1NjDeCzn3OnSHZyllX+xLqENVSUMqroyddoqnPo1meCdmsSheLV1VXvAgZmiWY8
	 CYmPkuMdvGmuGU1FJh+FyaBeKEvxUje2e8enh1yyySssm8C+SWTu4unHjuji7Ap8Fb
	 ruUep7Xc0XpdTRgx7Me6pGMFAramaFptTo4fzojts8bgz0sAh41aeY5lw3be6k/4BD
	 +tFWyyJ9H3WuW2pEK2kbt2HWUFTNDgGFinmZcdjuOTFJWRPXD8pTBDN+52FlMGW562
	 fkEiUgo84wqGPMFweCqCslRt+O+I3eogonzWFvLtPzNUjW0sCurug6JwrbZPBcekuU
	 B9X47g9fDFqsg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 19/49] x86/alternatives: Add text_mutex) assert to smp_text_poke_batch_flush()
Date: Fri, 28 Mar 2025 14:26:34 +0100
Message-ID: <20250328132704.1901674-20-mingo@kernel.org>
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

It's possible to escape the text_mutex-held assert in
smp_text_poke_batch_process() if the caller uses a properly
batched and sorted series of patch requests, so add
an explicit lockdep_assert_held() to make sure it's
held by all callers.

All text_poke_int3_*() APIs will call either smp_text_poke_batch_process()
or smp_text_poke_batch_flush() internally.

The text_mutex must be held, because tp_vec and tp_vec_nr et al
are all globals, and the INT3 patching machinery itself relies on
external serialization.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index be836d1f6d99..378db5f0b59b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2860,6 +2860,8 @@ static bool tp_order_fail(void *addr)
 
 static void smp_text_poke_batch_flush(void *addr)
 {
+	lockdep_assert_held(&text_mutex);
+
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
 		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
-- 
2.45.2

