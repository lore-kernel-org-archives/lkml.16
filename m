Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728727E1AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499890; cv=none; b=fqQrpq4GHgz/y7x+1JQC9+eWAi3JdUjFpcIRY5gf1u9keX87SjihUzn+xKNctQv1BtBFfikelniTp4iKp3H9ZJ9ciw7zXunuLXMh+CDQqsFIdZwJhw4MMJSrtBK1fCfGChisQepsl+xjdXyPp9lhccod5tX8ae+rlkblzduIb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499890; c=relaxed/simple;
	bh=1GnInV0WXCKBPNqeADSkEnLokWIKcKTYG4l8s//Fq3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RszVSD+dvrCmytmkTSdTEm+mAVR4hvrpNuTu2bM1CTcxCtw9KsDcZF/m/Ybl4oym2D38ETg1ojMnkt3FzqK1MR/kJgftiDjR45ePPUZYbxkNUR7Luw9NzFeJwdcidtwezIbzLe/XrJLHmSgk9xY6/NMaa0wBoFAD+KgGzYTWNh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWkFUwJr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWkFUwJr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac30d4ee128so16098766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499886; x=1746104686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OAfm05mWWwi3zLwQ8JgMGmuHyP3CzkDrjG/g+2w3Vc=;
        b=nWkFUwJrJH9KAMIeTyaSggFO+z6gn9+ohgD7PTnn7QF4r/nU6HzQSZQ3NQ3ev2/TyW
         SOX8HPlS06j7++zRDec/g+ZCniJt/dxwcBsREzQap7Z9BIA7iSGEIxIlTgpK9UHlFLi2
         OjISdyMZGsETSW5FFkqtcpTIEYA53TlpwT+5O6bqpy6f2bLJ1Nx6xkkyfRW0Z89xNUNu
         0OQsY327pQLk6smagJ+qDMhabtBUQdkMrS2cBYNm548doj62/88EZfZ01VUexIYNfhdu
         Yzp2PTS804jsM5l6a3eOOg+8givtmnGsWjjnaL2H1TKiCHEJ0J/pagOMusPtS5snMG6N
         de4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499886; x=1746104686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OAfm05mWWwi3zLwQ8JgMGmuHyP3CzkDrjG/g+2w3Vc=;
        b=ZenCR8eZGfd6bRcnIVgSxusq1tQminLGqXkwCfU1388UjRY+kRlK2/rD1GyNDhCYeI
         6UnlUunKRn6uZeKLLL+Xrrhj9OFC+z68eA8ztrACC4cZlFLn+j1pn7UOTiIJGz7bLPrf
         DR4//6raiKzVY/UOWSKY1atkh707IPm+zybVqnT3c+gV4dmHQ0AlalHJB96DwKiCN7T7
         aGC581eGbKJ+77yhUMlP2XYTOdKbDTfVwyYAtsC8RBvtJcna4AHpcfbqKA1PSW8djKXf
         4p6GRzCk6eWwNHScvnorj0coKqgOnooAo/IfpwXIJ4H5FD8jY8mqd5ls/w8jJF38LRxp
         SuHw==
X-Forwarded-Encrypted: i=1; AJvYcCWNF9ySU5izJyGo6+GgrET/65tYZ3snNx3HxOZXfrw/KzAUu/vDbvDBpknPnMZHMBM08z7Z4OQk4M0cdYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYGSQl0UsMY3V/3CAWcbg/TDbJsRywKMVPmdKNC2HGtPcxUKN
	F9IjpA/zLLZyh1eWy/5mFfp+xUI+vnmmGSm6O9122/qKTBJDXO74AqsYXFl5Nmw=
X-Gm-Gg: ASbGncs2QkkoXH+vkxmvMjOlUG8EBkko/mSuuHhQpFpLzAPqH3bfPa5YbI87kxKQVuS
	z1HFIQ+rnQojSbj70mUdbuUPW47E8tLp5NyNCZ++Y/JAEfk4r718nL8qSlzqY2jeuTkNFCe4SZD
	aeoUO1mq4ZsCl3vZrGw4kUW3TEOh8BU3NVmRvWaYMlfXIEfilog0iNcdRFYTeD9y393YrvHDeZP
	FhTe/Ko/ZUKtISPdoVl8MVUbE9vSmmfQ9tbZLnA8u1XkSDTLt3CewHrgSQ/5pV9LImnXaJCBOxf
	GwjNNPjpq0t0CSorHSldZ6Cq4wbeia1pPgm/oj+NIZVV0/rDr8aIyRVGux8=
X-Google-Smtp-Source: AGHT+IFibruSyKxjpaoyK4ME4HbcY5S27N31a1ZNeOA1wETZAsQbS48A+3nErafuVpKRZWKw9wuSyA==
X-Received: by 2002:a17:907:d29:b0:abf:777e:79f1 with SMTP id a640c23a62f3a-ace5725f573mr85354066b.5.1745499885565;
        Thu, 24 Apr 2025 06:04:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 15:04:27 +0200
Subject: [PATCH RFC/WIP 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB
 headset and Type-C altmode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-display-dts-v1-3-6fb22ca95f38@linaro.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1GnInV0WXCKBPNqeADSkEnLokWIKcKTYG4l8s//Fq3w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjblcolV8cJV053ZIciynPx4ICz2v46ovv4Yt
 /sdN5xTewCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo25QAKCRDBN2bmhouD
 12TtD/4h52TfEjKUhs7RTpseaUMSFRfdb3KRpV0xC5bysOyVluL8DM6L6tPnucx88bSq+W/gzf4
 PgRfFBwXhe7HRRKf9HzkhS5syHnYenxhTHlFbsLGVBK3Or2I/2s+4vCrNxTZ8B1/z9+auSK2w6u
 dkjGVx/j0xMHXzoAb6R6T5cSiScPlH8QmlaFvGQYPoTLeQaWfke87JxiFtQA/qj7Pw44rsCem/V
 vI11mh49MqgTim3discdyNITHlHTtNldl6q6yeqq1zqtjZen+Upe6s1HDFd5MHIdp9rBVv4tUOc
 NJcF0eFAh61jQYJK237r9tItsiSKp0L2LgbDDdIM7X2GkjX9PP//nMgHhh7s3ZzRJZBrGNmzZYY
 FQtxzEDxpPKRwTfGZyxFcA2acmoasC6ZCt68L+VStDAIJD+uijvcmFKfblGSstnnsMvP3q9UuLA
 NOutAGbQEid3QeGKeRepq0mLkKjDkd/xkGypf3ba3F01q2OM3+1WJiNdcK5I34HxJOqgsHE37MB
 fHxQz/vT7lXVI726g0jLTWwn+68E45vSiLVXgwaygQn049r5LUTn+ZGk9j40FhMdYLF+zOcAkfc
 CR33ow+u1zUFzEdu5upumSDPaC1NPYJoc6M+PXz400MJCqJ6EasR0J4lk1msNY0ennwvw3NjpOY
 NHpPF/M+YNQS01Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MTP8750 does not have audio jack connected and relies on USB mux
(WCD9395).  Add necessary nodes for proper audio headset support along
with USB Type-C altmode and orientation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index bd0918e8a7a7e03530eea577c7609454fecfdaf7..c3470e1daa6b7f31196645759be23fb168ce8eb7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -53,6 +53,15 @@ wcd939x: audio-codec {
 		vdd-mic-bias-supply = <&vreg_bob1>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	chosen {
@@ -220,6 +229,14 @@ port@1 {
 					pmic_glink_ss_in: endpoint {
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -845,6 +862,42 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -973,6 +1026,11 @@ &pmih0108_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &qupv3_1 {
 	status = "okay";
 };

-- 
2.45.2

