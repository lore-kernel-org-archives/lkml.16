Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8701F4727
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367694; cv=none; b=dHYdRVqZ8IRQV4u3iAhVSgElm505nUixpV1Z5eQAtMzb407bhtsxTj9Nq1zJVd4/UhGckKFEYTNmde77iOksE0R5GUn+Pw2oNwXj/KZk2VH1Zd0mpZdJ4x+xjhHudJ4VBQbH/55zzoPf5WwQkJDBV+1UiyuTf0/VNqcld4Xbng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367694; c=relaxed/simple;
	bh=9922XPp51cg7DMjr2nDLHa1eIeCoT1mMNX2UzcvHYqo=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=jVDnj2FoWAod2dlc8n225ILnSQxGqLZHQCvA7YWaLHwcNpHBp17EIqnnanMfLDqlXUIRaXnNpj7vaDUCRhtNaH7v1WcI2zg7rYmDm6kX49DQD1RYeXkGEfGZY+r9XVParnvuDgUgimsww8hMHgSqHnIMoKXTMe+bMnVJHc0ZCrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FMWL5VIY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1l/wHZLA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FMWL5VIY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1l/wHZLA"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749367690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=+k5TiqwSLfoNyX0maVOhUhKTO759kIQaQtiKW+Xc3Ls=;
	b=FMWL5VIY1ufELCcfYvupEZVwgYwIJVoUptWKq7K589VgAzHyh2rurbXU2YzxUyD5gu+aBb
	44DME/QXIyHLMrjtJdS0FobfilNVr+bseBqRm+nPa12auWeMrhn4PjWnlf/ZElVcZZ18yZ
	d9hzYpGcrt4q7WJyJT0xwSdtPYFWBjxWcVGBku6/yni0UYUPEHJ0jc6nTY7jX8M+XIKlrD
	5YNJ9twKqB/yM+iWbvYDnqIx6ANZsTTZmdbQxGBCg6PS9wCyHxPdpQBSljg9qD/a4eWajB
	qfqy9CvqxegXONBrtduvoKwwPH/sOo7rcM8triV1VKpJjBIBJWewTk1d1plIYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749367690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=+k5TiqwSLfoNyX0maVOhUhKTO759kIQaQtiKW+Xc3Ls=;
	b=1l/wHZLAGuGdY8vmEW89TL8ZNnM4yeEjzKmW+J8EeL2tmEiL9Jy68h4J7W+8CFudpYbYo4
	kLXjqx8rcOHBmnAA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] perf/urgent for v6.16-rc1
References: <174936764731.749406.17114868218275391074.tglx@xen13>
Message-ID: <174936764909.749406.14078984601089344731.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  8 Jun 2025 09:28:09 +0200 (CEST)

Linus,

please pull the latest perf/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025=
-06-08

up to:  86aa94cd50b1: perf/x86/intel: Fix incorrect MSR index calculations in=
 intel_pmu_config_acr()


A single fix for the x86 performance counters on Intel CPUs:

  The MSR offset calculations for fixed performance counters are stored at
  the wrong index in the configuration array causing the general purpose
  counter MSR offset to be overwritten, so both the general purpose and the
  fixed counters offsets are incorrect. Correct the array index calculation
  to fix that.

Thanks,

	tglx

------------------>
Dapeng Mi (1):
      perf/x86/intel: Fix incorrect MSR index calculations in intel_pmu_confi=
g_acr()


 arch/x86/events/intel/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 466283326630..741b229f0718 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2900,6 +2900,7 @@ static void intel_pmu_config_acr(int idx, u64 mask, u32=
 reload)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	int msr_b, msr_c;
+	int msr_offset;
=20
 	if (!mask && !cpuc->acr_cfg_b[idx])
 		return;
@@ -2907,19 +2908,20 @@ static void intel_pmu_config_acr(int idx, u64 mask, u=
32 reload)
 	if (idx < INTEL_PMC_IDX_FIXED) {
 		msr_b =3D MSR_IA32_PMC_V6_GP0_CFG_B;
 		msr_c =3D MSR_IA32_PMC_V6_GP0_CFG_C;
+		msr_offset =3D x86_pmu.addr_offset(idx, false);
 	} else {
 		msr_b =3D MSR_IA32_PMC_V6_FX0_CFG_B;
 		msr_c =3D MSR_IA32_PMC_V6_FX0_CFG_C;
-		idx -=3D INTEL_PMC_IDX_FIXED;
+		msr_offset =3D x86_pmu.addr_offset(idx - INTEL_PMC_IDX_FIXED, false);
 	}
=20
 	if (cpuc->acr_cfg_b[idx] !=3D mask) {
-		wrmsrl(msr_b + x86_pmu.addr_offset(idx, false), mask);
+		wrmsrl(msr_b + msr_offset, mask);
 		cpuc->acr_cfg_b[idx] =3D mask;
 	}
 	/* Only need to update the reload value when there is a valid config value.=
 */
 	if (mask && cpuc->acr_cfg_c[idx] !=3D reload) {
-		wrmsrl(msr_c + x86_pmu.addr_offset(idx, false), reload);
+		wrmsrl(msr_c + msr_offset, reload);
 		cpuc->acr_cfg_c[idx] =3D reload;
 	}
 }

