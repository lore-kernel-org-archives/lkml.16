Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE72797AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383983; cv=none; b=iJNw8y+ee4sFy4M4hG4etUSxDhjyEMoPAvbupugO/mnAPRbWUzjSEMW/IMN2Gy66efg/D5By+FRbgdNhe5G5zd9Ic4cG+po9ot2hGOwXKU4M/Is9XnHRyKgsPgQLgWYb6r4Zdii8urio4npzWj1Gmawd7/RpngQudV1MfbQ+seY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383983; c=relaxed/simple;
	bh=aVg2cJv9wSlB+Ifm0onjtL26hKkRkwYqLwa+gwkEP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AuRJ6tvw1XHZskpJ72m7vrGT5Siq4MqtUCUCjpvI44DWz5+4+Qk0tMvCfi7Zs8g+W1ecoaelYM+knhES/O1So2DXumPdksbeyMrNHS/r9wyUWre3NACFPf2onC+sy2Ni8ffUStBdYYbycBs9qKYPW59Hi3JRMX0I1WI0XIpWtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRBQhG4l; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRBQhG4l"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a510432236so2557665f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383980; x=1751988780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrLv8E2JzJaKuEQhctmJvd3DUiMTxFOf1wZ25rSjEVo=;
        b=CRBQhG4le6OV98QI1qnk/dC002sRE6g1S75Pn5yjgVWeBTLp1QIx6TzR6cJVMu+9/L
         rn37WdQW7MxRcnSVrkXE2PnjMNznfMkF6EXiQVXiZIKnfYQN8gm3MU631oyHo4FoxnV+
         u21lXp/CAHwudss8SuXxxjkzSW4orIJVNDsP6mcvuVgiwjLFBwm2Ks+MxNDj9/LASofI
         omgB5tkV51ipO5jgbLFxR8tXAON8+YyUVK86chVXTdERH5MCW7rECpPYgRQLhqtwP/El
         8jvC+RvI6RGW/XkgXibCdMFn6KSfoaDXBlxUHwmi/NPFaz9ta0SzFo574XowZjH/s21n
         jHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383980; x=1751988780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrLv8E2JzJaKuEQhctmJvd3DUiMTxFOf1wZ25rSjEVo=;
        b=VDF8qxmZfatt59gfK2Jun7XiB0HIznsLyJIuXh2c5gp+b1/cchClviOSje2u025XGC
         qehj8XSfGZWEv1gAn/msHCvfHAaVd4Aml5+AKZkrgOP7Njesj8v5C5sp0pvrFUZe8VgC
         5f4w+B31/MXCpRQs7AaBxBvA9odTImym9bq+ub6l9h5mjK+xa/XAMTCYmIMLGGf18Nn1
         Yy3b5r5aTny+zmLNXVjEwuHIJznWblTuuCv8OxcOHlcg/0TAjZxZoiihW95nxchGRVJn
         4hf0/uHVmaVHKrEuXGdZ094tqoiog6WINcEeajT+Yo7O57hjKlWjo5XKq18XVrwnL8oI
         hsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhXrSsROcg57mp5L5p4MXibOM9r2E8N5fIROPVx1+2uRa4wPRra7Sx1qurwRsAS/zvs8j1zZCwRv5RlHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Lz0LwEnpIAam6aBHbaPpJNmVmMEidsjQnZSbK24UODTzXNIe
	ZZulzTV3Enre+RUCmoomVPQyRKwakkdlyvE3T+qGsgVFJMINxWK/yvqrhxe76ctAjhs=
X-Gm-Gg: ASbGnctH4SdNIQ6MbtVSOXYiZlQh2kWTWXF7iq4NYDBllBHMadibVhxdsPZaO3OQT+Z
	1nglB+VhDTC20cFA/Vk9elFsiT+H8h9WtQ1pPw9r+92qbYGg+w+m0G1sfxG8McIn0CXOLxXujR1
	g6Za2ybcrW7yQmTIsywl/ns/ZMiYpgtID4bs6hcY1bZUu9EofPIF7qjp2eNPhyq355tBsQcQ2Wn
	pAv6V4iqj4QuaxO8ERTeTIrfn1eq7v1foWmB7VAk0M3CrvURiz2SAIMtZGr4jcBMDgpXp0+ANjC
	lLx6HqxHvszoaXJ0wYsHXzz2kIb35v7CRF8XT+ncyYP/8u2icxmrcfBx++0ZGppEXXaHCaptM9l
	OEUQ6yQ==
X-Google-Smtp-Source: AGHT+IGhfDvVLxXK0g4NeIbM0C+Rf8R4M1m1N7M8/7K4QfeNkwE1w4jj6lEbfgM0B+KT2OK6Dd4PJA==
X-Received: by 2002:adf:9dce:0:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a8fdeffa19mr14766121f8f.33.1751383980385;
        Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 01 Jul 2025 16:31:58 +0100
Subject: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

DEN0154 states that writes to PMBPTR_EL1 or PMBSR_EL1 must be done while
the buffer is disabled (PMBLIMITR_EL1.E == 0). Re-arrange the interrupt
handler to always disable the buffer for non-spurious interrupts before
doing either.

Most of arm_spe_pmu_disable_and_drain_local() is now always done, so for
faults the only thing left to do is clear PMSCR_EL1.

Elaborate the comment in arm_spe_pmu_disable_and_drain_local() to
explain the ramifications of not doing it in the right order.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 6235ca7ecd48..5829947c8871 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -559,7 +559,12 @@ static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
 
 static void arm_spe_pmu_disable_and_drain_local(void)
 {
-	/* Disable profiling at EL0 and EL1 */
+	/*
+	 * To prevent the CONSTRAINED UNPREDICTABLE behavior of either writing
+	 * to memory after the buffer is disabled, or SPE reporting an access
+	 * not allowed event, we must disable sampling before draining the
+	 * buffer.
+	 */
 	write_sysreg_s(0, SYS_PMSCR_EL1);
 	isb();
 
@@ -661,16 +666,24 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	 */
 	irq_work_run();
 
+	/*
+	 * arm_spe_pmu_buf_get_fault_act() already drained, and PMBSR_EL1.S == 1
+	 * means that StatisticalProfilingEnabled() == false. So now we can
+	 * safely disable the buffer.
+	 */
+	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+	isb();
+
+	/* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
+	write_sysreg_s(0, SYS_PMBSR_EL1);
+
 	switch (act) {
 	case SPE_PMU_BUF_FAULT_ACT_FATAL:
 		/*
-		 * If a fatal exception occurred then leaving the profiling
-		 * buffer enabled is a recipe waiting to happen. Since
-		 * fatal faults don't always imply truncation, make sure
-		 * that the profiling buffer is disabled explicitly before
-		 * clearing the syndrome register.
+		 * To complete the full disable sequence, also disable profiling
+		 * at EL0 and EL1, we don't want to continue at all anymore.
 		 */
-		arm_spe_pmu_disable_and_drain_local();
+		write_sysreg_s(0, SYS_PMSCR_EL1);
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_OK:
 		/*
@@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 		 * PMBPTR might be misaligned, but we'll burn that bridge
 		 * when we get to it.
 		 */
-		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
+		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
 			arm_spe_perf_aux_output_begin(handle, event);
-			isb();
-		}
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
 		/* We've seen you before, but GCC has the memory of a sieve. */
 		break;
 	}
 
-	/* The buffer pointers are now sane, so resume profiling. */
-	write_sysreg_s(0, SYS_PMBSR_EL1);
 	return IRQ_HANDLED;
 }
 

-- 
2.34.1

