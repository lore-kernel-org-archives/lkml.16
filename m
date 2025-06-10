Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42E2BE7BB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559083; cv=none; b=TpOxeMnKdZEBUpefQxAeTVjC5l2zAElzCvvToMvWBJQXHE3sBo7cVnrlF6O2ereIFKPI5/GiHQ1INECek9FvhWfRkBA73fu1TBNnhwE4rAT2QDyFwn+deCs9anJrME5pjP/fqv+Ojm5qVl6QYc3sOsfhgTXMXNgyJ6X+YBdM5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559083; c=relaxed/simple;
	bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZZWRk/o/B6GqTdWAsfSrghhqBcZCYx/NSAe57SWW3/Dnh+Tnf8lQVx15/rBdgtlCEsBxxKmdHSV3YUfctd1copmDO7E7kjlipDUkDEb5Y1m37wluel24cD6oCbgSPG3mNI5hi0z5MIJXCl30m+NxVgcHU+HFUg3/ywHU/1NrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xenBnU60; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xenBnU60"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so65835005e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559080; x=1750163880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=xenBnU60b9gQp90ap5DPzJhLcijnnQdsXm2JClJGNt/V4YeFS0PUSSsnpA1dXjpvrN
         Gk3QlCfAEqP7ISc0YuVfRDOVMuy4fgnsMCUnZue4agx1vFIag8r2QopEKQFtyX+G46YP
         CWCsfMIgFTAtbArmZTB1LsHOzshRzJGODf2IJpQ6195g7cniMhWaqJ1c6c30hd1Gxu/I
         62S43YH15Jaeq7wvWlMWIyh3wiLTWBfcp38S4GnJKId40yrZbFY1rUDKZrUlUn1LbaWI
         +GGPjn1QryGSU5hBbzZ6Flj+9DlycDJpw1ngOCnG9lp4uWEh7BmgqAusugVqNAlX7uj4
         EFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559080; x=1750163880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=QQ5V04S7iSjAvMJUqSEqHyL1CIKsd9fLXytMPTiArPnqRxAy2dc1V5VP9RWmkRl5Dg
         76uKIJY35C6Ir7furL4ThPU+YcCtHAn8CLWrD9nMtk0r175cXt+1+uCKGmqmxNsPbayk
         cz4ejL5mjwtk6vkffSb9SEFFT0WaxyIy+jz0z4ZZwI9wIyiiRs/fGmmtR6TsREHgV1MK
         zC5t8L8ydl7YVmZ+dIjPW0t0xZ+WftCHtPLOczaL0fiPngty+Hq84pGmVRFkxyvnshiA
         PWjTs041v6VYDrLVIU56v0JlCxhyRDlciNrw7iWBFYSCklQbcUUYDnHoopVCmEjvDmZD
         lThA==
X-Forwarded-Encrypted: i=1; AJvYcCXGNK833GRTVG0LIrs2cukE+lUHkMP4FWiWgxZRz6Cq+scQAKOb06RBLhZlGspUlY6U0Kzpo5NPMsUEG9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW8f1mt+8Zi6RGIDjWfwXwjEVAjJeUMtJ1ZpvRIWt0vcGFZshS
	ogLScLk5nwUuYOzqw6ksDphWhWdCh3Qlxs7wuRQfgjDgRTemKV9HT0DlWccgyrmfwvM=
X-Gm-Gg: ASbGnct1BRogQdxxQh7pNqW3octaj/sfs1p3/AARkoaHjRA2sdsoxJVQSM46Y+Hzkgb
	ECrAv4r66Q9v8amXswHrU7uIyvd/KmyaUV48pEYlm83T+YBuPV1oxeREmfjucujfOt1fzWpu1FF
	kUEjYJOSMjdHFgQxuNCho/3pcJsPtiMih6KkhNRZZ5iDikP34FaDdPt7h2in7KfppS+5BqGktUn
	ZMoYj93UpzBWOVwvyop9t6qHcmb/beIAwd4+mHUEx3eL1eYnlu9wlV+LTVN9vgSpT7tOXLWOMbL
	8le53uzP5EUwkN9RIi9dfCoS/YBjhIFbemCpRgnmbbbPUX7zNSBHbxlH40GQ10y/
X-Google-Smtp-Source: AGHT+IGsSDaRB1hqZwU1/G5MCu4Szr+Exf9GnhrFkMwxOumN0QR4RfbCMoZmzXDX0IpoSo9pzctkjw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a531ce677bmr13926248f8f.48.1749559080359;
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] net: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:37:56 +0200
Message-Id: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQnSGgC/x2MMQqAMAwAv1IyG9CgFP2KOGiNbZZaUimC+HeL0
 3HD3QOZVTjDZB5QLpLljFW6xoALa/SMslcHamloB7Lok5wuSMLMF2rBWDGy3cZu7emwDmqZlA+
 5/+u8vO8HXLWAMGUAAAA=
X-Change-ID: 20250527-gpiochip-set-rv-net-9e7b91a42f7c
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm+33A95fkBlAJxBo1vos+qspK8wslT2V1V
 Wh30tXt2cyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cuYrD/44rRjrB6mmO6/fNfGeJctkPA103u6ffSW8zmiUHtgIJ5B1V5Qasz+jhTr2tg3lUTCnbYe
 w34O88SipckwpEJoWpdvuB2hboyNKzPQQS1WPa2E39MYGaJw7fYPsbvFVVrtxBCZ7RzWFExW3MQ
 3TOsO1fEzH+UzzX4LwNR5DYvCTbc5uo6WA/tYEj2Cf5UdkI3ukiMfJB3cxEaZgW1Xhv0oVIOX0C
 NpnbvH/9zY+5TwvO/xjSNoOdxotzl2H05KRpJ5Aa5WaeU68D/TlijfF/9pB3tsq0N0SK4uPITOk
 1nvjFoAGwO9zoPERN3DQ+sB0Tp5RHQXfrfpo11vUn9qqGhDExZAen6z8FlYixLirLMdzj+UvWxj
 XBKO0O1hoZfuK4ZHjVYa5tdLT5ofLoIoKxVQd3n3UENerD2HXefvq4tvwtxQ4+MVk9r0Vwd8BZL
 dweZ0tHZ/7Ntl8kGYNe7A7JtI42JgVzJXVV/t3fa7pzQBU+ulPgswxTSNIeYXYxETT7g4cYWjK7
 25FpJqsQrKFCE9mZbAaj+kQt6QKR7ceIUa3pe0x5mnErUjbysE7QUJcphFy2dh4QZ+YpI328z8P
 Z8jaeoUcMeTqO8wIjnMJV4NBzsCznTgTgvtZ5EFwA8JfF2IN/tWFT0I8wKy1PwzioUBgGqzP1R3
 QGBdUz7g9snOoDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 16 ++++++++++------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 drivers/net/phy/qcom/qca807x.c         | 10 ++++------
 4 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

