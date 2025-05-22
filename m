Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF28847B;
	Thu, 22 May 2025 01:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878836; cv=none; b=HmYUXQMJgzmVILJakJzZrSgcz9Kuq4eiSQ+iQHzJk4VMA3LBL4rcCRWzhkuvuTgSOkj0Yr2Z2pBbATRkz05TjL5+7m6zi+iO1u1k1gd5nArJUnS0pXUU5+4ehyGmKvs0CIKw3kUNr3hJpxFB7U7y/V3rzCWF8sWR5VFnhzXbEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878836; c=relaxed/simple;
	bh=n3Y3JQIeXOsLjATidr5a2WdHXH4Mvv7Vs7KQZYQYQlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRU6XWAwIdtSGezKAginxSWerFFmcNWFBYkxHmp5wxPFBWMuCnc3uN4YdogrtBFKVKaSIrKyRrX5pjjcZWZSQSBvvriY+/xKvSg3vkWjuk3pgHlLnWriHO55xd9/awRA6zayHAAG0y6Tyk7W2Xn4R/Tp/ZAEbAFtb0OqF1HDLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDOfJnTo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDOfJnTo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231f325366eso55331115ad.1;
        Wed, 21 May 2025 18:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747878834; x=1748483634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDKc3aYV8dVGCJCSiYW7dsLFXnhTHIW4vgXuR1mo4I4=;
        b=mDOfJnTorlqjt4RTELBia0VEcXyWRrQ1wDIYGEAaEumPMSwGxQ0N/3JX2XZCbBsFso
         GvDduR1/NTD2gKtsuOXxdTNF4gDYwh8sK0W9Oc/c5o5Y9SOjdojRrEK+/GrQOI/ClwE1
         InrVmLCkGyT2OIurZT29XcSMNIjez9l18yUWh1hCkIueCrbwvvSf9oi11T8bbDKFk8Gi
         N9oQViIVvaVeV3NaZuW2z0XfgfE+HYYeBpon56CEoy2peRMfNSGDKZj2Fs7TeO73cSB8
         QPAY/lI+q+Z5n2FPOBM1RyuLvE1euEW8wAzQD6JKcu46MAXQd3ij1ttfXQr5jk/Z6Cl8
         1hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747878834; x=1748483634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDKc3aYV8dVGCJCSiYW7dsLFXnhTHIW4vgXuR1mo4I4=;
        b=BC2Aosg4DXEWYedBfKHxukRULNSlAGyk1wRrhZd2Eg6A8tNAqn0uLElBx6492NmZgn
         MQgzcpaGcXRWxhVxslnwp+0h1vm5KBju5bUOboG03nkOOZdlHH7dZwiZ7sIRoUoBbOCJ
         Q+10JmXYlHu5Wr1EA7d4rYwDbCA9B962x4IYWjnnVXwH+J/Q7ZdKtLoHyJpgJFsfWoee
         vkbgvJiFpFlJNU7qjVjfhNl9BhDneBrrIY2BtBH+W2t6Qm6nfyLD4xq1BSd6m2LpS0xp
         ZhSB2doCAqRgFW9dU00ycr1fgvoWiBmoSKY1GKK2ym6dsjKW5htymihJSS63QlXMskeR
         JGrg==
X-Forwarded-Encrypted: i=1; AJvYcCUMUhcwy9WW8oVLSazQxPV/enlcU+SySVknwmfFQwaSS+Uim6ZjRe1O3mOePQpYummriBE6Xvacgno=@vger.kernel.org, AJvYcCVaX22tKWmWmMof2GAsTgTgfCfVDD9Hs+rFZB68qKdOJcZPqzxFxCQ3zx6yz6ynnO/LXD1WQfL3ujc9rmu7BhFZZ3xbeQ==@vger.kernel.org, AJvYcCVvAMqkEaCTofPDVhJh8BsXr2OADL97W1tCaNfeGCpZDSeuccYpgj0jfRlBgtMZAQqkdWafKz7qexYnZOS/@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEtbnTkysYGOSakr/orEP7KRaGA9CH2s+MuyKpiJ9evXISUCZ
	fwJgNWGUYw404ZsfwK/+GcLrywnJ5PulAmouLwdlib+BaLvcKImMeKXx
X-Gm-Gg: ASbGncvoyqdcaV4GsJyz/Xvy93KE1rXcUAKEuWpnPOxSYjh8OYDHJSFFSxVokIQiRvv
	1wQIlRGmLOfQSfQYih+H8Y7v5qIK3JQVBsTwMSnvIo07HjR8IBmBMd7eF233tWKfToO4qj0fr/D
	M31KdbP5WuBXaG1w2X4iYoK5hk7k96zrH0TebwsvALC/qz3kakXTdRL8cBLt5GGI5T9uQRxNoIK
	WjeLT+G7i1Vk6mOqTicm4/6w8lzXNYPottki2GUNYBIxcawQFM3Ee7dO8YT0vgfjaX71fyJGdbu
	E7IF3LQmk8Z+8U5p2JBX5u6wpqK4HcyLxU5XovfHkXgjkJy3Mk98VTO0FZ8GKKJyBqbrbVQ7nww
	FDeX6SSxe4NVf4r8KJ0fgrQMeuhzy28rSZBADQx+Ibf4z9svY4Q==
X-Google-Smtp-Source: AGHT+IGKaf3cBVUajo3gFtx8+vikX3e6zZFZXDiNZBbXYTFHe4Bv5Sj5sLma8bAhVw+4niltFQQdgQ==
X-Received: by 2002:a17:903:19c4:b0:224:1935:d9a3 with SMTP id d9443c01a7336-231d4512038mr367002845ad.21.1747878834002;
        Wed, 21 May 2025 18:53:54 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97347sm98878225ad.116.2025.05.21.18.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:53:53 -0700 (PDT)
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
Subject: [PATCH v11 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Wed, 21 May 2025 18:53:44 -0700
Message-ID: <20250522015350.471070-1-derekjohn.clark@gmail.com>
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
v11:
  - Fix formmating issues.
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
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 407 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 665 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2114 insertions(+)
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

