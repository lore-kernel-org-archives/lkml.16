Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22701E4BE;
	Tue,  8 Apr 2025 01:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075708; cv=none; b=u3XP/Crd+5zE3/OVIGUDfvLDHhV6rKhRT09LyXn1dK3YP+BQ9WMTxRukzCEFJacCDmYs4Ydho72PfuYkeEyr7hD+IcM4XsbOTvGaZ8Xfl5ol4jmt8ZdVe/tJTebXRpahVtAiZPGdQ+doT3U3COIRQLNMkwOte9L1+OAu7ES/AHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075708; c=relaxed/simple;
	bh=hREfw9yG7c6jJmmXCTI6XFFq6cadBaN2KJ+yJJrvpgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/UReJFX0qhPY6gHTi1zfW64gtvTouvF02KjiiXI6iaQsnuPtogX/HEzpCLNM/v9+wUOrvzgaA+bfajYe0gwlR9f47je2dI+oApVGtKuDx1Zm01IGEqMXXY4xtCsfJGcejzIIB4ZMJSq8mDNr0SOFvsIcjJuJG/Zw1NMYj7wiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNLDcrlG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNLDcrlG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22403cbb47fso53441085ad.0;
        Mon, 07 Apr 2025 18:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744075706; x=1744680506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0k1JhzrQKYTARglcHxVoXjxU6gC3Q7ClVe5dF/7ealk=;
        b=lNLDcrlGMshndhlGb0dkoGhRs16IGYrDMq0TuoitsPmDurMGjuHy0Jkx7SD0nup4Vl
         kJBrL4wrrpi6E3edNAOqkIq83u/quzNNKCJryStj2kqwJIhUEnvIhbGiU3tteT5gK2+d
         Fq4VzEl444vG0TEUAOSdLHXUVY+3a+eOnB8ux27mvWYEYSg3P42yfmDQYDEjfeN+H0Uo
         C1emruYg7HNvOQOBYb+dR7Eo21WR5C0VQUJ17aRN5ySYOkjqlYPkvvHrQQBtb9kMb01C
         jHO6Hb+MXN1tfl3fFpfsqywS+cFGjoBvcDiV2cdW53EGLZrlT+8q6bHGRBKcZnl3PeNC
         N38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744075706; x=1744680506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0k1JhzrQKYTARglcHxVoXjxU6gC3Q7ClVe5dF/7ealk=;
        b=h/EeErolrJ2FD6Ezv4pBuGTR4ptEvlrxJhlh+CeboiXsEBXfMwXCPRL0YKn9mMx6K6
         C+g2JXaKLwXfcp+xFUGFDDr9lPCYRmOfOOaB03/F5P9Qnfb2ZMT5+5lTK6SVayd6egHd
         5Q+7BVeI5g1j/TcYVyPEehGnz7dZmoOyuUUkELipib0RokOLU5CSHLbatVX5aZJT3psR
         MqkYibq1DgMDk2zXAE/ovfHA41fwxwJyHpArHDwHUw80MHkLVe6BoMGeCzEcMPGCHI63
         l3xt8y9D5wIFlL71VZW7iLVEY4Xx4Vtc6yVChP5ZT18YYTv2FSpm+xIzeURbFUh2+ZUi
         /mDw==
X-Forwarded-Encrypted: i=1; AJvYcCU6XE4+Ell+udJAlJHRp382K53e9uv0hsckX6QpWz4mBETwX7yre2Kj26eTb4uDhZNdFLE7jUuaxAg=@vger.kernel.org, AJvYcCUAeLw34jTqqYhQ7LcNjdJVep4lByE9F0u9ggx2654/37JGfCXWpmgSQNjE+sQZSssiw24x7PDjEK1BXKdq@vger.kernel.org, AJvYcCVPE3Fa/3sm9WLj8BlvJDTWS5cXyrDcAhSdqnQZBeXOXT2zbZSPtL2P9m0fgAWiwXPhRb5+FTj+BHBmTkq1bMxEFU+fLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9NBtUXcdNJwisrgTVRs0L4E/UUec3Asyi37g/76LlT1+gx4U
	8qzuOM3tXJfynmox8Ekd8JubuAmwEWSkW8jiaomdtlTUui0jetoI
X-Gm-Gg: ASbGncuRrGePAmPC1iCovTCVW6oIdtbC5KyZhO5sKgtfaNB93syWWDSvqrjW5+K0IiP
	lkQLQuPtxjV8KCIp+XLb/hLBOdO7Ilojp5YXoOFfyx4p0kzWVwNVgzTj655uF6fW5pDT51R30SC
	9z9bjbBf0m5F9y8XvP/OckHROzxRQgUaW5ympwkhpnK3ZguK5ew5I4PP8bJbeyDabIUZ6jjxvzV
	1++dNvKBWqhpP8+PJe/cUS1kvZpxCQimoBp2h2rOTW4Wgf9/QYYwJXR9e8x2qEI9A4FjezBBr1L
	Btroy442uckdgw3y609XagIPymgvsPyOdP8fYMOKdTIbexEv96smBXBhEPuxr0vHys74MbzHiPK
	SIGgDVfNv7MaV4rgcE+j0/uhbZv874pqGGzQ4ubkdv64=
X-Google-Smtp-Source: AGHT+IEs0sc5fPQy/mpNUh3Tljs4LFY0btb2a9Qw59rKV7UIGbU/CiF5s0dlRryyATXupRmvzVIvVQ==
X-Received: by 2002:a17:903:1b0c:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22a8a866dc9mr196946255ad.14.1744075706070;
        Mon, 07 Apr 2025 18:28:26 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c39c1sm87901255ad.85.2025.04.07.18.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:28:25 -0700 (PDT)
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
Subject: [PATCH v5 0/6] platform/x86: Add Lenovo Gaming Series WMI Drivers
Date: Mon,  7 Apr 2025 18:28:09 -0700
Message-ID: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
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
v5:
 - Adjusted patch order to put lenovo-wmi-other last. Also added the
   references to lenovo-wmi-other in lenovo-wmi-gamezone in that patch.
 - No longer using devm_kmalloc_array in the bind function for capdata
   and other drivers. Instead, a pointer to the list in capdata01 is
   passed back to other.
 - Disambiguated most constants and defines to better indicate they are
   part of the lenovo-wmi drivers and thier function.
 - Ensured the firmware attributes for other are removed on component
   unbind.
 - Various misc formatting fixes from v4.
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
 .../wmi/devices/lenovo-wmi-other-method.rst   | 109 +++
 MAINTAINERS                                   |  17 +
 drivers/platform/x86/Kconfig                  |  41 ++
 drivers/platform/x86/Makefile                 |   5 +
 drivers/platform/x86/lenovo-wmi-capdata01.c   | 168 +++++
 drivers/platform/x86/lenovo-wmi-capdata01.h   |  28 +
 drivers/platform/x86/lenovo-wmi-events.c      | 196 +++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 410 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 678 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2005 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-other-method.rst
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

