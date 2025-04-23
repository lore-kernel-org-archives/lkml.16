Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5BD26B087
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393441; cv=none; b=DW+itKRa9dO+my8XoK2JdyDdtV7oIUEBKneI04ABhySvJ1ssphKY11zj3kBLk2B/Y6tWE23Yw5uwJrrD1BWP+bDzmvwi5hiHP0OEaf4JKQ36R0OBAea4jdv4BIe76s2ILOMeL6+k4R8L8qN0czgfibIPjMWAIsSDZB0RWhHKwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393441; c=relaxed/simple;
	bh=RnLVNTomoaoA0GKAFcSpwz9U3Q5q3LRauTcFWCoJCig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSmvrwRYw9BQGgP/Mh2JTkaaOJe0hio5D0UWEsrkfFr/d0fJcMpwSm5nbcS7L4G+i2hbK1N/VUMHJRKFHoqn2pKlHyOGjYwYM4oSI4DPPqHj+nBSQGYEnkE3NxYPVAt2nS1/uxGJQReS659pXqTkGivWUe0sHMqC6EDk1Su/gSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0z52FoP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0z52FoP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4242335f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393438; x=1745998238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aw90kBhonzt0etQPaYxZ0xyZQADb6qJo1Aqd5nSon8w=;
        b=x0z52FoPxET3ef8Rsdm8vGx6dJT4hZIsPWC4taDnfzIZeGGxmRIWMwbbx1tydtEfOz
         WjVfbJA07GqDjKdOKct4k8gqXelGLlo1LpyLcCgADwNrVMyTEDMh5tVXip+9gStRrusb
         fXOZZb78Sz69xoLRi6kK545VvH3xKacTv3f4dnZ824UODWbzXHaqTNWweUe+/KuAg79w
         wk5KkiuCKLZp1YSO+0e4WoH7MMyZstGDx7vTrU527EG5d1Ue564iKMwsrRT/IMFuAB+M
         00EwLVHxMdWGW4LKKHhT3SJRP/BjGyySkvMeOV9Vn0lZNNEUwFYjhsYMQ9v/V/eEajpX
         5A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393438; x=1745998238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw90kBhonzt0etQPaYxZ0xyZQADb6qJo1Aqd5nSon8w=;
        b=D2j0XfWYsreLE8GsBtbX7ptIRg45bgE1vwDyahraPDlDai9hSwmGB296ikoNxd0Y1G
         iTHlq2y2W0Uk2vifYs1Uz7WIE8RR2P22mDbGy/yn1EVHqVJ1PYCvECubnWY2257FQMby
         QxLogcJ4WF4uoqajUgjdYwQPzbXlxMApvAnv9PdSyQruxvx9bDbIONDt0RD8RQg7NXfn
         oSt8gbLvRuPyb+ES+1JnAtd91AEFnJRlt9OaAyzt95nTSAvGNx6J34l2XYtJ51itjKUv
         T6fnNd98pC7OU58donfrIXU2S3BQ4N7ME/zsQ09BL0G4vk37o1kZlM3lthh4mdVjpgT/
         4yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4jIdaLU4jtHLCgBybnXArxNWuh7IxhIERi6JzUTVm31o8QK9KO96GJyw2I/XKIvY7wR/Y3YcG6K9Bsn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykW2TbIH7pPK8BBSlB07u5RVn/7WBMc8Ih/F7gPiAQ6acZDvPl
	jUewRR3smjZ7ATggadQUjvOmZxjqBvgd94dTV30DN2cu4OTtUOu+MBe8uJU3pGpR9pm+3CBB8Yi
	Q
X-Gm-Gg: ASbGncuC8LLb17YifmcIuTt41c138LarcrBThsQhllPYbn6xCjrBh5HsIGQxhev6lPk
	hrH6bC9uejRdf77BUL38wRAKJTtfGSuIwsozlNHoEMjFwnKW+kXpuyeIcraL2z9uotY4MSvsUvT
	nQtoWgpPDoa3bLh9KVoGdcZx6VXdAZ8ZpVYLU1hLK+DiR2I6Na8rxHyjjywxtRmS/x4FchTFmxA
	VKCaD3TGaE89IXnHNeedhNdEylYU774XA03jYcwtE98PfZacez9S9pcxRz0R0V1nyhid888e7++
	tTyB7d7kvyNuMBNGPD5dw9K6A21f7dVW37AYhOwJFKlhzhDWqIcrZQU=
X-Google-Smtp-Source: AGHT+IFcdiZukzdWt+N7jGpyVttEY2AZ2bkU0KD8aSTOXRWRwbpjuOWS+5eqy6YaGVuCLbhK04RUNA==
X-Received: by 2002:a5d:59ab:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39efbace33fmr13697317f8f.41.1745393438070;
        Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:08 +0200
Subject: [PATCH 2/6] arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2
 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-2-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..4693e4c9986a6f7d14282fabd584cc16f43f0f80 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -747,8 +747,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2

