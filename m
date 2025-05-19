Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7C267B94
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648497; cv=none; b=fFePgzOIXaWbF79IYb8QL4HHWcJBJj+YN1y1kpuvP+c5xuW0rfMZV4HiBWDwTqSyOLzDMMgdff0TB8z4gs92OA0QRkeD+GrMo6O2J8o4xs5/abP/KT9P7eLqm5U1A8T8wUyYFBppfd27ksH1S2YW6EyQuJs051jAjJRYbuq2cPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648497; c=relaxed/simple;
	bh=5IzQO2W9y3AReFkI22LxozTjcVm+6tQWchN1ofB7LYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8pbdbJ0OqmeobRm+J2PRhtcU4rloVDk07WzLnXgzIyW0ipg3Mea+vNwVHhDq8FwluG2m4ztBXUtmU6PWCL6CyTCNXxRSIm03tgILVzVqB1Hz6QF860z/4upqv/S9a1ZRuk2JyT6dGhkwPoZgxrkkVgbsG97wH0cY2yQAYwamoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdPqcYHT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdPqcYHT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so262996f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747648490; x=1748253290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTY2lLHiJfzC0bXx0w26HcpCndBQvAil7DOu/C1/+Wk=;
        b=XdPqcYHTERVBAF6L4AxBC4QtKOb6ljZPB4rSzGl+jPA0n+9Q3A3tHZMolm+38AhA9X
         nzygoAVKYgprNhken7LUdQD2l4p5dvLitrskCPYcpMwGZ3KqZi/O9c8K8VLR4x4PGcWl
         0fg+YzFTvp/quuRZQpyCxWDbPh+qSeA5u8SOmKwkuJvTZz0mobmwXCXoV4WQGwFrMeh9
         tfQ8lRQA2+4JlsDVRuBgpJnFMjIaszDp5+5j0NHKku/Gs6UBSQ/VmDiBPNs3e0HHdQf/
         C1e1M1+iv2MOPB/QU3uoNuAD7Z0eU6BuCVJRn4OwjkLYjt9SuEbi+MYaAZU/8ixdORZI
         aWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648490; x=1748253290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTY2lLHiJfzC0bXx0w26HcpCndBQvAil7DOu/C1/+Wk=;
        b=IhZEbPtr9Cx1vD+EUUKqLWYDEIl3k0gKy9LfZ1juLVvkOawo9/Q/S7xGRBTx42Vo0E
         EbJzgHjkLTnYFBE5nPo9eqBCajeaKnkYHx9tPEXNM3+zNKqF4neqLJ7tgWrvV2kaJ7F0
         RBqmF9nC8gQ9KxhZz0PvfUBuyaHxjXBndyx5fUTFAlL8ZusmYnSpvOqMkGAmRoCi4mAu
         Oz2695dwzHjdLdYV75e2SgUS4H6N1ekbABRD0Y4ZRJBtRZWXxcvSoCXIG8Um6qKcp0VX
         wzD8ddrdFq/YgxnRvIHLTOy6xkUYyAZQaTvU/FqVdWxaIh4+w+C/v23cSKL9iGZ+c0eD
         0pMg==
X-Forwarded-Encrypted: i=1; AJvYcCU6SzClJyZTRbvhAAeRLgf2rVIO0vBa1N+c0x57bUrckTL0IB3rcTTzUDpi26uGjaDyexJwmPgbC1M1fic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJ3iT9oR7fKm6lDd8jOvR03UHPEXgaYHzUNfePQL0qC2TM/6r
	uCNBdntKQ4TOsjeFeyWPVEwAbiR14RHo5G1ywpuhBpvhmFhaQROu7yl/eI3Br8vqoZiCURUJuQU
	5cfUH
X-Gm-Gg: ASbGnctM/aFSN2HoF9CE1rPoxtwHbgglB23UfYHeHt57na4L2o+8A5nWzkzWkS67vT9
	8UTNveFODnGlC3i+k4h+dKKKsPf2bpcTM7hcKk+TC+mx0pAoPyDVWOCqIMoPshCIVzGejvaJm1F
	7EJlziCUn34BZhG+dKxx4lAQ61vheND6QKhbgI0xe4HR2sYsOFemMufxDFbnIMQvbCtEyeoIbZC
	KoxGVTqjV2MD8xPJTuQlV1TpaC61mVHAgm2Vq/JhPVbCHrxO0b/K53QOctsjOBG1i9mywoMhYRM
	lnx9KE+hWN7NE5m/yBDZAepMV/uBOHeiS9RK2rwJqK3noa3Szr6JOghYYNP5/UAPQOovkBhmEvk
	QM/ayFw==
X-Google-Smtp-Source: AGHT+IGcmqizIC0RoKHIp6SBn8x9mgarafCXx814XBWhIc2c1OVtjGEWpNh7ym9DuOgvgXLvh/0Xug==
X-Received: by 2002:a5d:5988:0:b0:3a3:6a77:3388 with SMTP id ffacd0b85a97d-3a36a7737c4mr1496447f8f.10.1747648490556;
        Mon, 19 May 2025 02:54:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d0fasm12282616f8f.8.2025.05.19.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:54:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 19 May 2025 11:54:43 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-sm8750-audio-part-2-v2-1-5ac5afdf4ee2@linaro.org>
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5IzQO2W9y3AReFkI22LxozTjcVm+6tQWchN1ofB7LYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoKv/m8MEHcTmdAvrWGeUyuEm5df6vR+xCbhdBs
 m1DIco4OYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCr/5gAKCRDBN2bmhouD
 14cND/4vjfmKdTCRmqPwvghESR3N6nWv3AVn3Us/+MpHz7LkElmPcCXuNxese2h1wohQcre1bcf
 zXaaDDy1x38W+Qd3FWiSfYJ13sqF4uuTwzecIhDlLymK1md9TdXcrvasDyR1S1iNNqnVImiSt+z
 DhOWPjYzQP80o5HPt+1TNvx5vYSbSqwtkIpynu1w7hAgZ13goXwo68jF44btDo6t4xWg9lknlsP
 /U5IqCkbiOsIcd0w2kCDQRbIau47AGyTFd1UZMeIbUSMw+LE7TopzJYQs2t7iZ7mUm1SQ1ubU0G
 p8Er6jCTH6DSAUGcNcx+HWKxIt/hRLA+aH4DNjOB3s4SLwtTl3Yy1CjDoT6OegKS0DTEIiTHXhV
 c9stupxWesdVOA/dkoiWxkM4zXU0k1dwZU4OtFW6Sz+RZPfA8F6rBeD5tqCen+cti3MrYnpGjD8
 QopunImGM+KMdbu82j+IKu74yz16Zv9EBAPWFFRWX6Iwzr3WHhniXXBk5GzbSf6UgJxMEYRka3l
 uPHwtvDCzOXuhknpfjCMOWia26r/1RA0bWJ59ZyJbNn/I/AZbqaM5HZUlFkub+PAYY6Xs8449GI
 fJcuYyXRGt1u/6Nui0B/orSDTXsg5T4pvcs6/du0JCFAfvIo8SLb1mhj+qZAPPi3YHrw21zHpza
 4S9ZrClH+tWd2SA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Soundwire controllers on SM8750, fully compatible with earlier
SM8650 generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..68ea48854c61b3aed6e089afaebe9edba7a1475f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr3: soundwire@6ab0000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06ab0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_rxmacro: codec@6ac0000 {
 			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
 			reg = <0x0 0x06ac0000 0x0 0x1000>;
@@ -2274,6 +2304,36 @@ lpass_rxmacro: codec@6ac0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr1: soundwire@6ad0000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06ad0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0x0f 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0x18 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_txmacro: codec@6ae0000 {
 			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
 			reg = <0x0 0x06ae0000 0x0 0x1000>;
@@ -2308,6 +2368,36 @@ lpass_wsamacro: codec@6b00000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,sm8750-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -2329,6 +2419,38 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x07630000 0x0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_vamacro: codec@7660000 {
 			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0x0 0x07660000 0x0 0x2000>;

-- 
2.45.2

