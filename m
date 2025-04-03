Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D86190679
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659535; cv=none; b=K85SRUAWRtinutTcrbxt7Dxrh+KieuJWKwKBZyWiQi6F9agtHh2a+0XoZFQTokt7/2IfNrxt0Ocf5L1W83kU3MbNBalNsu+KVhQZEg3IIuDRPpG7B6qk4Pb34gevdjcrMB7KjhWFDruPxjbk6lksC3n6bJzGmr4fl0xzPmXc8+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659535; c=relaxed/simple;
	bh=zDE12dZbPquxzL4QXG7ftTQeZ/a+U3RrlIe4P2CgutM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6NnZQq/DD3qFQx6K9zMtZWtCZXmpE0n0AWHmU9WpuCn8+sTzkWOe2PTn34Z3JWGovcpu2dJhuYsUlEWIFdpFbocKXSTsC+3AAjIPobN3j7nrOVxpeTOTpLzh18DBrdEOfyxo3vCZSj9GT36jqym6ys9EHKcEj/GM0I/3BFu0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxOmQe4x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxOmQe4x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so917209a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659532; x=1744264332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17m4YPBaKG8yoX+eqXaayPR/DLuiNsoeilkLB3ayQyY=;
        b=WxOmQe4xkjCljYqvwO2D4+8dB+J+riqSlOkuPJM7xbWbyT73ZGLBxdyRaFmGOxcYxD
         0MwA1QKuTujDAmYrBbgjoYKk8WbFsxr8nb2gJaxikH/nA6M8Q3oYyZHcW11btDpzxTF2
         4Dt97P6kW2uOIrKdij0EdShELT740Rkv5hn4h2vjqIhkqSv8QXntrUUUYFWv5ukVIlyx
         EPp/XpdVrxwb/FQkErfjmgikQMGzMjQqXvcJJcVAtXN4DYPbj2/5AHWsXnikYMXi9st2
         w3470NzGqaF+qnFyhxghhfQ4dHb4nHlO7uw6P7QReQpwBkR09ZFo807BdtTqs2qZEt+l
         8SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659532; x=1744264332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17m4YPBaKG8yoX+eqXaayPR/DLuiNsoeilkLB3ayQyY=;
        b=dgs5zz8BNWExizdKaVTY+xDybvQXt+IYyJz51Lnk3kq2S39K1WczMkpMzNqJdzFaZ+
         Cnx7bmaCHhe9dcGW7gAjgqAYd1ZDViegcxyuTApscF+wKQSiBa+XgWt/SZI9zlH0074m
         SWxiS4gveDzsonZTb+9W/ZtS0ddsg9w2zmEaxTmhISkAqUqqJflPwiZ3UT5iKjlgdy6q
         OJgxvSOYRfZhynlS8b+YTn85h5aW4es2heOCEmURFoIDhC6S3dMLVCgt8SViLYvBsdTL
         zBOxcv9hOuMR0pDbDrK2jmpXuvqsI5eQwH4nf9LS4g+CUmdDSWtIjH8y7PqTVaSRwxXa
         cZCg==
X-Forwarded-Encrypted: i=1; AJvYcCUV4AandbTFq1wOiMi0FFTL+j7wpEQv47lAhA4E4ClChEsGAxriJfd4L9bykxeqJMCouQFu6VkFWBq2qvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYeKpDJTPRPorG3SoYtjG1zTXbXdg7K+bqhi8r6W2JDVZAVWj
	+1D4+fsoKVSb6xJ0De4G+DFxWX8vKGnnqi8XLIwF+i/i7K75dHC5
X-Gm-Gg: ASbGncv6IDFpOXgiYxFS2IDHGHfpSd/X6JDViBdnLp0QaZYc5yizwOhKD1XWG4V99Qg
	hAseltDdRMV1oC7J8+MuvDXQRYPgjwoQ3+riv+FasgeyQ6eAUxnSY80B2aqxIeE97dlEo3++LRu
	RUdzT0vHNqOaypN8/kWNHcMdCfoFbeVY1kJbEvdJaWzaViuM3yu0KK7XZ3LUKv0aJnGznjpiPrK
	o5hZy1eOGfhrY2jVU3yVCN4pz2cy15Ewp0RZ9iIlTi0j5BLVQxYsIfSYrz9dB93khjAT/siilLK
	ZUwRtQCCLi0xVik6OxAZH8WAlSqD/TtkPLjIkcZQEwDfrBWeXSiJwjpuQoc/EhHvtTrstySR3El
	JnZwiHOCqsKcWSX5oFZK9AfQo3x106jo=
X-Google-Smtp-Source: AGHT+IGn7WQedXxz0rx36gPTcBptmyeHmicMz4PPof+Ps0DnBpCvdMJcrUMxhz5G4Sp9jz8Aq1BLxg==
X-Received: by 2002:a05:6402:40c5:b0:5e6:44d8:eced with SMTP id 4fb4d7f45d1cf-5f08716cc7amr836988a12.12.1743659532244;
        Wed, 02 Apr 2025 22:52:12 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:11 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
Date: Thu,  3 Apr 2025 07:52:07 +0200
Message-ID: <20250403055210.54486-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H616 has a dedicated power domain for its Mali G31.

Currently after probe, the GPU is put in runtime suspend which 
disable the power domain.
On first usage of GPU, the power domain enable hangs the system.

This series adds the necessary calls to enable the clocks and
deasserting the reset line after the power domain enabling and
asserting the reset line and disabling the clocks prior to the
power domain disabling.

This allows to use the Mali GPU on all Allwinner H616
boards and devices.

Changelog v1 .. v2:
- merge flags to a single GPU_PM_RT flag
- reorder init/deinit powerup/down sequences according to
  Mali manuals.
Link to v1:
https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-simons.philippe@gmail.com/

Philippe Simons (3):
  drm/panfrost: Add PM runtime flag
  drm/panfrost: add h616 compatible string
  drm/panfrost: reorder pd/clk/rst sequence

 drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
 3 files changed, 63 insertions(+), 19 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
-- 
2.49.0

