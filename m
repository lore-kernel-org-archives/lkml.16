Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3D84A2B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251736; cv=none; b=rJD/fKVYVu5ExVskfjM944Hgg5H1oCvBOv3pbp7g9tmibGr0a3Lghl3HM2o77qAD2he6+SGNuukaHS+zFstITehjTA6y3WlYIs3Ma5GjaA2nYEVuN2GTiSJ0K5Qh30Ngmu7RTJYI1SyH9NLIPBHAdzazhUjeKdfjPqtuHDVtrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251736; c=relaxed/simple;
	bh=hccs/FPXaY7RAT+ynuxuHb9c9hF4RB0vDaqzG5iDnIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=an9yYo7Peu/Xd8Mctk1ArCdUiPQMEs8QoKhLRNwjC/sPuKwgLPYVrqtnsFpE03zUX3cIHNL42Wxswbdiiq+Eihmu7Q9wliuZf38/pzpI9cLnO4RfZtLhwUSNK96SKcxntzx4Me5oqK0LiwyBV4BAX2iEPTsnTG1LFGj6x17DkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c3vpXc+E; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c3vpXc+E"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so454508f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251732; x=1750856532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=c3vpXc+Ejx07D3Ro1DWhnXQgkRENHcjnadDlFvopQw6OBmGarmWDcKLSFV61bTT4xE
         8yC1ISu97qscGzLNAmAxWzJ1rP3u1LEwkd+1yThS3JvqQXA8b61NU83k6S59oz4ielNk
         AiJCMW8F1JrvcC9kwy/0dsRVuQOMXYLMVoghMTzPwVA4GRRbodSXCjlIw4hwZ1QOCnTM
         rrwQB7uXc+qVSTLQ1sYlS6Jmq0+kMYgIVKFim8WCfiL9bt6PRDYLrHfX9cF5dFYtUtHZ
         bZ/b62Cqiy7mu8aALk7EUwO4z7s1rsqHVYh2bbkWP4cg08cicdbhM9HcvtVHX0Y7WGrX
         XT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251732; x=1750856532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=GdWGLrVO+HFt9M+W6RYLqEnuQNZuhaJAY551jZTFSoypQYBacY+jn5bOhWkiGaJfix
         joAfZtMhO/P62HpsxtTXT++SpXWf7MDhefE6szF4qCjsSKrSUqDpuFUlLKNavvusAgg6
         B+pbkVCsMlqAgCdwlBVUTvVcgc2ZLDKh69s+QJyx0wRi+GyfzOR9JXcyBLwqmET/HXb1
         et0rmnQhQBMbIz10e0+rJY3wscmsAUjiWtVIQq22eX2kHEwfsyXvq0wm6oNcQrZPbh6T
         Vb/nvnNu/665BDB69kNo3mZgjK1cW7SKdPG6qcIGufIPJxCPdcX8LtUqQhJ04HYkiv3y
         O0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXkbtcdPxGOhD4VM740BlrqJqTdzdMj4ZbZlutrLJJlIYFY6kx3MqNtAHKgY9b/XuvS3lLcU82tf2tXuEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75AWwppYKS9vCZNFY40sjC/yrJkHijS5AqvwxXM/IOhiu2z1K
	D8YTtaZFZ5XQ/raeKpo1QTJDeI6X6F3fG0lCU4ARcOyTB0NS9n/+JQa+/jzRoFqwuRU=
X-Gm-Gg: ASbGncssk/UeskTJt7EcVVxFCQBEvxOQZ25OswfZ2AsCC2d84i85sz9Gz4kQ8s0dJOP
	Iq0B9JUKBkOmtlRgWczkg8NuHk23dG5eRwYK2NKCYHPMvEbJcuAeRQEBuOnnBRUcMlA6FWISLX7
	B8a3RrOamHbUuQNvkXDK8uUxrlDRQXFtTawDKdXfchUAc/Ifh4WJBAnE5SyjMtiE2enndVJVrIM
	q0SN40TJXqQy821jWUFO7TBVSaWvcgICp6LHck95QUAn0PzD7+dcMQzcfy+nXNSq4ZzFpyAB8Od
	zxogI02gtqdPMuCguQd2vue5vwVFtqzx0EPWL4LcLi/WOBNnL4Gr0FW/TWNUU3pmrw==
X-Google-Smtp-Source: AGHT+IGyG6czM+NA4DL6DPDZolzFgEkYLp4uzIqdLlHk4uIN2olygmeuzCIqgpbNsdJHz0t3ZLd8vg==
X-Received: by 2002:a05:6000:2209:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a58e269482mr2168586f8f.19.1750251731670;
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO
 chip setter conversion
Date: Wed, 18 Jun 2025 15:02:05 +0200
Message-Id: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM24UmgC/x2MSwqAMAwFryJZG2j941XEhZqoWVilLSIU725wM
 zAM7yUI7IUD9FkCz7cEOZ2KzTNY9sltjELqUJiiNo3tcLvkxONQrPJg4BjZIxFVRO1kSp5Bp5d
 nrf/tML7vB3m1S41mAAAA
X-Change-ID: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hccs/FPXaY7RAT+ynuxuHb9c9hF4RB0vDaqzG5iDnIM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjP1wth3l3y0b/dpfsvBR3ga26T+3RSw3vJB
 x0kbg9Jlr+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK4zwAKCRARpy6gFHHX
 cigrD/wIlZg68DQPUb/Uxwvn20BPPVNFSRmkO0ONhMjRxA9Cd5z9FVSELIqeJNcLmMOBgKKTrcl
 uUzpGdafOJq/2I413tc6QwR3r+VZdpnwxIIknZbn3z6XQjh93IPRQFA/WN2Bs2EodH69CwwXpxe
 0KSN3WZKe4N+fjCUA5kjmFbu7TNarl5YiZ2svHzzMosiyvTgdtMsxYHG5YwRPdfVB8KT32E/9c4
 3Vkj7Bp11lHQwPBkiZ6TU87k1rCNSMiboTHpWphUbc1a+Kt+gOOa2StXKi1OYSLVevP/TsF+fUR
 Bm23qRH6x1jOyUTfAIPiabWKKlwA0lrsJe4QpnSTeEPAZUWuLehTDK4HT/4PS8K8fCMZZhlZmpT
 AIIBZMua28rtFBDqAINXCRHVBBToqEUTNvGvpovtfRvL2CPhRNb31ZITYlKPhcClO9K7SATr2W8
 4REqdSa+37GH/Ej5jdTP8Rhhg58AoJyoTScoLrehje5gsaCBZ3wTCUtRLNnAR912GtGEYEAupJ5
 7BArRUYRcXDWX3Dk3mtJnOTtt39agcOSMvgpeFYQkeY0zQrtjgOQzQoQFOblmyHUR1a/e5kFJT+
 ZDhXeF8KVdg4YLstfIX58CZ1Bz1pOII36vTQnzQP0/a1+U6TuV5ZTbFm22S1Ms7pa5GrQ9dMgDa
 Ezax+2FfL6QSn3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I should have paid more attention when doing the GPIO chip setter
conversions that there are instances where the setters are accessed
directly using the function pointers in struct gpio_chip.

This is not optimal and I am making a mental note to track all such
use-cases and use the appropriate wrapper instead. For now: let's just
fix the issue in gpio-mmio and its users as well as one other converted
driver that suffers from it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: npcm-sgpio: don't use legacy GPIO chip setters
      gpio: mmio: don't use legacy GPIO chip setters

 drivers/gpio/gpio-74xx-mmio.c  | 2 +-
 drivers/gpio/gpio-en7523.c     | 2 +-
 drivers/gpio/gpio-mmio.c       | 6 +++---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 4 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 7b20980ffc11514d8849811857d915001236bcfa
change-id: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

