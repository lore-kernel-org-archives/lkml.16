Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB99183098;
	Thu, 15 May 2025 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325102; cv=none; b=u1ZtFnO0CUBhltQOPePlIFF4TcHPZeaJVJvCk33+Zq/Ns0Q23uWWSWNBbsVRdiryliHCUylLfEWNB/VIKzitIDOt61/c/eMb8aY021P6riPk2WMphk9zRqnMeNo726mAyRmi2Q0NKHogckPqs+9Wg5YCm4KN1btEWPtKX+GZxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325102; c=relaxed/simple;
	bh=nmXD9VX4Vqx1k0kpjG3eWSDmEb4T7U9TcKdZgRykNdc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rT0dhH/Cblmf7JseUyw+S/XyW5sCqpjSQL2bzN9UXSmcRTKGrgljNALvORZJU5bU4Zmy0QPXBmI3ACiq8g6nURvLUkrpAK8Mk2lHYUbMv/50vTAmishNP1vrPpRDFyeHKWBnHw18OpIfeu5TBtt0Lqz/I1d97u8ShR0xM1Ow23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IHICkvLC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3mZw8uA3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IHICkvLC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3mZw8uA3"
Date: Thu, 15 May 2025 16:04:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747325098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bChncj96Y5n1ySf6ezCFB6jma8uYNwDQ41JCxjM4Zhg=;
	b=IHICkvLCKoISJCiVrpV4RncFHgxCJV2dk1ef+wGrjN90dLpSUhFHVdP/98WvJZmKPMwM0e
	lZZWwr2DQEHX5un6Cj1oXwS/WZS0cnsdqqKRWwqeoxXfw1dKCGWbpKcnL9NGDD91X0Vl+l
	rtT9arsX92mzjnjQ2GtLkBueExJPrOGp/e7ho46OYZqswIR7kaVMFCfZA2smWDxnQIFi/x
	zOunWQYsps3usTjweA2Zn4QW6IGoWF7gBMIZsIqjflfKs0MPHvudCBM0813BZj2JwnClx0
	SqM35TbgL4hGNN8YacetRlS8iQbK/1uidLRM4qWHa4HKRyMLlcx8GfaRu/Dkxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747325098;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bChncj96Y5n1ySf6ezCFB6jma8uYNwDQ41JCxjM4Zhg=;
	b=3mZw8uA3Snv5SpJsUVVdBvjgvChm1LiVJtomiZ9UWm5Pwl/JfTsH4/MfOClfV7R1db+twg
	UyilllNzUqn0PeDQ==
From: "tip-bot2 for Ingo Molnar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/core] x86/msr: Add rdmsrl_on_cpu() compatibility wrapper
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Xin Li <xin@zytor.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512145517.6e0666e3@canb.auug.org.au>
References: <20250512145517.6e0666e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174732509785.406.5208741014442312924.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the x86/core branch of tip:

Commit-ID:     baad9190e6465fdbe458f59cf04c2b2032ec4797
Gitweb:        https://git.kernel.org/tip/baad9190e6465fdbe458f59cf04c2b2032ec4797
Author:        Ingo Molnar <mingo@kernel.org>
AuthorDate:    Thu, 15 May 2025 17:49:16 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 15 May 2025 17:58:55 +02:00

x86/msr: Add rdmsrl_on_cpu() compatibility wrapper

Add a simple rdmsrl_on_cpu() compatibility wrapper for
rdmsrq_on_cpu(), to make life in -next easier, where
the PM tree recently grew more uses of the old API.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Mario Limonciello <mario.limonciello@amd.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Link: https://lore.kernel.org/r/20250512145517.6e0666e3@canb.auug.org.au
---
 arch/x86/include/asm/msr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index a9ce56f..4096b8a 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -329,6 +329,7 @@ static inline int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
 /* Compatibility wrappers: */
 #define rdmsrl(msr, val) rdmsrq(msr, val)
 #define wrmsrl(msr, val) wrmsrq(msr, val)
+#define rdmsrl_on_cpu(cpu, msr, q) rdmsrq_on_cpu(cpu, msr, q)
 
 #endif /* __ASSEMBLER__ */
 #endif /* _ASM_X86_MSR_H */
