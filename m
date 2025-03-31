Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A218A6A9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411622; cv=none; b=DHEE7TYH3UHhF3tkih0V07d6o0/YiM77QDxa9VYmOlwZIZXctGt1u4bvtVnnr20uq2rT02SnDEF7A6klH+gSWvHpfM6Ue+4vbjDkIgD+KeSDRrr4H/iAQ+1SCc+cCpu/+Ec5X9ABTiUmp9OZJEUYiz9WgF+lW6GmtDLCTsY9ioU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411622; c=relaxed/simple;
	bh=UEWMWx4XKJbpBIie5I4I/XrLwk7DDMfV1c2Dylv5ohI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmD0fEV0uReXCb+97zxIP1xLuQTS6wmYwGkOkqG3Se3zS2LqhBAUM7/uCxLiDfB53CezZzCgseVgh/ODEQoWNbOQ/geIqG5B3zEa5NCkdKoAdPfhrhwp+drw/Xisvr9kgzJ4t6IYXROnknnRDpZuRucnA5z9+XFO9U0XujhGg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vq9DcgtJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vq9DcgtJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso42649645e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411618; x=1744016418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8qYiLh2aqdDw3cPZwckXmMYUhPJtmVI390aRHfK5nI=;
        b=Vq9DcgtJoFLhG0EnLOtSNkZKxvqDuhcFm3zfjU76MaKrMLtDKiS+IIuB56ky7CrBqR
         /rrEBlBDeLA97R4rwaKezEkfd/Fz+Yy5NW4Buu+I0R3KuDWdC5hqzr1rKNmhThkY4JQM
         vB1Z5NSaaznpr2+ui5nF65BSN+EkIQZbzQAvCYdPNvR/JiDc5779H7iA2W3Iy1zRbsKV
         tiF+cjqrj4BFfyVXpqKvVYUGfrmv1PQT4ILLqAhxHnw6arU4YZwnzsknZ04+w1jInugh
         xKYul+mDDF4EmPYgMbN7JXOMwsZRFBhF85N2T9CuX6nYHGeu46/NkwGIUIFI6kDWqBU0
         ADgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411618; x=1744016418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8qYiLh2aqdDw3cPZwckXmMYUhPJtmVI390aRHfK5nI=;
        b=VsLTt3jU6UNv37zWlbPdYVIcew3AnT6rOgTAnmvD4Le+JZM+zVPG/rNVOxmkWrI/Hk
         D5LdGbwn6ubWfxmGXI46Q4oMeqqj/aVkNKUu5Pg8gwmATr98l74Q56FfWtKUJP7/gjid
         cvKNqtwB2pZcAv4Qtj0rJnvhA5g0JlkVbXRcwA0hykFhiAEwRchTtmmGtY5x7M0bNzzd
         1/Ar7XnD68frugpK5GIhpnji5wCRriU2FJmUvVKrzpoE09vZcjMxv1bcNBp4KBO60mTU
         m3VmrnQf7MTFR2xVR4jRAWoOxKp3uBe85/51bcM5NO6p837mJGLWLCKD8mgyg5N+LmwI
         OMGg==
X-Forwarded-Encrypted: i=1; AJvYcCWNQMI9N34Y01B4u0TO/8Ag0gD57ObVqG82xMB0Y505/vH27NN3MR1knsTKXWQIQ7+Erke7+XiMw234GKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqo3Z3ECQA8ZEYnUIHdlDmOXETL8OSOeT8h2IYCsLjxbbUQnsv
	BRPIweIWe+egfVUrvTdS4a5NQX85Y2q6WMpka2sPkfMlrl4QVSBizyc49GLqoH8Rpw9QZrE2x5D
	z
X-Gm-Gg: ASbGncsR+JHUdj58ziVT2tJ2d2W1b9MD/hJqpwLwwXdCKPC/QgZGtnqttxl/E4fEthT
	EsZGXWYKgp9/MERi/RZuAYdo+JR03f9bmSm6sGoUCzmvR6WzzK2R02Nre7ssPszadk1NUnk9+yk
	EjRyg6gJMleVrGvaWJo4odtItdd46t8ty+UOORI3HZXDWCghKlH6Dp0wmLYi6Vzvlio6sVi5XmK
	2jKI9aJy+MZKrg0xq0DROjGah1jF/TJ9LYwTx44SzrAmBFCOVPomhpq6V0x9Xw+d4ZaWJnkafGT
	A0f5v2FbbL7cBrGE5Gy0b24f7SYdOQyuQhk4jw==
X-Google-Smtp-Source: AGHT+IGYMdRRQWNFzlUCehEceX+XXUHjOedSfgkqSnl7Q8CuZbi5g1WG4ZlK+YukiCPN7+U9dPyW0Q==
X-Received: by 2002:a05:600c:1388:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43db622a2a1mr49112435e9.11.1743411618213;
        Mon, 31 Mar 2025 02:00:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 11:00:09 +0200
Subject: [PATCH 1/3] gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-1-25f72675f304@linaro.org>
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tlGOX5FQjGMEQfrMpb3Lx+55MZB/eBiCAP/mbvbglPQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6lmfvXKAtsbn/u07MB4pHBI6KOEjCjOjAIh23
 zndHx/YlnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+pZnwAKCRARpy6gFHHX
 ciIxD/48yDvJXOQkZV1Wkm3Z75EezAAxi7pURHuz45RZYw5Q7lCWxtbJXtzQifZQU4OU6Sg6Uw/
 y4pUCtPw/gX3iOqGyYstANfN9D2WkuXfrLWnfhhXchlJMhqT69iXltn94s2bBVLaVvN+H8VHj1Q
 sNenYfEI3zc1sGvTF7vx3XD/IFuZDT9s/b2nwVZmB6zrCytd5qYa9fZmKOjt/RMCahn1ItO6L5M
 mCtiZAD2tPtJzAlAsQV+vJv9J7ScCRV8m+Ca+5B2S9VN98mwbsVBDEzodjn4BIYLa0PrHPHdJZB
 uh16/AgMn2u4DqnB8K6zQGVH1xP0JqwFvixhLleslQoBdIKt3yTMbPsWD+PjZTJfVZGl5puJsD/
 dxtGYA/V9KhL0WgL0WJyuqSRGttg1Bvy+JaNBKvxo/w2sMEiwI6T5NJyNw7sqpiSphVLZW7WQOB
 Hup7ItjsB9OWs80rA6496sseOwwOcOWdgmki7JXAzNlyl1KdXYcNdtkyy3Wu55kh8/Xgb4Tk6i/
 1M2Fs8LlQFfj2j/wkjug6/3yfh4RAXzKkJwQaSMSgbYEqaepAH5LzXQ3DDhBmHdPQCpRTQhBDhz
 mac2Dm4TOCcytK8KhKZ2LF7blX2EUM7948cE08+mDw+DDu5Zio0S8ApZq0/rKq/3nRBhXs94U6Q
 tJld+Arw4DIymAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The non-exclusive GPIO request flag looks like a functional feature but
is in fact a bad workaround for a corner-case that got out of hand. It
should be removed so deprecate it officially so that nobody uses it
anymore.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 45b651c05b9c8..8adc8e9cb4a7b 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -31,6 +31,7 @@ struct gpio_descs {
 #define GPIOD_FLAGS_BIT_DIR_OUT		BIT(1)
 #define GPIOD_FLAGS_BIT_DIR_VAL		BIT(2)
 #define GPIOD_FLAGS_BIT_OPEN_DRAIN	BIT(3)
+/* GPIOD_FLAGS_BIT_NONEXCLUSIVE is DEPRECATED, don't use in new code. */
 #define GPIOD_FLAGS_BIT_NONEXCLUSIVE	BIT(4)
 
 /**

-- 
2.45.2

