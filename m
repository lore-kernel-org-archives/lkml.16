Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E0D288535;
	Thu, 22 May 2025 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906207; cv=none; b=YAW55At+u4wf6leLUohMJga6AQ6wRQYhy1cgJ3zAq1dKej5nGiiYDUktCxqyPbeHep5UJS/7567G7dRB8x/9LNxNm5yw/LJTdvR2QwFrRGBDc73vs3tslyTmNjYg2VpTh4UAtynz0TAfzHf8e34YYuvbbn1N35JZLN6xOUV9Jhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906207; c=relaxed/simple;
	bh=lFkLA3mCN5Zc7iN6ia2qqsL8B/9v2WkT8vIEHAa/Hvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtCG9Rj3GZLq5dU1f7oiEPkpQ498aqF2HS55aDLZde0efewUIhVUovwpzVMo5HCG5ymb79WdN2EHytzDThqXyS6WJV5eiHmMXM8jAWWtHkutMpoapkpt0zuNcP8fKIs9+2ZMmLileP9Qt3lXdsT0/EkCRmYwbXxWfusOKZtpNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acbb85ce788so1511197066b.3;
        Thu, 22 May 2025 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747906204; x=1748511004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9imWNVpcHY4/YQmn253SAWo0LBrDG5vEkbvmzjj06E=;
        b=nrWU9XX5ROTG66rj09DmYgezHp79+ZVxcP9Zc+OQzirBzeb3Vl8/RYX1DxuljN9QW/
         RoIBdA/sk0O4k9xeS8ix0qYKtdblWvmnziCCgMnWOzlCS8HEpCojFwKG98tMxotZJf4I
         SyuWtKiEDvkMNeWPbrwvgZiF6bbDOBIPahGrN6CcjV3iLVi2OZWbSxsCT0W8/D8aWvvk
         aD8ZEpfPFb7AmAEREwaF+bIRnDfu5kQy3NIxUHxMUOBBZQni4BTrtMLbJMBh6zh9i80g
         NSqu2IsVHz46o/eOnfal79n/0hmwUIuqfSoczYTKO8OFpyWJJvxD+XstV3VcCHbmPxCP
         u2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXo/F48HMgaVceeiAHSBevujNgQrzsnEQlyJQlMrKLD3RQTf7K4b+CkJ6tqhyiV2UJQhFtIlxvIFidH@vger.kernel.org
X-Gm-Message-State: AOJu0YxvzNyXS0aoX0Ggv1DvnwTGlPPHRcD8nJman2sm/W3g8P5Zy8PK
	2Sg6PEBkzA09KIBXJLmTq8hHTlQtSEHObo1idGmaNxy9TgnugrzvQLQudTNcJg==
X-Gm-Gg: ASbGncvaefjo6TjwT+yLEXv+8pkXrVTbs/LPoU7AQ5pIewj6KUvBxJ9VnlYq/JJAwTC
	Ix11jQSOmyxmUDXOtqE7HhrAAB0+cwXOxdqMw5D3KflGms7j1ZtDSFJxy4LoT0B9l4tLXqeCCSU
	D9hO2yHOT3YpDTARt6U7swrHOqr04rIEOJk/iV59yQau2mEdBf4Cl4COEvNypayt6cfgSTtg54u
	d+zVriTIGoUkB40aXiTxSed84S1kyZKQoBGSEqXZc9sVB3eIK1JN8TG3G7NK7ads74bvE4lZ4DV
	c5zY/+X+BkRSRyLXZrdx3PXHnIvqEr5J34eQxQn66PeISkSm+S1+9nzv8V1aDBa4yDoFMTRYm2U
	mVXnDgbnQ03IQ
X-Google-Smtp-Source: AGHT+IH6PGZyeMyvQHBRQvlVXtj8Ud+yS5Bla8HVE2j+rxlb85y3AIQhMi0Fu03PZQrmAkfqeb8vWg==
X-Received: by 2002:a17:906:6a14:b0:ad2:2e5c:89c5 with SMTP id a640c23a62f3a-ad52d4c511cmr2217008666b.20.1747906203469;
        Thu, 22 May 2025 02:30:03 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca3bdsm1036951466b.160.2025.05.22.02.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 02:30:03 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: Enable the npu node for Alta and VIM3
Date: Thu, 22 May 2025 11:29:40 +0200
Message-ID: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now have support in Mesa and everything is ready in distros such as
Debian.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..9fd68195be3f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -39,3 +39,7 @@ &usb {
 	phy-names = "usb2-phy0", "usb2-phy1";
 };
  */
+
+&npu {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index adedc1340c78..8e9f7e0d4542 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -117,3 +117,7 @@ &cpu103 {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>, <&pwm_b_x7_pins>;
 };
+
+&npu {
+	status = "okay";
+};
-- 
2.49.0

