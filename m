Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607B227BB5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010006; cv=none; b=XDElyRiBhAvG7AQrjPIPfyBw/qmfUj72DUfk7g+C7u7jfio5ZFwKzYMH5wE1UEQBKixJnrl5u996ZDF9iLGWpSOw6gEYCgPCMuL/zrPtj7YpcvkHycLDYiC1FOE475KHUxOsX3onepkAHzNMoRZ33Wwa5ZnBWLE0tm8aTkNt4Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010006; c=relaxed/simple;
	bh=OB+Tod0EAAoKXa54jxrVo7r/BJieP2+52anKQowSyqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfBIw/PopmuQBGt0DjAdzWmAhS12s8oFeaulJf2kZNYWHASv4sFfdAhPRjSB6AtaHOC34P7Jyla9x0/YvXG3rHk0Ju6P6dT9vR08jXTMtjnXoX8f6+487g7Z16qYvBcHZTX38tH99iQnz0kDEMg6vI/pwKfZRoDICqhM1iEN2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aTviwnLy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aTviwnLy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso24781795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010002; x=1744614802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEJk2fgoO6xuxOx17RjFVCvTWlWoQ9V0bp3uC3N9yno=;
        b=aTviwnLyRJmiJJ0EC89Ngk8e/gC9fZHxnRUuNB+ejhsA3xq63t2EeT/GLX7cvBAvbb
         exKQDXi097RqfNAmUvFVLAWl3xfVtZES5ZkFU/3Banjz4RwptzYctqtsElzR6dNmNsbJ
         o1yyfVkrO/eqZRfAf3/uL9XUSsc+u8ICTvzwlzhq00u7XqFAFICNgMqei2dOowPq9ir0
         m740/zwpICXM5Bb7jVp0rFAV6u4BaqQGi7Tif/dXor+blBmsQnYCzzuSk4EiNpUVkv6t
         f9YWicoZv4fGAgcBq7ybL9s6OipqNRS/OY7L5ldKrdZMeM/6Vbu6NYlC0o2WHvxWFt1u
         c1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010002; x=1744614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEJk2fgoO6xuxOx17RjFVCvTWlWoQ9V0bp3uC3N9yno=;
        b=vsYW0N74nvuarxL0vPKRVtISmUya8Qd7/Fz7MaAmDk4skdT/YaPz1Ah1zoXVZ+vZ51
         0z8G/hyBrXTaVk9trzEKKzVICL1hCES0UzYkv44mb5IOqgSQhRzXlGE7jO+ip03TFiRE
         r6BBYy/sR+QeuXJdFfumKTrQKIT+vO/bm7WNwcrKGNqkPKB6T7nJm6C65xxfsvJt9YqA
         fWcK2n9V6DS5XSuuZVB5msQcnamZ+Z9yMszvYb3b9PrNFTaYRA2O6a3AXdTkXoeZzQ1G
         nnJlD8cM/tedPE6oRZnXhskOh5NPQRLL+tM5qY2lwhQCB7Imnpx4mDPVEECPJK0e76ct
         2Htg==
X-Forwarded-Encrypted: i=1; AJvYcCXkkeGK1w/vKE/CHerbaWZggiZJlWCiHZ9mootzsun6l2UINsLWCn+x2tmG8/O/FvtYye6d/m9gM9J5f40=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeS10wK+UCk1oDO2N821FGBFDceG3a7uhsXXWa4GyNhbInfl/s
	CFSLdH9R1U3J0mfnLxwD+nAAjN23Pb1SjiG2jhokYpvDEwxy2HkY9L2OiQyx+nI=
X-Gm-Gg: ASbGncvGCU3vZNtgVn7YFx7vyRN0cJJ9qu1A9JYen7QC3S47pGz8ljhzt43CJEh7+2X
	zPCkQom7/cUGuMFpe/6ecW19HoUFD3aqaElV37jEVT+D7wPYtwOwWKjEMXdZwmWfQw5j5f2kQt/
	Dc7n8wHQ5I7bXFwiY2en49y0Lyt2u8iUWVXUYbey+bplYBjvdzpLB/4Trqfc6cjZ+cZYEzWXVFP
	h4f/V5xtYpWzxFruHBokssqGpd2mJh/X++RthlewrvHTPnBNWWN2SZAZa+jWlGsPg6lfsrX4JTa
	2gpd9Q/Q4BzmFLmpEoFuFWw8FfCqbhALyiHk8XtFcCBr4VWS
X-Google-Smtp-Source: AGHT+IGQFtkqG3wC9PlTnS9PdEgWUDOmHi2iesezrUO2BuhVyGIBzJ/lLkwgSOkeE2y9buDTHgbKBQ==
X-Received: by 2002:a05:600c:83c3:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43ec630446dmr144575625e9.10.1744010002619;
        Mon, 07 Apr 2025 00:13:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:17 +0200
Subject: [PATCH 08/12] gpio: gw-pld: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-8-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=B8G8UgFVEWwfpU6misTgZDHXnBftCijWCVk5K0R7qTw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sJb3Oegu6ayXdu37b/nOtXGHZHU0peJ1XBm
 F0mOrZyysWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CQAKCRARpy6gFHHX
 crfGD/9I9fXNiLVMd5LIcVDpTYjoPujtaOJ/uuZhqNWwmdJOSOQ8F+hkoSWtHk8j7DzU2oOsoJC
 t/YwtpS3NfvLHFJJeF58vPQTvYjqSSRtBAsjytTZ6mxXSQ3Ts4rhISO9i/GVFvOPSnvB13AOQ0l
 lI8cLA6dpBvLmvqw0JMvUMWWCMYBQiosLvripXgLdur7vw10GOHnf4doIF7ViJCEFSupSzl8zIt
 devI/j+oaUnw0o178HxEDAO8341jx6IPfzTzIRwBtHC6o3q4/97KGs4o/bLuYUnFwfHru3V6WKc
 isQiT1FphGycPwrE0IpkgHdTadFloUAG/Qz9YjBVci3HxRoaVS9er7n8pLRMkH2PJf4wy/oVs+l
 eK/LouTu7Y+CkkkflWvFUBz2sNgyXbrwMlBgrKIeOcdUyqObX8PwUZHya6sHJFDm6m1mhmrP9+w
 R86UBf4qJgs3kmKH55AfKAVNJwePkrkBhEvSUsc14xUmtJHyVjGGvXPyteFQ3qJ73q3Mkm182vR
 OPOQ5d1NngUCNOqOYAP+aTQyEBH+/TKHGtHVRbofSars/K4zYiAIgwh7BYZcJ5RL+P8TmvWSByA
 cdekC4GPE/MzSiB6cXLjHYvCweUujad58sM2vSrRSKraM1HflRCeY0bmZ48u/QdyhZHi7PPqXDc
 3YgPBpydQY4GAeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-gw-pld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 7e29a2d8de1a..a40ba99a3aea 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -62,9 +62,9 @@ static int gw_pld_output8(struct gpio_chip *gc, unsigned offset, int value)
 	return i2c_smbus_write_byte(gw->client, gw->out);
 }
 
-static void gw_pld_set8(struct gpio_chip *gc, unsigned offset, int value)
+static int gw_pld_set8(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	gw_pld_output8(gc, offset, value);
+	return gw_pld_output8(gc, offset, value);
 }
 
 static int gw_pld_probe(struct i2c_client *client)
@@ -86,7 +86,7 @@ static int gw_pld_probe(struct i2c_client *client)
 	gw->chip.direction_input = gw_pld_input8;
 	gw->chip.get = gw_pld_get8;
 	gw->chip.direction_output = gw_pld_output8;
-	gw->chip.set = gw_pld_set8;
+	gw->chip.set_rv = gw_pld_set8;
 	gw->client = client;
 
 	/*

-- 
2.45.2

