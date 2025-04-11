Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25427D79A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350077; cv=none; b=LP590Nyf1wIiKVAb9j9BXOuu/OZrgroFbAPNyAEil8mreg+2LalbcOJms0Q4bIgkB7z2YVGtI4OPJ+YB4AoVC/2RMZDeVUU6Rn27rs58jvAm3DswLKyJEYtxvikNdruB7jPf/xnbO1XvwTmWth1BsY4miZA834s7WBLowlewWFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350077; c=relaxed/simple;
	bh=TFQXCq5fVPI5M6GJFklYGsXNadUsa2uuwbcNO4LhjnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFy+gJFakm7b0x7PSJUW/6HktwUf4BOCZ3mSA0lhpWBwMhcfnDXST6mtyzCIkWQItfa/DtnYYWoHlOmCBReX36646X+Zuej3CAATqLULd5TbvQDqfmxw/2961JBH1v3GXLLG9BxbrMYs3S5IGH033ov+zOXMnzfNWy11Xy02i8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMcngRIZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMcngRIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78D1C4CEE9;
	Fri, 11 Apr 2025 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350077;
	bh=TFQXCq5fVPI5M6GJFklYGsXNadUsa2uuwbcNO4LhjnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMcngRIZheKT8ZpDDAPgU2+FA137q4aaqI/et48IBc6Eo59SBb4cBJVCGuWWxVTh8
	 E+pQORhwwar05uMtGbToONotmFUJjo3yP64nxWikLLwuvavoLAHh5tvGiyx3CoFSyt
	 GPyA5fTr15yJP8aAc8XkAbwgJhBmRiKsAz/atL6HrwhESeS/jHt/k2Nr2NuC47vlFp
	 ayVyNsEN1h1g/+SeNZ1WpTg9nQ7/l3tJdq/Ox+1zcfG0TNZlgE242E6wFHq+EeQ0s3
	 GsLXb7LM9NOVv8+agonviliSzi9cvmIBy26G4G3FKhd7USvxtfzihXqRO1xC3tSAUq
	 Oq1JSWxOEz8kw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Brian Gerst <brgerst@gmail.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH 02/53] x86/alternatives: Document the text_poke_bp_batch() synchronization rules a bit more
Date: Fri, 11 Apr 2025 07:40:14 +0200
Message-ID: <20250411054105.2341982-3-mingo@kernel.org>
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

From: Peter Zijlstra <peterz@infradead.org>

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lore.kernel.org/r/20250325103047.GH36322@noisy.programming.kicks-ass.net
---
 arch/x86/kernel/alternative.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 85089c79a828..5f448142aa99 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2751,6 +2751,13 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
 
 	/*
 	 * Remove and wait for refs to be zero.
+	 *
+	 * Notably, if after step-3 above the INT3 got removed, then the
+	 * text_poke_sync() will have serialized against any running INT3
+	 * handlers and the below spin-wait will not happen.
+	 *
+	 * IOW. unless the replacement instruction is INT3, this case goes
+	 * unused.
 	 */
 	for_each_possible_cpu(i) {
 		atomic_t *refs = per_cpu_ptr(&bp_refs, i);
-- 
2.45.2

