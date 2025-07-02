Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD845BA2E;
	Wed,  2 Jul 2025 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427514; cv=none; b=GpcfB5M5mLHk/w9u7+spjeVEdjTOKvvF52TLYESBBWngA6sDJvLBatLJcjKgqjckDzReZ5yyxe6WDmRZfTAoHo2xW6vdjdljElMIN5x7Jrzakd9vZluePob0fRs66olKVntg2ayNpvXOyTzFX6GQ1xIAbyRM3OnfiwUSopqxTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427514; c=relaxed/simple;
	bh=I42dZA6BrIQ0jKmJPjFKpXS5ub26rDHIRJyhzt+TrBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rM2Bvv6gli9taKc+1e2PXIaJlU5ZndJGLgg+pdxBTFrB/V+/oUb67CAtMW+CS+Y3FgW8dvuvEw4LBTTSLSRKfCPSNe8IpRL0UUUmVL9/WjBsqiDylcEaJu8MIY2eFLOcYt10i61vaO4YuIrvFuopS9i+W4eC+lAnpI/d+ibcY2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOO2mkKj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOO2mkKj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b54af901bso63442b3a.2;
        Tue, 01 Jul 2025 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751427512; x=1752032312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEC95VJb0bz9R7l4xl7+6JDksCDLZKzGYa+BlumQWz0=;
        b=hOO2mkKjwtmynWa66C0CmpDtIkX5cKwAv38zByMG4lpsuVdBAMWIFZ9GtnNTsAYESA
         draS8hehNdtrNET8JJshBfRtLPZLFk0Q2NJNQcdDyhYqlIXDJzTWODs2H1+ECG2wIgHU
         fgiOw1KBcUNo5xGsnImIQ0MQgHvjlZhJshJgt2MwwxmbDfMvox3cfLTCcKV6Qe/NRqpJ
         vePViVKkR1Sc2TNzV4ljLk18o/mdog9L5NhhdkHze+rXE1w++J7eyTiTw6BnCX1Zkxdb
         LdUGCCOc324JwwuiPu5oEdLDjsugqEFOkfiOAmankkKkpiLINEuDiwiZZ7Xqw72oJfZw
         MUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751427512; x=1752032312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEC95VJb0bz9R7l4xl7+6JDksCDLZKzGYa+BlumQWz0=;
        b=HqRJQkQefXoX1N6aUv4TnYpA5qOolfF+z1gfq/bs6wu7wCY6gY8Ljk5gTcViJ5I51O
         NMAmBlM+F5AK4CNRbv8hqCbIdcz1YutO9h5cnix2olI1q2MctXuU2dVbsYjUF/+mTp6e
         DQBRqO/744g0G1YxG6NiV7JrLJf5rH9cFhHWVW5AdMyB35xfe3UVwcEIwq8ZpNaX+DaA
         AnECVrD8KgSGTHJGBBEH6o6ieARIYL8GRS5dEU/mqhs2uyjvvCUA36pztSJU6RMeHLid
         aAr20UcLsuXXjn689dOtDpmMcF4ZqmIAP/rgVQwm19W14869JhyTnS3ifd1PNp/Gj3UT
         9yDg==
X-Forwarded-Encrypted: i=1; AJvYcCVzBHQIcikYiFPVrCBvDz/4qt332C2CvB88Jb0pkU3C0ZAxOD7RYuPo7GA9i6mfrB4p8UMWRpM/4PlPwJgS@vger.kernel.org, AJvYcCWTY/O2xV2r9nyfPjaTKvxqzIYHxC+FnZBf4gi6ty+60xsYboL2D3ze7LTJYD9akd6phDVl/VAZ4/+yfjlH4YPbzfEzbQ==@vger.kernel.org, AJvYcCXXFgRhMCTaHnOI8xLDd3+E5yVVFsN+30GWCRTn1Wq3aXuIvoFJ/kP717OroPbgmCRYVdRTQcsOfQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3X0xgkjK9JDm0LuzLJq665bmeUoVR7tbtqRfYzMtS+f8WgeLp
	WjSGQqDzZF3Ctxs50jYYqxHsfzSiw4OkEbaQpFQCHKQIP2XG2NqEyoy5
X-Gm-Gg: ASbGncvry6z9FZAXqJ829eaL2TZbE5efsjQjVy2LLDDVjKWt/oBtAAJFbN2nK+2UdXK
	BKwZ6LLEhH2CfM4ChTtHNEkYCCnxL2o8kE8frtDn5aMLTrZGSSWiYaIyFaZ8DGk5oI+/q6hDJxN
	106E0XZThGbQ6jfanDJ2xjbANbH4f6kIfCaTTpjAqpFd3/JimH0wnQp51JsRN2lMtup6gKIbvCA
	S0RR21/HTQ2YRav675ra1b+AhfjQ62jUyNj2ShNFuxh7zqU9rf0kTQxit80qM9xoveiMgc9vddx
	Lg+aAJz7T8Uym1L/vQhqPZmJbMz9wjSjS50wBvuoouzL2qsjZ2uugvjFyRfnWwF+ae+h4I/Hfg8
	dw5N1uCkaFnj7NoXbuYKRhmwj4KwVVORbOMINefUlaQ==
X-Google-Smtp-Source: AGHT+IFl+ogsuNHtBnrM1RRuRUoJ7a2vT+PN5+Utd5ZCqqU/01JIgy46EC0TZadlRv3r8Wrq/szsuQ==
X-Received: by 2002:a05:6a21:b93:b0:215:ef08:5555 with SMTP id adf61e73a8af0-222d7df31c8mr2316401637.11.1751427511987;
        Tue, 01 Jul 2025 20:38:31 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301d64fsm11783008a12.19.2025.07.01.20.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:38:31 -0700 (PDT)
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
	"Cody T . H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Tue,  1 Jul 2025 20:38:20 -0700
Message-ID: <20250702033826.1057762-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
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
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v13:
 - Move drivers to new lenovo folder
v12:
https://lore.kernel.org/platform-driver-x86/20250609185027.7378-1-derekjohn.clark@gmail.com/
v11:
https://lore.kernel.org/platform-driver-x86/20250522015350.471070-1-derekjohn.clark@gmail.com/#t
v10:
https://lore.kernel.org/platform-driver-x86/20250515182224.8277-1-derekjohn.clark@gmail.com/
v9:
https://lore.kernel.org/platform-driver-x86/20250508235217.12256-1-derekjohn.clark@gmail.com/
v8:
https://lore.kernel.org/platform-driver-x86/20250505010659.1450984-1-derekjohn.clark@gmail.com/
v7:
https://lore.kernel.org/platform-driver-x86/20250503000142.1190354-1-derekjohn.clark@gmail.com/
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

*** BLURB HERE ***

Derek J. Clark (6):
  platform/x86: Add lenovo-wmi-* driver Documentation
  platform/x86: Add lenovo-wmi-helpers
  platform/x86: Add Lenovo WMI Events Driver
  platform/x86: Add Lenovo Capability Data 01 WMI Driver
  platform/x86: Add Lenovo Gamezone WMI Driver
  platform/x86: Add Lenovo Other Mode WMI Driver

 .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
 .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
 MAINTAINERS                                   |   3 +
 drivers/platform/x86/lenovo/Kconfig           |  41 ++
 drivers/platform/x86/lenovo/Makefile          |   5 +
 drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 ++++++++
 drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 +
 drivers/platform/x86/lenovo/wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo/wmi-events.h      |  20 +
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 407 +++++++++++
 drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo/wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo/wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo/wmi-other.c       | 665 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-other.h       |  16 +
 15 files changed, 2105 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
 create mode 100644 drivers/platform/x86/lenovo/wmi-events.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-events.h
 create mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 create mode 100644 drivers/platform/x86/lenovo/wmi-helpers.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-helpers.h
 create mode 100644 drivers/platform/x86/lenovo/wmi-other.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.50.0

