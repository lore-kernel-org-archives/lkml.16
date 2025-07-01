Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A5235047
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348306; cv=none; b=d40yNIrwSVstANfGb3oNvh6rUPZt5X6UbiWudZwGdQp+mnIaHKCTZWPOchNeivmS+bZe+VUaOBs62Q7HOE2+92e3AOUQqTwER3ScMguhRbCKBZJq0x/kPjwBy9Lskxjsg/vmGAOHYAUXSWnlHvKktPtScSxEvTYHfpvtooNjaFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348306; c=relaxed/simple;
	bh=cSpWpN4ROq4hNgdz7Ah51Oslr+OjvYL60oNVPcd1qRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tvm7xlPersMppbT7oMQ8A5pBxNtcoJeaABmRzQYYL5+xGSPMVa/CnDs8HSmXL/YYUl7f9fK6TAX49ktGqYAPkw/wd4pZBPTPP9GCFYFc+R5qwnbX3rUId7xN4yIpzBV/9DOiAzTv8KHX5ktoRX+KSpAGawbvY/jKv3oT+FG6Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m77tbtHS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m77tbtHS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363616a1a6so22773865ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348304; x=1751953104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=m77tbtHSjLhsqaw+B5m9fdlgSf/b5NpcSchwdQevScoKKo2Fiw/5SirIBl5N50t/tL
         njbR+xXU2FOuUuTxsg/TQPhV1z/U2VqXpWXL/n+TNxkrq3/PjbfTXny5g9mIM+GPkj0a
         oJdSePdHqsJBpmcWATl1mVuup2vd+3ts7YvmaaOu2C2hJY/XSDAVEOAUoiksOrw8jqkF
         u+YNZeThkYuZ2kdps1MnQ5ELYEi0VRb5dAeYA9waKgz57hLZxxDUFMov79UfaKmsrHju
         PjIJL6rHVsl+LIdi59J26Pjtjl2AZ1akeJKbrMcDj/O9zfFw+5VppLNPG1ts5XSjNWRE
         a1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348304; x=1751953104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=h4nouCCQQXdSChGXY91icrpPX6IDVzy/LAKyU2MBnrxF4i4vOgQxVmim+6NXqtcmDz
         eZ7Mp0VrA0kJn4dihJCGyaRsk6c8X7WHEp1KKeNoEugdDfsOHZBx8WV1guOccCdG+3LF
         hxu8rTF3OFAosnltMFiZ9/FFrp7ZWCtY+3r8aM4Z/nlFmbu8pN2hhkL+GmgngOGlNNli
         dQBihDg8KozmQc86kDpjNfKJwCzGF0P9RFrbZ3tOqxFCY/hOFSw/+7wXfWOTv32D+J5x
         VIdbZEAA8rNeB4ZNtQ3GJSXibLxC8iTYAjcBIte2jIG4ohvULhls9GoJ4BxRHaC4eIoN
         hK6w==
X-Forwarded-Encrypted: i=1; AJvYcCUHdIO6qLJfIBOMUnAdB5+ju+40z2FuM+rr19tzxBrqKao3GlXUqct0a++OpEuVKvi/kxvGjd/EMcJJYI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTwh9v7BeIPhDZRsKoXOhZ3jXohWYPmvnTpB2J6UaS+6ddyPe
	VQJ6basOuLMGd5kw0r4DAnfGyhZH+l8/5cIc0Aexw/TOzO/pO/xtAWVHJXFbL2Ljk/J/JXKrwwc
	/dS3APO2rsZMK
X-Gm-Gg: ASbGncsgbS07fn8cKl9RqczaxITP8AEXiRXHI/TtcVnfC97BzGA8FuH/MC1Z+03X3/E
	aMtRZg4HcI1N/P4maYnGf/tIbdEKzG9w1hcSSfK7WZLjtAwnWae5RkFudnxTUr9rkJtLHOINhRh
	2e5T1rjpPuM4SX7DK6I2IY4kqL+AgsJbVbjH2VBl/w0G8A+cp4CWoLpicA3cRzVy73G2SjT740f
	2BxEA0FbUDPrnnP3AHsHe9egnodnGF0yK8OltLfBiwJ7+fS3M4+X7PaQasK69eWKPmelKFgeASW
	u1p1A1aHabsLFfRzKTLG/yP5GyQHub0c/Epphbg=
X-Google-Smtp-Source: AGHT+IFV0sJft9TTbW6Dof5c+OPMKTEfD4ooz1HCHFSKDnOrbvDpDaREUu+dR1A/ELAjaCh8Jizt9A==
X-Received: by 2002:a17:903:2983:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23ac4685adbmr249282415ad.42.1751348303953;
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:02 +0800
Subject: [PATCH v2 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-8-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..b6519fcc91c0bb56f71df336fd3793af3d64fe78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0

