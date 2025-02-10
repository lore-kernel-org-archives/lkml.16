Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B71CAA82
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184729; cv=none; b=Ro23qvnfHaywgcKvgL6HOpzoJbjyPA6byCYYME64PmBZEL67wbsMgYwNF1PjOhkxx2CSYU+woHBR8GAdIEVgbRhOw3nBUhGa9OalbG3ISAC5ifKSgXCLN3r2xEQAZdT03fKlHdd3Bv5SGZeHCIeH717uDYEe+/UbIJvsba5MMLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184729; c=relaxed/simple;
	bh=BRWGzZuvtmwXMmkURqAYnIS2QtQklPosFB7K+YfF4t0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hdt0uj00WCuF3P5iT4KOlaCpeBDcok9b6CeHW4+T6TynP/yi5r6ICqZJ6UYYsG2ToiycUamPTGGqQZp+NuE56tcS/zQSTnU3GO1HZiUWmlKiZXCjoYrYTZBic0ptn3I1+gP/vc4mdr6tICiTfW63trIseqwfy8eyS+S3NJwl9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kMvbcLL8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kMvbcLL8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd91c313bso713010f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184725; x=1739789525; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=taqCovvHhkJXcdGrGiJbuI0yrUJJAsTV1+7Sh8JSxKI=;
        b=kMvbcLL8oiwm5xnbKragiaGZYowqI7xmVSyVc+/TZ8bjSVYGa6p9mFTku5Ao14gqis
         c4T+DNGeEL7mKlbKEfXXUkqU2pgnHCpaRNWbC053UUtygvNLr2MhHL0suy4zL3cG5JYW
         CTI61ezYP3xerGcoKecXZllYqLDmHQRENqvJScd/dQHV9rznD95TarMvDMMcnHLCJUtF
         Bk4Cx1lqXSk8uCJo9euFx9szsSnRhyPsVVwe6upWCMt5sbpZNCf90u1oB40KFAtZpDXI
         upuhqtIriEeEN6awiclIgiy0uIrhwEe43gTky/HsueUcWUByhcHfKpkf2n8AvDELDvfP
         Krbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184725; x=1739789525;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taqCovvHhkJXcdGrGiJbuI0yrUJJAsTV1+7Sh8JSxKI=;
        b=FAs8ZuAGWrZHamx1hGc+6vP11hc3rRI+9kQFyShL+r81tiiuZx0RRUG3CgeIH4xTmJ
         2QghZcJEm252qmci98dADVSkUcigxOASdZcqlPHYzKUt4O/bagbbljr3JazFO2Fr0m6T
         +cN/ZdZqnNi+mnio6pcHMyBDy10/3dwrdfiUY84nWpgS+FpRjWkMXkGEpv10cHVlguAF
         aKygnFEHvb8i6CCjKG7W9fTZqTof8tPT1PXTx0oZrLT346gCh3k6q+HgB4/j0Sm94Rfo
         GIvckDPTV7qng/xmO7ICB3sSCWdFb/H/Db8VzIRraCQVfeT6nUo4KDTN3MRxxZZFXp1r
         CpZA==
X-Forwarded-Encrypted: i=1; AJvYcCUr+46ciBioUXfSRlwRtFk117XS1+N533IM8Bd9qxBaqgCgmSs1HBVzKhx0zksZ+osxQXMVT3i3p8PQhVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOYC0FqKWUK0xRiwbabHk9TBqsSnJNVyFWc+NhkxLV0iaGJwh
	mK3M9cUahW/otCn/xSM4vVB0Ct9RdffhFxKXYQTEhFGBe9ClBlDRUszxdHvEd+j9mB+MsD/JPv8
	G5k8=
X-Gm-Gg: ASbGnctE7WWtRqr2VaZaKCgCyqGSW0ygIRcZ7M3XxUe1koCmfJBWvTVx8OgR1Bn7Inv
	rXPpP8JyO6S5+IvfSxt5XfOM+9nFgzQlwORZy4SkE/nrWBemqhtOtb2zxs19UvJ6YNgLZPyOSna
	UeL1nZzAF0uDatvqkhUBCxkZFfxzyuTL7allV2CW+aMBglm+u37hlJQmIfjtlzLvOIW84kFNx0G
	QCYHJ0DL+HXsUU/kbdJG1eX3D6YdntAHWpz4YKJ53ZVJU3ivm041X2OmXQg0jjjncne//rxSgG2
	Xc4RddU6
X-Google-Smtp-Source: AGHT+IEObKpEn2IXGE5elfd1IjkU00GQGmFnrEcMXX4gngYVYTAaxTnLD0yHXcRDG4uysFv7rkTH1Q==
X-Received: by 2002:a05:6000:2cf:b0:38d:dcc4:1dcb with SMTP id ffacd0b85a97d-38ddcc41f13mr3724665f8f.2.1739184724887;
        Mon, 10 Feb 2025 02:52:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/8] gpiolib: sanitize return values of callbacks
Date: Mon, 10 Feb 2025 11:51:54 +0100
Message-Id: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEraqWcC/x3MQQqAIBBA0avErBtIyYKuEi0kRxsIFSciiu6et
 HyL/x8QKkwCU/NAoZOFU6xQbQPrZmMgZFcNutO90kpjyJxQbOSDb8JCx2l3QW98T50bvBkd1DY
 X8nz933l53w8f7BbNZwAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BRWGzZuvtmwXMmkURqAYnIS2QtQklPosFB7K+YfF4t0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSztjr3HpEnbCi39CQSGhQ1X8sw0XA8NyPo
 gMP67Cl5q+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cqFHEAC+U/HsgiKk06+qg43gmHNzU3lYq0XOFpDxCwsFvKNhi6QP3wHzV746Tq/Fg2zRCy+yQ8i
 fiHgJtd+E9ftUH8EbQ/CGUhP1NkYIUFcYWvmru5oqORunt/4A2dqZGRzjPQYb2psa+e0SQ+tiJj
 Qzmh/GAcK6NA0Drk+KmByaOb9kLPvS4NaQaKxRssW+6LhOf5SW/5Zd8LNfhMzVeq4s4/2jppEhg
 mG559jXOeoA2Au/mlSfm1gmXGLxlDh55eFmnKLGiIHBSo5D4WKzCiT06Qix4kXxSY60LPzG1DMX
 NhkBFmk35VYgGjNE6LxnpyZ14ETLFu+KpCgU5EOHt4N5F0WOL2JV3LMmyTKCRvsQlJQIJm6j4bf
 3aXpy6V1sIffmZrKuutdToomjBBCmOZQo3UIk6jgxriyv10uIFYhlPmA7bM2YC6D+nlQm0tUP6m
 6tirZtGWkppsav5yYdQvtZirbDrMulj84xwxBJ5GWjaph7/fOP6ojk+gwIySG1V6AJr6MudWi1O
 XSjN5p0sucTbZLVwsfmvmYhgi1XGO1VLKC44UNOz8xqH+CdiBPf0PUHZKyTkiVyus7Dd36Caqmc
 N2S7InL1ae3aD4DUgnw4FUV729Kyn7YMbFR8NWgkHHaI6qpE39xF0rMJdSiYoK8/Q6cyUJyE4vl
 3G94wfYUyeE5cdQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We've had instances of drivers returning invalid values from gpio_chip
calbacks. In several cases these return values would be propagated to
user-space and confuse programs that only expect 0 or negative errnos
from ioctl()s. Let's sanitize the return values of callbacks and make
sure we don't allow anyone see invalid ones.

The first patch checks the return values of get_direction() in kernel
where needed and is a backportable fix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (8):
      gpiolib: check the return value of gpio_chip::get_direction()
      gpiolib: sanitize the return value of gpio_chip::request()
      gpiolib: sanitize the return value of gpio_chip::set_config()
      gpiolib: sanitize the return value of gpio_chip::get()
      gpiolib: sanitize the return value of gpio_chip::get_multiple()
      gpiolib: sanitize the return value of gpio_chip::direction_output()
      gpiolib: sanitize the return value of gpio_chip::direction_input()
      gpiolib: sanitize the return value of gpio_chip::get_direction()

 drivers/gpio/gpiolib.c      | 144 +++++++++++++++++++++++++++++++++++---------
 include/linux/gpio/driver.h |   6 +-
 2 files changed, 120 insertions(+), 30 deletions(-)
---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20241212-gpio-sanitize-retvals-f5f4e0d6f57d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

