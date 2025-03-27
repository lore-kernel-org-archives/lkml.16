Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E991F583A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108898; cv=none; b=FmT/a/NbuOKehypQ7tkwmxyyyLBuzAjJEXG7u+CbGc69jcqBEXC2S4amrbgTlO7LQWkLxmnm6gigFTEv/alIjWFLUUgPPlPFCKJarC92bgd4OpG/pQnOhsoPX/fSU7RoixjsXkCQDk73PO6YCAWtU+AxhnxqGK73U1umew6xdN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108898; c=relaxed/simple;
	bh=p0Ih10xOVpTCmZXQkmnpEk3Kh0N4Zc+CdM0kPdasQnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etsN4gFwRoFyDPcnSPmd+j+t4fZW3x3zWaSNbyGWrCu/YnNgWFwit+h67C7UYKZnGOKAJ6TPatOIMYV8pBGJHtMo7baTZfdYEmrqf7aH3tt5ZmxtKHOvUk0FFMAbevKG0NPdjC24tk99xOfU2JukCk1QZzgTv37KmUUp973LBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDzSPLI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDzSPLI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA9CC4CEEA;
	Thu, 27 Mar 2025 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108898;
	bh=p0Ih10xOVpTCmZXQkmnpEk3Kh0N4Zc+CdM0kPdasQnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDzSPLI/gpvlEfLA6Y8aQDgpDLZ862/e3DIg8wblfcOog6QMuNL8MXVKgxm2hxYbC
	 OVhOchZs0R8zzluNUuKg/7BmlBEgoYI+IkgeEKA8w381QpXZYWGoZ0G9ThpA31gJEW
	 dmH/ytH5v7tMo4FX114ShHWNg/wboFsypRLyqJIHjwVysQaBCrAvSB2WfFRmcn7zxH
	 BhiGxi73WaOMI5gAu/4FVDp/GLEp0Li/09bxs+U8sou7L0vvaRLzBvzpEKazDADKO4
	 T3JJbGdhXX4PLVbJBjfhg/ZhPCjt24La+GmSnfEyo2r0027X5g0bWL5MexOuf7luRw
	 2drL6YKT5K4Qg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 24/41] x86/alternatives: Simplify text_poke_int3() by using tp_vec and existing APIs
Date: Thu, 27 Mar 2025 21:53:37 +0100
Message-ID: <20250327205355.378659-25-mingo@kernel.org>
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

Instead of constructing a vector on-stack, just use the already
available batch-patching vector - which should always be empty
at this point.

This will allow subsequent simplifications.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 906fb45b9e65..4f23f6b4d51d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2906,8 +2906,13 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
  */
 void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct text_poke_int3_loc tp;
+	struct text_poke_int3_loc *tp;
+
+	/* Batch-patching should not be mixed with single-patching: */
+	WARN_ON_ONCE(tp_vec_nr != 0);
+
+	tp = &tp_vec[tp_vec_nr++];
+	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 
-	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
-	text_poke_int3_batch(&tp, 1);
+	text_poke_int3_finish();
 }
-- 
2.45.2

