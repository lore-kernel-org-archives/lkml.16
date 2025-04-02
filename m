Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D7231CAE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584227; cv=none; b=shS3HKGcTTs6hHQMt2icFtQcH1vLQkk2eBku1gX2EPWe5PhlE5sLKe4ocEO2bkGAa1RX0aBHtFs8otTFj+ulltnR+hr3lPj4QT1kocuNP0MU1qvtASPNg3GtumKGbH5pPztbFjN5LztYBL1gOk9ARzUY4u/bZ0fUzmj12YIUELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584227; c=relaxed/simple;
	bh=EDLEgtEdlcFXO9FrxUMsvd2X/o5lf0PxVMZuhrerVdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DZlVy3kl2OtGFR50fR7q/X6xPhv7drRjo16zukYziSiKHK9462pmVFx7yoNe6BNJV/Lc93sDHynzNJsOIbDIrEGZHKA/HXH+VwusN6PqLuiW20Rb5bbFt+PxIXG4Ts1/9OIikEnl4HwJbpxFoNCOzaL7Hpj4Baw5mJ1ivSOMY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWmzGZjW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWmzGZjW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224171d6826so104978865ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584225; x=1744189025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWAPszpWlvrmrWFqRVfzalTuSm2t7m4HZ4+y2asZ5jM=;
        b=RWmzGZjWuCRc0AR3uuNDHmpK32S0A/JgpDczKzhfKpqg5U7zMkKXImA+JyoM5idzKX
         yVStGt5EA3AL+XuTH55MJhueQQdpZ3b4M0XF2UZ36D5mVkE7qz2uUV+OtuJX4Z7XAGA3
         BAgIQ6pbVLEBMxfbc5aGV+CfjH5pTFrsCJ5+f+uF+kYajFshm/gHEhtcVHcR6yfwXapM
         iIN8Xot+iDoTNmI7c1kZqoqq3K965OvwaoK5Yx1LS5oQ87UUiqCHApgA3XtY0skfgwX8
         2negglIN0EV6+ZkAHOm2+kpPoCG315tbLBLWZEpsWFwyIbJHu31T07lrp0RuvfonMmyv
         ZxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584225; x=1744189025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWAPszpWlvrmrWFqRVfzalTuSm2t7m4HZ4+y2asZ5jM=;
        b=o9JFPzz7OXE2NhCGTUoeSP4Dac7iz57AFOEXZ/Q/0M7z9PSd0dgTw7I/Bb5JVkIQEh
         oXoNO7Af1cmZK6naciqkJKGElHozS4vXp//X7HA1Xx//35+LBYmpgAtQdrWs36gn7F6p
         MgQTTQc8lDCQ7vne2JfDV1ybyl/bLupV4bktNHf1cECkSfdRAaSG+kScQoXdwTxsRNXZ
         CC45ZZEFA8kHKm5+YXaHGXNCA6d04AiNbsl/0d6MnISRU862Qq2sS1Fv++TBUA6RKCas
         ZY5TZErSTSmH9UScXXYGFHgPV6gbaAwckl1vn29Zk61wMZLn1YLi1M2CQRmRN5y2rxiP
         omxg==
X-Forwarded-Encrypted: i=1; AJvYcCXaGXb5c0GdmcHqmu/i3YbvuCiEJHxIiSOPdJDjy78Pc21tKDtwpIH7hpxLbrW0GNGKB6VRBH/dt7ulKR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkodf4IAzWJISGAjNYH8N8SjnVpljf7/UXqPOWALzAF6Ft1h44
	5YDBB05T1Z8f4G/+jVF3Iil+orxcSOtJ3PkoE3jk2zkJ2bbd5R+GpZimgxu+7r8=
X-Gm-Gg: ASbGncswrNaRLxuY3x+0ac80qsGjdXeLefUDlCbZkpFyyXr+5u6v9uuhol3wPagPkLB
	uAlyMG5MKUscTSzko6hNlK+7sC9XTW90ke7qrDTIgESXawtt2KHQMmOEYVElvpdmbXGxBLqft2u
	Kw50R0icKL+9hU7x17Q6/CzLXzFFn+5Drm53RoegMCwHDGvi/o2YSmczKl3jbA3PpeQ3M7Z8qWx
	GjNZE87oXiguCM9SfM2v+LM/vSmmgiuFhnzVxEv2Ud9bHhBCpMB6hlbtSFBdIWvs71nLnQhVuTm
	vynJOCSR6Us/+UetZv4iQ5+DP+KMdAIGKl5BT3ZFEa1+qPXV27YdQ/ebX0KQ1WgV9sJ6
X-Google-Smtp-Source: AGHT+IEB11GBk+GAE4+ZVetVY/CYu/AG8QyTGlgekDHi/jvsC7njBUNP5H6KE5bwxY7hZlGb8lzR/g==
X-Received: by 2002:a17:903:1c7:b0:224:c46:d166 with SMTP id d9443c01a7336-2292f9e53camr256175075ad.40.1743584225005;
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1de7d7sm102753925ad.173.2025.04.02.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:04 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0103E80605;
	Wed,  2 Apr 2025 17:06:10 +0800 (CST)
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
Subject: [PATCH 2/3] mtd: spi-nor: macronix: Remove duplicate flash info entries
Date: Wed,  2 Apr 2025 16:51:28 +0800
Message-Id: <20250402085129.1027670-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402085129.1027670-1-linchengming884@gmail.com>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

To clean up the code and reduce duplication, this entry is removed.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2acd8e28d1c4..07e0bd0b70a0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -160,13 +160,6 @@ static const struct flash_info macronix_nor_parts[] = {
 		/* MX25U51245G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.fixups = &macronix_qpp4b_fixups,
-	}, {
-		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.name = "mx66u51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66U1G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
-- 
2.25.1

