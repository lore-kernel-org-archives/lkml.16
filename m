Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3121421A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230565; cv=none; b=A4x8RXeh0CMpmD7ro7KFxhuq/sv8XiLJZF/Gcfeu01+O4IAzFTUALksaL5T+GjvIrBvtTRxN2KTem/XTLC6RCmZ6ugB+iLAHCIhbob4aVcK7lRQ5vn/11RQF5IMf9XXfqMxuxJ/PddNWWAbGjLwn5/bmfNdqFSIFsNL7XCSWY0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230565; c=relaxed/simple;
	bh=1epFW2JgoDcxUAgVOgIpZ7+Uo7W19iDq3c6pvdh5vJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1LWMb0WRHyXzA/C2upixD9d64Y4Es7aEdlKFxaGvpcO6T63OrmyJONKttOKqExH2H7maHh5akwFTqWItHs38t7r+WjBThgMTsP0ok4b/bKhKd4tc4S13IE+Z4AWbUCP/47hlJ9p/b73i9mU+wgVbAmc9KZERzPRfI+aF4Vs724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4LVcIzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4LVcIzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D367DC4CEEB;
	Wed,  9 Apr 2025 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230565;
	bh=1epFW2JgoDcxUAgVOgIpZ7+Uo7W19iDq3c6pvdh5vJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4LVcIznWVLIcnHJtG6ubtLAFUnB7/92+brJGHNjTT5zxYQO0AjYXzjyMPE/3I9NU
	 ndlsJosr/D+xZ3eV1qbLiNF4aLZ1s53HAtvKmsTqoZOZCRhNPjy/jsPeuV8TFI1wxm
	 b6JlcttaLPsVZNH+7P0Xa1vmD/hmUBLVizjJFfum7KARQrHc3x/dYBHRDkMVGZVCwU
	 vekRgL4amkUQf/miIzh7ubzEh20HnaPT9mtggJOZAJrXFulJC0+mndZgy1aS6uUBc3
	 yjlclkNo2W/hzfe91PN/Dqivr89pTH4plAoZN8Hc2tedz9HaKDtyOBK2LguSPGAE0h
	 2yNfeRNvHNzrQ==
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
Subject: [PATCH 03/20] x86/msr: Use u64 in rdmsrl_amd_safe() and wrmsrl_amd_safe()
Date: Wed,  9 Apr 2025 22:28:50 +0200
Message-ID: <20250409202907.3419480-4-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/cpu/amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 79569f72b8ee..b2ab2369c9cb 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -31,7 +31,7 @@
 
 u16 invlpgb_count_max __ro_after_init;
 
-static inline int rdmsrl_amd_safe(unsigned msr, unsigned long long *p)
+static inline int rdmsrl_amd_safe(unsigned msr, u64 *p)
 {
 	u32 gprs[8] = { 0 };
 	int err;
@@ -49,7 +49,7 @@ static inline int rdmsrl_amd_safe(unsigned msr, unsigned long long *p)
 	return err;
 }
 
-static inline int wrmsrl_amd_safe(unsigned msr, unsigned long long val)
+static inline int wrmsrl_amd_safe(unsigned msr, u64 val)
 {
 	u32 gprs[8] = { 0 };
 
-- 
2.45.2

