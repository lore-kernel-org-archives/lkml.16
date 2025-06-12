Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306091F3D56;
	Thu, 12 Jun 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714692; cv=none; b=sr0lTMSJ4hm3CabDooft+k7lkddiApvXsdA23T5rWWCwdR6UVrFsKM9TSQ3tptF7HyN08wzwICWD+gegtZS+37WfZVV5ymvVpxo/alBr88tooGHnX2cWgyF2z8MQKPkm6O/DmsOlupdAQBQY0Yi5lfhMMjFxyYE/Ucxk+EhAuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714692; c=relaxed/simple;
	bh=V0+ki51DVrkVbXtl6/gYN/Gkb9exxrbXA3cRDGVVahQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=r77u1iTtFLilndgapVCZyh20+2Uv58nzvyGT9C998/nzF/lpezSsMDS7si7zmCMNOxnHLkspU7Q02MQ4LkjKs+sdaL6AsdtGhnfS7to2KGWVsfQxlAV417ZPt1GgnhPlxzpXMaKf01u4L/nFXVE+M716lqa11LxgPs02Hmh6/iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L65AzWga; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L65AzWga"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso539150a91.0;
        Thu, 12 Jun 2025 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714690; x=1750319490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swocyyVkC1m0yK3KFc05VY0vapacmuONNBylQbQbwQM=;
        b=L65AzWgabpjTV+100djmIvN13tgB5pugl6qzet2H+/bk1W9ZppXXD6LOhRdh7zI8KF
         ULDrEkzEModcLODstZJ2aGlHVXSciqgANeogj+ltRiVed0c/WInU1FBCG1Bx6yitFupm
         HnBZAy5N6YyCkTR65BZERZQZq6ZyiPEaGGFZLoPntGlT/f6Zy0Mg06chN4gmk2qzo86k
         zOtYh/WVUSYoJNFTtEZxE2EVSKxs2JxWsTfVj9ot3zQak0yZOUkAU9dLvVNYvYk+vzf9
         cMsf4XtOn6h+B9VxB1llE8EPihrTUGP40aFGXB52XXGo+i61E9YJ2AEhnTCZwZleyl2Y
         HE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714690; x=1750319490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swocyyVkC1m0yK3KFc05VY0vapacmuONNBylQbQbwQM=;
        b=WCd3kEC93RhaXiRhviMcZ0dFR2VOeT5+7cb3uB4y1eo9nvWySkaWf5oNQGavhbStpL
         tOV7BCwvCDHgnE45Gz5DWoglJzeSAKyeT3sD+PwWZFeTbsBcOVqp6Xbz93ZP6NKXbaSB
         a9M7zd0CCd5MGmrmX2uDuFI8fnyPA5BPhOXPclivluqwIIVUZOEesos7Ncl+vyeB1GRc
         ciy5wDIwwDNMScJYnKFv3+3Wq7W38CDK4pmj1sdkqzqbFRnvaeGnETSwNULva14e897E
         0U3w5aPK92n1gtCT3VOLquoS63BQDbNn7X1rPeDDsVjeRNzfTpGf0XcepEDz3P7bwj6y
         /DFg==
X-Forwarded-Encrypted: i=1; AJvYcCWEkAq348D9UzD9tE8Jy1TbXlDl/XLVzthTvWTi9vE8L3bA0kqe4oqb2dBXA3dcyjyMF7giBdRELdXwt4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvx4TUYBrXBPGzabeRu9XOjGXSTKiL0rP9VZkzani7GxDvK6Nw
	cok1L5T0AfjWbNw5Ybzpat/ZjVBUYYu6Vtl2TQ0uIJg33kigbWW9N9zZTu227MB4/F0=
X-Gm-Gg: ASbGncvNjC+0Z74VfvXBgac77GomCcvkPkqRla8Pt8+CCqhTSu31NCCXpYAwJMBl/o3
	jhcdQ4W7ot6TrSDDMfU1SYuK1QMHzBIDFgAt6jYfBhSDkubIfWm7dfEhHkHqfqr67yU+fXK2zHI
	z/d5fyzflAbrH1IrIYHLabtGILFXPY9BxwYxuLe87EBaRkEUTFS6p7C1tfHs+/ZlrQC9V3P6N43
	ENzZ3L0jcreC/fOTMlEemtEgR1nTOcuQE/W28UpmI5U06trxD8PcbFgQ2riuCST3x9sHe0S1ejQ
	q8oJzT6dgG3e8/jYqsIXfhEK1MPy1cfE+/KWc553h92ubit7JaZZUxI8BbcDOtZEeEzHQdwLwHV
	i4k1gcxO3h1leZZy+ITWpmBY=
X-Google-Smtp-Source: AGHT+IGjalZHIM8I5uIyPD4PFNJrTr3b+7NZ2QJSRfZ+xrOON4O5ngplWUEXGHHBCAbhjmak68v2CA==
X-Received: by 2002:a17:90b:4986:b0:312:e618:bd53 with SMTP id 98e67ed59e1d1-313af1e44a0mr7908723a91.26.1749714690389;
        Thu, 12 Jun 2025 00:51:30 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6.. ([2405:201:4042:d128:1895:113a:65dd:3ae0])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e3b9sm915761a91.29.2025.06.12.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:51:30 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH v2] ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes
Date: Thu, 12 Jun 2025 13:20:57 +0530
Message-Id: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix an obvious spelling error in the DTS file for the Lanyang BMC
("lable" → "label"). This was reported by bugzilla a few years ago
but never got fixed.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
V1 -> V2: Changed the subject prefix and addressed review comments from Andrew Jeffery
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
index 370738572a55..8b9d382241ff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.34.1

