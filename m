Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F42128A1DE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287044; cv=none; b=Q9UgeZAxishHidHX9XHLXiPOhkYI68gjQxJNc+fDf8Uy4LJJeqW8HxaANICjik0LyiMDi/VJDRBL6aA8FsnExQgTKn6WCEjmOIuCUWfHDracMzIUmioJQvvwJy5HDqJrn3qIWK2tlqxRGWb8+TxFwdD6fGKJnVzFbIdhdu9Xuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287044; c=relaxed/simple;
	bh=BAX21BLXdgCjprb8m62SSWkuVvEMGYe3PXLwT9tphzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKfP9nWWq90RizI+hi1BGi2rEZRBwL0SoJYqFcG4yQ1WQ2JAF7LkIMSMZvBkxg/glJPZTI8BNGFeVYP5wKqIuPw3XhZN0lGalRn/DbF+5ro62tNVR4dJhI3T72awwdx9nEmYz95SywL+azpX3Z3dKCT4T49V/AhmKfdqMn6/mOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rJHFP3ad; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rJHFP3ad"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3445124f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287041; x=1751891841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJkvj/FldXX6eN7UCXfXzKw4ph+FloS099EL9kd4YCQ=;
        b=rJHFP3adK8CYAfh6oblPVOKQKRDYdx/FaLD5yKiL8U4qzZSLCtZ9RdfmqpEsPhxv5E
         lF2T+CSBVj00zL2j7hT3Y3jAyujEf730euBlGyhjQKPyawbvvovN2xVlRBVrG+uTpjqR
         Cz40p11nFwjcBhHAFZE439swDvAgdcwBxXrSG4HsCsghlSxSd8+tIk6Z0025FWK/7TuQ
         tRkFno4RsLpAQ1pnZvpMagPQqYA0qfy/XW5F5AqzXrIkx8CQBguI71KF39Tq1Y0c2JyV
         rvvKXtWhj7/LUY4QppiRwJz4GEB3vz/HG6NlcmnwuiZR+c2pQlyF1eGuj+cmxTxP/0cA
         /g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287041; x=1751891841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJkvj/FldXX6eN7UCXfXzKw4ph+FloS099EL9kd4YCQ=;
        b=qpCPFjXArQm7LY4wL7v48DRwIenK/UGY06Nvid1c7NykYr3MCnIu+a117vt23vpcSX
         L6TezSeC3qTpP5G6IRR4MaKc+tieZl8juw0NtCCMDfPokS5xMt3p2UDdhD945ZwrC6yD
         JGQL/SD4QLt2c2uarlTEyfygOTFy7HGdvPnNOo5r2w1Oh7e0NsZtqzhAbDK0Ayj0YhNh
         AgMzw1gR1mA+DE39w1KpuCBPv9l1CMQokmvvrBgL7uKF7gkd8UPNNHavgd5IRiVNQpdS
         7xdmG6d9UY1EP/YzypImgvAwzmEHS6TTYMgT9WICn+ryQi56HCC+qhb4lCBg5RiZc5it
         yhZA==
X-Forwarded-Encrypted: i=1; AJvYcCWCpMyze7UXrQxMTGAAm1VMUr0ANDW80emMz0QReqfq3u+tCpekl+su5uVpROcwrdgQ+suXGFFITDHzOwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYPbCLNJRufgULGaEaGT2HFpKRL7zNObq8DbLSVpTc8dfL8sH
	9qgJ4wXC0X6SljuO1FK1i5qrUFOlp2PA2s1Gd0xxALJQnK5VcSCuRJ86CdHZKAX0FtU=
X-Gm-Gg: ASbGncv5Eq5Zs7Lxo+vmwoRYV1uuyjUe0QKX3orda3uZPoMeekzOCZDVAR10mQesG8T
	+VMMXNXwu/cIlkzfAt4d2pxdB9l/qcJ53o5iV1kaoMwLM/DwAc5wRvGlelu6/JOxDvP2D5y50Iq
	DIJnZNvRyxyOegcesEQgcD3g0Bz4pJDcXTcjE+9FWGGmhcdxaVCWuDmuMNq8SR4UC/dGjZl/im1
	3K5/DkXvREAYIz6Ge6JjeKxIDLU5/CB/gFBMicOAsNga4r56fc9fqkiuYd8bbVfRNFI7DjdGCyS
	dCHg5Abeqj3IIzS1iGyGOYqtX1nUaklIfEux9riglzr4IiHM1IfDfvca
X-Google-Smtp-Source: AGHT+IE0F/cqsrvm9WJqsaaoQDoMcHDkIHS46Ew1THqWepGmGlMw+IKBlJmlMtsY7BWR4Midl3nwgA==
X-Received: by 2002:a05:6000:40da:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a98c78caf9mr10963556f8f.23.1751287041451;
        Mon, 30 Jun 2025 05:37:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:08 +0200
Subject: [PATCH v3 01/10] gpio: sysfs: use gpiod_is_equal() to compare GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-1-b997be9b7137@linaro.org>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=882;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5K929j8J+QocufDoF5VRHIwbhKAOdKHaj6roDc6rDQY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT8JbRZZtjWQbfdmzbkzEz7oqXHnDfpckLtW
 +9ehyoYIfWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/AAKCRARpy6gFHHX
 cmaRD/sFqS2WGuoadny+5iCJLjmF3+iQEvsig2RE284dyKEYayNGEC6a/cGRNcsOFKMlnYHnPO+
 Kx4OQBAHJhg2Sjd9DhrB/2zaB+WtXXY6kqnUiYd3vunWq8PNvIHCq/9TgToIyoVf5H4MzSAbQkE
 hav3Ehw1C7Ls+BSUdpj7NxsdYJayKa1JB9nLCFx8P5+Pu12yvMX3LjO35boX2pfHM0oze2FDys0
 BVgjZckiAls4FAr6NVe+b7MmhGCxxA7bM/WdjuLyeNIFig1EI3tIhgtdNSxMsG07AdXf7+IIIXi
 8H/fybPfPzl8iVBqXDmV92a3H6KXivbH7r+PeZVjXpGbbbB1aaXunCofcrYiKydPN0EQ98tkLrW
 Kc0TCt/Idt+h9vkYrAEOMhPt3Aoc8SNt9qmVxVd9am/hS3t+LcV4ch5haTD+lHOzT0dSeGKxZup
 5+ePn8EqvMXATC51J5TExTSCW+xKbxBHbo2jBcnwwm+ip9vy9RGvI5sY7/33ZDWh5GMhYphyqss
 LEp6ThWXhXkiGEozhIjcgrRAUPuonqu8bMXeDfAdJestYcWRfFVuf7b6iejchvx8iquybyBUFP9
 EAIVHYvvzfwcpRRgn+ft9CzGgjXsgwPXWAeA+r2X+hTvFdIq+iAd+sbo5Gz0Qn5QFVuSqGPsWR5
 YANtlYS6/4y6Zlw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated comparator for GPIO descriptors that performs
additional checks and hides the implementation detail of whether the
same GPIO can be associated with two separate struct gpio_desc objects.
Use it in sysfs code

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c4c21e25c682b939e4a0517393308343feb6585a..c4e85f2827697d0239ff6296caf49d243cf10fe8 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -657,7 +657,7 @@ static int match_export(struct device *dev, const void *desc)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 
-	return data->desc == desc;
+	return gpiod_is_equal(data->desc, desc);
 }
 
 /**

-- 
2.48.1

