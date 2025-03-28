Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DB19F11E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168484; cv=none; b=TEw3l2XmflZSkgbzrX4pF5Lps0vX7pjwd4TccTJQ4z+htQskl8fHwGNPpV6Rstnm2dxnYgnlF5yeET0xTNP6g/PaIuWAcG9A/SCTh3m2Tagd22bYty/sygvHT5jXQXtRUk8yJMKFZVi6KFH2sUIfFWQHjlU29W8Va/bLYT+VtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168484; c=relaxed/simple;
	bh=boZD/XlVSSbX1UhA+7MyokLpMqSarvld+PJ451QKKOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9Lo/gYZc/uBK12oEfaddFQECTrFteapdfGl/6mYRiJlr5vuOqBbIr0qNlJhoyJ64RtphejqHGsi4U0ZZZ2iXKuqrZq6NVfu+jO5HL4L7c6e+IQQxJzPO4H/ST65UWVQ7JpRmnghjIJxDbFyIGmqCNtsjitN8nCCo35Png0iGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXSvDO2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXSvDO2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A30C4CEE4;
	Fri, 28 Mar 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168484;
	bh=boZD/XlVSSbX1UhA+7MyokLpMqSarvld+PJ451QKKOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pXSvDO2gBHsaJ+CedL/XDmdGSDkcK3fksjDHNDeVesLmR2ATUt1C8Xf0rjLtDkTA9
	 gZNdkQJryQeiTxM/Chg8wusCTKReNCnLs33qpD0sdvAkvTjN4DvXGzmBAftPrvh6b+
	 kGkSSbIeyhGfNRaiK0JhIZi9dkgPkR401i5wu0Vt7yqBzw+JCQQJJ6Q3NZkoI54udZ
	 HPILeaGvlGZIhqNqCbzG/b9N0dh9rHCN3Y/64XBlzJdzZWIlBh2zUgj804b8+7Lz3a
	 iGMDbx3SJs4nFwomuKMQZb2oYtdiviwfmeioMhTDy/Klntob9IdsD/eQY4NOyZwklj
	 zqlrz6m1z9xiA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 17/49] x86/alternatives: Rename 'struct int3_patching_desc' to 'struct text_poke_int3_vec'
Date: Fri, 28 Mar 2025 14:26:32 +0100
Message-ID: <20250328132704.1901674-18-mingo@kernel.org>
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

Follow the INT3 text-poking nomenclature, and also adopt the
'vector' name for the entire object, instead of the rather
opaque 'descriptor' naming.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c42bad65bb03..db5b06ea08d0 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2466,17 +2466,17 @@ struct smp_text_poke_loc {
 	u8 old;
 };
 
-struct int3_patching_desc {
+struct text_poke_int3_vec {
 	struct smp_text_poke_loc *vec;
 	int nr_entries;
 };
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct int3_patching_desc int3_desc;
+static struct text_poke_int3_vec int3_desc;
 
 static __always_inline
-struct int3_patching_desc *try_get_desc(void)
+struct text_poke_int3_vec *try_get_desc(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2512,7 +2512,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 
 noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 {
-	struct int3_patching_desc *desc;
+	struct text_poke_int3_vec *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
-- 
2.45.2

