Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174C27EFEF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385731; cv=none; b=BOdGQpxHob3dsu7/L2OP+rGsS5myhDh4krBzH13oxRwLPNk5QoBHut6a4MS8XPeLKCb+S0Ptlfv2Rz0AZkaFnxTlPUesUXPPXswACxw6qiJ4qegeHheRkxdBqZLaNVenrv/PSIi+F7mDoW/jW2fo9+7a2ENIt2oEgKRkdpGrijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385731; c=relaxed/simple;
	bh=ZzzOGhRrHbafmgbWIr1+aT+e1/OEhZNOVAq9U/HcCko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIr7HUW5i4cMQr0P0bPf4kNQlsJXX+/GysbiT7OD6mQcrHak4Y84lcsSTVDVNWSgmp2km5AJio3RTgf1bBNw3n8QQxLIIv1rAA8XQOjhp1TbqRhfLH8CQGtqwfVI4WROYmiNjqwNUzTv8fTF8jeiOabUwYgfajRBWZKacTXqTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Pkg1bxiJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Pkg1bxiJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453066fad06so39881145e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385726; x=1751990526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=Pkg1bxiJuS3aLUqwx1b1TlOfq4v73tiyKc6Uorq9cZ3U1RrE1NlVLG18M3N1LAsMJS
         zHQdteD3Q9sc2lSK1r2d+x3JC1ZOMeFcAawgvHDMfWJ5GLUlw6qACExgR2xKwqfCi9Uy
         gVoOMFQ5V/8yIKcxsuOaAyYtm7WNMxLih8yL/9OobYhSnOiKArr2xm2VrT9j00DBx4ii
         MDO60wev+geFpHOZahP4k14FgrYAVWYZNxMXHO/Tdvk0s8xHbBcRwbgWtI9GYhd0R28p
         GxFh/xle+rwjLASJ9lcikqNqO7RunyEYsAqAvI65jDlt55SKAhRv+e2Iw0/lNpDRx1DQ
         48Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385726; x=1751990526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=wSO9bv3BDfT5cCZ3Boacuke/1WpvwiHhazZeA42jS0NuhuutYTR8JfaqGxB9TVItVR
         jEn4HQH69wP4Z3Imckahlbm5rlt3GSICHw/RQ8PcnimAdsUffeLgUBNnUlIqnSdQRNmg
         vzHU60glFGRmk2MP7WlnGjxpSoRDKtNqH8JAK4CVZeILt35e+pbFpM7/bbit4NdxqY+P
         6HEVWBOzjkCGfEr/bKC5jIfHhZN2ioFn1YIaP/jUlD3Y6J3FjQuxpGTwxzScb69l6WwL
         qmfsjRPtnEU5BRhyy6KHxC8mBW4XnuyDIJWyb5dx14d1XFc9/KsrT2jaXfpljz+X+Q4a
         Ud8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBIA0JXS+WP2brqltqvBuVX8L3/2PIQ0TZ1zaA0B/oXDRQBJWumSOf9+lm6tt1hFNvuNg6otzBbHiVOpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32t79Pye4u+oKHNKAFwAyqZCA+Voh6+E5BaghUHCSUPW0f5SG
	uuQpbjWKIRvWi32AYRy6NFqS0w6brH+kfdEvlcalfEW0zCtrxdMax6a200y9zIA2t6E=
X-Gm-Gg: ASbGncuq5EDBjpP1EeYRzIz7LCIlSA0FKmzA8xuZOaWdnyPkJqt5fgHQhyrxSkgzssJ
	x0mJAlQZGG9wB3q91bUmwlCNDRhuMMyfVvAiorq9gAv3BuC0CNvnwZNamcxu8rsCei/VU2Z8o76
	6PF/KvN1+U3va9emxak6WF+h8D1jeCdT43s7QHS09woTI20QsPQd+XGrjivHRYl1MDbC0zgmRSQ
	HelefrLANeBeqmfGFqtB+etOi/zFdOxDNUfxJRS/ggcNNFu8vR0ZcK0VL17PFnNKZHZR9oiIk4i
	q7Be7z/WbS+qUR1JGwMovdLEPDsFLfRYfBCEiRSOc3BSN7EdDmodyg==
X-Google-Smtp-Source: AGHT+IHNr5gKLLJ5dI/LXYzeaaajt8CK6iLWqWjb6+EEC5MHBgr73n33/C9RKxWuy86u708WLprggA==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr159248665e9.6.1751385726126;
        Tue, 01 Jul 2025 09:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:05 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:40 +0100
Subject: [PATCH v4 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-5-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..7984caa861e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..35b673e9ab28 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb00000 {
+			compatible = "brcm,bcm2711-hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>,
+			      <0x0 0x7eb10000  0x1000>;
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1

