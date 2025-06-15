Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A20190692;
	Sun, 15 Jun 2025 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010421; cv=none; b=lI6VJ4fS2AjfjovxGNTyz7F4OxL6GCg7M9INkgnCnKoUcmmB10pkJIjsML6CpyTwY2+GA2g1/ET9+X+KuLvDjqKp8wHrvjZiTdcjfkaCweRO5rgoFXmKzqGpgG0TcpMUtBYkrihhYB0iS+A0NkA2hQtRFz7dj165FCUtK8/sOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010421; c=relaxed/simple;
	bh=ot8uIteUOAnwSh605l4urrVUFkFF6SddtMFsgpG1W8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RaSyO5Fj6ufZRW+XI9L+4QcJ+9XyMP75N6zNB+PSgYuUboY210ZE83dQ4rDrVTb/YhNYf3AgieIianzGhknXSXtUUmVhOHJvxbxTvY6VtXFUH84mnjLZ94Lt5M3bQBMVfAH8yLYNPugFkAbrjRzZl6ZsXw4jtt6CIjZe9fckaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hMgbqJv+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hMgbqJv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750010409; x=1750615209; i=w_armin@gmx.de;
	bh=PZn8SH59LZb0DLM0g7DFC/+47l9qd5T4BVNH0SSVyXw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hMgbqJv+TqN288PbCnTF6n8U3+g+IIuJSt9Xm5Ld1GNB8s9+geqZMgna9dIlOp4k
	 XvgXFYsNWxU1gGHhSs3qn0FSP1b4f1eemX72URfXkaqZco1mYTiyGD7rfMWmTQNnm
	 uhpy1MvZTkBsLe6fWE4zA/1j4BAK1X1xEa2R4v7+Sa9TGF44Wjcq4Jnknfv+z9Tct
	 qPpL8N+lchNfxdgjJfp9xhXEUlo/73WCw6xEzvj/UVSVEUbRnHZBuUpg2FUlBpOd1
	 WZdPiLVqy0heR/Mg+RvW/v5GrJAKGvhogl6nf36GuwSbym3BF0teNuvjlod7DZuG7
	 kDp6eexpxAKl4E5EBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUowV-1uHtVI0SOX-00TAJz; Sun, 15 Jun 2025 20:00:09 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	chumuzero@gmail.com,
	corbet@lwn.net,
	cs@tuxedo.de,
	wse@tuxedocomputers.com,
	ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/3] platform/x86: Add support for Uniwill laptop features
Date: Sun, 15 Jun 2025 19:59:54 +0200
Message-Id: <20250615175957.9781-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JG1aL1ItmR9iA1mL9TIl/CusRLK8Hp/6zdhq45pBmnmR7pNbi0j
 GCuKg97L8tPGVZtvkmaoxUyh4u33v/r7TFKj3Vre4iNvOcmSfVkPcCilzSyrlO/Y8zQhgvR
 3M9AZSg/znoYEvmTNGCWmzUf4SNTdbV9RFKAwJ32vcgTBeACS4RLowzAAVbpvlskUDEnTL3
 XFHguHhfD8ylVdm1DwmRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1HjlbNrzGg8=;itZQeUIE3EHRcJLQX4REk0F4ku3
 iH+4DgPgVaVTKqbw6QeI8cdxDx8lUtvJvP7aCsPeFsDhjEucC4A0jHI69tPTiWVgeEid6o00Q
 kB8bldSdHvYuV0kVV1r7TM4IO6aJmCDqL0LwTEfZgqvziK+z26XKCisSb+3THHPBteFlNBct/
 NYOF6SIN2kwnCJ5T05VcSRGdc4otZERKTTEw3y+gsj15kyZLGf+JOSikTWnStY+7+R/SLW1vB
 1r0N9juNe88MqIokTVwM/Dps6lTisn0KvoNRl8svtfcLmw6RMvAmMEP9F3aiAHemv/VJMTkPE
 pxCHWAo6KKkOuWPY190LdjdyFyV9d8wrltGFl2LgEJfH1ZKT56OW1ND55/6Ya0IJxXSHriIxx
 1VnKtA1adaLLXuQyQJ7hRkSKfDDQl+Om+vbA+Ae7UKTvtr5vhJx04zDi9QMVyJjPRmFNmPLAm
 DSk8d6Tv2mD9VkZG1QUJbSFczzFTCh6DoFTYUFO43P4st4k8H6ykt5iXPCK067yoT8A8NSSWO
 Rl+XBpvW4Nh5BJbkDMDewPmmD8zg91ck4StEBOvq+3eARyZe8FrnXMHZXUw1iwA9gwLLqtqSP
 DeNq0jQ77lTTXx4bYFSEA8HpkhiDI9QoefPexYYZ/BY3xRdK/1qgGffF8yUzF++TLZq3oinM/
 dPT6kJkzGmn8j47bKALvDCDK78UdXtOqw+W113kUu1PERNPuivHOMiitDGwYwVdD+qhmQqeSx
 xnglpvsf+GfnML819yvvhwJqis+tP1hLqVJUexkH+XIkXdjOvtJiXEhSXcUMNpMp9RUa+m3KB
 vRPdwcwas2fMsCxQhEDQCy5NlNpykaQSyLvpYPyxoJnZBb6qXV78febqybhM5yK6Xco+vUVZy
 vy0w9P+awXATMWMpVmIf9ORAJin9wVNXtPLhgnmbVeviBpdV4SuYOrrthAHxM2MGl5eow2Bj4
 GyCDMGRiSl9qx2GaKvsd+/4ls2PFvGa5vL7j0jjgp8KubRIzKn+ycOr6AmvSli8KXsEgJ5MKi
 9ew6cAgZ3uAsW/sufo9Rgi/mI3USGDr2nGtbiCwtSzie6/yxp/fVFvUhFduutBbBaSKNKEYQs
 u1/h5khqWsUhg/wKQqNDCa04Zn+iSt9kcm+wLOGT3dzO0yO6kU2DHvLj+q1y07YeVlt0a7i9r
 h+3kETznrZHqkadVJQP1+T+oWsVaJ/dxIWpQy+6O4Z42fh7vXGr19Lrm0RjWfAd6CbCc+z2mU
 UnYyOLIqO1yw9k87SaC8kZaJ7J32FUsWtASgnjaH3Y3vMAKPwV6EXtVkXS6NQWDVqTcP70Bq7
 8KpEAGhyqGNUF3JBs8e3ePwtfvH5MhHs/mOXGtOi6x7zhPyLMP8J/cLw944qRxYAwG1qCXH2y
 eDCSyDaMergOQw7TtZp7yyI1+akOwL1OXOxatoMPA4k17twamI4B+cuHy14G3zsXxQKa7TxfZ
 ByiUDFZphnh4QQJ+LDZi1357luLUEa6blMtsVOkmFk9aReQ8VGX6VE+GWO1/neYtow4a8bdAr
 ywk+H90Z2zTI50gPvp30XbwWjzSf89hscVeaoSpGjpc97bPZEtpRcMmXFdpLRvlFtBS2HNmwd
 H3eAZBtbQY7rl/mJPPITUimD1qXmZeUEQ8fKpXJ/3VupXi8VvsidzgVDJnWrvhiHKFFdQVARI
 +c0sA8FyvROXCN7oM2/HAXNQIP1y8aYplehkBOCBeOnb7kYFvpMXdlWFD7jptTMvPfk4PJx3P
 qtmM0ziEbQ8SDDr48VfdmXzBeQRBOS0nJNR/hpemCcEoMETIvNE4d3DpSkWmUM3B63peXuvs0
 4UoKuHnNuFW0FXS2/Ld/HVWgCGjviDvhP4sDWHnSjnFB1yIrpa9lBG7PN6MBPi5+IVO4CDPUK
 YiLXpS0Ug8a+zn1kXd063PAMgfBn25/UQL3B45+ArgOlC+YxHjiwi3dMagBBycIuioDmoew4P
 5VJ07UBNClq2P9JUwsaxUplnjdhpafrpmxv8bDHqFJEfxN0aFNKW6mK1zz4zELtyGCI5WmvHR
 LQzUvD70FZdCTQXveNyscmNNnO1Lq5QeDwZI/i6kKzNKYsYgrkGZ0fGTduxMsKcxdCsxytM30
 W/Q+U+mqYUmLXxr/jTsPLlgb20IfvHphxPTptQOgDHDfovKUrj30H1ptupJ8rXinv9ePx6j3S
 rJCDXAiQMmkY/KzfpY8mejQqOpvkPxYbvdBTueYDxgnKnRV0RzNYoemlqhQZ+YwZ8hEOa51td
 MzEo/9woqaKjNiL4DGjYamoBbIG5aXAqdu6Zq0KkAT/bhBowsANhSoQbruNWWLLKaqjtSQDRi
 NQn8Q1Q1XAynHgkD/jG6RvyQtImo0UqZtYDmQnQvbS2Kif+zcVfKcZOY9dL/9WBdyv5g5NpEC
 sa7KlCU2gaRmekz5sXWfsT+p45okHZka0BNCkBttSEM9N7WcHiL0dyBg+/nhprS+IHKg00xOd
 8MmEClDU1YGQwhOeIjcP2uE3DNloDA4W676WwUhTb6YmIaRBzaw9pkSrc+MjFlllCeaf7jMrd
 V3jVE05dmDzV/JVDKsg03UWznTeWsZjVedLDA1d7e94TOsHder19hIGhINiObm7tsPVg6gHDc
 woGaSxdhMDcXEk22K3RAHrmYOtDZ8bm1uewl0NsXT2Fp4/EVJYyYqrrf0taEoczoYnqTVsuFU
 WrH9s/Z4eS/P3/2YlBlLoktZUenVYdBJrndXHpe/bUF0nZEZH4kUZG6uH0U6hgyhKiXaaY+dY
 fvLpGRfJGO1zE1PwcKYsCJW8yB5SCOQTRCWrTcX761OaVXrDCKo2oQ40zKGh8ob/ayoqD52hU
 mcpb07kOnxx5MUNx5us6iGP5WxUF1OZyaxlnmlJMgwbY10dYP2pDK1iJNnPD2QwUYyVVDgerp
 mUoM0SZEw7URK6MpEEmKjftdWg0S6qA4CfP9X3CHJuf4jLduB9Rk21PMnyXEcSHtifN2WaZiE
 qGkQ6LgtbsYr/hlF51scsGNyJOeHzPiZqt9b21aDv8zwSrFx9PYIOqSX0Byo+c4H/gbd91gUs
 BAeHtwkcRkMpx24don1QOvvd1/o+4eZrafS5vYEWQ6I8rK34fpSicrGnn+lJl2WOSEdt+KU9C
 EYMlfq48PsGKvKrV55j8y3ItAVS8pS/fg1hveyJH1+ufSTmkgpxSwdEv/DSB6ijm3ejkOgK6R
 d6LJuxAWU9BcxWwEkTsle8JxkDllCnrLFPPVFjMKYoRH3fg==

This patch series adds support for the various features found on
laptops manufactured by Uniwill. Those features are:

 - battery charge limiting
 - RGB lightbar control
 - hwmon support
 - improved hotkey support
 - keyboard-related settings

This patch series is based on the following out-of-tree drivers:

 - https://github.com/pobrn/qc71_laptop
 - https://github.com/tuxedocomputers/tuxedo-drivers

Additionally the OEM software of the Intel Nuc x15 was
reverse-engineered to have a better understanding about the underlying
hardware interface.

The first patch introduces the uniwill-wmi driver used for handling
WMI events on Uniwill devices. Due to a grave design error inside the
underlying WMI firmware interface (the WMI GUID was copied from the
Windows driver samples and is thus not unique) the driver cannot be
autoloaded. Instead drivers using this module will load it as an
module dependency.

The second patch introduces the uniwill-laptop driver that does the
majority of the work. This driver talks to the embedded controller
yet another WMI interface to control the various features. Sadly this
WMI firmware interfaces suffers from the exact same issue (the WMI
GUID is not unique) and thus a DMI whitelist has to be used for
loading the driver.

The last patch finally adds some documentation for configuring and
using both drivers.

Special thanks go to:

 - github user cyear for bring up this topic on the lm-sensors issue
   tracker and being the tester for various prototype versions
 - github user dumingqiao for testing the battery, lightbar and
   keyboard-related features
 - Tuxedo computers for giving advice on how to design the userspace
   interface

I send this series as an RFC to gather feedback and to request any
involved developers if they want to have their Co-developed-by tags
on the final patch series.

Armin Wolf (3):
  platform/x86: Add Uniwill WMI driver
  platform/x86: Add Uniwill laptop driver
  Documentation: laptops: Add documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../admin-guide/laptops/uniwill-laptop.rst    |   68 +
 Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
 Documentation/wmi/devices/uniwill-wmi.rst     |   52 +
 MAINTAINERS                                   |   17 +
 drivers/platform/x86/Kconfig                  |    2 +
 drivers/platform/x86/Makefile                 |    3 +
 drivers/platform/x86/uniwill/Kconfig          |   49 +
 drivers/platform/x86/uniwill/Makefile         |    8 +
 drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c    |  178 ++
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  122 ++
 13 files changed, 2139 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h

=2D-=20
2.39.5

