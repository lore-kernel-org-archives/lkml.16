Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C336219993D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172241; cv=none; b=oVt4qjQDtE6GDb4I9Zil9rH0QLdGej7v+NryryhN+G25fDjePkfH2405/w23oThV6M/WnJPfxqPr78Dqatv/u3cMTRHPvVlZRumXfpFzA8tyJlB+wWwXMGVTXoqUdOV9urYqOTaffqqC8wKa1iGojSveD1pEdeXuqobXtvGHiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172241; c=relaxed/simple;
	bh=OiWJd35iWVFf4Y2xS6UklReiMHDXo1tzdGCC3otarB4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ePmqGdknuWqlMXbO/6ZPw2+dYPt1Q/KlMhvnHwNui9GSigxicVXQJ7cpks8p72D4Hc5Z71awamuxCJjJ5fcMPwKaM95C2VgU1OpfRUFJIxKuK2ONitrOynyR2YwXyQZTOawCLgeeYIRbt+EJEmCgv5TVnk6tZhe+rCX8j+/Euuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV/g9p6i; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV/g9p6i"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5450cf3ef63so546011e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739172238; x=1739777038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w8iLHkhzG86wDPvNohdrJojcK5rqpONBUFEW2U4xEl0=;
        b=hV/g9p6iJs/lNkmtcTXsiqjMQc/5T/YIZvGHtwqbVDh+XyTs+7Cr9FkOBVCO27vdOP
         cph1jSItIrjok/U2w5HHCRNxyvP2/E2/WsCACDpkLRX91qPawx23H3iWgP7I8EF/O4iJ
         X9SRofVHGBlfhXoWlLuBWy9t7RaY44+rJxnxo2EEiKOnE+gyZShma114hAYXnLbHesB6
         lxJBPGl+FKSzqFlCmoWfR+aPOnufv535m8Cn4OQS2/1Y/KblWd1kqcJdbjaDoIx30Ybg
         SpXA2s0DhC3Mc6j0hm8YAq0FmdKRfcvsamD+j/f8uij30gj0xY0EGSgQHbQ0s/PEPgHM
         FuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172238; x=1739777038;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8iLHkhzG86wDPvNohdrJojcK5rqpONBUFEW2U4xEl0=;
        b=YWYb+PElp8BILs5VxR/AyshyMzAya9Xddq+p+p++NHzOKKqhFSE4Prmltraz59Fqqv
         mxW7VORay2vc19iXes1I1G+ntcqOkO1xF70/FVXQilZso18fEIUaU+22MU2v1gF/kIQD
         NDaECv6CfgKzqXkLtb4Wxt6LtrGbpZ9p+pe08Yc9qLoVyElgkd7qbZkP7tOJwTwFfFxS
         d8GptP0Ak7UAiAPIrkXRmdGu98u3OkpqW4Xl6fDDBctafwyWAwrF08neMMvXIIE6wFr+
         f9HNba6xZdjZg/OOaWfalFo+tDY9+dkOI7JfOS7876HWUUMj+3iV8g1XSLNWdLV4m/db
         n1dg==
X-Gm-Message-State: AOJu0Yyy9wl1bshRc4f/vLGlUybiZsee4UrxhmZDlGOmVi3+2l35AA//
	tBtDwTGQIR8MzfPc+9aTt2MLCozExGfotx/deuL8idzLo+eeQXUebmRTlxPgwyCZ4ozExfn98HF
	Npn48Nq6znBEzZVrWNJmnYCAVvx4vQDw2AheR3BGPfWJYNHFuARQ=
X-Gm-Gg: ASbGncvR6gnreWQ+0aYsYYA8WJ2gk7n4l2w//PoroNOIVohX/zxJWrCHQCDGDkeRanr
	a0umRewU2F+RSyjGcePy4973E7bfXQ1JVl5/Yq/lzIqalw6eeU8wuVkSBVGjF7I9+REBgHqnw
X-Google-Smtp-Source: AGHT+IGliKIx1mYciy+bEb7xJhM3llANWo55qVgRc0LhCkuDYjEIYf9Rg+VmsAgxrgYk7e9FKnv4nNn4heOp7q2dLBw=
X-Received: by 2002:a05:6512:3e23:b0:545:8f7:8597 with SMTP id
 2adb3069b0e04-54508f78639mr1527292e87.16.1739172237799; Sun, 09 Feb 2025
 23:23:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 08:23:47 +0100
X-Gm-Features: AWEUYZmQgjJ6MaKMj3o-uvhuomExAXgYfgbhPztYDeIHIMgHKNxCMkwAh4Ry99g
Message-ID: <CACRpkdZh-=7qjhmjDwqLGLnuoD3QtKyt27Q0qAZAP0Xw23-o8A@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

a few pin control fixes have collected so far, a driver fix and a minor
debugfs fix that I think we can take in because we are early in the
cycle.

Details in the signed tag. Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.14-2

for you to fetch changes up to 0af4c120f5e7a1ea70aff7da2dfb65b6148a3e84:

  pinctrl: pinconf-generic: Print unsigned value if a format is
registered (2025-02-06 10:13:15 +0100)

----------------------------------------------------------------
Fixes for the v6.14 series:

- A series of IRQ and behaviour stabilization fixes for the
  CY8C95x0 pin control expander.

- A print format fix for the generic debugfs output.

----------------------------------------------------------------
Andy Shevchenko (5):
      pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
      pinctrl: cy8c95x0: Avoid accessing reserved registers
      pinctrl: cy8c95x0: Enable regmap locking for debug
      pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
      pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware

Claudiu Beznea (1):
      pinctrl: pinconf-generic: Print unsigned value if a format is registered

 drivers/pinctrl/pinconf-generic.c  |  8 ++++----
 drivers/pinctrl/pinctrl-cy8c95x0.c | 42 +++++++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 21 deletions(-)
