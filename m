Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5601A9B5D;
	Sat, 29 Mar 2025 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233606; cv=none; b=fYVWzRrW4QFzCaHxEEKnmRCz9HNpxgYC7zxqm1DseHAfKC3jPx9NKjll3w5fd3w3MsKt0folPuzIOd74at98O9tyo0wqEToo34cPT+Gai0ZDCpz/ODTd9Gx9YIHwbGpbCJ7Lx9P0cajfGg5H2aFddxIqAYkZmro1fPE8zul78wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233606; c=relaxed/simple;
	bh=Wttbwf1qV9FkOAwZsZnHe3ht6eCg76dmLcsoliUV8TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XoUFNYT9xlgfZkOrIt/Wrq+AFqMtO3up/TCnFSUROJZ4sLCY/vc8HbPMDX5kvuRDAHR1E3JV8tuybVYLUcoNAZ7wbE7yJZ8devE9YiL9wwbuWon9Q6eu/sXjjkUi7fx93EnsUOGYtupCA1jWJsplnFL9gM7MZfiUR2FPw1Za8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXErEoVZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXErEoVZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223f4c06e9fso55855055ad.1;
        Sat, 29 Mar 2025 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233604; x=1743838404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66/dFtobVlZnfecHkzTdkjMJ/nih8n5UjXlW1QS1iPU=;
        b=aXErEoVZpzLxnLRo+oTKIF5YiKa91rj00udJPRXge0Rk9lYR3+L/a4BdZsQRsssjKt
         c0eeguuxrNs+kpzAPDqB6km/Yz+1kzWIdPSFt3vS0GvnuHsAdxJj45kpD99h3EfBggBx
         3/cqX+qBeiPtnUwlULzF+Z9uACIcgONFf50dZ6G2kN1ijXKxPnSk7LM6bLRHpWSA4nlc
         tog5aK/ivmgUnAbMdVDBWXSW3fPW43LEcws1fS0/4WXjPJYspVIQNPQQEhVEyElUGquB
         A0v+1kBa6YB/A1f5dE03ssItPnDRBcEAPQfdmCpZs0i5cz09nJS0lqWvKGVETQxd9CMl
         fcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233604; x=1743838404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66/dFtobVlZnfecHkzTdkjMJ/nih8n5UjXlW1QS1iPU=;
        b=Wm0Pa3gIKT5xJ+/K+CTemyF6jS41LwPETLSIeajDSplVLd1/CiuktoQ4HAAd2e5E6D
         7rpwRFJsoPV7+527J4opd/+vNNJY8vx2ruB1sKNmKd4JCHrKZ3Y3da/KIxpPWz7VdaoD
         HVhS2UyKjS3yirFwhMLguO+9yHmx21KtrGwwBq3AjqA8cq4z1KfxqpRrFwKSzvDEI82I
         WiOM6CzPjzTIFt6KqnOpId44+zzF+B+p9gP5WC3LVEWVfSu2YIJGPamnusxAIVjCtDS3
         cBxVMNjpbddJGAoIHOBPoXAdWFMjWH5dSvrAcKNvHvMHp/UnMU9+e2P8j1biYS7Susek
         HcTg==
X-Forwarded-Encrypted: i=1; AJvYcCUNI17Uhtw7Bxhgv4a6pRvK7/In/ZYTvAqcOM6w2sccsNnfM9PBRRMbSKEoBVlJkFT6Yvbm2/J4c3CtsCQ=@vger.kernel.org, AJvYcCVRxsIS0+3GPbDws6Z6/qyR79w4/UH//7wEnP+id5jcgXS3i1RcPlIzwYvBRXT6RpjZ7Ryre+EzpLITHOJFTAtH2Tapsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLTbiGDNwC700jOICRaCB5hWLxZzirBhYsW9BISY8EXXspfqa
	O0pVJONI3t7GVKfyTF3oQnh1yR14Boe94ShBbCij7tvQCv1gl7mI
X-Gm-Gg: ASbGnctMDdcteZnJr4wjOFbgw6k3OKTrnu9ZBZk9btKzrJC8oAeMf5fJvcb3n+M8J1H
	Bgbw7l1F4hkjRHb8cO0JHlCqbuv0BKoxs+ZBThkoZVYJ8ROEI7v6U3qaxc89kOtNSb+8kOzGa27
	qln/vUTvaVAijXu/P/ajHvUfy6B0aA2HNM5Ax+u+HODT751fVfpwJrM5CZtRetDs/YTPOioznI7
	LGmr4ZWBdMxL3cbpXB2j1RyXfFKf4bNeh5UbsiCpeBS9DfQoJLOCBqLxNI/oY6VHH3SqJk32SBd
	TppmZzreMnVKcPBR5k2pfRp7Tj/RYGdqfX4eFkKnQqhi
X-Google-Smtp-Source: AGHT+IGhtrmBus5qDkI6Rlyz4umhU+UKmeAxGgqmPIudkb741Fpwso/1TmASDcOVJUAmesyoH4fZQg==
X-Received: by 2002:a17:902:da88:b0:215:58be:334e with SMTP id d9443c01a7336-2292ee792f4mr31066565ad.10.1743233603891;
        Sat, 29 Mar 2025 00:33:23 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:23 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:28 -0300
Subject: [PATCH v7 11/12] Documentation: admin-guide: laptops: Add
 documentation for alienware-wmi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-11-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add driver admin-guide documentation for the alienware-wmi driver.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../admin-guide/laptops/alienware-wmi.rst          | 127 +++++++++++++++++++++
 Documentation/admin-guide/laptops/index.rst        |   1 +
 MAINTAINERS                                        |   1 +
 3 files changed, 129 insertions(+)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
new file mode 100644
index 0000000000000000000000000000000000000000..27a32a8057da837b49c16f94ac58eef4b6fc8ea9
--- /dev/null
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================
+Alienware WMI Driver
+====================
+
+Kurt Borja <kuurtb@gmail.com>
+
+This is a driver for the "WMAX" WMI device, which is found in most Dell gaming
+laptops and controls various special features.
+
+Before the launch of M-Series laptops (~2018), the "WMAX" device controlled
+basic RGB lighting, deep sleep mode, HDMI mode and amplifier status.
+
+Later, this device was completely repurpused. Now it mostly deals with thermal
+profiles, sensor monitoring and overclocking. This interface is named "AWCC" and
+is known to be used by the AWCC OEM application to control these features.
+
+The alienware-wmi driver controls both interfaces.
+
+AWCC Interface
+==============
+
+WMI device documentation: Documentation/wmi/devices/alienware-wmi.rst
+
+Supported devices
+-----------------
+
+- Alienware M-Series laptops
+- Alienware X-Series laptops
+- Alienware Aurora Desktops
+- Dell G-Series laptops
+
+If you believe your device supports the AWCC interface and you don't have any of
+the features described in this document, try the following alienware-wmi module
+parameters:
+
+- ``force_platform_profile=1``: Forces probing for platform profile support
+- ``force_hwmon=1``: Forces probing for HWMON support
+
+If the module loads successfully with these parameters, consider submitting a
+patch adding your model to the ``awcc_dmi_table`` located in
+``drivers/platform/x86/dell/alienware-wmi-wmax.c`` or contacting the maintainer
+for further guidance.
+
+Status
+------
+
+The following features are currently supported:
+
+- :ref:`Platform Profile <platform-profile>`:
+
+  - Thermal profile control
+
+  - G-Mode toggling
+
+- :ref:`HWMON <hwmon>`:
+
+  - Sensor monitoring
+
+  - Manual fan control
+
+.. _platform-profile:
+
+Platform Profile
+----------------
+
+The AWCC interface exposes various firmware defined thermal profiles. These are
+exposed to user-space through the Platform Profile class interface. Refer to
+:ref:`sysfs-class-platform-profile <abi_file_testing_sysfs_class_platform_profile>`
+for more information.
+
+The name of the platform-profile class device exported by this driver is
+"alienware-wmi" and it's path can be found with:
+
+::
+
+ grep -l "alienware-wmi" /sys/class/platform-profile/platform-profile-*/name | sed 's|/[^/]*$||'
+
+If the device supports G-Mode, it is also toggled when selecting the
+``performance`` profile.
+
+.. note::
+   You may set the ``force_gmode`` module parameter to always try to toggle this
+   feature, without checking if your model supports it.
+
+.. _hwmon:
+
+HWMON
+-----
+
+The AWCC interface also supports sensor monitoring and manual fan control. Both
+of these features are exposed to user-space through the HWMON interface.
+
+The name of the hwmon class device exported by this driver is "alienware_wmi"
+and it's path can be found with:
+
+::
+
+ grep -l "alienware_wmi" /sys/class/hwmon/hwmon*/name | sed 's|/[^/]*$||'
+
+Sensor monitoring is done through the standard HWMON interface. Refer to
+:ref:`sysfs-class-hwmon <abi_file_testing_sysfs_class_hwmon>` for more
+information.
+
+Manual fan control on the other hand, is not exposed directly by the AWCC
+interface. Instead it let's us control a fan `boost` value. This `boost` value
+has the following aproximate behavior over the fan pwm:
+
+::
+
+ pwm = pwm_base + (fan_boost / 255) * (pwm_max - pwm_base)
+
+Due to the above behavior, the fan `boost` control is exposed to user-space
+through the following, custom hwmon sysfs attribute:
+
+=============================== ======= =======================================
+Name				Perm	Description
+=============================== ======= =======================================
+fan[1-4]_boost			RW	Fan boost value.
+
+					Integer value between 0 and 255
+=============================== ======= =======================================
+
+.. note::
+   In some devices, manual fan control only works reliably if the ``custom``
+   platform profile is selected.
diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
index e71c8984c23e43ca7cd6373b88803354dff6bc60..db842b629303c1bcf02646204d51938f9bd4043e 100644
--- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -7,6 +7,7 @@ Laptop Drivers
 .. toctree::
    :maxdepth: 1
 
+   alienware-wmi
    asus-laptop
    disk-shock-protection
    laptop-mode
diff --git a/MAINTAINERS b/MAINTAINERS
index 1cd25139cc58a0ea05c759caa3a00fd557e16459..8304c6fddfeed0fc4c26bcab767f401c413c9589 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -797,6 +797,7 @@ M:	Kurt Borja <kuurtb@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
+F:	Documentation/admin-guide/laptops/alienware-wmi.rst
 F:	Documentation/wmi/devices/alienware-wmi.rst
 F:	drivers/platform/x86/dell/alienware-wmi*
 

-- 
2.49.0

