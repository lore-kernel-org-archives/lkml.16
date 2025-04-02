Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6735153800
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608996; cv=none; b=PSeDqIFMI2RqhFkPnZFpzc1wpvC9YYTl2RGD3eCYZtvoNKUx7MnxqfaRK67uiG9PrKRc5VuVVlqHQOCsIygto0kscYseiQDLH8FuxLk11WgE1Ty5wmciv3YUeKPZH76VfDzHGAd1ocCl0h65GawTif4rH5/3THUAHW5t+zFj0OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608996; c=relaxed/simple;
	bh=PasM5YaQBRCOTlF0h7ViV2MKKK4sOojopu+VEkTaWWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1WFFroQ2QZa56jx2Pu3356ygBWNbXP4jDtLKCDxW7xlo5JPD4p2MjwB1vhEUNVihmoYCtd4ClIe/TseqwzjqZbzACqkcdn1kbia70vE/4K7WiM+kNzY4HkPLQPdS1P5ThsTeB6VslUCHtvVyUU29hU/wpJnEKcIGffUkcOMNjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFoiOwtW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFoiOwtW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso32397295e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743608993; x=1744213793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bqn9BbeSUizG/y07EEBC/bR/zNHBJe7SEgbqhMAefw=;
        b=RFoiOwtWknbL9vm1iOEJIzsYvooSv+eLWc5YG9jur2zZ5qevqJ+mECG6PkAklnkeyZ
         ydBbMN49K7x6raYsN7TNBqd9ys+9UKHUxsqzWmhrIe0XYj5gkziiKP118QIWQgzRM4NP
         uKfoYflCr/H+8kWl721RMGJqhIub/sdOIrXpxx/6AmEWuM3JhxlAvmtC9KVKWALL3yDo
         Kn4iRHsB+mHTkn9AWqP67EBNuejiYqlZrrPKIfp6/lJrPNyftl1CQ+sI2uo4MCGtPAK1
         0KVmiJCFQ2+Zev2dZNl5t+vvAcmwryl5idd2jONTF7dfNYgLJQQqtw402aEBMkfd4kZD
         spNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608993; x=1744213793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Bqn9BbeSUizG/y07EEBC/bR/zNHBJe7SEgbqhMAefw=;
        b=DLArLNQr+iDFbcxGd1dNHWwW+CwGJZWUfKFteCE7qdX8pnQL+35BKGjkA8hFrLbbkR
         3oH4G6fJl0cvANvL/ncOtgrAyswJZzBwUyjsYfwPJxduWek/eTHslYrmh/MKiKPwHkD5
         rd4pomTvxaeIITBF+10gzH2PSHmkBwBFMW/fRSTzjSrv8eceZoPYZYGgOG1yhUQAbRbL
         l0xZyAA+IygveoVtCuv6DZC9IVGbbLTb6/QlPO5wMcMTOr0x0p+BVPVjMPBYD6MwF+9E
         hB2TjQaq5JxTy2TK9GoxCkCGBqsvr2SoOPlkq5fU5RdkhrrLwI+WWrEyfY9ogvWZu/UU
         0Gsg==
X-Forwarded-Encrypted: i=1; AJvYcCWrbtANhCMcqYANA/PuaYXDtMAx8jny1iHGC4akAV2TZ6fTk80N41b7WJM8cXNwxuVkQDng2JWIShEyVmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRM1sAJWaSbS2gYqu4cECb/l3duyB411oFFr9+oKf6XP9VvxS
	FXR8dpAJ5XTZYHmFIgxGyuYBS9hXbTGHGxaeQVl1rmo5P+YYYftMOgegcyFHqQA=
X-Gm-Gg: ASbGnctEgQz2+FGt+seCO2BVt4uQtYozl44+nRnaCW5bzTLRNPtg1GnDemCtxRCbsKN
	A5iiOkhk8FBy1Z9OIQsb3aOjM79/Jlbzr/KCZG75oyW6ZJDeYphk5ehdpGIqVHAfDDW25hfeuGB
	gj37PCtKpUrIhdUcP3VkOJhXsWIo2Q5PCzCd462SAyLuuJeFz4yLX2vNlEJ3F5ga7BZVLQj3aa6
	zE9oGFCYQq9Ts8Tg5OiB/eSL8CgvjTdBbNJjhjuXePrukjtuqV6n6YOy/cJbOKw6R+vmpKeN1fN
	dX9UYXyjWDpsf0aTv7Qz8pQlUc2pb0w9iomnG7z2N3d6JtOLR4jDGWpWFVxm8+Coeq+Bnk0=
X-Google-Smtp-Source: AGHT+IEZ/EOF+JRXdK+jXCO4XGHidXIrT+gdu+fSLqMc/ZMnNAQHSkb0GwK5dwOyPteuXVEFCqvVHw==
X-Received: by 2002:a05:600c:4f0e:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-43db61b3623mr144309085e9.6.1743608993165;
        Wed, 02 Apr 2025 08:49:53 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm24674555e9.11.2025.04.02.08.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:49:52 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add the NXP S32 Watchdog
Date: Wed,  2 Apr 2025 17:49:38 +0200
Message-ID: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP S32 watchdog, referenced in the documentation as the Software
Watchdog Timer is actually a hardware watchdog. The system has one
watchdog per core but an assertation does not directly reset the
system as this behavior relies on a particular setup and another
component which is not part of these changes. However the first
watchdog on the system, tied with the Cortex-M4 #0 is a particular
case where it will reset the system directly. This is enough for the
watchdog purpose on Linux.

The watchdog relies on the default timeout described in the device
tree but if another timeout is needed at boot time, it can be changed
with the module parameter.

If the kernel has to service the watchdog in place of the userspace,
it can specify the 'early-enable' option at boot time.

And finally, if starting the watchdog has no wayback then the option
'nowayout' can be also specified in the boot option.

Changelog:

 - v2:

    - Removed debugfs code as considered pointless for a such simple
      driver (Arnd Bergmann)
    - Replaced __raw_readl / __raw_writel by readl and writel (Arnd Bergmann)
    - Reordered alphabetically the headers (Guenter Roeck)
    - Enclosed macro parameter into parenthesis (Guenter Roeck)
    - Fixed checkpatch reported errors (Guenter Roeck)
    - Clarified a ping on a stopped timer does not affect it (Guenter Roeck)
    - Used wdt_is_running() to save an extra IO (Guenter Roeck)
    - Fixed a misleading comment about starting the watchdog at boot time (Guenter Roeck)
    - Replaced allocation size sizeof(struct ...) by sizeof(*var) (Krzysztof Kozlowski)
    - Drop old way of describing the module and use table module device (Krzysztof Kozlowski)
    - Replaced additionalProperties by unevaluatedProperties (Rob Herring)
    - Removed the DT bindings description as it is obvious (Ghennadi Procopciuc)
    - Fixed DT bindings compatible string (Krzysztof Kozlowski)

 - v1: initial posting

Daniel Lezcano (2):
  dt-bindings: watchdog: Add NXP Software Watchdog Timer
  watchdog: Add the Watchdog Timer for the NXP S32 platform

 .../bindings/watchdog/nxp,s32g2-swt.yaml      |  42 +++
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/s32g_wdt.c                   | 313 ++++++++++++++++++
 4 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
 create mode 100644 drivers/watchdog/s32g_wdt.c

-- 
2.43.0

