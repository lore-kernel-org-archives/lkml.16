Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC57246769
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186987; cv=none; b=dVvoPAg5O4wiYehix8l1YAH4Fr9El1hlMe0ke719pMcwo7NYTl87kYlmqAVhDkUe+NPOXxF4LQrnpbLHuF2hwW0GxlI39Ujz1Ty2Fji/Msvb4CpUeLjao74O69cRQ12o4eg1fpko+56/dCcxif/NklMYoFp1Nm/ZdW07GbxWg8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186987; c=relaxed/simple;
	bh=c+gKYUvL+mRmw0LVpyp2dts7T0YVjJ1xgr2xwpHqjV8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SHeK7GmnsBmbcE+3cPz0aNWKd6/HPfh1K00RrWWfTzutgwHuKBDSb2H6uW7kmb9HgJ9OjOGcTmMoiGKQ8rPCM0X3+tOSc8w1EOExWKFEbSmWl2cmog30yeLYttmJGuDjUfQuPjE6wEhzVozvZnW5piRFKNGIbvmXjqC1964EVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJpgYU1j; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJpgYU1j"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so17838501fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746186982; x=1746791782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rUNwIJ6BVyXnCNfhB8YdWYkkIgckWrMjQ8cfZd889F4=;
        b=pJpgYU1ji4jGfIxLLtgJESHZTiUhNJ7ZklNVnZg6HcCtRxbwWGmFOhORaqK377mJVh
         UY0FfG85ofIeI0S9Z6Ka+4N3lb/RR355qxMs4v4iLj8M68kvqGXhE57ucVeQTHM9yzKs
         BibeDf7FnbQdCS4zhQ5wpnnIZLIrDpAuCmp4Zjv4uNCvhLmfRHB8Gg0fWcE8tcQvMiE2
         Qk8p64t4tb2nAgBmAEdgdrJRwVlQ6LFEBU0ybhjVGZjvnLzGRT86oXj8WzEyw3MGkyOW
         EP/wHTa18vLupIM1egkY8dD0lAzU2hUnBC3Iaxfv6uUKM6lJqyaTJMfIl3/kPRJaLwYD
         jdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186982; x=1746791782;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUNwIJ6BVyXnCNfhB8YdWYkkIgckWrMjQ8cfZd889F4=;
        b=qA1A9ycIDell4oL4YRo23VQbtdatm3BRrk9YfTLN3Xb9vQNtmH+/bbiwO1wNDIiK5V
         jvhhQ6sDKLecJkqrdR98JyB7P9Po69Wqz6bMQPuKQmkoSgL98AjkEStuHeUeG6INCl6m
         XWgjmzqW6D0lZQ4yWWMlIS08zwKoQBAPEyXRNT/YJCrz4jaLv6x/811wVw9ThtpijaRn
         SbBicYU39/lUPKBZSp0cJQZEvka0Kk/YtgnuycQkA0AaR2NuIJZ0MakhlyfcVaejS8d5
         Aty1zFFNfy7PVwpzAyL/hGgO3hGJWAUVP7RTbyflxOFnpvptd8ogspgl1X+p04yZciIf
         /xIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKd4C7y/hX/pY3L5H7a2AJXybztvkjWoG9K7s3tDPhNx2sTNI4t+IDO0DWRpRCBGkDmNffoHh93bPy1os=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQ1ujHKfyDrWaIFda8n90aIEyT0rVzCIsX87CCEt2itbPRU5y
	jco6MQ20zN9PBmpJAifuq5DR/i7H7VxCYRcl5U7wqBgPiASJyFV70JWYGI8W3qWb+jz+m54P5rB
	UA+Jti5jx4olOAAal01u6WfCfXP6D6RY4ut2JzA==
X-Gm-Gg: ASbGncvhYh0NtK9ZyowNLbfG7yLt/p5HKKGDx1SyB1KQMtwIsnoqqLKn/evOVUrLdiW
	CFsgGJHV19cSeF3RdJmTvImBS6azPzVD5vadoTXnUJJNCc2U+An3FPDc5NCJk00XQdnv1pCPYJ6
	5PqT9rCILd/XqzJfJMqtGc9g==
X-Google-Smtp-Source: AGHT+IFVQ8JKPYO1rnLcM2Y70dcTgwStoWvcnB2aoZEyQzs4B/b3M5+Y/SlSIKfzxsXCMLRLq9S0sgzPIPFIrl/mQKs=
X-Received: by 2002:a2e:a812:0:b0:310:85ba:115f with SMTP id
 38308e7fff4ca-320c5be28efmr7733421fa.33.1746186981975; Fri, 02 May 2025
 04:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 May 2025 13:56:10 +0200
X-Gm-Features: ATxdqUEieMo6zqI_jOq2JYpn2sJsyAQVwKrVkhKfiEUEH0GD9sH8kJFEH6gZSHg
Message-ID: <CACRpkdbhYTFpA_jfMPFZ4t4bcVdO0+9iCsjtBnLpy9ok0U_wvQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are som Valborg-patches for pincontrol. All are driver
fixes, nothing exciting at all other than that they fix bugs which
is nice.

Details are in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.15-2

for you to fetch changes up to 12b8a672d2aa053064151659f49e7310674d42d3:

  pinctrl: qcom: Fix PINGROUP definition for sm8750 (2025-04-29 10:27:25 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.15 series:

- Fix potential NULL dereference in the i.MX driver.

- Fix the pull up/down resistor values in the Meson driver.

- Fix the mapping of the PHY LED pins in the Airhoa driver.

- Fix EINT interrupts on older controllers and a debounce value
  issue in the Mediatek driver.

- Fix an erronoeus PINGROUP define in the Qualcomm driver.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers

Christian Marangi (1):
      pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines

Dan Carpenter (1):
      pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()

Hao Chang (1):
      pinctrl: mediatek: Fix new design debounce issue

Hui Wang (1):
      pinctrl: imx: Return NULL if no group is matched and found

Martin Blumenstingl (1):
      pinctrl: meson: define the pull up/down resistor value as 60 kOhm

Maulik Shah (1):
      pinctrl: qcom: Fix PINGROUP definition for sm8750

 drivers/pinctrl/freescale/pinctrl-imx.c       |   6 +-
 drivers/pinctrl/mediatek/mtk-eint.c           |   2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 159 ++++++++++++--------------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  12 +-
 drivers/pinctrl/meson/pinctrl-meson.c         |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c         |   4 +-
 6 files changed, 87 insertions(+), 98 deletions(-)
