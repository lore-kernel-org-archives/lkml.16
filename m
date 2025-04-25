Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A7023908B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571670; cv=none; b=ISOzceytVRexOBHZTqx9Ii8rjDj78Lm8LJlQN+1zLSSN0aLQFq8mJ5JJqRslxkAZlGeFLfiC/vknrPoMCjX2HBWPmkVeqDGG8gDHZhlyVFX1ueAdw97/a2PimvjVXRmUq2w+UG6VFjVIQb1kEzSX8NcEPGN3bgt+VWuR7ISOfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571670; c=relaxed/simple;
	bh=gcgSAGCf9S1xTbI3gVnPSPqXssP4QvQGlqxWgMXBtSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ia/nPJtT+TrjK2JP3YghNtPe+zpOG6yXDKX5zaAYyWizGmsM8L44T5MYOBVTMjd+HN/KDFES7xoTtEaVzSvgPHpDE1KoPl1bKbnoFMHr7sBEAd2x1dRKrk8I0P4+Q+83EvfwpCAFFG9gsX9kdnn6YDJyrUWPeKpm98srtaUoU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2CeX7/fb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2CeX7/fb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so1611620f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571666; x=1746176466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=2CeX7/fb7C3C4qkMVyeR2si1V/CYu0EsmU4VB5L3s9Epvf8bzClMAXrtbCkj7ZoPXg
         6dlSO5iKC+fSoMm6r79l+/vIHrnm9bcjHrAJ0aHMTTX1VHEyaTAsho2/5O/39gNSD6l8
         rS/X+6Cm87E4tDkwl4b+UL4xI6x/tG5oEFkbSu4l5YozOyUz3A6xOf9elcqAw8QvkGNb
         kDTuRvQpn8cyOolfKn+ak1EcUDe83HjbRbmlo2VY/3FPPg02f8VtZ4gL2fgSK0IAvnGJ
         CdqsnoErdnYh8g07Iae/F/HCIrIaXqqcmAGexMGPE85CegAgpCn/HviRJREcK6J74nNe
         mzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571666; x=1746176466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=KArQTurHt/UkPrbzqGBG+KKt4n6QMkplaKqNOft6QqGZtkUI9xvG8nTwJPzfsHRiyu
         zdrLG0buOsr6gGkRiBTJ5hmY8XD29iWBSTAxrowc32l2NMUDkbp9mc8o+oXwBaLhuJ5i
         FV0J7eoM9zuTa3jSCcDvILv8TMh7W7+PpNv/05a3HEIYR9GsjAt6nmcqMsBQumBU06fV
         tcuqszseFhPOjYpI+NhE5Pd2ekXbhz5GqVX266PZ16Q4grvROQ7A9i0qKkpwmRmJ8tRC
         zgXa+d0RBch6mRUzoGntNzLDKVDRbG4oVuWwBIyEAaMRPQ7/AannjVZPtHt6fCtcJnHi
         JezQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMypS8eUZaXQjPPkUOHM6Tk2t3O+ptl8NO4wiT9DlD/pp5Co18caOefWGBUSRtgb/VBQhxSN2dL97LbZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkpDwmdPMfmz7he2BWaemHXRmlVi8+2t4/zNsyeLaii+5uTmnr
	8X7978ybw8tkWM04Z8yW7NW/rzMcXJWB2sX5GP7zJMR2ktxbonJN08Bp9js/T+U=
X-Gm-Gg: ASbGncszQhlXYayaireGKk6bvFmLBQPSyY8KnqvR8Lu9O3c83FENX6YCWmtgNWzIx7M
	hPtfONu/La6PO9cvyaqUWlij1JVSkKJDg6syJRyAJV2lJbnj4y50OeWi8gsAlgW/fWuYgWKyQIZ
	x1IqbHekSbl4vnW1eXo3fNB6FdQNPkYdy8sGd2angey7HMvqxGN4vWu3+6CdUFVBCyMeEnsJ+lf
	SmsvLqkeG9c+nlqCkB9IhYoWqWWVe09qY/pmQ+DdxjSQgjqFMh5h5W3gl6MjpB4ZrHuD1iPqf9+
	wrHzrtJgwCs7IgZ23OD9XMHi3cTc8t610RBjyd8Ht/XQ
X-Google-Smtp-Source: AGHT+IH3OnIubuFCBwHvzDU6+k3f9N9mzQaSt1HB4QUYIlDhLHCrYidDLJkaQB3hjNSR8q+IxbksRA==
X-Received: by 2002:a05:6000:402c:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a074f42e7amr1207472f8f.48.1745571665602;
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
Date: Fri, 25 Apr 2025 11:00:56 +0200
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhPC2gC/x3NwQqDMAyA4VeRnA2YTnH4KuKhNFHDtlrSIgPx3
 Vd2/C7/f0EWU8kwNReYnJr1iBXUNhB2HzdB5WpwnRu63g24JT3CrgmzFLQTk8ZQ7I0fYfVFXkj
 Mzwf5nmkkqJlksur3v5iX+/4BviB2NHIAAAA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gcgSAGCf9S1xTbI3gVnPSPqXssP4QvQGlqxWgMXBtSY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09LShA4FFFs7FxYzWMo/1MzGZYVAv/t/XsCr
 XI6PnVu6PeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPSwAKCRARpy6gFHHX
 ci3cD/9iJ/xVDYLFM7DCh189mq6iSH435TREA5mvwF1xWjo5k+b1ttZTjFnkyQHXyQCVmygSLBq
 Z9xZ3BHypbpwD8ykxvnDZ2IOP5QkvXArTwYU7SsqEAOzsLQ1woH8qCK06dOj0fXfjuBxyjY0PGw
 w2iSbbza3dIiabeuu7ed8uAJmgBuf+qrUQon1gGImTXwyYRKJSIfMZ8GwIhD5sdVbj7IF+NqVv8
 DzQMC2pOQ8/uyaoz7DDypiT8QZ4VqNyIS0YCU0qAFOsud0U3LesVVNIr7x6SViXRDaeAvF5C0vN
 xK3cd28bek61r1sYczNp5XAWFZZbZE1JanSfO/Ra1m3UFNWhxrbsPuccrAvlUHcBd+fhP6AwVwz
 7ODzLYWquoOtJDLDMeGfZTaNmenKqsQZKEfw+5aryPpWSCrESUbP9AnejrJ2gpDGpdXaya6s84i
 YLIEB+KusN8gNbzPOy5+x2MF40OlbYfdA2479FscfDcvG3OIpn0AQox+enlI+1jVX1kX996qELm
 3kpMjMSqIMO5RaCKGxkyiWzmkBocfOG6W6iGco1FeARqFlZB7dOn8TNzQT/X2tlgOz91ag6PvPD
 3qfrDaI1aDWXGHlQWAT66D2q+8ZxvUHrB/4Qk0w/B/D7JwV+XE6BYhnDA9bR34WHbb9R7fzDspS
 GBnZdlnyiNYYxjg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the mediatek pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: mediatek: airoha: use new GPIO line value setter callbacks
      pinctrl: mediatek: paris: don't double-check the GPIO number
      pinctrl: mediatek: paris: use new GPIO line value setter callbacks
      pinctrl: mediatek: moore: use new GPIO line value setter callbacks
      pinctrl: mediatek: common: use new GPIO line value setter callbacks

 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 19 ++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 18 +++++++++--------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++----
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 29 +++++++--------------------
 4 files changed, 34 insertions(+), 45 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-gpiochip-set-rv-pinctrl-mediatek-1dd831a4d171

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

