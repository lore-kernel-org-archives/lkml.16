Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7825F785
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097908; cv=none; b=CU3segxKtxSym8i6saarGRKnzoZOGO7WdzAWmKiVD5GVBK2jI21i5/9L/RwC+xAlOJqq8ZNwJUMqe8J7sGhLoIoi+lPEzUT9qENlV4iTJmwoequoKpQ9JG6SsBw5m3lrkSjaahRbgFlgeChp5VX6+XCc30X1k1E6bGHKCbIOzbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097908; c=relaxed/simple;
	bh=mNE1oCE34dU2yNfgNbUiOdbDZ0bLkMrkDXd4Yk0MGfk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nyZbT9gG3IJsWdAwlru1tYbzv4ludVl4XcavFepAYdFqcp5IlVl0q6xDQkzZum65m1dTpOjPA5gp4oQkZlN5Cxtrcx2qN6rZuEZWq49jxvu5Ll8hNWeLbLzYzd+1Q/wgoQHT6fBXBYO0oYNizdCP6q4O9rqR7QMK9cOR7QOFu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tDmgJ34s; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tDmgJ34s"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5679889f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097905; x=1744702705; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mblb8hn7r2HC0XN3KRUMyMtTfRZYSCKd92ueWXwbpi4=;
        b=tDmgJ34skc14H2Z4MnNxy3b0OAtQdMKfbFZOQRkJM4xJtE8udqEHsUoTtc/yW9sFL9
         XJEwU42g94bzHJrYpaKG6yWPopQt2R99eqNPo9dpCkFX4xKHAwFgsS7hCC41BLZRiGpM
         Zs94USP6Fd37pFnqq2f6dD2S7+kDyZTmWxnF1wTF4oWO4YH2uP/KOQyqsFG/tjBO+Iqa
         l1R2993bgveosFG5b0XYpJ/FRMnzZ0XlpbjE0bbgW7ct2rPJ2uhvyI20ZUdxo6FOdiq2
         HIxR3iI2FaylieZdXr6jxYGdwYPbsg2Op0p+SdqSP6gIvSESJ8N16CV2mej9YjhBVKNt
         NxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097905; x=1744702705;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mblb8hn7r2HC0XN3KRUMyMtTfRZYSCKd92ueWXwbpi4=;
        b=TP27wWhTOZ9n3b/L96q1Bplo6xOl2Wws2JlLkkpkkeMmHWvNXXQ/K8jdiBU/JAw322
         Ueo9X/nqZNjH8JSMt1QXcJeIeoLQHS4wCzE2DsUR0TF1G0w7W8zxHr6STIM5D590OrrG
         TXl/7P1gYGUZTWRzp7eVudaFx7tevAaseVYqCYtgJMmnJSwLVsaPs/bxBVVtzp3fEaUx
         G+FAc1M9NibK1qP3BU3r1OZpW/SS2wum1LnFz73A0QVpza4cFqfzBeAyKPym/SvvCdBN
         y5yNPZkqJ/VWdncXGZr7o3oBdQuv4nF0ikE4Lb+ZLRyMjQsnPA+dNHdRAAOxeJo7CxET
         thgg==
X-Forwarded-Encrypted: i=1; AJvYcCUWOmGq2Cvc/TW6mCLaRjIUvzEZvkDOI4TWG6AMtPYc6iiQqmmmCdLkcYi8q6NdllmoVBl6c9vsZt/8Xlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtm5YM411WMgy5yIhtnOswMCwtUhO++z/Haj7HiCLWrA++vfLe
	yF6CaXhtZ5JK88JCPiVxNTaqVuW2sFafHDnhd9gnRts3m3YsmltTYC87bdjkKfs=
X-Gm-Gg: ASbGncuiGvYiog06eLZ81uCfs5+PrnjfpSuT7673iIcdr+j+T8pqud1j8tMENuhP8KW
	2VD1UljoxYMIXwDCCdzoRVOuB9QBqnJz9t05Ah1Eu0SlGad8Xviskn0EMfsW05BzKOflxguE1RG
	TCWhVoT8RCYg/o+6LtjHeRmcLeRucyMqD+XsySBlMmj9h50YSMtwA9ucO6bagUn4NwPfZJd3JFA
	4QbYrLsgnvJXS2iUQmvHBnOenFBrEQc+gyE7LKYY9ruQOcbom6tvVgsq43JZm4+e04f3KPh7pKy
	h+/CfFedoeahmcavbulQmXKPx0MwTcwa3lUxSg==
X-Google-Smtp-Source: AGHT+IEhJNp93u8dx6UKCCazj33bh9DPinFOBZ8LoDBcBJFW63vSOSktVf78CH2zScpo2w7WmnYQyg==
X-Received: by 2002:adf:9c88:0:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-39d724fad57mr8449194f8f.44.1744097905477;
        Tue, 08 Apr 2025 00:38:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] ASoC: convert GPIO chips to using new value setters
Date: Tue, 08 Apr 2025 09:38:18 +0200
Message-Id: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvS9GcC/x3MTQqEMAxA4atI1hOo9QedqwwuNI2aTVuasQji3
 S0uv8V7FygnYYVvdUHiLCrBF9SfCmif/cYorhissZ1pbI9blEC7RFT+Y8qo4fAOh4ZGGhdypmu
 htDHxKuf7/U33/QA9WYJ6ZwAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mNE1oCE34dU2yNfgNbUiOdbDZ0bLkMrkDXd4Yk0MGfk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJtUAWHcxz62qhb0bl5Gz6PLBIWVVpKaZQLk
 DpF3PrwiGqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbQAKCRARpy6gFHHX
 chrlEACncn6tm1XMg9QduPGCTyLuiro7YtyPueNaDg2xfktYr/dKdQhKTdqI8Aw6a3cQRoAGAsO
 5/IoBsFKB0M+TkODTo5NpEriUo1WW9NRluHckw/wDKIRCPnxhsqxgQg53SmZPo1EcUCIzoIMLjo
 P0DnnF2XYLMRBj6IK/1ljM+8hzRV2Q9VkWNuSWupSkERNxfzcne5ouEepotEDoP6kTJ7k0sVSRu
 VFSvaMWqw1XkV6aMXTejq6/jGL9WfpYGsmsgtLU6YdqXQhZ7pnaL5Xd56n1sdvtj/Rt2j6pGx53
 3gItTiCCtUogYHpLM/4+pV1v8JMDgP/pfGpE8i3nnc8QvCyar3PxK10cIQfSYC3qb8nXF7kl7e3
 4+bdcDarrKynM4GKuCeAoFAvO7p92dxjEmK2gpuEVmPdMl2wXLr5hiejMLCKjNSrTqkqpbzh9xB
 DS4/bNxeqGCd1NOcIvIpKppDTiWbGz+a9E95ApCbzgeYsf+YaxpvfmTNhoVSWYyJOok/XZJ3x7Y
 AvOqNLoSKhzkPHHqZSazkAC9pj2DgovwOSUeb80mfoJYQSTXQt5hrkuSTjCfLIPrt8jbCSjGBy2
 53b7WsUfta9CN06kTI28lp/D43t48CIj/Jo6MQ+wohjhJSK6vzH4O+WRdx+OcwrLRUnIZQjcK1T
 fFrl16Wp62PGbPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all ASoC GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      ASoC: soc-ac97: use new GPIO line value setter callbacks
      ASoC: ti: davinci-mcasp:: use new GPIO line value setter callbacks
      ASoC: codecs: wm8962: use new GPIO line value setter callbacks
      ASoC: codecs: wm5100: use new GPIO line value setter callbacks
      ASoC: codecs: rt5677: use new GPIO line value setter callbacks
      ASoC: codecs: wm8996: use new GPIO line value setter callbacks
      ASoC: codecs: tlv320adc3xxx: use new GPIO line value setter callbacks
      ASoC: codecs: idt821034: use new GPIO line value setter callbacks
      ASoC: codecs: peb2466: use new GPIO line value setter callbacks
      ASoC: codecs: wm8903: use new GPIO line value setter callbacks
      ASoC: codecs: zl38060: use new GPIO line value setter callbacks
      ALSA: hda: cirrus_scodec_test: use new GPIO line value setter callbacks

 sound/pci/hda/cirrus_scodec_test.c |  7 ++++---
 sound/soc/codecs/idt821034.c       | 19 ++++++++++++-------
 sound/soc/codecs/peb2466.c         | 15 ++++++++++-----
 sound/soc/codecs/rt5677.c          |  7 ++++---
 sound/soc/codecs/tlv320adc3xxx.c   |  8 ++++----
 sound/soc/codecs/wm5100.c          | 10 ++++++----
 sound/soc/codecs/wm8903.c          | 12 +++++++-----
 sound/soc/codecs/wm8962.c          | 11 +++++++----
 sound/soc/codecs/wm8996.c          | 10 ++++++----
 sound/soc/codecs/zl38060.c         | 12 ++++++++----
 sound/soc/soc-ac97.c               | 15 +++++++++++----
 sound/soc/ti/davinci-mcasp.c       |  8 +++++---
 12 files changed, 84 insertions(+), 50 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-sound-83c9c9bcd054

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

