Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A97265609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585860; cv=none; b=O62jFdtD/9Y/FT7inpCMFTWZtGTIOiFd/AOySL9xu9CJ+eTgodFIXMaYN5l10DNl6cuHxHjvFlrNxkWx0aUCjb6M6IRbrry+adUvrOEw1hCh+FOoMUcE76hA/5TLCyPRx8rNNb09FddZZKO8mRjH5li4oNvxMXYW5pBtmuFQ4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585860; c=relaxed/simple;
	bh=cP23wtFMvKOpdUnof+BSPUV5OQaMXrVObxebToJ9P+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lbo5mLs+VJN8eitSq9nCje0iNijKYbTE5jgk1AYnh9pd0kW5ahLylOaB7dPrQqit9laXxPly/1NmSbhCFacjBhT6li1EeXnKahEDN9IL9zIJEVe4cEMkiyBi5yqNyUyCfDnFH52dadtiKOoJFE1ICiUwJLHDCbOC+oeoHrx6h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai; spf=pass smtp.mailfrom=sima.ai; dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b=DxzJaouo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sima.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b="DxzJaouo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2352b04c7c1so8831225ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1749585856; x=1750190656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
        b=DxzJaouoC0p+ArLVOixO3GHQwYFwTy4pz6kdhb6n3F/oTB5WB7QniE+7Fz9mfvJbZ+
         1UKNJvzOHhuJ1lMlqGWWbIRYSESRC/FHsawSuBD2uuLYwyfJa26oY/ohC6ARmRkmhI2g
         JcySKdZGqreeAeWsj3RsS4uhuk/RUWP/I02yXFHXbEu5jTpB5M+5COJ3vtFmOh+99Uvx
         6Xfejq3C/6vp8JpksUBFWm9RjbfyBUEgVPxpJ+kWi7wnNe3U1gKNkcDW7a6Oc9CuvQuX
         z6Ooe5qobd9tMSTxe0iJ1H0VsSN+eNX4KMfAgps3liPgnSTCWGVFz9Rs37DcF0C+b9/E
         jdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585856; x=1750190656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
        b=fSzHKe4hEKVSTLoGiTbWNWu/XPmOdF+lg6EywPBHb103S464Zh5X2502+65MP3GkUa
         t5h226DjVO/eL+HmHojgXYnLrCyvd348UETE9YHgD4lQa1Zy5XHHs7JYeBlSkxOSdTVq
         kJ9nmsTE79lzXZM7wr9Q+/59a12GkKeKDBZ1M84ua3PBmFOZOj761UoO6bWPiVogtsZ0
         lGOpwwu9VgRpcrbLCkBYtx0NUoCzOgG7zuywlz5GR2jZ+dO7MdS9HtXDYdCCSK9j7poN
         YFbf66JplbOL4nN1mlpqogzDsH5c+7dTH3pC3xeqE85+edCEcng4OWM1JuvK9heXtMHC
         Xdcw==
X-Forwarded-Encrypted: i=1; AJvYcCWPZaadDsfNgPvZkRUae1U/vE7pkrCEVRhZh5lMiyrxvihYuEeziRKZKT/LnaB74G8/w0QiFJfAgJw0yRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1MvwDsQzX2/6Utd25xYXFav2qPNKZYYs8fRVD7l8EBDNhIGWg
	40Fqeqch00pzaR+CucDOSW7DUEcU8DtK6xp/aNgIGFKfOw78v+lRTg2dh9Lf00Eo1m8=
X-Gm-Gg: ASbGncvNFeH+ZjAQnK7/HNVr76a5NHbCUiGdQSoEMlZZ+nm17QdqcHwM0ylezqWWY6W
	J4mh6Fst1ObIS9HadRJUeR4GsBJflBPXMQ+AcbUS8PaC4glJaD1EUL8lwjFa0s3Q/oYzqI8PGJN
	QS5DEHIbT93G5S3Esf3o0MA/2OGzB9sM8MrtklWjsP1LbgxMvxVlHc+Is4+jN9fTayT+4+3Ww6F
	OdY/9uWTiBuULvvcUcW717+L8MF02VRaJdb9of32h0L9f5BIZLdsdFlzdqVw0RP2jKZDPFBq9H1
	blN4/myPbMGF52Z/Uxrrmzy4hqHXXhFgNnBPBfBlx7plFlp+11x3UbOMcdRW9313HtW+/sBCWWK
	z8WZAGc1dFEVFjno=
X-Google-Smtp-Source: AGHT+IER+o3LTU2puTUgTzx5nfZBbOjCThFzTKIlbQejci+9CZwNjpKLs8gAK20uD5mbsirIIc3WyA==
X-Received: by 2002:a17:902:e806:b0:234:d7b2:2abe with SMTP id d9443c01a7336-23641ac62fcmr3095555ad.7.1749585856133;
        Tue, 10 Jun 2025 13:04:16 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ffc151sm7629818a91.48.2025.06.10.13.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:04:15 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	romain.gantois@bootlin.com,
	inochiama@gmail.com,
	l.rubusch@gmail.com,
	quentin.schulz@cherry.de,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikunj Kela <nikunj.kela@sima.ai>
Subject: [PATCH] net: stmmac: extend use of snps,multicast-filter-bins property to xgmac
Date: Tue, 10 Jun 2025 13:04:11 -0700
Message-Id: <20250610200411.3751943-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
to indicate multicast filtering is not supported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..4164b3a580d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -579,6 +579,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
+		of_property_read_u32(np, "snps,multicast-filter-bins",
+				     &plat->multicast_filter_bins);
 	}
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-- 
2.34.1

