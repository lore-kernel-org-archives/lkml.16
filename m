Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698D20CCED
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616929; cv=none; b=Wuu8DN5GjA+7dVu36akhnO1U9+1pZYE2zsC7pGALwDz6Jh+dNOu2oqpFvY3PFIAofImfQY6e1DvIYpNjQIlaXQMjXoklNFEbOeu9Ixco0j1AkASXtSNwBfkiSEO2lC1t5yYZ6OxVlQjVw0LjmgZCOTpMRzVHdolH2S26fxHibqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616929; c=relaxed/simple;
	bh=NNo8O3O7I8xKI9r4pwRS0x6i00//1Wj7e63uNSkMrU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxDnlUZKHSiFKuGgFBAUJuIZjPUdCT5+3G1bplJIYvGafQRYf6/ksV36zuIKXm8xmZlVh0EQ5G84D267d+42vhuF7K9+r96vQIArFNqTBcazRG07sinsVjTewWkxNF8qUyMy23WdaXVC0+SMCypuv+9oULU1OEdi/ZkLoEQnm84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso30862385e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616925; x=1747221725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWC9bs3J+fotQKN+Pvu1nWrnqjUtpAFHf8gyq7Cydsg=;
        b=W5kleO2+HESCyZlc97EtZgi7pcf+QRvwGvOlc0Fc3z7sjOr1Uii/t/WP19b6QZEc6m
         WRGVh6faK99UBtu5dfHULHazHZWj6IrbqdTq+G0Iu2VGtAyUN6DbEZ7mqxphAUn7r0gY
         FkS84TXhQSsHFxjEY0QDRUCeB1q/oswB+zj3YJouq0BPm1rd5z+DwWI6SZJSyp1BFb6S
         BZ+o1vBZ3RThq7uZ3z5RaT2Ddtm3U2DCy5MWiDQ7HcspMBKF+/B8D6bHr1ikEIM8S4rX
         E86UAuWnQlQZCvWib1KaVdpmSiHtmjX1vD/2Sse8eC2tel2k2/8m38z+fdYeAR0RBaFT
         DDuA==
X-Gm-Message-State: AOJu0Yyv2lU6vGINtVa3MbWjY14OpbbRx7k6gLwIoXIJsmNpU9aHs59X
	qORAu5aPdrlUeYI9fR/rE6gE9nh3y3NoTLgCnaJ5vBkQnzOGwZeu2QB5HQ==
X-Gm-Gg: ASbGnctH9hdGWtYtzQsYTVxgmHtKwXY/AWen0BkbBeToDPH5Oqp+S04m2c55P1JPDTk
	n0tHcypwa8EBjNF6GBS5Y3sG2p/HLH1THP6J75RBGRFfXl2Hn/+zi+lIlVyBVPIzN7Xkanmomk0
	V8GUrc5oRdfRY0le0BcrNJ5eAsCd4s5wKFQjkHQPUo4ba32KGN1fCQ0xpwWwU9NZf5i1+AhaEJK
	5Io5y5jy8qHB1opIg1k2lJ6e1XdnTZuA8o2NM3YUoq2IomGks8fBLgRv5UlpeReSNGDMirV1aKH
	PLSeUrErzW46WSNHsnu53YeB/l5np/zIWKPWG/5qMMFZSmRjR0aYFD2+FIyrwyNZ1rhdJG3s3Sn
	vFg==
X-Google-Smtp-Source: AGHT+IGRWvY8rXW6dhn155ZAXsXvmGuf7LheNdjj6dzmGatIJg0UzjRGoVu2EsyA9CH4JuUihSF83g==
X-Received: by 2002:a05:600c:35cf:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-441d44c4642mr21809675e9.14.1746616924512;
        Wed, 07 May 2025 04:22:04 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43a802csm28373955e9.39.2025.05.07.04.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:22:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: Fix flush sequence logic
Date: Wed,  7 May 2025 13:21:30 +0200
Message-ID: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should be comparing the last submitted sequence number with that of
the address space we may be switching to.

And we should be using the latter as the last submitted sequence number
afterwards.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..865b07b14b38 100644
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
@@ -399,6 +399,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 			struct etnaviv_iommu_context *old_context = gpu->mmu_context;
 
 			gpu->mmu_context = etnaviv_iommu_context_get(mmu_context);
+			gpu->flush_seq = new_flush_seq;
 			etnaviv_iommu_context_put(old_context);
 		}
 
-- 
2.49.0

