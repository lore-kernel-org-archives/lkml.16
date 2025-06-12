Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47435130E58
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730802; cv=none; b=hXfsbcJYghjOiSZCKormHxoHowdUhJ4jD60QZcUJbVmEkPHFvkYpPX/hIP3QFuVgXAvn9uUTOMNKDHLMnbM6gW1CoXyjy0uUppxOaga7PTGcTHm7XeZtlS0RR6OeLXnlYzcC//Nwtt+eKbfR7CkW23jRcvNJInYkDiuICirzdT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730802; c=relaxed/simple;
	bh=kJrff3jbL8por8Tpyh7XxSyhDvy3zxp3BXTzZOi6P44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z2OKRaCXVokJ5rj3jyyloFMYLdwtYf86h800RUIRJ95h+PgMLYT0AUqYmB1zDkMd50GLFlXzBUi618RMBXnWoZbIJAGqIco5HHKIZCbPytYGakD/AoTvE3UG2g1Z8+IezLUUCxsspMPeeTaFsEkUtKor7/UpaYoHZEE3Gh48Z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D1Yji7qa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D1Yji7qa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so10882725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730798; x=1750335598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqDku5tmeH7VBmpeni41KVYBYrcGjn2Uv65bR/FXI+8=;
        b=D1Yji7qaWRdRwBq4I8Nk2fGXGc2NL8e2uZu2WZSVzoMHyKkoD+Vc4cHoxLFnl53y7f
         BFwpX3lZXKtSGouVNLxeDoy5nHc9eWPhHKykCjqUJky/pjnppQeFWFRpk7DZFxKN4s4S
         B2LfegavI5WrVThGM//gCRZjUkBcV4fqxlYp5O34wT1zgVPOKB4lsOG1Dd2AY8BeVxOR
         rJyDyWjhhm4fhYugPM6tB/ujIhMte7R/wzOzlJAkeqCY422Ei4Ps3h84dBb7ZCLt11fC
         /VaU8knDXjgSqLViI6KiuU4Zd9EnaHNjLgdItOy2/zYAlZE7enEOKqedKKY0Arx6WW3n
         +SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730798; x=1750335598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqDku5tmeH7VBmpeni41KVYBYrcGjn2Uv65bR/FXI+8=;
        b=gVPK6LXhA8yHXeazuHh5wHoc0jx+QgHS174XgUVtiLphV6WjB3uHTWiPJXQzfbsiYQ
         SjYhkwtkftyxpmfb8k6XHW4z0m/K2JpGF4IkY3KPxPqLxvuMGsqEU6W36iq7EvpwSuf5
         quTaYH7yWDFJ8aEE9r5lmeO4M/5ipl+LYER4GJCu1I0FqPb23VOV5Ij+pF9zYO12S7/P
         5mlH+eMrp0PhX9ftody0W54ZlpPHoZwhneYJ7dmTJZ8PdejkeS8m2XkFnuJxCAkUc1fQ
         Ne07LxsuH4sx0rctW0yvRol9DrcMImJTRgQWw7vYgLppGUrr5bGp4vJZapMMkyOIl12u
         owGA==
X-Forwarded-Encrypted: i=1; AJvYcCWnibc+s2HOCCKGXamzKwV/yrmaYfwumq6rgkXtG7BzvTrwXwnuIaNJIGwbWFsL/EuXKvhNoxs3o+voNaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgnfEPZS4GUjjoMKFTvb0zGEXf9kPxSX3/h8pficBVf21ZVAw
	kxDi1WcaW6fijC8sYzCy3XLxi0HPALmOMUzqekY0bzpoZ6AIsHNEOHBBNw935kFYq2A=
X-Gm-Gg: ASbGnctltljY3p1QG+Wub7gFPJMpwL8dejwLwa1LaQS8cdrtYEbSN5k3sRPG5Y/9/+j
	fqH2vY8RwkvG/gH3ItgcA4UuXEwTmLg0gB8nCUWgjtI8m/r1OXTXG9a5rMhXj+RIcq54+OdZKDX
	ax7eBAvF3z5PitPGik4TNY/M0lgHh8t/boDfgkDPsRimrSaZV05mCWS0VxGB2HWVEj5F7US3nip
	r2qr35SSipteDMU3r1kib1hsDKfjhi/mjlYdJE7ICb9PTmlawz+9tuBNxPCjcOFq0ctPl+IAKkB
	TKoemt6Pk661Ingysveuf7v42/owGANoY/O9RpJhLuOPhxNqoELtz0np
X-Google-Smtp-Source: AGHT+IEcc4368CEgerXypRH/60FtXqn6RdvTllN0y6+FlWWV7W7CliDcgoBQka1h/OsUnGpe+1tckw==
X-Received: by 2002:a05:600c:83c6:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-4532486c53emr66764545e9.5.1749730798475;
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] pinctrl: cirrus: use new GPIO line value setter
 callbacks
Date: Thu, 12 Jun 2025 14:19:52 +0200
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjFSmgC/x3NQQqDMBBG4avIrDsQIzHQq5QuyjjVH0oMM1YK4
 t0bXH6b9w5yNajTvTvIdIdjLQ39rSNZXmVWxtRMMcQUxj7yXLHKgsquG9vOFUU2+7DA7OschyG
 NOeWQRalFqukbv2vweJ7nH2Kr0FxwAAAA
X-Change-ID: 20250612-gpiochip-set-rv-pinctrl-cirrus-2335675707ce
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kJrff3jbL8por8Tpyh7XxSyhDvy3zxp3BXTzZOi6P44=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXpOXy+LPZCy25UzB46uu9Jfgc6bYrd209b6
 2WEdmPciuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF6QAKCRARpy6gFHHX
 cnr+D/0W5phOfwIzIXQ5w4rBcur8QmFg3lr7rYE15YDOs5OxGlUgbtQzwRcSQKXoWgOy68+M0jG
 G/qDNaxNNYpPWLjM6YYqpiRZCPW4JaIMwr0wbBClVjW0jucCHl4TMkCKKL52s7w1iVhtWm7MLkB
 pwsMZpzsmUJgwzkfq5I8yi8Halwwiftm2XUxU2KzLqMmqQqmcCaqcH6dB/I+7OXXD7KR6fLfb55
 PxnfC82VSUAFh2o8s2ZauD/a0HrB2E5LqXMK6X3qGpOyQGh8CR5ijTkGcHQXRxnyPJus+C5SRDD
 g1nfhDK6rCcqUTkO1fJkd/z7TTYbmm5xuSvjXBkgTo/OT9JQhjJhj6MWBrOYwaAKPHzhV2+T7jr
 6TxsRs1bmUY1LvUBkLz1eNUrlUjedlvCLlq02+p3Km8qTcbi5knGNLP2V/fs18DRsSwdmsBRnFQ
 zopndNXJw1EyhaNJIOKD869u+DgPDtOJGNdm4j1/3uP3Xyuqe2qXL7HC64g0VO9extFRskOLBoE
 bZiXsY+Y9rHReClvPtc9QFyvcuxf0DV5Uj26CrCFPKfQY835rpTPXk/sg0ajjjEdrQOT0qfDBWi
 Xz5Tl5TplI1ft6CxLpWodvBx1RESt0QPD66LZbhb466kn53uf5oFziu1VJzIkGo3O9tJnM+yaYD
 gDWT5ioayc4evKQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in cirrus pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      pinctrl: cirrus: lochnagar: use new GPIO line value setter callbacks
      pinctrl: cirrus: cs42l43: use new GPIO line value setter callbacks

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c   | 21 +++++++++++++--------
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 25 +++++++++++++------------
 2 files changed, 26 insertions(+), 20 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-gpiochip-set-rv-pinctrl-cirrus-2335675707ce

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

