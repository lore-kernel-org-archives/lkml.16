Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DE233158
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568457; cv=none; b=AhTzSGOjXNm/Et7bbuyUeYgK8jqGxkG4asHHTv+ch2U/Sm18zYGUA3ymNoz4Z4EYoEdSTLqnWH6yiM5DtmGtC/RpaEnnXVCkSewO2b/bls3wXr9A6dAjTBVVpeWTgG+uqgFEONB/LLoOGHFJ9QqZyFmlLads1SrOSvr2+9NoGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568457; c=relaxed/simple;
	bh=t2UqwPYP1B9XN/iC4TKLlBIAancDyLL4wrE626PGHow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pq0/XSHJStfESb+rw8te00Gt70DEcdZR78dALvvDcSlb6kEijFRvvQa7XKokVBehnAjTnmRtHH5tM2TkmSLsr/2RRd5/4vX+yDpu8JWaVgIYXQxX0f3wGJtQomdQtsmnFLVEhNB2kxFAFB7sY3GxJ5RrQh+ixPESISEE1WYgxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E/ZeNWO4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E/ZeNWO4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so18090595e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568454; x=1746173254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=E/ZeNWO4NOjvxBEyxrMqorhodK7sD0OA8gGwrzWhSZm+/Eruria3SxiWJoJC1dI8lk
         0qe2/F8iWfyDpJqHMckbEZtd510KWYkbyUhUbS3156V4Z2ZPTyV5OUtcUsVArq731Dkh
         +3fohrEDKlc6iTjK7AsMHPVAi44VjDgPIFQ+bCcGCbtCGlrJz9dgurhjAGYHt2UYTfvM
         VnBcMp52NSfSs4ffnjBfE6n7DFJ5Pf820fh1f5O8G46UBDBqRXl/3AbCqYVjwkZNOqWM
         xFLWhIfGezYoRtQjZi0tbRPWK8MaGYVIVoLESQxGqkMa+ViFlwhYGSiaZA+FAv6EPLYN
         FwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568454; x=1746173254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF78VVS1a3vgPm4/yr7suBZclt6DuZ16jbZS8capHhc=;
        b=XUoWyry2lSjeWPTLWnl5UME0/9SxeJncWUbQNNOdZYy/nAn9bd7dIJPMERFrv4BAT4
         svclkYnf/gZGXnSclUvnGf3W6Rg2BzOY+kHyky2kr6bS6LUt+gcEqmiHczdNwFV+Kzpe
         nW/LnjgKUz6sN+XFH070D4Lxl5bXbSaaG5Y0r8JctspvURFCmnMEXx8DwVLsq8l7OLWU
         o1enZhgkmuO6jBnFg7QthFhxmey2kgdO94LzeJtuupOtdIg7OSv1SaWn5PpZipjPrvfv
         CfbDltgdZ/AhS8ZnULA6tyY2UM4vNO2WJn3To2ZrV1YiwarHJz0bFvicfOaePVdAaJRA
         YKnw==
X-Forwarded-Encrypted: i=1; AJvYcCVkyDB+Hi5x7Z+0iWqY8Nz5XSTgZVX74jUU6Z/LTVaWRjXdSeSBSUO+OKkBMLRMXDhGdTtHvV8GJgdNQC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFkxhKSYHXkGSsljtdFzUvUv6zZ/hQcjiHrT9m+KKQsQ26AQo
	qS4WWf/8Dl6HKxwx8K0wEGKe299lBYaINyd8u3tvAJUyVL8dArtjPnO5Q9nVCEF906aZKP2wABp
	1
X-Gm-Gg: ASbGncuk9sFx3l2PBSnriKHTPwbg1Hu4VeJAUoIvft9lWASp+ZeFbtQerhge4fjyXgI
	6+Yljxun4rwLw8h4JZrWup/vCIoXJqbiiXwZeydvddnHDjp4z7lU2UdSwwB5u/sNitq7bryTH/a
	H3R5mb20NljG2kq3B9McKxHi3FAH23iafQE2whDi9AyNAbeheUpWTpNX+DveA/AFG7idqtpKN+P
	EglWtgVg9fbmVv1ADZooB3vTS9cX5JxaWNtefNLdpgBaOOoxoc7Ck+dihAJzE4+Il8gyyegeuJU
	5SY5Kd5sISCMa6KaRwioM6W/Uc9G9dqSflFKfWGojx4xY+X8Tr1qVJ7aBix9ZymK4SM9s2l25hm
	+f5fh+mpO/dWeFLvbZXz9J0jympyH8eEVasDmv/uksRWH41hQKmNinOvI
X-Google-Smtp-Source: AGHT+IFVDfaMfuOXmMfOCltuXID8xfqxstRaUVHZiIEzVJ71LDPZOd47+6G3giv9YW3kXwRnEPBUTA==
X-Received: by 2002:a05:6000:1848:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-3a074e1e7b5mr964843f8f.21.1745568453788;
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:26 +0200
Subject: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Sound machine drivers for Qualcomm SoCs can be reused across multiple
SoCs. But user space ALSA UCM files depend on the card driver name which
should be set per board/SoC.

Allow such customization by using driver match data as sound card driver
name.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -16,7 +16,6 @@
 #include "usb_offload_utils.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
 
 struct sm8250_snd_data {
@@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sm8250_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sm8250-sndcard"},
-	{.compatible = "qcom,qrb4210-rb2-sndcard"},
-	{.compatible = "qcom,qrb5165-rb5-sndcard"},
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

