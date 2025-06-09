Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACC1B4121;
	Mon,  9 Jun 2025 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495040; cv=none; b=ThcSbMZk6hXhOJs85vjCRkD4vN4QjdakYfukC9WrdkxWYB4QHLjo6coWdwu0be7WDU9fEYGThVrmaaU2Fz/PQB/SU5t4H0CBQYjdP4pkWlWRZVgZF0ShSslyUeSTZd86nhWNipq/vMSOvgYEBD1wm5Gga4I7mUSTH/EEkmg9PfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495040; c=relaxed/simple;
	bh=4D/QkaIrvIGoz7Dmk8fY0fnPMKOpONTp0mZAjMTzHg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBjToxZgvmH457DSHG4ehd1+tzUx+hetcjji1o8kmeLa0nXwPguQURjzO183UPw0wpPuU1w886J5R47lkdi+CuWmtce67Zo8WOS4R88M0E7Td0AxAoVVszvXjnrm2Lvrn3rk3t+003wnNAqNYjVTaKKJUEZlcCFE1Rm9j/nk5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etBGLdGU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etBGLdGU"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so3986756b3a.3;
        Mon, 09 Jun 2025 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495039; x=1750099839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVD9bSDa4wDIKvOapX6GB2hIY+Ptj8Km8QIbnx4Kaso=;
        b=etBGLdGUiZw26b5BDISPTVg5DGKCOpzYbzHgLyQ513pOx5NZRFb70BhH6L0cTKpq3i
         Ws1bdUcipINbSaJUrak+X8UTLHIkrMj7dpjBvbNsw/880JhMSgD82Lv/tRckjukwLosi
         KqUncECuCqdlb/wS9JnL7Tj/9podWfhxHDWNXSWk96k7QeCJikb+Op0Hby7jjw1jOt44
         //WwPuQpVqrE5EPckgN5jfZK7+3EWq1QbaGhWVR2WiGuuFAe5NK6R33SewSpeoFatPEq
         twEwx4KjBexO0Qo7K7vOTrRQXZ16D3h7BFhwBftjPrjODU98HMU4PX3TFz3jPqlhsX/q
         l9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495039; x=1750099839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVD9bSDa4wDIKvOapX6GB2hIY+Ptj8Km8QIbnx4Kaso=;
        b=SOXsIixB7FCJDfmgMlDkZ854oV7V08JSFmnzfY+fQ911QPBynUf15iU3Q3kzELfO/L
         bnmYSq5x7+4iNYi/tbVEXPAeZjk99YSQStMrGWaW/di2E3nCvD4J42HA4UE+0kw2wsTn
         t+D4thi3Hkme1N+/Yz9HfNlba+fmwjLofQFhQuURvRmI1M3WQdgGKWHYiLtw5rawLctd
         yybv+zT+DuLoeQLQ+KblVSuWVvJobOGuE0ITrwEfZTujcGEVVRr1SAoMYcpOUpTID3tR
         OEhOgM2yFpOWrB+PtYsMmMJUguwysXdq1/U4G5p9qdAmoKR5cz9sR12BtOhh4jJ1IlvP
         ru9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUJu5Vk2FeD+wAggD+ybQs/8vtJlUWnDgO1p4T0vFxSya2wwLHJSqZbnPTiovET7KdGP7tJ+GyNMrFKFD7@vger.kernel.org, AJvYcCXHAWelyokopAXhGIi1gCo+VYjPmvxS8I5x/y7T+IZbotaaNOv8CStpLG3wXAUxUFJSeQ9T9Debum4=@vger.kernel.org, AJvYcCXWsTHRWCnoUfYiPfKrz1X5Gf8JDrQVKe+JRf6ZT754rVpJdA94Jswf4EjVevRi8czhHGZMOU98g4N8vkgKz4yKHzTpmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYp7T3nHJG3xRCfYUYMPdUhCOGFBI9j1PwO/l4btrGK4WjVqT
	iWkuAjKcUqQ/VcRtMsjiO/yBsJybmt0+orXvaA7ZVbqQ2hzmP1eySWIR
X-Gm-Gg: ASbGncvUc8T8Vu6olQfmBgW/s8l9OhE3iqvYYI7CVjx/OBPpqiPq+pZyCyoJJ5hgxhY
	0lRvW2b6FBFogx8Z162oFT+aRZYm4MdtLSbayhfwyatTTiJIo5mMs+E9/3JaEiTKoh4dWqLOIzd
	DOVu3EZIAGwHt2zGlwbeklpscj8ZboCvbwlCEFYtp3v0LEauul0Bu7kbYwjRW2xn4FFjO305kbe
	+qxpFzepKy1ElWeHqVSkirzQ4q8p9174lFpGPJW7zZmxOVjIJJcsHTjBuR7f8chgz84CiuEqRoV
	Whel02TwBhJnH9UgXhukQplwHijqHUJlxXAmGcmh1KJuA+E4/gF1cezMnQozucZADQz6/BC/9Qq
	y5WODrxQnIaP8xAKQdN/GShX2XHIHqYejPOiDV9xOaUWCF5oqSw==
X-Google-Smtp-Source: AGHT+IHTzo61VPYPo6yS1mpw2YckgV6ImrNivcBE+B58c9Hm3g//WaGGNbLBJMKeCeYaZxwTNOSl/A==
X-Received: by 2002:a05:6a21:339f:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-21ee257b9ffmr21862920637.3.1749495038585;
        Mon, 09 Jun 2025 11:50:38 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm5625461a12.10.2025.06.09.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:50:38 -0700 (PDT)
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
Subject: [PATCH v12 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Mon,  9 Jun 2025 11:50:21 -0700
Message-ID: <20250609185027.7378-1-derekjohn.clark@gmail.com>
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
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
 - Fix warnings from make W=1
v11:
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
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 302 ++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 409 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 665 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2116 insertions(+)
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

