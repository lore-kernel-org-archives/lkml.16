Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354AB18991E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745727224; cv=none; b=YBjISCIZVhOJ/hOkGhHKGDHCnm27jZqtNaaiIvlajSARm6IwYkdb1/BbbqRkcuaMBV9OgJT2Ncsg+BPBlTM5nIuWeV7WPHTEA8IDEofXN+YLMUT/5yKuxgYd0LD/YzdNaXEE9xRm0WIakTNCVPNw0iRSpC4sdx9I56Ms9jbSEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745727224; c=relaxed/simple;
	bh=6l8LUg6CFnXOmmKRA+uhTSYX9D/n3TL1eR5VM5YqRyU=;
	h=Message-Id:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=RHUm8fAEOTul9siUqpWORkhpdWl2vZg0h2ax/fZ5AvkG7x7wQM4vdYCTJjZ3Z9FUO10fYZtJ3e6H4xfCz0GUzVBZCmF6rf3ohrQMa5qIeRyP0YH6AUUShH535h2DAEaPjGbPn8k9TQRVnhDFArvaUJf+Bca5CVhVkJfz8lVwJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZlY981t3Vz5B1KR;
	Sun, 27 Apr 2025 12:13:32 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 53R4DUco001600;
	Sun, 27 Apr 2025 12:13:30 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Message-Id: <202504270413.53R4DUco001600@mse-db.zte.com.cn>
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 53R1P9Pd083371;
	Sun, 27 Apr 2025 09:25:09 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Sun, 27 Apr 2025 09:25:10 +0800 (CST)
Date: Sun, 27 Apr 2025 09:25:10 +0800 (CST)
X-Zmail-TransId: 2af9680d8776ffffffff9e6-9acdf
X-Mailer: Zmail v1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.song13@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <liu.xuemei1@zte.com.cn>,
        <jiang.xuexin@zte.com.cn>, <xue.zhihong@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1ka2ZkOiBlbmFibGUga2ZkIG9uIFJJU0NWIHN5c3RlbXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 53R4DUco001600
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 680DAEEC.000/4ZlY981t3Vz5B1KR

From: Xuemei Liu <liu.xuemei1@zte.com.cn>

KFD has been confirmed that can run on RISCV systems. It's necessary to
support CONFIG_HSA_AMD on RISCV.

Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index d3c3d3ab7225..9d4a5f8ef43f 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@

 config HSA_AMD
  bool "HSA kernel driver for AMD GPU devices"
- depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
+ depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || RISCV)
  select HMM_MIRROR
  select MMU_NOTIFIER
  select DRM_AMDGPU_USERPTR
-- 
2.25.1
