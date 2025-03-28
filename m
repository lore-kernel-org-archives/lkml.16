Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A561C0DED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168465; cv=none; b=BgUJVHAeQZbIt4zM76U7UKm4Q0PnUhx73GyP0/WRERDDlUtmg4zU+Lk1r42t3U8U+du/yR58I+gcWvgEhJB6X+IMm0BGsQ0a8BHa7CSV17p3qtaT1ad0RUob39NcdqtS3N/vLTfy/HEi5yvRAKQabTe2fvtKVMzIj+ezAds32aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168465; c=relaxed/simple;
	bh=hO8sGOUVr2S9ao7ZDOeqVbU0PtZL6iu3l8o/IHmYucM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWVMxF7Yf0dIpukMz9q804GSYHMtxnANpYWfwzn+Kh0060flRtW5nMrE1o4mn5SXhapu4igRyQhkQAbrTK8IV+ZfSQgS7mCGTAYmLHa1mqoYjtfdhFUBWcKafOXgSicsYVqRu2KeuOIVSGWZFq+68yQgOKSIZZ0Xh1hEwR0Wf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0Ud4n3Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Ud4n3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19323C4CEE4;
	Fri, 28 Mar 2025 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168465;
	bh=hO8sGOUVr2S9ao7ZDOeqVbU0PtZL6iu3l8o/IHmYucM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0Ud4n3Y/wqNMXLuP3pft6F3fVQ0zWzInHdLIi1/orIFTjjuAZxdUT/kZv5JJkPAA
	 6itZ/o6OA+IQ8cZL4KknJIZkY8sJ841zukjP1MOyT8TMJwDQ0VBLLgwG40W7YLgbcT
	 JwDovzdwt66SrtQIPXw0sBHDn8GmgSfatcTuA7eRz7NGbn2lQ8cSZszhuSr7+vdqGi
	 z/YMqHPaFIHzFvQlU4wxuKsENYbmb5eHLgQYVoYxCZyNsSq5Gsz0KIIjKTl81BCLT6
	 eGYMfN+34CqyoE4rbNGAudAtjJaEj1zHhl5HlVZ0EbPbi8vG3dpoTb1qMOZbKcQVdT
	 OB49hPyaNpdlg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 09/49] x86/alternatives: Remove duplicate 'text_poke_early()' prototype
Date: Fri, 28 Mar 2025 14:26:24 +0100
Message-ID: <20250328132704.1901674-10-mingo@kernel.org>
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

It's declared in <asm/text-patching.h> already.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4aa407af8648..056872aebe6e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -176,7 +176,6 @@ extern s32 __return_sites[], __return_sites_end[];
 extern s32 __cfi_sites[], __cfi_sites_end[];
 extern s32 __ibt_endbr_seal[], __ibt_endbr_seal_end[];
 extern s32 __smp_locks[], __smp_locks_end[];
-void text_poke_early(void *addr, const void *opcode, size_t len);
 
 /*
  * Matches NOP and NOPL, not any of the other possible NOPs.
-- 
2.45.2

