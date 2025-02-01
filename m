Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738A155336
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401513; cv=none; b=dcuAJd0cvT1EWTRA3VKHwrfPv6ZJsNZg07mMJYVBmYJBjw7Fh9YjTtcQXySexuPRGGIaIRWT7LNPl9UYV+g4XEnQBehFYnEfd7vC/ijfmYqA3F0aP9oOsnKxXch0rIzekfny6CPzc6cy2/gWq/gK9jxbhs3B4fyounXK2uvttzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401513; c=relaxed/simple;
	bh=o+8DevsM1iaqcb/GhD2I1DkFB8Jlc7QezSs3Fq1Rsw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB4SNpygsBsN3IPDFbbv/ywMU9kkH5G2L0E8F5jEJKZKNUf/a1fYs5ymRtNwGYU+PG/lZT/VhGMrfJOgp5nZwDZvQOx1BKov2DLvB+OOlS2R9FiF6fZySuFETW85Ov2+Kzfa/1So2onNFsyJtdafBlpxoGCaccwnu2L6fMBAzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MI40yARE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MI40yARE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e3778bffdso2840958e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401509; x=1739006309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lgLGZWjFpK9B/4WeyffioCfDC0xJ+bQNU5Gxwj0GUw=;
        b=MI40yARECCOLXnqu9OVdXKHnDoA1JI1t1ZoZ9cCoyCOnwmje7DtbsxGKq099ZxHtmV
         ov+hw829L4aYNSu8vIx4/djIEGniT+f+YDDKsBaYy+qoxBpsdx52e3awGV4jnaeL90hJ
         fH0TD8TbOR0NcD6W1d8/IHXCssE8haoyxdMQsx05cv9kZmDO9rj388Xf0VLW+uaHRZFv
         krZXiOxvzoPvh4cvyBvntq+Pyf8OnqhpqkLCwsHFlGI+lIKgqvwAIDHSzh+fTAandIFU
         YULY9HNL4ifyzemfT4wimNa4R6kcWMaFdRtOEpRE4z3G7YJmuVj07pchreKPT/BfjGQ9
         EIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401509; x=1739006309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lgLGZWjFpK9B/4WeyffioCfDC0xJ+bQNU5Gxwj0GUw=;
        b=SsDwAMqOvcoqi+Idug2nQgCfqbQpF7g38r9aPdThe+jkcgaGSkEkNj3Ye8bQIuKleg
         JMLjix9AftRkkhCTlvQGYYNGoo4YJKmOjjYZKQEUFiaFcGBw2Fiuon8lAGYAMC3u/vfK
         ne58zGbWxKf7Z+y9KVsJsAtHH/QwwcynOdDcW8mFifUcfKidU0+dFidZLrZvxoERG6ee
         J/Pi+c1PyWmul+l/YJTmChJi2Zl1suAwPWXuvBZYaKdZDsznGNUCsKUxMVNwRNUnQ19x
         u8mGPOS/Vr1WTZo71IipSFfZWx2FvxTfBEEHCFZ6vrACEsvmTjMBQrR2kTquXr+DmUXc
         q1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS9Wj5h7RIvp7eHJPYR157TGolKiYzuLWwVjbmj1drbRy8bLlfKK6skBYdbAwVyYqA5O8vevjOmby0154=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMI7mnIBxdlGCLwOsX2QzRf52eAqkdEG1dGHbHYL+bK0asz6t
	IBtfL5SgFiqm5azZQqTxEvJhJPZiLkGinfnbe7VOWwZQXTxo5rgtwTmA6y4+Y8PWDpM+agxXuTA
	+N+OreS2R
X-Gm-Gg: ASbGncuTksWYAWLxxdGBRcDZcrmn6Tq+wP/qHY2Pd15o0C78iJjNAYTNyNapU5NZHby
	Hvi0rKJF1LQ2WXotsQDnrOHbB9+t4t14EZU3HklfFLUtHla1g0BAhDfM0QLf7Rsxo0z4PetNgzF
	IQLrtAMeKXkmGV6lvjy0caqe+Bu7OvLRrMmYBJ7LkDs7LToMwmfIFRkRfLqS8VbozE/ruP9FHWo
	ea05w61rzbcnWuZFYoZ3A9i4/2T6P/b1uJOUzdQHh+bz4QYRT0hFCEuaZr8IzuU+Land4sWmlzz
	YsQR3KHNeLsnlVvYtqpGf9g=
X-Google-Smtp-Source: AGHT+IGr4PwaiWR7G1QCP3Rr9SzVohcwWvRF8e/2VShv5xpdY9BeXClPPRYD1JGD0VZo1re6hr0Inw==
X-Received: by 2002:a05:6512:2254:b0:542:91a5:301b with SMTP id 2adb3069b0e04-543e4c310d1mr4040893e87.38.1738401509447;
        Sat, 01 Feb 2025 01:18:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 11:18:14 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: qcm2290: add UART3 device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
In-Reply-To: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o+8DevsM1iaqcb/GhD2I1DkFB8Jlc7QezSs3Fq1Rsw8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbd7G2yReQbJB4c/wrZaIA6CoRAPgUuFieQ
 tWdrRc1SsGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1c6yCACtxVgMqIZxd540jUuEN0xogW1bn7YdDq8a36W8k8iYMfglPHfCdbsbvR5ORyyxOtcOitH
 /UXevzq2g6CJEM0HUyhPMKDxwrnWBMxy+jxeuetcFlJFCwVHtsmHYVZkvAHjtldryICWi4cgl5v
 /NiNZxOxk4V8Eg/FiqN1YrDuIQPiFWC+3Ub3CODDTIoI84TufYsQhWbyj11yzzXYG4f9jM9kPMH
 Da86bu8uRQdRodDB9HgeiNRQJsbPs6GW4J1uXClgiaDOnDeuXrr4ABxH0kbXM1gA7WfCfxSqaGt
 8luBUZiaUUmNhGcHwFvURYJaCNP4tDv/LuwwqTNRDch/j/XY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
corresponding device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594d5ce5cc314c956eaca11556a9211..5f92eb16482a0ea5f8436cfa7e55849f171ebd24 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;

-- 
2.39.5

