Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632125A2C5;
	Thu, 15 May 2025 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333366; cv=none; b=KcKg9dI1hB60+j3GSwvST88pA/H2K0qHz14JfboaWaabHv6cz/9zsmFv1qGecwKSPsAJMsplk2Xs5aGc8VodH9wA743ILBrVZmTKfH04ASZO5o5y3I0bd4sdM12SpjytGVdkMFP22yQpUROlXQ5y7uBdTbQNXgEjLf+kzqGxZo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333366; c=relaxed/simple;
	bh=GYk5cA6gRB41ccakAFTGZT42tM8y0OXq0VFbchQ7yj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UrXbv5rBoxJsyXDUIfNlbhpOoDbYVr0ecr6+aQHC60fIVvW/aS7IxCRCvCd4QR9oCALMhkx9G5hm5YkTJM1Xctu7uaN0LDo4SlA5jBSPepQMGE5L2XDHaLJ2t5siVNFfSm9h07eLzCvYht4kB7pOD0yIz7Eh0ZSFiuV3kKfNG20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYf28Gg8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYf28Gg8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af59c920d32so826335a12.0;
        Thu, 15 May 2025 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333364; x=1747938164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtWsckReCRQtRE89xb01EQuE1N22E23f2zPmXmv3YUM=;
        b=fYf28Gg8rAULn9hkk+Ktx2RQn8VNUSm1efKdYvOe1Xg1eMVFnAU7mCE5gJMWnoj1ig
         jeMEnVrbHcYJtQejuoj6I1RSz32Cc/eoUm2TjVgY51HTYWPW6nBoT/Oe3okxIsJZ3Qui
         RtVnJs7SWuxdGtgIWsgX/bt/bfN5c/92JfDFfDN4XEYx2NLE3KQelSy9G+HKM2u6Bwga
         tUxDeYlabAx7tpHqNUMcZWyIUYPc6dmYLwF1ravroppsPYqx0KotxNbaikHWE1ewBGP7
         VV9Ke+Y6b51GMqDqX3T0kE4vF573kjGaD9nZt3GkQY97xLsWT8Lj1SsvPP3TzFDwWdmf
         sa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333364; x=1747938164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtWsckReCRQtRE89xb01EQuE1N22E23f2zPmXmv3YUM=;
        b=aKMoca+3OAHtZswXyaax3j3NIHsNeXXj8NmMAWp4IV+r4uiL5JzfIU6t08XLg7W/YH
         QOslTKKjUEAEi+UkqnE4BeMad1ED0Wycm4Zw6Hhdf4rn8HTyh4zJgJVlOZZSHP1AX2eQ
         L8Y0KbdfilRExfxgJg+Aa3pgYMV3aYURkRWvXToFpOyci9epCyU9BhDeM7C1QLNrZnGW
         BqtZ0r47vkRtXcQt32sbBoRGVuytZ+Q/JcxOw4VFCdnv8khZKwGrSNwkRZUrhRiKuBZs
         Kz1uo4P5okcEOtA1k4SaHXq1n4oPatq4pyyvVVEDXlURxHOgciWrcrcVsmcupRbWc01L
         Nv5A==
X-Forwarded-Encrypted: i=1; AJvYcCVT+IrMaXQeMtYi5H8xnTS92MTHjoEGjFY6ru5TfoKyWrkwK6IlnxgnpLIjZxkv2eJb/lpcCsOGkqA=@vger.kernel.org, AJvYcCW/d9MyKSOavuuPpDMwsbiymhWWAC6T6NjEBYA7L1DPkQ3YoRCQUkJt5cqnjLzXojFQ+R8uhKDEaLuPM+GT@vger.kernel.org, AJvYcCWJmy7/sHsxkgylPThJsQkA5lbrEV4TTtFNloACNpLEeGqV41K5vquB2KkRPZfwE5DnXqYUUqbgLCB31seHg0VFwTgpfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxABmSgaxEvQUaCaN+iJ+/oHdZFFdz9KinkPzAGh1GKgeizb3cl
	nfJ8jC3yCJs0S+pCLzDPyLKpsS9BIepAM+a1TW+EKm2+v2ADQtFlFQ/g
X-Gm-Gg: ASbGncsd9I1dH6bYUZ3lIExk9iURzAH2rAqU/57WFnuivIWUVna1d4/wP2UJYHhgQRa
	3zbupgzEgmzlaU3hU6t3ZDV38J6gcBhXZoptmO5mW5CxuHR+H+lorKv77rfH1nZd3K4I1iUggAi
	WjyVu5jbydPy3l2/EYp7UECpNDvq8rBjUlwaTt5g4oyEhFxdJ3sp5jICFoqmrsLKF81rBb3UenZ
	2LOgNIyQVN6B0HqCn3qakDA7eXy9K37IqvmnLLwqSgKwbTlf6c/YLHOlrJlAt9AgqaGKDLSR0uU
	nt06EYFjeS57TlWUJF0ydc1NG8tb+loj4oVFmFvOYu3vyeEXfYdJnq23i8UdbwKamrYALUl2mQ5
	S3avU6c+2mFGMtI8Q6LXk2/Yl/au2R5QtnE41Uay1JnYBL5giYQ==
X-Google-Smtp-Source: AGHT+IH7nAQz+xzSSWYcMN0pAFA+xsc4y89xxC+vK+MQg6VdanZncKrQlsaj34mWmF05G8/m8T19Vw==
X-Received: by 2002:a17:902:f785:b0:22e:4c98:cd8b with SMTP id d9443c01a7336-231d43d9a46mr5719535ad.3.1747333364149;
        Thu, 15 May 2025 11:22:44 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e978adsm826955ad.119.2025.05.15.11.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:43 -0700 (PDT)
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
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Thu, 15 May 2025 11:22:18 -0700
Message-ID: <20250515182224.8277-1-derekjohn.clark@gmail.com>
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
v10:
  - Fix build error.
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
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 303 ++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 +++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  75 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 667 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2119 insertions(+)
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

