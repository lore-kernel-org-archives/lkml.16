Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF08227E82
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012792; cv=none; b=lSKmc5biFi753/H5w3o9ZqJkm+Ixm6StWABgeFx7lUBs8Se4nX1xhA7FbcumOxJ9zbn0mJp9NppVtn1Ev0HyPbgp6xlg6SD+V1Lgz6n1LmsNa0+u2aG1qjvjcJDuvrCl1OWCMUq3htpJa2zzTMFsw0TM9tkmGV9N0CbCFREYIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012792; c=relaxed/simple;
	bh=xU1HqN5jIZuMoEwiZ6e9Eba5EPOxt8dHq5vJ+FIdr3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ADhooJYR94jhBphALPbcCVZo2F6T+CiMxgVHOsZHEQKQtPqjDI40G2KJ3/2V2yLVkdPwtu5WK/tK90M/KSbe1UKtCe1h68dA4MObDs/fAIuEvf7w5AtOgSAlAyE9ECu1uY/nR5I/e5CXmbVvnMRJliIMzSmC8L5C/F/4/VFIVro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIXTJ1DV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIXTJ1DV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224171d6826so53561855ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012790; x=1744617590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1O9zQlMZRDF7LK3DGvq/Uhx/OHVxdJWIZ8HatjwyBk=;
        b=AIXTJ1DVu9NiHhPLwu0GkBqyZu6uWJZUr7k7E7wX3zVXQIO5Rh/agPzEBSNTCHnoXx
         luVDIYu3+qMJ3gVXu4NLI4FO040ppZjsxSTtu3fAYmpxN+Dy4PKB2oNq06xNhSpCdFcO
         otbtgbdsjbrepmIrY9jpH8d4J8uz9JZdii4HLEOLQk4T9sV1rpQjn9atBFxltTfR9C+6
         9B8oCa4+KU2IwqNcw31YZh573XM7O5150X+aYcMxIIf43f/lrjkKM1PvAzU+QDaVdsnO
         U745jLrhkyqDskNFcsL/qYnFPRWlWkshIisK92iPkqkkqHJq/TMZjQ9ChJfxvv+hDU1b
         k2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012790; x=1744617590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1O9zQlMZRDF7LK3DGvq/Uhx/OHVxdJWIZ8HatjwyBk=;
        b=n8EN8hgdib8X1CDW0/0XtVHKbUu+OeppUP7WacnhaZI0/2n3mhxXhEKtm6hlLySb3V
         mSDPOFFUCuI5mgq/MK5jcusYPkjnMQ4w4exnQkghZzq7oMubuN3p3XEKucQNv3oLwVhL
         0js88vXugb2aOkg+2meepwN3wmIt1cOE9LVM/LDTAAe6o0/nCPjAGfNc/M4DFgFI4OM9
         9l1cQQWJGXdgouqRUc5LBMSyWA+zhPtDgGlG+cHU1+RmsAFjeyAFPHKdKh3XuaI2c9b6
         z59YFwUqQ2xw97D5TDq7JxY1Oqku9ilVx5yPswmw0VU5ODWtOKmS37BMqDcFkVcgrhMW
         u9zw==
X-Forwarded-Encrypted: i=1; AJvYcCU44n9pNQjn7tmNr7mDCuPHy5Pb0DH4Hi/rXxV/QZZ2ECwoPlUMT/P79RArOAAKP26CbH8R1e8zZKQPKYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbe9TTKL8L9cmB0RW2k+ISUGcB4S54KNDZrWOTr6DaFAmUEiCq
	tzInDhDbWqtHpU4tuIrhLpxrdgIpCgmFnYSf9DZ3rQ12Y8G5czLm
X-Gm-Gg: ASbGncsYmU2Bh60fiv3JCa88IuOiZvBhIBuCZ6gGPw/OZbe0jYiAYoSnFF9qLtkp3pf
	ZDvAGYJBdrPN5l/Mn66MqlzD0NaA8KAqWH5e7V9LulP9BgBkY2EqSLz/x3GdBuxugQQU4/5pe1m
	yQh1SJgkEhcnkYmuZo3U+h1DGWYQHwSRggDg3pJh+7xqOvvKWHrfB1O42QzppC9aLP+KVT5zOpU
	MFymsFEKZa3eg5sCWAkGjeDu8ugVxuTWag39StfwFYyO2GS42+QgpSRlTS6xLvMqAdTYCom8kpF
	3fIo2U6DbA0jCVQf/0ZWyDVwbeQbZLzbCyj4C3c2uSCNtTGETQALXZfJo/0L76FuhTtL
X-Google-Smtp-Source: AGHT+IHd2dyG7PGO7w3nUgfbhHliSsLoD3UO4NI+MU+OxQcHsvYPua9u1wZB9NMCzwguGQtVDERgBA==
X-Received: by 2002:a17:903:1cb:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-22a8a0428b8mr165368865ad.4.1744012789988;
        Mon, 07 Apr 2025 00:59:49 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0202sm75162645ad.88.2025.04.07.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:49 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 07B27801D7;
	Mon,  7 Apr 2025 16:08:46 +0800 (CST)
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
Subject: [PATCH v2 2/3] mtd: spi-nor: macronix: Remove duplicate flash info entries
Date: Mon,  7 Apr 2025 15:53:59 +0800
Message-Id: <20250407075400.1113177-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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

