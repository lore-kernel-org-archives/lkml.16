Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10541A2541;
	Sat,  5 Apr 2025 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894933; cv=none; b=iTwRvxhR2ag/Kg1MT5N/smd+VVRshMJDXr8BkmjmkZ9xvw5dgFw0ishzvdhNACZoYbJdnnajA/nL57hw1nja+CVqPL74btIY5o806/QwsbMdIcQtLZJCpPNSP4Aupl/5ftPOPv1k1FJo/Qx0R5S4jIGQR0RkFgfB6I8EIUESePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894933; c=relaxed/simple;
	bh=+ihPfzH3562UQtCkvXWrZQHAlhmM8DF7Fjo0KjAuRP4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXXK7FNb8bMr72k5mczuUbF5jCmE+JYcvVSMSOk3y/srF7yGDzsb7Jt8JS4MbvQz9PX5/ioocCmKByeknt3msnv2Qk6MM3JNko7kQGhabMk1euS0f9hXpNhQVdXQpmSrwkdwMoGHCBfaIUwQoYVPSEf5K8bjsNFF3JZz/RJNCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoAJixm+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoAJixm+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22401f4d35aso33487395ad.2;
        Sat, 05 Apr 2025 16:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894930; x=1744499730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRWHl1bFUEsL1BhGfTHMioZdh6c81qArx4e/ZrHW8Ks=;
        b=VoAJixm+MLx1h0Kwtjg7cOBTe0QKu+1qK0A3XJBAjuuFqRZIkk38NuOM1nwYyxKzHZ
         IsRaJilqbZCD2qzp+m86WKIUsSXXAXapeEiyg3sBbDAglVcZ6e3erMkINOp/QTB2JCKo
         diZht5x2O8v8Uyljm7lWe057H6vvVHhtVW/zUWfyP3GIQYHAbR7arIQAW9b0F98f/HJ+
         k8RXnMVX7fuG/QT2oIzBL0mgxlgp6ajOizxTkK4FkgE1uLt/Kju5j84Xt00P2mziKaUQ
         YVFgYmfoYLXQwaB5zFxxDpeXGjUXujMHx0xHHIlLzok7QLFDpRGqH9NbFgUhyK1ibji4
         nOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894930; x=1744499730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRWHl1bFUEsL1BhGfTHMioZdh6c81qArx4e/ZrHW8Ks=;
        b=IJ57RV+YUbQ+kfrXcUUPBuTZpHfu2MTupVn0+Gt208NO+eJfeGnem6a6w/Gh2u6wg6
         4HRMIXtZuuI3YYCL890eIWf7WUG26nLIxEVPChvfDg7kAI+pLipo5v0rvCuuMnBRwW5a
         FnkYzoWEJBBfxxhxdrbxpurxc3S/PgxqwfK2vgzZEECaaabAF6g4LxrrrmCr+yR/lz0e
         LeFzOZYHglgCdGsaib6ZCgt9b+IIKRFy62TmgvLWu3k1PklwuT7LjIBIj8N7Uvql/AM0
         FJAj+z4HegOfR+mJA5X86A4R+NwP/ria3SR+Jjm59ec5CyPo8k0BB/gZock8TiFQZuQm
         JTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmXMG6jKZo3QYCNM5YZTlU15kHSzD6LMcLV7piGienlkD+eErFmWMXXtxedCTfNNm7wTMWkwwwFdKHNN0=@vger.kernel.org, AJvYcCVuUl/vGJMq3c2lZ/MTGnPiWMiGHB8zVU/CMrR1xgRMn9Ssbxhg2tIzVpwLu8cOTxqQj14UM4NDDcg/@vger.kernel.org, AJvYcCW/ox3WnCzRVivHjKJXGZHrOPfoznLcqwNgkAsyZL54lxo7BEm9hd7lIp0R6vEN45dlJiinhkAcLniwoOc=@vger.kernel.org, AJvYcCWeHVaJzr/8FMUCLQVAzkvN6O2r02O1tAMq0RzNEy99/phLEWPh3qIEgdC7Wm9w7YS4VaOkRKF3uw8OtecA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9wAG6pMXPUtV6fVEZXTlHEETfPoXUER0VtJSeoFCYXjtP/7fh
	ZSZ3RpRrh/MRqMpiieAsViAUhr1KHDE0CtiRSWBwld7l/Zcdduwx
X-Gm-Gg: ASbGncv8cgaCARo2DSJEnHajCiUXYiNqrJqSWx60RCMVME8YAVIauNdoIhx/+jtVT1+
	rz/gXShhUWLB1fJA+IKd/TWEwshw+wrRmsgZxL54M0yD1ILJntX37jd6jMGxv8cV0g3W8Dlqu1X
	yW6e4NvDPyFkds5EyMzmr0IUXoDTHNjoAngWuS73VwTEQQVpqITeeCp7Eozmv2tYknrZEAKjg2/
	38j0fryz8JTCmkLqeHIwmxyAInfcLDfOrxvI439xpcJvqRYk1bHZBVpNcrPUV0Wxq+BNsPksQhb
	f/NGIIwsss2nHM8HRmtTXOZ0kYHuW6xJL+Y1m40cMl6+nQVUy7jX2Mhkc+iLTYBO3gLn073US9/
	qmchVNUF2xjYnuYt5yGD6yKV85mfSm0YN5+6uAto=
X-Google-Smtp-Source: AGHT+IFJLoi+t1h6nfqNpimMSmHCghVaKYsuJd3xWLFkG11VixjKp/kboYhogtSKHpLi5Rt4egiZ/A==
X-Received: by 2002:a17:903:19c6:b0:223:50f0:b97 with SMTP id d9443c01a7336-22a955a19a0mr58857915ad.52.1743894930124;
        Sat, 05 Apr 2025 16:15:30 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v5 0/8] ASoC: tas27{64,70}: improve support for Apple codec
 variants
Date: Sun, 06 Apr 2025 09:15:04 +1000
Message-Id: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHi58WcC/3XPTQrCMBAF4KtI1kYmkz/rynuIizSZ1oDa0khRS
 u9uVMRS6vIN875hBpaoi5TYbjWwjvqYYnPNQa9XzJ/ctSYeQ84MATWgUNy17Zm4bwJ5/tlI3JD
 RJnhBqALLzbajKt7f6uGY8ymmW9M93kd68Zp+Pb3o9YIDtyi1KUoUpSj29cXF88Y3F/byepwa2
 2UDs1FItAaqYAns3JATA+2yIbPhy1JIAAnOV3ND/QwFf35R2QgAlpTxpBxOjXEcn1dbIO+CAQA
 A
X-Change-ID: 20250214-apple-codec-changes-6e656dc1e24d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+ihPfzH3562UQtCkvXWrZQHAlhmM8DF7Fjo0KjAuRP4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd9bW+P9R/LDzSkdAcU3B687lKwLevJl3WO361IsSH
 nt3bGkX7yhlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAi04oY/jsvmvqh5rzXjJsf
 +O1Fm5WmHbepia58e5j570T7o+u+arIx/K92mnVK8MS1ykkOMVNFjIT2Oz8VjtwWMen9spOKk89
 oreEDAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces a number of changes to the drivers for
the Texas Instruments TAS2764 and TAS2770 amplifiers in order to
introduce (and improve in the case of TAS2770) support for the
variants of these amps found in Apple Silicon Macs.

Apple's variant of TAS2764 is known as SN012776, and as always with
Apple is a subtly incompatible variant with a number of quirks. It
is not publicly available. The TAS2770 variant is known as TAS5770L,
and does not require incompatible handling.

Much as with the Cirrus codec patches, I do not
expect that we will get any official acknowledgement that these parts
exist from TI, however I would be delighted to be proven wrong.

This series has been living in the downstream Asahi kernel tree[1]
for over two years, and has been tested by many thousands of users
by this point[2].

v4 drops the TDM idle TX slot behaviour patches. I experimented with
the API discussed in v3, however this did not work on any of the machines
I tested it with. More tweaking is probably needed.

[1] https://github.com/AsahiLinux/linux/tree/asahi-wip
[2] https://stats.asahilinux.org/

---
Changes in v5:
- Dropped two commits that depended on TX idle stuff (sorry)
- Link to v4: https://lore.kernel.org/r/20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com

Changes in v4:
- Moved remaining changes to the top of the set
- Dropped already merged commits
- hwmon now reads temp from regmap
- Bumped regmap max reg patch above Apple quirks patch
- Dropped TDM idle slot TX behaviour patches
- Link to v3: https://lore.kernel.org/r/20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com

Changes in v3:
- Add Rob's Acked-by to Devicetree compatible additions
- Dropped cherry-picked patches
- Droped abuse of regulator API
- Droped bespoke sysfs interface
- Rationalised temperature reading for hwmon interface
- Set SN012776 device ID with OF match data
- Changed probe ops reliant on device ID to case/switch statement
- Added documentation for new Devicetree properties
- Improved a number of poor quality commit messages
- Documented behaviour of die temperature ADC
- Link to v2: https://lore.kernel.org/r/20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com

Changes in v2:
- Changed author field of patch to match Martin's Signed-off-by
- Added Neal's Reviewed-by to reviewed patches
- Moved fixes to existing code to the top of the series
- Removed tas2764's explicit dependency on OF
- Removed complicated single-use tas2764 quirks macro and replaced with
  if block
- Added hwmon interface for codec die temp
- Fixed a malformed commit message
- Link to v1: https://lore.kernel.org/r/20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com

---
Hector Martin (3):
      ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      ASoC: tas2770: Support setting the PDM TX slot
      ASoC: tas2764: Enable main IRQs

James Calligeros (2):
      ASoC: tas2770: expose die temp to hwmon
      ASoC: tas2764: expose die temp to hwmon

Martin Povišer (3):
      ASoC: tas2764: Reinit cache on part reset
      ASoC: tas2764: Raise regmap range maximum
      ASoC: tas2764: Apply Apple quirks

 sound/soc/codecs/tas2764-quirks.h | 180 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.c        | 137 ++++++++++++++++++-
 sound/soc/codecs/tas2764.h        |   3 +
 sound/soc/codecs/tas2770.c        | 151 ++++++++++++++++++++-
 sound/soc/codecs/tas2770.h        |   6 +
 5 files changed, 472 insertions(+), 5 deletions(-)
---
base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
change-id: 20250214-apple-codec-changes-6e656dc1e24d

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

