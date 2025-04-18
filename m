Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9826B95E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982440; cv=none; b=Wonh0NU4iB88fqVPBs756usqPvDxDV2+Fd+TuR7soB0GipJwzp8VKqE3tejO1USMo43FaE6QWOXCyCAEHLn6PTMU1Mu3DKFB91cPz5xq/Cpj78gunei7Ww/BQo9tOClcQGA4W1KN8IX97ySERHTlvLz6AR8YvGuLcSg8WdVP8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982440; c=relaxed/simple;
	bh=2a5mZA5F083sDG7voTLLBarBLnmEOis9dWzoiN0JvYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QCDq++4sLV3rhOm2Ii3OAWwWehm5Ly9BKihYV+CgnIwqx0Hb7+8bpzjgAGFeJ0g/6wBhx3FF4z5gCGvQy2JAkJ2fypjxZtL7Xwl3ved+adTp60+VlUtg7gfitu9AsUO/YX6yMpbvmhp4Nj0xrGUhL6aZWHxtWgCLmtQS8DhUsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGKRrPx7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGKRrPx7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1744150f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982437; x=1745587237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUZqPB3JWIFBkEpZBtu+Xgl3vTEZWV4zcKVyVrLimPE=;
        b=EGKRrPx7m3b/pjVhhe3pr0Dt3B5t2xb8YxOr60fOPULBx8d3DmzUSB01U46BJlj/A4
         DLtdrIGXeKD1KbSZIWlUU8WLv0YvWI3xn6Ap+mmbVyB/E6WyqrPigi7qdBAm9L8+aosm
         oio2faR/5/XV5CdAIyTWsF+ae5Z64lqOVSK7pz5TF8dRdGxUz3hUfbtZd9AW7i1dEvjF
         qgGlgaNQeDtcJMc/ghejySZeuSh5Z9WGtmhz8ghhaOOkKYyWiFhg8+3FgclyZDIrmsTK
         MVMH7dC32bB4zlzmiWFDBPbvpYZRVlTUIL76/yf6pNjuXvdyK4E8NeEij00/1rhzxJ44
         qBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982437; x=1745587237;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUZqPB3JWIFBkEpZBtu+Xgl3vTEZWV4zcKVyVrLimPE=;
        b=EJL4muXMuWMNAqIMwnQ23sUBJogIef1wHxfTHxaN0Zig0cOVX00pH2dYZDuhE4ofUj
         yrAM46D6xP9UbC4c2Ch+L0WZmdqYPsKsamu8jw6oR5c0W2yBhBcz10XK0YI23BpARCyV
         X7gM7PPSdkzdjsylgYXwEoaGA7jHmeyA39sWcLeYbqTd0N+qOt5a7VwqYHN96eGMICFu
         9PB8IIVEU40G6wrgyDj4csMjVC8HNP4TkHNF0klEiyBVkvC0wqdp+vr/kaUyWm1zMAeQ
         /K79k0du0+qyN699HHz7+vpyyHOdgi1Crdl+4LMsjojiFdME86cATXtxEqV/0bpy77Nu
         X/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwXMcbuQqbMDtBnuazQRfyvTtjFxI6TQU91eVimZ5DPDQiEAvNf00+1Hrzjj5WzhagpdylCiSgY9OmmEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvrsk8751cyEcFgqUmYkcFpmaGzI/LzDEszVtmX1gtRg6IeIp
	oR8cuEAxzzDzc0VbnhOe0l59pvk+MBxWBBk2QJiESoPjdMN4VtwtO/vIODTpwCk=
X-Gm-Gg: ASbGncsfeWRhaqNT/bT2GFw1keHCeaUsArNjJnVJCcBsLFbl/TqiUo2Mid7YxvI+FzV
	48gHIskoOSSK7WKCPVyqPJybzcn4V0LP75YKnKLwVRM4jrKQwIQu/DMcwILVtbkqmAJ5NRZG9P+
	+QTVa767xAGNn0Er8Z0ibuEVNwuJahBB17covY9oOT49SvvucODzrtcatFK6x6qMKU0+umsIrjX
	czYTxgnUNJkQVfIPrBRY77gIERv/7PUw6C6MjpPKercAwV8oXpZIKzXpeuifBMx5SHLNLq/jnjQ
	8mZDGTxLiOfhvsUL97siHcm93CZEOoDPtC0eBpzCQRUChpLNwTRSknmYXKe8vg==
X-Google-Smtp-Source: AGHT+IEzrDlbck2TDJSIOBdLiuYqPZoYmEC3K3oJ5x9QBNX72TIwXyNygbpV6/DLy0HD+J1B1mLulQ==
X-Received: by 2002:a5d:64ae:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39efba5081cmr2268340f8f.14.1744982436988;
        Fri, 18 Apr 2025 06:20:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm22039775e9.14.2025.04.18.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:20:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Apr 2025 15:20:35 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKJRAmgC/x2NQQqDMBAAvyJ77kIMrqT9SukhJKvuQQ27qQji3
 xt6nDnMXGCswgav7gLlQ0z2rUH/6CAtcZsZJTcG7zy5oQ9Y9yIJbQ0nOfwWq8pxRVExDGNTuWL
 2aRwiPcnRBC1UlCc5/5P3575/juESyXQAAAA=
X-Change-ID: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5070;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2a5mZA5F083sDG7voTLLBarBLnmEOis9dWzoiN0JvYg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoAlGjYvoQQWRPOtHWsHNXvWqPYIr0EzjyAfLeb4CB
 bYAUismJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAJRowAKCRB33NvayMhJ0e+VD/
 9HMqkQ6TcKOWABPqwCyA+PayCG/cXpY9IS99z1U/IAYTVGjt0fSMp5dQ/iIRW/17cCksxnMhMJkeyG
 64TqzdojYumZCFeGbYMYrHsfdM9fcnRo+AsrvOtYfwDp5nUuCLWvg8d4bRT249oOTki5imxHxJEulx
 8j+mkoClJ5Y+SGeQellnr2YaVq7anuVjFRnQf+26W0hGNoOf92hChaSbznQSSRjO1tdngGQLiG0y+s
 KFZ26lEeW6Tg7zjcvDwYfE4S8KGxXPMwgSI7oRgsNO6LT2JKCMWZPSnHOvbeUIHHVBVHha0vkucXnF
 bVFMKPGgfv2KLPK6jB95brmDYNqCJJxg6D6+LRNKJXuAHQM3fXs1aQhMR4d8JeYHMwXDTdtohub3r5
 sCWEg0jK2vgXq2yC2zUHakjhcTB2y56StxfXKiZRdvSPuZcehoCE5frkjZ8CZ2rzY2b7+MKUQu0QVb
 frYoIetuMBpJt4utB4huMvUAnb+qMpUbTqNdrBV3+j+ElsZFNfJBK8YR+qUUpcElGUXgdHNcN3DJ2M
 hhMq4iiz55JHtC+I8XX2CmAb8vkvK7d3+Vc6R4aZ25R77OQMes9WPwH2sEwBSo15BbzrCrVjLCrP3c
 ljSMVDc3EtMTxH/G/6vLC9QWNJoSkj5mMFjx/KfCYSTcQ0dYNftGyMQw+txw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DT entries for the sm8650 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
available.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -894,6 +894,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -824,6 +824,11 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu33_p4.mbn";
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..9afde0582ec9b8fef44c0af0324bfae9b20d1d60 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4955,6 +4955,100 @@ opp-202000000 {
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
+			/* FW load region */
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
 			compatible = "qcom,sm8650-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: a7dca088884312d607fff89f2666c670cb7073ac
change-id: 20250418-topic-sm8x50-upstream-iris-8650-dt-d2c64a59505f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

