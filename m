Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBDB23C9;
	Mon, 28 Apr 2025 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803238; cv=none; b=rLonhXHtHEH5CW4CZ+vk7C17DBHAnU4xHyEG9g/UHovrDWTWAUf8kgUmISK+eqMO0hgfcsjAk07kvChYmlu7VLHAjwIcaCBb3aoDWH43Yzyv+iVsJOVlli0HTSRINvWD4awUA8d7cyhEq+oBp5vu3gZzZtD3MTEENoBakSXsDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803238; c=relaxed/simple;
	bh=kWwu8LIKM3j5hrbgQyEovQsKBVXoLN7H8yE7kIAe3gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvBODFyawDquLN/CgZHVHYlXGHoY0wxkR+yxvQAJp2XjoI5PkMAxswvZ3PJ1wAQ4rhD24rYxv9WLrKopBLV5CgsHJ+Bk/XBVYObgJF8R5YK5fUQnzS/5MrC1x+DmS24d70xHxF/B2YJFKMPDXzR/vsyTxJt7FPcZ2Xn65NwvaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNSnkbwm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNSnkbwm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260c91576aso34885395ad.3;
        Sun, 27 Apr 2025 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745803236; x=1746408036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqphSzni+4yGOSnkpx5drqMB3rm5S1CcB/wMfBQuRrQ=;
        b=UNSnkbwmnTrwlMQv9bFkNdJyESeED4PBiI8/3yVIeyR1pGt5+8kG1sgNKGBXzgZLfs
         PZe0HkCGL2Pxw2+qK8ArnvP3YJWcLLIk9pSg0v6a9P8D2OlUG2E87O3n3LupI1WrqZi8
         z4FdDjL6xsVbfCGt/2LMqDw+mC8+mAhm9l3+EfRm5jVshioeXxIfQXqK35BR0cbrn8ed
         g0l65HxpDV8p+WwuL6KLDBMwP4TImy9B9+iACPD3bLHKUtGk2I88W9vtrXYVhU21fkEw
         dbneig6mFY9JuDDxkiX8Hb2BR2im2e6kSzSTGiT53itWfJh0OHILhS1EC8u78JZTFhGk
         5DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745803236; x=1746408036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqphSzni+4yGOSnkpx5drqMB3rm5S1CcB/wMfBQuRrQ=;
        b=LvbeM2L878B4hiNsMQxNxdxUPpBsCgWpVgZmIiHc+iySXAOG4m3f1dIrfnfupnUCxs
         9zWLucsbZMd5niDcrQwFRJjjhjjAwF0+ALWjc4hgMtlGuRTaX030pKEyiiR4koQdVjsZ
         +WMFxgInWWBOE2tlTMmBkf/gOjjIkR+Q05ohg8cVS2Rn1WoNquzrah3FxlHQMQeP6IDr
         zV1AAgaeytc8cqka59FK1EZmj6DeYbwA3yJNzf3JZPr0gy++e65pCLV4+uX3J77uV7qu
         ILXfP7Ar2B0WcFjpWz43gQS3m0qCxB876SfugasBGPVmE+syLJfjX5v7nzkp1rkLN0vG
         RYiw==
X-Forwarded-Encrypted: i=1; AJvYcCU5uQQBVvjE0lui8hnoQSveMRJSkhTpmyQK8hU66IdC9RvXlMA9gqknQeljbpOxg2HjNDAH7o2Hs1oHs3ylFxNyiR4GBg==@vger.kernel.org, AJvYcCWa977FoxsOpdtFBPe2LkGCDYK6wATBIftFxzUguXsEZzfih+x3/R9iGzR0eQhHbvv2iGXa4YmCoVk=@vger.kernel.org, AJvYcCXjrOr0IJM6zmqXQcMDnAsiJ8dFvuo/RwEJdVSug4KVOuiMZCaNMfjj+sBRPytrF2Y+1r5iEdIla98FPQQg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+uSf5000bSqMCNFxAGEzFYZASKBNGlR4I16tbnqrjIFDmdls
	To2JlA7uKWgISWccWGMgh+X4qinLocS98uL8lnCDhWsV6J7MVomt
X-Gm-Gg: ASbGncuN40cTNPvnR1o4YhtNVi2NKoNmBM2o/vICoprBVvMZvSmHwT2wT0BmOlGSb+/
	+nIL1jqUmSU5yW5L1DVuMSFPsrSgsK+m0K5v2GmhZnyX5j05Wae5eAGX/2ZxkYxba9mvibLU+GO
	D4l3G1Gr5xn2MhRxCpmBpSAWva7/kS1SuUWTVHVqKRbJWRTrZ1m5T3qwgzrwnC8OZ9Y3xuqtsjQ
	zfQQ3BWtrqI4IaYoNcdME0VGMLO9FpCeq6TKHFAaz5zZyPhpAr9nC9369B6a12mbiYzPnnrY+te
	aSTSh8jN7sO7CtojUJ0Wg77x2lztDrD2XDzWpMoKINwl1OlxC+2r72HIowy/OyjFZrj3klBAv1o
	GRL594jNz2hYmKB96LfVODCICvYnrwm9ADI3zJ7g=
X-Google-Smtp-Source: AGHT+IGgxz9xeNdwv9W6IXzTAdTGWpME13etGEMnHJDHkTboJqN+o0gFVzBZ4rZAD5aMHP0q7E9+hw==
X-Received: by 2002:a17:90b:5870:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-30a013069f8mr11222147a91.9.1745803235447;
        Sun, 27 Apr 2025 18:20:35 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm70334725ad.222.2025.04.27.18.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:20:34 -0700 (PDT)
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
Subject: [PATCH v6 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Sun, 27 Apr 2025 18:18:00 -0700
Message-ID: <20250428012029.970017-1-derekjohn.clark@gmail.com>
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
"Lighting", and other data block interfaces would be trivial in a later
patches.

This driver is distinct from, but should be considered a replacement for
this patch:
https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/

This driver attempts to standardize the exposed sysfs by mirroring the
asus-armoury driver currently under review. As such, a lot of
inspiration has been drawn from that driver.
https://lore.kernel.org/platform-driver-x86/20250316230724.100165-1-luke@ljones.dev/

The drivers have been tested by me on the Lenovo Legion Go and Legion Go
S.

Suggested-by: Mario Limonciello <superm1@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
 - Capability Data max values are determined based on the power state of the device.
   To ensure this data is accurate, recache capability data on ACPI AC/DC events.
 - Use guard/scoped guard in gamzone driver.
 - Use correct types for casts and sizeof in some places.
 - Fix formatting issues identified in v5.
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
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 272 ++++++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  29 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 409 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 655 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2080 insertions(+)
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

