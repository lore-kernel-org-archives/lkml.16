Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400DA22D4CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804690; cv=none; b=hGMAGrKGa2toW3EJePMxCRYJgQnz0SMiFUUM7T7vs56lmS9BtgTnYCZp8otytOfo29TdkBrhaOsHbTT3OfrFnqT9O8izcgKrS0T85AbcO55smwptV2lNjh7CgtPO7Brovi+DBIn65TID1+eLAp8AvA8L3GVM88YA4bVz16Luj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804690; c=relaxed/simple;
	bh=LeyoQy19KwX5w/3s+KN+FjNq3xzGKW8N9LAzi6r0Kzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=be2dOYINUtAmOd81rKUXBfx069u+Apdb8vabNVNXzHZTM/DvwUsywr3XtSedO9+weWJi3XytylEJtJIuOd8r2j/GHeoTBs9pw3nCpjcNPFh5YD7g2EqpQp92Gjrg0UCHDMM0C1+Q1omOpIg4btmGehp71Id3yARTz6V9AHXNktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6pQFHQS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6pQFHQS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so2008554f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746804686; x=1747409486; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiDLZJcRrTEljd1YBJA3CvaEsLQWz8K9h4SKN5qriDo=;
        b=h6pQFHQS5ybSRd5uK/55ptLxMpMb0fUNCkWZbBmru4euBdLFHdzINhNtSQolLdbGrQ
         llkBE1Oeh4ge/rkJTWKJu9t78xR81TSC0WM4oGgZtrkvtrWZbV0nWfoxQvCqBtavi8TY
         7jXddhra7jp9VM3GASAt0HXcywypUgUJoMJ6Ld31xptmEz5cbYHOO6lVMGhJR552qsX8
         nP1VNSenDRrOb3hV7xdOkImqoi9hDskVm8gwqx6JdfT50XWhoMYCYN5Srg/xVdTVqY+R
         JX8eIWZIKBFGaFbCB6Bnk38bsbAYY1mBb7Hx6tF2Drhlzl55L8tR9l+VTRp41xYgD9ni
         44zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804686; x=1747409486;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiDLZJcRrTEljd1YBJA3CvaEsLQWz8K9h4SKN5qriDo=;
        b=ZUqoxez13CZq4Bl79NieMCD2mVXlC/uWb641o2ZDRzo3ymovdwkXVAUwRV3BUOdtoy
         kLlucgJn/u1bB1cofn4Y1XNMBFikQOpM9tWZcOFU2Ef16+M4Fa5H4L93PmuAkMfCsTpu
         S+nClfbYbC2Ro2iRqNADIHB9Ifl7PpGo3+BHKYj+BL+JSRTHCAB1qw0Ry+hvr9KzfcXX
         v10jQ5nH+hy1CJxfLQ46Js+U/CfQ4eZEgLVN+NkiJNdvoD8BVVmx85DaCdcvlu2BbcqK
         EG8g7krvUKJAEWDE/2Cs5E3g2XNLp8nKXklDgmp8xeVqGfS+B9R8mXUh6XJwMTk1VPGc
         NRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4c06Pf0lHCP6yiGPAtvwVuKXM+LZ9JIDSkPxinYWJU67Tob2h1mEVq96mE7bk3RQ3JtTvLq0drKoF9pI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3QnXvvQOAY3G73R40yLTE2pq4iZIUKmcFgRMZWnkOPP/JERz
	seFLWJbZw7TTpL5R0HX+dEhw135qOtvP8zbK91QCWTOjvqjzM99sC1Mj2gvWumoLkvpNzcWt199
	0
X-Gm-Gg: ASbGncstwM+D5VFbKOCnvb/AJPL/IuuHCBAjOx+CT+mN3pkvkojvkTfwoqmaE45WazH
	tkpeVzaKhwUNxOelLDqKY01yaAZcQL0zo0Hej/Gzn0WDSVeepY3x1n141ubqww4Hte+mLr92GsZ
	anenrhUHCDmf6KX6euVV5OL2ogD7HZ3Id7Ag+vCiuhheHHb4L+R0TlnzDnAwfSNl/IJR1+JGQ11
	GFxMBxsckjZPNVHnG7krtoFUMophyWAY+0lwL7E9xK+m/5pzEGI+7q+HVLl4+R6mdnckkNadr+9
	PoCCniLw+SMz3Hm5LCvmfxeUsVT49mybOVZbetHwBTNZVQsnlRuuKHDPSMA9gg==
X-Google-Smtp-Source: AGHT+IFxQZtYDT/4cdnfbZ9+1rwcn+5S/0kQXsA4SYnoPsnyWt96uhiOGnWucMPnfs7HSJj4yEPN+A==
X-Received: by 2002:a05:6000:2011:b0:3a1:f653:26a with SMTP id ffacd0b85a97d-3a1f6530370mr3495793f8f.16.1746804686390;
        Fri, 09 May 2025 08:31:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm3576923f8f.1.2025.05.09.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:31:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 17:31:24 +0200
Subject: [PATCH v4] arm64: dts: qcom: sm8550: add iris DT node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-sm8x50-upstream-iris-8550-dt-v4-1-22ced9179da3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMwfHmgC/5XNTQ6CMBQE4KuYrq0prz8UV97DuGhpgZcIJS0Sj
 OHuVlYaN5pZzSy+eZDkI/pEjrsHiX7GhGHIRex3pO7M0HqKLncCDCQTrKRTGLGmqdeLZPQ2pil
 601OMmKiWeXITBS2UFRX3SgLJ0Bh9g8t2cr7k3mGaQrxvn3PxWv/i54LmNKWxnGneiOp0xcHEc
 AixJS9/hjez0D+ZkM0KCq24MrV17svkbyaIn0y+mY2yqgLrJHyY67o+AVp7RKl9AQAA
X-Change-ID: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5329;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=J3kSbuBtI0TRZiQNDbpRyHUO5yIvq0iEmCWmnEFR3ho=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHh/N08AjjlvyG+fQlqXd6RrGPRD4sV0n7SFha02x
 cShkXLmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB4fzQAKCRB33NvayMhJ0R5uD/
 9AKImk26Np00v/Hj4kNGGDgJ0tC9Aes13L0EWchaI5kQao7FZO/BNCIcOAqE5FnvHbLkudLbWp4v8V
 5T4Q8L31J74N06OmvefNYnDN9b+8wptAT91nY3+PQaMsth3lC+i4qdRwESb8Rs7L2oNjEmMLeAS8Nq
 PFcG1psUEcUJ5it1fsizJZZkaQ7EXO2XiYVOUirFl5c8itnd1wHiiIga0so/qhPH9VpOnijOoi8Pzc
 Wk7K2sMq2CkIWN6Y9ipHGKXyeVczPFhGve3GggIc0+9m9p6ae8TvNGv2ikyy/HXChYKd+3okQ76Y8F
 paoMVybrJTNlk1R0kyFhL8sQeV0XSf1ZWn4k0o+mR4LCUj0cJwxHvv31ssMTuIuTWYHVvJmbnI3H51
 UO8cHNuYhv0R2JV3fuI1PVCF3X99FKhFsTUDaY+WlUcUWl2ua/EsAXUfUfcMzACeVY4Z3df9Spo5K6
 3RkLWztWNg9NeossBRmpQNf7/20q8k1agGkrKNvcgBG49u9mQpcdhqqZ5EnOjjGCCSBlW+uxAC1LYI
 KDfoNeMW+mk1ptU0xkcFY/DvKe8FLnFtoLefEQm+qUD2G3NGJ1iJ0XB4iPMo2Fq7tBUaUdVA27h/j0
 7pwiHkd5En14uVe1eaRYoxnIvtGp19XvITsqVeh79Opw1gW1/ACKcCRCektA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add DT entries for the sm8550 iris decoder.

Since the firmware is required to be signed, only enable
on Qualcomm development boards where the firmware is
publicly distributed.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Make list more pretty
- Make smmu mask more pretty
- Fix required-opps
- Remove comment
- Link to v3: https://lore.kernel.org/r/20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org

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
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 81 +++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

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
index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..57c3c92f0f5623c91b37390b340d7777d79c57c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3220,6 +3220,87 @@ opp-202000000 {
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
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
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
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
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
 			compatible = "qcom,sm8550-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

