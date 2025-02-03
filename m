Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7A4502F;
	Mon,  3 Feb 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563699; cv=none; b=WDGDuTN3GUBtlvkEEBEEaDoJOVcBgno7dt4pTjxYLzufyRhLFZJtP9tClEaaRsHVDoV3dxFGf/fPyzUtQuWrU6WbbGWzNsOwSR2lziJZWfOyR592w5Bv7I3WyawiUw3vzVyBly1m49UCMFc1T5iQyrterY4RZPjaPYN1kWLyYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563699; c=relaxed/simple;
	bh=SrjPtz2VkZheCHlYrQbLY2NKvwkXvqaTFThJAyBgEkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qwe7N0ZxOtTfnkGhcfsKisTLtQgRkZqxdTPw2nYM0/ZXIzoFdy/5V+W9DN4t5PntZwafCSqcrHqewM44l4pxera6UoGUINhGDacqkj1eRxrIHQ4mD6fPrBPfLBBjvAAiRGGxILMElYhycmdXlh9Vr7mRtTkwll+uKDNayF1uEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBEz7ouv; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBEz7ouv"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso1325255e0c.2;
        Sun, 02 Feb 2025 22:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563696; x=1739168496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJdFxhuhdu1oKmJcmxqMot75RmJe06c6cUhcF14QMrc=;
        b=YBEz7ouvyvp63K8atQsj18HYdrUBmJMmGlhMfq/fQ/Pp8DcBZCwApodKgTGau34xCy
         AWF1Xf/g/xPSRwJcVlpqVcCHutGc2bAHPxo0GXsbAbRSiwdAMwj0r/CnXy/eelKKSn2g
         7ipjqLcwaaVBml3BxwvrbLkKl1ov5DMs/bxJg8DCnyewH+d2zn9FixJ78qoDn4/G0p+A
         NJsBqkXk5YTsDpLegMCpo9ad4w/Sw0mT0msRoYY7QOdXo40zuIjeJZHOrHU7UB58olbW
         NsHxEdPsDZoWaX8EtNYIGN3WINRh6W3m0LxVjage5R2plTB4W7k9Ti9Z71DP4TutvI8e
         D+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563696; x=1739168496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJdFxhuhdu1oKmJcmxqMot75RmJe06c6cUhcF14QMrc=;
        b=Lk2pGFLfElrQ6FB0gAHMXqrABxv+2rv6SkYtn+TSQkDSzMwKjNNJwGahcgVXh0N3/3
         We7vG25iq2+oV3sWp7iC2LaahRGtSg8CTcMkEmfeDOzhlnwYu8CBKNspfhxoRBcsEpkh
         yYcCw43iNzOlILVos+0N6Q58wdySSe6BDFcMs1EbzZ/zMCsGK/tgIo4PVOR9YgU4dwai
         3z6iH6TfbEk9ixchWZYrfke1lBYON6ZHHGFxqNpOxwHxzTyDlazNg69ZgIsMU2xtpM17
         mAvdQ1Sw+LglN/bpq7wzIUQi+gXakqVz7Lm0VRRFVbWZgAIV7saAqir4DouvvF/h9mbC
         70NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsELAO7+nDsNG8G+nCtv1tgh8/sa8ci/2X5kGEl12bI9ZdYwRIi+if5poTlu+OdHLPKxPSoUjtnZ9XAeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXRcJj/BbryTaJTU/EV+dUG2+zJEP4y24T63CtgW/4OWFDkbS
	bKM0qK3PqCyuvjZUnW5BYSpYcaYptwiHf5imil90x21yz1mecSqOus5bmA==
X-Gm-Gg: ASbGncsfJOazWgQSpDNwOeIHzzna1GwymkPKYMOS3bdUUHoOMhzbIklrLmaE5vbmS+F
	FA8mE5x4mkj8QXbQnoHiDSTD8k2I9Nr7gr3A0cxX8Qa1tOMWbO76zDr4m64FrijV5jlbuVm9/KU
	DPK7lLN6/9pDblmp3PMQDOWAPof70tER1eOhT2IZi3BwsJueItJVJfdWj250o6vnql/PHR5S7i0
	o4tkGWxyXbD+4PziTXX6Qs3Zvnyj9Iv2/NLb+iB43FPIaElunVWlbcLtWDT4KOS/cOdwYCaO6N0
	ic1R4tnyuspWfsG2kKmI+DM=
X-Google-Smtp-Source: AGHT+IH0M+tc37fDKAmAYmwN6h1Pu1dFtaEsTBlsEyvcuyL1JEqI5QQHNqxaCCAnC9W4cgSzwMJ6wQ==
X-Received: by 2002:a05:6122:130e:b0:51b:a11f:cbdb with SMTP id 71dfb90a1353d-51e9e41df0cmr15316565e0c.4.1738563695843;
        Sun, 02 Feb 2025 22:21:35 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:21:34 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
Date: Mon,  3 Feb 2025 01:20:41 -0500
Message-ID: <20250203062055.2915-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

I bring some last minute modifications.

I found commit

	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")

which states that it's unnecesary to call device_remove_groups() when
the device is removed, so I dropped it to simplify things.

I also found commit

	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_groups")

which states that no driver should add sysfs groups while probing the
device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONOUS
to the platform driver, so groups are added only after the device has
finished probing.

I'm not 100% sure that the second commit message applies here, but it is
revd-by Greg K-H so I added it just in case.

Aside from that, I added .pprof to awcc_quirks because I'm going to add
support for new features after this series, and it makes sense that
force_platform_profile only forces the pprof and not other upcoming
features.

~ Kurt
---
[02/14]
  - In alienware_alienfx_setup() add a devm action to remove the created
    platform device
  - Drop device_remove_groups() in WMAX .remove callback
  - Add PROBE_FORCE_SYNCHRONOUS to the platform driver
  - Drop .remove callbacks on both WMI drivers

[03/14]
  - Add awcc_platform_profile_init() to create the platform_profile
    device on quirks->thermal == true condition

[07/14]
  - Add .pprof to awcc_quirks

[10/14]
  - Drop unused member `quirks` on `alienfx_priv` (remnant of another
    version)

v6: https://lore.kernel.org/platform-driver-x86/20250127040406.17112-1-kuurtb@gmail.com/

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
 .../platform/x86/dell/alienware-wmi-base.c    |  496 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  790 +++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
 8 files changed, 1534 insertions(+), 1276 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
-- 
2.48.1

