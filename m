Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E601748D;
	Sat,  3 May 2025 00:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746230509; cv=none; b=TbFowCCkNWmXY57GzDDi1lCCHlMcDQk9vlqZqYW2oswnZRwzBMKrQ3YjkXCZhsJ/IYl+5tgtIE9mFWUy9va8o/vf3QasQEFKFA8fCI48CRi1oQQJyHtBX8/iFigzzUBUVwMcSRU8mqbkMsVMTz7b9gnv7R59uKII+fJt2OZqpd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746230509; c=relaxed/simple;
	bh=/3iIX7PVhNzUbutks3UDPTagPJMj8KtqWgJnpOxh6Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCEsjB700r+AwX0l8Mgg0IbjDIcQ4KPcJkdHDP4nrn4TEfaa4g906aTsH3v+Q332KdlVTQbLhRGkZdPTKZ3LU6O8VvwyX3KWI+/dUdyEeGgho+aYa3/ew9Yca2Jfmb4JbzjNBOTL81ZTLsArU7dwBPJQRILsHM0nqA1OhhO/LVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaQ3pLhV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaQ3pLhV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2837740b3a.0;
        Fri, 02 May 2025 17:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746230507; x=1746835307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejwZgQ/884axJD7sMbxxvDt8dx+k82GtvuY01lW92yw=;
        b=YaQ3pLhV+5eSsjM0YV2uuBP5G9Nrq/HZnqfXr2JlrFvggAbVGrAjuPAr0Cm0CfTSM+
         KsGpDeHcaH6xaO7vG+5dJQxjo71J2aw5C0qEEtlVTexcQppfXC5rPLqE03u7SEON+PhS
         I5vlKsf4fG7I2gdBDgrD7Q4wzktr9OE8yDlawNQGcQXE9tulYVbKxyPPyL7uRqsd090S
         PgNsA9uPVxcrv/5iR7Ltiw2IcIp2luP43IisvuC69cdJ8uJY5RqOI09LY/nqomQ6k3pc
         t16osp/UFi1O76OgopWVHGL8BTg64QhWkREmBiyVfAK0n21t5PctEKZE35AIpCW8eCeM
         FKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746230507; x=1746835307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejwZgQ/884axJD7sMbxxvDt8dx+k82GtvuY01lW92yw=;
        b=Hc2IIRuQGBOuP7gxilbTC+ktTAFn2lsHF1EuJkTJgW5ZdonEt5S8tpQJmTH9YI1dJg
         c62XY2ENOV5rE1fP/C3QwuA9NF1/0CvFgWK4tWkMNOIRq8VOX3DVQqM2ZJGZ6HxjKMFk
         JIBDV6A/xVpo8lXuZ4fgRs5ENggNNT86Y/Qpr86OLp3cZ/W6/HC1+sXeWmw2Ddz2/h+F
         kXe7WfS2TMZbClrf3SsWDvCTV+jWdN1j/TkjjuL/3uU+HEgR+ZsmA/zXB+zXuJyO7U1Z
         y9c4/KssG16/6RLU2JR2tFXkmf2h+B+llStk9j9sRYN2VUH6wplSVDEdJsov8TSsY5Vu
         DUqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAEF7ppRzlv4ey+XJXh3tvmqb47ToIf0lT6VTBOE9KuPO9h8cmQHR9qEir04+cZs2aFATrbYtWsJI=@vger.kernel.org, AJvYcCWUVp7FObMEuaRQIQOXYtjaNX1HC8ELgv9qqmVBAm38MEAWZIlP0DQ4KV06LM5RaCBw+aZqZo61rdjEQ8sBLmTZBbkPaA==@vger.kernel.org, AJvYcCWcCCe5BJxkjjaY/XU07HOviPQz98KX9qY9k4TTBvS+3GARzUbJnKzI6vdjmgqjLXQTwQpuwNuUGc78nUrQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CbTzSK3wIPKeHUJXZ7LYzFvr4moItVBHle2MDm1o+U0ZDtS8
	liezXtFcMHUvoIvWeOCu7BpeYM8yuIcQA3v9buqUZ3Iwua3ngFeI
X-Gm-Gg: ASbGncvuZtYsbkjyPO0xPw3GZw5D0rIj4pBgQkmqmojHEVXGO1VQSlgj/GYb/HQ4Xlh
	fYe0YzMBkvSeJ/TDRIuLMpQBBzXCVqgSKBaWzc8iJkkXtZqJRny+oVTKxKufV6yYrkN1FfYFrpe
	8AoWQZ8NQfSPOS7xRQqmHoqoaYu3pRptnOMjwlJFw0BElzLy+WiKaen5UP8/0l4KIXR/ZXjdnCN
	h+ax84bHCaBHFFMp9PiB/9dzv1QwyiwB0Pv0h+KUTouKgozlnpoXUftdBLdWMWFb4nyTJbdxMbl
	qqUmGMbQMWIu3qN09zdmGewdG+ut/UgO6Nx1POJhouc/TwPuWSA1bL6T4xJRtwYfVCkfmtY8URN
	IntIwkHltL0LX9otWkfBRN10BUhkEAu1o/z8h5ng=
X-Google-Smtp-Source: AGHT+IGrfilJOwSvMTgObyBXUUs8IgDTvbwQeE3LZC/yQUlI2NA2cICG8ASRjv1yse/n6S9v+TpZkw==
X-Received: by 2002:a05:6a00:1ca6:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-74058a22346mr6380895b3a.7.1746230507538;
        Fri, 02 May 2025 17:01:47 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb0b5sm2206680b3a.41.2025.05.02.17.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:01:47 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Fri,  2 May 2025 17:01:36 -0700
Message-ID: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the Lenovo "Gaming Series" of laptop hardware that use
WMI interfaces that control various power settings. There are multiple WMI
interfaces that work in concert to provide getting and setting values as
well as validation of input. Currently only the "Gamezone", "Other
Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
I attempted to structure the driver so that adding the "Custom Mode",
"Lighting", and other data block interfaces would be trivial in later
patches.

This driver attempts to standardize the exposed sysfs by mirroring the
asus-armoury driver currently under review. As such, a lot of
inspiration has been drawn from that driver.
https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luke@ljones.dev/#t

The drivers have been tested by me on the Lenovo Legion Go and Legion Go
S.

Suggested-by: Mario Limonciello <superm1@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
 - Fix minor typos and nits from v6 review.
v6:
https://lore.kernel.org/platform-driver-x86/20250428012029.970017-1-derekjohn.clark@gmail.com/
v5:
https://lore.kernel.org/platform-driver-x86/20250408012815.1032357-1-derekjohn.clark@gmail.com/
v4:
https://lore.kernel.org/platform-driver-x86/20250317144326.5850-1-derekjohn.clark@gmail.com/
v3:
https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-derekjohn.clark@gmail.com/
v2:
https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-derekjohn.clark@gmail.com/
v1:
https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-derekjohn.clark@gmail.com/
Derek J. Clark (6):
  platform/x86: Add lenovo-wmi-* driver Documentation
  platform/x86: Add lenovo-wmi-helpers
  platform/x86: Add Lenovo WMI Events Driver
  platform/x86: Add Lenovo Capability Data 01 WMI Driver
  platform/x86: Add Lenovo Gamezone WMI Driver
  platform/x86: Add Lenovo Other Mode WMI Driver

 .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
 .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
 MAINTAINERS                                   |  12 +
 drivers/platform/x86/Kconfig                  |  41 ++
 drivers/platform/x86/Makefile                 |   5 +
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 301 ++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 657 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2106 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
 create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.h

-- 
2.49.0

