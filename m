Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8B1EFFAB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398551; cv=none; b=R7uLu/mxtya1CgnT0bGI6JrbrJvo8EwxK2ci8vIuvYeFfeFF/8VhOVMcZk8ui/cFOwtIy8BwSO5aCq2LTNydlAcROUFPhWhvem1c+kNrOPLCqXOF6x4wX64hW5GZxLjYwfrd8iLHSc4fPS7nkRajWpEyX2BpbCF1NSl01MkyzbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398551; c=relaxed/simple;
	bh=R8ZNwu5x168vpV/MCptUTwqCm5enTGYy8Br+CBDDLqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Iw47TXxQjrVdnkZwAqLw/AMupYq0F5aM/1AwDae6Nz2nlq24wuiujY524ktasOdvphgOwZt2NahcDS9uQoO0pgxElVqn2j7hIiyy7rSK9NNK0iXJ6rfQK7ZLXcw0M/0DnpCtqOAABUR9ZCHS0pKJdBdaCrFbL/14GeUT0JSql8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C9EehWtc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C9EehWtc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so44767725e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398548; x=1746003348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZZT+RjnP8LcrwMxAWFd3uqoJkvxMjDmtxoYeFys9Lo=;
        b=C9EehWtcwdTKoUgG9wg0CFiy0gVskhD+fcwahnKJwDJrjvHJH0LeHTkkN9PrrBWWps
         uNDLFhmdaQhQr4L6l+EVrPWqmNVFOAxfbSjGYFyvpEp57Tcoz339H+EapU7xiDjWOx6l
         FIudznRxkxlrO/NnAriN7j2cuG2IcnuwzWxflS9z0Yx0rkXYHbi8E6H9E0YA/XiNZicl
         g7ycZHiC34hPpEFyQQlK+ERS7YjxsxuB5St7Hfs2DsW34+GhmfhLNWM81pWG2KBvw5ak
         fUly9usrBYyf3Y+ma4tzyBiq9LHzUZ2L8FnlRIuGfkV3qh7KZzPkIGL13F2u5KALaXOe
         u73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398548; x=1746003348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZZT+RjnP8LcrwMxAWFd3uqoJkvxMjDmtxoYeFys9Lo=;
        b=S9K/l9BwoKH1940thXG9G/uQN/5TD4Ks16ifaHuZ52IBQ5tQya9IiKTw+g0dMxifHs
         +ZPZMwkub8L381OVHA3/gheifkAO8CTNj3WzmTR/7/oMfYiqKgidD2McjS5MDmGYrsFd
         NvLnQONHqYdeXFm2quuHX17C5dQ0svx+HY4j6I5UeF9/TaR8bRDRja6b+hrz0KBoyodE
         +gNy9juOrooEOeuiQS4kQzkpapUPueGdtEoBbSwwiN4vypNh7ZuSShEuwoyM7Lbjobc1
         YzIa/lV+P1xv713vmaD2te4IOQBZ6DzQ1kf0+VCxnj1u13rnbLznQi0wmOpF0hiamWD+
         hWJw==
X-Forwarded-Encrypted: i=1; AJvYcCU541gDSY8pSK4Ca+Lt1t9e4LmtlieilU6HTLVU00Tz9hx9oRAbZNoiOUqjd2dZ/2qwFTL3x8kRg/m6T/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2+SvtlGv+jwcn+yZ8olsSFAeuUFmaOnucy+1IN/4PyO9jC8H
	69cF2wb685m+dr2hVEvUziUhakiz29ZcpUy4ctbqakxwtXs7rkV7Ejfkdu8GNZHVDJlXV30vyEH
	OyNE=
X-Gm-Gg: ASbGncvu6O9FrZK4xMVT7sg/QrI+CJE9oLuvqx0/7PDhDekcQ738TAMjUB0OAV7bOEC
	Djo5PZBV1UOMpKMDQUyNEJrvBZcyjJkqKhIfLvEorTVP6VE3wPuXHmD0bvMwrFQ2CacS/8LkOjy
	NocIfqkVp28MYiyzSUxgIvp8aUpHjokacYwj49acqSx1kL0mPaTPFQsIdosYzMXtwi3BGRhYSif
	by/y1QRfQVHO7KirYevCzRgKzE+Hh29joVF6YRIAmV00Dnj1gdoneyZVEMqmFHgkGAxNNrueBHW
	tqL43qmKVh0TEbRx2iQi2JpxznRgexuqiA==
X-Google-Smtp-Source: AGHT+IF6EErb6GE3RICZulpSyKmwq1CotLfCNrXTNCW+UYhDDpcD9ZdcThz8FNdTVwmcgfhO04cX1w==
X-Received: by 2002:a05:600c:4fcd:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-440711cca44mr165848615e9.10.1745398547694;
        Wed, 23 Apr 2025 01:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] hid: use new GPIO setter callbacks
Date: Wed, 23 Apr 2025 10:55:38 +0200
Message-Id: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqrCGgC/x3MQQqAIBBA0avErBtQM4quEi0yR52NiUYE0t2Tl
 m/xf4VCmanA0lXIdHPhMzbIvoMj7NETsm0GJdQotBrQJz6PwAkLXZhvDGxxlkZOzmljDUErUyb
 Hz39dt/f9AEJnbPdlAAAA
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=R8ZNwu5x168vpV/MCptUTwqCm5enTGYy8Br+CBDDLqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsN9hyTCku5LqR/IlguLY3GIMFRc3HrEOm5T
 ZsPtM+1kZ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirDQAKCRARpy6gFHHX
 crrzD/0SCyzMiqdqE+nw6rTvJRdZ5WXXgndasY9VsQbcZdK0uukujFQ77zX3ehRhKnRdwNlCsuM
 pecxSljUwVe5TrDyeGfUOGSQ4MkF8/41a7+GDPRRlrNBTptUIPtsxzi1QjyYcRS0miA5/ISnpMA
 MVdjz5EbMqwvJvr9+0LWS/Qsb3ig2pjJxsrK67KDeemGd3EGx4BaRTC9/UIptPr/MLWVxwNEyc1
 m/5tayas+TnR29RaDegwnpVYbG4CDiGE14d8HyIVxu2YSA2afB2aF3T+4pdkYkLyq8gTK+V5y/C
 tWBlHNWoc7rkfnhPqfjUaC8xWzOUyzI5tTrZ9YAiu7fJXiaS7kW6+KLBHsTiMfsZDTXUZQ8dmLW
 YFcdGMsvrGhKfcgwCRaYNuTOzQErWR0dGw8IzmDPQjtOULzogMFO/GJpL7FHpXEPDCiCs90KIRG
 L3PrS0zJKWK0mbdMYSuPIvQEuT7W3dO3bs9e4ZAsE1ro6Zsj0/4uyqOxpm4KzXZqgrmfMb32EY2
 gFwIFrBN62c5g+3FPma8gM+EhN9dBnO/Hg3iqxg6R/9H3fs2luDhrWBkNtHQqbgvKqX2ZMV6EnZ
 rZZ8Whzy4g+Yr/cUDbm4RnpFED77Wte3H06fsIST+fMjBcU/l4zCw0Da7NJ/xMvsJf8YvUkAw5i
 CwQSDBI61EULyCQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO drivers under drivers/hid/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      hid: cp2112: destroy mutex on driver detach
      hid: cp2112: hold the lock for the entire direction_output() call
      hid: cp2112: use lock guards
      hid: cp2112: use new line value setter callbacks
      hid: mcp2200: use new line value setter callbacks
      hid: mcp2221: use new line value setter callbacks

 drivers/hid/hid-cp2112.c  | 66 +++++++++++++++++++++++------------------------
 drivers/hid/hid-mcp2200.c | 23 ++++++++++-------
 drivers/hid/hid-mcp2221.c | 10 ++++---
 3 files changed, 52 insertions(+), 47 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-gpiochip-set-rv-hid-81b17ff4bdbe

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

