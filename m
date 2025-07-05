Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF011FC3;
	Sat,  5 Jul 2025 03:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686467; cv=none; b=A3Zg6TTWDw5zjdNsglSBOrFr6HWQCWQLHfo2e+4BR2pM4wN/Fsdl5m3S9aOfqvFVkZzHzww0SHxJNkpXggonGPaLwpImavlfgvEfUgB5y/Wz3jZ0w9D+kMrZxrdxmoL84/blxbgcQvhCDAX63gJZifzMKzSWSqHRWh4MApzI0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686467; c=relaxed/simple;
	bh=P7aD7d5V9gCJNOEgWJJMkmapZjtLiVEV6K2mSuZY690=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GyEtTl3ssXaBZL8E5EKsYngeNAAEc5rXAzRvQct+LKQxwB/0hz3LGIGdJZBRhWZmtWzkh2Zm+sSl6rUGLMmSqjIK/ugXObfctb8+bzGNRaGcX7Pg86eDeh91xvg1PIBMAVTrwOufaGCvwM7y9Dawk6Yzx0yoQe06tVxVtIITaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftyz8XW/; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftyz8XW/"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a5903bceffso21782681cf.3;
        Fri, 04 Jul 2025 20:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751686465; x=1752291265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1APeAN5Ko3AhTbV21jwlH+mzqeq20rVizrMRj7QjwPk=;
        b=ftyz8XW/PxLE2yd0UrSFMfHxvb9nI+dszyg18C5S/4bGeotRP4V6mBSKs3zVswL4H1
         A8YGQG7Zi02XYPgUAlQO5VgI8F0A/luECTKqy3Dz30VV4yldcXUxgyM6oV7RmZd9/iH/
         VBEsa1tn0/aICA0bIYTgWhjoXdOlvZKYUQD190mXAxYekZMMh2BHqrvetkzmcD/iUMCZ
         qrn1tnRNTCE94FNUn6SjszYYHwXEsUVCHFc6WaVGg684HEFyyQ6oFQrbLORXPME5DTN/
         ULckqLOW+sVwu1Oiq3HSr6Dh1HPqjvvneXCQ0KdIJJYOTHKZ/0Q1FMXO4aNpCWJqahBL
         KDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686465; x=1752291265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1APeAN5Ko3AhTbV21jwlH+mzqeq20rVizrMRj7QjwPk=;
        b=TRRz8ah4jcuG8PkSNVAyBMz33o+xWUnjvXbTJVfoA59UKXV2FUxsU7bcsejrWtP13n
         5PIdPQTnbTK8zQMw/MxBlXQHaNUxPavjWXGz5Nh71cxpMrnkDN4He7BD4m3ZqNBBakwE
         zTjlWMQyKvouo7c4bczPj8ntcwH29UXAtdTyyJ4Cq+3HdnsiIjptdLgVSi2y8FSzahOB
         55lagh4/rfX1zxqcaurqYyrOufeAA+BRm1r89E6wjDyxvfzetdl9x6rn6FzcbsFqfeOG
         3TLNKuA0KTQ4ZDtc2Z7xVzViFkD4U0vLEkfrlXe1S7xaUvWp6+jLa/sJ54HbUENlk385
         uDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSeMH5dVv2JWb+J4+ygqKHhYH1wGi0ruvmA7cmo9rPdQti90GMG3hOZxw3hV3EzQKxo+SAfT2BsioT5shv568VQ54wZg==@vger.kernel.org, AJvYcCWwm22vjB9DYwQCVesGuSEW8rpv4DJzwra6vJswj9+trdOYImtixBrB1Y6HnFFKH0AYemG/wtmQ6rHHLdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAFGo9BBrbo/e9Jg1zxbC08MdmtX5OfBxygnWG+NE28spSzKJ
	bgxr7VEnJOGg3G9E3WiIO7QLxcj9GlMN8++0/GgYv+PQhW2sqe5Bixv+
X-Gm-Gg: ASbGnctqzye+xhVDn9l86ue+ZcdqZn2rW+Aev88QzwQOxFSYlCfftp1JEY/2G69tM0E
	akP1tP96Ly1XNLc7nB8T0JC5PWDDT02GfpDJO+6k1jZdAluUL5W61TMglzZS9Whf5Tyrpy8MTEe
	z9pUcUEcaUEIQDwOw+akZe66GbyaUcWdt1A/VJ5ffyh/DiKWpsIQfNwhqQCZcZU8glrAS6NBfrA
	x23Zp3bF4WZdXLIj2QFKrX0hN84EO3gGYqHXS6eSDNkUAN/lrQXL45Oimt9s73faJjlfzzciKAM
	/3e//kJl0Z3318D0nEK2B3yPFw9/HnyO1nm+DOmbjod+kxwIWfvLhTDFrIPt1w==
X-Google-Smtp-Source: AGHT+IHUGnDEvKi21v76WEGQV298ivAms9vvdWEzXENWQvTJYPKSn/QbbLErOznYTYCBheEVPxrd6g==
X-Received: by 2002:a05:622a:5146:b0:4a7:707b:5dec with SMTP id d75a77b69052e-4a9a6e98037mr11289031cf.24.1751686465049;
        Fri, 04 Jul 2025 20:34:25 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4a48sm25850281cf.13.2025.07.04.20.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:34:24 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v5 0/6] platform/x86: firmware_attributes_class: Add a high
 level API
Date: Sat, 05 Jul 2025 00:33:55 -0300
Message-Id: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACOdaGgC/13MQW7CMBCF4asgr+tqPPaYhlXvUXUxScZgCUhkR
 4EK5e4YWDR4+Z70/TeVJUXJare5qSRzzHE4l0EfG9Ud+LwXHfuyFQISWPQ6XDRPU8qax6hBhLc
 dIFLrVSFjkhCvz9zPb9mHmKch/T3rs3m8rxBB8x6ajQaN9MVBek9t4O/9iePxsxtO6hGacYXNt
 sJYcGDDLThiMF2N7T/2aCpsC7Z9TyTOW9v4GrsVtlBhV7BhcA1hi0RhjZdluQNuKXRXXwEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4852; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=P7aD7d5V9gCJNOEgWJJMkmapZjtLiVEV6K2mSuZY690=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkZc/WLVj9YLWzT7TAzpdPk3KoTCub7088s017zvWDaJ
 xYN/e8+HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRi8wM/xMX2exVSfudVa+8
 uneqfh1fRH/kGy+uqR+CuNKZiu5NlmP4K/hxbU6l7BbLXP9tUud1W+qfdMx+vGb2/Lr19y/JxC7
 3ZwAA
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
Changes in v5:

- Fix kernel test robot warning
- Link to v4: https://lore.kernel.org/r/20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com

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

