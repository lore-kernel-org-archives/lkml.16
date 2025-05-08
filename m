Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A810279799
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716195; cv=none; b=uJ6IH+XfOEUA2GFDE/ZDTBBMDvM9ByA5Idi1RH+y1Zb+rJ1er9Pd+7WTbmrmcNQG3kDYRilxrV3kpC7Ke52zM3tmh+z43JHFNsAfE2IrUpwaPbPYwGGbkKs3BeL4sqCzR5IOenyOaqroI+1ddrnFdp/xx6VnTe5RCbDHcGXKap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716195; c=relaxed/simple;
	bh=vIt4H13vYrxEeHPxoOrOPzgl94oSAHaWdzBbLbiZ9cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHvjd4ZGmv3hOK3xbVcYk4ek0k2AcpHJjTCS91DV4UmBJjAz0D6NQla+Br8Uh0RFRgi8A76l8IaD08hQrv8d61Orqx86Dd6v0wdpfwzeu4IdgcK51u5yoTk35YlEVK+FzHFvoJeLJJK0/EC4QUckddfxqFKP7euRWqAg7KcTWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so181743f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716191; x=1747320991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAXhugNVBzhAs5NSGlFV7iMObTrBcT1YtpJjyksIfZQ=;
        b=eonuBWi6yLG3eS/r4CxL5g86Y7xxe5V01mK9ZXi7SJ3h0anquyeV28dSYDm95KFh/F
         RKde77zyCRY+QJ17zQAt804IpO1LxKp7mKqxHTQx+f5u/g75XMgM9vhvNzumYTfrFSeB
         LzKGwlYo4K2psmsZePmbZAP2RhT5URlyXfgjnSo+CBf+kjzK2yeaIzvXTJgDb+R5XpsC
         MTKuRxP07AEmdzKOgQaTrqjivzsb6mMsR9mYaQW4/SUK7YPE6e8Wkv5P9FpPn63n0zqw
         GX0JVhgOfuqOduWrjHOlKDqk/2wIFDx2wwHcZ7AJQULioBmhdAOF7qK2cDXPsIz9UFuZ
         Dg0A==
X-Gm-Message-State: AOJu0Yw4IlUVDS0OA71VfUUIiI2PTH8AvWPlb7ORE3kfuRslf4XlGFmu
	bpZYG3xDcGELXuplLBE6QoUX4CGBRszFyEltHis8C820DqMOrIP5CjWV0Q==
X-Gm-Gg: ASbGncvw0dXXO7wYPPUX7/U8zQMHwqsuGn/QWyHOJ3bw84ra+SsTKVYfMPeroY/hNrJ
	p8jzxiDshO6ur2BPCthFuPKS+8YQptfrfMNj9mmZLt3GWzLkGo9ymdDZQya7gPBweGesZ+mJWhI
	YOxQLLw5wE3DF5/WWUAZ2Vf6T8dH42RQz60gf88PfLHBqu5HrYeN/4as9Ht6FpIxlPbPrA/WdLH
	fbiNu9n/zVucNVjt3R1GhX2CkanZSuiBjGD8lqPkY1FHzxZYIF5YMlut/+9Jfgip9y9mHt3a4fb
	i9/43Xayz5OIlAkG460s9o4kF7oMapvQc1HMxx04Dfv7JQCsk1V8aai0VKLeXMXKYgdWYwGStXA
	/4JRLS9PTtyzD
X-Google-Smtp-Source: AGHT+IF269wFqFSm/Gi0kxASaxcdFYL/XYvfXmeP4TxCmAIkirqSrOd0grvMy+PpSaQMMRGOulPk+g==
X-Received: by 2002:a05:6000:40e1:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3a0ba0b9c09mr3141852f8f.33.1746716191050;
        Thu, 08 May 2025 07:56:31 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fc4sm205018f8f.56.2025.05.08.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:56:30 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/etnaviv: Fix flush sequence logic
Date: Thu,  8 May 2025 16:56:24 +0200
Message-ID: <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should be comparing the last submitted sequence number with that of
the address space we may be switching to.

Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..88385dc3b30d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	u32 link_target, link_dwords;
 	bool switch_context = gpu->exec_state != exec_state;
 	bool switch_mmu_context = gpu->mmu_context != mmu_context;
-	unsigned int new_flush_seq = READ_ONCE(gpu->mmu_context->flush_seq);
+	unsigned int new_flush_seq = READ_ONCE(mmu_context->flush_seq);
 	bool need_flush = switch_mmu_context || gpu->flush_seq != new_flush_seq;
 	bool has_blt = !!(gpu->identity.minor_features5 &
 			  chipMinorFeatures5_BLT_ENGINE);
-- 
2.49.0

