Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAE2C3759
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933145; cv=none; b=YeHksFZ4rot6bDet7y2Cegk/Doylc6ufbuj5YRYW7vT5YhWWfeIrvqeGCd+HUP95WewcZJErduI1o91VNMCF0fOTMPwwqIDCj9sXjVqnYcJCA7g15vZt2zED/CNhBTTOGEDOzTPrvIAVoBIWrmd14h5MIhsCroh7na2KhXJUevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933145; c=relaxed/simple;
	bh=mo5bwpzzs1WWHWgDYxJ2Z6p6LRBwgBcy8oP1NmRLw9A=;
	h=Message-Id:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=ZjTQbIunLLOGxmEou5QBTVoF6WDvYZeJbwdv7Xk9FX9WvMJGAwqKVbCrQpa8IShPAtlnsq7AA26CGU7iqRF9RoiWTxR3MRrqD5RlPbcddraNsVHfnbhV4VZeY53LCBNAGuEz2x8eBv8DvZYXhxzs/nz7lNl4iUBm00XZ6mwo5Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Zn1833mpyzW7n
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:17:39 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4Zn17y4yVczBRHKP
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:17:34 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zn17j4H41z8R049
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:17:21 +0800 (CST)
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Zn17W5ltPz51SYN;
	Tue, 29 Apr 2025 21:17:11 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 53TDHCXI085256;
	Tue, 29 Apr 2025 21:17:12 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Message-Id: <202504291317.53TDHCXI085256@mse-db.zte.com.cn>
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 53TAhmmO003471;
	Tue, 29 Apr 2025 18:43:48 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 29 Apr 2025 18:43:51 +0800 (CST)
Date: Tue, 29 Apr 2025 18:43:51 +0800 (CST)
X-Zmail-TransId: 2afb6810ad675fe-954e2
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
Subject: =?UTF-8?B?W1BBVENIIHYyXSBkcm0vYW1ka2ZkOiBlbmFibGUga2ZkIG9uIFJJU0NWIHN5c3RlbXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 53TDHCXI085256
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6810D172.000/4Zn1833mpyzW7n

From: Xuemei Liu <liu.xuemei1@zte.com.cn>

KFD has been confirmed that can run on RISCV systems. It's necessary to
support CONFIG_HSA_AMD on RISCV.

Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index d3c3d3ab7225..62e88e5362e9 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@

 config HSA_AMD
  bool "HSA kernel driver for AMD GPU devices"
- depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
+ depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
  select HMM_MIRROR
  select MMU_NOTIFIER
  select DRM_AMDGPU_USERPTR
-- 
2.25.1
