Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91435226D10
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168526; cv=none; b=t7XLg17loDFz4rm0zaxBSDrwUxGikQng1ctpriKhbODpxuG0y22ro5UGBfSwdiOkJ4mFkbaZPqBdfr5PfeGEeFIpFcdI5Xhq9vkQG3rawgMW3qn38PAaDy8PhNre9vHL3L6YVjF/rBBfuzlfBk/msSHumuPiwLddJttD7vWBVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168526; c=relaxed/simple;
	bh=P/bBCR3/HDnjq/aCq0jw3PWY1OxhsZLcjt1pkx6Mco4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwWzqYrCuPlEjIv1l6DP8JllJQ/Ae29G8uN0LGtKE1B0ecW7j7gRJ5nJz0vTJi/nFu8YZfAwz7H9ELb4u9/vH+aLzRyOW2T5SUBYjPsd4A8k59ys7mSwuOHNYNwgs7DSP4IJaY1OOwSC+Ee8Yf/EIL00S+jXvVjhiorVrC8smoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMUmYLVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMUmYLVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764CCC4CEE5;
	Fri, 28 Mar 2025 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168526;
	bh=P/bBCR3/HDnjq/aCq0jw3PWY1OxhsZLcjt1pkx6Mco4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMUmYLVvfsKH/kUkIOYPLrjM5msT6/2eOZh2xLKd1jtC4MIPbpliTpwOqJ59SBehc
	 4woYkms2t8IcRfyQm16HL+zjoV37CZhl0KOb9oCF8A8ycKJ9s5faOzCfwZX4eaHqxU
	 vWC0kmjEK0XFyWB/09fupJPEApwrlHpmWszxCE03F8o9ItuGbmpRaMaWXiIdt91z2C
	 /wD5tLnLKWVVdsEWOr1xIDZ9htCMloz5qZE7MXpqWfg/L8T89VZ/XVuRCVnCmsw/RW
	 WAWzby7sRaqIdeXAD1vIsmvbRemliAA60l5Z+qDzIxErt6HNYcPNE7bfXT8cmywOFy
	 cnmjeQPx5YYlQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 34/49] x86/alternatives: Remove the mixed-patching restriction on smp_text_poke_single()
Date: Fri, 28 Mar 2025 14:26:49 +0100
Message-ID: <20250328132704.1901674-35-mingo@kernel.org>
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

At this point smp_text_poke_single(addr, opcode, len, emulate) is equivalent to:

	smp_text_poke_batch_add(addr, opcode, len, emulate);
	smp_text_poke_batch_finish();

So remove the restriction on mixing single-instruction patching
with multi-instruction patching.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f0351abcbfaa..4f880a435e98 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2892,9 +2892,6 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	/* Batch-patching should not be mixed with single-patching: */
-	WARN_ON_ONCE(text_poke_array.nr_entries != 0);
-
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 	smp_text_poke_batch_finish();
 }
-- 
2.45.2

