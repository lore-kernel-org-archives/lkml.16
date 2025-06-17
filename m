Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DD2DE1F2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163085; cv=none; b=CkwAHudGUuPCDLn0cvNKRm4DyhHYEoMVKZkiv3SDz9JWWgmhi0gX67qOz0fSsaNOEGnVBY4/y2IMEF8Yl1LIx9XtmLYEO6n/JZSIiiu7AFp6cY56qJq8ovKIImJrqRh4QxGkuJO6Bb3/odonW1gsxP/DChv2PkAuNJ7mLXRqnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163085; c=relaxed/simple;
	bh=RLnOLguCkXn77LVyLm/6OTIhPoN1Dit0JrVu41r0fmE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h5b4b2cYVNNFwzRO+q666oENdnlf0AwnBDnVLoFLwLSeiJjXMrv/5wBxUywKld4OclmndfxjgDoAheRE9AF6RxEEfYINqymbvMmeKy6OAC//TXUH3jmaMpOjMs0TaIPCbvzFZqGcjNCGuL4Z8coazfBu+Ua4zobePuo+/K/rQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=14TsZwo7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="14TsZwo7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so41871755e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163082; x=1750767882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=14TsZwo7h6IHJWTxNbzEne4QAg2lcq2bbDoVi1bIwDQ99X0jeI1Fvb793dsNZHyZja
         mUw34Cf9EZNbMT7tdPbAWssA3LBKietfZ0FObFCO8HhWWfAbZ3PTfBVRlg4RYPU0U8q9
         3wS3nICrNOvXb7Qz2gSoaYapdt5qvy8+ISb5NO3//tZy+uGUVBQKXyvU4VkSOfAmGb8F
         FYb40dfuhPIbTkE4Wxnag1togpxKje+UdxrmjCthyFUpZtyiHfGvlQ2UfGgOzvRBIGm6
         1F08tJs+JJUkI9B/TzcBAKDUn9WtmvlV9sx89J8ZmEzc+iCUjfxPLlI8KSCzGIk46qas
         cvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163082; x=1750767882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=xOO2dddePb3McdTC3+17VPdELPOI5X8BVgsPfshYy8wNGrUjN66uHOEgBm+pICcjOk
         wJhZXaYhQj5BumrJYKwqnyn6L8eP5C2ujACepOP51mD7A2dSGgh8EPeqa3GBvcXcmssS
         qWzVEeZCw0/O8cTpLIW54/vzzMnlv+AS3hqy8r21nC/qCIx25ArUgF5csHKHTdBHSlvg
         50mCjayZKLq01SnXVCddxWl7HixjVu5ZuA1bW7QVQ4R6k3vwptOsdAAYL3F4Hb6YTbp1
         fPPQ8KqPg2cHvG9gW/53pLafm7vtP/NlQrObUNlTmkyqcACTmBDLyRUkwBagwm0aaceJ
         h41A==
X-Forwarded-Encrypted: i=1; AJvYcCVRgbZh1oTD3H8/x984h3X1k9rjg1P0c6B3lN+wzneB+gAhYSx3IjrwFAQYaEIPuyDCsrPATW9jX51hcU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB36tvmUF8+kJOe4r63DWaK31KsYoI6TBTbPDr6qR077GW/n8y
	JVu2SbzN3+dFVSWvF53qZa2DgpYosFhvns5v5DGps8gKCim07bUersuysnD8IwydgiG/ipowVfV
	6WvRMQus=
X-Gm-Gg: ASbGncvycytByMpz1SX0Qku+9knADVvasLEwDjeXk3TNrKwx1HAQT+KvZyxJE6WWRzu
	Sel5kOWYeovkbeiXHpXLA4gJRMiEP+O/jgrP6EHATZQ3z3W+7mdYKpy2lcyn44qEjLBI2qDy7uP
	FYkcTWgRMTtKib0MYWs2c1l7yvaMz5OJtXxaTvXYaNltzHqAQ6InWpIjSmil6ksqVDTP5Q9aHtc
	Lu3VfshdR2A4Q34q68OeBwhHIoJEOdQTBS459hRmhG7x2OSNMtgk7y6mhEQ60avKZFJhx0/0cl7
	Fq0B7eaVHsli39KtX6Ck+FQk4Q5lhcmwBwcEvQ/Uh49Yq7lKziaNaYTk
X-Google-Smtp-Source: AGHT+IF+mB5SqbWQ/IXeYHMObyrSVvwo7MdGf15Ymmh88YebHVybFE0gf/vBSiFaY6F9NM4JITbNiQ==
X-Received: by 2002:a05:600c:5305:b0:453:9b7:c22a with SMTP id 5b1f17b1804b1-4533cb56708mr128208385e9.30.1750163081796;
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Tue, 17 Jun 2025 14:24:22 +0200
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZeUWgC/x3MQQqAIBBA0avIrBtIMbWuEi3CppyNiYYE0d2Tl
 m/x/wOFMlOBSTyQqXLhMzbIToAPazwIeWsG1auhN9Likfj0gRMWujDX30iSnNHWuFEraGnKtPP
 9b+flfT82d1slZgAAAA==
X-Change-ID: 20250617-gpiochip-set-rv-gpio-e1e864768942
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RLnOLguCkXn77LVyLm/6OTIhPoN1Dit0JrVu41r0fmE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6CDET79f1o2CbISvL3vLRy6ELTLtQKnb084
 knXSnThFB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeggAKCRARpy6gFHHX
 cpf1D/9lK1akx62CUxztvvy7rfND61EV2eVXetZwZCru69u+80k0krblUEs+OzEEsNomzQQjunB
 t6oGVkODsx9MDCHGMisesmtpssyc9U9ZL9/3Phkj46EdmTFQA4Jv4qP+XwlamMBQXIy1zf3KWOV
 Dx7s9uYPiEhyWDXW1IMHpJksogNn4kOOG9CYb7oZaaHR8S9i9Mujk0yqG77pOgFCF+oWy9cp1qj
 lYsB08HLcanT6fAWkXZ1Ll5rleE9+beB9+HKLi7p1Y31IvlsQ1/D67xx525vqjPeFM1EJ76Igl0
 /FnoKItV4ubW65epwmmWbi/UKTiSP+lU7u6zXY0eEOWuMkrg/uBakg7An2VYYSjtiz5w4e8LjPC
 r1eSzfsmrjHDC8HrNVwbnj9Ashn2tRis9fXAZ7+p7LodRjS6RLKebeav4NUPp3jCDyCGz44Sl82
 KxZktKjqp+0hnXOg2ATa3Ck8pHHtIgTiGXBQF/msz98sLdJq0YdtHn+9Ad2YfzcfYbTvSvq4WgO
 GRO30/0rIKexr/ctI8lBGNh/9MlBpeHFiEpr2CZsmCuht2vy38g0TzZJ8r0tBvYL39W2BdS5SEp
 kjk+/W1gC4lU3DDhbBHQVXR+laf4oumYx342Rjvm8paGhaf+h0T/XKk99JFDuDdPXicCCHnyKRO
 arX7wibv6dGhGwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: pca9570: use new GPIO line value setter callbacks
      gpio: pcf857x: use new GPIO line value setter callbacks
      gpio: pch: use new GPIO line value setter callbacks
      gpio: pl061: use new GPIO line value setter callbacks
      gpio: pmic-eic-sprd: drop unneeded .set() callback
      gpio: pxa: use new GPIO line value setter callbacks
      gpio: rc5t583: use new GPIO line value setter callbacks
      gpio: rdc321x: use new GPIO line value setter callbacks
      gpio: reg: use new GPIO line value setter callbacks
      gpio: rockchip: use new GPIO line value setter callbacks
      gpio: rtd: use new GPIO line value setter callbacks
      gpio: sa1100: use new GPIO line value setter callbacks

 drivers/gpio/gpio-pca9570.c       |  5 +++--
 drivers/gpio/gpio-pcf857x.c       | 17 ++++++++++-------
 drivers/gpio/gpio-pch.c           |  6 ++++--
 drivers/gpio/gpio-pl061.c         |  6 ++++--
 drivers/gpio/gpio-pmic-eic-sprd.c |  7 -------
 drivers/gpio/gpio-pxa.c           |  6 ++++--
 drivers/gpio/gpio-rc5t583.c       | 19 ++++++++++++++-----
 drivers/gpio/gpio-rdc321x.c       |  8 +++++---
 drivers/gpio/gpio-reg.c           |  6 ++++--
 drivers/gpio/gpio-rockchip.c      |  8 +++++---
 drivers/gpio/gpio-rtd.c           |  6 ++++--
 drivers/gpio/gpio-sa1100.c        |  7 +++++--
 12 files changed, 62 insertions(+), 39 deletions(-)
---
base-commit: f3763403a6bbc3a18379fe4c415bda899a111d55
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

