Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231716F8F5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168446; cv=none; b=nkc2qLBnheECCt+LBPI8W6o7wKuFnILFfIaywc1CXoWsU9j+zQP5OlyvJkl30AhElDe1YXTFhGUw/dHvKqUiaAWM/UkJLsKwh8AcSZ+eWljMl5x2gclsx3n0tQ0g6LOGmZcIRyyto5v9ANdOoFg0cbygXpx51gAkYVP4+5gSQaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168446; c=relaxed/simple;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tszA6KfdgMX3cXyJk2Myj1CC2mF9E8UIneTQS5BtGX/eQ2vXOyBlDXex3dKkEgskdkGWuQpjbuGEgeTdr57GzXLbsIzac4UXMRWGvbeoQlfiZn0fnfeLNFMAJ+oFo8+a/9AMCjbY7OX/3wjeQI/9Tw0zc3U6iQHtZO6teP9APbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9cPgOiU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9cPgOiU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ECFC4CEEA;
	Fri, 28 Mar 2025 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168445;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9cPgOiUngpYs/Y3WJB9nIurZZ/zuLMWF5tdvsDInbBE0br+6iVsgshMX5PZaAARu
	 cQ0NUG7aTs7r5nBhiQgR10heeRAbeXap2Zci6pKNfyYkI4Xg8AC3POOQ129fJ5hVAN
	 otUScP1pmWsFfXH0DUk+hO/ZTNuKy2Ul05+9yDV2odwzR/YH0XifVEFT/wy7lUEJod
	 AVrGzAb+/xSecjgSV1n74gWMKpZ3trN75qDtSKvSRq1DEW4khTvU4VwvKW6RAp0ZTC
	 TIWb378ri0ND/kHi7UAq5tmxqXYSpi8a86mbNACWCNOkWX22ACz42Gsebp5p49m6XW
	 6PeYIf0OslOvw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 01/49] x86/alternatives: Rename 'struct bp_patching_desc' to 'struct int3_patching_desc'
Date: Fri, 28 Mar 2025 14:26:16 +0100
Message-ID: <20250328132704.1901674-2-mingo@kernel.org>
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

