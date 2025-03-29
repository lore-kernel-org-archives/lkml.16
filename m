Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F81DF256;
	Sat, 29 Mar 2025 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233608; cv=none; b=gQNnr4PDjHG4RtgeA6nOZTFfUhp/+2B0bWdMzXIFHtsMcfrS50aGgQTUkdBELph8l0vXDkY27e6lmbbjpxEx7Vy4InRUt8oxYO55jYiNyW9bYg1ShZHaZBVwxRUSRXGAPpvErDo0obbQKn86RVYADVt68oMiSIzkmqe0ArsekvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233608; c=relaxed/simple;
	bh=+uc1SuLU+7BkVTR+aCzoSyQBA+rYZUJ3KCpPQQaun7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL2bVpJZ+vM2vG27fdDjKhAnxpvfV/MaRlOFoeGLGnKO9q6orExlgsyoIPFYktGkr/Ahe7+utnoWnjH0mMRSEhQClX3L/tBMUIxG9GzAr5zYRsjXjW6cOooTuJn+ExCcdOUy36lZbzyHGr00AQgA5pms1THLq931oXax75Xuy+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ81Pj/B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ81Pj/B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22423adf751so56980125ad.2;
        Sat, 29 Mar 2025 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233606; x=1743838406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv4G5XT9cpfw/l4UO+b+3iqID2AI+6jruhrm3oqXDY8=;
        b=iJ81Pj/BwarJPArp/H8GLLbXepLSYARC6OAu6W35iFU46xnEiWmJvNtGG/FEtSgl2V
         sExgrH1EV5QVNSzUML20Gv6ZnWPKSHqG3Cquqk9f3LcGpAFQco9YtWvngEgSnxGr8UT0
         DD/g7OCmkWW72J3Rc9Wz3b9GmhBkcg541Fbf/8qijeB5VYvFDhY8REEOKA891tLPglcO
         I2HKW9GqL0UrCB8Ub9Kxat9db3MaGv6c1LXJwyKSBwa9gKZpWRz4Hy3RdtsQmcJcBNE7
         sjlycqvqjmZyozhGcsCR016OFMe4B4XZilqT2BmJjqj3D6DdGt6mbtUWZcT5RiSCrfjN
         KN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233606; x=1743838406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv4G5XT9cpfw/l4UO+b+3iqID2AI+6jruhrm3oqXDY8=;
        b=Cix2apFQ+75I687PjTdzMzfTY/Hm1pRLoRjyfnbP8i79MOYDVtjzAQ7I8+7N/gt8Ka
         KX08HNnXF6Q9t00tDdP6xFX373MRMJQ+trKh6cJ0Tu5NAYpOCGB7lRFn55F+0Ap52LRG
         X+t+mIYQiaecSubr+3/MA6QNR4Pvmml4oUqWZEh12dqTAS75T4ULF6T9qJphYQ2NQ67r
         UY4HnywlYotcrG25XeTW5OKpZUdAsGzZ91iLsj29Qq3PD0gd7LlbhUDBW2Gx39VPUb3/
         mu9sM3AudjEj/qtV90pztajS//59AWHkSw/S5WEOGeM97t6SdL5+xspO6nW8Kul2tYkK
         fQlg==
X-Forwarded-Encrypted: i=1; AJvYcCUQE1rUkeXJSdu2gqVnLn+zRoONLMeGvas4fGZZ3NV+QftkLK6jmjfKDQiWeuiX3FKmq4BYU+hxBcpliQfYEdB9SVy05Q==@vger.kernel.org, AJvYcCVNKdgUdQanfxf502lDkLfAy9iTV3O2jdE2YkwuGlpOLxl32LgwEVanZgP+TTxIfHJVQ0isSaJSyF7HWrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xNGestTiLLnDxBrEN89hwx0jlM2FMEIg7OtdGi4mQEfTKFBQ
	yQIgWxKtWyZYaNZCXAmrzBppAH9CmKVQaFGgVgrm2sCzd3q/7yhP
X-Gm-Gg: ASbGncurh6WZpVfUlbL374cploHkv7h5P1iV07fqvrVlt24oqU4tHycgG2Ln+3BEZzB
	rboI+OAAjdwpuG4ddVrWmMhwtp8mstt/olook4zBEgfwj3Nz3TkiTEj9TX3Q40pMeAsDbUi4neJ
	80NORIV6438YIUrUP6wJHXyPdzZoR8f641hkn2F2CGYfvvhNqQCm+lOFUlQ5Ewtek6YKoTseLsP
	HuSGJT+WnTm3mFD9D9kHoViga3GSAoDCnsYOiT73tyOI9N+pFqg0ktLlHhYVXEoUSpfeH/rlXOL
	Xbqvhm+l/OX9mDxMyXZ/+9DcNJdVTy1PHvorAAYdpxHL
X-Google-Smtp-Source: AGHT+IFx6cv+c0oNxC2iGBIlYeRWIPDze1mwvT89CZ2P13sqvbzvJLPbgDA0AnoPelBczR7Z7odsFA==
X-Received: by 2002:a17:902:ce02:b0:224:1935:fb91 with SMTP id d9443c01a7336-2292f975776mr32894085ad.27.1743233606157;
        Sat, 29 Mar 2025 00:33:26 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:25 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:29 -0300
Subject: [PATCH v7 12/12] Documentation: ABI: Add sysfs platform and
 debugfs ABI documentation for alienware-wmi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-12-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add ABI description for the alienware-wmi driver.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/ABI/testing/debugfs-alienware-wmi    | 44 ++++++++++++++++++++++
 .../ABI/testing/sysfs-platform-alienware-wmi       | 14 +++++++
 MAINTAINERS                                        |  2 +
 3 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documentation/ABI/testing/debugfs-alienware-wmi
new file mode 100644
index 0000000000000000000000000000000000000000..48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-alienware-wmi
@@ -0,0 +1,44 @@
+What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/system_description
+Date:		March 2025
+KernelVersion:	6.15
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		This file exposes the raw ``system_description`` number reported
+		by the WMAX device.
+
+		Only present on devices with the AWCC interface.
+
+		See Documentation/admin-guide/laptops/alienware-wmi.rst for
+		details.
+
+		RO
+
+What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/hwmon_data
+Date:		March 2025
+KernelVersion:	6.15
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		This file exposes HWMON private data.
+
+		Includes fan sensor count, temperature sensor count, internal
+		fan IDs and internal temp IDs.
+
+		See Documentation/admin-guide/laptops/alienware-wmi.rst for
+		details.
+
+		RO
+
+What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/pprof_data
+Date:		March 2025
+KernelVersion:	6.15
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		This file exposes Platform Profile private data.
+
+		Includes internal mapping to platform profiles and thermal
+		profile IDs.
+
+		See Documentation/admin-guide/laptops/alienware-wmi.rst for
+		details.
+
+		RO
diff --git a/Documentation/ABI/testing/sysfs-platform-alienware-wmi b/Documentation/ABI/testing/sysfs-platform-alienware-wmi
new file mode 100644
index 0000000000000000000000000000000000000000..4877b3745f4e5b503376d375bf48464250328ce2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-alienware-wmi
@@ -0,0 +1,14 @@
+What:		/sys/class/hwmon/hwmonX/fanY_boost
+Date:		March 2025
+KernelVersion:	6.15
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		This file exposes fan boost control for Dell gaming laptops with
+		the AWCC WMI interface.
+
+		See Documentation/admin-guide/laptops/alienware-wmi.rst for
+		details.
+
+		Integer value in the range 0 to 255
+
+		RW
diff --git a/MAINTAINERS b/MAINTAINERS
index 8304c6fddfeed0fc4c26bcab767f401c413c9589..95ab2d002e4aeefa09e4ad83405674991509f08e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -797,6 +797,8 @@ M:	Kurt Borja <kuurtb@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
+F:	Documentation/ABI/testing/debugfs-alienware-wmi
+F:	Documentation/ABI/testing/sysfs-platform-alienware-wmi
 F:	Documentation/admin-guide/laptops/alienware-wmi.rst
 F:	Documentation/wmi/devices/alienware-wmi.rst
 F:	drivers/platform/x86/dell/alienware-wmi*

-- 
2.49.0

