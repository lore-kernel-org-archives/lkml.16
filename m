Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283102701A7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405244; cv=none; b=nPC009gcbU9A11LwWpvHb1pZs1KiAjn3gdaoTGkozNrf8huMhSfYkt+zJLc0CxodvZDjZUm8HWOTTNx3iF628ytDEC7lbA4zwHRfJlyv9X/s0JczoKoHZlDaN/5N1oARskxN8aO7W2CyJ0eJcrjBiNmlEcMiwP57ywZDRbyp7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405244; c=relaxed/simple;
	bh=UU9YoAHKOkXYDXJAShmuDPdc1qbY8RZWY4PpxLmQsaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dAouqawTf5fUcP/iTS8w3/VGEscFDoLUEW/KNXR9TAM7uSlKb9TgSDe0tfvIuUAchDpCAqrnjydJ/MxXdvzR5aLaU7iEIscbPbp/+gMbbFTT2yETJiF1utnDssncL8nN5FOp+XuJGIV7AkunbX51rD5vBAsAf6wMmrVJ6Yu02ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ibM4+fvo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ibM4+fvo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so6261508f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745405239; x=1746010039; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=ibM4+fvoC/i1nZm6QjOLYEBcEtNY4VRglgE1h9FtCfApED6ztndjIFTTsaUJVbYMHP
         OiTGl9IvNvI08ZjkU+mbfgE/DaLyykjEqJEhSety9WnAM1/ZpvmWl7HhKVp4gwICAeYX
         CDleHED2ciEYCw6j3RsTTXemJULWU4cjZWWMEbKFmjFi48VXhZYWhaffvNgg8GSpKzGa
         +csGPJz5tqp0jJ9yWsA04Nee/aP52jd+btsdtZ6wRDzgUiBp5ZiE3elcSEbzT1/zqNkj
         wPMHqyyMmdRqQlxe+XopSsRkBaXoZek2ju9py5UI265vVOoRhjNgl6+pyAk0a71UQjX6
         /Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405239; x=1746010039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMrbMlTagXkTnenmyJmmNlOF+FvuaE9CmrOSpWPOLlw=;
        b=b6FXviTUwAWGouRkdDCWgUHYrjCcWjZJarvUFr9zi6UtOoVZPO2zl0pryh04yTPGyL
         uPXguvFHa9Y165KI0xAzyt307lSX25z+JB3RuNhmXjnMFYyO7LXrjOw5kyLuSN8j6mp1
         49GNsVHcPUPXiXMkgNgRzYSV8rvK+vczs2Va98gZMSPTBtwe+JbIuZexpTzZ8hy+5IGp
         PAzyMTdIkplJZ9CB+X5DzBK/9XK1tMoSYS1sjQH4HpmhvswAHSO2KVZ9XskXKljwzeDb
         nd0yuj5iuEKWl4To7/AIDSoJi8NoLw3WrjbUXq6uVexPnvJsK15dmTG6Aglpa70bkY1F
         oOVA==
X-Forwarded-Encrypted: i=1; AJvYcCXrrVTS11cxMDzRyUTT+6TC9NMgDkdGXnmdKElCjBzq0T4yvR0cpxKR+LBzgP83hf6nL6n47fe4CTcs4KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUewVnTzuWYWjGZgjTn9NFv1kJuj+PDLkQ9DNzAiAuq2XUtNwM
	OvYLGsOww+mdPKobQEQNVue5C3egIkKK/tuer/cipyziuei/64dvcIaSglJBmbs=
X-Gm-Gg: ASbGnct+elgZT4vSFztT/UZANiX35pL0RxByFrwWHse5JX0ypswUefu1sMSMmSL87We
	ldDY3vlzoQRVeedMYDeSJlL1xw4PZrutX8qpC6nnVDv57TLmbPxIENjjXi6wa1x4A9eNATvT3tx
	4MRIGCpBv19dpt0He7zosZArpy7CD9gKYZRV2mypUs8XWSfboCmmigOcvrx+Am7h/IdgZc4SKGo
	8R43/+62eRX4vui4EFooW71duWCY22gyaXImv7qVZTzwsm3gPjN9T7Tpcw2LP8PE/yQy/xvLF11
	sCPQi3jubeascx6m0Krh/JGtZSKtA3j129/NxpAncSM=
X-Google-Smtp-Source: AGHT+IHzSNJo3Tq0+q1KtrvricG5SZh6DtKPLrPA5t2OxS4b3WEMt4hP3LFMNMdr80qgkwfOW+ZF3g==
X-Received: by 2002:a05:6000:4308:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39efba5e837mr14942355f8f.28.1745405239415;
        Wed, 23 Apr 2025 03:47:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d2f514sm21242895e9.24.2025.04.23.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:47:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 11:47:15 +0100
Subject: [PATCH v2] staging: bcm2835-camera: Initialise dev in v4l2_dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-staging-bcm2835-v4l2-fix-v2-1-3227f0ba4700@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIADLFCGgC/3WNSwqDQBAFrxJ6nQ5Oj4JmlXsEF/NTG+KHHhki4
 t0zEbLMsgpevR1iEA4R7pcdJCSOPE8Z6HoBN5ipD8g+M1BBVVGqAuNqep56tG6kWleYyhdhx2+
 0tbe+0dqRtpDni4Ssz/SzzTxwXGfZzqekvvYXLf9Hk0KFZMnbxtQdNfohJi42iGwL39w8Qnscx
 wclnBYlxgAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
a NULL pointer dereference.

Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
could be passed into v4l2_device_register to set it, however that also
has other effects that would need additional changes.

Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
---
Changes in v2:
- cc stable
- Add Stefan's R-b
- Link to v1: https://lore.kernel.org/r/20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index b839b50ac26a..fa7ea4ca4c36 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1900,6 +1900,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
 				__func__, ret);
 			goto free_dev;
 		}
+		dev->v4l2_dev.dev = &device->dev;
 
 		/* setup v4l controls */
 		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-staging-bcm2835-v4l2-fix-b8dbd933c23b

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

