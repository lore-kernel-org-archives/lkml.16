Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCC22B8A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010485; cv=none; b=GLzL13Dy1pfWKMt1WJtfjZWpT04XFeJrl2S+vwfvBmCc+QZCVG/OsC0BanyqQpQHbwk3amLWl+Zwjl/I7Ic4aUOILyAYxEJU5RrzJ279W4Ldfqz8xpgpPd+ZxlPiAu+VCNFaLMSIFV2dZ0+BTsgrTaGxKBoPF6EZ6upvvKxcZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010485; c=relaxed/simple;
	bh=G5BhxWKBbXgp0hqNK0eP2RvhQKS5wVohdK+Cskejh0E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MZmjRePKO9DlB5j+mPvrexScELTjfENT6HCj9TSmKP+hTiPRiALMS/VSkBHbK92WkFE/Sz66V+JZqR+8qq3cxVhcem1MmoYdDjKMmIa5/0EnCMlPwKF4eH3/z1WVJmSNXHVzShcYDC2PiFvUVynISIjun/Eptc7i3m+TXe7y6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d+ZKdVxh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d+ZKdVxh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44932335e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010482; x=1744615282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rn1KdFJ/AqShrvU/Gc3KSw9wUJ6mAkmkxSw61iKgtg=;
        b=d+ZKdVxhk/rJ3zS9ZTFVp2jGL1cNQRZK7CzuBWKig4cATYsQpSx9AmdMOenKQBjqcZ
         bOiKqL12INBw94zcuchoG8WN478tsgYqTV24ldWPUlhzXxxW9KsXtei0IK7rr0ci3KVx
         wbvRl3hBNEmHytaBgtn1Hz6CvHYgI8s59ZoV4C8+j5S8ix+W/J7q1j45fxBhZH7I/5yg
         B47u5EEylWkHWpR11Ai/mqz8hv1nqhVs4ukrpyGHnYoGC6bb03cLRyTnetU+NF31fPkI
         6bwBMCwq7M+vitlMWnapWUoE9a73yqGlnTQ6lAXkb8i5Z3J8m68azI78Xt85MS4avWBV
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010482; x=1744615282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rn1KdFJ/AqShrvU/Gc3KSw9wUJ6mAkmkxSw61iKgtg=;
        b=S/lT5nMCGGWDfD7NnkfvWTRezDvS8XDcJrOW4Eaf7qV2+qOcUoNHQWiERVqamvCimo
         3OwXWuur6SECEgJGlojScr992HbyM9EYqDHqTNamcFBbqGFQql743l2cDAIibNbzcPLp
         d/FWA7mCBo1KbwsIUKeQu6kAc12Ukk0S3ZhV6iO2svdWBqkLL/uWyKNQJufuxsegjdeo
         zD7RZgbmt+XFC18B0+6gBpSG5dAiBYoZb7oTw24bYeUyY5FoCfgiZGi9yWowirpEpv8Q
         xcoqJXTfGzgfW/F14K4X1StOrycNKYzXG+vCcbrgkR+7EJ8Lbt8Jt0/1thtPXpR1Efe7
         wFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz+/sDagg+/FE4rdtqy4VoHv6gDY9ihKUv2PkFpFEd/sDLYZ9MCgUFPlP8GdwpX54LSBdkRvJP/nj35AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysZ3voOnjcpStpTXLNVloEVsxBelmmM9cnhUvpNqlfXwRceQPj
	fINvRi5ANbZzsB/upGbab3HM1xEbASZT1Nco96KZtrAne3if47tkkWWVuOf5050=
X-Gm-Gg: ASbGncuZ0xbSUhuMpOpcHr939EC6ExvotNcAwlBz9QLQAhRN5HdzS+gJunlWnjuQvzL
	wWUOY6rb3D6P5wy99vhAGc3pMhbOv2XS4Xa0LQCIE1Cf1JXiTgD6ptaCxeMfhd1wpulVcOmH5ti
	Srq5cVV/zaXcGuJEYSXxx3KRlpB2OhEWsCp/eVhfC+PcMCp6C7PTYriLatNGO5itD55bwcpP0QT
	/xT/L7JODUVcj1e+wwAeQg9wijjmP8ufCKShzD1laFwsadbQ1qNr8FyNHkrICV9+7vHHfbyKEFz
	8PqYkIyt3gKFkwZ6wY94pNM14TVI9jEcmrjPig==
X-Google-Smtp-Source: AGHT+IF3fwVNb2bYwy3gGcRdiJ6n2qvbc0eHaCUCLwGx5d/paU3tpQWJQL3gak9CAzdw/0GxBrYVVQ==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr115663405e9.13.1744010482599;
        Mon, 07 Apr 2025 00:21:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] memory: omap-gpmc: improve the GPIO chip
 implementation
Date: Mon, 07 Apr 2025 09:21:18 +0200
Message-Id: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5882cC/x3MQQ5AMBBA0avIrE1CRSuuIhbUqFnQZipCGnfXW
 L7F/wkiCVOEvkggdHFkf2TUZQF2mw5HyEs2qEq1VaMMusDebhww0oly4U67lwc7M6+qsVrPZoI
 cB6GV7388jO/7AavQW1JoAAAA
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=G5BhxWKBbXgp0hqNK0eP2RvhQKS5wVohdK+Cskejh0E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxNFy+D3OFGZQiHvVr2CLLklaekrUcVUbZP
 2oAph4muviJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 cqgSD/9ORogsSvmUy6nkmE9Tdj5hGwclTRfgN5V5ZAkZ4h0MPIFpydP1HYQIrOQh3qs5YnYEjWw
 TjaUlOkOS8h1aRF1UHrcQIN3YqHCYNQV0c90/JAU93KxscLSDudGnTLhsAhEgf/7lASrHD+Pz2m
 8R5oCgIBjs0lVMlC1G8Mo1x7O+99MnLSgJ6c/rGjwmbiLcr+VJUTrwEnaaz4GnaNbb8FfuIlpVf
 MES2mGs5iiz5L9MFIVAhxG+OHy5SPNnYwoR2mwogdsGkeRVmlupPxSir+6pmwsj+uTXRljmnoUC
 Z6OeRr4ftM7oqU8dTx0RDAQGc2zj4bgQTK4oYdOk33XcgIWkrQVN4td1gSZvAt+q7/gUWsYtCx8
 sSHeEcJ2oi7iYwNbZzsIhWLP0OndRf8At/ysz37QrQ6BkAyz/vNAOY74iiDtTJP8F5rUXi2U/Qu
 nViaPE4rS8mhn80FWMpJGVUidb4shAHmQGJwM2ZeR7dofvBwyRlsmINs96tyk34NRuz6jskt+C6
 yVWGUBo44ySi0RHHVbvHHEFbdQAhxDZa5P9LFvBCCz0VQkgf6gL+C/Cd0z/1CVEffHR7ldNKQ/4
 VWXqcfStg1eKohXZwdfVb8dowdD/44XadeTBhusFiinOu8T65O+KSfv/+vB58nZj/mieQRMgaSj
 Okt2wBpbzS0tDvw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. However, this
driver doesn't even need the set() callback so let's remove it
altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      memory: omap-gpmc: use the dedicated define for GPIO direction
      memory: omap-gpmc: remove GPIO set() and direction_output() callbacks

 drivers/memory/omap-gpmc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250327-gpiochip-set-rv-memory-87bf23c66b7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

