Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3981E570D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584228; cv=none; b=WnmTsfW9ZT1qkJL6e0oM1ChFm0KTq7xxTL6UnMMch5Da9PL9Hm8q82TTRb9eT5rpNAvo/o31m3tEwNHbXFBR8MGGWfJq+EAlifBqN/rl71a6maE+Ko4dc6yxsWhvigiVQGbYwfq9NRzY+ZYH/vpJMO1mQw7VFZeM9M/KeAqLPtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584228; c=relaxed/simple;
	bh=6NgScVSRCxQPArmwrHQqHy9fGcOIqZ7rlPAL2ePUTzw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrzvbAqhHAIHiLhprXNb1nVFOKEyip7wledmPIuMvl0MG1uKC5ZtkvNSo6eP1EC2O5mQnvlzptw+na1zA3B5amr0D/FqpimQe6/Mp2GnNr1YvPEau9GdmXMfAsIn5mSe5vq6nXB+1oukdYznaLNKCqH1EDGGkMjh2F6tXNvActk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrnM/MDW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrnM/MDW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22622ddcc35so55604935ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584225; x=1744189025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2mbatOTqN6UfvBI6qk+3sG7bqlcGJu5b7iy5tWOUeU=;
        b=QrnM/MDWKmp4mLJzqCCRTpfrJ5upZvpZIpAboTEJP/We7x7366q/cwogAjrNdxvL4C
         emYdAjqodjFRWI69V+8jK2LmUF8yO3SQrN7YkaIfWiZC65IAjrUIIXhi16DrWL42E0zk
         PwEkjp499F9wmMByvvLYp9iO+0Kxxxade4W6jbQE72zOqCCVvDOiDEIPia2/51rbHBcP
         kj/EsZnloRHdFOLjkhubHhrqIGPbaHHh/vpAbrWRQt0B0UT/jBPdftt2NeOAfWWzSEIs
         AhtVFOO9PxM12nC1h/m7HIheNXQPa2kSIWYFuVsO2hYmuE2XKgvzZmfgvNqL1dptWCmB
         25qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584225; x=1744189025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2mbatOTqN6UfvBI6qk+3sG7bqlcGJu5b7iy5tWOUeU=;
        b=COI5CGFV+Km+/Crt1TL1QX3Sfoh/GpxR2n9khm5eFJfRdKug6WYQhNKDG7DsdC9nAG
         6J9CeJ274/Q5t9LDpC4u5NRw67Bv8hgK+EEBlCLVB+8XlVVZpDedtbzRCdtIQV7jAlLC
         GcEQW6NdKMc2+1SEMYPGcYGNlhQDevZv8x1shHNgBabU/km3ZQG9IrEjkQUL2BeYm5wD
         LJxxKrbDqrvJDfXqMJitTkVHd4ahlwIpIS5iHgnSyKrq1LMsxsUxP0bc23LGfm6Q/e7g
         R1xQLffo2IBQgwx6QFkT4hGKg10N6vA7ClMHuHVrQk6eO1STVnNqH05PK2/j0GSqPO5D
         1l1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe2VOttEa764sSNiQEk6o+FLGu6U5R+tarHkoYtnmZ2nvC6kiJdJAop0SMmYZlwSPo55Sen0jpnPKkBPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfEVicKVkcuPAqMWICau57TGtEVqQjbIg+unYaioyqnapa56C
	vrYxHa+/zFl9Qg2h+LWG5SrwawrJJPNiWeSCgFIpCe8r+oPrflUd
X-Gm-Gg: ASbGncvXi2/CKInkMNwmv2vIzUIjXJiwbr3upC/ofk2JgKyzdFUC/B673I22lKDfcZ9
	ACFsWBdN5ggJ+jQsh25ZMacFtJ/9z+hYLiNbKnOXtAR7ewodkrY0yrHm43BCj1+aYEs4WVlDHJO
	qjzoiVM2tKx/B9HNlR9bjxwLZJsAd0O9zNb/RNyL1M6wbVWTq08orOSpD3ZfsKw1BRuznc24qVo
	BN5ZtMOuiFiRBYVDPm+Umr0xrHsVDPZ/Voj4EoTN4BcmjNMgUx993rZkpSKbRNK9DbouIhC8ggZ
	KDrTrx1T9zqsujt/QV/tveMDj0Oxinz5agFlZWsC0yEvmjPjN8qAdKj/yNzN3SgO9zQ4
X-Google-Smtp-Source: AGHT+IEXNQJWNGxGPFphNpnCitbqmQow7c6fvYmWsF6o1jzldCLf2QxqB7RbaqQ5StpVjcJvAXDsBQ==
X-Received: by 2002:a17:902:ce84:b0:224:5a8:ba2c with SMTP id d9443c01a7336-2296c87eb4bmr15812525ad.52.1743584225535;
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22449sm10393367b3a.49.2025.04.02.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E07F480531;
	Wed,  2 Apr 2025 17:06:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
Date: Wed,  2 Apr 2025 16:51:26 +0800
Message-Id: <20250402085129.1027670-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Organize Macronix flash info to make it more readable.

Cheng Ming Lin (3):
  mtd: spi-nor: macronix: Drop the redundant flash info fields
  mtd: spi-nor: macronix: Remove duplicate flash info entries
  mtd: spi-nor: macronix: Move macronix_nor_default_init logic to
    macronix_nor_late_init

 drivers/mtd/spi-nor/macronix.c | 50 +++++++---------------------------
 1 file changed, 10 insertions(+), 40 deletions(-)

-- 
2.25.1

