Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27527C151
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321145; cv=none; b=AGygZcU7Apxu/47iyBTbrldI0ubhYNBhmQhYRZ7I/BPqh3ojozsM43Mx9wCZ5qh525uOhGs0u2o5AItS1Ue5UbKUZBVeIcIQ+ISvl5pZ4qXVJz0322FSlWpdJTOdb8pn2JX5MxERWnZOLA889Q1oEsYYg90i4KmWCFC87MQWLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321145; c=relaxed/simple;
	bh=f0MHxJKf3Hkr8DXWB06Dx3sr0fAufMdrJeDI0nnyF6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tA5JvHykuMa5/GRfhh9BAVyX4lNeE8K5IGHwCZoE3tUlbKKOWcY1IsBSnleMapO0Mr1aZ3hUcQWw+QAORU/zq9LeVl+XhDyCnbRFDa6uy1zE5AEfcnQBwa5glfeM/lazZLk7P4l9WfBvJvyTUBzAYD7RhlCPLKtIv3e3lG766Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/XcnX9i; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/XcnX9i"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso10607244a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321141; x=1745925941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xih8C5/ff87ixFofZDkzHS9XUgGjx5tCNqquBqz1+E=;
        b=A/XcnX9imSm8D6TO+Zmp/OSAlbMUKLYzNrjjvyoI6h2+3Izsr+KEcWDu3uLYHB4jcS
         LKJoc8FzA2bcgNX/8FZRyJQf8EcjZ380UcgJfMQ0Qo5H0aYYqe88BKb2ZphHLgIm7/yq
         sTOHWy+YfxMMIEgwmZQQC6HKcQr/+u98Ps9V0Dk+LecYXK32Y6KPeE+Cv1uxiKGPo4I3
         4sjMhVxV4eHjJlCFI0MkFVXRpapumLA/8IGuI2EK13Uie7yL7Ebd6kbSNMMdVB0U+c2h
         A/wf3FXZXXhjkNh915RQU7dOT7YdvCQ9Qak6nqVHsbRBEhS0LUJpGWQsf8ljwRctKL3f
         cs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321141; x=1745925941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xih8C5/ff87ixFofZDkzHS9XUgGjx5tCNqquBqz1+E=;
        b=G0CT2GSjjVJGY1Ayk7t2e+RfF6hDVlZ1TWfebMMevn2W1P8NKCEnYlTFYXSUQRuGT6
         uG/7zTR1NFI3GDTHqvkOewF3nLa4A7+HQxJiczznTHJb3R28b9AZilpbOWS3iwbIzRlH
         9m6nJ6zygbPjGYvngakVULYcRdK/B1W00tb0NDYoF7sCNF5rV6ZcUKyeFrNVpyQvoHET
         k8b/f1Q+wo0X/k3HEWyILj8NqMgebJh2jrGTr6kPsxIlaZNTtJlVXKtnbIQWZOwJrRbr
         o/FzdmKTNgD3CVDsQ/tNkWRQWivNcZiT4pxWqUrZ6wxKTZtB2SQvrofkcmr4LGi1q84X
         QmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7WgjAh0CUS9aE+PcNscFhFxlI6FsGeP73xN43Pi3GpD/w3X/mgZSHtQy5iEbk1RXOCgd9Cl963QuTvXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKE6OH2xWWi42TFku9d3TRRqAFAqFVcN6UqQ4tJfU3UgUaZh5/
	jNaVu9fxVYgNmjwVMhn06d9Isq0ow68loEN6likrpvniS4GbUo1sgG04U8Zv1pE=
X-Gm-Gg: ASbGncu4yvZFXi6LzOU7OfYimN4zKBqwJkKMImnHQ6ugEdqpjTflQMeW7iYfpDbT3u1
	dhxYxPecZcSJgAvjH622+fagC7Glw0Hoid4WsvuO/RrxqihA6hYINdJ+mBQWlgJuRodYcd43Cwm
	LVKW/qYZ+1Q1UmXsiY7Cm1LqRlAakl34CIgP3/1gdszhpK9eW6XqMLbtZ35Kc/TFJF+x1Dy2qyS
	WAmn+omNHqqYdWuK5YVHJNX0ehpEUVXQh98of0G6BNVr1Gt700HrZV+E6aZjkHNrS4GP7xc6UEs
	ucGAdgJbiR5ji7CvCDN68qlD20rD+EdMWaWFDYg=
X-Google-Smtp-Source: AGHT+IFNW6MxlAK6ZXmyz0bM7EMSyujIk60Xjp/CHp5P8FEIxp7zbDhOvVl9MF+BzG1eBHfqFySC7A==
X-Received: by 2002:a17:907:2d93:b0:ac7:b231:9554 with SMTP id a640c23a62f3a-acb7512199amr1076294666b.11.1745321141417;
        Tue, 22 Apr 2025 04:25:41 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45784sm630692366b.129.2025.04.22.04.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:25:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Apr 2025 14:25:23 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config
 for USB0 retimer vregs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-2-0129c4f2b6d7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f0MHxJKf3Hkr8DXWB06Dx3sr0fAufMdrJeDI0nnyF6Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3yvJ20SI06bKskDgXlxMXmA/3j9ooPW9rzlV
 4SAtMdORMSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd8rwAKCRAbX0TJAJUV
 VpGREADEm1pFAljBBkQk0/qkWYxpIMDOLKgXxQB9oTDkPtPN/y6NRimfGq/GcuDAuJb3sJtLa3D
 iD2YcXdqN5dkoamQv0x7oIk+OI9YVMaoykSbUdvy0APVGwExMhGgEwnA7G5sA4KGco38XmUib0a
 /XdyWMuIodOCP2TuonQDFh/daQwEIyAsf28IfOUMtqS+MxeevmxTYaUqXaBvO9lFn2515yXD6Xp
 9wGosrVHtfD8UPOhutQBqSEzXFEVdh0kFGrsoANEp/dB2mJhnvOjBiC0jx8bgUGNT3RC6gwux4M
 RcwwyQZBfkhOIzU8WFFF27+a13PuvoR1Foc20KWRM1uBlU5FQaLXOqyMQTCQ6U/auaXfLLJzxA8
 f0kOADK0TarJVa49hreBv/bwOug1ZkTOVUXpgPg34ScJvdy1+pF+ooEqLOvvDTiKCy1q1LNOQR5
 sA11917Fjla8DOjla3sEmNuN0+g6yZC2jllsIz2/0wN2+8iNcXfBk36A2ZON1HtfdS78nfG95ej
 R0hwq1M/g43LRcX4s16f5OWR7vONgcGeTASDgi8Hgi+yiVe2p346nTKkuiqUihJ9U7qMS+DC3PT
 VxtK2l21wUdkEYO5z/TuNePc6DQLONSasYVpWFbxNjqugCTEkozg2WsOYZNIp5EOdNVbbvVowOU
 EyYVhHKmAB1J3IQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the missing power source, bias and direction for each of the USB0
retimer gpio-controlled voltage regulators related pin configuration.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 13516ae253fea6a7872da6c48bcf91eb95167a42..7104a21f852b8658b893490a01cfa1d1fc75f90a 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1039,6 +1039,10 @@ rtmr0_default: rtmr0-reset-n-active-state {
 	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 		pins = "gpio11";
 		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 
@@ -1046,6 +1050,10 @@ &pmc8380_5_gpios {
 	usb0_pwr_1p15_en: usb0-pwr-1p15-en-state {
 		pins = "gpio8";
 		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 
@@ -1053,6 +1061,10 @@ &pm8550ve_9_gpios {
 	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		pins = "gpio8";
 		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 

-- 
2.34.1

