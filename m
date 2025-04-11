Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F322280A5B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350096; cv=none; b=W2BoIqKrRXCjWfNjwTuxvopqWYikQUIRmjuWftEiNIrcDoixpp3lji+UESFRzUuDBNBmr7lp971T5cFVAd/AVaO5Ah2PluNZGSAYnDGxkjx/6jihy1/MI7VYfqbSVJPupJbJCMBx9ajdfoV7u3iIdtOB9s9GwPl3oNTYZ8zJpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350096; c=relaxed/simple;
	bh=JkKUXZl8EWtFBzsfYNb9gWa0//YHq6hszNipmvkltlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCdmsFFUzcp+FWy7YqOFp8i4T71vDFk75cdbpVbAfCKph29BSSP+lL58VvCapmtrwVQxv7NWmFFWDBjj89m97bDPG+7qbV4Uhh3EbaQK9rqS0XVAT4QWSmj66Ep1R3mukLSotVJlr9XTMrQBgmJa8IFsDH+pfFfdPC4ELDrgRH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElGo1URe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElGo1URe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5942DC4CEE2;
	Fri, 11 Apr 2025 05:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350096;
	bh=JkKUXZl8EWtFBzsfYNb9gWa0//YHq6hszNipmvkltlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElGo1UReYbRtumBcRdYn5aIPKGBg5k4OhRB6zu9WqiixDUl0sN9kKE+ny9FvOk2Ai
	 GNxzD8Pz12dcqP2RpI4RxIy4WnLbHWZ1gCl7kXdK7ABFx2BiTAY/Fpf5o7Rgxx7oqr
	 zw9b1y23M5+PSgp+BlhSQReMV01JATspTbksplh3/xzJn5gU7f9zXPbKabop2/VdO3
	 UNZQ01s+RzzFk9iUDypB1ddNsOfS6N+5CMr+eWQVgGwb5mREWczH+H/CruOV2h5H+c
	 mFtGEuf+JrN42oDMeMtFDUuLOBF2DTYt1pZXlv7yWLM3AMLG/ZWQVZGBnLHqBGcflV
	 c36aLRSz071Wg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 10/53] x86/alternatives: Rename 'bp_desc' to 'int3_desc'
Date: Fri, 11 Apr 2025 07:40:22 +0200
Message-ID: <20250411054105.2341982-11-mingo@kernel.org>
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
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a64032b2f6ca..2a630d1931ea 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2478,7 +2478,7 @@ struct int3_patching_desc {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct int3_patching_desc bp_desc;
+static struct int3_patching_desc int3_desc;
 
 static __always_inline
 struct int3_patching_desc *try_get_desc(void)
@@ -2488,7 +2488,7 @@ struct int3_patching_desc *try_get_desc(void)
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &bp_desc;
+	return &int3_desc;
 }
 
 static __always_inline void put_desc(void)
@@ -2527,7 +2527,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * bp_desc with non-zero refcount:
+	 * int3_desc with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2630,12 +2630,12 @@ static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int n
 
 	lockdep_assert_held(&text_mutex);
 
-	bp_desc.vec = tp;
-	bp_desc.nr_entries = nr_entries;
+	int3_desc.vec = tp;
+	int3_desc.nr_entries = nr_entries;
 
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date bp_desc data.
+	 * ensure reading a non-zero refcount provides up to date int3_desc data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

