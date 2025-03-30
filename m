Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09764207F;
	Sun, 30 Mar 2025 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743349175; cv=none; b=fRJOFo3K2XZ7qJFOH6Cx4M+d0z5zCb0eBTHufqPju878cN1+hmSnlDqfwUUErPLUe8ha6evwjYS4BFc80regr5ZtB/1F0n1f7Wt47yLX9+rXVE8OuuIk7S1C8WAZfWgETmKbPP40iNyFz7HoulJ5ZnATNEljDTWGMlCmKB6BRpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743349175; c=relaxed/simple;
	bh=rwpn0ZWccQCoYMMHv7hBC7U7B/ycmzihBc2qCCSoCXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=idbQYsizcLuNTpA/7RZ9xlbXcOuF92LmqPLYGofK+w8KsY2PQo29eiz5GLFFraHP840fkRRCCzBup5oCh+S0gZu8X86rlElkNGuA2F15HXPpBqJL2Sd4wCIwnRtTvrzKj9aFrejacvPIxmTo109zbRfZtFhF1XXfFaxMwyak3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ0RYi/t; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ0RYi/t"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so67840325ad.0;
        Sun, 30 Mar 2025 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743349173; x=1743953973; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Odf5uJ0Td/+P0oybq3bSP7hkpl6mnapoydQezFJvEAo=;
        b=bZ0RYi/tlW+qlm4+NgjGGh7Ipm/iLGJDkUG5DKbqacT6ZQY5NUax3UR+upUCfSDd4D
         uUyj6HbgfoQazwpC4Cr0d4Vsp0RRCsO8UAt4wvE5yWZrWRUd8Y9dU5rAIltr7xNUs2tP
         PW/t2kovFMkJynHuxS6M4gWK+kZO9Vd9W5IMcbpj17Am1VJjmfYuqqri/X7vIMe0gS2h
         uiyvXsVFr6qDEqhSQ06V7VztasGLjNSr+WBVZN4rkdT2JjUKDKY8VCrRGeI2MgItoHLF
         1gXOjlq8Y2i0XVOL2j8ofGENyk6DJPPUJb924LWecAcnIkYLZtXIgBLbewgg8SqAWrGh
         Du6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743349173; x=1743953973;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Odf5uJ0Td/+P0oybq3bSP7hkpl6mnapoydQezFJvEAo=;
        b=PDwZ1Gh521ucO8rDPFuQI/zlVMRKP8qYgbHzVV7BTYUjbLrS14FUJw4kayyuPDDqaQ
         Q63NmYTWubUKMNAijw0DuxomunX/RKNRHhPJmvkv6Ph30t8Ijrusebs962o3Jy73Hsej
         KOUYSecbdQmjWysYJiwXOJrxDem9hgEXhUUJGxvmyUP3hgmgHmJv6KmO9Nq/a1Ibyzj6
         DtTOx42vgtXjZlkX2JPO7e3d3lco0nbDSqsLTCjoylsxwzGBuNAXl8SOJEcKdi9ioEIS
         dq8zNwwwxWZS7tOoYkXZlxLXyC87/ckXPIckcbMEvdXIgcaY3gGn2RAqMOwF5wXNw8Xu
         isvA==
X-Forwarded-Encrypted: i=1; AJvYcCVwCa/6whZzx4Z4D5WKsnX4f6vEARdBauCDyuzwCPuCeI3x7+m17KFCzI9aDYiRPbfMIN+6T41adQ1xLqo=@vger.kernel.org, AJvYcCWFQOouwYcnzGWGDTZGmIcSdV5CyA0PxNwRHetGQon64YSY5l7bNAjR5JXaa2XfS1gvW2BeyT80yFwwjeH7vQqh/uQyjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeUwVhcCSK0sWA5Wyd/DTt+XfjaO7On0QR1WkxToRBdHp+aPm
	n0YpFZYWfZzDQDIvKLLIHJJZaA4Wq1tjNm5nIJvVwCJtVHU9X/TfpwfPsA==
X-Gm-Gg: ASbGncsTkehm2iXctj68z67V/zo66Khq7sebJH0+1JtOoAYwjT/uBKidT3hwScso/G1
	mUMamDXzNGX3Za5mUgmeVIBRSkLHBF5oTGcZ25B8L/108EQY4Ij7UR6pJHMaDBqXyDvL0pIxQYa
	/VicwSyzbvuvQbzkR9eMy1GLnUc/aXJ62R3eJY1z/qIrmTALzGvqZV/GDJ77L/x2x0YWYcV6eMX
	+hxGxGp3o5MCov5My/cm0AHzpjOTsMWZr2Awzk4SfyEDB6PG3AM5F8lDuaB6Qfn26utW7QiU5Vh
	U7nffmOelhSpWwiw+qRnwv/ASW1NP8RstIFHNPEOxFTp
X-Google-Smtp-Source: AGHT+IGSfLghLy1Qv0g2krph+jEYh4k6lQKvKQSkwKC/0u+H62Q2vpUTqwtgr3qkYZBhkZ23R3zJBA==
X-Received: by 2002:a17:902:ef07:b0:211:e812:3948 with SMTP id d9443c01a7336-2292f8a0002mr98229895ad.0.1743349172977;
        Sun, 30 Mar 2025 08:39:32 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec7309sm53793865ad.33.2025.03.30.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 08:39:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 30 Mar 2025 12:39:16 -0300
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer dereferences
 while probing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKNl6WcC/x2MWwqAIBAAryL7nWBKYF0l+vCx5RKYaEQg3j3pc
 wZmKhTMhAUWViHjQ4Wu2GEcGLhg4oGcfGeQQk5CKcHvQPFMxvOdXj5rb4XXTllU0JOUset/t26
 tfT4lQMleAAAA
X-Change-ID: 20250330-thinkpad-fix-98db0d8c3be3
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Damian Tometzki <damian@riscv-rocks.de>, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Some subdrivers make use of the global reference tpacpi_pdev during
initialization, which is called from the platform driver's probe.
However, after

commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")

this variable is only properly initialized *after* probing and this can
result in a NULL pointer dereference.

In order to fix this without reverting the commit, register the platform
bundle in two steps, first create and initialize tpacpi_pdev, then
register the driver synchronously with platform_driver_probe(). This way
the benefits of commit 38b9ab80db31 are preserved.

Additionally,

commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")

introduced a similar problem, however tpacpi_sensors_pdev is only used
once inside the probe, so replace the global reference with the one
given by the probe.

Reported-by: Damian Tometzki <damian@riscv-rocks.de>
Closes: https://lore.kernel.org/r/CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com/
Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
Fixes: 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
Tested-by: Damian Tometzki <damian@riscv-rocks.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Hi all,

The commit message is pretty self-explanatory. I have one question
though. As you can see in the crash dump of the original report:

Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0x10
Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkill]
Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230 [thinkpad_acpi]

The NULL dereference happens in device_add(), inside rfkill_register().
This bothers me because, as you can see here:

 1198                 atp_rfk->rfkill = rfkill_alloc(name,
 1199                                                 &tpacpi_pdev->dev,
 1200                                                 rfktype,
 1201                                                 &tpacpi_rfk_rfkill_ops,
 1202                                                 atp_rfk);

the NULL deference happens in line 1199, inside tpacpi_new_rfkill(). I
think this disagreement might be due to compile time optimizations?

Well, if someone knows better, let me know!

(This driver is going to give me nightmares, sorry for the bug!)
---
 drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0384cf31187872df90f5ac3def9b1d6617e82ed5..a17efb68664c9c7723daa2aba023ba0cbc6b96dd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -367,6 +367,7 @@ static struct {
 	u32 beep_needs_two_args:1;
 	u32 mixer_no_level_control:1;
 	u32 battery_force_primary:1;
+	u32 platform_drv_registered:1;
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
@@ -11820,10 +11821,10 @@ static void thinkpad_acpi_module_exit(void)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	}
 
-	if (tpacpi_pdev) {
+	if (tp_features.platform_drv_registered)
 		platform_driver_unregister(&tpacpi_pdriver);
+	if (tpacpi_pdev)
 		platform_device_unregister(tpacpi_pdev);
-	}
 
 	if (proc_dir)
 		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
@@ -11893,9 +11894,8 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
 
 static int __init tpacpi_hwmon_pdriver_probe(struct platform_device *pdev)
 {
-	tpacpi_hwmon = devm_hwmon_device_register_with_groups(
-		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tpacpi_hwmon_groups);
-
+	tpacpi_hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, TPACPI_NAME,
+							      NULL, tpacpi_hwmon_groups);
 	if (IS_ERR(tpacpi_hwmon))
 		pr_err("unable to register hwmon device\n");
 
@@ -11965,16 +11965,24 @@ static int __init thinkpad_acpi_module_init(void)
 		tp_features.quirks = dmi_id->driver_data;
 
 	/* Device initialization */
-	tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, tpacpi_pdriver_probe,
-					     NULL, 0, NULL, 0);
+	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
+						      NULL, 0);
 	if (IS_ERR(tpacpi_pdev)) {
 		ret = PTR_ERR(tpacpi_pdev);
 		tpacpi_pdev = NULL;
-		pr_err("unable to register platform device/driver bundle\n");
+		pr_err("unable to register platform device\n");
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
 
+	ret = platform_driver_probe(&tpacpi_pdriver, tpacpi_pdriver_probe);
+	if (ret) {
+		pr_err("unable to register main platform driver\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+	tp_features.platform_drv_registered = 1;
+
 	tpacpi_sensors_pdev = platform_create_bundle(&tpacpi_hwmon_pdriver,
 						     tpacpi_hwmon_pdriver_probe,
 						     NULL, 0, NULL, 0);

---
base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
change-id: 20250330-thinkpad-fix-98db0d8c3be3

Best regards,
-- 
 ~ Kurt

