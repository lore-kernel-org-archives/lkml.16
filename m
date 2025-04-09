Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B525D206
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188049; cv=none; b=c2BngQgRstC5S9OHVk52SOvO83NLmgv2oB/2Ly/Wd7nfS73TjWWBG4V0OuFzXCxPUM5CTyhTqajyx3q0Dstjtkyvh7jspNNZMUL2/+OS3V+sSTLiAyvG/e7nWNxefYJUDizhq4T8WDoSTqoftMIHF3UkPnkxzJ8c9D5maQpDmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188049; c=relaxed/simple;
	bh=1VmSF1FsDxlYv2R/Yfi5O2efY79iuhVVKCImNUHwSDM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c6jGU8fbSHTE3tykO4lgpZbkSJZAafkdxm6eKpG703Dvx9mASKln6gBQfG8t+lHMvEcjxNXxSN+EClkDDTOA5uZ2iBZa/OrilPqodj8SgXgUoJNZ8pSUnRPYYsWwGNlz0yHZ7E1QJpFeagRUMjUOd1e5J4s1A2/F6+uUa3eHTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=idiVMP5Z; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="idiVMP5Z"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f391864so3569423f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188046; x=1744792846; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfgRSjZMirwP4A4DT85B9dRR+tHIO2UwmfqRGQoebTc=;
        b=idiVMP5ZxGM5uy5Lqg9/I8DHqtaXTshcRlICrYnn3Lc40+k90GSYwtAuUrjKVCiwlK
         vuWTA0dSZzIWBOOEfPbcYutTuo1BSNvoKTMROXtJ30y3vR3r655//VajQlPVo8mucsAs
         k4iXtcj6X5Senz+UJhUIXAx9TKf8F0j60MLNTmfSeqeCYaGpd8S+7rOdarUat7a+sRe1
         ztGJm6pKAF8kqXIxgL9boP8aCJS40SlBZgTJW7NOCjzBIlZOXpCpkBHCpUJgCA0X/xJN
         p4cbm2kBVx5xggm4ap5csZFIr5uNsJeNCrnSLLMR40LVxS1lX2fEtTHRmGW0CbX7HVFs
         I4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188046; x=1744792846;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfgRSjZMirwP4A4DT85B9dRR+tHIO2UwmfqRGQoebTc=;
        b=D6RO8ax1AqaBWVzGxKAdObpvAgpcqWUVOkIGIS0TlUNSxDuAum61pr27vMzQg4GZIO
         U4DLDVED5W/KyJ16pSXzaMlr5CuCImF3VxU1YUn+Qgzb2sHUSYBg6QXS2UtRYVZzdmGu
         1PaPxOQSHHBMW1nj+I5uto1G8Uw28blJp7d+GB/xxNwDOvPfs+P4+MvZtUzlc3XjpE2s
         I/7Uc4Om1Y+G9VDtdlDjqKbrmh9TW6FIz1sQXbebGTRmWY8nehPEeCBmLsosxLMrRa1v
         N8BEvAKvHVvrptojKLeV4sobKibbum6yAD5eJpPRbJCTrum0L9z1FDXuO4z9GuUDV0kk
         7Fvg==
X-Forwarded-Encrypted: i=1; AJvYcCVwYUxpjRgctf9bw0ADMVK+yNnSQjq66tUBX2Mcbl57Kh2G+4Ckr5DnzKNlCdugzQGTGW4Je4xY9vGE8Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzL+c9pBhiDpVJctXdoAxazGXbjvwdUkdu6UK8qdlz2vAvvGpb
	oddG5UunQ+24ZBLV9CetmSsTaZ7pcB+BguWmfmzZVFmoqm4iF9/SgIF+TBT+7CoJpbZzz1/R9hI
	2M/g=
X-Gm-Gg: ASbGncumWBlzoBtcmM5JWfpWWpnd1ennzhxwqOgvGJ5OAO9uCroDe6g5ilLa/yLlRdW
	00ReGXRsZWbqc9WNA9cUDoCRhvOXZhTTbffUxeyh17HP/ItPVR0A222dtfhXLlOvD2xXeVx9K/J
	6q7n7jevCEyeip4u5wnqfd5qQ4rq0a8HPeiXI+zPSfLzCAokN6IYDU5cTOgxEFEqBkRZLLZylVk
	d/l5WDjcfuD7AOEeKZfv1X7g+XHLjyx9ZSh1DXJUFmf7NQPe1kikY7p1PcHSePzeCQo3ubMoRku
	u2wiys3DOueAJplZRZRBgLmJL2fC+qRikrqkb7YhKoc5
X-Google-Smtp-Source: AGHT+IG/uLzpRERbCl1zMbJkXY/9e21B4Oye6Db7RIlllWZzhZho8vNAYbf9zIjaFjjXBvnoPW3ZfQ==
X-Received: by 2002:a05:6000:4009:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-39d87ab6642mr1445941f8f.25.1744188046123;
        Wed, 09 Apr 2025 01:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/7] iio: convert GPIO chips to using new value setters
Date: Wed, 09 Apr 2025 10:40:38 +0200
Message-Id: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYy9mcC/22NQQ6CMBBFr0Jm7ZgpLaKuvIdhAWWESQwlU9JoC
 He3krhz+V7y318hsgpHuBYrKCeJEqYM5aEAP7bTwCh9ZiiprMiRwWGW4EeZMfKCmlAkYEcn59n
 Z+mJ6yMtZ+SGvvXpvMo8Sl6Dv/SSZr/316r+9ZJDw7KzpiGxrXHV7ytRqOAYdoNm27QPDd74Vt
 wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1VmSF1FsDxlYv2R/Yfi5O2efY79iuhVVKCImNUHwSDM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKL4ZxP/or07B09bNRWDnOGUJzJeTfjcs1xc
 42EVnXNzv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyiwAKCRARpy6gFHHX
 ckkZEACfY8X9eP3FTD7PsTbprsHNKdiedrNEre7r1anPs+AIMIiioakugWK8lLaKg/b0Oq6EL9A
 iHk9z5hacSoe6g1CNB1DyC1QnXre0cYOwDScwvRjz9qfShj603Vjc+k+90JMdv61gQMKMsELcY8
 Iir8y+VHhI1yNhk7SI0lWwsRra0jrg1gsAHcE2M3DECmWXicFYuLofI6/12i4B8hDWu9TjquYLp
 PuT3jKMlJLz3ez2d+ukBGVnkNSFi/cx7n2CaV29RuhLy1SKTIgZ4j8gUlq8qg3RFPvwWL0lS/du
 /iA1MfeP4VJI/yEx1zpnGVGd8U1u3E/vpza0Eg8fHbl6ucXPFIv13zz+BfkkaipxzLPMUfvM7fl
 4d/Kdr6obV74gUzBCswJHGUjQRX0zulefhXy54u2qyS6OMpV/xwZLx8sXXudahrC3kO4EG+SAcT
 Cnn51si0tPt/LDHOJ4RVkK4Cooda0mpm4zf+e1zqlxyPS8YgGc+Uf3tgn+M81YRPss/mPjE6oWN
 OHyvG7X2BMIPUTI4Rhwq3b0V8m1yNodxzeBNoeI+jZ247HpmarrknhbASt5M84HznC5M2EkEScD
 GU74ckqRtNrsPzVDQ1/fo1o5Md+OULTwqVnRI/CGMZOWKumNFixNnCYDHZHGGwXG8DlcdCEEp2J
 sABS+CKuL2MV9Ww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the IIO GPIO controllers and also contains some additional
refactoring patches for ad5592r in preparation for the conversion.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- move devm_mutex_init() earlier in probe() to avoid using a goto
- rework returning on error in ad5592r_set_channel_modes(): return
  immediately instead of saving the return value and going to the bottom
  of the function
- use scoped_guard() in one more place to fix a build warning reported
  by the build bot
- Link to v1: https://lore.kernel.org/r/20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org

---
Bartosz Golaszewski (7):
      iio: dac: ad5592r: destroy mutexes in detach paths
      iio: dac: ad5592r: use lock guards
      iio: dac: ad5592r: use new GPIO line value setter callbacks
      iio: adc: ti-ads7950: use new GPIO line value setter callbacks
      iio: adc: ad4130: use new GPIO line value setter callbacks
      iio: addac: ad74413r: use new GPIO line value setter callbacks
      iio: addac: ad74115: use new GPIO line value setter callbacks

 drivers/iio/adc/ad4130.c       |  10 +--
 drivers/iio/adc/ti-ads7950.c   |  17 +++--
 drivers/iio/addac/ad74115.c    |  18 +++--
 drivers/iio/addac/ad74413r.c   |  28 ++++----
 drivers/iio/dac/ad5592r-base.c | 147 ++++++++++++++++++-----------------------
 5 files changed, 103 insertions(+), 117 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-iio-b064ce43791d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

