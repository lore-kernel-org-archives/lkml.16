Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EB228B3E8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292437; cv=none; b=XB0PvFoMMRQBdiNoDHk2RmnUCmR3EBGs9zkbkisTIoTO15T50mwXULNAwi0iE0rANlyVeQ7TDN4XriggMIUfslqcAPRfJ2w2b9WuFDLepFt8n/wUMl2ukEp2gZ7+TPfo+e3C17yJZkbaQPA8rriOQFPsRuuplY6YioRGntiQJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292437; c=relaxed/simple;
	bh=TU38YwJ0+QFIAJai3a/og8sQtPXIS5WyM7jSQ4d8kXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3X6oibHshpIkWFPqYt/Wy6s795DXYI50NCg3ZbbXWeJ56UeP6UtHDCAbUUvEPhvTUN+v/Rsy/qH+9Sm8HVis0ufBB63PKVRZWDbRMryBf3Iu5mpJXZBWS0k12oyUkuYbIT4103S1LnVwdqPwOkYJJ2XbUFp3/GNG1MkkYchNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B89A1D34;
	Mon, 30 Jun 2025 07:06:58 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.28.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8040D3F66E;
	Mon, 30 Jun 2025 07:07:12 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Karunika Choo <karunika.choo@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Wait for _READY register when powering on
Date: Mon, 30 Jun 2025 15:07:02 +0100
Message-ID: <20250630140704.432409-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panthor_gpu_block_power_on() takes a register offset (rdy_reg) for the
purpose of waiting for the power transition to complete. However, a
copy/paste error converting to use the new 64 register functions
switched it to using the pwrtrans_reg register instead. Fix the function
to use the correct register.

Fixes: 4d230aa209ed ("drm/panthor: Add 64-bit and poll register accessors")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 534735518824..cb7a335e07d7 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -297,8 +297,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 
 	gpu_write64(ptdev, pwron_reg, mask);
 
-	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
-					      !(mask & val), 100, timeout_us);
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, rdy_reg, val,
+					      (mask & val) == val,
+					      100, timeout_us);
 	if (ret) {
 		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
 			blk_name, mask);
-- 
2.39.5

