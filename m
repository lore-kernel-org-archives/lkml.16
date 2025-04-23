Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EF2749E4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393446; cv=none; b=he781Y/wzMq+g6ba5VfOUKSkA/Hu3yMeKC9HsVvbU/RgaGdgBk8apRzaT++cBtvGL6CsHq7eqb47mUfzXsfFq8758aLuPxyHSK7Odc0GCMEh3jdU0Vk7wBIFhSuogDR3vSTUEPXwTCmTrfSaHBEu/f8XPBb4QhZjvOpqiNuz40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393446; c=relaxed/simple;
	bh=hyNieFNcuS/h91PtLLt8b0OUKH7mzpDZpGCaVOfzJt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2j6JqyI9rUXs0BBexrl6E7JpetcCvEna6QxjxA0CdAQOufLXhIgleSxGh/jYPE78LYQJ0VeMfKVIm9pXSzGQ0zbqt6BrOe/aU42V4gKMWsIJIUM9rnw7aTN1YK481oAKIZR4dB+PGDNI6r78whdp53jYSSDhs3ElN50SylTDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXWaERWU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXWaERWU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3893208f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393442; x=1745998242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGM4sN065n0kuohgFrVzt2nCge5uH+nnpNW+1fSbZEo=;
        b=dXWaERWUKBYhIdjvKj3qnuHuJ+B1ELPXq2vgs+PbzpjpyJcrqtOsPmdw9F4ZzPXSST
         QUHvLE68xgQeYnqoNVnN+uwAmNhu7FeRZ7+ljw8vVS2MNGQfTND5nvonTtJhBPg+PSfK
         on/YHufw3+MY69vIwcKjBSci+M71yCJF4Zxni+JkO7FfF3qxHl3Uz7hvf2kSMoCQsx5/
         yiak6pdN7yFAPMb0eJ5M/Jtssizjjbvx4jqQHdljR3I+yQKsfBVVsx2dGJSQFmTKYNAI
         2QaFC/H1vXDrqEPrHtdtG1VmkuUV3PvjdWlmDwtFutxcJk3gTObpHEdQKGzyl9LOUlfY
         ANJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393442; x=1745998242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGM4sN065n0kuohgFrVzt2nCge5uH+nnpNW+1fSbZEo=;
        b=vEhgJuI3J/5lehLeT9l32BkPCVNI5pRN0thYsuBIvX8nCuqQSzetQDHCLVeHv7rnFR
         mLkw8M8AMj19YPQQBdunD8zq5QlDBA6aaJMHeR8RjFeDxggxisIha6TWOdirZjscT1eB
         5POIEgdUEF2waNa7QPNEyHrLwXfCOcr8e2t6PxuVXD9UmLGR2RypWuzCuemjnNEBL5HH
         syX3P4iHyj3HMOrt1jRTshZpYws+jKCep1YuIsaBe53/AEAm14SLKIGpkLH2lYrrXSzy
         +ChCcxjNr6L21KSDohWiV0ZagkefJcV5VPD6eKCR9IXbqpkiyK4XebK19Wldy8Y5yE9d
         r19g==
X-Forwarded-Encrypted: i=1; AJvYcCXhkBQGEbs5HJ94ouf9gWjCTiO7B2XP30kH/UZMlbbyekSU5pK5ZTcR9WFExv0hJ26QIDjZxeuzwwXgG1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFdFH1vSqlQHg8IfatgMuS6FG9uJN51yqBoKhFddVxBqi/uZ7
	FNp2VflRwIzfMegX8J+OEV/fzjhMkdN6OI5pfpShKfbTdiaFMIgseJ653QMrXg8=
X-Gm-Gg: ASbGncs05AQyFNEGCp1ecNvkfXdMbJMPhibkpTyaMnyaLYhAZNfMrrA641dyG16u8hC
	3YrGnZojjAb50zQs3+Bb8NOcU336kdwe2JwGllaiHuv0e17NUCqdGDRauWPdruPBvHU8nNllE19
	3WGopghTa6vIdBScomDZKMss0xjZdtuVWvZ91IvxTeMqdy5qiZmMV0wZlRw4mVboBsaU3UcJZ9K
	ab5kPjZ+lDK4/04/9GVUbTzX2BxWOzUOg4/zDic1zEATNvvs7CBERCkhBfoYIUSF9GNoncf3KEG
	FITgW6rZWzNSo23icn07Njw5A8ZnLYSWIuG+olvn0J3Hht1yB28/gQI=
X-Google-Smtp-Source: AGHT+IGrdd00HBZwMyBAnnRIXBCUiZx6DleTy84BgVuyF9Z71TJR+EqNYK80pzcndTozf3SpVp1E2Q==
X-Received: by 2002:a5d:5987:0:b0:39c:3107:d68d with SMTP id ffacd0b85a97d-39efbaf665cmr13784126f8f.49.1745393442038;
        Wed, 23 Apr 2025 00:30:42 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:41 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:12 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2
 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-6-24b6a2043025@linaro.org>
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
Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 470c4f826d49866a2af87f5e109672d51c9bc9cd..c0c8ecb666e178752da8e1d5c22ec2b632776129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -773,8 +773,8 @@ vreg_l1j_0p8: ldo1 {
 
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

