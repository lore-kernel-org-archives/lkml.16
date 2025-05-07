Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985D224B0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604930; cv=none; b=TeG2S+LxvJ+/A5hyLXZNoEs0dbzvASzMv0ZUSLQUdBreUZdLsqClm53FWoU3wZTR4Yid3GqQ/MrDaI3crFs9xqTFkD5tQgpassgdTz3qUyeC+A9VcKp3gtuM0efREgl6a/rgXuqFV0d2gnULJDy89AnAzdCJJ/c8sn0/qFK1FkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604930; c=relaxed/simple;
	bh=dtOaJQoNaf+2+Orucnur3ieXlStFPrTYojY1S++i2ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtKpNnsfjfbqz6ztXv2DjnE8SwFgS+H5bgorEoxAy62dJa2yjsmBagmJivwn/PEyBA6FLeKL0i+3nMLZmIq1FkPPoAvbzqHNxIpFEBgeObzT9t7aW8ZdqNq11/Pn4jim00e4JC/25z9DsJJfHUxFN+KQCJcE4W/4U9mJ3VQRaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KIEYl/vv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KIEYl/vv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso10112298a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604926; x=1747209726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=KIEYl/vvjsTAvME2DGC9v5Hze68RxQkz8z3j6ec1I9XntyH0PXvECNa+0nB8YPAuIT
         gNu9vXwTxE3NFxIBSzbhZa9USFl3F1xcKgCKTB6NPgeL1d38i/adgD2OssDWl7HaAXMF
         33L+396jIYeQF0kGlsRIHeC+5rnc/Dwtj+XN9t/kkwOM3vMi1r2KRQBw2Nx3n5XLhpIT
         Cb0pJfyzmwwV6IA1uu55rE1TynCxHdWLKJXRXefEF7j584Bod804rmPnUuprJu4gkfP/
         rN3HKcs3ITnQBd5abTkDNf31MuXF4wd3QQDZOXRyMMTBXUaq3QGz+1pd93D/AdDd6tyW
         uH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604926; x=1747209726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymrf5p3qgNDjGKRM25KEk8X6NW8oIyoL8sa280xKMjs=;
        b=a5UtSlfnzNeIzwl9FLZTmebad2Y+8mtvDuTPbh9sTtzHW7iDzRbxeGG1xcaibmw5ET
         wr8RjmMlnqtcy/qt8PYHw4AWqtpKKysqGunlQd67Hbag7RTOOEeGi1WYMcUOWIweVh3i
         IYFze00WS9UGp9Ox2Hz4fx+bVDWAnl03Z/LE40Ya1nNEK2Kau426h8yy9rk/oBtvQ0Ib
         Rdmb/6HkVFMTD9dFfBMM9Fe2zu1K5NeKwu+iM0hbNjbjt/sYkdOKla/HY8y4GN3Tcdtu
         9Da2lkl5GAA9mtE/RqD1jKtGjbUV4N2p4Gp/Dj3E4sau5gToyVaQ4ozbJ2Y6Ra5DFeWL
         vOqw==
X-Forwarded-Encrypted: i=1; AJvYcCUqW96sBJmq+SAOeOh+3a8RYhvRyi6blkmA9FvXd3EnJMZfl0l63Fud0gS/9+iHorZ6Er9kbip8eWPUFNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GNBPYChzv1KjrMSD/6kYm286ruRIARkWm/7JDfWQ4HD8RobK
	GzT55BXzkNO9BfvbUV0PNiiVwAHN3DgjNKMTGkBTyOg+kcXH4iLKo8EmePXiKa4=
X-Gm-Gg: ASbGncvDz5F+0MbYTSQ81S2wc3K0gjBdUn0cZ8sRcZZZX/OV3VUrUaMbSBmRl3IK/E3
	SRYMRi1uB5jql6V2SZD0qTo427OBvS+W8RsRk3X+kIcNuz/d+m6b5VTDmfNA63NWHQDwjGrXHgE
	a8RhK0e3c2j8wMCWksPlLLSnwrW2wEjQN5aml+ZW7ugAcmGl8wBBnZii+G7Fj32r6362PwS6+EN
	WgAgioAvYXzdX+ARcAHRfgnWk+yyutMlTqNBOG9skkzyHapzYL5tyLK1XRESjKUTv8QKteBoafK
	hpizNWU5GhQ3L2evaqb1DGruj47yPZx59aW8I+Bf9ysphsWqhSvS2Mephh7x/IeZxMRc5sn8rAf
	mhIpK36C4sN3NYA==
X-Google-Smtp-Source: AGHT+IGAPyH7HbVPqCuUPV9BaAjaKKOy0NfeuaFEjKeL5N0COS2GXXpBkjPupozhJr/p6eoyikdoYQ==
X-Received: by 2002:a17:906:730d:b0:acb:b9ab:6d6f with SMTP id a640c23a62f3a-ad1e8e3556amr228314466b.38.1746604926286;
        Wed, 07 May 2025 01:02:06 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:38 +0200
Subject: [PATCH v4 2/5] ASoC: qcom: sm8250: set card driver name from match
 data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-2-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
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
name. The QRB4210 RB2 gets its name set to "sm4250" as requested by
Srinivas Kandagatla, and since no (known) UCM has been written yet this
should not break anything.

Also while we're already touching these lines, sort the compatibles
alphabetically.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b70b2a5031dfbf69024666f8a1049c263efcde0a..f0d83a843765d8dcdd51569e7cbc95eb72292497 100644
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
+	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
+	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
 

-- 
2.49.0

