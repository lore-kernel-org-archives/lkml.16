Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D920F08F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071412; cv=none; b=TeCcO0DP3DuRdvWjZwtbd7Bh6FTIuqOVO7ezzbSU2emuRp/BtDolCNQ+NCBqT3PkRSNGmnNZyEe5nvcTXwoezYY4ThbLk0YDJ1ZcF2jJpnJnhhUoeELSd3cLkpUq0sVb76bH0wJCfj5cj6tIh/J/fB2KtApvIimO8GHgSUVEUMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071412; c=relaxed/simple;
	bh=qshCScgV/MqD57qKV2BMnny4UAyTRFWht447HRdrgdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qn1r01mdGoMJ4mtUQvgVkemiSETCN6L1oErZHrEa49/rbuiIP/OWCOhsKVJy8KzmFzouI8w/GaSw0WNonpTCcxVax1aVWVrozvz9UOmVOIETe/PMTvzIXfcgzm+4WlynPImw5mIL72PPIzkr3fL77cpxEMkoV80he62Oc3SADxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF2n7WU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF2n7WU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3427C4CEEB;
	Thu, 27 Mar 2025 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071412;
	bh=qshCScgV/MqD57qKV2BMnny4UAyTRFWht447HRdrgdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eF2n7WU9ZRoQp08tdF99Zheo0scKhzoO3o1/fpYgH/2/0hHbUmJx+/wAvZ3MXgNnN
	 2Zh35UYzIU/XAeMVmvB8E/0O3WSYAm53FnBTuC0Qdzmu1gsHAem0O6MuctvlR/ET5/
	 bfTvjw2KB4tHGV5RfPTIrI+bFteKZut71u0XL8mTGRzivv3EXTP1hIR1q5+54/jqok
	 yXhC0GVWKh0l3etvTrkMCuT9vfNox+91zfHLTlPx1xoQXhEoS0yf8pY5rCNsoZm4gb
	 PH7+7CiRtpG88vj7zWwcL1x3Yjr17ks3KPNjBbFFCmbs0y9cS9vSeTX2IY5XiVZbTl
	 U14vre9vU/ciA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 06/14] bugs/powerpc: Concatenate 'cond_str' with '__FILE__' in BUG_ENTRY(), to extend WARN_ON/BUG_ON output
Date: Thu, 27 Mar 2025 11:29:45 +0100
Message-ID: <20250327102953.813608-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/powerpc/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index b5537ba176b5..a2120fbedd09 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -55,7 +55,7 @@
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (cond_str __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
-- 
2.45.2

