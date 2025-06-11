Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3623D2B7;
	Wed, 11 Jun 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629137; cv=none; b=dKLJ164DV8v6dfxeNPYKVCLWVyORDMlv2ExNAP8DdtrTtXaQGeawIMuNci5yNYmtwlRN85V/k+LclD8+no6jhQCHUX62mgngYLC0xpwAHJ7nrgZh34CDSihfKECvxIoApwtSUZ9ovLfUH7Mt6THGZhO02prgDBzwuzeZAQ8656E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629137; c=relaxed/simple;
	bh=ksxwUpTOiHs8+q66VTmfX8wWRdcGwOcrXZXRtm7yr3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPqkXVD2x2u3a2tRGxo46SvqyVGK+k9TNrlNwt3/3Xf4i2GNMh7ryZdRVXdvcjyW3JQOfAbEzE3mf5nqcqnzFQ8hjbB5de4AelpYQnJacqTmb2E04s1WieK4MLkLzcj+lRIXgFfYoyc9e+y+1y3uz/pvCALShzOyDgIfWX6WDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1kdHQFc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1kdHQFc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23602481460so43894675ad.0;
        Wed, 11 Jun 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629135; x=1750233935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yiAY4Q83bBJo2+drko8BS93Fxqshr7ucprcwVtMnHY=;
        b=e1kdHQFcGsYU6OU0YmPkhy4uCLbEKt6hDXx3XeduTu+yMlZAswxEQ51Ofcw+ChTqgD
         4Vsf2xWQyM3bAAzynvEO401xgy7fSIyDSqYpWeSavGnxok1SuljZSMmIUn09UGE60xLN
         9sIPpitpdXWj/qc0N7kV9SJRWIS3QSysd4X+EaAxYAdyOYHZSg489/1RyESsD/MEkvXj
         O3mwsWVYwGKoM/UUfWPFc66M8XTHHGHbLjLUlCskAF1/yo4foqNDR87Sdm2ezejXmhs3
         LIKtWsHpvIzGDyZqDnhSFsNOXWVDj6rgu7iSJMtMqCfhlcUtgK6OYWRCwZrraUhq9mq2
         +7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629135; x=1750233935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yiAY4Q83bBJo2+drko8BS93Fxqshr7ucprcwVtMnHY=;
        b=RIkxPIAtJC0r1YjFuiOLr12BM5Wm6SyD5t2MOfih+b0R9KVB5qNbazdvcmxMrjciu9
         nvbTpjRIU8MHl7MkyT09KG7z6/3+2HqyrMOfDR5QB38Lq1AJw5UxZWoKlmL7r/vwzCpw
         8GNzK7MvclzxKXOtzGjIY/E1EB4BZ/SAlPopFhDQHxx2GaIUo8pdFlKsCcJ6LpEnow4p
         /VIxuhvna3+NNVEW8bB2TSvMjDsALLZQb0LHfiIwVNsuss/A5A5SZMoBu5s42YmNoYYv
         k2cJI1Dd0su3+/yuCdb2Buu2yXd7vbri3APGEsgX00gEFGjGsCEtfJeMZo8qhuMhpxKs
         aa4g==
X-Forwarded-Encrypted: i=1; AJvYcCV2D065P2btn6d8iW99Z35jt9cSdBDFqcCQTdVKmNMtMxOVYkK6IvWzIGcROuQDCV2+K4Ay3AoXXIQw@vger.kernel.org, AJvYcCV5evf2VgK6cSBvGOp0QkIG4BhaZ/WdrK+GsyXb5r3u+ZnJlyGav2gEiQfi4gvSR1oMSHCrWneevymrjoIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgveSgDVHU40Vziw7kKiqy/oVcKL16FtIbz14p3BHrrPiVMHd
	kl74DFCWUpFJu4bnzrsD9/fKUPr5J9LklQPvjS7ZC7P3qJ2Pb9EPhbE2
X-Gm-Gg: ASbGnctEUP1SlTOF4q/NgN9BjwZomxMbgcJ78eM6ZyASeV3GBZ0CWfH8sfFwkAHey1z
	C95N6HE1cAwwHxrQ8ccnFxCUE/ezK8qEFWI8AIgu5Tgfz5JXW3Ik0Y8B3wIktrFwL06ozvJBrww
	tvKinDNBB+Sh3D4Skf1evZ80N3BTvrg4RNpc+B9Ol7iIQpcSZR0P4FuLaPE/b7AXyve4DVisZCY
	cs2d/gwcZhTsvx4bZDRQE90/d6MRYJ0PkCeobREGQDkBeD5NN+Y6D7rfNMuWzTMGgWl7vWOUgnY
	AyGdNhHyPXtGzmVf4HYmeDIzjg+IVyhDfBKPQUAVU8EA6lgdgHABJr3ep5VnsH7M+O8QjqPO1mM
	zQTqSwC8btuUVLqAKn0t222jD7Cmq2T20gw5q46+/HYJVe9vIWzeRsvbRxj0s5F7GvwDCIXffyl
	tjvg6KDQ==
X-Google-Smtp-Source: AGHT+IEzwF+A+5L5D4Y4qNQiMWPC4Srdbngbqeik56tXJV3s90XynVUFJWSxoFJi+YjtiMgfTeH52w==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr37862505ad.36.1749629134891;
        Wed, 11 Jun 2025 01:05:34 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 5/5] ARM: dts: aspeed: harma: add mmc health
Date: Wed, 11 Jun 2025 16:05:14 +0800
Message-Id: <20250611080514.3123335-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a GPIO expander node at address 0x13 on i2c11 bus
to monitor MMC health status via a dedicated GPIO line.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index fb026c8fb0ee..b9a93f23bd0a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -454,6 +454,25 @@ eeprom@52 {
 &i2c11 {
 	status = "okay";
 
+	gpio@13 {
+		compatible = "nxp,pca9555";
+		reg = <0x13>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <222 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","health-mmc",
+		"","",
+		"","",
+		"","",
+		"","";
+	};
+
 	gpio@30 {
 		compatible = "nxp,pca9555";
 		reg = <0x30>;
-- 
2.25.1

