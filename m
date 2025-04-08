Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319B263F2C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097793; cv=none; b=nMuD8CHfM/nGr/TatNxlIuFoqxCn8jFNCaTdHpKAeAzrawtvTjFOh9PIcsuKldBo7ZM5ZGXlMnh6cbx9XF1DwfbFzBDK2gkjmv8LsI02M8OatdLlE0/URaMRmqQxtjAI6/EgD4ryGqHUIXE/G51Pzbc2vD5PInR/9MHj48gj/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097793; c=relaxed/simple;
	bh=64XAKV03Ho+Z3jvPtLmTCQSUmsOOsN0XOZVHAEPYRRg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5RYVhNcIdt+rU/6EW+yZRJPiK2wVEe818ohbwZbQvMQbcGchBExpOinNm5yP/liRSEIW0/TxVhXc68MFqXQT4FnzYV0n66YoEjcqWr3fhI/KGK4xdGikLCCTd+PpEnp89szTGvTL6IyzmnkVuEPfJb4mJeNVUVq0HE0cdVYbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zh4Xau1v; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zh4Xau1v"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so32948675e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097791; x=1744702591; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oL2xWPiX1fT1lZ50mXB6CsRpN3IwcAkRnIEu0JOAU8=;
        b=Zh4Xau1vyUINFzr3xGR+gTs/S5+CIqdiz+UqGbJisaMVTYkSj4/SUZAfU+KuvCbfaL
         cnHWMkOQb35bPLuVwcQcJDZ5REusqsqGTHnJh3skzv/lhoMAteXuA1f2QMlQXM8xEPBU
         CoTWS6b7TAuRDLmQx71KU+8gSf4YwXFjSmZW4E4OuXFeRSi4QIipaJMAHeDxaXsTQoh4
         BpOOV1vu1BGVm488TG/1ooMil+FQf+7aOtlhVil58vp6lP5RhrhV/x3LY9AHlNiEQEYR
         ppMy9B8O4MrIsNG8IqG+vZC3WiglS63R2eZK6Ysw4MQDYA7VyGNXBiP3P79IX40zaSrn
         RWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097791; x=1744702591;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oL2xWPiX1fT1lZ50mXB6CsRpN3IwcAkRnIEu0JOAU8=;
        b=K3/ms1TIItdizWwZIEGebE7wFl9SqaAXCouTsDjexH06Zo2LxC/KxmObgf81mo//7O
         Ce10ATITBLEjc4h8r5N4I5KQzzJHNmmYYIN7u5fupENyq9u5bh4gcWzm6n2/GUeJdiBv
         YUrzP6haV5C5jXS7UAShyHwG7jkXLMxd1jaTTCiREtTL7zrsMcZtdp9jUekn8vvtElb4
         OOKdwRWTj2I4WHmv9a7mKJTEXpXDXopl2ipP7WLCLra6rOhlg11oLzVqAL96Gqu8XjV1
         80A+rgtR+/toN1ZUMwd6Pvj4vD2r8BuOQSOh13y1Ke1f5lc3UypXlOyCrD0vqI2DUSRa
         X6xA==
X-Gm-Message-State: AOJu0YzxlWbBi8hHD/r+6UTdKqZDxWg/gzFs//+ytL8QeBbzEu+1caou
	JBxpU8Le38VFWJZghjJewBpqObLCgsuPDD7FjXdaAs1ovThxiXrlNb+wKpM+zo8=
X-Gm-Gg: ASbGncv2z9iZKh58Oi4FH07A9fHSPA4WbzNbPrv0M/8NKcc8VPOEFNyYXkFSYUV9nL4
	lHx1JzUmEpwH0iqA+/hkaFy33nhtVdjwwZEqV6U1O4+BaMjeD/La+7HjsLnwQrLyGmzXJA246UH
	sATjOQG38QSEy1KKnL4NFF4mMoGr61F4aRoEurM0r2D/Z3CicI2mh8CC3VwV+2JYX/f9X7aHwyQ
	ZPGgcqOd+eLIKSIXethrI3yQOM2MmRBMimuU+bwFKV+qT9F20jHWWNPmtpX2IlnKVfLAbrZplyK
	ligib3JY7RbndvSdf0nTPRbam691Aej5Ym4MOw==
X-Google-Smtp-Source: AGHT+IHmBKd170rpPUVo2CW/2nArPovoJjIeVFGOn60+YzO4ebxQNDuHyhP93HU+yCozqPWA7zIjlw==
X-Received: by 2002:a05:600c:5105:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43f0e55e881mr16913565e9.4.1744097790668;
        Tue, 08 Apr 2025 00:36:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] regulator: rpi-panel-attiny: use new GPIO line value
 setter callbacks
Date: Tue, 08 Apr 2025 09:36:27 +0200
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvR9GcC/x3MSwqAMAwA0atI1gb6QUSvIi6qpjUgtqQqgnh3i
 8u3mHkgkzBl6KsHhC7OHPcCXVcwr24PhLwUg1GmUdZqDInjvHLCTAfKhULh3NwRBUmbqVOdb5x
 vofRJyPP9v4fxfT+h6wIGawAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64XAKV03Ho+Z3jvPtLmTCQSUmsOOsN0XOZVHAEPYRRg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH8qqweyiug7GKAUM1qPRNoABkNLfTEOUORV
 w4QNWh4jMeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/AAKCRARpy6gFHHX
 cteREAC5W8EMZzyYdurOHOFPG3ZBduq9ZGO5tH5hBIyZayyfLVwT0a6iM/koRDG6WWixwoGdztd
 wRbNhBsT3/Guh8Fl12Cv9NhaAkgZKbB9A90N7/cecuEd6KCIVXfE0vmIUduhlDmJwrpG1n0gQfE
 rRkSeSTrpiCrV+dEpfDzjgDQcY03JrQ13kHl8i15ViFToU2E8pJjeotMYFP29Oo5xtXefgQOzEc
 HbZBYPcW+7jKzGI/tlFHxG1wi64+01xPKwYGbtzys0qFbIg229psP4XNovdUqkgx9TX72+WIjXF
 y/ZD0jFMtCjbForfgapGgsxL0R9tEsUWIn8EzEuhxBYsmo9p2jJj8jQq4hpuoXT+GVNSJSyfXY2
 T5A067okZhOMKCklJCnTt4/3bbahrYaICRvo/bEKVurZpu8zXMd2t/VVVNGhZAb+1/BPfFI7Kx1
 aHsiAtpM2IPUcdAVJVU80YcAY4dvr977Rz3KcJqpYNORYJLtaahyybGadJuQ2yUc7hdqyz8ND2x
 vKTgDm3M1FtqyxY1l+M6TDu2Gl2Mn8OEXnGwVy/Tv6TZOzycBCIzLOI6S4ICL1kdK3Xr2mbhfb2
 7P8O50jyxEMlWaEnITsN0jt7gf95ImGJRayte4TKdIlqvxiqLl09uxBpFNkX3ggPjL03qIAk1QU
 YuHbxOhgFduhsWQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the only GPIO controller under drivers/regulator/ and - while at it -
refactors the code a bit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      regulator: rpi-panel-attiny: don't double-check GPIO range
      regulator: rpi-panel-attiny: use devres for mutex management
      regulator: rpi-panel-attiny: use lock guards for the state mutex
      regulator: rpi-panel-attiny: use new GPIO line value setter callbacks

 drivers/regulator/rpi-panel-attiny-regulator.c | 81 +++++++++-----------------
 1 file changed, 28 insertions(+), 53 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-regulator-e12b909f5af7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

