Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F141E47B7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230607; cv=none; b=edstIdSoQ8kK0iK/MovJ7uGMgUpW8hEvsHVb8wTFs1pZF6lrEWk5eJRsli8e5oqBIV2djkmg8+QDKMnxRULI6hFmB/JhS6Uus1pZpv6s/bkbJjY9bVoKh6tbeeKGek1TQ63stP+HPOzJAsvMhp6VS45mPf5BF4I7uui4cG867LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230607; c=relaxed/simple;
	bh=pSeoDTBd1OH7UwJWFmo3t2mqxBTXN7ALeSJ4YNVPHx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUvPypP0Q9qGUWNs1TqDausjxQoxCsjK380niCfPPJ1+AH9DPLx3W8ovMENwSicdzSxIJr8JAgH0/tWI+OHKktPdUmbT5c10u5nuDW/NsccnQHdnM4ctEUuSZj8hkRMHziUj0G/pqvYLUxfreIy/MgLdgvBkd4WsWQZfUn0Jay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLdasfWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLdasfWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017EFC4CEE9;
	Wed,  9 Apr 2025 20:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230607;
	bh=pSeoDTBd1OH7UwJWFmo3t2mqxBTXN7ALeSJ4YNVPHx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLdasfWZEl6nXuc6VJa8jCpLdKHoHEgdfJhZBlp1TL/2IFfY4pkY54CdY3L/S72iM
	 qghBNTyI9yTn2+CEdd/gcwywtEVQsESPGYGWrhKKQLai0HIRiCU3WyzR/zDZuCIL2R
	 Aq79xk3f8F51rC6vMhADvPfSE9huAN3fu1uP3UIP0VAyhzszRkh/hmmmj19kKReY6U
	 vPFp8jtZvhBMIiLZNCkE4DFWtMLM9kMdD7T2b/EvCFiBqPc5sANw08K80L1O+WkOXm
	 A1mtdWGMFrO4iJyzoQ7HJ1MH3Nqs+jUBN+T0NYwVgfjlUOgsBuQGVcDWQaHqxEljo9
	 IthLB3uoKvm6g==
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
Subject: [PATCH 18/20] x86/msr: Rename 'wrmsrl_amd_safe()' to 'wrmsrq_amd_safe()'
Date: Wed,  9 Apr 2025 22:29:05 +0200
Message-ID: <20250409202907.3419480-19-mingo@kernel.org>
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
index 0aefa41f1209..0bbe79862aa6 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -49,7 +49,7 @@ static inline int rdmsrq_amd_safe(unsigned msr, u64 *p)
 	return err;
 }
 
-static inline int wrmsrl_amd_safe(unsigned msr, u64 val)
+static inline int wrmsrq_amd_safe(unsigned msr, u64 val)
 {
 	u32 gprs[8] = { 0 };
 
@@ -638,7 +638,7 @@ static void init_amd_k8(struct cpuinfo_x86 *c)
 		clear_cpu_cap(c, X86_FEATURE_LAHF_LM);
 		if (!rdmsrq_amd_safe(0xc001100d, &value)) {
 			value &= ~BIT_64(32);
-			wrmsrl_amd_safe(0xc001100d, value);
+			wrmsrq_amd_safe(0xc001100d, value);
 		}
 	}
 
-- 
2.45.2

