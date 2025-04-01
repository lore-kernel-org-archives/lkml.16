Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D1B20126C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511621; cv=none; b=YVFm+uFKcB3yVeepAC9jOo6RB8ESRxgUTvLYosoLf5qWqTl0m65RfynDr04TAiD54VbelEVH0hqAQ0AqgpcO9ydKijQh2ZGH3fSGTpXRh0TE6WEwSWe7CCGJdvGi5FRtCmPNSyIiFNd4V6lqyZJ61acTo2Xt4Nl2Dm134ijJ1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511621; c=relaxed/simple;
	bh=AbV7U5pUCyJPC11rcx6UA9F6fd4wqEjqeKr5InyqrcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7ItQFDxzu/sSg21tTA6CFXt3wbnhwW91Tg9wgtGNV3MjE43kg4B76e2LNMTWxhxKOzUiIIPCAlkCNZCm0cM8ebSNWU815E88papJL76tNX61GK8yZe8KlR2jDh5kXa/JFT1vY9qeiuUhukvKCASR6py1aoCdmrhdnnVDYqmU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TJGzMwTe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TJGzMwTe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so38395885e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743511617; x=1744116417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXRKyXT3LiGw8+HSSKP+LYizolwv9vZJ9qmmSzI6jpU=;
        b=TJGzMwTe2ydsFJjMkm9jMevoDJ2PHOex7KkURzYbG9wU2pN6cK+xDnSWdUb/nJIbsV
         5jYiYuNvAEhsz+ttfWOzG8rrFSsnkxsgVZPXh3vyOYFTR8854DXsvY8g/KN7VlAlwrRT
         RKW9fcQ5wJHOI959ba0921LvBooTdCrV5aCWqpXt22OqcJU0Jv4bxd+m86QTOlk/oUnA
         YAEqW3jlZD6LJ0HjNwS1R1xgnuuZuEBQI4WeGlhEN9MXk2zIo4m1vxcCXFo0y1IHhKse
         3HS87PqEoSofTXWVi0jfMxbp+TFeHRQCOV7tOYKX1CzPs5LNtw7iZy8uCgxP4MZ5xz64
         Ct3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511617; x=1744116417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXRKyXT3LiGw8+HSSKP+LYizolwv9vZJ9qmmSzI6jpU=;
        b=p9pbS2bimANtEb9fdfZfOjvwLcIHfn66qLifhnBlhDjLaUgLbLb7avrevUP3VOW1Tc
         k6V5gK4HBFhG2fx3VrsMvSJZ8RC7kQuJ6COt0dr3vjZG2qPFjJPAY7LTn54lns3FjIgW
         LF697ZZWLW6XhY72VdqvNyqgbgw7kNlNwVO9WryEIjMamkQ7o0VsTt6oEwSu/YxY0nLm
         UUkUf1YA+uf4Da0bxewcIYWiAcDdBSW0xDTuCxRVhk286eHJPyeXDA4nUu5ageie2ra8
         cT5u8E9GU5qaQl2QscY5cAmwc4Hxd5wAUAyvWIMXTcniAF8qvh1GhOcKlAE4x76tvF3f
         2JMw==
X-Forwarded-Encrypted: i=1; AJvYcCWnrF0xMlR0bh/XroeSKkhe0wP3uk4oh2FBZxSXzVASazSj5O4DZGGdTfSGoHTKE2bjXjcRxhqORVkwDMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJaoOmT6X06eXDIIVSEWIC/HNZu7FdKc5g42vxhKQcdegkA7O
	CahfyPgKW4WjkmgNR9jg4IEsrtZyoMOeZfsLhcKkH1VHdzPGZXD/juhbsaIZqJFHYau2SzYOrgt
	o
X-Gm-Gg: ASbGncsZt6MgpM+q0vbnvZGaFMVd242uk+biCG5a80roiaGNcSAlY0joSy8aR4fYwjJ
	x1UGSTlFw8Iu0RkDyuD7gH1KCaKbJG5LrvrTezyr7AMGmN9cBWYT6Ch0ZOQkUo+2AyTaW3+4xDp
	cMNnqutlUVNFZJ2A1zM+pZMFUccRgyMvZOrODwyUjdw4ugz43XVPU6wgYk8IeNn97ZJryMtb/aV
	gUtnUIUdCTvCsG7TrAXJPXXPiVom7/Y91RLRmfz2fTM5uesxgfroJPcN5F+/SbaSTCWblYEJfK9
	nmLPR0WRa1zWFlJmrIz6jo/+AyM7sXKh1yEJ
X-Google-Smtp-Source: AGHT+IHaLlLegdzZ27WF3+EP/qqq6kVpqc4ibSdXPq8IpfN6BBr6SIN3vM0ZVDpugyRjl2BsAWhwEA==
X-Received: by 2002:a05:600c:1c1f:b0:43d:7413:cb3f with SMTP id 5b1f17b1804b1-43ea1fdc23cmr53880905e9.5.1743511617320;
        Tue, 01 Apr 2025 05:46:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a1d1:bbb:e2a6:2a9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm154711095e9.16.2025.04.01.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:46:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Apr 2025 14:46:43 +0200
Subject: [PATCH v2 2/4] gpio: deprecate devm_gpiod_unhinge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-gpio-todo-remove-nonexclusive-v2-2-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WbtXMBP/Lx9tJ7UhDb7HOi5xtDCb5dGgjCHO5zGis6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6+A+N4yVcT7sWbctWbTS7q1ERLNVyT6RkRHzD
 9qh7g7uNlyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+vgPgAKCRARpy6gFHHX
 chetEAC+00cV1S0cRNMEFzRJdv/r6HrmFnq3EGDYE9D5V0FjSjAKiBCAKSXmQjgYWx4RPzBGQDG
 uUFxUuTSC+5sYnvO6JssdDqKTX7KSvX3T/jIC7vgAfsDkfjLSOLD9Nj+jjKZtihQHKsLAiZhh5v
 r8ueH1nBOwMFimGEEiGPw9FHUu6uRO2NsLiUEEN1aLQcb3qo77XLZpHiVgcowqppSgS3fUbXHWt
 yOaRGKD3bIFTNmN2qy5QmBC3odQPS2R3J4M95Z0ySkfS2+KE8lGoeX3C9RwcDYXk1QPcgUBRSeR
 ZEgl2gphsjBBFtV67ZXv/U/+bpb99Xg3EebwCBeKUJftrWehPbD7gR8/jnyppQ0HLFfqEkzX7jw
 Qvsvcip8M90nI2C1MBkjCL2dV672xX3Atp/FwmMPRVCFhk5m87EXOfaCSnLFPrITM3SJtR5X46J
 45GLuCPsRNkRcWGZGPgf3unddIpxBmqyV/VdkPjDfbW4p9FEe5nDmwXfdCxQD/HQ80b0MdCzNb3
 VvyrVqTLYaSZldpUIlOSt0nKYTdgP3387GzpJ9vy7jg6GM38OaQQmnVlEjgfJlm8AWuImbInBfB
 MnLLQnil0z4QB2q6CVBMK6PCwc7wOfxnBYHYVDZSKL6lKG22vhYMsqKrG4bgnwtyfH3lWbQd03J
 0EIxGF3F8QHILGw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function was introduced as a workaround for an issue with resource
ownership in the regulator subsystem. Rather than passing the ownership
of a GPIO, we should make the regulator core be able to deal with
resources it didn't request. Deprecate this function so that we don't
get more users in the tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 08205f355ceb..120d1ec5af3b 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -317,11 +317,15 @@ EXPORT_SYMBOL_GPL(devm_gpiod_put);
  * @dev:	GPIO consumer
  * @desc:	GPIO descriptor to remove resource management from
  *
+ * *DEPRECATED*
+ * This function should not be used. It's been provided as a workaround for
+ * resource ownership issues in the regulator framework and should be replaced
+ * with a better solution.
+ *
  * Remove resource management from a GPIO descriptor. This is needed when
  * you want to hand over lifecycle management of a descriptor to another
  * mechanism.
  */
-
 void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc)
 {
 	int ret;

-- 
2.45.2

