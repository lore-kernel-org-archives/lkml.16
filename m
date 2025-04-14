Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC128B4F1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652523; cv=none; b=Umegwmcy27jl6ohxZFaaHFBC/nyvpmo+sSOjv74g2NkBsTMhV78p6qmVRRPI7yRqlv3pTZj400wPHfMcuUddhYJeIleLm76x3+NSGADELrbNx/HFqkTA4owyzc+m06U3un4AtfuJ+uEpg5GZqh2geUdaaSzmR43L1Qr/Pm/ZkCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652523; c=relaxed/simple;
	bh=4JpnGmP3Hhgrh73p6ayQO38z3PWEVbCm8A1DvNQjRrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VAaCreccnE69m2Dmlist+PdoQygrPdD3V+m6JIvLxep+bSmrmIBNNnAMjGrx+q+/cE9FRAxxDPI2mRNNPpitUlcQMGCgQ53IXqbNEwAmenRtoUUHJBvUhkGgGJpcbcdS7bm4CDPOr+QUPXUoW3/xOhxSMm66L9RbV1KWhWLLNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=A/tH3uC1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A/tH3uC1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so47670485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744652519; x=1745257319; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=A/tH3uC1N+kXcq52+ER2tlawznLpRljXybvNtlkuuwtqfBao3j2dQ1RdXXXsOX45w7
         1SK/Tm0hGQFWl2+biE6yiT1h0YfWMKwHewHZ/HBKgvG1w5/LF1FauRta62x699oipzpy
         Sfd4AGV0vFshTA009+7kPWicdOFTp4JNiDnsdGr9ZdIJ8wldSw75rRIVgrpGW64NsdnI
         TvAmVeH52l2Qk4d/MCPZ0Mb4LMEcLg8G7P7bepflJwnnSMUh9znFvfNf8HUdnkb043h2
         MwD0Dnaub62fXKgpoIuP9yibYeyslQSuQ6fYuwlTvP4//UgZI9HqZPPyXyjQIqylht5s
         c6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652519; x=1745257319;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=axLEfRbKXoKc6NXEa6EawKqdM8IiBhInxfvOhJ/kA38PrxO2j8iFjcP0+3kftpDmNC
         nEjcas1NphkfOlFfe4T5AutAbZKr9aHBIAdsqF4c+6AVGj07FIkv2wnOGPZGOQzJj+tY
         +D5IEvRgCzYNHkT67ObSEBI5W2eUpI/xpeyRGaDNDfbKYK/wFhggburYIBN8yblxphR/
         H4lJ6f6afP67GFA3jerOuuyMeN9Cu/EPrT+2P21sW1x7LQQaCj32tEAA2p9e6EVYPzsK
         o4YHL2dOsv7OO5AEhWt/lTttYuyV7wfLBU5uAi+UDpqyMX6xgaB7+0Zn0Gc9ssUvp1wz
         lYAw==
X-Forwarded-Encrypted: i=1; AJvYcCXUTx9nGlnfRvj8lUZgbqIlJlv4tjXEgyTQbLBvrNZO4XWlWoMRw099dkurUnnUUL++0krvIsEg5gJjcEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8x0sxIV9YglZy+llQ6RPzvjXcaZn2SKIll9O8/NqtDex8JZ5
	8zMQDHIweWVy1C44qtHMQ670sfco4McgyKEwqtEAuXqCq0Or2ckmA6WBuIE70Mk=
X-Gm-Gg: ASbGncuEIRSv92A8sgXIpL2HZaYOXHI2qG9IU2HfenrI4SlMW9g3NzL4AyKxDA3Lk2Y
	qHR35x0GBcE2dctFRMLG+0X9qL7pDsAMB+qDA3wUsm2aevkjoFm7CcZs8X1zdvcGlfvepsPnON0
	Hjbz0k/6g/eqpM/2gUjc0Ylhv86R8OeGC7ssR7gq9va4tvellEKNL5ayBm2MclI2ncsNXLq56J4
	+E2iQ6B2j9jVcCAkeOTRP/xwCjKWOAbYDidmYWkh44N1KidmsiLrLk3J2nr6Ye5URlcv36ykeq+
	NtXh/QPBVGlRFsXXJvj2RNUD9BuW6fBbxU8fCLTj7/U=
X-Google-Smtp-Source: AGHT+IGLnXM1BCPUabzkGT8/AC2HrOP60k3F3Sd19EtJp1J2kT6z69sfo+nXbu/QtW8zZo8TdUB2dw==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43f3a9beb77mr127249525e9.27.1744652518940;
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm182367365e9.38.2025.04.14.10.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Apr 2025 18:41:47 +0100
Subject: [PATCH] staging: bcm2835-camera: Initialise dev in v4l2_dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIANpI/WcC/x2MQQqAIBAAvxJ7bsHWguor0SF1s4Wy0Igg+nvSc
 QZmHkgchRP0xQORL0myhwxVWYBdpuAZxWUGUtSoulKYzslL8GjsRq1u8KpXwlluNK0zrtPakja
 Q8yNy1v96GN/3A893aqlqAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
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
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
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

