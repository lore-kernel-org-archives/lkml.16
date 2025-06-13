Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60CA2727E6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804072; cv=none; b=JRT+BAMWp3/MPJYBjMfDxEGRaFfnn+dZ/Pa/nZC8TXZHtmsE2soBz7DDHFrkEeYhE56zm4oBtA980JfkvhSwb+7ZNLconcncQEUZdLVmXNRRngis2AsTmp8kg+xIsrwfz+ltsooufAuCwSOaispyK+Cvhq4eRG15+NU11mf1T4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804072; c=relaxed/simple;
	bh=PRF0WPB48azTVcbpCqrMZlxzywNxUQHe0qjWkkS75Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z4Z1hvyO2yP4wp4hXhlI8Rvhi2opd3IfF1b/oTEfVB8slHzzynb2yS9fLT0xUcVaOaMhwutXEw4khb8ZjFUFjFJ+F4ZrkJGczqfi1QF6B6voeZTkb5ed2HaqxscliwAuV9/uwnpo14GviyusqYZU2kLRJDpZbCMHDiEPYt6KdlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDybV0bE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDybV0bE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a361b8a664so1660835f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749804069; x=1750408869; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+OEC+0k11JE65oE5hBoC7JjuOEidFYFLd4EKPcTV2A=;
        b=HDybV0bEYW7A88qQnzMQ0A85JRnh6PNZmJF7Vvsit6UqnKT4TnlsvWVNDt1qjC3RbH
         K6CJQs5WsyXHzawVz6jvhuiCw8g+5luyhGr/Zv8ycjuj5/KeqwKP6Q+vcV3NhKs6mdke
         Sl5XcZIiUXyTW0mC45uqcoC5Cr8i/QocCL03/M321eCQcgxY4IcaEOrJbZ0bxBtQPyzo
         8dfNPc3hhqD88UgsaYWfMMQLaGgc8ZyLyjMG4U4WCtpozch9+B6L9WTcH8WuncXT5N93
         QbLYRRJfOXNIGvGi+pC1dhwrP1NsFOcBn6eCqtnSvvQJRz+3k5JPzrL+QsToUD0+E7Gp
         q/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804069; x=1750408869;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+OEC+0k11JE65oE5hBoC7JjuOEidFYFLd4EKPcTV2A=;
        b=cbiPFYaAtGlAcf+72e+IdW/AvSwHyGJiYQNCEJgEqMlK4CuCeWMAY/ZL+mRrX0B3qF
         ztJ24Tz4AhVC5EW5xoSnyvQlxmgHfJLrCguUeonmhgRZ3CefiQpX8Esc2p1nc9N88cbg
         v/M/usSayqQLoCTfFjs8Zc5hH/J+qh2gE2sRcc4I+In9T54DrOcFCDjVkjpQNmhKx/DF
         l+kdPO8jUOxM76LXyIom2pVYMBu3x0jpgSujM3kMWUva+gko8BU69WssJPt3bgy5KdnM
         seLDMUL9VqKhu3EVFZnbn0xidBxV+Rhv6yzZaWgqSC2zgxIarDj7zkuNFy3oesKCjGnO
         eOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy8TAZsaIAQ4L1gUuV9hqwSCZ6xYohIKf0aLPx2bUzsNqg52vlW+IuBQquaUUSaPVxeHiTh+OIRQvCBAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuTC182W3g27wVNhWujlYH0OZYc5+sqHF5m9gJeW4M5q8P6gQf
	MJ58WM2N8vf06wXIm8AYy6Sr1S0E+h/RzE7O2TzE9nioFhDnmw1Q/FyCjVHk+9bLjtc=
X-Gm-Gg: ASbGncssqdPub1BFvSNCAvphi6eNavLxPBfoQqSocJcqAVgGvI3CgGEfzSQoC3HZ3AP
	dYKSwkH2txcxEiwJDfT/6E8BtSJ6mjjZwPnzcllkQsfuj9Nz3kbLtYNC3FGaP/QC1hs3hY7mudi
	ryLqQkaCnWwGEfHliBThOzZ2X6lr4czo0wwPUEN3EECX6qa7gifwQEjTmL/7jKW3pvFn0NAgZPc
	8hcIsU5KSnU7RhyZvM2ICaILy33obrL+/Qv0fJhz/UMp4oe0ZtWs2goin70xeUuD8ETlotsvghE
	mpOcYokVjW4MypTPfWB+EOl1wV66Uz79ZPZZpJV4cQMsGhGmIQL/81vSDZeNI+affDx3nIllgeY
	NaDdyQ08=
X-Google-Smtp-Source: AGHT+IEpZwXvIoVR51/YieuIFzd7vauBScoTRoCDpk3T9fQBL6SBtZwDgxeoFK+WHWWOa4LzTKTe2Q==
X-Received: by 2002:a05:6000:4312:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a5686cf98fmr1626077f8f.24.1749804069066;
        Fri, 13 Jun 2025 01:41:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531ff595b7sm65237475e9.2.2025.06.13.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:41:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Jun 2025 10:41:06 +0200
Subject: [PATCH v4] arm64: dts: qcom: sm8650: add iris DT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-topic-sm8x50-upstream-iris-8650-dt-v4-1-35ea7952f2d2@linaro.org>
X-B4-Tracking: v=1; b=H4sIACHkS2gC/5XNQQ7CIBCF4asY1o4ZEOrUlfcwLrCATqKlgdrUm
 N5ddKPGjS7/t/jeTWSf2Gexnt1E8gNnjm0JPZ+J5mjbgwd2pYVCZVBLgj523EA+02gQLl3uk7d
 n4MQZqCqT68GpptLW1AZNEAXqkg88Pk+2u9JHzn1M1+fnIB/rX/wgQQKhraw3uA8SNydubYqLm
 A7i4Q/qzVT6J1MV07laIu2DoVX4Mpcv02D9k7ksZqhIK4+WFNKHOU3THaQ6LfR9AQAA
X-Change-ID: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5558;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PRF0WPB48azTVcbpCqrMZlxzywNxUQHe0qjWkkS75Z0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoS+QjhOuZLoeUo3dRQ/rid/cnmelNTHfzYJbP2/BT
 acxaq3WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaEvkIwAKCRB33NvayMhJ0eGUD/
 sFMnsmxD0Z0KEnBG2nE4HvURYLLPKeoVR/ALvcAXXY5yq/OdTD2h//PqLyWejoy9o0oAOO4EWcS8+R
 TiDTbzKjtfngC5+EWwsQwK7o6drb5mdG9L1WnBMOAHadazvTOdIfPxHuIBT+797srgFWpYL7Pb4jQe
 OVc1un7LvB8xc7HibPwcYkP2t+AMZHPVfNifXd66SDg9n2PdXgN9lrYM9doSk+NPyWcjjoJuM/zPhE
 n20a3NoklvUGceHnHEaUNnJambbp3QvC48EbaEG2M02a1pgOC4RfQn0FwUby76Ezegh//vVxTX3nT3
 cayU9RfX5P33f51LeI9bPX3g8b+qzBJ9C969xbk0NlQzsxZ1Uhiwovrqa6DN7H70Q9FsK7hC35Ikle
 rbI5WkTsCiGsTvbFlribrqntzsbdFsNC/eICbO9OdbI8r3qKwboRRQZGHFOJBuTdNQUCmMqMd82iAB
 l/AwGuyumFf5W641izvyTxtF+GsRsB62b48SoSrF3dlD43DyQg4NK1SX06wdzD5v/SI3fe1CmmcgXf
 mlL3fFErZBv2T+H3OHnO3/KHbbU5z1+oPiyX/QjaidBNH7AHIits+pb0xzu1D2P0jB98EG4TycEuuT
 sB+nTRvWVG941D/V5ulI9I7hJSKLZQzdrDObN9zhYZsaOW9411oXurPs5b9A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DT entries for the sm8650 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Rebase on v6.16-rc1
- Collect R-b tags
- Link to v3: https://lore.kernel.org/r/20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org

Changes in v3:
- Removed useless comment
- Fixed opp required-opps
- Link to v2: https://lore.kernel.org/r/20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org

Changes in v2:
- removed useless firmware-name
- Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..259649d7dcd768ecf93c9473adc1738e7d715b6c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -894,6 +894,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..8a957adbfb383411153506e46d4c9acfb02e3114 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,6 +585,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..7552d5d3fb4020e61d47242b447c9ecbec5f8d55 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -824,6 +824,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d856ee7a5d0528aa204431a1528d8742cab3d5a8..3f09917b4fc74ca54be28f25b64f4ede2648c884 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4962,6 +4962,99 @@ opp-202000000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8650-iris";
+			reg = <0 0x0aa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+
+			dma-coherent;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-196000000 {
+					opp-hz = /bits/ 64 <196000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8650-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: ecf638079f3a590596fe93b108a3986ba5960e81
change-id: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

