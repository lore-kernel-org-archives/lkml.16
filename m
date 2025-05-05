Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839F202F83
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444993; cv=none; b=B3sE9taZTf9vpvKkiGfLYD+KL2sM4UmWBSfrXpxI+Qqd0hXL/9tfimkV2MK5+xaOLkKQjr/ZuxYO9wNlQT1Era2qCuKqdqb7jMWMKBQywutsGkcguI/1GAQeNA7omSaO7jicyJb0kRvvhtWHfFmIYdbs6F2XL3bUAubM0UqoboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444993; c=relaxed/simple;
	bh=zuCdXEp8oxjwTwvlSnJyhAOkN3XymDG3iNn3ScHm9cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VATfU1tie2mZmg7orxZ8aQ2mBmic4WU9xYKqTtLoqtuqz/DA/ZJLyUf7Bzj/fSrIh9CBhER0hVoUuF9xvrWUPEmsOI87z/AHGLSgAfnLbRV96SS5LoQa1ioU4w0HwB99kREBU3Z2oTy0mu4qLSOPDk+RhiFvLPRrTk9ODv9C8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlDKzhRO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlDKzhRO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2895577f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746444988; x=1747049788; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=BlDKzhROPgj63Qi8osl3tM0CkRqn1+DgoANwUklUG/OCNhueE174WCG67rRJiNpCJm
         ldhMXcQRAY6UKIalE2tNWkgKmJrrgLDgyYt9yIXyCBSmp/Qm4o0eV4m+hWF/STjEUMTZ
         TkfXq8RoMNK55hrl6zKeRLjGo8j3f1/uMy0+UO9OfL1cOYWFb/qDN+YqUSZ1MU8d/Act
         wUFDjADKtQize+Rh7NoPNk1mPP63iXMot8AVCP9UW/+0AC8VO3rKogyuGcO2YZw+mVGJ
         +4POIP04uBAC864UlB/9WNAWOkxvqsjsveQiJHKRXLXRPUiSVJQJzfgPz10jrDHtuNeg
         KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444988; x=1747049788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=lYFL70S1Br4BnM08nGXQ2JJVYc6m8X1OUM/V4DMV+BUHwiXIKuSSS+Iku0ua6ALslS
         wxUgp/KmedB3hxKlUTEAKPnLKmf42TUGjd93Wx0qtVIo0XNGE5VOIm5bPJOp5l/4bTFJ
         /uVlaY5t3eXWaeG78qSfZrTaOBpPvIfjCXP70/Oma605qQDQGBus8Ch6W1HiLJRx0t/N
         2roWv1Lj+uoEqh5RGGjsfFRCRuYN2YgxTnx4FJO63oWL4RtO5zIKLKH4WpNdXXKwgopJ
         RVLD/F7kfG4AXgVXC+0wXRMB5qsg1DboP5/9d97mAcG0HMpuYM9SeYM6wjBKGEMVkwWa
         ITXw==
X-Forwarded-Encrypted: i=1; AJvYcCXWVUbGKyWnuUXWmM2RrdewFSowoEwcJxjvfnMCHFAc/IpeoHr+XwF8hMx/Ma76zg9q2q81RQhQgUhOOEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5s011rLsl4DbPsJJCJ/Z9t9ViiqRxlWz4p7xkB33Qoyl5lqw
	+g8np90BTOJW8apWE/seyb9v+E16FFHR0UOq3Mj04dmw4M1ekESXHpSbH8Ypgl0=
X-Gm-Gg: ASbGnctTiokS+76l8PN1yhpU0JkWQc7VjlJWSJSbdBWP0r/XSVfZPHqJ6wDrtQa60/l
	V8XznjlZrSbPOSAKAB/r9Jx576EpteOOBBi8dfSZWoKyDVIaGg5Mytk/tT5ntKOxIwNiqZZmb4Q
	YqlMZTaPk8xiiQFq3BZnbfcE1Ejvrdm3dWw7YbV1n7m7yFq/hnEsLZsuVgilPaZQE6TJy7kLJBe
	UQnWfy/0fMzWAtt/noMZMILXBDzk2cxpy8qpn9vZQ97/CVl7SAum3ABOkbgkJo4uxrymmS3Cley
	s30PsPhheP0gB/96JFIig2hP/UgjHbf8mzDLa8vveHAtjw==
X-Google-Smtp-Source: AGHT+IHX3DPUoK2CBbvL9XMu5PuYfd3Tv12xdlZ7tadSos7vJLC5At+2jHITPcFn3QPH+KLU59woSg==
X-Received: by 2002:a5d:47a8:0:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a09cf3df66mr7016749f8f.55.1746444988093;
        Mon, 05 May 2025 04:36:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3c1fsm10234470f8f.37.2025.05.05.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:36:27 -0700 (PDT)
Date: Mon, 5 May 2025 14:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>, Peng Fan <peng.fan@nxp.com>,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds GPIO support to the SCMI pin control driver.
AKASHI Takahiro did some of that work earlier, but we decided to make
this a part of the pinctrl driver instead of a separate GPIO driver.

I'm not really sure how the device tree stuff wires it all in.  I've
been using a mock driver on SCP with virtio to test it.

Dan Carpenter (7):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl: introduce pinctrl_gpio_get_config()
  pinctrl-scmi: implement PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 146 +++++++++-------
 drivers/pinctrl/core.c                  |  35 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 339 insertions(+), 69 deletions(-)

-- 
2.47.2

