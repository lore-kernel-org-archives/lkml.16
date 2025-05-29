Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9173119E968
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485527; cv=none; b=k+iRChtO0NkICwiyjJKY2o2nnXC5Z8vb6vs3gI+w3/5XLNs62PZBjnwztVXXFE12q78YpbBaWHwIuM2UaNHlcpjuIvJEnZpRRYbPL9CnvraVddk9A3ApRiSkGwBQT42RZD+eK6ZdcG74oOwltubp/J9F8YJBy+wIEemJHaU+65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485527; c=relaxed/simple;
	bh=KMPDniQc01HEAFJBaYNUaGustNc7fMJCTFvKPF8Gm80=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=a+jKXmO2lJOCTY8pNQS15s8ZsLcdsoHHeDH9KMVLuZhYKXMg3dU3mCuCj22twaC9yE9mCqHEdiuZOZW87U1o196OIG3dwRI9VFgA/dSzUIHUPlVZFUhnyjz1tRBvgNxQUm3w3PrKcfrNo+t3AKMnIIAlXGlmWF/bANMiJHxKaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b79FZ4yF6z5B1KQ;
	Thu, 29 May 2025 10:25:22 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 54T2PAO6025233;
	Thu, 29 May 2025 10:25:10 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 29 May 2025 10:25:11 +0800 (CST)
Date: Thu, 29 May 2025 10:25:11 +0800 (CST)
X-Zmail-TransId: 2afc6837c5873b4-58a73
X-Mailer: Zmail v1.0
Message-ID: <20250529102511926m1vYHloavTKK17e5_ZdsX@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIFJFU0VORF0gZHJtL2FtZGtmZDogZW5hYmxlIGtmZCBvbiBSSVNDViBzeXN0ZW1z?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54T2PAO6025233
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6837C592.007/4b79FZ4yF6z5B1KQ

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
