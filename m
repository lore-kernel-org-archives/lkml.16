Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E222A4FC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010296; cv=none; b=qHbv+dBew8SElMcsm9ES5tiVQ+e93zXaMPbHCzIBeqA4jjMlRbDeApP3EOdFaZfk2zjfpKBPyQx8laEd8dw7w6zSULhECoA1RamWsyZndY9LMa+vH6B4QogvGkWpP42KGYcif3IuOdb755ROLNGwrYiNHtq0r3EacOmGnYd4ghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010296; c=relaxed/simple;
	bh=AxvTgPG/08SVbPx+P2b7i+Lqy2PqiHtAE+nknCQ9/HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AEvryy91tSAEpMewI5EDKLIO83z14fTUuX3rs70+Q685BTzkkWiak/F2RJw6cyGEov5diGQX1Yardh1xbujbgkSbMStX8HTRgJ1igo1kHrsbvZwq5BAPtPbC5o1p2opgvZw8VO5iJjOsKDxu7Z1lRPxI9JrDK9c+emyh4f00W7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0EQnU2HO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0EQnU2HO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf257158fso26823165e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010293; x=1744615093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cc1N6pLgiIuAchfND5sDfdbE3yslYziafjrXEdXiVw4=;
        b=0EQnU2HOzGJ7qX8rKr7LgeBkidOX/Ker53VpxdMUGFWv9B23TYkkPNJFHQas7hfa1F
         9bs30S8PmeykXy+0UES5px2TBsZ2AG92GJWpHvYbU5wSkcwgLIubYL3Ke4iXJtE2258s
         D/EkwLrFK6TM+nJ48s3DAIM3GAhDqyItt1LlGe8Z4xUPFmWEQFQllPtn3taQw6JmdP6J
         j4t6Z8njJkwngmb1cuU6eRAA8H/w/Fwm4m9PS+EfDc+IX4jfbyvso2kVTyaxmltEi3tB
         Coy35TeNIcAEDxv1EFGlZijqkCUWwptH5nhmdUnz6XRrfyMAyY7LPtI9VETlASpxeShR
         NbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010293; x=1744615093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cc1N6pLgiIuAchfND5sDfdbE3yslYziafjrXEdXiVw4=;
        b=WIan5aJZbkoAui0oi/I74ZxxdTDEP8Fovkf2slhzH+ihIAvf33c6Ip2U6bOtdDYjq2
         A9Q13h8tcvXePpeJU7qxHxT17C6K6+kwXHgFZUZ55vq0Xahd8OJq9kEU1vXF6gb8AVHP
         liP60d0vOYoS6wK8YsDhEezQZreloplXUNRrXmTtlJ08IXnksP16QSN6+BA879fFzjaN
         GHhx+NA9Mbw7AlB6lzJWC8ninP+5bCPSxYYwWQm19UYbs4tyjQcRhQyMooJM5WFrQdH6
         bzdUZSbp3Q5zgTowGyE2bpQ6bWCYk65Z0MPujDi3TOhC+fjjNdw6qNvJwY5oxj1JQhPH
         hCCw==
X-Forwarded-Encrypted: i=1; AJvYcCXlplPT072pMU2sodxlF8Hx/ZFtY4cs7ejVsFbH+ilPBvymAzZOvrf+Ucnj9BRhn9+VPGqT+8fSjXNKFHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMN/xuOkMxRlcqGRIGpw2pvsi/0NH8PS5JboAu50Q1Fp1fHbPa
	DhsxiBAXqgKRSMQGbxR/wYGX53BJ0lU1FPpntTGiajQOWTqis3Nk/xVn1njG3v8=
X-Gm-Gg: ASbGncs5S1ZdX85tEw8H84gm19CbbYZV869HmHGJsyvL3vox0z+YXaHx+qinxAUWewS
	UwgLUx6KGmzEegR/nOZRca8QufeTrwval2a8udoRk3MVc00AYZ0SkBZdXJ/ms/WYP+ixi8GYtCo
	IuAeDAlnQXbTsb84XPkvsBmJzR4fUn3CTy3D5jf+tRs+CaWnp/DnwHRu+ymqy7CEkiI6R2qVuGJ
	7eyBSZIKq16L6AcgZXSv6JuBEahJ2ktT6YreqQsNzZPuLFrSqejpobvm+bJ0AbyJJykRcmqxBCK
	BWLXHXJKXdnh17aIUY0NlWKENhV6cuI6h07HhrBAd8lRbIvX
X-Google-Smtp-Source: AGHT+IHCWOO0RTjiSPCdhaAdwwAHJp08f52xwZ0fQJ2PMKUV5lH+ZzCTORm7kAFQ3aUAQ3rCpIsWuQ==
X-Received: by 2002:a05:6000:2403:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-39cb35a9bf5mr10149672f8f.33.1744010292920;
        Mon, 07 Apr 2025 00:18:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/7] iio: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:18:08 +0200
Message-Id: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADB882cC/x3MQQ5AMBBG4avIrE3SUoSriAU1+DfatNJIxN01l
 t/ivYeiBEikoXgoSEKEOzN0WZA95nMXxppNlaoaZZTm3cPZA56jXBwSA44X1Rorpu56vVIufZA
 N938dp/f9ALfLZGRlAAAA
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AxvTgPG/08SVbPx+P2b7i+Lqy2PqiHtAE+nknCQ9/HA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wyiF9eNcG9pcYjFYXO0nvnqmICDBdUhsLGF
 tiCIVJqOKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MgAKCRARpy6gFHHX
 cr01D/9cBNJG8dIVi5vVhhGlLzoHYUpOqFtbUbaQ5D/RgpGGyaPBptye2CxDZ4rXCs0BxFL7Joi
 9D6ZZgQX+7AIY8sHuBmMgGUL1Hi5kBq/JKE2RdI9wZAGn+7z/eGGzJgpcvzlGkH8S5N2HnY3d7D
 OgOyfjkd0CFmRUTwd5Y1r1nP/RoNE63WosR/RTbBbs1C2emRU8McPxg6sz0fy4UbYhZil7RGybt
 V8Px+Wpjn+f1YcsSKWLcP6hv1uPI9Luze5QMDK+GejkztK0Bgz5X6Kw2dXJQw7EN5dzN62fIgp6
 MXZG511YXRFxmU0P+9M26/Z0Enx+/7MXQEZYAz05nNGeDi0mj6hUMTnVovAITuUJAmpkLMVywV3
 El3bnX9Y2KoQkZ7LunbVGuWOP63jsdq1rk5+DqUbSo/AFySfD+6LgibaFiGn31ZUtJ/QbXK7qxT
 CohpiPpx65Ki6vc9y/8qHaOt0lOCMVwyVcJrXbz0jsoTe+Q10kVri2DxbNVgc/VcQAd9n/eqk9m
 jjt54ZA2Ehq3+ybllfeybfr3xiRtkp6ZpVxSvQngz+U57KSDZ24O3QPObQIwNmGUecRacSnXBQP
 62YwsaBYqIeZrezcMohXGilqH03MXeVnEt2mCoJfOVAZUg97/5590ulnDagNJukCb2SaPSsd5qT
 sbCmCjMoDLrg1Vw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the IIO GPIO controllers and also contains some additional
refactoring patches for ad5592r in preparation for the conversion.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      iio: dac: ad5592r: destroy mutexes in detach paths
      iio: dac: ad5592r: use lock guards
      iio: dac: ad5592r: use new GPIO line value setter callbacks
      iio: adc: ti-ads7950: use new GPIO line value setter callbacks
      iio: adc: ad4130: use new GPIO line value setter callbacks
      iio: addac: ad74413r: use new GPIO line value setter callbacks
      iio: addac: ad74115: use new GPIO line value setter callbacks

 drivers/iio/adc/ad4130.c       |  10 ++--
 drivers/iio/adc/ti-ads7950.c   |  17 ++++--
 drivers/iio/addac/ad74115.c    |  18 +++---
 drivers/iio/addac/ad74413r.c   |  28 ++++-----
 drivers/iio/dac/ad5592r-base.c | 132 +++++++++++++++++------------------------
 5 files changed, 95 insertions(+), 110 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-iio-b064ce43791d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

