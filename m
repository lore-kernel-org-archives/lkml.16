Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5315C0;
	Mon,  5 May 2025 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746407225; cv=none; b=EfejXXoQN9FY/ZnOadKJBKT1PTaZM7wSulHL4RGYg95SOOJEGE8nAhONcgKU/GyDP0v2hc4mXmkVSZvm0c21XPa6EP3T6Z31Yx8HxD6mySp1jXB+5bQ1ppSavK/x+9Z9cxCvxH8eLzp9x9NY+aTZjywhJSQo+GGwZliBAndRru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746407225; c=relaxed/simple;
	bh=MzfVY3rOlputwHTZMMD89EQq/isETYUiisaWaiRx9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r486dNFmU/KR3Efnjns2QvaSFT9RWpbJcK/TOXBRYEsdL8IH5fzz0cI6GOkYydodmhKt3fo5ZTeTxFzy6ei6GZ+ZQfxhaWHP13QId/V8YMVLtkFQmAlX4V8RvQ3a/WZXQx9BubXtN/PnvNcVQgkRgkxxJVlcQHKzpXKjGHbDOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiCUA9Tk; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiCUA9Tk"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1f7f239b31so4060371a12.0;
        Sun, 04 May 2025 18:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746407223; x=1747012023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzHjsFjJwKIZOWyqGrXWV5zhCcowRRmarZGQK7BMMyQ=;
        b=HiCUA9Tkxjce513lCgPCaRTwMHQPCsjT6MB0PvPj1vg0cayS921Nh2EhGLzcYbm27c
         2DksZm5jma9taIvRyE5uKzumJd6Og0MM031JgO1BXPZ4FqJj3aD4tPhbi+nVt5f53Ice
         9fSq75RZLO3L+FV1dK4vAIGMVkUO1jMUuQ/GLM3avXIgxDtkL7CkYelVaMEj5R1DoyX/
         1zY75vT2m1DQghYM0IpIWydRz6PwuCfuaLSRO/SCiGatGCoUqupUR6Z2vY7pEXXOMQDz
         7ORkj71bCZbD5TAyTQcFjOycvRucQsY/5Bj6fELXsu/k3xtecZlh8B7Q86y3fiDCPfr0
         BRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746407223; x=1747012023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzHjsFjJwKIZOWyqGrXWV5zhCcowRRmarZGQK7BMMyQ=;
        b=BB1zDxDaOHvWzyZjfQbvDojTbOMEdOhIQDdA6iNHgvx5oQSWeBtMbegjNGuJHGGpWF
         uLpx/oelxids0tTmL07XVRI3DO/B3EPwxM4gZca6vC+6VOOVqOsJw3ZvKYh0b1UfmAgL
         aOEPdTUEyAcWuxZAfqlzQ+LBo+45Vs/JKP8DqQrUEtka7n06cRVo5aUSFW4HyNifEYjL
         DTLYEiWFZWfsbMi0Fh2n6W+LMoQn5Xm4bsNbqb8CdGu2dtFlbDJ/ckd+Z8xuKdICf/5X
         UL4YUxnfpIm2egcbrf1WUTG64SEh3NFqS5VdH4uVD2zxlmFfLdIaCLh32gRbGF5otRJ5
         /Yew==
X-Forwarded-Encrypted: i=1; AJvYcCV7F0c4cAmww3xJQ8Mr4fcS/QUkKAWtt67cIobRCoy5Uj1aBYRd/4EVXQvFN9IgSy0s+VjZZzAW/D3p5Be6lGhIfkmDeg==@vger.kernel.org, AJvYcCW4TlFk3O2/ZtgZ1jAz3nzMIL5XhIGUDdEaiqpuRVATDstQjMvxjPwW9XgGvoY/J23ckeQsCBcz0+JcFB3Y@vger.kernel.org, AJvYcCXeXdxHVXlb+DWu+7JE7xbRtctvajB0qA4L/Bn1+ZkgKy0GemMTcVRe+DeD3OsUg9DfPuhKltYZZb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQ0unfUoaVuHiEgk9oS8DO2NN9dIEjIdjO8/0Zr2dR61i42C0
	KNxGgW6oNWv2JXTF+E1bIvYKMJGDwR3vCtluB9VoIqj7rgqV2EsX
X-Gm-Gg: ASbGncufKIKSUTQXRwy6jVl5n/FyYFDxv8xjByPaImPa+jO/S4YUkLH8Mo3IE7inym0
	6UMLqIOTL8oQThP+k+kl2uDGP0xrP8XCzR4SKXS7HME3bDxkTy50Us9HgXcmTrWILuGoEQKwKRA
	cbOTpKOwju5wZkH3BmDb1J94dctulz+fKaz4z9lqC58RUWzHKZfS7Ooz03yauvNJuNoEOZrKDoG
	dH/7/NSrO4ieWjgl3hLdCDRcl6Yw9ahJiPdR90Haj8v/FVAVyJNJU96lAj2EYbsvHM2v06WHsmK
	egm9pOwArSanKCtqkr6oUm/tYpXYqNdKgIk8C3ggXpnELhcXkcMwRJZ2pQvkwao0fxkqAb1M/PJ
	EG6GVkGp29dXs5Se/iYXCIyAD4BD8NP48hc+6PJg=
X-Google-Smtp-Source: AGHT+IGls01ky9cR3incextDsxQUNC8GCwAEzTUUUZL7lQhdl0aYo3P8fyP2+/Cm5K4c+uF7Hwt56w==
X-Received: by 2002:a17:90b:2752:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-30a4e2387f3mr16550644a91.17.1746407223322;
        Sun, 04 May 2025 18:07:03 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34721015sm10194650a91.6.2025.05.04.18.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:07:02 -0700 (PDT)
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
Subject: [PATCH v8 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Sun,  4 May 2025 18:06:53 -0700
Message-ID: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 300 ++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 652 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2100 insertions(+)
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

