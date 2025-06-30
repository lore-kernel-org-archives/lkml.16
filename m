Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C182036FF;
	Mon, 30 Jun 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270506; cv=none; b=B4DClWIuTHpUHbodqIIDbC3VEVlo+vvzCbCiZLt8NQM04j8jFIrbtfxbJtiVozQi70ak2Q3xdiFdQ4ro2uwLfk2d6Xv2Amy/o2QWaFQkorHtuvLlPJUOkLWsaA5K1SLMfIQ4oGM8fSil9lS0wGoird2MypBRTwAYQT4IGBd8LcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270506; c=relaxed/simple;
	bh=DoAXV9wngZWUiP7rzz3sXHy4+GZXbAf7U+UdKuFrFFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FzDVLw552bSnL14qU1YBuAhw966TrP29QwiXzpKI/Ey2ZotaqdNvZE1I64ckxnj4ibJAfs6WLZT/V+iWfjDoiyaEyHtovvbGuih4UBvzmpYPUlxZLFHbPoes8km1XfR1/YyRP/udbfdcpM23vn9WSPgPeTUkEX8uMAJ58y2rA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc6cDyd1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc6cDyd1"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faf66905adso13557636d6.2;
        Mon, 30 Jun 2025 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270504; x=1751875304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cD/p5gJYUMNxyDDUGD6foIW2SNpF7dP56MmSLAoJDgM=;
        b=Pc6cDyd18F74C9bcxY/M7PrvBkpH41weNpbb2s8Pram6Gq6HQm56hKaNGop2zgecor
         fCWux44aToE5KVY/4YD+NXGycUokoFIdEsr/G9H+wjuWpPTm/C7j5H60hMaKnq/4jP1m
         A0WnVUAX5QAnYpvKYEHQD0A0VpQC2CVouzNRmzektK8UuantZN6DHjVIIKph0tOezLeY
         6uhE7OKnflVkb04kg4Q08muYI4pricRQafCeHqFU6OiWjivnR4pVzm4/pdC8oU8eSm3L
         m9T0iQWH/hv5iipos8EvWpH52TV3zTgYA83QUalv5qmRICMSKUI6lWdMylvOYFCLvJiu
         772w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270504; x=1751875304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD/p5gJYUMNxyDDUGD6foIW2SNpF7dP56MmSLAoJDgM=;
        b=AjXYc1qn6Qfz4u5o7wLhpnMN6u+GaoyHq3e/K2lAfUip71KcuGC+2fhiS709pE9yEw
         0bNptBdjJTF+zeh8XcaHqHVESyd19kIUvOIer3YitUB5fkjgmHRCr7D+w9F31oaKTGT8
         wALmKAlXoGz+9YeREI7kgBGDLzEfFLzlqijW8kO5XJFCnEC1TdomknGtHwWgWfVfdZGh
         wIdroFwMwm8BTw8kLLFaU22cuJc/3tfIApWRRIz4DXT4vFon5dYbmx517yQw4k0JKBOA
         tSd0Hsqv2r5aAjbDPZCkzL6BREf2R3egKd4Vz0qlHHJz1F/2Mq5EBSuvoGNpyvGB4lb4
         R3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY6rMY727y7UsD071aplIYgvKS/LPXIXNqjrdyROPx9oWmVsGwRtr/bCj153ZOMr2YWRwP/nwsK6kueqgWC6+x2cEquA==@vger.kernel.org, AJvYcCVCzadBpSw+0enTZjwrH+aBVeIbFa9pbnkNAN/cv0KWwydOFWDmuN/503dWbcYs/tt3VTeQou82Yhjccws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPK6S+oDtUo7nLpUUMePx5Eu4XYVfu3HmFVhNzNTTusqcpwZd
	gxHiVKWRU2oM/Xhk+ySkUpxrngb1WTkhSGplWJv5jXikh5NxNKH082PL
X-Gm-Gg: ASbGncv/0TUhTKwSUuuA9y4b4J+RWfeFRmAT+IFInkvi4CbA0/7inCXEeZt1cLFKBuG
	X+6CmK4qBBE9ryymLg3Rb8IkDnrPeyD2M1v+QUb7XN/mtDD+snn3+v6vTGanymlp9fr+XH2Wfed
	D17pviqwe5wq4emiCYxr3vdTaco3/dxnftEuyxHU9jWLOm+grCgKXDpJowgjMLPdjDp0UGoLyMO
	f8j4PfKZ0lWfToPt9bVKyqF+lm3KUMmqS7ZOvH/h7wuBWK/A3b46xd+g5g4oo848NKg+rhRqFM6
	3RkHElRIYpQ7hV7vnEtC30WlNc5kyn1H/Em8TZecEnV9xpfH+pkUhhXL2obXbA==
X-Google-Smtp-Source: AGHT+IFzXMv43Kt4mPH8uHa+I6hV15vE1eARVWFLGYXMMOyYy9/FNxs6UC1bQyxC4ZvkQ5+SaVu+6A==
X-Received: by 2002:ad4:5c4c:0:b0:6fa:fbde:7e23 with SMTP id 6a1803df08f44-6ffed7a4863mr230495596d6.8.1751270503984;
        Mon, 30 Jun 2025 01:01:43 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:01:43 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 0/6] platform/x86: firmware_attributes_class: Add a high
 level API
Date: Mon, 30 Jun 2025 05:01:07 -0300
Message-Id: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAENEYmgC/13MSw6CMBSF4a2Qjq1pb2lRR+7DOLjALTSRR1qCG
 sLeLTgQGZ6TfP/EAnlHgV2SiXkaXXBdG0d6SFhRY1sRd2XcDARoocBw++Q4DD5w7B0XRJgVAkD
 nhkXSe7LuteZu97hrF4bOv9f6KJf3G9Li/B8aJRcc9AktlUbnFq9Vg+5xLLqGLaERNlhmOwwRW
 5SYi1SjkMUeqx82IHdYRazKUmtKjVJns8XzPH8A0OWD9yIBAAA=
X-Change-ID: 20250326-fw-attrs-api-0eea7c0225b6
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4708; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=DoAXV9wngZWUiP7rzz3sXHy4+GZXbAf7U+UdKuFrFFA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLhEb0sL/SyvOVMu7f+Tr/WniNmHr2x+r2PUuMvEz1
 Nq4939vRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAExk60aG/25XzknqWjo+nOLb
 sPDFL9sPrbfe34qaN++SVefxNbySbFcYGf4kubM8cZtt0HGuOHRe8c6rCqJyM2ZPUH9o6tJ4LtY
 hhAUA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

After my discussion with Joshua on v2, I realized the API I made was not
ergonomic at all and it didn't exactly respond to driver needs. In this
version I tried a completely different approach and IMO it's much much
better now.

First of all I adopted standard sysfs terminology for everything. A
"firmware attribute" is just an attribute_group under the attributes/
directory so everything related to this concept is just called "group"
now. Everything refered as properties in the previous patch are now just
plain "attributes".

This new API revolves around the `fwat_{bool,enum,int,str}_data`
structs. These hold all the metadata a "firmware_attribute" of that
given type needs.

These structs also hold `read` and `write` callbacks for the
current_value attribute, because obviously that value is always dynamic.
However the rest of attributes (default_value, display_name, min, max,
etc) are constant.

In the simple case this metadata structs can be defined statically with
DEFINE_FWAT_{BOOL,ENUM,INT,STR}_GROUP() macros. However most users of
this class obtain this values dynamically so you can also define this
structs dynamically.

In the end all groups (static and dynamic) will be created using
fwat_create_group() after registering the class device.

Let me know what you think, your feedback is very appreciated :)

I do have one question for anyone interested. Should constraints over
the current_value (such as min, max, increment, etc.) be enforced at the
show/store level? i.e. before values reach read/write callbacks.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Changes in v4:

[Patch 1]
  - Embbed a device in fwat_device instead of a kobject.
  - Instead of an attrs_kobj root kobj, create a kset with the same
    name.
[Patch 2]
  - Add a (*show_override) callback in fwat_group_data.
  - Instead of allocating and filling sysfs groups and attributes
    manually, I defined custom ktypes for each fwat type. All groups are
    now statically defined and added through default_groups.

    I think this is a BIG optimization in terms of memory at least. Also
    fwat_group memory is now managed by a kobject which is allocated one
    time. This is also a less impactful performance optimization (less
    individual allocations).
  - No changes to API :) (I take suggestions though)

I might have lost some of the changelog. Sorry for that!

- Link to v3: https://lore.kernel.org/r/20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com

Changes in v3:

[Patch 1]
- Fixed UAF in fwat_device_unregister(). Device was unregistered after
  freeing fadev.
[Patch 2]
- Patch 2 was completely replaced. A new approach for the API is taken,
  based on Joshua's suggestions.

- Link to v2: https://lore.kernel.org/r/20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com

Changes in v2:

[Patch 1]
 - Include kdev_t.h header
[Patch 2]
 - Use one line comments in fwat_create_attrs()
 - Check propagate errors in fwat_create_attrs()
 - Add `mode` to fwat_attr_config and related macros to let users
   configure the `current_value` attribute mode
 - Use defined structs in fwat_attr_ops instead of anonymous ones
 - Move fwat_attr_type from config to ops
[Patch 5]
 - Just transition to new API without chaing ABI

- Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com

---
Kurt Borja (5):
      platform/x86: firmware_attributes_class: Add high level API for the attributes interface
      platform/x86: firmware_attributes_class: Move header to include directory
      platform/x86: samsung-galaxybook: Transition new firmware_attributes API
      Documentation: ABI: Update sysfs-class-firmware-attributes documentation
      MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry

Thomas Weißschuh (1):
      platform/x86: firmware_attributes_class: Add device initialization methods

 .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
 MAINTAINERS                                        |   8 +
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |   2 +-
 drivers/platform/x86/firmware_attributes_class.c   | 659 ++++++++++++++++++++-
 drivers/platform/x86/firmware_attributes_class.h   |  12 -
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   2 +-
 drivers/platform/x86/lenovo/think-lmi.c            |   2 +-
 drivers/platform/x86/samsung-galaxybook.c          | 246 ++------
 include/linux/firmware_attributes_class.h          | 375 ++++++++++++
 9 files changed, 1107 insertions(+), 200 deletions(-)
---
base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
change-id: 20250326-fw-attrs-api-0eea7c0225b6
-- 
 ~ Kurt

