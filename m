Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86984266B6C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209511; cv=none; b=tCLorY7U7cC81Cdp4kJnRedGEJp4jXLV2OlR8ahwY56piWaXc1lKEjHbncVa/bajnCr9KKcyrtT9Hw4F99Rsi2qRohxx3MAZx3P48Fj6wQO2UiX/OMMteufbqBQWnZSMAKf2pvP4l6yyWeRsRbtM2JRmtW74ctuLm65G+Hyc1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209511; c=relaxed/simple;
	bh=LFaWlT8O8apwunlmzUQurSx47z7eOOQyQ6z0Cp8+d3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ab+4DpqjMgR2HEWw9WRBhkt5k6uHLV9kwCgRnMCLho/fbfoih3mBdL6DoyWIqM5+xNvWe98xnOTlLxE3cSB6L4amS6DVLTTJ11VeQQFIrWmQy0p/z0U+QXqCfc0bwvztCSFB+VFNPwNTrlC1iAuNfC7SbLzx/o0nU+ti2eFGow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mffrfda9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mffrfda9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5966642f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209506; x=1744814306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7GE8ttTtM/vr3qrOv34WTHDyd35XgYWdWnFQsZ+vbY=;
        b=Mffrfda9aWzhCxOfaHpc5/BAV4n45GqI/6v1Gg7IYQpIexuY17y0EX7m55xeQuiEdH
         WjGbIkj6zK3BW+6gyAu+HFmWH4vi8KEbsOeal2pvMrjwRiIpdNJY59s9VQI0GDB5Ybdg
         HGTDm5qk9CxuWXdkZg0KYkMsTZo1zeGrQ3tTlkunsQCi8QXd688TIjwvweu2xAqmUi8T
         OgsvXGc783NoEP2kl6u8wELEuX45PODbKBofgcVcqEk2wmMZOCIloLnnouY19dls7gy9
         NRst8HgKpEKB66QE7r/sogzAHVb75XBBSHemgaI8wQLgk2h3qYb2Kz3mbqMWy3IjdI1/
         sHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209506; x=1744814306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7GE8ttTtM/vr3qrOv34WTHDyd35XgYWdWnFQsZ+vbY=;
        b=EZBD+W0Mq2U5yRv5cXwvB5icLgYTu5Eh/aKvPWnTjXyNopsGHtPgPJKj11LtapiObe
         JhWmy+FyvVcjTE47Ny15ZqNoEaGFXh8wbk8TqjchRgrhh+2ZhCZMID4C7tSH+2M5C/2x
         flg4HY49JhL1h5yrs5tzH8dK9T6Ys4Qf+zVrRXIfucny2zie/lAueYSqE342Mi7tfepn
         8767xz7Dfx/pMISKbybnpsY58q59OxZoOI7we+wVh5WteMGmb1RaIjA/q1ivOWAchUay
         p9/dYBCsH8arzEXG6AiiUwkuaj3tIfFtswMhkwG7Fl/d5Fcln5zckT8VVwcsmP1xwIVd
         eXVw==
X-Forwarded-Encrypted: i=1; AJvYcCUN7dyMfymK9BVJWi8HwtVx7CmGia8rxwaWSaYqUaahNzX/MERExgKcv6M8SPAPRv2hxbXeCDjVK2IGE4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxif3CkCrH8JelZRlM1b3pflmSh8+YwfaEuejdMyb5EOIcLIyNU
	Av9+aPR0/FlQsNh84jIyqFSqcbNzNKPIc7C9fyZLEF6N+mOogMHfcna05hqS/K0=
X-Gm-Gg: ASbGncswfW/yRW5GG5WpxzLXGFbZpr4f39H2byYJf4/aja6I6Nu1t0pIQh15H7DatHN
	pFxZ6xWIVr5oad+6Z9UgpZAdoCLdvaVUnqjM3cnM37D1f4I4nx+wSaUN3hczKCkGk8IAq6zRcN+
	44OLp8wL5/YKUIylvCAuoV6tqX0PJN14CljNA8cXbm01UFVSO3V2f8L9Cfgl9TCKOlcCCgY7mLf
	iOSCLaYfq7v7FgbhOXmVlXS36wyGmZ7m+xoq0t9/1yQVJpDdRWAtx4H8TgdoAEKhkAozMiCVHWi
	YmD+86fRCZSvXXyr3WSfQdjfkOPbdKn+CJecAWSe84aaPvfrdr22xKLUgdMcGaTZLWiPjY1n
X-Google-Smtp-Source: AGHT+IHBOcnQAUv4WE9+yjJLtCtaUreStK4OYX964pnkEvboEZCla7DUKWRpQdsuIBMFNPLo96W5lQ==
X-Received: by 2002:a05:6000:2508:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-39d87aa57eemr2988297f8f.12.1744209506513;
        Wed, 09 Apr 2025 07:38:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:22 +0200
Subject: [PATCH v4 4/6] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LFaWlT8O8apwunlmzUQurSx47z7eOOQyQ6z0Cp8+d3k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZdrvKI10VRBU2gBQhU5KhrlbnDf2vl/PvYOgG2
 RDKqtcyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXQAKCRB33NvayMhJ0UzqD/
 43VnCWC8Zj6mLX4sAkgQr1lCuIfpTLKKrg1Ok+QyZh7elYr/qrF06zdm2n8THAp0DCDOFEKf7OVENX
 edB3mdsL39N13pHHoETnsIzBhyUWDSHIWI5P+RJD8fSy4p57Qq44+wa5l41acYu/SZzxPmScmhpAbx
 niOR1vBAEeiqOcedXLfbITZAqqPw/SteuB+2gucNPHqzAiG7UZeB/WtcKU6tXRf05kNC6lCjzDx1IY
 7XhgZlcW2DUGftDe8IKSKKEiI7di0r4hnAMqMsyw9HHeEE/iOGk3EWAqslkmXOahiKijybX5QDDckJ
 SzaN38j17zNiWMOQgGU+EdNTQO3kd15YkKDSU9Bu8R5rjY4r8TqmM8WaxX1MQVVzMMDyaVBUl0b6lc
 LO/dA7HlEsu+9hwTC4XinTQev8PMNu4hJVd24CfFMMbCB9YwT83coL+z2lMqlvm6r6qJRjrzNHVlwO
 25NGiSD4usN/bLW1wlIDhp2cJaHLmMMbw/m+9n2S4czbR+SDpyrs4v9GvsMGrC8YXSPCys+1hzpL5b
 z21EbKOnY2nVIwUWMCpY6Z3ZLeOuxzrw3qRg4wDlH+Ai3q5hKeonwJLLVseitv/iYqOfjWn4bCWuLr
 l1ivBNMV2Qzh+BrfbBaQqRHhJzP2HEM3bkuqi+NO1KK0DN4UlcUV2TDd59Wg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                      | 2 +-
 drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -20,7 +20,7 @@ qcom-iris-objs += \
              iris_vb2.o \
              iris_vdec.o \
              iris_vpu2.o \
-             iris_vpu3.o \
+             iris_vpu3x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_vpu3.c
rename to drivers/media/platform/qcom/iris/iris_vpu3x.c

-- 
2.34.1

