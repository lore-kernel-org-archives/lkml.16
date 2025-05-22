Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3527A927
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903160; cv=none; b=u9yNjUoKzlDUlEaKgiCScSxtECAs27luITPFkZeT6fEclsC8xYu1L6m3pp2p+6PW5JufKJ9jDRWvH9mByD6lTgAyfPgYwV6Av4CQVpaqgKyrdM/Z2lXeWADZ4QsBwJ8NpOeAe8IxtN9ywObkwUlxeaAF/M1k7yNHVi6DTHwYXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903160; c=relaxed/simple;
	bh=tznesHqeZytUQBxsCKufL4tsD5eNcOjqiXA4b3qJMvg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CHFpBlJcikWgakyxvreswuqq0mKU1FmcqV3NJZqRFAWwxvoxm0e5+BlnRW4AQnoUzZRD+4++KUQRnm1VUe1CyF5wtIBliyFCMqSBFg7ZPBc87lQE2+POJWw6dEtNPIqjySfpQRr3/mI4XQ0WGWGdUGh8wzfekvrCAyNbYHNlPNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rR5McHqp; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rR5McHqp"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3106217268dso72454681fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747903154; x=1748507954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qMhmNskADhrsN3v1DxlLOqwp8G2YfbYOwBOnwBv83D8=;
        b=rR5McHqpJlrqkKpCbfJ2WNyKVzJbKo2Z1YP+ZMfzasgn5bdjOEnbZu5KIuSWbB8fc4
         ye4QCP0TX/hHHJSKl4gbHz0+pOr4SIAhiUWELNsAyheofhhfcK0QLFMwmJSDlIoihXuK
         eCnNDqYh/jiTc9nVoLXqNHeONZ+UJt7jFJMDn6QHYdDzQSRP4zivT1gv3V/5K1MsIjz3
         0X30bi8BPhEUQyaZQO6/O3EJagp3u1LntYqZypbtwy9zJWJ4apVL4trNb366VjZB+8YT
         upKQa9PKWf9b1K77p3hHW8Xld3zm102iIQ1Nyzx1W+kZT6/SAqrs8cIbtSEGvm8bOcoT
         sy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903154; x=1748507954;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMhmNskADhrsN3v1DxlLOqwp8G2YfbYOwBOnwBv83D8=;
        b=etNn7Qu5WBLe9zd/ynGeVM1A8U3lHPbbn6mkpOcjA8+gpdij2akiCFDpVG+Xq9RC15
         Ie2aVeyNMiViioeJi+ihQkSHQgK8LO5mFEwz7CIv6h9WbRozYPudD/JRUWea3aZTiXcZ
         xpqwcDMLxBtIquPnV+nXFOObX85GOKnAAzZlTgLcQzg3+5HDxy8uzpyshPx+w73DhZ7k
         dMZTyYS4GyKpbRU1rd+HNb7ZZgoZs8M/zvXgUWrD8tsvACFLuZ9Cd2N06xvSbKJCVLuJ
         1bhtGJr8uz4R6kKJMb40QxtTt0B+FFj3f2c7QQMqCsUCdAo1GDFoAIsvJDJ8qjZYRhju
         xaWg==
X-Gm-Message-State: AOJu0YwiuZqEV5oaibaX5/dSctEHTQMn5yFV7t1q39FNIPJi0KPgre+j
	ggxonconVQGQY8x1Ab9xG91RN8AXJ2sQ60mnA2WLMVWI7bvEHVKh/aBVcD0T0zh8TXhEktm/pw8
	ybLsIK4NLVRv3c4OzPDxkoLlcNwbBs+PfbUX0tO1cnQ==
X-Gm-Gg: ASbGncsyc1IvYRvR/o9/rO1737J9M+Wi55TfqtIAaL+qs/ILcwI6lVt2WBcFl501TL3
	0P++Y/xa7UtGhxOVU+4c/jqArFHxw+DB8lTrP0HJNVrw0eJsqjzu1sSIpTnVbpe7FBBo6yBGgvG
	xvnTjFgzbx1/Oa2eEM/eSBrb11z8Ji3A6Tqr8jpe6Iczk=
X-Google-Smtp-Source: AGHT+IF5P3YyhMqZP4RT6l7E1iz5hMh6P8bMERqdor0RMnNXGUnxHB4+ImovRLcw/3knetHVFpP+GFf1niTI9bRIZUk=
X-Received: by 2002:a05:651c:2229:b0:30b:ee44:b692 with SMTP id
 38308e7fff4ca-328077b2d17mr98326021fa.33.1747903154140; Thu, 22 May 2025
 01:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 May 2025 10:39:03 +0200
X-Gm-Features: AX0GCFu1eG7CL_G1brUAj9AgP9YxI-nCFQ5opBOZ9pyczqf7w8M-DcNU6bcW4UI
Message-ID: <CACRpkdaEmKn_0QObo9kFrgm2TajepUFjcgK8CVn-u_zMmoEO8g@mail.gmail.com>
Subject: [GIT PULL] pin control late fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

these are two patches to the Qualcomm pin control driver that
fixes a late discovered problem.

I first tagged a version with an additional cleanup patch on top
but realized I can't send that this late so this is the diet version
of the fix.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.15-4

for you to fetch changes up to 41e452e6933d14146381ea25cff5e4d1ac2abea1:

  pinctrl: qcom: switch to devm_register_sys_off_handler() (2025-05-20
23:41:29 +0200)

----------------------------------------------------------------
This concerns a crash in the Qualcomm pin controller GPIO
portions when using hogs.

First patch hits into the gpiolib making gpiochip_line_is_valid()
NULL-tolerant.

Second patch fixes the actual problem.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      gpiolib: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()

 drivers/gpio/gpiolib.c             |  6 ++++++
 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)
