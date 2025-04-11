Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5928FFFB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350117; cv=none; b=EptTtKhkQG8g2hOIMGnThIrwAEcznkIv3AQDQ2G2eRpKr7wq2jhEcLuE/ZBvTTwgPgI6bZB/cAt/JBPHNtJcAbv9vJ1dZ6INU2GvbBMp1eFjN9wRp0AH9LN6gnQ1fe4kywOKQehfTVSo943hnYhQE29TpsrbYpNMoXg2gru9lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350117; c=relaxed/simple;
	bh=fMWeKBd9lbhMMm3nKgIyEkTL3zQn1EXu1KKQ4Sg/rPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWQyXNO0fRVJNLUFa0HIS5Ft1S05OEvKsEHhYgtoufQBnyJ5DOsJ1kWFirUSSGD0NyyvRKIDwP9KAp+lkD26z0oBq/wnmDRTe2J/s1wLASfrjdD4E/hnf44SX1vsAjWduY/JHS6XhL9sRaT/GXmfZ11qL8jsJ6dR7AwDuuXpTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4bIExAn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4bIExAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB775C4CEE2;
	Fri, 11 Apr 2025 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350117;
	bh=fMWeKBd9lbhMMm3nKgIyEkTL3zQn1EXu1KKQ4Sg/rPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z4bIExAnr1y8yy+ucv83IImHU85/vva+/Y0aCacKWbdAcg3G9hXA/DDAhBRpQuUHv
	 7iRSIGgI5KTxBD3QNWriZDv0B4wag6jY3mHnFXKi6h4mMMy1nguHpn2f9D2hWW1Tvl
	 62eWcfBcR1X6qeg3Et8l6oMJC9GihX5DNgMvctcf5CdTiiaf7hkvbHshe2Ykl+FlBw
	 Iz5OSpmosNZ/huimIaLf1BTytkfo4b40249myhH/rF4tnzS/i2N4Ax8DPW97jIRG9d
	 2uEbkhgUNL55m0ITwZAdhgEqcCVYj1ln0iSttLzdJOTIU7zGArUqzCGZqfVVuZ01Jl
	 Uehn5QiVRrZog==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 19/53] x86/alternatives: Rename 'struct int3_patching_desc' to 'struct text_poke_int3_vec'
Date: Fri, 11 Apr 2025 07:40:31 +0200
Message-ID: <20250411054105.2341982-20-mingo@kernel.org>
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

Follow the INT3 text-poking nomenclature, and also adopt the
'vector' name for the entire object, instead of the rather
opaque 'descriptor' naming.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8bd5842e626e..ca4599ef44f3 100644
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
 
 noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
-	struct int3_patching_desc *desc;
+	struct text_poke_int3_vec *desc;
 	struct smp_text_poke_loc *tp;
 	int ret = 0;
 	void *ip;
-- 
2.45.2

