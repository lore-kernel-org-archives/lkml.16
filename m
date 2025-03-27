Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EA41F3BBC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108886; cv=none; b=kCfjO5v7MLJ8qL25xhgns4EUjhmq36/9HozQYZ3YcHRbBLNtlORDq6iKgtO8AendLhnHBc8qVF8QED9qAmvxeS1N5MtYV4dUFZhUzQd2rTvtI+DND+IjLGZ8VOhog1beCHseKQ99LUgTCyTBhrLRkpKt4K8htLOfnduQY48PbAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108886; c=relaxed/simple;
	bh=syPrkXLItsYp6RWBVz0g6CH8g+YTRH/Y7vTvm+v/eu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U23ULrMFo58sUAlIqUyeH5dQMA2NgcQrc5WwKRhK4FBpxh6pL0KZE8Ge8Xb3z6y27vYecrPv/YHw+dKS61GtovhHl1RsGR+ukL5Xs1H70HLQtKATV46r7U5HJRzgXc7EJv0F8Uu8fwhNIiZeBVFemOoTBz5uvvmJBzpyXoEjg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDf38+p/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDf38+p/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164DFC4CEE8;
	Thu, 27 Mar 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108886;
	bh=syPrkXLItsYp6RWBVz0g6CH8g+YTRH/Y7vTvm+v/eu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDf38+p/tVm/LXOnZcXHTClqzztx375uXPrmMZzUTOPTuYi1hS4zjU6EdIkS3gaV5
	 utJt8fdQ2KKzINp4nNlTRivmGInWS47hT/LgzoSyfk7FKA3gkukgom10HibqObJp05
	 yDURPtKn//TgXQIV7ClHr3A5U0q1zbxqzSvbIykYqO2D7NRc31x9tAuAc3DlRXi+Pm
	 nQdaK9xGAV0ja7fevlisEqkzPrmnWFgBatXJj4GOQjNo1Y1ui9+FlONY0FhufziAoG
	 EqocA6OgkjkK/dKRhS+wYb4hQJ9WlFNYVju/fYuEuM29O6MbfGLcDK+2d0Mk6/wmGQ
	 qmuG9h6vv2V6A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 19/41] x86/alternatives: Rename 'int3_desc' to 'int3_vec'
Date: Thu, 27 Mar 2025 21:53:32 +0100
Message-ID: <20250327205355.378659-20-mingo@kernel.org>
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
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 84c26d037f05..a10e1b9db7b4 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2473,7 +2473,7 @@ struct text_poke_int3_vec {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct text_poke_int3_vec int3_desc;
+static struct text_poke_int3_vec int3_vec;
 
 static __always_inline
 struct text_poke_int3_vec *try_get_desc(void)
@@ -2483,7 +2483,7 @@ struct text_poke_int3_vec *try_get_desc(void)
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &int3_desc;
+	return &int3_vec;
 }
 
 static __always_inline void put_desc(void)
@@ -2522,7 +2522,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * int3_desc with non-zero refcount:
+	 * int3_vec with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2625,12 +2625,12 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 
 	lockdep_assert_held(&text_mutex);
 
-	int3_desc.vec = tp;
-	int3_desc.nr_entries = nr_entries;
+	int3_vec.vec = tp;
+	int3_vec.nr_entries = nr_entries;
 
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date int3_desc data.
+	 * ensure reading a non-zero refcount provides up to date int3_vec data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

