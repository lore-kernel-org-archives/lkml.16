Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFC19DFAB;
	Sun,  6 Jul 2025 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775854; cv=none; b=rYR0LqSoOPVFcyRcOnykH/dVTx9+22nm/Sp56dZ44ykABaq1NAYBrmtYFH3lV3r01ZlTOZHe7PX7DM/FMeyDPy32KdF7E/nZCPXlap2Dcujf39MsnjfBOKPTA90LAPxGx9VTG2u2K22qwYfCIV7qGxTvMKEqi1bpXWoBcPXBvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775854; c=relaxed/simple;
	bh=hDRG5gmnKA0MrpUEZ8qGZKcWOdaRzS5iZCHW/0Iqt2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYM+ahQFwzIe3ObT3sfiJt6Ll8n1VLcbXRdHDZs2Flco74qSmmZ1JJKdXCNXpHI1fMzrGCUr5FooShUFtpl5KYynEqxMWHzDkRYdMk3KuZUvGnIe0Nk1tSAkZ8TwKassF1UfmIVGd7sNnPPrgZiuEvOHTJrqkpJmHPxHLT/IQo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE2st1GA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE2st1GA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so2416645b3a.0;
        Sat, 05 Jul 2025 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775852; x=1752380652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q7LJMY8xVzffKNJ4NYk1OAivwG9rzCLSSHWqEjhDJY=;
        b=eE2st1GApuCJJ4TWdIXkPHmw5q4AG+KPXRHYmXo5xjmFs1GBPx37JMt8i5HjSJffbU
         30Wr6IBWxm2vcyCPT0mU2teuamDkxPn1eqAiiaLhcEIfwHSwMIcut8s2HAVzRDNJ+neE
         qQNQEfTKn/b1kURCcP2w8kcB2uY9hDPhXNUORUGBnBfXp3SY1mNToHDdOuZVClwe9X0C
         CxBe9IPO7rQm58HPZ6vXMxzcQKGmhdwjpatVJoYsQxTCfTe7BHDhzsmvSVT6b+p445qB
         tXGiMZBQ+1BG8x4Z187iZLCfQq6J3YSBfPw7s22JwpT42P5LHzQChXQqnrWHFlAGkfw1
         qNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775852; x=1752380652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q7LJMY8xVzffKNJ4NYk1OAivwG9rzCLSSHWqEjhDJY=;
        b=MPVCz0LYrJFE23unU1UvLNhp8Yt4ZACwYWF5AMjQ0PtAnp66EkS2R/xIP2smUFbSe9
         9C+l26zYPlNW1s6mLFbYFCSsOXcpdJKtQqY6CnlngAsq0zpe6od+bNnqdypCNeyy3j8M
         WP/AIK4YVdlUyPFfHu0EHf7TLda+zHOUR31YTAhu7AJa4B57kZWeexQTc0ge5Hpj7kmI
         CWK97fcqecUbYlcayO6ZWnC62QR0zy2kWtz/PlLwX8tpVl5U/EMezRw84vN4ZkrNP2qt
         J1up38qKVLG3n5pNIUcel7jwpqDvInH3cf8DFAz5Ybl/R2sbspIIiL6ErSui1/1rfh7B
         EEcA==
X-Forwarded-Encrypted: i=1; AJvYcCV2sMushRF+ALzOzEUTJP066f3pWNiBb4FxqDl9Rpj14+PrrmQ6B3REh9iIRLHT3nRlTYhfTEZdqVxT@vger.kernel.org, AJvYcCXCXUO5SggVTKxhrbpaosUOpt6XZfxEnL0mBxfaRm0jKzYIAKfEROCw0z3y1c+lm1BD3anbY2RnusMfQXrG@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1acODzv8Bn/5IIs9kcy38cq61TkdmOMhDhowENWxKaUW697H
	tzxrRcjJAxr9IEuEuoKrvCHdAgFTtQEKWZ+pH20bib1iy3UkX1hlYQV+
X-Gm-Gg: ASbGncvG4IshOjJk+orUxI3OzBmqBnImfwhwOFlhmd5idP7cjsYfXhmo/A3Y5kDb8Rc
	IOrJDlURQFssHmoHifDqUQd/P0AQXI0D4U8llhzt7ovoj3TlNRAJuzR4lCW942oDL+jbj7b8/JA
	HCk/exstSgQkWdF+zfYX/HTml2q0wZ7nXiTXAlt8wJuAFF5NdKMMY8H6AKZT6g7F073wAxnspGB
	1xHD4DROl3A6OERqLfy49wSaNN4RgakLLfKiLpKZmee46YRQVC1OWpKeu9QKuE5c0+vP4AuTGu8
	awRaI2TPAbUh4jcfpymz9pRXDQNMCIc/hnhsa9Szy2PeQgEZ6e1VwvNLaxlEX7iFO8s52h1H3Ct
	y62ZW8pf/lVyk1Ljti8iZiSru8F52yK3OJIZNXVQ=
X-Google-Smtp-Source: AGHT+IHGJwxyT4BPTriGCEWBu4qPg2RzIh4iiJwsvscWuncu9KiKAXa2wtlgAnq/C6Jh5T4u29QO6w==
X-Received: by 2002:a05:6a21:207:b0:228:6699:87ef with SMTP id adf61e73a8af0-22866998812mr1264529637.13.1751775852509;
        Sat, 05 Jul 2025 21:24:12 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:12 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 2/9] ARM: dts: aspeed: fuji: Fix DTB warnings
Date: Sat,  5 Jul 2025 21:23:52 -0700
Message-ID: <20250706042404.138128-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Remove redundant adm1278 properties from fuji dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..840d19d6b1d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -248,8 +248,6 @@ imux16: i2c@0 {
 			adm1278@10 {
 				compatible = "adi,adm1278";
 				reg = <0x10>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				shunt-resistor-micro-ohms = <1500>;
 			};
 		};
@@ -577,8 +575,6 @@ imux67: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
@@ -648,8 +644,6 @@ imux75: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
-- 
2.47.1

