Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B6291162;
	Mon, 14 Apr 2025 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637303; cv=none; b=V9VoOD3hfbfljZDbyE7J22GhYBg+cXNlyLL6vYign040r3Q29hqtUPWSB7YHv1ablQDHn512tQGqgltrjt0Pg1taWN7Ah6IyTxp92EohrtTTFDOUHplKvZXK0Oy+4Nqpk49vtGZM9qawDr2EdIxyFhSmOQRAbGFozWzTIIhv3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637303; c=relaxed/simple;
	bh=49YGaSD6SeXvqANPAfCZgo1Q9VCPLjXUjddcErUMfVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jBpFWQciQYw2qKsqOuyhVccMgq6EGuMKx6x0prHsvwRG7BPiXBQOSPWRtuc4vbrGDm1mf1gFWGoG7jmV9m87fpakSRg53vyNTsYX93fNrwnfCMw8edA6B3vfKsHnWmq88/4Bl/MiyDPhSc8BXG9m1qI4wdyCRVaMeqPr88tu59Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8TSaqOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8TSaqOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20C6C4CEEB;
	Mon, 14 Apr 2025 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637303;
	bh=49YGaSD6SeXvqANPAfCZgo1Q9VCPLjXUjddcErUMfVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8TSaqOpYZ2tAgdvr0o9QpoOSTGkqH7+YRyawCWQfV7JIOCFxq/ZdsYYfwt8tbDV+
	 hZMw9nHf7NQsslKKVHLHy9psaPbFHkZMSmIEk/AaEfq2017tjqBxxYZb5qpG74EXAa
	 2i3ktcOiTR887yaX+wt7FmXeCdUisDCahaWzSGkGw6DjAHNOxcvfa74s41r98OeABb
	 jknuUCEGrhRHLFZi5uimbgxHSUr0FdxpuSJEgD6/b9ldlsswCFc5J27UoG6waJ1ksG
	 iNmzii0k2DkKOs+b+eeLmG8xIVcQkiFLGfmVm/H4X1PjZYPppGxlgJ4mhRyGl9GWqA
	 l4GrGdhYs7Bvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Subject: [PATCH AUTOSEL 6.13 23/34] x86/bugs: Use SBPB in write_ibpb() if applicable
Date: Mon, 14 Apr 2025 09:27:17 -0400
Message-Id: <20250414132729.679254-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.11
Content-Transfer-Encoding: 8bit

From: Josh Poimboeuf <jpoimboe@kernel.org>

[ Upstream commit fc9fd3f98423367c79e0bd85a9515df26dc1b3cc ]

write_ibpb() does IBPB, which (among other things) flushes branch type
predictions on AMD.  If the CPU has SRSO_NO, or if the SRSO mitigation
has been disabled, branch type flushing isn't needed, in which case the
lighter-weight SBPB can be used.

The 'x86_pred_cmd' variable already keeps track of whether IBPB or SBPB
should be used.  Use that instead of hardcoding IBPB.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/17c5dcd14b29199b75199d67ff7758de9d9a4928.1744148254.git.jpoimboe@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/entry/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index b7ea3e8e9eccd..58e3124ee2b42 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -18,7 +18,7 @@
 
 SYM_FUNC_START(entry_ibpb)
 	movl	$MSR_IA32_PRED_CMD, %ecx
-	movl	$PRED_CMD_IBPB, %eax
+	movl	_ASM_RIP(x86_pred_cmd), %eax
 	xorl	%edx, %edx
 	wrmsr
 
-- 
2.39.5

