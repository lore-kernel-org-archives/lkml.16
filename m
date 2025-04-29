Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F42951B9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912595; cv=none; b=TFyJKGZh7aJDkKeYnVnbJ5lCTlS+RUEsyXcYjj84CQO430/2m7PLu/zEI+34fm+lXAGk3HgacBURW1dbx2jJBRK15Yp/7C/svfNJ40qBiMC44FHkxyOExEvIRsPe3VYWpJm9UhOgxw7Mw4Q4AIjmqns36nokwIzl3/PdDur1haI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912595; c=relaxed/simple;
	bh=2BF677c6tO2UD9l8anOQnMKyAs+rZguZaltM5HnXYbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbk3Jh+5lZVhrk0KX1Bv8LfMDpH/7yLqC//EVIycNJznrmJdodW3pjuzOZ0jZuxzH1cHBS1GTqY3mWp0UETwoeVmgcEYdGW+f+6x0yAI5GN9k9SmyAnPU30El48/4AUeQ7AQ0/PT5+F5ejWq6eZfdnGGXPz/NObjXxuGCbKGDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Js/QGX4O; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Js/QGX4O"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso8844343a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912592; x=1746517392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNYY5kOZUJL4wuBgLwy8jweZuYRgmMLFEUXFQaKesWE=;
        b=Js/QGX4OdaMzG84qA34iuAFGlc/efB5ngFBdDiRLm4SlwVYvUGCT15NxXxUExvhFAR
         3YC6c0fJJxxJ9T1eF42HvhTJ2D7koL/ywQ5NW2kxfqV/vgDrW/XzaGEJ9QwpvWk3U8NR
         1SZX6KKe09bmA6wVYI/qfn/H5i3aKToa8tZyUexEA9Tt4YWw7WCAnrR2xNH5FaqBptA+
         X7MlG4XYc4nq2IlKJ0k1YGjg1yJL0zAeAv1y21qkDlrEMrq6313uq0JEhA1QOni++VtY
         0/kcPfibosmJheqWfPvdBF5Yf2uEDZfyWpBxSNJoAFIN3WNPttW09mv8HC1JIYc0oOMD
         gBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912592; x=1746517392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNYY5kOZUJL4wuBgLwy8jweZuYRgmMLFEUXFQaKesWE=;
        b=v5CzRBhf6B00o/XLe08YBTWkmQ/MM4XciKKt99aayAbAj4tYFAhtcX1jqlbtsAVLnM
         tqyPV4mlTcH8gHqJK76sgGEizsduUXiHfWr6MfwEXDiZEUymiqrC2fYtby2YMlNyeJOu
         Taacc7a8FIoV5r7HgbQpqP+xLi+vm20hIdF8/txA19LxAwDnTniWTapuRkC6v64bhN+W
         /Mx4fw0I+Ex4lw8NG1eGytXKqhvjyYV5m6UaQC7sI7U1Ei21l/91NLVQOSrkpp+vs/S7
         3ptXEaePQnHLB05/g5K8IO6uuOtOeBFwk3jQQOYUVRHGi8gjYUCZZYCj1pTYHAKgnGA9
         rH4A==
X-Forwarded-Encrypted: i=1; AJvYcCXD0DYNdnNi/cwtG6/IRv3mj9iyZlOrg7ee5Qow9e0UyPOuo62MrWEiElC/9AoDjIvuUpVwZO7ihZaAnOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVHXU2SxSICMOJ0gv8hQna3rV006F9BbCrTca2dWoUyneTQT5
	E30eV3SZHPGa2XPhm+eT343fral7Jzzg6ueLmPmtZXE2g2eZySFKW5H+yvae3Iw=
X-Gm-Gg: ASbGncv5EbTohP5EWKrFTKyNSF61+7fLwtreM05+PsEsWJ0qbh4vA/U0ReFNI/QdruH
	yNbtM9jigprBFxLzoVEJBkMperRMKlsc4ZlEXuK8+4lRc+WvHLeY5hJP+H3UhIYOiSq4jl2SgPh
	zPaM0xz7ZWPaMjwfwxpA7pj7X7d2VpCsBIGPQV6uS7Zq4bWIRqHJsVxkRu2iaQ9aTtlsywgbUFk
	iG7sK+MDESB/j+Y7oH5aD8k1c+cGqAIo/WT4INUCEh1EjxbScFIjVelmryFmYUv4sLqmTMvhAot
	9npnn6FhQmH1Z1yxxW/iM3waBvobQqXixp+7Yvk=
X-Google-Smtp-Source: AGHT+IFrMrgLeh+9bjL3sU9fZCl4Cmj0USPv07C9XFmv1pDOIZO3kUr+G3+sN71kOeH6NxvXktDboA==
X-Received: by 2002:a05:6402:51d2:b0:5f6:ace4:9fa6 with SMTP id 4fb4d7f45d1cf-5f83885f278mr2391336a12.16.1745912591871;
        Tue, 29 Apr 2025 00:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:34 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: x1e80100: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-6-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=2BF677c6tO2UD9l8anOQnMKyAs+rZguZaltM5HnXYbo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIL/T4gIjuECJrChPEg9rYEt5lXJpdbRrgjSC
 yITlyKbZmaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC/wAKCRAbX0TJAJUV
 VloDD/45wqOtTUsroZplNunv5UTFGPuCOJz9r9VtZmhmkQoP06BbOQVUzBG68PIBdu2tllfEiL9
 Z1eZJUb52NQn8ScZDhmHYQzQ5qaEk1K8HBuMVCxluIcEICzVsPre8Q78TvQrCMQbYBlMUp53EZM
 TLCJQ/jXpvKlUe6q/Z4+UnQDoe7wlva6yKS9RKmq0J2iXck/XCPX48WMnbvOkSDXS78ByfGtXCt
 Y8CDkmp8+kcYV0RPmSXY5JDGQ82e7MODyIzI4AF5IJBfcnS7oJX0JVd/uT6htZ9tzGBkyFvTlzu
 Tzd1QXrByzZF6jyV8uSSuemDeMX6tvTwyx9rNPVsGdSIH6AUSLcmhwB+Ucj+XkN947FZtatr48P
 zjQh3pSn4FvxMtz4Sevxu+xC3Jn+RMaqbQzLD3MrF128oH8Rc5PjfTuDftNs0qKGzMGbrhM5uae
 8cky0XYDxIAGpb5g//9Pm5H56XA0xXcdFmbEPM/FkAR3wyHAioyFtxRT0eKoPwGF4vKCxnJ77sm
 afMxXvhB2DYSWczJEJbTquCBxqiABETMCYIccQ6QGGXU2a9m//NHHCauky5bhlOy5WxFWribuxb
 lSe99BBiFj2XSLZApB74dLCpuNzYUxnC/3Au2uTRGwrLT/KUTOwac4kECgoDGz9B1PwrXC+dlmU
 l2Cy0JfYEi0pYqg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

This override was copied over from CRD which was the first X Elite
platform upstream to have display support.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 445d97d67d325853b7dcd2060523e7469ed4e6ea..e9eaf0d2b28bd4f83a8baa89197bc5b6b90d4ec9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -615,7 +615,6 @@ &mdss {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1

