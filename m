Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1DE10E9;
	Sun, 22 Jun 2025 00:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550683; cv=none; b=HNy8aM1uZa0EzD7RLmvgE1xMB5wJVjYuW8Skz1NdLD7PMPHXt/q9RDLmiyr5x43w6iYnUTHRVWfTnuWQtlEa7NswcE70i+VMSZRbDwTugBBmDvi4rUwTBUcIiTdN5SOKuvSxFLwMiQUBVHCz5tPrJv3dFO3Ce9BwkhlahkjEHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550683; c=relaxed/simple;
	bh=Bj7EH8T2+969eRuNOMnRNeDKjdaZOdWErKo6WAH+vDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BYz5sYcGXFWMEHA1FN9RUroIkAmObBuMwjrHyjsyvPD2hohtEMHlkK2wDcuF41U4ra13nKCWRyhyvCruD5hYlhYFUBvBelt3L+q/WFV9q2BOHyL7jopS/BPP/PgRGsPM8tAl4YHzjiUdYBdAF5rLy1XNUycKK3qD0b7tUNNwwGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTxx1a4n; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTxx1a4n"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2103426b3a.0;
        Sat, 21 Jun 2025 17:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550681; x=1751155481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6z8X/3BKp2LhwsfXeORb2e731MDoSpSQzrMmBZ+OFz4=;
        b=dTxx1a4ngJu3bSbrwx0tnMpMgZ9oVFdZH9otq7+Ci1B4VqFKJ4mvT/yACdnQ03x6O4
         pb6CxlE8C5ROIyWmBA4397tEndy5+ao/pqsTFqQlSCDx4VI/gim9Yiou9zsoIStdm8Mu
         WKWxwN2UM4DiESJMYuuKQ1jauqFfoniXXk6wPQMeSXS6IPEZY+ez2wT1MHp57vXFi51K
         hrQHhBMxAF31EMA7iZkzO/yOknyfJinqp/VJuKIjnDta54sqlgVAgN8kSVepPHkxuNiu
         v5IbLxMpWB4SqYtkPJYMOaSZXh4zYZIriD26w+owlXM8jcu5nQoyChFQl25vGGYIlIPt
         a8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550681; x=1751155481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z8X/3BKp2LhwsfXeORb2e731MDoSpSQzrMmBZ+OFz4=;
        b=jo/yDmq0kdqc6PLJ1B2mqz2rAoent5sTyy7JPaS6vheVhfLrFZ1GLBC4df0N+Nm2fU
         0+QDQffKoFC5QuDnxOoedC3Oahs35gRCJsCBO0kjNtB9VeDNDLIocDsWzh9jSUUTX5wv
         151htZscT1fp5NSprxuU3HyQn8R5byiB2EP/XACWci3+hlC4Q+hG8uYnBZ1rKPW41wj1
         DE4o2MxaEPgalieMW+3L8b2DpEJGiKTsFN6WUbB2cqW3NqK8qlY84gfD5u3dIMgReoAy
         8kSYNcmo7nGIsPBOTR/tUG23d+VeT1Atq8szlFf6IqPImrQm29aASaQtcGQYucomub3A
         doyA==
X-Forwarded-Encrypted: i=1; AJvYcCVZizj6MjaBt7O7p3N1MCjA005plPNTmyfdOLiP56hqw6JrBW3erXAbJivcwbMX0A+/eC/daKDLi6hBxx6r2nWgPlo4fQ==@vger.kernel.org, AJvYcCWG0TV9iR4qdzoxeVtIVu98fh8wLVrdqdLa5+F24cv5ecLjYEvgdr5AfbtBF7yNJFufpbt44tMOFyGC/vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqHLoJee2rn8mQIPft0qJ0NXkcOkWweDT5RCYI9YO3gbR3ELn
	K69v+Ymm6r235kDvME2oaxygyaVhrg6mPQ2MgYpClsavZs9pO5QrrwY4
X-Gm-Gg: ASbGncsJRamYkhISLKNBKA/8wNqsgWIM88dv33JHCnh+Mz4AE4Q6+5GqAteaZK+3rys
	Pynul7r1xPEsR2AMO6Wlh5HpoDnAvDvFiW34m1ZBFjdz7GFT7HrCz654m3cHWNWR4BYIiHdxg+g
	QVe963lp2jaldCPBVmu5Neb54ofZM7xtw1sA6TEbnAiQZmQxS2L+vEd7RvtI//l9bhj71pG1Am5
	lqg3TXLhUD+ylGnGq4cfzHFYQTBQJktATYtexawcuc/gbNrJQ3GZgIj6an4UUnhFWT6LEllppFz
	jjMwKSSlJy6vF1TIg4pTNSawoSkMLZYIG9+KB9zYlrZHX3x0YhPI0JoDfhPprKcSvPhOyv/u
X-Google-Smtp-Source: AGHT+IFxvRuHBWs+vXTeVpx163ih5+mjNwk2fUf4RvD9RzJXTAZd4MnZRRW77yY+2HAN+p0RXfWTLw==
X-Received: by 2002:a05:6a00:2d8c:b0:740:a85b:7554 with SMTP id d2e1a72fcca58-7490d73ed8emr10316090b3a.2.1750550681388;
        Sat, 21 Jun 2025 17:04:41 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:40 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 0/6] platform/x86: firmware_attributes_class: Add a high
 level API
Date: Sat, 21 Jun 2025 21:04:03 -0300
Message-Id: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHNIV2gC/13MQQ6CMBCF4auQrq2ZFgvqynsYF0OZwiQipCVVQ
 7i7BTfo8r3k/yYRyDMFcc4m4Sly4P6RRr7LhG3x0ZDkOm2hQRvIdSHdU+I4+iBxYAlEWFrQ2lS
 FSMngyfFr5a63tFsOY+/fqx7V8n4hA6dfKCoJUpsjOqoLUzm8NB3yfW/7TixQ1JtYlX+xTrFDh
 RUcDIKy23ie5w9JU5rY5QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Bj7EH8T2+969eRuNOMnRNeDKjdaZOdWErKo6WAH+vDI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHr2Tn2cm7lRZsXORaeirX0/XuVpybv2otTQoam7fl
 U3qNt/tO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiyUcYGS4HTHH9N2vnpEnL
 WBJCP85LvNC/84X9gkLRya1deWeLr3IyMhzMLWNzmHF2Re7LSP6yRbOOyj25uCBlS2Vp8rOLKTd
 e5rICAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

I apologize for taking so long. I've been a bit busy these last few
weeks.

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
 drivers/platform/x86/firmware_attributes_class.c   | 615 ++++++++++++++++++++-
 drivers/platform/x86/firmware_attributes_class.h   |  12 -
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   2 +-
 drivers/platform/x86/lenovo/think-lmi.c            |   2 +-
 drivers/platform/x86/samsung-galaxybook.c          | 246 +++------
 include/linux/firmware_attributes_class.h          | 389 +++++++++++++
 9 files changed, 1077 insertions(+), 200 deletions(-)
---
base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
change-id: 20250326-fw-attrs-api-0eea7c0225b6
-- 
 ~ Kurt

