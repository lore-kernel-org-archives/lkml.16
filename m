Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC91DA62E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566314; cv=none; b=NDU/W1oVzDUjvAoKvi65rI4TWwl+3DeegoRGxu/J/KmWqNHMHGO+CMZFTr8gGxMONwDu3gVrJrp8Jz0zgexqavrGOR6z1lxL79tVCHun+T/J83zBOshqwQMl6lVm0O8KzI3H3JphgrbN+/TCb2uuh42LghRqZ3CL2W8slD45URc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566314; c=relaxed/simple;
	bh=r9K+DvpICcJ4ZuUsbWlhbJUgVdpRNGn9i2eo8rHrwoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGwoHLlxJdNfCIWN7tqU3E277udlQt5mfYwfnJFd2OruQbPRvlAu4kz4Anpv917OrVrXesjfAvgi9/OusysLYa93dWIpVPZ/qy2SLZlcCD4Zy9OmaUhb7A7cXkDNX5LCPl/yHrPhsGxRXxUXDAHrETfS8/3nvmx68J0Ue2IpbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VKbTzDWS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VKbTzDWS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3757485f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566311; x=1750171111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHQOcKZ4A6xyy0RM96i7C2PXvKO3nwwvUylDj/GnkE4=;
        b=VKbTzDWSOUtL5P+b3LIswuySfLIhfHbuCgotEwjpky3Wos7ydpnteaaTxkz0VQOAQA
         HoJm1WTWG+F4vLvNpIsXuw77kQYoNLuWXhbI+Soc2d6jBE/JzZCCgB2jWOeesHC8zV3O
         zaXwSWQbvP+RwkWbd8fwhlo6ajawG4ziH5cG2A/yHarSHNYXASD+v8eVYGq/bUKzMbb9
         gf+ls0W6Xf6TDQQkCozncr3Zn9CE2WnriGncAGA4IemGu6jwrGsZGkXNuYgSxpgfxXY2
         Xlxe5mOwXBvVE0bbGvjtpKo6Z14b6bscfCd7Obb9zwHTeC3Gnh90HczffApEV0eRsISj
         jHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566311; x=1750171111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHQOcKZ4A6xyy0RM96i7C2PXvKO3nwwvUylDj/GnkE4=;
        b=HLjjgWBgpEpesJyr3Wmy1Ppv2Qy174OE76bhcIIWmpo6EMRkXwlWw/nXPl0vLO5Fkh
         1AGXrx8YSeB1KMhkEayuqshaZVCk0fMuCoAzKI3VFbdWf1xeCGRAfm+UUV5nv/oM6D8N
         R6WgeIqtpRT+m2Da+5sBLP5Bvw3NevijS5VAPhrJZ15rWtmQHGEskPUF1w/8gQ1lpAri
         d4enp3g8AexBDqQLZfeTvbNUo5LNuiQeNmoGE1CgiiTGHxrUwBOOjk58eUFVaxf9sjub
         mN8BHcyTr7v81KUNXT5AlWV+aheDqGWH8iZwLKRehFV1SNpWBoUuBFHsBSq5U5ke6ePe
         5v0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFR+pb+NfgsCxMT+ofVfPw4e3oOQJQ7s/LFdoeLGJHvZny2Dw2vOjz1jjq/V+tXxv5+1J0uPmcg89d1Gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCViihSYVXRl7kKOcVwt7URz0d61LHvKd4KdTb7Xb+sR3OCI3A
	pcX9C5MogracVP16PXTJtaVPfphi2cp/npw4V+MmFY/QDNBH/5ngWls9Btg0LwGYuq6X9+0EZTL
	LJ5Cz
X-Gm-Gg: ASbGncvsibMnHiEqxkjf8iTY1j0QHBW7i1u9OGZoeCJ5/kyfWSvGzSO+zcTNbHjYXmU
	ZRGwPRpATSXB/RAzJVJSMgKP0YuqCM2T2wukTTIgnac+qjvorf3KqCUCbSglliLBq1VkXkll+lU
	Jhri1Fdyj8nCdvTtK3OZiZbrRbD4vuYlpqYklFGUFehm8E3F6gUkc7KeUdDgxzmMd7/FdQrCcDs
	HtWNpXFCktDk54pLy8ucmZt2mZ2d3ph6a2A4iEMY7s3AFNHUOKkuugL0e6KHVlM4atXta6yRYms
	d2MyhYpsELSoFhROn3TLseSneu55F5YDDmSq2I3E3041nNV97l4V
X-Google-Smtp-Source: AGHT+IEUg2h/Bn0JvR5KjB/GMwIW7yranfSOQUrVv9CYKqUG47gWBzJ153JCz3umhMUi9Nky7PXHdA==
X-Received: by 2002:a5d:4dcd:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5319a7a59mr12007111f8f.40.1749566310625;
        Tue, 10 Jun 2025 07:38:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:18 +0200
Subject: [PATCH RFC/RFT 03/15] gpio: sysfs: call mutex_destroy() in
 gpiod_unexport()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-3-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=753;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RD/CHZwJ+oTe3UN6/TzEIj3HviHoO043bsyJSK0ioIo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENgBD1Mcsx5nGcQWupj1LesrLbb3He40WwEO
 59YvulbaqCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYAAKCRARpy6gFHHX
 ctnAD/0Uy5oh/cOhkErWApxCGt2fUcN2smJwB8w5shl5w1uko9j6R3jyYZHKxMFHebGlcpS511F
 ZwCgF93nMkndVYmp8qnUNIIIJjjTa71lPnw4xLqqPOluDAjMissvfgTHB60hC9PVz6lk+AIcFcm
 YcSfUSA4zHXQSbXfuu2IzI+T7mZTCy9y5VUw5mGoyufEWzPrcxINufDGWs1+uWUcyxkyagl+WtO
 Q+ZRUEz72lFcG+8/DzyWy4UJn8EuyP/fU7aqk2Edxxc88qXCnYX6aSQbOAODztxgUfOZWMqe0j2
 fviyE9QJI3nNV5C+1R+izsz+BYCBAdav0WWXkw3Gx95ucfjFE+91U1kC6f0hfnewFuiWGWOD+h3
 Hn/mFdEBldRDnoEsXGGyddSq/0S/jqglTRT4OHn7M50BU27/jsLCJns3K1cS+uT/JKHrkzE5rxw
 vsfVOXATQQccSmD9kMKHylcZ4WCQcw/sXRQvMKD9uxzcC74zAtCLbQe2fGe6kOuDM3viDEY/TdA
 0gd9G7vctG3LWkR6c9q3AMHkIFiLrncTntqfO6gloVx3s2xhjy4hiIzB5CTv/aRYyqxRz6RoBFS
 pFhyVt6r3Hs14sZi5ZjMG4O/RYCHnQhmPHPhxcX1VzN92hDcTlJoSI597fGgHulFASVsZcO1MoC
 NdalhrgKRg6zxMg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While not critical, it's useful to have the corresponding call to
mutex_destroy() whenever we use mutex_init(). Add the call right before
kfreeing the GPIO data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4a3aa09dad9d54dc77f28d596723fd5546cb3ae8..cd3381a4bc93a94b9a975248ae3e4bd8c2a3eb4b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -713,6 +713,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	put_device(dev);
+	mutex_destroy(&data->mutex);
 	kfree(data);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);

-- 
2.48.1

