Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C372248868
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582037; cv=none; b=VhHAzGsbngCcnO8/oxc7dRFSnDkuReo5Wj8YkB26FnO13Fg+Yh0Q0xgN+j5alVIzKs7alvfgyobAe8Th7FYjuaI/cm5UNdTSJYu01rXPBUyOaBHy/5EnhVH2DktaZVhwb3T6ylrKYUk+7iPfcXO0lyNXNJpq2DZzfx0T8C+BZ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582037; c=relaxed/simple;
	bh=nIrdIC/aS51gt5+1wCiniQXTQ9R+S1955oLTVv53zdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnEz9DtTCcRx7SBYoSSduJOyWcW7QCRpuElCUH0GfgRbC4nHiy43LpcGr/rudLzt9o+5Vt6A6KCwpY4ikUwV4GJ/Rt3hFEH4sdXaX+K3yyLLbCnDrWWNojHsX1WrQa3m6fB/HnrwTO1fUh2KFn9vpXLTTKA013AdeOizaONtSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OhYNFARe; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OhYNFARe"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3350137a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582032; x=1746186832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=OhYNFARe1Q7n+/CDQPYEn7t9QGvhxWrN8jk3pRmZmb4kC0+TT8Y1XiUo7i2SwY77Jw
         bZ+pBiu/AURrY4N+LtH2fgnGNfEI3g8LajFkczQC2CWm9rCY/TyuXGLMNTQth9r2lkO9
         K0+dzcsqA53MMTTlm+yR4hmi1bOLJPhf2RLgk6wxPLr4YA6NfMuSWgxrtru7n4J2edfM
         /NP2riJG9DXsk4X0oOnP4EbSKFM4BAqskn1jKblCP3EAvr/u7ILmmyrl6OaPa9saa+xD
         e2aotBYcU50t7vAAmd+dLcgquy87UQ95rldyCuFZFYr0zd/hZlHHTx86RtTnWWbcuLb9
         2snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582032; x=1746186832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=Hmu80No2Zlzt65S3NAZpTr8Y2RA+J9LGFXxY+o8Cgq7l4GhPrMY0YiFz2hRWJiTj7k
         jU+9yivaMjDP1xOX0v9wZ9S5/OfgI1eGlLW2x3OTr/XUbKrWy/NRDmTvI1qZCqC4aT+o
         DoDwnmP6PojUOYWogmk1qaq+b3Ob2q5LLBntNPp7mqud3Yde+wbbmXoJ0U0lQpGRd3Nu
         1FcKWMHzQ9/8LT0qB1uCBaMlLEEY8Uj4et3fVbgDSzW2fh6o6xC1C4aDEC5QESVEexa2
         6koMjuY0cdUkrpSm/s4BeUGbWRk/apDuKze50mbZGnijg5zB4cm6o/gfxl+/Ikp2BBkq
         LUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnSdgCl8tb90fOmGap1nCGTYYsHmMekGL65nzd9HFdZTOGSgoleJmGopvctywBYnp8FsPFD/N75doR2nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjSPTuQqcnLhkPXlm7E4i7uNuGot5S5EzcE+a/SJH0UcezjTAz
	Mer+/n2L4gw1RHPqtTc4m8e2HTL5UBbOKkdKLauNZnuUxqcrOX6UWMw/BFhxxW0=
X-Gm-Gg: ASbGncuU16Kx/Fk3jmHOL09fODogt+I9DX2tIAtHVQRv2IrIDtQqJGG5BeXIrddPqRJ
	OWcvlgV/ujeg+P2iWvAz6oCPYtqIDQE8Ktc8IZs+KDkCUVdfKUiUb2Fg+JuhxlSUqzfpKGPDk7v
	yHWGO+45tCu/pmIHXGoFPF4iNw4CY8sACPyqg/PlfwobcytOQJjzv2eAiUQv2SsZhYitjG++WR8
	KUlIYCw3FlSDAB2Jc/aSSBSmhyBV51I8bhu29bXzl1VP2Lnp2ak2Q2TMeP1xI/qvoR1stlHU7EL
	mH7HIsl0F/4FC2JOB0ehVpcRX7hcrknbp3WhOVVLs4vzYCT3NxSMimUTofu9ohR2JS8TRWYWeDo
	rEvsVfNTDHs61ruM192blBHbgpqm5rSFYSEnYjM6uoqrV5UwS4iSncT32
X-Google-Smtp-Source: AGHT+IERqSPQC+gRgsoimNGLFUMQlpsefX8iY+PynWp36058zIqR+bhkys6buYwqIPpM3iwqACft9g==
X-Received: by 2002:a17:907:3f0b:b0:abf:4da0:28e3 with SMTP id a640c23a62f3a-ace710a0e0fmr169716366b.18.1745582032503;
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:40 +0200
Subject: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm defines
 for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 1089964e6c0d819e166fd5a959f7f1e6fe688d65..5b2e88915c2fdbc1abf635f13537f970ead02cc8 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -953,15 +953,15 @@ &sdhc2 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0

