Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBB277803
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982044; cv=none; b=LG33wzS8SL2qxVZx6DD3wBcloXAAtP6GTIyrHoA42VrW7gftpdBEJo9z9WRHX6ZIIXCQLXiRnbeLKmCJvIo9M5NspGcELYzNLOF5bPbNB82c+ipyviw9743g/eKqyL6XKLCX0hbPyAcOgrhQS7cyncjClX5LgMJbSGmrIe7+njc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982044; c=relaxed/simple;
	bh=6LWWCl+fw76HY+PZdOokf+xdGWSBmr74emQwtZNOoaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqIIqoTZmMOq4I31JgjszrkURp9O7T9DUqc+JxcGyChbSejrCeKrKT1/dYMzeGBUnH+gV/JuGeFKMGpIUffzZfdEF03Xv/eqOyre3Ab6rr37ZjyWQiBUORzdU3NkMYtWU09xtUqyqA0WwANNFC7srjcIwhkfSsVs668+BCJeiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SyiuupG7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SyiuupG7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so346292566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982041; x=1745586841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=SyiuupG7H306YWVn0b4dY0TBaDmRtwIL6sVFw4/ennSWl1NemCLouC80dO3bUVG9Um
         5M/dfjs/DRX5qDbpVBdQpLP1xQsr8pxzAZFgxyTRCmaQVwQc67Rso8gQedp4lsJiBnpH
         kMLuz0gB851OwXqYcAQw7KMa47CZrLt8c0e/WZwmkWTvYK4xGWTQtja1tBUSnf8bzHrY
         H4VWnrlbLy7K4TQ4qxq/w1L+Qw4zGb2DVJzmL6SvpPm+13fTrsbvW+H/FBZ++BMqJa4a
         TwuEzCX82+WpaikrPTmMnHehN5DtBl6feHHLoAF7v5WD7Ewk8p2KFaxAYRXpS7c28OQZ
         apXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982041; x=1745586841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih9KqGuWJ1rc0JvwhZbwATHF/82WoHzu4xe2IRdIO6A=;
        b=bqq0Fm7fRPp2kPZ58T3anwBwit+mxetdTXag3LvtXOi4ANqqmDgwrarYAAUFwJgu2Y
         epv3wtyKVc8WaDE+HUSTeEeAOHQWXAkZYUVLK9vfbKfE9l7YkViXTF6KizDKkLHNHIaG
         VatQ6tJP/xUQdLj1yMJG/kPv31K6V/KNvoC8k1eAj1r/pnHg1YxTf5hEY+Zq5i/fwugS
         FHopgXDDVi/uIwbSOd6GUGOdKnmQ4lbwYUIl/P7nP4MdGmeSckSQ7+TRrbetUfiibXc8
         hT4WCjJtmcw4XWxp2vLcuULP9a9aY4Hi5rk3axEKlkFS679cK6It/H8WqZy0ZIVrIK9A
         XlFw==
X-Forwarded-Encrypted: i=1; AJvYcCUpUC693Z4U1Ro3wEGahV1EIaWAHMAVEpmYYk/zkA8kHzXDoyK2NK35aa5jiOYi9xFPKNz6/DLfbNCKA7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwMhEFjJOTtM0e4DIrDbwNX8hFG0tVSwM2SbFKFzZXUlU13bjS
	a9EdTxN3ltqDXtGUcE4+CBaKw7a2HpIyo4TUxdbcXQKodKi0Zoj87WHkkGcycGM=
X-Gm-Gg: ASbGncvQTCUHbMU7c0Gn6Hs8LvaDALifjgBD76mL45uJr+ABs1V6haVoN8/WCi0ihm3
	A5ysQZeR+KrbJNFmUXghPby6NQQ74OblknCxx6etfNhdNOgHlphTicgS+QHKMRRr3qN02d93eTG
	tkjVDTWeAvoxTBl1MHkUWj/SCPeL9G8lQy9BWdx8Y9hbKBsESK9SoHvsAvuvEeR49l77+NDgIC+
	6HyN0z87tB7ox4IsRwZeivs2MzTA5BGgKbIggoZbe8jGkuden6CiWRHpwpVS8VoHr4OoMSqXM/a
	zDG4sZgNZk3UHtukQSXq5YOpKpkrhFaL/Hey2WK2wjDQY9GZgNZqPpw/FZsHoZfGDylwKDo/4pK
	3FXiwF5eXXFXf+A==
X-Google-Smtp-Source: AGHT+IEQnUcQbXMaqk61okzrXh46x/KQ61UJQzrcCrJS6MAJvzXtug796hcDtEBAuUVns86R4gHd4w==
X-Received: by 2002:a17:906:6a23:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-acb74dda17dmr237991466b.59.1744982041377;
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:44 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add support for DisplayPort Jack events, so that user space can
configure the audio routing correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index e920b413b762c803cfcc4049f35deba828275478..aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -25,6 +25,7 @@ struct sm8250_snd_data {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
 	bool usb_offload_jack_setup;
+	struct snd_soc_jack dp_jack;
 	bool jack_setup;
 };
 
@@ -34,12 +35,17 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
-	if (cpu_dai->id == USB_RX)
-		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
-						      &data->usb_offload_jack_setup);
-	else
-		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
-	return ret;
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
+	case USB_RX:
+		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						       &data->usb_offload_jack_setup);
+	default:
+		break;
+	}
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)

-- 
2.49.0

