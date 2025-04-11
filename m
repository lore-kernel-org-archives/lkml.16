Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C41EB5D9;
	Fri, 11 Apr 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382223; cv=none; b=k0mcS4zY0H55qUoLSouUaY/AKiR94tKE93mJSVK/JGC5xVDCOF6c2GjUXjn2JDFBxlsLaO3pwGrGBQ/ih1KgGofBbHdf46NlljZMdag4g0CaINk9TGYyy+pHFnLw9lY8um4c8a9MUV9usY4Fa8npzw+hE5T24FN3Rwh84i8txwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382223; c=relaxed/simple;
	bh=Syd1lDbqlM7R+mGNi8fT1pBl5F1yrvGgk0SfomYYKT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4mc/Piw85ZDSoR2eYDkEBVl15LJw6LgeGPHT8/ZdY0xwp5M8wYj1D0nh1ElhZepr8ZXyUPlPPGD3nac8Ycxdr0Pf8w8jPAeClA5aXVsZUa058RXmMJY1KTkfBWxcvU0XaA93EE8HrIyvjpUil4L7qJxOmxsv9a61QHQ/mKI4JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPY+zD0u; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPY+zD0u"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3089663a91.1;
        Fri, 11 Apr 2025 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382221; x=1744987021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN83a4vtJr3jkDTP8/AnjFdICARlWdVcbsRDYISkcqs=;
        b=aPY+zD0uc+rdh8M3LQG7rG3ei0rSqR5kJeDMl2wAlMY4krM4PXFsqsa85JTK8ItDux
         D6p0PEwztYFqKOzuQvTI6zKi2IW5OW9f/+O6vXSq1jnM0NgMFurWyFZJXa8HRSMGRz53
         ABY7bGh2Cl3TShODgKlmk8fFu7AYYt/KsP+wG9YGJY2mOktqvEYogk0xulQjPsG4YvTa
         isQiVMXpoWFr7M9WhNEDZJ7NMtgdkDrYf2de0kQqHqVMof1mtGG7Y5SN/h7Ctzrl7Lqj
         Nfhxi0gCZmWT1tiC2W2H27qleX5/YabSRqoqJTfm57GZaw1mL9ZMzEDD2YkHR0GuEFfr
         gFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382221; x=1744987021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN83a4vtJr3jkDTP8/AnjFdICARlWdVcbsRDYISkcqs=;
        b=jgPZaFccPShzczVpuln2TAOwX6JTdls+QpICpbdqH3vEcnXON9ZPTfkJmGmt5+1uwL
         FkQAHWbpyZBY9xg3Ofh+zbqm68+p+yU2UAze/KcHbIhjc2kYVMYnZKBP6Cw7KpJ0LDYs
         dVqaJSzHluqNqxFmJzvTnxWWCGuYW3tr3V2VStkY6afIVy1wzlj+6U1OlQ5QunP3+n9N
         gi+UBgjagLKHV6+BUOyU1FxNZQ/x/mlGVPxqHC1gxgk9r8e/xT1m9qGcCiVa6CvvUu5v
         2MB4WwZRjU8bBJaXS7ZafWML+QUi1eLzkFO55d5VbwkNjQM2yXzoTEbFbkfDgAWWoq+H
         IQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUxGkiTq0+cf8xX7WePjQlG8etv1YE/gZZPH/K1GumEihqaThwPs+H2HRXsPdE+VnHbjc2arpUrQ6yna4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zjVkSWabXhsAZ7POeE5Xf9K3lUIiGoa6nAO9rkNpViAx+wN3
	pfDimn6Visz/AgyHVeqEv6L+1WVYYqnwYXSK34QfjP+7x/l9WPid
X-Gm-Gg: ASbGnctnzRYgdiNBCoQtc0fCsikIovPs4fE5yz4NzqQKDiIz9R9Vw9ijDlXYsmzL2Ey
	w9CtY3wDROiwdiIgkwQzUVSHbx82vcstLK/teJcrZ8rIXt9jFbgNbNE1h1NwevhPfTXZ8aqr+0h
	K0KfteJ4/FqpYTXUVeOG2a8xuQDWj5GEsaxPHeGoHKCw5ASnK5v+Lyo12Zsb1ecX5mBCNUmw/Vc
	xQIf0JOPuU0SE3KMDOw3zDL/QU4If1piHU0q8s30KQNdgK+3WDoEQf3tvOJ90wF9ZS6eALS+5Mi
	LSTxrZdt5zVY21OYDQRHtc2pl2KzQg6/UcDDdr+Q
X-Google-Smtp-Source: AGHT+IFUf++OgAgcgEE/jllAqe/2xp+HKZXduxPSgKSJzuJy0O2KnPlRozOobSvaE2OdSSt5BeiCYA==
X-Received: by 2002:a17:90b:5845:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-307730fecd7mr10266507a91.2.1744382220922;
        Fri, 11 Apr 2025 07:37:00 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5630754a91.1.2025.04.11.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:37:00 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 11 Apr 2025 11:36:43 -0300
Subject: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
In-Reply-To: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Use a faux device parent for registering the platform_profile instead of
a "fake" platform device.

The faux bus is a minimalistic, single driver bus designed for this
purpose.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-pc.c | 46 +++++++++++--------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index 794924913be0c6f13ed4aed8b01ffd21f1d34dea..48cc7511905a62d2828e3a7b593b3d2dae893e34 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -13,18 +13,18 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/bits.h>
+#include <linux/device/faux.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_profile.h>
-#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include "dell-smbios.h"
 
-static struct platform_device *platform_device;
+static struct faux_device *dell_pc_fdev;
 static int supported_modes;
 
 static const struct dmi_system_id dell_device_table[] __initconst = {
@@ -246,7 +246,7 @@ static const struct platform_profile_ops dell_pc_platform_profile_ops = {
 	.profile_set = thermal_platform_profile_set,
 };
 
-static int thermal_init(void)
+static int dell_pc_faux_probe(struct faux_device *fdev)
 {
 	struct device *ppdev;
 	int ret;
@@ -258,51 +258,31 @@ static int thermal_init(void)
 	if (ret < 0)
 		return ret;
 
-	platform_device = platform_device_register_simple("dell-pc", PLATFORM_DEVID_NONE, NULL, 0);
-	if (IS_ERR(platform_device))
-		return PTR_ERR(platform_device);
+	ppdev = devm_platform_profile_register(&fdev->dev, "dell-pc", NULL,
+					       &dell_pc_platform_profile_ops);
 
-	ppdev = devm_platform_profile_register(&platform_device->dev, "dell-pc",
-					       NULL, &dell_pc_platform_profile_ops);
-	if (IS_ERR(ppdev)) {
-		ret = PTR_ERR(ppdev);
-		goto cleanup_platform_device;
-	}
-
-	return 0;
-
-cleanup_platform_device:
-	platform_device_unregister(platform_device);
-
-	return ret;
+	return PTR_ERR_OR_ZERO(ppdev);
 }
 
-static void thermal_cleanup(void)
-{
-	platform_device_unregister(platform_device);
-}
+static const struct faux_device_ops dell_pc_faux_ops = {
+	.probe = dell_pc_faux_probe,
+};
 
 static int __init dell_init(void)
 {
-	int ret;
-
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
-	ret = thermal_init();
-	if (ret)
-		goto fail_thermal;
+	dell_pc_fdev = faux_device_create("dell-pc", NULL, &dell_pc_faux_ops);
+	if (!dell_pc_fdev)
+		return -ENODEV;
 
 	return 0;
-
-fail_thermal:
-	thermal_cleanup();
-	return ret;
 }
 
 static void __exit dell_exit(void)
 {
-	thermal_cleanup();
+	faux_device_destroy(dell_pc_fdev);
 }
 
 module_init(dell_init);

-- 
2.49.0

