Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5A274FCA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980329; cv=none; b=GFLyRxcnjKh7NADRzWMSXZiRAoWT9A94CKWumYh1zPC97DiQQXTOofRafE7rtSD4hJUAOTtDFLhn5xXvaDs+x+2ti0oGqvhcruK/PzNwhotwFZlcpHbD7IfnJRTLdqhVsDr+p89Xf6ygS/6/Yf0pm+Gv7XqsdIaVSI91+X1AH40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980329; c=relaxed/simple;
	bh=ySaDkmAZLcWXKeerdT0+7BpoPFagSkw4YMtZbNCe4BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nfuzn71NJH8QWlLtzpy7RfpgRGiR/NrJ+XL4QqoePRRkZAhwetn2jGgpXEYr+a9LoYu9eQEgVz+rURxy2YXiTrazv8HEBXyaPQlpo+FxiRVi3EQg/2cAvKJVMkRu5IFyI0ORYfRmB/kLAbL4Xb5EZURpKx/9E5Mjb94nxvWSG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwYugg4L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwYugg4L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso21608565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744980325; x=1745585125; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzF4QvjdSMS9bXofNemSyEoZVZlzopDIhUwrac2fwoU=;
        b=IwYugg4Lopj579wkO7iilZpdJCUUx/O/xnKp/bA0LJ99xF6api7ygkBHzrKHSYvqEF
         ITkyfI5E1LxtXDUKpW6maAOqGpP1E6axpATcnCEMmKyKnA/U+771ERgyskajFuMjEN7a
         sCRWF1p278Z3RCVbHUHnShT7V7m84jY/32w1yKQ5XTX+7BVPZ6peo3KURMAjU3MUkyz8
         lBpkcD6ZANDNKhwzrRMOVsi54nDrsxmF8n2iaJ0d8tMxd1czxRhQPPK98elk56IEXuFt
         GfT5Fk7m2UXHyw7v28fPn6SY6KqGEG4eOt4vgbVON+a3DQ79qY2IymYD6bwQ0KKkiy8v
         FqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980325; x=1745585125;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzF4QvjdSMS9bXofNemSyEoZVZlzopDIhUwrac2fwoU=;
        b=EqfLi6HgTnRAGOuzNMJ9luk8yWDiUlod/NcnnUqePYQyiMmqHV9ePP3haT+r40WJ/L
         mIDjYOkmHa9bA90+gbdS/RLPSsAuoA2WSSvds/6tbsP03HzpouNVzZx8XDBUf1yU+9uh
         glttsHRLTtJF2rCSDFBMG6j1JZBJPJ18ljrY7DsyEEzgGATV9BX19uH4v0/u+5oq4/EW
         LKMiS3QVoRa/ZczSw6rzhK0T7lXJL5mHd6qx1MbgkE5fgVYifStFmqiY2huvhZZsk5ZR
         Vs3z/y8gfWfuoFPUgpx84m4m/Mvh6h2RRsVgb1Wyq/OR/ZZx5iS5p2hO+loU4BiC1Clb
         qufA==
X-Forwarded-Encrypted: i=1; AJvYcCXelBviS4tWTG0FLV5SsHFkJJJjKfEpdjOxGGzouW04RMauXEklonvv5DWns5LoK15+qq9xOYScrGsYcGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPemorwPxzU+fJElFa6Trtchuw0+tIyS/6Ic3IALvo8BVe251k
	ifv59MtPNgmvCQeroCknlnIdnvPE57wfTtpQvRF8ztN9IMRbF4viq9uogrX1BDY=
X-Gm-Gg: ASbGncvMUTeSKCJuBogF4dcs7Z0Prk1YYdhokKM5cSmB1ILOtYDA9sQtSpFX/ft2ZCa
	N+xSxL6PM+/S6+j9MAN7I83t9KjpbC5EXm1bZaCa5RqhmYuT0UQBGbtzZAkIrLFsmpdyBlucr7M
	a8QRevk+RWkDkwKnz7xB0c0ybEjBP1KLMgzFAvxMc3UaSrLVh+5BC6GaVB8CaTs2Fi20LZxludV
	OTQ+OH+XSXLg58cQZ5gUerz+PukrcXF5r6dPQwvnTuhAB0UzDGKvXcAQe1JhAVDYVEowjE54tnJ
	RGSjDNouedWMPaVYSubwMW46+QXHai2GQp7FsBnQ9bIr/UoZCR8bxRCzwJs5aw==
X-Google-Smtp-Source: AGHT+IHgpHdFF5FAGO5pXbDNVi8cBzrcCACrOsiB2WSI6yfHEVf4hpfwpZG+0s+lDQZqK27HlvQiyQ==
X-Received: by 2002:a05:600c:1c12:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-4406ac20146mr19035325e9.32.1744980324644;
        Fri, 18 Apr 2025 05:45:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d6cd2sm20748285e9.33.2025.04.18.05.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:24 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Fri, 18 Apr 2025 14:45:22 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm8550: add iris DT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGFJAmgC/5WNQQ6CMBBFr2K6dkwpLRRX3sOwKDDAJELJtBIM4
 e5WbmD+6v3Fe7sIyIRB3C+7YFwpkJ8TqOtFtKObBwTqEgsllZFalhD9Qi2EyW5GwnsJkdFNQEw
 BrElXF0FZXTS6yrEwSiTRwtjTdkaedeKRQvT8OZtr9nv/0q8ZpPWla3Jp815XjxfNjv3N8yDq4
 zi+J1h9/9UAAAA=
X-Change-ID: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=33kMnRk8KY4MfqsVoLkT68Na/QT/GIo51XhjktRXhGY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoAkljUYVrX5BMJy8VeB7b28GsHyDEVd694FTLliq+
 fjCIsdeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAJJYwAKCRB33NvayMhJ0cdzEA
 CLc5rrcOPFm5bFxQNNWxXMjwAPY5MTpdfDh01tNAro70vLg+sXvhMGVWOVmCZAGJCFMkwtYhVVorW4
 sz0hxzwxiJYncwf3W6i0uOoi2BytU4m+Nn99DcNQXJMBsh3MKIuYT7BAyIM+efOkbKnA+3/+bf9b3Y
 EcvtpJLACTAlabjzikyK6d13g6EmWgSAoh9BLmNgll/4hOqbQzXsAJm0kvRV+ZHvcOMnWhmJd35f8v
 gNB8kmoD2vLD24ibEPRDtTtSne2OdSnbs03Wbmv8193xop7ZFlu6JKh3bxX61S5jRZGd/u9cP8h3kB
 xM5AGaA6SbapgpQ2cuF1lIVcKs/mT19Nm6Ry5HVg+hkfQhhRhxsXveJKoSs7qtwn4mDpXfvA5T6kXP
 MW/EuuNGErXRX64ghxUJakaQFB0L+I6B9hDzEwAVgPwxpB5dYHlH5+W2SaRNb92LEb6vjZfQ/qLaLA
 ug8nJF5qy0FMT2EH0fGrZ2uIcSEvHlD2KTmJUI0OFmh1wPTlKHdpPEHIOGhK2830FoOnlj2fPvQKX/
 57qRKEo2pv9ElWmIN4Y/oRKhcgJILyospz4FlEEFjxhg5IBAAD8KfIqNtG50rptiWMbxvmjYhFyJPu
 YqqLZGukFScItVPFV3kwnKZUw4pa5q+kw2feqOFK/fanGqoHfFsAQYVcuhjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add DT entries for the sm8550 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
publicly distributed.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Only enable on qcom dev boards
- Link to v1: https://lore.kernel.org/r/20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  5 +++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  5 +++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  5 +++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 76 +++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..866f4235ddb58a5e0776e34b9bb0277ef73236e5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -945,6 +945,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4.mbn";
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..2362937729e8c5340d565b6199f6a6f9e29d2120 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -672,6 +672,11 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio17";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..4f713127310be54361e29ddb97e7f209493109be 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -779,6 +779,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4.mbn";
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..dbe01392b436d03ef58733a59f60c3021bac3e6b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3220,6 +3220,82 @@ opp-202000000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8550-iris";
+
+			reg = <0 0x0aa00000 0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface", "core", "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg", "video-mem";
+
+			/* FW load region */
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0x0000>,
+				 <&apps_smmu 0x1947 0x0000>;
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
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_turbo_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8550-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

