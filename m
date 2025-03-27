Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82051D54E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108843; cv=none; b=eOYbhG3EEA/89QK0mU9rY0ir0t3hz4aPSxeuy6WQA0+GdiF9YXAsL2LQCpBVHMgEnwmR8d0TJR4H+olVV/hJSkbK6FRkhHEhza9mh5umoyuwPP1Xa4L0FrSPWVJ9WIt8OW63lfDviU2tKQBwKorblXZwsVNeBzGIKt/kmp7R27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108843; c=relaxed/simple;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9mjPhrF0m/b8KhdgaCPoPWs7Z2oDmIFe3jSMtmI78gqdcC2sKbEUK8RWvX0GEC4Roxav/u4PDTPfH8vK/kghhX0M6Js1X/I5vceLBfSt4XHlCACR7YDOM1R2zNT7Jg27dUXp4Jhm11Yo19dhxmYWp36OGzR3pX84saZhGt3ZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8CklMC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8CklMC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40520C4CEE8;
	Thu, 27 Mar 2025 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108843;
	bh=rtowR0p5yc0zPA1Vl4ObrVmbHwWZEHknYKLd4kjcKNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O8CklMC1LC+KzeHnUENabx2quX8R5IHZc5o9/lgNBEaWwp6I2rmQwzVSBRE+bA5fT
	 O/CvmkPLCEJPloQbj8WlmQDqc2kzt4gSpsUS4vrcYCYCt3stQCyVkv9045hFwlqH+t
	 uGRBSFoVcOwXAN3p9+yP0CYBrjSN6s1ZIBcQKK2sd9sR0M/WNx898ut8oo5CpwKkxq
	 Ygm1kp7uV75SR9JuFKITyzs3zvSQAA8bH6UZzNrKv1z0vUh66O+/wwEHkpiBu06LeM
	 YesLFvkkbD5WwfFBr/NudyVofoR6JJCApmdlq3krhVljAcxyfKsRS8Nf2Oxj+pBRod
	 34dy76yWCWeEw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/41] x86/alternatives: Rename 'struct bp_patching_desc' to 'struct int3_patching_desc'
Date: Thu, 27 Mar 2025 21:53:14 +0100
Message-ID: <20250327205355.378659-2-mingo@kernel.org>
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

