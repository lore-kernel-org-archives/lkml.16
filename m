Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D819CC3A;
	Mon, 12 May 2025 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060267; cv=none; b=Fuft9zyqbhjDOL56P+LQjfwDiNIXP8n2+bM19BbPyF0LYBohrwVDsxLAuwGUrmF62ak7bciieSrDBu2yh5RTHYaoLhqhkyBCA4VUPGuU7TADTEx0psz8lbuxIsqdG9D7jKqKe8F4i9sI/S2ZTl+zzLJjX3BtZfHiNIT1An7A97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060267; c=relaxed/simple;
	bh=aUFomMuDIpryGPVNlZrH2Byy4M4unI3gVL2hG2PTGTQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uIWfIpgd2YeBJdsDgvFOTxGqYBzeMHOW2zCsy18m4JstYEFLX46Zg5FpNlLsl4BRgyt4NQsVHIczSqmT0p704qE7tnCkpsL2RhJuMtfULCPBFstA6ggji8aTkmGXTNAzheG1MKd2c5hPJ/boyZjHmh1vh+nGy0M+YguQcwLohSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qzc4Qy2A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ypm/AoJg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qzc4Qy2A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ypm/AoJg"
Date: Mon, 12 May 2025 14:31:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747060263;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxiOpX6kqQSbYHlwI4xmpfbyUW4MGMUa7Tqd5TwcSvg=;
	b=Qzc4Qy2ArLZMmE4Evs9zpbc7ZnNuB16xibXaKeJdAGgY8E+azK2ZWSECbb66jd4URdWVhi
	aNyx9yHRxT7fOOBaCWUIVlXWDtFVbVPt3ig23Neq3IHHXQ4HPFUs/iLmxZ2+DcNBFH2oCQ
	258xeOOOGaC+Xab9m3e60vLDA4IT/sUr46KbTLe6Ttqhh2nqa4KMuCxE/LNa1azRt8TCbO
	ltuWZZEdZEkneWzjkPAk5hx1NQG5eZBo+U6d1IJOwj1NZXzwASvOQVxL7eNSysVZWTQFf1
	LRwiR0eXDBEng3Zi/ZYJswUQsQejse8E1lsUnl2BM5+5PcRTPaJR7BGf8piIeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747060263;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxiOpX6kqQSbYHlwI4xmpfbyUW4MGMUa7Tqd5TwcSvg=;
	b=ypm/AoJgPYUMsW2sUJVhSHKsAkN4Uam5xeBdcwkaRDAJZ8uOrWXTz6KH4Vf+bbDdL8TSN7
	69a0MKoC5FcA2sAQ==
From: "tip-bot2 for Jiaqing Zhao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mtrr] x86/mtrr: Check if fixed-range MTRRs exist in
 mtrr_save_fixed_ranges()
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250509170633.3411169-2-jiaqing.zhao@linux.intel.com>
References: <20250509170633.3411169-2-jiaqing.zhao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174706026285.406.13641034613218376274.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the x86/mtrr branch of tip:

Commit-ID:     824c6384e8d9275d4ec7204f3f79a4ac6bc10379
Gitweb:        https://git.kernel.org/tip/824c6384e8d9275d4ec7204f3f79a4ac6bc10379
Author:        Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
AuthorDate:    Fri, 09 May 2025 17:06:33 
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 12 May 2025 13:04:40 +02:00

x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()

When suspending, save_processor_state() calls mtrr_save_fixed_ranges()
to save fixed-range MTRRs.

On platforms without fixed-range MTRRs like the ACRN hypervisor which
has removed fixed-range MTRR emulation, accessing these MSRs will
trigger an unchecked MSR access error. Make sure fixed-range MTRRs are
supported before access to prevent such error.

Since mtrr_state.have_fixed is only set when MTRRs are present and
enabled, checking the CPU feature flag in mtrr_save_fixed_ranges() is
unnecessary.

Fixes: 3ebad5905609 ("[PATCH] x86: Save and restore the fixed-range MTRRs of the BSP when suspending")
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/20250509170633.3411169-2-jiaqing.zhao@linux.intel.com
---
 arch/x86/kernel/cpu/mtrr/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index e2c6b47..8c18327 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -593,7 +593,7 @@ static void get_fixed_ranges(mtrr_type *frs)
 
 void mtrr_save_fixed_ranges(void *info)
 {
-	if (boot_cpu_has(X86_FEATURE_MTRR))
+	if (mtrr_state.have_fixed)
 		get_fixed_ranges(mtrr_state.fixed_ranges);
 }
 
