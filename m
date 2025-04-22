Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3E27BF8D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321144; cv=none; b=KyVgaI9jwOvEEyA1A+Z56uF6tOrfbdjS+f+5IQeF++IX/uQCy7dvYW8josv1u99Q16X8Nsg0iLVnNpOR2Bw0GhBm/3Kv+9DhXVslt0eBB13elbMgJXFjZmP1KIi0EgZ0xfYH/3kRXgt60qhnbFcxRfpnbY3DTJhVyWVgH8tm8Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321144; c=relaxed/simple;
	bh=ZgUctIQTYjWrXxfNyYBxpGZo3m0nZVj0c8WONv4n52c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwFR0GpK592meg3sihNvUZ81wy5JCQ0TBjQyYrOdFFSqn4nQBkWo2qA2JBjrOyyDyHCn4FVDznMIcHdB5cUVLpadh1iF486u+TSF543zUvJkPq0EMtIsu2dxi3RG9hBUHUrGUl2MWX8I/h4ROWFqIFKfJiF6XQ7Y7XbEV1YAMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9rZFv5n; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9rZFv5n"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso10588073a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321140; x=1745925940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVK6SAMdQtK0FFO3trNDw7APCuecG0j/aMOLgynyWRQ=;
        b=k9rZFv5ncRCqZCBBGx/YPgkpc3Ql1QBEpk9K1u7fR3vLwT2gXUuKDSjGGhitv4hOHZ
         Aro4qvJwIVgFepQJOoxgGk+KiBjC7xri6f6XjFF0BVKXcV64h3wXYjpl4BOEaiNCygt0
         /Oui2zYjCYDTfWn+AMypbDPcVVjpJYKAMuyR7V4y4jkbcG1X+45w+fIVLfk6frt1sTUA
         V7vvm3dy5G2zl0tw4dpAjjq659e+I+s3zZ+KhXiw2SaFeD7qU1n/gRbz3JF2GNvLjQbv
         Vot08vuNdiRC3fXRVKLXgQlUBAepj3IZO3Ou3QH8nHYCBn/RzYhHJxF+Pibz9iF9GGEJ
         mh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321140; x=1745925940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVK6SAMdQtK0FFO3trNDw7APCuecG0j/aMOLgynyWRQ=;
        b=BFwzNudzQgAH2cpRS8DkIWLwX0gvrJz705/xchyxVJu3WgswloPt+7mfOjg6mHNWZc
         k7UaHAN8KYhhq0Qzbs0/Y9Nzo6mGa4ZC+oruOuZiVIQL+kwvZ8UT2cCzKd2wnSMpSDpF
         DMlAokb+08mcRq6+9G5AJppTaPwcAKrALpNx8cyMi/bpdZyf2o7n6/+XWdDpV/ubRjAb
         6fnK6NdMw+eW2KEeIZLqj4HvkDzUkY9YDMtQ+pB2XkVnMaL65qORc8r19oMtMxDprrLN
         Dcoxao7VVAF2xgmVUmheriZMgQAVQw3X+BiBStqXqp3vTvjoNi4C5scI5FSkwHDkQdEN
         Vf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXducGiu3lP2bfKU1QuYysGH+CXa8jkqQd9bNbHjUZF3luhdcilx2TjTzJvAe4Egm7GgTPzEiI2LA8kRHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MnRmUMcCckaE+zQnfKUfWu6Pb6n5FS+SkgShqorL5wG0+n6m
	XSTow2ljFuk73Ly/sPOqs0uInn+wwbinrGWuhRn7T6J0keNhjRoHn3Hw7urN3Q0=
X-Gm-Gg: ASbGncsVjm7lY5vCKnCcrw5Xj1KB3niIIg9V5lP0/WHjFQF+5cYoQGFUDtxvg/zs4c4
	8uT3zNPKYPyDxwdxPwd+J0MipvmUldMjHPpEQJUFmc34SE3lqHt3OqcGVaOLoqbSQvihrbh39lA
	5XTF++4Kd5t/AC5SXZJ5Ke8xlVmt3Hl9GUmqppDlv+9qbfyOu6BioxqFPab843iZoA2Fw62uoVM
	IT0vI4tDHTpAbiWivsjrdBUTVer/aTOVLf1RvqrzjVB04zCJu70fJy11S0cBKtO6uhyYW/JH16O
	lEnGHUo8Ts+3rzsKP/O8eACKbnEqU1qy3jRHV40=
X-Google-Smtp-Source: AGHT+IGFak/38L5C9a/ywlZnr61etyWEsgyGtnyILz14A2eKTkDqB2+k60+UZb924U/AV1523eF9sg==
X-Received: by 2002:a17:906:f590:b0:aca:aeb4:938e with SMTP id a640c23a62f3a-acb75120039mr1221113166b.8.1745321139737;
        Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45784sm630692366b.129.2025.04.22.04.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Apr 2025 14:25:22 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB
 retimers resets pin configs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-1-0129c4f2b6d7@linaro.org>
References: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
In-Reply-To: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ZgUctIQTYjWrXxfNyYBxpGZo3m0nZVj0c8WONv4n52c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3ys6pR51rXun/I4Lejqlq8TRZIAVAIHHczS/
 I9tqMz00xWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd8rAAKCRAbX0TJAJUV
 VjEbD/9vdJtQUMnw32dowM67hrTvuQO4yOFlEv89ZQVN7fmGRR36YU7eW6FLhH+resuFrTEaAuO
 mA8gYg+L0yXu19yAImIMhzSkTsRpshtCwgw09eWVAJgLYZ92zOvtxh+gsk9D/E2fikYTT2y49Vi
 sKWp/ZaR4svDlClJsERb9o75EKsnLtIq72YQtJ2G4YugaoIUL67GBpjSo2EHtnNMQcxicQ4KBpK
 BreQyPN9upDcPJLRyOaMpiVk+GFf9nqx+PchV5Bhtcw93xcRS89ZRY1EmFoW0G3Ug2DkPtFlvhu
 pWL7i/dtFdKQxaQMCyfM0FDESkyqjryC8aqdL/Ht/5H1zFVET1mc9AFYHBpl93eKP5B618nl+5w
 ppfUzuRItT9aj6JGMlUpd2VfQM9W29901bKcPJJYmzpXheZctdYbJV+bXByzzccDONMY4HRukMT
 5ErkIOcQTPxzjH3YbVmxUOSY0OinH5D+6Ho/t5JDXDXnUefG7J/yVvZcALf+RkcvMSBMzoXWZtN
 tA+a0Xn7zHyEcV0aHMjRGw3hpzE56E6k134/+iH4iKProLBhLng7FKlmb7q+wv/nXpYJXTi4SDB
 moGiSITGw7FSmAgQSBSi8x7U+9FwohSHgYxzacuM+M6CdRRp55L17h+LBsmdgbn940K2KTr1vT3
 NmY4g8FTiEPsFsQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, on the X Elite Devkit, the pin configuration of the reset
gpios for all three PS8830 USB retimers are left configured by the
bootloader.

Fix that by describing their pin configuration.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..13516ae253fea6a7872da6c48bcf91eb95167a42 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -789,6 +789,9 @@ typec-mux@8 {
 
 		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr2_default>;
+		pinctrl-names = "default";
+
 		orientation-switch;
 		retimer-switch;
 
@@ -843,6 +846,9 @@ typec-mux@8 {
 
 		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
 		retimer-switch;
 		orientation-switch;
 
@@ -897,6 +903,9 @@ typec-mux@8 {
 
 		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr1_default>;
+		pinctrl-names = "default";
+
 		retimer-switch;
 		orientation-switch;
 
@@ -1018,6 +1027,15 @@ &pcie6a_phy {
 };
 
 &pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
 	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 		pins = "gpio11";
 		function = "normal";
@@ -1205,6 +1223,20 @@ wake-n-pins {
 		};
 	};
 
+	rtmr1_default: rtmr1-reset-n-active-state {
+		pins = "gpio176";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr2_default: rtmr2-reset-n-active-state {
+		pins = "gpio185";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";

-- 
2.34.1

