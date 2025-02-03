Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074D20D4E4;
	Mon,  3 Feb 2025 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607246; cv=none; b=GM8oVNA43Iff9O9tTnYckq4+aOexHzUL6i9s4AuUUAYVUEg7N/dS6ERVMj9qYEq8q1sdoBF9j2cIEKSC2wQE3wzQidJ6rpEOdoDOdNHdGI6V7zazd7IxgzbEtLMrrQOI/JDNwtmV1kvN5KX2qPe6cvIdpwKshyEzCgnwGOkskc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607246; c=relaxed/simple;
	bh=DDrvRo+Gf+PGOeNtRceL+ZPExeki5R1qCPGmDylntFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RkLnNIGf+oHdbzcs3FzFp54IPm8wWl27Q4sN8JekYDhUWYPPSz+w5YSsyYsQ6sctbV7lr5FLMUgj+ckzRaL7T5zeei/zDNwy/5xkriXbHKovDg4fOtNFgOInCqYBlLsyxTCqt0CNxJk6jBNsWYB3KRE6oTP/jybzzrYyzLwJidc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfL28yvE; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfL28yvE"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e4419a47887so4167052276.0;
        Mon, 03 Feb 2025 10:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607243; x=1739212043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiUpiHeXkdztXT5xTNGwjsZk7BUT4ndX6tVOpDnPzgY=;
        b=hfL28yvENdrhCgzXrD0pXNMeVi2x5wlvnQzt8dsK1lF9ychIM98bSpCUnh7XV5h3TP
         EsWIKu9AXXjG2HkqLdA7KS6UjynopFHCytjPYlIcO/kLmwlTuaL/AtBobktYmiM1y2gZ
         6hZqjI3eWNlCve4wcRmQwPeeQL616neTIMJ4RfotIzWYWha1XOIJ9RA2TPfrxqgUi+11
         xyuQTy6IRGSOXMq0u+u0mbWwco1mBluUAFPfwm7yohyvTBtqwqy9nxZHs+bEx/+9ZKmd
         5jU4PtkAP4/2HkVzYflp6PjIIyLeI3bgFLpOUNTY7VqeT6ayM5miwluXtui6bbjZcHuH
         b01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607243; x=1739212043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiUpiHeXkdztXT5xTNGwjsZk7BUT4ndX6tVOpDnPzgY=;
        b=QeTSbECpBghkTc9kSmslkN1hJuZ5QY5168xkqqmlZAqHF9BU1+EK03MBoq6ZLC04q9
         o7fIndSMmEE1cLjpQbPvaqBfwzY9rpVg/a5q4QJ3yw0oOwt8u7dcnCup/WM0JYwmAJqX
         tu+VUCHdmteNQv4iudVnCrbr0tkOwyec8Wl98daMY0jCQ2hUqlkRX4nWZFap/JgoBxQ2
         HBYN7ePjmu9F0fOaTaeATa5EgycPRPl0C7C2f4BXnLFF13LKAzQY2JFypXJ7cyyFU4UH
         1CXkGzr9VUd4ZWI7fl1I+iqlafGnXNjKBPtHinka5sCv/v681+wSV3/NKTh7sTWw2NO7
         zwhg==
X-Forwarded-Encrypted: i=1; AJvYcCVWi0SD9PobH0UZfUqk8HYMYHVwM+KQuttZiLh2eIso86gJyeTAMp+9GrQ/TmXGYq3umTzfJ22bTz9VFiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5We+6SIWNRX8EHfvB+2hXCGeAQGJibJXZrLpQaSSYpYI08ukL
	7NhSZBltcKDY5NJ9d8sxvceHm6wJfqh0HKx1NMA1W73TO5LUZbUpJdvQYg==
X-Gm-Gg: ASbGncvSebKxAFM7JYdjjPej9iXPBt0HGeG9arTwAToXAZ9DDSJoQnMDpIdOYKHTNcD
	UIu7sAtmrLNdQyTvbJBLtsrfC/xUzqsaQByv6+SXFWerUj9dzhCMYiQ/jswt01UXgYXx4NP+a1R
	2CokRKr6AoITwbTYiO/fu9wNZgRl3gGLa1UZTpwrRstH7UcyLO0QB6Lt71nsnco4M/Fnt/lXfS9
	Tu02iXLdlrPpARFDA21sX6cKQF/pjkCcPjxPDYFV9Ya5/OKWOMkoYKPBRpMIpujUnsZhDaCZAW6
	L6epj/XK0JO1Ibri3DsQeyY=
X-Google-Smtp-Source: AGHT+IF55q07Igklw8fu/B9WG+YvwYJc8TqjO9/fVFWQXRRP5VWIzTDPTjLk+aawBozNwmSHdndqng==
X-Received: by 2002:a05:6902:1105:b0:e57:e500:16d with SMTP id 3f1490d57ef6-e58a4bcae81mr17647831276.39.1738607243450;
        Mon, 03 Feb 2025 10:27:23 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 00/14] platform/x86: alienware-wmi driver rework
Date: Mon,  3 Feb 2025 13:26:59 -0500
Message-ID: <20250203182713.27446-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello!

---
[02/14]
  - Dropped device_add_groups from wmax_wmi_probe
  - Added `interface == WMAX` condition to WMAX's groups visibility

[10/14]
  - Add prefix to WMAX groups variable names
  - Exported WMAX groups as extern variables in header file
  - Exported `interface` as `alienware_interface` in header file
  - Added WMAX_DEV_GROUPS macro to add WMAX groups to the platform 
    driver .dev_groups

[13/14]
  - Define empty WMAX_DEV_GROUPS in case CONFIG_ALIENWARE_WMI_WMAX is
    not enabled

v7: https://lore.kernel.org/platform-driver-x86/20250203062055.2915-1-kuurtb@gmail.com/

Kurt Borja (14):
  platform/x86: alienware-wmi: Add a state container for LED control
    feature
  platform/x86: alienware-wmi: Add WMI Drivers
  platform/x86: alienware-wmi: Add a state container for thermal control
    methods
  platform/x86: alienware-wmi: Refactor LED control methods
  platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  platform/x86: alienware-wmi: Refactor thermal control methods
  platform/x86: alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform/x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  platform/x86: alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  491 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  775 ++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  117 ++
 8 files changed, 1530 insertions(+), 1276 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

