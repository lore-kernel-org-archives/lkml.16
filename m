Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485BB221F13
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788804; cv=none; b=Czu/hcILPhEaxWLnwmApCm9Uj3qsf2VCXgxsuOjYg7K88kW8OaYbf5nAezTvGxBitamyZRTZKPvNx/vhImmFXPV3tHgbgCNHAxTRUV5FrBhxDN9rNQv97HkI+OSoNkmFL1dxL+fzxV+Y1HuetQNVVL0RD/e1U9l1o7NzEjeibHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788804; c=relaxed/simple;
	bh=+dE3NcbFN2ssrFmaxI06f2w6v9bnBsfQgbX5fvSp0xw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RQoqiPmIDhHVJ5GHvU2PgMrz3O/mmtV9TdpzOq/JDiJR6BddVWYDQkQarGRbSLL/pBTuANKVGAoHYO+JqSsDChTbA87fMu6OpQJ0IURlfpXCrgIy15CWbrWsn+UmkS03/IFk0ZEUSEZPK6zQBPQJqBJlviqCt30ouLzw5bkxSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzkyPjRv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzkyPjRv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301e05b90caso6271384a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744788802; x=1745393602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHkkBSUEnJtBBjxdrXpYHYmA889tBVCePybNfFBjZCM=;
        b=RzkyPjRvLMKlN4FK9on0EirNpnxvvJGUPy1x9cBe7OzX2ipYqhFdcxIDtIPwL5TZIo
         9lsQIAnyoOSagZ6KmCobZe+c1ujrokmHVbba7wli9V1WwCCeEXJt+rz2CbqXXOIM0NoO
         96pH3JfyS6uokaPq6ZFZr7Bz4lLI5ZkdUJ4er9HQcDZPlcULhZHA1m+nftK1xwmoJ4XD
         distCqdWgD9PVJUaRqUvBPWr7p04nU6p7gCbQ9dVAjVWx0Zk+e5QgHQA3TfqZk3gT0po
         86MSf/a9wD0L6n/Qu00PL32OZBSgP0OWnPjmeKMyQkq7d/bGZFXG5qbDWmu/+MLVPpGU
         U/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788802; x=1745393602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHkkBSUEnJtBBjxdrXpYHYmA889tBVCePybNfFBjZCM=;
        b=tQTgRIb8ze4vjiH1hYLGQTaND/sC6kJR8BIgsRD6kTgDp3IUGl7eLKR6v/mN4L3y3S
         u+Alyndh+XoArYuMVL2n1IvMWcidgcF8J7tcfGJ+rFDY1s8xo5dSOfn6rRt6xE6HzAA5
         5fp6IycHlIluIEQ5bYLltJRJrkuMQ5TqEZB2tXhVY4i8RXffTz7hCuW/5PpWAOAowvDt
         +tZjVLEJgfEy1rmmEakj494om/D94x6pS3hY8ajB1mudZQrbmJ/i0E0glk9w9DQGrKVy
         dDpdjQNkK5IrfEDnjI71VxzUX0xsQbc8M+1DlyQw1/bTgPjjgpR82YpjeF+M6dUBFDOZ
         whQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDnx2u1MBQPsH8hstawPWeQ8ZC1WxHq6UASVE5bp2sL9DkBBJRAyu81vMl3zUmUqIax+sh4eCggix+i8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJssZD4bpfMco2iK1yvcesiZuQOr9tmE34KFccanlMUxa02MV
	EbJJcgWoOH6Lyh3lMqOW3rtcBqJN79LYmdyccgBYADVn4Nw09OU=
X-Gm-Gg: ASbGnctrkggHfDBDZlhcAJfnRF3GJZ0f+7zYNY2YgXRY8naiF8k/4cppNqyyMNxJ9cV
	8msibSaWLaWGQA+DFRbvEiUsiIL1LXFEpvVSMXE89vrOYAEsAe+Pb1O/MQ0SV0UR0RZAGdmVOtw
	Wbvp0GJSmY/FKPfw1i8f/Dam1vZ431vR0l1OkTPtPWgN4Mz0X4tKDb9GUyi0Cf2m9BcGy7EEPRO
	hKRwfMHDKCmiaMYb6fOoSTgRAC6KUmxZ4kn3e+xPtoa2NyriFK2nRBUPELBcfWaKATicgXiNhTl
	z7lHhSovk4M0lrV+GQQ7zSqpJohyG8dmFx2pkDh8lQehbBU8KyCe
X-Google-Smtp-Source: AGHT+IFLWgEp5oj4dvUn/SbRKIWaHPfRDLLf1Fv5DfWee3CnAQT0vY2xt1RkVb9UhgQN+Oqxzum4Aw==
X-Received: by 2002:a17:90b:5824:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30863f1936cmr1284633a91.13.1744788802331;
        Wed, 16 Apr 2025 00:33:22 -0700 (PDT)
Received: from debian.ujwal.com ([152.58.237.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611f3e51sm863339a91.16.2025.04.16.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:33:21 -0700 (PDT)
From: Ujwal Kundur <ujwal.kundur@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	lijo.lazar@amd.com,
	sunil.khatri@amd.com,
	Hawking.Zhang@amd.com,
	Jun.Ma2@amd.com,
	Yunxiang.Li@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: [PATCH RFC] drm/amdgpu: Block userspace mapping of IO
Date: Wed, 16 Apr 2025 12:58:26 +0530
Message-Id: <20250416072825.3790-1-ujwal.kundur@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a RFC patch for blocking userspace mapping of IO register(s)
before ioremap() calls are made. Out of the available IRQ sources, CRTC
seemed the most appropriate for this task, however I'm not quite sure
about that as well as the type, which I've set to 0.

If I understand correctly, we actually want to block certain ioctls from
userspace that can interfere with ioremap but I don't see a dedicated
source for that.

Signed-off-by: Ujwal Kundur <ujwal.kundur@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a30111d2c3ea..365af52af6e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -47,6 +47,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/efi.h>
 #include "amdgpu.h"
+#include "amdgpu_irq.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_i2c.h"
 #include "atom.h"
@@ -4367,7 +4368,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	ratelimit_set_flags(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
 
 	/* Registers mapping */
-	/* TODO: block userspace mapping of io register */
+	/* Block userspace mapping of io register */
+	amdgpu_irq_put(adev, &adev->crtc_irq, 0);
+
 	if (adev->asic_type >= CHIP_BONAIRE) {
 		adev->rmmio_base = pci_resource_start(adev->pdev, 5);
 		adev->rmmio_size = pci_resource_len(adev->pdev, 5);
@@ -4380,6 +4383,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
 
 	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
+
+	amdgpu_irq_get(adev, &adev->crtc_irq, 0);
+
 	if (!adev->rmmio)
 		return -ENOMEM;
 
-- 
2.20.1

