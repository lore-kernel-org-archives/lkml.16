Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01EB1E1DEB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877902; cv=none; b=QKOTJRSCCJcDyAJPwx9bcITf+1OIgT7Heiqq4RYwtIiGJgP83+kQ1xY6vWTXtAwQ5f0ZILE/gWMslSJKMqtjTWHTBaGKljrubt5LQrnGCFQxJdnKVtSoZO+uNCS9qZfz3GJ0Bo8iaF7u4j3bSHjcCsZhJRn90l9mZHeCLYfIzL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877902; c=relaxed/simple;
	bh=fW0TQ8nOnU4Jx4AoHnkaEvv/lfcuryOc9/dByg6Axvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBGBoYyxUg9G+Ql3+Ho3YXtfI++1b/ndhI1f07UEPcWvzIFMRNxnX/MdAKOv3Z8Rm6HLhqxChZRgsvx989vxj8ikZ3mwgHxWMuo6nZPXwzPFOTRANzVP8mMXGRhEbXQwcs+h0r6xSEx6rlF8lByiITNuJvecQX0LUZYxfejgpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com; spf=pass smtp.mailfrom=tlvince.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlvince.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso4727385e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877899; x=1745482699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhbx+bCAusBuhB4YSBmCMqVpTWQm/Knsl3YIFunD95w=;
        b=qyot+Zns1/1Vzk8zfM03x9NIu2MdJN4n1YqScYwQ2GDhrzBaRp9KXFJmU9nf4V9+0p
         N1YgD+jqW/5k2k/dY09Cuh/FYjOuDcUNk7GzHNtV13kmJp9FD7hbP0mCIihKTAKTvx03
         JyCermtBPBpTomQAlGmQhzpJGQtyolyyoumm4khZGo2aZclgs8aMSPMitFFWErYhIkOA
         71m+6rp7b6JSwofXqh4IDpJEmtUpd6MmY2PrKR6EfOOLtepHzwaK+hWUVU4OkJfV5LzL
         3ZBuOvi++zkey0BOsO9awwBYNyW1KeUiiVcF/kI1R9oH1s/uUU7DBZE+2nvofuB/uxaM
         OlYg==
X-Forwarded-Encrypted: i=1; AJvYcCVqvzZKX+Yw6Oi+rkXMWU6fQCY3OY4Aq9hX7g4lMZ/Q3bfN7GRScOmP2l40e5d1TZbbk2jqLGVBhF7wkzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZa+8q0v4pbkoiLpkvlSKcOjcwxaGnPDMuxBbEsQQOkFzockm
	DWuf4IoHO3gxqiZNb4he+3qOibLpsn0KziAMTgHlcQvLaF8ERfuVx/WfeTDn+jmo4zCQPqdd322
	HW2M=
X-Gm-Gg: ASbGncsy+8tlUC8fj3DPxsmkCiOTn/iCaSvyATEbtVF4WqWitAXn9oHyelb7i8zhucm
	bUriA1PohhkW5miLZhfMd1atyEBL/obz8EZ+vyWlrKuPZhr9KtI0xMdHu7qhfu5WA2OTxuXDdXx
	4kgv+X+NDAyjGlNeFaevnKG5dQ/89zaMuBV5Tgr98F7ZsTthwU2tsVCq+gUJ0uKWKVIX99HdZXN
	pmGkZIkzvulQ64oxNVsHRDfWIZ+Sy1kOlpWnaw5tStraRZlOqTMZCPOPYHAHzozE27OkR5pvVbY
	rgDdwb7zj6ESwR5ZfvE+UTBN/jKb6uAFhstjCOxS6fXLpneCvw+5abwrWgwOVZbnDCsUBvUK5kD
	rI9F+PpSkEo/hYoLev0z0ajzUVLa76A==
X-Google-Smtp-Source: AGHT+IGvy0Cgkf7H1TJZ2HluLS9omEvNiYqpVykTs/EUqIvX4ArBY7w7s0uPn7G1fXY2icsH1GaztA==
X-Received: by 2002:a05:6000:1a88:b0:39e:dd1e:f325 with SMTP id ffacd0b85a97d-39ee5b3623cmr3756603f8f.31.1744877898995;
        Thu, 17 Apr 2025 01:18:18 -0700 (PDT)
Received: from framework.filo.uk (lewi-26-b2-v4wan-163478-cust494.vm4.cable.virginm.net. [86.21.73.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978018sm19055720f8f.49.2025.04.17.01.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:18:18 -0700 (PDT)
From: Tom Vincent <linux@tlvince.com>
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Vincent <linux@tlvince.com>
Subject: [PATCH] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
Date: Thu, 17 Apr 2025 09:17:53 +0100
Message-ID: <20250417081753.644950-1-linux@tlvince.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Realtek RT5616 audio codec on the FriendlyElec CM3588 module fails
to probe correctly due to the missing clock properties. This results
in distorted analogue audio output.

Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
the standard sample rates per other RK3588 devices.

Signed-off-by: Tom Vincent <linux@tlvince.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index e3a9598b99fc..cacffc851584 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -222,6 +222,10 @@ rt5616: audio-codec@1b {
 		compatible = "realtek,rt5616";
 		reg = <0x1b>;
 		#sound-dai-cells = <0>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
 	};
 };
 
-- 
2.49.0

