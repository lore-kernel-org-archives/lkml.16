Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC56F073;
	Thu,  8 May 2025 23:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748345; cv=none; b=tN34ugdNj44jrm0pFLWc3Wzqs5V3LaVIDQQSIbYgSkK8gzGQh5ennivadKaf4yM1acCAllGh+QiBtSdp8H/JugjL8Qq7NSL/5XLW0LR+KcFzXhj4WXO+eMZpzjS7zrR55JlChmklZb/lNYSldfyeUwFI7hhQ1fhIiaIlQ1M/iGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748345; c=relaxed/simple;
	bh=zCcLlGfnA/SwK/QTsQ6H1iR+5VjSwFpBApt8bXe5e1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L1gkDjfUSMJQZrr68HBQYX7A/ZHf+83NatGVnbArmDw/vt2KFTB95UxmtWwNgtto2Fk+GGoOCcBxVm2ItVjsLLtgd7qytv2qmOUpf3KC5Q8Rgde5EeyCNWwZzAlCj6yq9X9c0SWPh48lLluFALDCKQN9E4JZhyOBHOrtMlpeBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgaprQwh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgaprQwh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e16234307so17884905ad.0;
        Thu, 08 May 2025 16:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746748342; x=1747353142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+dTqK1fH1KDfSrx+FC1lge6PAOCtI5Bu9tu5w/CBEA=;
        b=RgaprQwhAgT8ATCjCaWEG5F8oKCyelA4Jc6Fk/igFiIS7FIjnk5L13cHiaLrivzazM
         Su2jjtNOXeWN5khEKexAdHO/Xj4TmqEFOfPJ6sK2RXZCzcayOXuCaalulYJ/o1BUgbgN
         8IDCJH3aiFIPJdtkO/f5/6c1hOJuZ4R2Bn+XDwga4Ry9651wWYLSubSPLtacKcge3pjp
         q4kHojX08dkhkkIqv3SOAQUtY97h4TNY48GuS1K6ZXqqHjvBryHPHN6JFWTye/HgOD/l
         cBm84yQYRr2sUIXOmNa3+7DB1HhrtNQz8wyjtuQrGkcMLylFShwnXBb0C7AUjI0yJ5S0
         g/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746748342; x=1747353142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+dTqK1fH1KDfSrx+FC1lge6PAOCtI5Bu9tu5w/CBEA=;
        b=AhtqR9gVgAnLrlspgF9ZikkAH9QFhyiK/rA9g5IRNYWEmRbQf747BJWBsgTrqqAb/j
         EGG9BNmSIkeq8j3/Sb+8xLTA+JkNSj1PAJ3DdBzmEnTiXbwPdca8SJkgunBYlqQR3DC/
         yzjx1a+DK9jWgXXv+9t99YzMUuxNFxR3dkSi2xRJ3Ys3tgYwsCyQ31v98DBDT1onbeXc
         JorNKopZxXXGlkKsNXlDUYHDj/eb1/0khdWHmSrAFETGG10RzPlcQZJ4hg/39SsHURVd
         YmtrTGZkzkh1H/sJdrvMI+t+mcMYPGPlsW6fuZo//5lj7QIhNbQpTvftmkwrdZxveFsA
         jgNw==
X-Forwarded-Encrypted: i=1; AJvYcCVkM4y0eSqPw/fQ1MzeTTbP7Yf3RXNE2llsL+bVY/s8d9u/Xde4SEKDuQkidJ8ox60yVfi30A+nshU=@vger.kernel.org, AJvYcCWsygji454zfHFUJeCaEuIBvicVbaRl7jThY4K4jJRO21deLmk2KDoq3W0eMZMcAVBlrF+UE9DM4xjVMQnYGCQ508Yrqg==@vger.kernel.org, AJvYcCXz1j6bVKHAKZI+c/RLQpSC5Ltczhp9iXcwDEYswNOwy4adJoCS58wbyuLpUv3CU97PWXf2EmUKlVHfEOwa@vger.kernel.org
X-Gm-Message-State: AOJu0YyGaLmZs6IswHJW4oprQz5Mmi4Eir7BKBlOpMGtl1uAOPGQSKTC
	EWhDfDlUEw3CmY9N/difS2IwnSPxtjo2zOT+XJw9/3wFxvfNBKPd
X-Gm-Gg: ASbGnctlxKTkWggni6dXqngMhkRp2oV7JxHuQUALGcC71qr25b5loy9iwnmE4jf8CQk
	7yZE5iCw3ho6Z9i0UGYU5HhDmxn3Pk/8S7NdEEBgdLFRbAZ2kGP96GHu3QZPkN3keqcOc+mMYwJ
	fOkBVV5yATOCutRct+XSSxeDj74VY4T/fbLes2sUyQvfuKToxqL1LygYkNjqbSsoRh0S12AsA3g
	bGZwBRUJ0frJEGAV8XlGlKNsfejQfwgP5V1W07Tww3147dXmwKdpyCNduPq4m9p97CvPgfaOsrp
	KblESDZkq72jRyZplMoDgBbe9M/dkdLThOt4FHQ5j/xQd8AumFo3RQ6kK5DTX4pKCReB+SETYXT
	aHXiUpiBJnWXVK6vRhP19M002VVyfH/qrOInlQT4=
X-Google-Smtp-Source: AGHT+IESsDblSF+om3G+D3PxsuAoe6bcX9pTwOjV+DZvyRSsbWeo5knrzuuY7eJVy/VoPigXf3w0+A==
X-Received: by 2002:a17:902:f602:b0:220:fe36:650c with SMTP id d9443c01a7336-22fc93e3d82mr18459165ad.23.1746748342170;
        Thu, 08 May 2025 16:52:22 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm5844615ad.0.2025.05.08.16.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 16:52:21 -0700 (PDT)
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
Subject: [PATCH v9 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
Date: Thu,  8 May 2025 16:51:33 -0700
Message-ID: <20250508235217.12256-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
 drivers/platform/x86/lenovo-wmi-events.h      |  20 +
 drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
 drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
 drivers/platform/x86/lenovo-wmi-helpers.c     |  75 ++
 drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
 drivers/platform/x86/lenovo-wmi-other.c       | 658 ++++++++++++++++++
 drivers/platform/x86/lenovo-wmi-other.h       |  16 +
 15 files changed, 2110 insertions(+)
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

