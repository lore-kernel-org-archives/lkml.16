Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B21B0F32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041815; cv=none; b=WAnJ3P46XChi8qxf11MuXf2tAM3F5fxd1yZBlukoZq+XevzxEE4L9xB7GA7vmdmIeL3hMDOwG09f3u3aMZrQAZQsn3EExPF2cR1HO4vizbUAkxcRsm/boy+CJBeacdmjOq3nBA+jjQzUqaXfsuuuFNdfoCzZnksQb7hJmDEgWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041815; c=relaxed/simple;
	bh=1z5coohKCAy18YJrpW1n9XP0W7BqvNtsMS+ALKwtsNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIH+fQ/lWIwpMZSSSxSbwV+/BBMUwjA3RWTz+/h3r9JtVWgsnda+4/fGX+EDDzB6GDhoRX9zS1MRhoks9pomJcQAqoz9Q5ikfXAAE3yv1HfWMMyGaLywquP7+Kr+VsnCmV9AlZPZE+kaKJu058J4QfsrQuxKLXwLCfRoysLT4Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrHQ87mJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrHQ87mJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2f391864so2535776f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041812; x=1744646612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TiStBVa5XzJJaIZh/XlbDgxRXeOzZkZMSa77cVqU2Rk=;
        b=TrHQ87mJeDSEPLEjSGW4MPQO/YAIIgWXIMQSnAtD0MzfNrDigYsiOkp1m3a+OwzC6F
         nRsOhagQE4RV2bPZiHv9FrMCD7Fm9+XGW9dtzxmRXbzNbUblOvlTsA1TOMGmZFNVWiQc
         r3H7cJ8jYhkB3fpWHNgXTOR6CWnR0y8M+1qT8XYbAw30XKlPgtLEyk0dJ3SeM3gJgW7P
         YLOCWnfnz1d97cscUSD4L4QjfJF/cU5LjyMoSW1OlRguMuiwp52/sR4TxrdpP74hX+i+
         gCrvSw2t6lC8T8x7nPArO3wt5mSibsind9RU5oRcIsPmo0d/kUBfZIxqE+1SKgedE0Fr
         kBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041812; x=1744646612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiStBVa5XzJJaIZh/XlbDgxRXeOzZkZMSa77cVqU2Rk=;
        b=jKFGddIu0FJKKScMUzdUgAU3UpG/1+UuwaNHRZzIBmf2SzWU4Cg4D2zUQEH7MHvX8T
         XDijQbtrKme5N8hGiSlzJ39LpMryus0ro0BwSQ8/oYDBXUmABN1ZkZ4yiem19W/frIAw
         GPF3+5sSV6c9LjBWU7pOJWe1oD4THo2ihSXyKHq1wg7vLz3hSBtvH7IHiMzVIhioz3zB
         uf50hjtQDQnMMi5k9ZDI+Os+yp+4oOgsnE4QkaAdnNdbNDF0IV7bm3Vw6Wd9Eol3fRgT
         bE0hC3LUfsbxyvIOviCfRg/TesRVKYFhKfxCbv1N5ft0ad141+FmgyMDX6afozW30WjL
         Oefw==
X-Forwarded-Encrypted: i=1; AJvYcCWDfrG7lNNMqXA8MuogV/Mo9BbD3QKWzDeKv3hTa3vINQ3S4+w0IhArFAcb95wzDhv0ALQiN/Dws2Gvepw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywRFxWFk+EWwO0ehwU9N0Pmk1Nz1m5WCq6gyaDvtzFP5X0t2Zs
	P5xWBnpV79s6WZ+Sh63IENJxu/hyK6CmxxZGv2AEppkAl+FhHEERUE1M2AVQ3NU=
X-Gm-Gg: ASbGncvgStTaJlS1ej7nf8+bRD4hsBs4j6Bmrt0MmeE5StZf82uIVx0ywS2D+SL25UF
	uEleS0pI7igkDb6h+xARri0dPiwTyqp65RAwPCfCpYRKrUEd4l7ifOB4zG2B5YhOKnEkkcno2fZ
	uaq+EJYKJt3iC6HZzM3zAKxQB8jK2YOdXTcU7qEPoRXhafqauX7hg1wGpwKJAIB3MfVIuXb0h7P
	M3Ol7OS7ueVKY5TOG+K9svzB1pEkJl/VJBpmP7Q4KGLLe5PXlzqE5lrnN0ciSW976CkGAhME/e0
	A9QwBfUcEaJRYSqqnZyVFrHD1rng64rrwoMDu5UZ7jmAgw4MLw31VlPyysoyjMWQlhFjSrk=
X-Google-Smtp-Source: AGHT+IGemrKXA8sM5DSUXZe2Dlbj6ooDA8zRnimiTYWgxUHTL8ryZb5AmO96jlogYy2tdpj5y3+bGw==
X-Received: by 2002:a5d:588a:0:b0:391:23de:b19a with SMTP id ffacd0b85a97d-39d0de3b163mr11548003f8f.31.1744041811910;
        Mon, 07 Apr 2025 09:03:31 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm137701205e9.39.2025.04.07.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:03:31 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add the NXP S32 Watchdog
Date: Mon,  7 Apr 2025 18:03:15 +0200
Message-ID: <20250407160318.936142-1-daniel.lezcano@linaro.org>
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

 .../bindings/watchdog/nxp,s32g2-swt.yaml      |  56 ++++
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/s32g_wdt.c                   | 313 ++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
 create mode 100644 drivers/watchdog/s32g_wdt.c

-- 
2.43.0

