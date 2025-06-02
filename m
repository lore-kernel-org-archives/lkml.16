Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BEC148827;
	Mon,  2 Jun 2025 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892332; cv=none; b=eR2HTo7YSpj8gOLB0uJrS/4AhmqXxyp2uqgJjso2zi162Ov8Ljl67mu4dIsMvn1YyyQQYDyqCC/uq4bWHRSSWkB4014hsz1Mu6ZYftBkNMu8rxgsTNkrheF3j1RuZ/IBx1ny38nwVnzPSNsKNaxIw2aP2z1s906EITWwFn/FgQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892332; c=relaxed/simple;
	bh=5OIb0TTZTl+gOrJHLUBR5bzK1rr+xWHikk5I656jqyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUEtO9W27CU0jcgyRHrMLjLkrs31q/cYc7iwOvmU4CRUqPKAHnWYaUAO+OK0dnvtwHPlOI4w0Ya2nY4SmiBqNmYaMh8XoLnKwXrtJp0pGakGMzJJYWWSXH0tt4U3OoxO8RMxwjGc5hPHIfbU2FnCcyV9/8f78nhU7fGxjnge4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIv+MIYE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIv+MIYE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234c5b57557so42502495ad.3;
        Mon, 02 Jun 2025 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748892329; x=1749497129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3rzsJqPboQ5hPdxr5AQP/HWaTk1HX8GdAZDNET0lMnw=;
        b=aIv+MIYERKpCMkoZAbDCl+Ranaqwc/q3GL5UWMRZ79umHiZsIUWB0Q7Sj7yMPbxdRj
         t70S2KmQgBLcaJFwPB9rX8tI5wgflZNot/Nc7ZE5QIBxFeE0mengcSs+T7CRoNkqXis7
         x/bYy6rvAVtzuLOXOELYgthuXWgDojc6EY2ow7XQS9k7RcY6AzFscd65xJ+Bh1qLpKRF
         IbYi9crHPKIgpO5MECvcEyfbrmp+Q20Qkulr3FMy/Sq7nQAXKpdNiPjtfsAp/3kalmh9
         qLC3ZGqTJff5HYboVY5SvxTUByhMAaG533vdDu2ruUMBdrIRqzZdMnaL0Xc0WxkCmXsC
         zM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892329; x=1749497129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rzsJqPboQ5hPdxr5AQP/HWaTk1HX8GdAZDNET0lMnw=;
        b=h3IuyL8CGFB9z6wi2gKfPMjav0LNi1ZhMTDQ5qYRc5ajEnqNYa5J3YOEosmohfFhxw
         4zK3AiwDvrNGXBmwpFIXTS0wQExHw10HE2lwj8w0O81NZ5jOf4rQa7xk9xkjtmaZGaDr
         JUcszFhjL+KctlHj64YvzvDGflunXyz27WjfH2EvOt7szA1KvC1W3UGoTA+HF0LUydtX
         QAmx9GxONEUgGWILXbeGh62PolQUwtUTGsQfCgLyNoHB9B2Mu7k7PqrURz/nYBlUm8KU
         nSsCUtdcPWuBDkKt7b8Hi9pzAYO7pMwl/BYhEmtQQxazDw8RRkdJe/JOAF4WW903OidC
         j4pA==
X-Forwarded-Encrypted: i=1; AJvYcCU8W+8T3xU99i8BMxOwUutp1h3jYCLRGWKFoBj72XdBObOWRh1Rxw3o1ZLagd499AHckDs5ixb//kB1xQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybwNHvWhk4k80RCqrbRlz2MuxtVh+wsBDu00IQx0RV11NdgYIZ
	Elfh1uX5liII88iro4X9s5M5CcSGHUvZizVsCCQ9eMMrIVdQ61Uce7vkik5+NDgE
X-Gm-Gg: ASbGncvKmvei8veHy6HJGcCjzIea1nWBZaCyFyZjws59kP1KnW1sISgXmvGsJ1Tm5VI
	lD5V6PX7bRjqYltKjKMcK2zCwnZ4fKwCZxcyUmJh2jUr8aun2FgksmJxTiIG+UJlxFF7Ysw6q8i
	au+7jeNTcXpEsGM57Mn0OcxlDZTtF/P6vu2VZp5O/XwE3bMbfzA/IXcPYof0lLxMbb8K6eL4Gw9
	F1y3RxTrcMRl1Wf/C2uYikpwsk4c3hd8SrHEMkZd77pQQfmXy3Qh1/e4gd76IsGrSkUtBp0ZQv5
	m5gSeQxlvFIjioE6m6CWBTI9h5TRqKhQXr9t0C54dhjREhcERiGnWytwRnBxiGDh
X-Google-Smtp-Source: AGHT+IEcUHVBszZnXDV3izP+C8FXfhN5tXCobPMjoVw3ZEXgzjF0b8wtPF7HzUP0apIoxXdDItOsTQ==
X-Received: by 2002:a17:902:e5c4:b0:234:9670:cc73 with SMTP id d9443c01a7336-2353942405bmr201708995ad.5.1748892329429;
        Mon, 02 Jun 2025 12:25:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14ddasm74351175ad.251.2025.06.02.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:25:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v6.16
Date: Mon,  2 Jun 2025 12:25:27 -0700
Message-ID: <20250602192527.265989-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon updates for Linux v6.16 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16

Thanks,
Guenter
------

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.16

for you to fetch changes up to 46d40b2479ab6417db4d7174f7a938c994435b3f:

  doc: hwmon: acpi_power_meter: Add information about enabling the power capping feature. (2025-05-20 06:19:25 -0700)

----------------------------------------------------------------
hwmon updates for v6.16

- New drivers

  * Driver for KEBA fan controller

  * Driver for KEBA battery monitoring controller

  * Driver for MAX77705

- Support added to existing drivers

  * asus-ec-sensors: Support or MAXIMUS VI HERO and ROG MAXIMUS Z90 Formula

  * ina238: Support for SQ52206

  * pmbus/lt3074: Support for lt3074

  * pmbus/max34440: Support for ADPM12160

  * pmbus/mpq8785: Support for MPM82504 and for MPM3695 family

  * dell-smm: Add the Dell OptiPlex 7050 to the DMI whitelist

  * k10temp: Support for Zen5 Ryzen Desktop

- Various other minor fixes and improvements

----------------------------------------------------------------
Alexander Stein (1):
      hwmon: (gpio-fan) Add regulator support

Alexei Safin (1):
      hwmon: (asus-ec-sensors) check sensor index in read_string()

Alexis Czezar Torreno (2):
      hwmon: (pmbus/max34440) Fix support for max34451
      hwmon: (pmbus/max34440) Add support for ADPM12160

Andy Shevchenko (1):
      hwmon: (qnap-mcu) Remove (explicitly) unused header

Armin Wolf (1):
      hwmon: (dell-smm) Add the Dell OptiPlex 7050 to the DMI whitelist

Bartosz Golaszewski (2):
      hwmon: (ltc2992) Use new GPIO line value setter callbacks
      hwmon: (pmbus/ucd9000) Use new GPIO line value setter callbacks

Bo Liu (1):
      hwmon: (isl28022, nct7363) Convert to use maple tree register cache

Cedric Encarnacion (2):
      dt-bindings: hwmon: pmbus: add lt3074
      hwmon: (pmbus/lt3074) add support for lt3074

Chen Ni (1):
      hwmon: (lm90) Use to_delayed_work()

Ciprian Marian Costea (1):
      hwmon: (ina2xx) make regulator 'vs' support optional

Daniel Grainger (1):
      hwmon: (asus-ec-sensors) add ROG MAXIMUS Z90 Formula.

David Hows (1):
      hwmon: (k10temp) Add support for Zen5 Ryzen Desktop

Dzmitry Sankouski (1):
      hwmon: (max77705) Add initial support

Eugene Shalygin (1):
      hwmon: (asus-ec-sensors) sort sensor definition arrays

Francesco Dolcini (2):
      dt-bindings: hwmon: amc6821: add fan and PWM output
      hwmon: (amc6821) Add PWM polarity configuration with OF

Gerhard Engleder (2):
      hwmon: Add KEBA battery monitoring controller support
      hwmon: Add KEBA fan controller support

Guenter Roeck (6):
      hwmon: (pmbus) Do not set regulators_node for single-channel chips
      hwmon: (aht10) Drop doctype annotations from static functions
      hwmon: (spd5118) Split into common and I2C specific code
      hwmon: (spd5118) Name chips taking the specification literally
      hwmon: (spd5118) Support 16-bit addressing for NVMEM accesses
      hwmon: (spd5118) Detect and support 16-bit register addressing

Inochi Amaoto (1):
      dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support

Jarkko Nikula (1):
      hwmon: (lm75) Fix I3C transfer buffer pointer for incoming data

John Keeping (1):
      hwmon: (pwm-fan) disable threaded interrupts

Naresh Solanki (1):
      hwmon: (max6639) Allow setting target RPM

Pawel Dembicki (5):
      dt-bindings: hwmon: Add bindings for mpq8785 driver
      hwmon: pmbus: mpq8785: Prepare driver for multiple device support
      hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio configuration
      hwmon: pmbus: mpq8785: Add support for MPM82504
      hwmon: pmbus: mpq8785: Add support for MPM3695 family

Peter Korsgaard (2):
      dt-bindings: hwmon: ti,tmp102: document optional V+ supply property
      hwmon: (tmp102) add vcc regulator support

Shinji Nomoto (1):
      doc: hwmon: acpi_power_meter: Add information about enabling the power capping feature.

Sudeep Holla (1):
      hwmon: (xgene-hwmon) Simplify PCC shared memory region handling

Wenliang Yan (4):
      hwmon: (ina238) Add ina238_config to save configurations for different chips
      dt-bindings: Add SQ52206 to ina2xx devicetree bindings
      hwmon: (ina238) Add support for SQ52206
      hwmon: (ina238) Modify the calculation formula to adapt to different chips

William A. Kennington III (2):
      hwmon: (pmbus) Introduce page_change_delay
      hwmon: (max34451) Work around lost page

Yikai Tsai (1):
      hwmon: (isl28022) Fix current reading calculation

pkarc (1):
      hwmon: (ausus-ec-sensors) add MAXIMUS VI HERO.

 .../bindings/hwmon/pmbus/adi,lt3074.yaml           |  50 +++
 .../bindings/hwmon/pmbus/mps,mpq8785.yaml          |  74 +++++
 .../bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml    |   6 +-
 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |  18 +-
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |   5 +
 .../devicetree/bindings/hwmon/ti,tmp102.yaml       |   4 +
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 Documentation/hwmon/acpi_power_meter.rst           |  29 +-
 Documentation/hwmon/asus_ec_sensors.rst            |   2 +
 Documentation/hwmon/ina238.rst                     |  15 +
 Documentation/hwmon/index.rst                      |   4 +
 Documentation/hwmon/kbatt.rst                      |  60 ++++
 Documentation/hwmon/kfan.rst                       |  39 +++
 Documentation/hwmon/lt3074.rst                     |  72 +++++
 Documentation/hwmon/max34440.rst                   |  30 +-
 Documentation/hwmon/max77705.rst                   |  39 +++
 Documentation/hwmon/mpq8785.rst                    |  27 +-
 MAINTAINERS                                        |  16 +
 drivers/hwmon/Kconfig                              |  29 ++
 drivers/hwmon/Makefile                             |   3 +
 drivers/hwmon/aht10.c                              |  16 +-
 drivers/hwmon/amc6821.c                            |  50 ++-
 drivers/hwmon/asus-ec-sensors.c                    |  53 ++-
 drivers/hwmon/dell-smm-hwmon.c                     |   7 +
 drivers/hwmon/gpio-fan.c                           | 103 +++++-
 drivers/hwmon/ina238.c                             | 214 ++++++++++--
 drivers/hwmon/ina2xx.c                             |   8 +-
 drivers/hwmon/isl28022.c                           |   8 +-
 drivers/hwmon/k10temp.c                            |   7 +
 drivers/hwmon/kbatt.c                              | 147 +++++++++
 drivers/hwmon/kfan.c                               | 246 ++++++++++++++
 drivers/hwmon/lm75.c                               |   2 +-
 drivers/hwmon/lm90.c                               |   2 +-
 drivers/hwmon/ltc2992.c                            |  30 +-
 drivers/hwmon/max6639.c                            |  16 +-
 drivers/hwmon/max77705-hwmon.c                     | 221 +++++++++++++
 drivers/hwmon/nct7363.c                            |   2 +-
 drivers/hwmon/pmbus/Kconfig                        |  18 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lm25066.c                      |   2 +-
 drivers/hwmon/pmbus/lt3074.c                       | 122 +++++++
 drivers/hwmon/pmbus/max34440.c                     | 119 ++++++-
 drivers/hwmon/pmbus/mpq7932.c                      |   4 +-
 drivers/hwmon/pmbus/mpq8785.c                      |  91 +++++-
 drivers/hwmon/pmbus/pmbus.h                        |  19 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  69 ++--
 drivers/hwmon/pmbus/tda38640.c                     |   2 +-
 drivers/hwmon/pmbus/tps25990.c                     |   2 +-
 drivers/hwmon/pmbus/ucd9000.c                      |  16 +-
 drivers/hwmon/pwm-fan.c                            |   4 +-
 drivers/hwmon/qnap-mcu-hwmon.c                     |   1 -
 drivers/hwmon/spd5118.c                            | 359 +++++++++++++--------
 drivers/hwmon/tmp102.c                             |   5 +
 drivers/hwmon/xgene-hwmon.c                        |  39 +--
 54 files changed, 2176 insertions(+), 353 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
 create mode 100644 Documentation/hwmon/kbatt.rst
 create mode 100644 Documentation/hwmon/kfan.rst
 create mode 100644 Documentation/hwmon/lt3074.rst
 create mode 100644 Documentation/hwmon/max77705.rst
 create mode 100644 drivers/hwmon/kbatt.c
 create mode 100644 drivers/hwmon/kfan.c
 create mode 100644 drivers/hwmon/max77705-hwmon.c
 create mode 100644 drivers/hwmon/pmbus/lt3074.c
