Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C8225B1C4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848524; cv=none; b=DLHMjAhshxFVopD6/YEVveIaghdp0vIXMfoFc8jjLIzb35sBL6x35mXPA5nu+tYbdixtX7NInCOlIV5+Or9snlJFawAbMSKQP5n3qztZh14Ywre1w5tTTxLhKo0UlUi+J8xFrBi4zVakspLZSeZdlHyMCNIBP2xKeezT8hs0ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848524; c=relaxed/simple;
	bh=mXD+KmmzczPBBdFZkWMZATRKtOxlsWbA1f0YJbPau8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9NsMqYZA3N+v4XOSVA+PokRdbuHZw8jOkTcNMd/+PNCAAZY4MAGqRizrz6LegfFzt6sa39SE/euWBrdrbBeZA9Ksyc/xNiN8+xQ93t9BkF4GthtEKwh/GFgJV8bowBaF83H4PxojNWcJwnfMQMEHQc5uzBy2WdhUplrvecHQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=b0d8WjFz; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="b0d8WjFz"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dddbdef7f0so21785865ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848521; x=1750453321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=b0d8WjFzLZ7tXMLaaOed1+2j99Gg6ZfNrTWmarFYe/RWvRX60cOgceiHCBdCv13cWm
         tUq/5xjYAzPORcgy+6dH9hz9L3byr5Ev2UPGTE5HUjSHy1j9guYif2STjCQUTMx2Ga+i
         3NVkTLeGw0/EbqBHtru1EXwV/BsjKhJU8qBZXYYyBbxuS2Suo2mqSbPOGCSrHfMUskZ5
         SAVEmKhgW9R5sF2C7Imh8Wec4FQxBOIom9qli/Vfmw1lJhPlmU19fiWzy8UoHTNyN55/
         seA/n7yQzxWNBmRw4wi/2kJ0/JbCL1fAw2f4GnzNrc3c9bcR1apRWq7Z46PJ6k8u5zBL
         oQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848521; x=1750453321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=NFT3Rg2b9wPlifCqT/9taAwxmA0bcADVRGpe8pzzDKrhLW95bQHI8go0YnLUSp5ppT
         X3neIxiuFGo6c7Xr3H58NP1pPy7/5rbI2c8bF4NPecqk623qjy6OKBKTtJh6P8a3rCXg
         vXFftQzh8qmDLarEywkHnKXY+KJ5FzVZOzjuJyEp8TlC1p3QNk65aFg/JKpG/wc08rkw
         OzlIntbkbPC7F3aHZ3xdi/t/Uv36Z97hye3fdsLsdMMxSA5/YFKBzTh6vsfCMu2WPrVA
         31Glg3VFdU7UtWbOP+pFEawNM2z6NV+uHrHmMA+4coJNjuA97RTWqCW5F2CdooU7N0eW
         haPg==
X-Forwarded-Encrypted: i=1; AJvYcCW88pJctSknqyv+LYAJtAFJZ3rCddL62WXZ1DnmGj1ZZ3Cler7Rmki8TeEEgXiMznr1j8TiS90wAcUao3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGut9zOqj4pYYTZsx6re3rtRmYwbnoFQ9GkTqFhzhQCuA7kr5
	ZKtGHkDsdGaFSP/0Y/3hHzAQAX99hlYYQn8ERTOXMfcaPR43jcj91i0DPXI7L4LtRWk=
X-Gm-Gg: ASbGncuqmWJv9JVV0slcjPb8ql+HLaAoJia1z0yEqoUehaQKN3dusVlShVps1z496vX
	Xzr+YH5PeuwSF/359Y7CZt0IhEW6LHRfKMjtQPVSBfWByOuVuV3dfhvLLjPO6weBjJqmO8Y4EQM
	WDeu5t/CsGOblnHl643TkRtJrNF233jStqF0wECVESdC9zRnvAL8uAtdYfGfhWwzo6EWvShyywO
	6ay+8sYoouSWafWZ8QWaI5TVcGGwuI16YYhtkrWegYnl4CPfCSlCo/qtvMB8AJQJ2kPhPCudjLI
	g8EVr8IMP+9jdHoKWotvFuCAUlLQWPYCJyDt0xqMwFepnFrPVzLNYx8YQBy+Y9vyHzKYAq5vEjl
	2SWTrl4rhfN4X4ciYd5r1u0UYd3SVTkbcSS4ZgEogag==
X-Google-Smtp-Source: AGHT+IEecP3cifD7NNtM4x0PtjYEOx4vfWTMQlcOrKZqxEcJodip8ZghPio2mgJZ/Wq7eeZstJYUaw==
X-Received: by 2002:a05:6e02:1f07:b0:3dd:88da:e7de with SMTP id e9e14a558f8ab-3de07cd355emr15624215ab.19.1749848521613;
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] riscv: dts: spacemit: define fixed regulators
Date: Fri, 13 Jun 2025 16:01:48 -0500
Message-ID: <20250613210150.1468845-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index f5d454937d300..8003c8173a2aa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &i2c8 {
-- 
2.45.2

