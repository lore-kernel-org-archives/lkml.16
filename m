Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3E204C30
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273608; cv=none; b=f98YLrjf+7CaUohRGxuU4xb2a02vnT2dEK5BLzT0Blj8cCjdwJ1iO73M/rltgtJj9BLB8ztWtv/33Fi6AjDGLWuSQx3GPfRUSb3EUX+Tjc0ycheuFSppHvVIsZ1vEYKpD35l8IzlaN+rMOAA18tYUlRQce+S2j4Hvd1YCcWBgNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273608; c=relaxed/simple;
	bh=1MwayweBMCGI1FLlKVhQxmnVp9c11rxMnbmLOw/VEXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2xx+KlLnEcUVjeGQGBaX+++v59ZUp+7oVBMzXKy6f8NwSYagoeBqukF7XyAIhU1Dq2/3/EtWeHYX09wYa3riznD9+dBVmRfAt7DEHm9azJh4bFyFYSfpQewYMx/KbmMcdwv9NrMb8iWH08HCOimuBsK5UlntWNrZHaf7TUoeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHbPptnu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHbPptnu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso5485065e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744273605; x=1744878405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=by0C3qcBJWPP2R5Tts84nwTn6pqrbnhx93UsShQdVNQ=;
        b=JHbPptnuJMFxceSbvazDapKu5L+m0xCVYqqxx4PJC/hk4QM7H6uujswVXqWcG4x4qX
         WJEDDP+7rsQDWT6w13Q26NjzQKEwZ2mjdTLkYdsBiitSvaiPUuLker7d0TWtTjpyhJJm
         mHpxeAcqtHi7wcYEqYmAQEimg1ZaIz4RZM434lWv4H2BkHFZT1GQJjoL1U3td04deZRg
         8CLfk+F9JMOkL+UBIX1ua9Z8MgbUeviEgpXzja4PnkHjxtrVINPbPdm2+BUt3TXEUg/m
         FGdX1vNLss27fT71mVz+sY1G/2yW9TcCj93rNnTuaCD7kr4DRXmw6K5dzzXKHo7GXN4C
         EwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273605; x=1744878405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=by0C3qcBJWPP2R5Tts84nwTn6pqrbnhx93UsShQdVNQ=;
        b=kMw5rFeqfqJFoiVruGGLrS2At9Mp+HQqOkZ9O51DDtK+VunvtKKgJZIe13pV6YgKsZ
         2esjgsXKoBLkG6j1vC3j5uof/3Sk6OX710H5ale/0WFCGqS7Dw61QxZtB8tyYtJbeYWK
         dAu688mPQoduO6agNfbe+aGutdLwzQOxjYyXCQS8+z+72CAs4ll5iuPGIXZifYn+oDRN
         8+YhuI2TQYRv2wZ7Bmx60AOTKdenEYqDtraXos2un8QWF6/fTyBRtPzQS64BPeLoWPdm
         ujCMeZ64YGE+cAY2IJXG4Bsz2pCcISUtp5BQ036tQVWXFeBsGQcGEL/nhEdrfQcTJSQw
         0QRw==
X-Forwarded-Encrypted: i=1; AJvYcCUuOP0Nka5rcx1dTtDhockve4mMEGy4xuewwzaHVPAgApIuvZK73q0GQcS2etpGQwhfsVqCC1cKSUjS/Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHu2LQNn25+za8wd4fuGUKu0bscRoH+p5HSvEErxbNz1adLCYN
	FIISfUPSZbkBCA3ORY6MwmmEhFJgmYarOdPTcoBr0Qj/CDCjyFO1P5ofw4FGHyM=
X-Gm-Gg: ASbGncsCNOmOj89mimVyiyhYPR6eeh563/UXPj8tdrbE7ZAft6gtVFBwOw2AT0QoLJ/
	TyGoKA8o2H8BCV1DWBIiqMatcHucDl4hykQIY08rrVJPAif76yJ18DnWGCI7dcX+Xls0fJQREjs
	kxVpuAZ93PGtI5884iyLwcQhTSnAWIXzEDjfbpVHvD9znfCSrUmS/6r+7+80Tv/lWxoOp35Z8S5
	fxgLmtw5rlMsNEbaIT+06zwV1unC1dW867VeGN58mdYa5/MWmicDHTbeclnhKs97JHVBkypbP3b
	Qgcn+kBv7BWY2G8A0BYL7YL3XtM6eZNqWOB1SMiMCRVFKoaIqLgHojRdwRvORM05JjE=
X-Google-Smtp-Source: AGHT+IFY9hRZTvaafYq2hL5p30TOnetIisE6/GIMeJNcOc0jS1+hW0A56uPnzu4Ixw/+IUcYhD8Lxg==
X-Received: by 2002:a05:600c:1da4:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43f2fdced9cmr13942095e9.2.1744273604558;
        Thu, 10 Apr 2025 01:26:44 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c84sm42884645e9.11.2025.04.10.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:26:44 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	alexandru-catalin.ionita@nxp.com
Subject: [PATCH v4 0/2] Add the NXP S32 Watchdog
Date: Thu, 10 Apr 2025 10:26:12 +0200
Message-ID: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
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

 - v4:
    - Update the watchdog timeout when the callback is called (Alexandru-Catalin Ionita)
    - Fix the clocks bindings to have all the clocks described (Krzysztof Kozlowski)

 - v3:
    - Add the clocks for the module and the register (Ghennadi Procopciuc)
    - Use the clock name from the driver
    - Removed Review-by tag from Krzysztof Kozlowski as the bindings changed

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

 .../bindings/watchdog/nxp,s32g2-swt.yaml      |  54 +++
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/s32g_wdt.c                   | 315 ++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
 create mode 100644 drivers/watchdog/s32g_wdt.c

-- 
2.43.0

