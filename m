Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A49156CA
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211618; cv=none; b=BiZgAog9OmxouSN19ZhzrssgmvgKpWeMrB6FI5KnPI/K+KQfHm0IMJ5Eq7nOwZ5HnkHCNz5P6yHtkpMwJ8gc1+vN0v1Wk15RWlKqpVInY67WpKyP9458eVCstI7AgLivc3Tw1xRsU3VBVhie0qTR0vXKxuLeTE2i+AR+gDsa58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211618; c=relaxed/simple;
	bh=8iUkVLiRaFgpf9kgBiXuc+txIqsEZ1pdksC7K1q+D0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=CW+2+2zBI4k7nSgV9Ts/uU1UrI+GjEqPHpf2/0v/+5ter6WDwv7ktinjBd/6HhlmyaaN6xvN4uCzGXeKeDLYXTqPzwP2d52dtvBMG1lR+TthKzf37LL640qPjx2CS3z6If882mm4kzK3KAxKIYdqlUh0hZTHJUfQfWonfeJGYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjiXoT6R; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjiXoT6R"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2256202f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211614; x=1743816414; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=bjiXoT6Rj+tL3xibrlFVssPADTu46rKyN8PksK+p+zKemdpNLiLPa5YZHP7WrAoZ1e
         9rUScCkZtfcEiBgilNVilRpAk1iC+ZwtoIj2CqmC5fp8FdzO/WLR6zRGnu9wcAcxrb51
         oXjZ1EzwJdTjD35aoVVnrRdmIFUrJ9lHhZH4EsQffoIBShKS4KafWwRgdYWiHjM1B6Tl
         ERqV78QecnvCFY8clLwaFWbHqj3QQ09RHbp0ptsBxx8untPyDLjCMcj7cOqy1ucYSqjd
         kj0THMTx5Fv0nPvmwAv8kmikJ0gb64ajQ66zsfXWXGB73w0Kq46DtcnbL5kngHjI09y3
         2vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211614; x=1743816414;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=WUho9PU6NAgGsNEu5DMeBNKDV1HSG5M5rmJyixq6A6ZniKQt/X9L0VCgCLpJNouuBD
         jF6zZA97Ir+QA1UorlR0i+unGkbsnaGp9+BC/OYngTvalhf6wY0+Vnkc/Ysxh5wnXNxC
         HKPCNFwecuRB5LQ+YkN1B6MJYHwqlDy4XEMZW5MRJ/tN+57R5TbBpi6LZcbyxHX7n7U3
         Y7IRcr6kbL3r1bupiVUrNX93/H3a2Uj/fzApBWc6qJwALxdzCxDZHuVEEOKLR0Gh63ng
         9CmjakmFC09vhcMpyR9hRBqwkEruZ3QGdTm2ggMAZzBLMyM5CmuPzO7hn+28QanE0B8c
         jLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaUnrjBStfM7rBmZGX7CqghJRV7Egnh0KFcUo0keFDyL+LH2D+wPaFMSZ0Ci1pAupPo+rqF6hO7CjZlbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6bpwHFCfa1aPSQmSnbxARAi2VvSsF0vNy1yNEa5DYDvOCS26
	TUxoqPyAPGdR653lhsPVXDrP9LNxydLsqt5lUAC6rMiUVkF7VEANnn+FdgaGNAk=
X-Gm-Gg: ASbGncsLKuvu0IP1Z9abLrrWMKpP8bIsz5bWoAY7d3Vyw8Ezi/hGX4Svf3FNVzrep7R
	n/1SAd/FdFORgV2J++DvancA4keDWw3IMqLad0p1LeX3K+xazzoNPo3DcTsno/sofeuuEokhOmB
	lZAx3+CQ4XikcWaDzn8DsS3daYHOTOoFbiVRoLZclDgeSggwm0Z661Pf13E184jKSM1WxRgtvn6
	/qgY39RP8x+X2D6L0d6F+Gwc5FiuAdYQVqHDpVfzP4z0kw4UQIvqQ+yl8j8Icu9pfhf2rsyUT1r
	QqIetFRnN10yIneKXOiHX0iGgEJoDxJCfPCX5L0p7eSvkMWkEj9LiXAU8GruKljuIKpiKBifoUe
	XH5gqfHjELA==
X-Google-Smtp-Source: AGHT+IFtPc2WM6pnT8Dub9oo1Ivvz7Q5Lsd3aD5EmVGBQBZ7muWGL+w5LN7xlKXQLJlvsfQ0fc9dLw==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr21687f8f.5.1743211613776;
        Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:50 +0000
Subject: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to volunteer my help in keeping venus maintained upstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0

