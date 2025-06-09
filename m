Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2857ADF59
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483221; cv=none; b=B9/u4ZRpryFfUuJ+ggSsFhDTu4k53b249xx8xER+lFgVQin9SdLvpEDaU0awzw8eNMiDvybs72WHQW2EfKAG47fM6Y+RCO1MPjTdSlTUf7NrOb1OLFTFDjPqW/NtdqbReLcO1ahQOL5IzVNzFGm6ADOSsTa4tSlkeQoWqYSGqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483221; c=relaxed/simple;
	bh=Ey72OPsSmpUH6hcCG9cbHDrh6u+W0gYAKs5MnbTd5ew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pveNGvvleljuG0t4lBZOf0YrwxxlbW9QrpwN7M/OS0GEzCvPl1qykFrWG/rhv72dPkbq360ptSGbTwrOwgfsgsEIhzVLjRDLNtSHbwjKAfHZ3W1tkgHvAjPWPS4YKc0Tg65Lbaf3Or8PZiG95zBDkSvz391x3sTBCMzO+3rLvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NDO9dFl4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NDO9dFl4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso28027075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483217; x=1750088017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvtGT/gXZy9G0z7KUPcczavaKT2KAY8YSEGerfvgk+k=;
        b=NDO9dFl4z+KZi900V6b+cczdI2ZKvmKWavUCpktm2ILbc+6nvWc3k4uyuU4g0PFGP8
         DvtK+RFqlT8C7HjVvLo+6Wo3/bpx0NtBzcDPuXl0v9aMFLgRaBwWUlyL/29DjgisTBVP
         uVWGUDwSvQ2Ftqclg/fzN45pcvAaXHfbpPaxnP3M1BZBWhgG1FfBcEl5kIT0vlexDVFW
         kCzVV8y6DhmurVmD8WxX2MwtH0FYS000EqPF9gD84b6Z87nLn+RbIIU6VGARzPTHA2fu
         2yzClwfpFOA/LGk/1X1lAQEfzi9ptMSygVcgvG0j89bmcCPKU7i0JfbgREpZGquskFsx
         eC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483217; x=1750088017;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvtGT/gXZy9G0z7KUPcczavaKT2KAY8YSEGerfvgk+k=;
        b=Mp45/mzxAcFhqzUwWHgTJzxApkN70WoCFaiS6lxE3YhRfIzn/l9FBF0gDiiaJP1YCD
         Ev0/j59x/RejuHMru/s+4xih960f1G2Mi+gkZ9Y4Yd8N9FGv9kNUBAb2PAGnatINTskP
         UU9YvlV9+mBZdF6ACubHJHJdcf1hccUX4ugvhGQVlKspgP2W4Tk9kfab0cZvoJknbo9+
         D0UPGlNZzSTpFaEnqYemUxr6a6xl8vJASDjGoETXHPkX1cxiApUQyerndziYE9kH6q/1
         ZbIh5G3R25qJUbVEWLEakbl310vjEW3rGVKVIbbdTRKfbXUy3EmrEJThA3fwtPEI+aK6
         mTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcoS+b3twhUXFRNJm5B2foyXwD6QcVC/bKorGyV4ozKYACOijahq8vEb5B5eJ/jIu+Br46Jbv06y6nr7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCvXmPCaxaFM4tcTKFNSFyqhdxkGY2+bUccjrmdO0OQ1S4EqX
	rzOp0C4c5kWJOdVrelKgYX9YzEiTAnYvLUIjCT7suAbR9C8/9ctWMETiYMgMtxZL+eE=
X-Gm-Gg: ASbGncsKqLTve+HUAllftRLj1sj3ARWHxZfltJLGtGyCrM0UIwFwup9XvlYiIHNYNXf
	Z+HLsmtESO8uC+0PgFQ6P9G8UYqbkc6e1FGTQf61MNXwCXN73Dc4IhT7QfsbxsSnJRQcvZhV8p5
	nd9T9WCXAnFvu3dApSOczYkbjFHwgsayIYXgYNefJv3dm4Xv5Lm7zVI5xiqHI7hW+5U12uHNbo+
	CrzE83vkOQbhyXYygiKJBQONO0jys8j+LowOlNympmKJUZM0ZiyxZDc4dyRQyEaKQva6gOMwBHE
	u0ivJsFIiyDhu/HF1BC9aFTY3pkZTqRjWtMeeHmoydHSxQa9viIh+dT2iVRu6Y/oJihlTVQ=
X-Google-Smtp-Source: AGHT+IGUecRwAIMHRhZ9jzGvMSqw8sw1BbFuESQIxyKOrlJ4Q6pTMh4lszRudkvpP6BGsmhYVVJ00A==
X-Received: by 2002:a05:600c:8212:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-452014b39dfmr121204185e9.29.1749483217347;
        Mon, 09 Jun 2025 08:33:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
Date: Mon, 09 Jun 2025 16:32:37 +0100
Message-Id: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJX+RmgC/22NQQ6CMBBFr0Jm7Zi2hgquuIdh0cIUxkhLWkMwh
 LtbSdy5fC/572+QKDIluBUbRFo4cfAZ5KmAbjR+IOQ+MyihSlEqhQ8zUUK/zphmxn4yaOr6Spa
 ss9pC3s2RHK9H895mHjm9QnwfF4v82l+t+lNbJAqUQlekLiQ6p5snexPDOcQB2n3fP+qH+z+zA
 AAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>
X-Mailer: b4 0.14.0

Improve usability of target mode by reporting FIFO errors and increasing
the buffer size when DMA is used. While we're touching DMA stuff also
switch to non-coherent memory, although this is unrelated to target
mode.

The first commit is marked as a fix because it can fix intermittent
issues with existing transfers, rather than the later fixes which
improve larger than FIFO target mode transfers which would have never
worked.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (3):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 128 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 26 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

