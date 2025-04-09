Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48F2144CE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230606; cv=none; b=U6OK4t566N1vgxERohQ401baa/xO4oqV8c4Bz45KiuyfZxt/VnqFXlrSyT8XqtGBbWPKcZg9FQxhZ9aLV0NcH0jRuRjtJLraoIhBN5cn7mk5DsFPKTpMOX8VgdNaTrRSkJlkX6DIxcVgQ9TUYJi0imXd8hraCOefBSCVrO6Ztjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230606; c=relaxed/simple;
	bh=RftBqIIl8lR6WHu6LqWA1bNchIhsxk7EQktxcdo8gD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVr5i3b0TwTIyx5s1SzdxC5vLEerzJC0IVPo6pO9wZa5JQtm7qRHcdv6QZpu8Pq2KEbfX/Wt0xwikU36Sna/vpdX1bu/xro5lxq1g0bUFUCI80TAyEUShel4T5tOxTcKruccGMmwZEa+FXt61p3/DZhzucnMyuZR8f3dThzNWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euX+sC9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euX+sC9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373F0C4CEE8;
	Wed,  9 Apr 2025 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230604;
	bh=RftBqIIl8lR6WHu6LqWA1bNchIhsxk7EQktxcdo8gD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=euX+sC9/Crwt4mi3qBvdi0MlyXHpm9PSSAWcNft6fe3CFnrh4slXgG3TjHvrMQLAY
	 I97IJCGUnP62aNhzqsqf+H2tUd7zSaQ3X6ZG2cHLrtIzR5cfl0k+4H3LEJQ3Up5Xa7
	 Wp3AfdBnPjVuDWX5mh/VIWiZ14uvHMfOFyvbuhHut+sjGvRE2pMFj0uQwQpfdPofPf
	 TNxlBI1gfwckqy/+lU8V8yH26H4e65CGvEcxg/RRdF0pEXtnXf2FijG6SFRZpwANNX
	 cAcRjT41WSmdZSyyxnsycfySpB+76TxXSJq+iq2Xtv3NeRVtyn9pSBZ7QMZy/Ipls5
	 twC+B2SzaFF/g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 17/20] x86/msr: Rename 'rdmsrl_amd_safe()' to 'rdmsrq_amd_safe()'
Date: Wed,  9 Apr 2025 22:29:04 +0200
Message-ID: <20250409202907.3419480-18-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/cpu/amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 8937923c9f81..0aefa41f1209 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -31,7 +31,7 @@
 
 u16 invlpgb_count_max __ro_after_init;
 
-static inline int rdmsrl_amd_safe(unsigned msr, u64 *p)
+static inline int rdmsrq_amd_safe(unsigned msr, u64 *p)
 {
 	u32 gprs[8] = { 0 };
 	int err;
@@ -636,7 +636,7 @@ static void init_amd_k8(struct cpuinfo_x86 *c)
 	 */
 	if (c->x86_model < 0x14 && cpu_has(c, X86_FEATURE_LAHF_LM) && !cpu_has(c, X86_FEATURE_HYPERVISOR)) {
 		clear_cpu_cap(c, X86_FEATURE_LAHF_LM);
-		if (!rdmsrl_amd_safe(0xc001100d, &value)) {
+		if (!rdmsrq_amd_safe(0xc001100d, &value)) {
 			value &= ~BIT_64(32);
 			wrmsrl_amd_safe(0xc001100d, value);
 		}
-- 
2.45.2

