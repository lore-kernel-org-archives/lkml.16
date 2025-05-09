Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E0B644
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746835244; cv=none; b=u9uPnjVe0QwAdrewgQ8P6s4ISt3l8lU3ZEJE3jgTR6ZgnLkpEu9l5q8lDKynYUcqm7BaMNCB0auQ1UlTDMC86zHozYX3xWlHUpQKD84gZe548toRcet6LmcFqad8tAIRH9Dgrofj/tq/JPzRsqtaSdIy55MWTjpp8zspYPAqPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746835244; c=relaxed/simple;
	bh=5s/2YQ++C29YMzUmHKjcqZMNM6QVHZQumFk2x1xx3v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXGcKRrfc8P/y2Dk3uOIQsYUmDkY23pIzME3nyQzJr9UUTM8slKYL8Ti1cpJwpD6YbnEVAWIb1xutkVdodkyvZVAb4hKAF1EXcSCcT3l/oh90ibTkX0MuBZIHUx4s0ShOvZ+wDomZu5bD1tXvH+vv/VADinyL9Lhv/MRR4wI3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by0/5LA9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by0/5LA9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b828de00so26725505ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 17:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746835241; x=1747440041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWH2xlqMgTDDgBH+DcFeQqtTTTd9MDqKNid4Rm6OJAU=;
        b=by0/5LA9LPgA/qUJDYikKUhmL2PGGAgV9SD4/km0+2MvisvmvhrXGrMYsCX4RkXDqZ
         ncr6K8AovAsQx2qgwfz/Yk6DItjA6E0c26p6WZYXlhj1S3yDTOb3D55+pqek8d3IqBhe
         gNQ6h6f8GrzsvgxSd113xmz8UzAvdDh0gDSIbwm+RWmJEHhuENI8ZC9jTk7ItpucCAAp
         8Jq6xxEyd1/Pg9oNKqqGYGCkf9zFdKSzZFWB39nHUPpSQsj88Su1SvYOJAIncBxl/NwD
         DLMVmjdYQ5eAZ3nCxIr8flX1nY4msjFY3tvhk85MKgW9SBAD1kZI3iCcV9rI3go3cLKO
         dHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746835241; x=1747440041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWH2xlqMgTDDgBH+DcFeQqtTTTd9MDqKNid4Rm6OJAU=;
        b=GRqyRJxWYzXmUlYftr2mwRoVhRAtJHSoH8ZTYh4gWoFJnNAKRycQiYWibJH/k4dUkx
         5zCSaAzQnkGbdtmNYyqCkbvSQaq4i+lHcH1PriRHuprLNkzsgovLG5ayCiWjnwAH00Zq
         9jCTDAzp4NQTbTEURoIMEojBbcPEseRtsyERO2ZjHMPIWCzxwmqVRMW/vtGYHgAWq2nu
         glbMHfCLAXVOz5kzz19pyUnZ9Hp69kAxz2shvCfgD44T214nvmGEGX4iBsAIKhXIPLwB
         tuEaifH6aTPF4btIfaTamaXm153Xs2AbVzD15GzQEx5F/GIgZoLaxzdlx8sghL0H/T1u
         1qmA==
X-Gm-Message-State: AOJu0YzZcfZsGgdvhpgTd79s8H8L2SseYOV6EG/qwm2Cjwa4ibdlb7HB
	sxQKFdR01wPFjSO8+X03RAO5ymmcotkOQhi3RSJ86lM+2H0N9f8I
X-Gm-Gg: ASbGncvJqBq2Ge6oMpUOiQfDk/EWZexZV/2PXA4d25DTRvqKkmUl191kakrGvhUEQxn
	25ecioiwnlLPxG5SPI5GNpU1Al1OtK+ngtP7TLRnc4mRjlB32KS1QoJ0j+2dkK4AOBGcL2nCK5N
	Hi7A/1k6U0AzA4es219ilPu21OSfJXyAVFFjNisMTbl7a4T0S5gjO8TyjTB+ryulliD1a/2DqdX
	s2qLNr/K/vneObt3Lw+uYicRBd8hkUVLRpItTu4HjwxSXMAMyqSJED+cC0Vp9coCChtD6j80pRI
	GOjY2r7S1yaHX7iWcGak4TAPHNgFHJm+QlxH4OZOiSJvz+UWaudgozn0V7EDEFzc74Hn
X-Google-Smtp-Source: AGHT+IHPxQC1zqtb/Z2N6/E3h1fHhuyKeEqYoTjBs8erK6bNAd2Jghc5SuLaBdGIDtjrym8vhNZyCg==
X-Received: by 2002:a17:902:ecd1:b0:223:58ff:c722 with SMTP id d9443c01a7336-22fc8c7c1famr91402605ad.28.1746835240389;
        Fri, 09 May 2025 17:00:40 -0700 (PDT)
Received: from fedora.. ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349ec816esm2033209a12.22.2025.05.09.17.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 17:00:39 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] nvmet: nvmet_sq_init(): fix use of uninitialized variable
Date: Sat, 10 May 2025 09:59:05 +1000
Message-ID: <20250509235904.915626-2-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This fixes a bug where an uninitialized return value is used in
nvmet_sq_init().

Fixes: 206372d7c565 ("nvmet: support completion queue sharing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505091619.QFU1fxsd-lkp@intel.com/
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 drivers/nvme/target/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 042039011d7c..e30545586302 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1012,7 +1012,7 @@ int nvmet_sq_init(struct nvmet_sq *sq, struct nvmet_cq *cq)
 	int ret;
 
 	if (!nvmet_cq_get(cq))
-		return ret;
+		return -EINVAL;
 
 	ret = percpu_ref_init(&sq->ref, nvmet_sq_free, 0, GFP_KERNEL);
 	if (ret) {
-- 
2.49.0

