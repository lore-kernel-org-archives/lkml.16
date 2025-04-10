Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5861F0E29
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302617; cv=none; b=hVPzKAw0sehQnQ6dvLRSSvrZlnhFmNYzsoBG3JE3vbnNVL7T10z8Pk1jg0lrn4pN4mPB8zdrJVHRtwmOy1prMmn2tyQRbYlQv4iSPj6DSyP5vvrmT1qlSfmdF3w/U7EL0LfL3XoHhvdlP3/QEeiBLNMlSgD3LHL3WDbG1WUpJcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302617; c=relaxed/simple;
	bh=1DA4EahdV3iTAAHe9xKki0mAkcrYdEERZmB4u+gnX4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRv5gLSexTDtXI/+/mmuFgjb/b0C3wVrchjSkGhZpVD3rHdgShiZvsxUl9lwAYDaRpTrNREn5g1UGInfOUxu/y5TWQSz4MsODQ98ko6jXZr3qtMypm56Sc4wJ/F4i5QgoHtItO2kFB+oREJFxcXRMQ2EhrHpW36zVKb4h1xTUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCeEvlRZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCeEvlRZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso8052055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302613; x=1744907413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdxN9N+HI7dt/tS1Aq2Bnv9Sxoi8pNvlWmvGXY6b/d4=;
        b=uCeEvlRZ9imEngwPPxNnvbU0Lo5fdXY1BheakgI2+jEUUCTTh3t4TACIZCaeNdUUDV
         njdBNTUkN5Yt1HF0HUUUSSaMqj6rzwtYk1MhQEi3ONFjm8KmAZiBYHRtnb1sT3A/v/X9
         jqAQw8e+nyQ/KwWx8fgaZihE2NwNWoxCCF6hKWZxXBVRfboS/9pvfng/M1+QE/O0MUl5
         qvq5k22FKYlujELUROQdC2oFDISeqVM+++HZj48WjTDLE8T302598suW0w2l6HluGjuA
         OafPPAfARaD4yH/gOptW+llvwXSQJqdVLUq4AgUSq4ze4BS8fTQ6KrDeLH6UNnDTol6P
         HfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302613; x=1744907413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdxN9N+HI7dt/tS1Aq2Bnv9Sxoi8pNvlWmvGXY6b/d4=;
        b=mk20LaBlmIdVkPrCHMndd4ZLmcGACdC53dO1cABP88WovTV7u/UJGRgBVh6PTWxtC1
         s4HauC1qOK693aDpZ8b4k4zAcjejgtiQ0iB2gQKfC/KvbiUaUNPv8NDzOcf7gRURXU5p
         0k/BOEd6wyosREkTDu3lil9BLd+rxGBEn39LF4gaQuhwRrzMk5tu/FbGrxGdulE9lw6J
         +3JRzKt8FnFpDOPv5J0YfWi9JjymAII3hYeP0E0kPvOSdLKdqZ2xkY3P5vqe1pcXk2Rd
         aBC7/nVhL4CMeTKt0aD5AL9ow2P/pLb45IioGtJum3BL0mRDskv3qkOZ/QO8lJmQDh9n
         E4gw==
X-Gm-Message-State: AOJu0YzBu0YH8P2clC88HYjZdqnx6OOGXEiQZ8LE2+KwNML88L9EPzJ3
	FFXe2RZmFeanN9hepwMH3o5fOxLRy/rs6cpQky/Ni1XQ2rfuji+3RqeDUreAd5U=
X-Gm-Gg: ASbGncu9g7R2OEAhdtcUDZIDeI0WWeHA2bKogYspIhdaEog5HnA4R2SYNPmLHmqyHBD
	sgEVUtyXyHx7UUv5JMNBQbfUAokZGzy4xRdDqtfBovRzGP7r5oEyk1Yg02+pdyXGjk9B3hC8b/l
	kaE3qa1hxoT4XuUKJUy+LI+vY+H/Ssuffdxs78DcnE4iWGRxWJnYoQqHVgCBwv55Ip2swKLy1Mm
	b81+/a5ZrHXFPjmQ9JrC3oYCyfEdGi0YtEw9HMo5diciGm+c2wKu1DerIxsgOiU5TnoA9emxEIu
	X0rpC9R7quON+TjHBJ9LVXDu9JHwSU4XlHtredySUCRuFFCDK5rQkzQivfqX1g==
X-Google-Smtp-Source: AGHT+IG08fcniG+psD/Re+jJNr7zI1N0PIiz/Lj72gMr0q0L3ahiGBbdEnNzESEEDYf6AFVsdEAQkA==
X-Received: by 2002:a05:600c:5023:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43f2d9529aemr31603555e9.20.1744302613405;
        Thu, 10 Apr 2025 09:30:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:05 +0200
Subject: [PATCH RFC v5 6/8] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-6-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1DA4EahdV3iTAAHe9xKki0mAkcrYdEERZmB4u+gnX4A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IPKL7tW3fErn/lfXmFvsA1xEDIc+bFytl3Ine0
 wKjjQUiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDwAKCRB33NvayMhJ0T/jEA
 CkOX0mqi9c15zdSf0OSefvmbdBYW4kI5ZPYmGvrfemC3gS162EGYIUrdHzqdWKr/rIH5d31D6D1q/S
 hkCyn3TiS6a1DBZ1Gvc9ACtbikbVBroM+Dtl6gLvAF1THPVNGDGWma8gu1DelV7fedCX80ljwsH1Bf
 cAv+RskMCHuApGdCIqzIue1dTQauP9rr5JzUACUHeXX5iioT2RC/1Pd97rEtVLDSGkdi4n21JPaRtg
 SM/Uak3+XIfnTSU21A0+xYQaM4OjQ1zvspC5YEBc4UaDBfAyXRMiDYQ6MFpyp+gtCVofZyB7kTrR8o
 UnOwT3Pv/qG8CcDo4+oJ6X74nYXrdbid3ariuPh8hRP7a5E/BQuI2B/m77MmwrMTd7v6cKqtMbVZ2V
 3X6tzE0VwNwMrxo5TrnFbgwHREK9JPkDJ29v2egtQLWT4fmeVBwsoEapkhuolr9KVIxuf24Pt9EijL
 UlMg890OeJtxcDTCC02/GTkZ+W+O4N4AFPbUtfgWGeEaTO8IDvHMCxqEUEygowHMJaQBlK9UmRs5pq
 8q/fvHBIzq5KxkjHVjuuBqvhF7mpmjbyOBF+bzHf9FbscfOXCtozWuYuNLVXcIvIOoIRsFZ9GR5+1l
 +CmhCF+JA/IvMCPW2PZ+3rIJRtgPDMG4fnswiEaJlIJLQYOXakkiF2EIOkkg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                      | 2 +-
 drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 379359c5c7e1e4ca39b1216335cd8cf2317b6308..15ca63084ddc5c5ca34a79ff37064c5f7c5bfa7e 100644
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

