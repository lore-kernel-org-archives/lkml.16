Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1019CCF5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512472; cv=none; b=DEFnEMfSzWkTMmO4gjG6l4LQhquRkkNMPL6CCUE+Pn2Utl2VCPVS7WuLiUH6aGT+hoVHA781n/kRwa9pwc9hp7qbqj9SFwJuNB6ZtAynU2JdDV/Jwtjy1UZsx0nXbb9D5IozBVtAuKe10Bm3Eu3iqq4aVeDY+L4Xhrk/Acbbq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512472; c=relaxed/simple;
	bh=6Xk1ui9+E7DJcvJT2ltCpJoEPEx5tYoC2IQm2iSv90Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=atukgVHCOIPN2sRFkspiQ+BQGEB1rpGIJszDL7yc9Mk1If7DndeNMC+kBxIuiRUTMbMBaaL8h02Jtxa7z614/mxUXIhax19bN66Hs5jnxP0IjKgi8ZnXnSqxr+M3FjfO06erhbrfUpOMHgavZM9SQZW1z0EwCNTGb5NiJ3gAR48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFEBLdEp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFEBLdEp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso9740725e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745512469; x=1746117269; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDKIG63pMe9JrjXuqom4a/B+XzcczRC3B2PjeIPhZck=;
        b=KFEBLdEpKeuZToAti0TJZ3TQJ36dc8Hrzhubzyddrxgqr/xJbZ6zLdhKOQBPXFmXJT
         okINVs9oTsdbK6b1+7u88rJFOx8spDE7PP1P+Lfcr4l7MwDc0M1NST4605noax7inAV6
         4kEmR/lG231zYld9RvBj2zbUOf6qQA5juMenNCmthh0DWD2vo+VrHqqaE/87alYHZAIt
         37n9RBuY5UghU6ohxlUXQjAtsZlRgnpt2rUV8h+qZ7y1gd1vPkx20qP6dyJiU0yNulkx
         UrIprxoQsejhNWIVumksD25rqrG1QiJfKAYZbYV64uSN6qugFCYJyRQpSLJCiSq9OSqF
         ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512469; x=1746117269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDKIG63pMe9JrjXuqom4a/B+XzcczRC3B2PjeIPhZck=;
        b=Ii2LbSxJ4mJ34T+8KJ5f6EWhEvBCm8y4YO5Zguckg8mohBi0JQ9F1e6N1MQgxFSR6L
         0rpjqgMNRgtwspnLhLOmALMPUjiPEgRR3eUsON2970VlfePzCQGbajPYdVI477vzG5Kb
         AOY507Z+LoZswMpt3y/Sw0LhVxejypGc4A8Ye4AYtvWJRUvgelpEumsRJFXoRfCt+aA0
         U+kUbMCTBV3to/bsJXxdmgUrw507EG2J80OelFuFMcmdKvgdrpHVgYSRlc7Jrq4wC86H
         4ZwuqHMxB6vfPlaw7EBaFBXRHdQ6ouF27xQ6fszoSxo65g/bSBtsUZ0WEWzm4n2lor0b
         ibEw==
X-Forwarded-Encrypted: i=1; AJvYcCVITo/DoFZxF411odFjORK5odstllx1spGyngTTkeM1sQbmr3ATUtwccY6JDfuy+cnigJhEfjIfn6573WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCc389UNAno6LP6asJ7PfeQGJ2GysGJzCgbs5jC1uTGvfkt5qy
	RjjOD9HYdHPPdhzYXNVASIxEFyryzHC+mAULBWwv9WaXeRo0C+F3DGWbwKrpEKM=
X-Gm-Gg: ASbGncvWtw701aE/moasi5eF6QO3t9y0Pb97x9C6tHJLDo9HBzz0Spy5uaBo4pyr/ap
	+8fbgkrTBFVGYKXVp4BAxErwqIBeT3WzkTcobsDZxHFMQ3+kgofuKm/k8+xtJdC7kEUxVO4tJLN
	/zvmo2ECV4N13XUcv8dkUWREZz22kaoHBXI8Y7a7C6p7cNSsl/MZVUjm/lrA3CWg2TJ1l7a2bC9
	7tyx96mH9HXEuL3skjwwSVm7eKCaCNAG43zNRcqH2xYoLAVRL3D9O/iN/gr9bRvjwqu6RiEfHXQ
	jE28v3Pcxg/NTq9ZkiCOLc9SEq9W/444FpT23Q4Z9Mq0BwqjyIbZywEKWgMr5w==
X-Google-Smtp-Source: AGHT+IFM5/p+5Zp0/4hLItu/km4mjpQcCf+kBAkpy1FIu7zh/mDE4JhBoWgwbCPltpq5KFnnno1CfQ==
X-Received: by 2002:a05:600c:3b95:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-440a31c2c42mr1463045e9.32.1745512469277;
        Thu, 24 Apr 2025 09:34:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm26916885e9.31.2025.04.24.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:34:28 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Thu, 24 Apr 2025 18:34:28 +0200
Subject: [PATCH v3] arm64: dts: qcom: sm8550: add iris DT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org>
X-B4-Tracking: v=1; b=H4sIABNoCmgC/5XNvQ6CMBwE8Fchna3pN8XJ9zAOhRb4J0JJWwmG8
 O4WJt00N90Nv1tRdAFcRJdiRcHNEMGPufBTgZrejJ3DYHNHjDBJBClx8hM0OA56kQQ/p5iCMwO
 GABFrmSebMNNC1aLiTkmGMjQF18JynNzuufcQkw+v43Om+/oXP1Oc05am5kTzVlTXB4wm+LMPH
 dr9mX2YVP9ksmxWjGrFlWlqa7/MbdverfXpNCkBAAA=
X-Change-ID: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oqGWaMVxclYfnPuI4Xsljnhx/oZ/DFjZ/i1yFIJPDaQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoCmgUw/mAhHsfm5Tqixbt87gR6+IRaCujSwK2mGvv
 1W77CT+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaApoFAAKCRB33NvayMhJ0alSD/
 0WLdC10wY2tzYV50AZd8fH/x/JIBCy5x0QWojXugcq5/wZMlEMT+GPESicvPagBIQ54SDzvw9U8LEh
 igcys9W7X/MpehpKwD2B9QXOHyZoz7BiTg557HI/FwNnzJ045yaCHTMroLVF++vyb7qtsqJ4GfJHbO
 YATXJcDEztCGKLjk7d1al/B8Fz8SjqREj1SK1NLwaNJKlho0Vvyj6EqpuNZjLMWhfU/SyMS+jlrMsw
 W8qfP2Pz1bj6pPiUsnaey+WgUpJn2PRUiwhVwTwRtYXfzMu8hspTqYWjKb2eCiRMf9Eg1HF3mLhjKR
 juiHAgkmpOhliXAlUvNWf6CDLVTPN9Xue92aXiqZ8ORY7/8phHYNbFUeTkT2sOERgjdwGaJugnMCAR
 1yqt+CQOUBXFe0NeMlH2dMbOi5maNBSalV6bSyP4tCFg1zgPWgMfRexD+h+mNx/USy89qOm54ASNvl
 /d2GsNafoX6Z1gNmTuQxAMhRpBkDbifvGsuZx33F5FQmgCh4z6FyXjq9BsfKP7Yb2aIdlrOmcEqCq8
 1kAMkLgCTVbDkuzkIRUXHfA3KcJ1Tp58KdlvfrvnILCd0PhLrqM6kra4ND2jC3D8OY/H6sTgQaIil3
 plXxU65jCG+UViLk6pbK5m7uZUVNxVciLApyw+Cu5dTYHdtsDivMnAkNqZsA==
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
Changes in v3:
- remove useless firmware-name
- Link to v2: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8550-dt-v2-1-9218636acbdd@linaro.org

Changes in v2:
- Only enable on qcom dev boards
- Link to v1: https://lore.kernel.org/r/20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 76 +++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..9dfb248f9ab52b354453cf42c09d93bbee99214f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -945,6 +945,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..fdcecd41297d6ebc81c5088472e4731ca0782fcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -672,6 +672,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio17";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..49438a7e77ceaab9506158855b6262206bca94ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -779,6 +779,10 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
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

