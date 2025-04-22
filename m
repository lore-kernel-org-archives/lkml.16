Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B527511F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319824; cv=none; b=hyIJl/Q5xWEQ3fIf3gVyuCg5cu2Yhj3dLCiJPBOPThbt9D7EEmv40zH1l784VcNV6o3RMmPT/dimJvllcDME38xnIPXtyTVRhdrA60A6Sy+Q58eyffojwObBnNxrhiB8Hl6C0f0Wqy2gf0cS9beoXxrCjnm9c0Yxd/Rw5pf8zNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319824; c=relaxed/simple;
	bh=huaRCgTVnoU4ujqM6yRWiZZZluuDLRVVHL6ECRdplqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jSYV7OcG5+UYuolyYqIa27TF1aGt2f/0WxSNYl3utyFG8i6BQwTCz5jYVe9L1D3/PikbNq98LUus0DBS/Y+e4Rrlkw57ZuWtL7+mJTy16RpvzDoynNbobFkdhw1FImYP31DZqSAd6YhJBRyPh4o8wYGfDUT/ijAQBamWwX4IOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvdVwnhq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvdVwnhq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso519784266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319821; x=1745924621; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPR5KSp4R+lImMTEyIVXZliHdY6c2d0H/1+T0vAPSew=;
        b=wvdVwnhqIAH50n8DitYGfa11jqjXHOkeY6WSqsaCvD0iYzIxlPs+fc+2HgJfGT1f3Q
         HDInH5nVrB1VWjUd1J31sbMzFGKr03ZJo9SnMUIMftSRFzotTVT2jJb+OpswmgSGrtm2
         Xg1hEJH+M6NPUH4GuEEmELV0FjMjoq7ZGeCD6p/J46VquDb9qbe2U2KxvWJEW+11fZG8
         wkq1yC96nHwOTfLl/GzDrLxpE/QMKbsziRArpTFxg777hq5cJcGd7Eu8CELAMiX1xdYv
         CwIkFQIlIS8+69+roQbtRfofl6sA7K7er6PWMStykNaU5QPz2IDzUGiHTPaCYNVL1rRQ
         2tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319821; x=1745924621;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPR5KSp4R+lImMTEyIVXZliHdY6c2d0H/1+T0vAPSew=;
        b=tAVNeLbGUbqUnunCTf5zAlKkF3gqx/Nbs2BxaRt6Xp5rw4NVUUJOpd3fMGH1QMTMfb
         yLcHz1R29EGbV9yZDWM20LRVNWofDQDWTNZyWQ/fksaYc7Fb6L6B9y1oJybn6VOr/RbX
         KDNE1xpGnM15ifwRCeIPxJ8H/xVRv4UpLyzZpvDz3ap3qbpX8WSlmkW3y0twX1ceM46U
         0vRD/s3SI7CefzgQtW2VYsO8uZLJ6vQ1WoSS79OR6knJWHEJxY3OufbS8bXl+97qaxSW
         uGToQMiZxnM3ZjuWJp7PeklvUINqdPB4j5DfCg2+LByJ6EAMd8uG6o5PiGHf8KiuzHx9
         6D6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXxSEnDG/6btXwcQskUs6TQniFSdyTzZG9F+DFmXTstR5UCZtcRk3Iph0g9UDwGACbaT2Xc/0Y2oJC9qE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQSP0R/vH5nYnsxSX1T4YJYQYIgb54aLZslhs+mYyXGEc0vmR
	C033GC2zasDSoiht+5BADPL0ubu7p69miOKTeurrxTB2RMJwEcgnASlQ9XjfF9g=
X-Gm-Gg: ASbGncuCQj5C0rR/STFUSphEso2GY/DPdlr/zkxiuagm9Z6a6gal8Vp41Lx2VYGJBA/
	rEMI9pAEt2fbam3F3S4aOFKpEVF6f3Lr21k1FoOiB3YJ01MejEd9hIaXUon6ZTzgFYSjpKQRi/d
	wkzQQoEGLkEkDk7VtQk5eRhKOyI6MSnwpbCMic40E2QbFs2YiDYujj7oBHVPWLmzcDlvnCDJyPR
	nr48wa+s2yFZraK7NNG4gks5dqqT74g0jp6ihgRROrvlsnceXohdpxLuNP7TDF6JNE846Tr3Qvi
	SVZ6ka5Neh4h9wmMnDfIGws47oHT3S01l1lr57k=
X-Google-Smtp-Source: AGHT+IHyR8xd5cZJWHsTUNdku8nt1qwWkdqsAnZ5XMN2nR7jFivttenunL1Z4EoJjDpq0m8Ab7J8BQ==
X-Received: by 2002:a17:907:7b96:b0:abf:742e:1fd7 with SMTP id a640c23a62f3a-acb74dd80c8mr1391000066b.57.1745319820709;
        Tue, 22 Apr 2025 04:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efadd16sm653085466b.172.2025.04.22.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:03:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Apr 2025 14:03:16 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHN3B2gC/x2NSwqFMAwAryJZv0BSP4hXkbeobdRsVBoRUby7x
 eXAMHODSVIx6Iobkhxqui4Z+FdAmP0yCWrMDI5cTZVzeLK0xEQYd8NRT9yCSolxUDS9BOtmDMz
 kfdlEyJUtSba+Q/9/nheHQUqGcQAAAA==
X-Change-ID: 20250422-x1e80100-dts-fix-pcie3-dbi-size-56fc110aa36d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=huaRCgTVnoU4ujqM6yRWiZZZluuDLRVVHL6ECRdplqs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3eFYQA6McFojm6TYHFp6Ic5jRHrXj/gA1xhF
 pfaTBGh8RWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd3hQAKCRAbX0TJAJUV
 VizBD/kBAO13UvafFHuA3rOP4JUWc4uMmYjD+jqLpWQcZbcApHDYnb24+PkReRkMPaPu5IUAzX0
 DTpoBjqQkiYL0G78akN9YE1rD7/mZSjV2AcNUhPiKfDxMaiYx1EO5ieL3pwuS8VMmSE/5hLx5Wo
 9jleY363mhEiJw4vIj/B5f8Lh5qA6gvvE8sUgbUiI+QQzAHCdJioAjX+RL73pbLIRMtcLQH5XLb
 1Mc+8KpOgBsYgRsM/kPTtEX85zw96blxV7acKRp62HoZmtIrpi9/1/UdiORV7IvDXx6DDoBk8OV
 1/FXlFGvmwlTKjK0KMFRCgi/aIvpXXniZMoX6y+PVZwSf4VT9OJjK8juWx3uWjke64SBzLkATdr
 9hdznYY+UOT1aINlOSV680ETpI8RqW1lYmylx7wGdKVESJ0WikLpTbGxtUSJ3Xjm6/EnNvmsToX
 fUyREDIONpOsY352SaEQ9ftKQLXeBVtXEFmH8LrPxumcNtTXbpXa0zdmwRivjYSBt5/xyGrVgPI
 c3uBcP0cAuwdp7UWjhT2dnmwM+pQhKo/fMZohSi6Wkzj8pyqFH8JdvdSE7Q4QhAOO/TEWChxvpp
 Hadh3jNo2NeFahuB2zCbhch+BW7A7Aw+vSjcIfPvMolJ94Bs1P8el4B6ex5lm8RPAjclMLXgn1D
 myFCohF9ZsUXLcg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to documentation, the DBI range size is 0xf20. So fix it.

Cc: stable@vger.kernel.org # 6.14
Fixes: f8af195beeb0 ("arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..34ccabc3cc302b17e944b4343a37fab0bb6334e9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3126,7 +3126,7 @@ pcie3: pcie@1bd0000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0x0 0x01bd0000 0x0 0x3000>,
-			      <0x0 0x78000000 0x0 0xf1d>,
+			      <0x0 0x78000000 0x0 0xf20>,
 			      <0x0 0x78000f40 0x0 0xa8>,
 			      <0x0 0x78001000 0x0 0x1000>,
 			      <0x0 0x78100000 0x0 0x100000>,

---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250422-x1e80100-dts-fix-pcie3-dbi-size-56fc110aa36d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

