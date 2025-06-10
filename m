Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06B28DF32
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558950; cv=none; b=A8wE+kF1NAzBW3kHhzc9TAYAKsmG85ERCnJKgukiGFrCeM6mmLHQvxIachAxk4vaDHxNu3anLJGrxsy3OK9XLDTNmvkvIf8cInf62cvT5pXNX6+mG8RXnaHeEQ87oKRF/MjQgkeKNWeqa43iaNcKBYnBDfvffFL5L9Ipk7XTQeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558950; c=relaxed/simple;
	bh=XaC8k08wKuFc5cu7hL0wG4+KmvUx78eFAt9+qSWr15M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jdXqgpf2I4RHO345Bd/rxSq7C7resAKiqF1pj/cQQU/jHJB5TfyrMavhpayLTmZnYZo5l0d0Rd7A5nkOFbtQ3fMio7yDMtO14zQ7j9spNX9Xt/5EooXT2Tf4CIGWaygXepxFTO4cRrR5RaH5zYez0TSQJEpf/vlVPy+OEzU4lmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rt14wuuV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rt14wuuV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2079167f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558946; x=1750163746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoV+QiSos0TvqbtzN622Wepav+RyMGf3Ca7AzlVUBmE=;
        b=Rt14wuuVOx7KzZkG89HmdSDGVg46PIRSFbAZfQ0vwxlF6R4aQJauzEZK1mPupGGffS
         YjibrrHUOePpBkrYwJakojAyE9QAZ7iQZPqq16IydBy9V2T9BuzrNz+VnF8/EAghyqEH
         Jhi1gEqhoC4UaKubOksw0jNY7ubZoEZJ0/8F+Ip3akW4Nvgwx+xq4tUzbEtosTuV7GwY
         FfbxS7u5Xx5ONqY+QpNP6ZsfZa37rXYoelkGmS4VbNYPD+4048V/D3Pcycuk3bEx1Rw0
         05q60xNT3L/BdHmrDW+fsWbyPVms06fcBZzU+HIHlpd1QYSDtiEKP4qPVVUuHacZucNp
         zhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558946; x=1750163746;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoV+QiSos0TvqbtzN622Wepav+RyMGf3Ca7AzlVUBmE=;
        b=FsaPInp4KL9ZvE4L0PcD71VL822b0/euiVGM51I5VPsb++SE+tPg2yyktgKW1TxAW2
         TDRMfEVJ8mKd3q02+ko6FWXLsgK7fEWV4E2OI4tbzkmnnq0uKUs3z8DI9sOKucOOcgAi
         bnGjF/k/sDFS7x0Jc/1OJDpvxYvs7XQzgjwyZ8RvwYiv9mjBOl7czupCc0qYxcMtmgv9
         gwWvCQntEqX6NK3c91cOWXSwNpVDt2+fDdBoEnSEiMiajwdB8AHWiK97M3KA+xI2SF+K
         RrgZO8y2jtpC8JgtabOJqrpkjUTMkOvjnaIP29qs7BUboxx1BqdNrNF/goUZ2PNChNIS
         cC2A==
X-Forwarded-Encrypted: i=1; AJvYcCWWabwbFSMOv4fVcuVoN4J6eI0KiP5f7atUrKpSfSVRra+gLaubcDU3/WqbPza8/QdxK7IURGVAfowotsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Q1SpyqA4I117hpYq7tybXEE1Gw+fs4PECdzZk2wrKqBXdew6
	OSG/S79iVnlcHFiOQRn7rfmcfp67jYVaiHtTBKLikH2q4f5EVsplsyOMnOQ1fUb1quk=
X-Gm-Gg: ASbGncvhX5fn2744XkWJmXk/j3kJ6wnIiR2NHFsEMzmhzaxRtrUBqXH9wTNQWqUvW3M
	U8xUP4bs1N9I6xIbZuf1GtF5GD8IicjzSParUy/9srcmqBJwKKex9aRiXLUxpAy1gfKUnNS7gIl
	8Z02HBXw32EzuvTphpQQ/jIwd6c4kV7wLr+g/h/MOCPcQwpUjoTib4c2KtuEuF4qMrL7jy6+HTG
	4KXF49xvKgUjCrx1d2qduC+iJ6CfjRH3VtwJ7rHxv/f+f6Ey58jdsl67wA5RLT2Pe5ag6WLFwzJ
	sJiCK00umR2Hxx7+gUtGVkwpjwdDiLmg0cNcj1kU0pzmRvse6uWkew==
X-Google-Smtp-Source: AGHT+IHyzowAa0FHq/zfDL+blwKiEmXcXgh3Jrov3Hpokl1FWHbRPFr2MHWcU4cplAuWB++u3cF7fA==
X-Received: by 2002:a05:6000:40df:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a55226cffbmr2048191f8f.2.1749558945951;
        Tue, 10 Jun 2025 05:35:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/7] media: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:35:34 +0200
Message-Id: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcmSGgC/x3MQQqAIBBA0avErBtQw6iuEi0kR51FJhoRhHdPW
 r7F/y8UykwFlu6FTDcXPmOD7DvYg4mekG0zKKG00EqhT3zugRMWujDfeJBlgzRIYfQsp2F00Nq
 UyfHzf9et1g88ALqgZwAAAA==
X-Change-ID: 20250522-gpiochip-set-rv-media-e310a591836f
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XaC8k08wKuFc5cu7hL0wG4+KmvUx78eFAt9+qSWr15M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCacaLCWCUkE3ZTdI5lxLU+QwSnfr/b+UlY2V
 oDGQ5GGWrGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnAAKCRARpy6gFHHX
 cjKcD/9avb5mQZSOcedwlswOS5ItaCs+WD2JFekxWWMdY4rW8ZZCT9Lv2Kbnn9qfggVZLlNLfPT
 SzZKVLPnobqL3E4luG+W6PZSRfv2CoIvDS3AAr9GaqGfEbnRfb6MoQKPnb2OsSzumEXY2eVut8V
 qv6rOPTt5l04Hxftw5/A9dGLhIxekPEBJGi+VUPAYhs1QDetTJdlsIPE04ND1FRFitkfWZIpdQM
 chWdabY6Qw7HA0SC3Czm+LsU812bnFckizTkI4LmRIO282AtSZ+DK+GicsVMStOClqXp3BgF2pe
 ijEZE+rDJpAPjSYOnaXUW32vbieN4ldfU4izh615CqETJqgsFMET4S5McHNMq+O01UaIjTO1rfl
 1iOuoxdjZzxb7eNoxc1HWI/uBEIMRI/P4HlNNH/+sZ4UTpVFfC8sW9wFKhuYcObKx+RP5ihYoT6
 vLcacCKgucrMvbStackXeQN23qVhPzsINeKmCBjoPTEEo4WpRMB4c5nFVYb7TryhJBDwxhfe8cv
 y0IB++XSmC0e/JRYMAm6hHUUuH9uxdYsT4eyAXXJ4TJ4xxwUvUDKtGoDLZqgxn0Nkvl83wataRI
 J6WFMXcfXJuj1KTruof42g9huZls85Wcuqp7iL2PtE6K74GFv94uOEfsPc2pQYGAmukFs+1vwC/
 k86DhjG9pRx94sA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/media/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      media: dvb-frontends/cxd2820r: use new GPIO line value setter callbacks
      media: solo6x10: remove unneeded GPIO direction setters
      media: solo6x10: use new GPIO line value setter callbacks
      media: i2c: ds90ub953: use new GPIO line value setter callbacks
      media: i2c: ds90ub913: use new GPIO line value setter callbacks
      media: i2c: max96717: use new GPIO line value setter callbacks
      media: i2c: max9286: use new GPIO line value setter callbacks

 drivers/media/dvb-frontends/cxd2820r_core.c |  6 +++---
 drivers/media/i2c/ds90ub913.c               |  6 +++---
 drivers/media/i2c/ds90ub953.c               | 11 +++++------
 drivers/media/i2c/max9286.c                 |  8 ++++----
 drivers/media/i2c/max96717.c                | 10 +++++-----
 drivers/media/pci/solo6x10/solo6x10-gpio.c  | 20 ++++----------------
 6 files changed, 24 insertions(+), 37 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-gpiochip-set-rv-media-e310a591836f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

