Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50826FA4F;
	Thu, 10 Apr 2025 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279574; cv=none; b=QZguGyxzv1qouZUFhYuZOXuOYqG67RZrbuYCtAS/8Lu87OUBIncWgavHlHn4ES8GHCUb5lDyXRrU6irT7gxSJ/z1cp+70NrZNqIUAODSpCftGtlodqIfi5DSqgDESkjf0Et4fOKSVtsYrHvLiN6JH4R/JQZXqWHJeF8kwR64Tbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279574; c=relaxed/simple;
	bh=j2Lix0PbqGcJ+AojNTct2w1fKgg+xU8YgZSdQfGYyQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gNhSqN18l6XrTzl6MhPX3se0yCcR+IN4Y2kruBOmkvgUjU23+kYVqoF1UKiGcLqQ3by2+2WpTbelR+OZIIcyeAxj0RbBu/qtHg9mhi0+xG0sc977McU6Dew7W9OUoN95Xooq5yT95sonvxQ+p41FEIuOlghrbbskRQbdiEjgEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=mcgmNnVk; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="mcgmNnVk"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A62MMI009620;
	Thu, 10 Apr 2025 10:55:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=/
	gRolmKuKuolB7VbWZVEhNf4yILPrIiiDaqW3beae/o=; b=mcgmNnVkLNJH6IeXn
	5QCWgxX6LVagh758D+Jx3iQSUwsyFA8v5lTjFrQASh2LrU8yvPneYTOQ6+gpeDa3
	FNoaTJhzq8J7Oh6t9IOSe0uE3Em0uH1MoP6kJwggXjF28D1vWGRBzm1WtnDCQPPq
	TVvju5EIMchQhieZnC8cczEfQSWqs8lfM4IWhI7BXACeOGmFEcAyht3laEHHbgjb
	Qd5Q3z0rCppiA3dyGbo9B4/9B9N46mf75RGHCTdZRh9US/W0Cfb7f6sjjjmEgZdh
	tO9gBVjSR/th/ZKSuQi8ASubrg4SocjcxMQVrgvT1ACVO7vcLStxM4mBmc+6+NYx
	/N9/w==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbgdy-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Apr 2025 10:55:21 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:20 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:05 +0100
Subject: [PATCH v6 06/18] drm/imagination: Mask GPU IRQs in threaded
 handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-6-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=vecjZhg7SN4KmIZe97DRW0T/wjjhYdfJmFTLlsweF5g=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9qYv36i0/WdOS/tFxTzhmyXlD/4wvjwswWqthZ/X
 vqHHLl1vqOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmImbF8FdAlsknZf7C4MCC
 m+3bXnLmfNY8d2Jtncgb240iu3/e5lnI8L+0rivyvmLYC/53gVeOJuhyz1G3/uGe7T/36S/ZhPA
 p99gA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7sSARk4LlDgG1MdWiATfLEs-WalYEdAH
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f79589 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=MXbv0OSQah28ATDbmwsA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 7sSARk4LlDgG1MdWiATfLEs-WalYEdAH

From: Alessio Belle <alessio.belle@imgtec.com>

Pass IRQF_ONESHOT flag to request_threaded_irq(), so that interrupts will
be masked by the kernel until the end of the threaded IRQ handler. Since
the calls to pvr_fw_irq_enable() and pvr_fw_irq_disable() are now
redundant, remove them.

Interrupts to the host from the soon-to-be-added RISC-V firmware
processors cannot be masked in hardware. This change allows us to continue
using the threaded handler in GPUs with a RISC-V firmware.

For simplicity, the same approach is taken for all firmware processors.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-6-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-6-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-6-143b3dbef02f@imgtec.com
Changes in v3:
- Added
---
 drivers/gpu/drm/imagination/pvr_device.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..b6ce936f07c8bb26d240e50b72a1d991dbe4b045 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -169,8 +169,6 @@ static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 		ret = IRQ_HANDLED;
 	}
 
-	/* Unmask FW irqs before returning, so new interrupts can be received. */
-	pvr_fw_irq_enable(pvr_dev);
 	return ret;
 }
 
@@ -181,10 +179,6 @@ static irqreturn_t pvr_device_irq_handler(int irq, void *data)
 	if (!pvr_fw_irq_pending(pvr_dev))
 		return IRQ_NONE; /* Spurious IRQ - ignore. */
 
-	/* Mask the FW interrupts before waking up the thread. Will be unmasked
-	 * when the thread handler is done processing events.
-	 */
-	pvr_fw_irq_disable(pvr_dev);
 	return IRQ_WAKE_THREAD;
 }
 
@@ -213,9 +207,13 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 	pvr_fw_irq_clear(pvr_dev);
 	pvr_fw_irq_enable(pvr_dev);
 
+	/*
+	 * The ONESHOT flag ensures IRQs are masked while the thread handler is
+	 * running.
+	 */
 	return request_threaded_irq(pvr_dev->irq, pvr_device_irq_handler,
 				    pvr_device_irq_thread_handler,
-				    IRQF_SHARED, "gpu", pvr_dev);
+				    IRQF_SHARED | IRQF_ONESHOT, "gpu", pvr_dev);
 }
 
 /**

-- 
2.49.0

