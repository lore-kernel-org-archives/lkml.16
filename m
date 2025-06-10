Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178E29824F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559431; cv=none; b=pRXrZHGe6cXop4rOBHfXkW4sdFGmo63371uGE5yAJG3KFvzztXdToi9QJsL7N0iUW3UPQQBpWDsq2rwcWAtLOijc8RfFW6iiM/Kyet/pXZ6qGguYT3CWIxrs2wpnjto9BYm/DiuTQa7qY9h/HlLjusWV9ZUx9p1sfCI+3tLMk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559431; c=relaxed/simple;
	bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WuYcHgtyhkLZU1OuvCLaOhxsnXYHv+1rDbjIXPOc5nxokmlXISuJ9tP2amyPzgzATT3ES2WG0UBTZ10bwRsuhXkix2h7vAVX1b4Blk4Cu42hYsxjtD8EvHZYCdWHAQdlvNuERWDhUCnqoxzLt5XkScrejc++likD01bGpeo/aCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYb1Mv8B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYb1Mv8B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2130730f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559428; x=1750164228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=mYb1Mv8BaMkADn/0vDKNBtN9qmoBxhwhYgkMsJ+w/lEbQnOeXn+DJeCroihZ8Sh+zh
         vtrE2PqrDaSMvp1zp/D/qsBMakHMF/9F9QOPyCWVuDLmT1y9B4LjO0QdSmLQ03USft89
         zf71di4a7VLfRviqV4pOVlfyQEK+GoR3+YC0jfBLMzfkxUj63D4zVea0H+HTyLUme9FT
         Jo6hFeExQdbzg2LsWpETdhXC27XVGbQHc0yWKRIzR7kpn5wUXjmpH0H3nzR5IbHAwZn8
         0jNEaeiBH1Z47O/Cu9EbuAR9PPDjIZMyF62bXFeXpybLFka+TqPCH0k6NZUq/5Tx7/9D
         +qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559428; x=1750164228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=kz26YHkfFsrXolYAHQ5K3Hw4hJ5FKpOcFRrYF0eDLjGIm4eQU/BZEITnf3rtb3z1fk
         ZkqCPpqWfbjyTAkfePkekI4BNym8XqA9uRDy2RLjAZZIXkN4n8DVnBYe9Te65WpKJJlr
         x62b7MeXCmeK+T6vwVoEK4++MBGoROYalQzJh8FBpn+nq0CfuL4L8fBYSR+c/JdhqdJG
         7xY+7THNUnDLb5BHwsW+ISW2kc8iOJ1bFdTTmYpj2LxBxSmHJQCSi0i2jH5S+Z1YWpW7
         i9lO1X3P0XRKGbi2MkPUZWZCUkuI/0eCK9zAWHxxbRKide4Gn6sB6bvvPugeAulO28Nt
         seQw==
X-Forwarded-Encrypted: i=1; AJvYcCW45f+a67itvOoJUBnbIv32g81c8sv4grGyzRkW1/aHwDN6ogvDK2mNQ69iTHmuSjNGbLHTR0HyfNEuX7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVPzoh70JR+v5t9FPRp85aMJAieGSTiiN7JejCO9xUEXfoVzL
	PxLK06bTDsTkZ7mh2SZLGmV2VVXmmTg88dkaC4oacQf0Y1dBHd8HDvxN8mLXufHYgic=
X-Gm-Gg: ASbGncvVNo29gCj1/mgeo5X80xkBah5uuRMUwt3Ov7wx9mrkpPYRu+7FWP344bfLqZK
	LOhdXb9xdguWWsYN03bqwonYL8218ByHEdeHWIAuYrWzROFyaUbcEDc9serDezG00jsCDBFUl1h
	qWnRx5X2mPvCi3TdS+R1Nf1yq1dzX/Ft7qYl/C4GIRwA7pcLIdMOGqWXKH0XFDQFh1of7FldXue
	z1yL515nMVtFGxB8HUBzyQknRYlnsaOcy6DV90wU3gZyMRjouFlLeJHZMY8W/ThPRaNaLTMLHKi
	+mp9WZnppyia6eHiM4lf2V3BcORb+V1/ZOn3KVEdbH3f+egydHkS
X-Google-Smtp-Source: AGHT+IGuWTf1KowrUQILfyGWQyY4v7aI69gh0KH5E1zC2liy1/7pGOK7wxPBkvdzhBOsu44QykkkhA==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13137620f8f.7.1749559428029;
        Tue, 10 Jun 2025 05:43:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] USB: serial: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:43:45 +0200
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEoSGgC/x3MQQqAIBAAwK/Enlso00tfiQ6lqy5EiVsRRH/PO
 s5lbhDKTAJ9dUOmk4W3taCtK7BxWgMhu2JQjTKNUR2GxJuNnFBox3ziITN+x7Sg9tppa5Uz5KE
 EKZPn68+H8XlemZ0AvmwAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiC2/OS/m48r4jFb0FUB3WKLJ2SsbwxWE21D
 btTzSpt9eSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgoggAKCRARpy6gFHHX
 cgAsD/9BtP/VITx5daGbUAukC4x8UhNf2HjiPEIG4xe701hezEsLDBpKZ1c+IzEMeJJEdguVddy
 WqX29QVn52OSN87fNbeJShmUt4OUX+uHyP641t1BU/PwyboWBgRA8UL4yuXyn0iSvoJyVofhBPg
 HLAUwFbER6s608xNbJhB2RsZSQ0n/oUECRdIKQGAEzidujU3RvLR2KjJA17ptn2sFEuVnfbkjDl
 2OgWZgvSovKzapvtDWDGFE7F8m/pzGVsVjXMV9nlMQQpg3NZaEWAkkCxLO3KQw96RyUJbajTB6p
 CR3vnh6m3EASM7zVT5pH+F77o402ADtqfHrdxk0kvyjVnDDAsBApkBvMNwDP5+MfhRLL63bgALG
 DNFIweuZaY/giBznfUr2VGAC1Qa2NLu0IL/vAHrJfMIhmqGz6agzsDddV1E7RDnoSIiq5hbamQD
 f2Vda8CceiCl3bjovl85gqs5Q3GEmhidRO4nCpo2H4EFn6N9FqHiXzjkCLR4oV6jnCfKEMqjWZj
 3ZVTRvPBQPUMYAr5BZUeHfGDQuyIA5Y3JOPc6y/q+E1E6lZKHKiUPeR0oqND8LxoGmYuEmN2kP5
 TQFpQGLzr5EAU+RmQ4wxtWRCg9LtYA0ejx9NlpYNz0RdVnjuXqoWg1mHyKzYJTCg10d4jyw9L+2
 DxXu6P2U6w0DUDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/usb/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      USB: serial: ftdi_sio: use new GPIO line value setter callbacks
      USB: serial: cp210x: use new GPIO line value setter callbacks

 drivers/usb/serial/cp210x.c   | 18 +++++++-----------
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 17 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

