Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331BD23ED74;
	Wed, 11 Jun 2025 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630374; cv=none; b=H1R4OLa51ZkoG/BquqgVV94CREhpAOcg+y6f7aCME2R20RDt+ZCHGKmbQ0KwU65o6DVIP8aBnUSOAyC9QL7ZDagcF2sku0EwnDpcPiMgNUhUqjricn7KVLV+AnUnWkoD+SCH9jG9kPeOUcIrTkKnVO7uTNX/VxtDrtRSNK5+IRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630374; c=relaxed/simple;
	bh=QPbfhA2N9SqnbLhMOGWmza/oK+Yt7c/L2c7nhZXdhiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2L1kivTlKI2P5M7YejMwVohiLV3uRt6Gzb7KS5xJxyb2zll5cJ70QN6GxZ8YMalrPEZXqzEPi4b7T0ABy6zv1bLKlQIS82If/4qdCDtgKvmsiqU/ImJaGa+RlSnsSkAWdZrBZbJp8ScdtnXb5/qHDowpwmOvdw2oVIaSsZLpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+MOKe+h; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+MOKe+h"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0ad74483fso63622696d6.1;
        Wed, 11 Jun 2025 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630372; x=1750235172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=g+MOKe+hYlMwDi1GLU8jYkYiExtUeyHlIOs25rFzBb1dfOl/knIDmZVF4F8VjA6bHL
         67ztBcO91J84vncG1xwqwuwa54CblIOd2ozSlGemri31xV3yqxgPGCzpDIFC6INU3j9I
         WxTE+pUK0v6GFvs1HQUKGgPMkghzyuT8xuONBWyOGJdOdREijSXp8ROirAbQl9pVAsmn
         nVA2qXtL0/8r+oRqoPBaxnYGqeXjmxYmXh8Y71xRn9GvrNNVNVOzRQwVY9b3iHVqwEGP
         g40gXfoUZry4EiVNTpuQdTLU/2jR7AYowjWoXZUZsRoBY8tl+wBZKfqFefSJMW3GY1IR
         gwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630372; x=1750235172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=sjCpSw7l67IBMcDVr70zUZ2kZ8r3BAcHhLkHSWnkd2iWTXgIQ8vasnlEHBxQYSkgi/
         IWWqntSoeiTr7apcp2DmRfQnpzX0EyRu8IYwJZK67JXUQbH8LlMjxWSfpWmrOaD5D8kx
         HZwg9B9IyrBT1dCGrDbj4u/kKUmZOE/JAotql8J0uYYkza42UuW5FOQoHzDq4B+W9S1d
         qauCtaMS7+iAcy0D6wKRybBuXoN6dUSccs4EBuFa8Y5o2x7SxBvTmU20lng00zntKULl
         FP+CETwSl4BPPpQ5XSA3mZfKhwZWWn4OGGWrAqtL9JMlQWztskGg30mZVTRBe9hP5ABT
         VaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW8uDrfNz767X2f1gpozbvDpomUVkVS/39YOa7EcEyR+GstvywyH1qrs3eOngaI98Zz8Pp0EoUA8ai9eE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+PMuWCh3zkTtj8Y1CI8B9xzEFc+Wy4Cao+masfJIOSlTQuuO
	IvIxWzv5/ZyvJ/SSNXctfuY39mzwXL9khEr93p9D12SUk3UK+Go6a5sJ
X-Gm-Gg: ASbGnctYygVEYOJ6y0F2kNkB64az++NYJtYOeHM4XDHOuAPiUu9muYNdW3aft/8gR25
	GyRk1xe4Zk3G8ytw5akz+QeCuDaE78GeWMaFh/VfSuPa2l9u0Bmo64o7raoXEprxNCf1NwcxJ/J
	mJkIyTs+ftER5FgXfHdGUav+vtlRshOXQdVy6+3lH/6+OIp3j5vQZigF4vaOARPF8629t203t/1
	JYjSHKfPdUFI5lnXwIMU2qdQd0Po8sIYeaBe5/JRooMLeH/ZbzfEMxCZPsqxGB3NmXSheqvha3d
	ebpqnkOQ4l2k/XX7+dSfqqxbUjEwAE6h9G8GUMdnXddsBMUr
X-Google-Smtp-Source: AGHT+IHitneo6m07KgIYEwdAH+xtCGs1vUPSxrM/i2Z8Pe/8lvVYhsuxoJ4yasaZr1lrb7/koSfGuw==
X-Received: by 2002:a05:6214:da5:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6fb2c36a381mr41319726d6.21.1749630372047;
        Wed, 11 Jun 2025 01:26:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b3648dsm78896886d6.107.2025.06.11.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Wed, 11 Jun 2025 16:24:51 +0800
Message-ID: <20250611082452.1218817-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller node for cv18xx and enable it for Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi            | 14 ++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 65eceaa5d2f8..3ea3a1af103f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -428,5 +428,19 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index c7181ad99f32..f5a800f488fc 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,3 +88,7 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
-- 
2.49.0

