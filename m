Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89EB222590;
	Sun, 29 Jun 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202887; cv=none; b=B0iYGE5au7NOURf5c6bEhTNul59j+hse1A8gvruURQ9etUdQx7NX1d4+Dus/IW01meHFaSnY6gcE43nwPGFVKiYpaRlrZSp36FVN7y6co5uJI6GPuCfPqLxhmMkCG1Us9L6XE8OsaT49IYfM/sQ/2R5DrV97uF6NFbIdFI+80ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202887; c=relaxed/simple;
	bh=27nPmaPNuD4ssV22ZTaHQEKhxiVwGzO4Uh1MALuKLLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVKARwp2KErnGE+p8yJZq1WB/zP7Wv9uyVwESs5+AgciZyqwZbQaB6KuDqOAHOcH2dR9NDXZD3B0zIy3UmYuxotQevAB+8MmtoKnVURye5yvJTvfritGCgBkFjNwQY8UJVLSSv2emYvSbU+DdkTu8Za7oCQIBSZBbHOtzr/+FaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbFOyOpV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbFOyOpV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d6ade159so7653115e9.1;
        Sun, 29 Jun 2025 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202884; x=1751807684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4qO2NHkLOriQRO6tXgAApGWBpyjFgN/kHBQ4Aiaqqs=;
        b=jbFOyOpVGNkOQcXBAIoRLGNZ7aI+cwUSMfekQfaSNzWHdm4CrT9ISZAyRgrqeFtlDH
         2GskFq4o0LxDJyoQ6nhbwGkS5AaA2zRy16VSVUO/t1RiDba0e3b27M1zTIj7zEe7ueN/
         aWXdggEbtZP58AinSj5cpExv6dVer0V+3jmBl8uTomdkPs/jD314xheKDXqBn2u+/ls0
         7WHnXHjESkUSleyTzJS+4cQ+Io5P/ymW9MsXQ3uK6x6/Df7g13XY/26iN8JMsCgLIt3E
         N/KxLt110vQJMj4cLFWcIMM3YLD54U5io6JfO5ZAXs9zPB6AeXYOmfdbBBmHMHQ3wDEz
         talA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202884; x=1751807684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4qO2NHkLOriQRO6tXgAApGWBpyjFgN/kHBQ4Aiaqqs=;
        b=qYPobtSlX0PplbnRQo5kFtufiAp+baCQjDhhdQtl9SBImtnMigZFxb7BAOb2fmYwX9
         sfxBL2xUgZ8Cmh3gCP1uZ2CA4aa5P8BvQ+x3oPF6gc5YB22aGPv7I3OQfnTGLFYAKTVH
         FdJa2USZ8biy1RpklJGxgfrkA+AGxUcDj+cqLhnYEQ910rDxVEiX7C59pdHhE447tyFw
         G9m8wXnPjF4mkiogxnJ8Ijj/6/AtgRap+nombzsbKY1fGzYTFGm4g7HUc65RTsRZAZyl
         2JGHp04foYLkfWL7BullwpBJYZfnAWMrQc8wER8YXd1zxLjDjWqNECrbABOarUmRh099
         SHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDd0hLf3r4pLWJxm69S/e9s/H9MQDRhqyQcJ8CtkmG8G3xYSLWPspgihxXWkSF5CEUsaBvB7MoA30E8Osz6x2YiMzg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtejj8O/YFoq4GzVgHq4MWwDsDoOL+RA4gbdVuMlpBNdNUcU06
	N+giMsmKzvCImUOkDXG5B4RpAdNKpISNdFvAdb9J7mV5h8M7tusP+IysAPPMWg==
X-Gm-Gg: ASbGncv198r7WeesvXCH9Zev3WjC5Bf2IrYjq+RWFlVOE0MQrcrsHiuHSFw/sGHnGq9
	gaMRynv9qssJ/WvX52EJB0Y5czRoLtSWVC1MQ7dxWkTJYVH6nGZrsbfKxH14Tmpl60MveqKzNXY
	gjJqhXH4ztD7EOdfM+ASdyL3SxyIT05CHlgXsOIt/UF+NHydyF1vV4kHexOXTDUDSB1uKFwoPr1
	MZRgbWfymfZm1v4dJ7fMg4iNwpsPjgasA2mlQrsZTD3NqLDjHgB2G5VLtjGD4BPU/G1Ht4yW/dU
	SQc3CniOQKBQTJ/1qdyO1HAMcL7WBY2hUel0V7rvQ+HeqoOnY3AxsyYnaa/du7A=
X-Google-Smtp-Source: AGHT+IHsqsz75F4n7LJQr5XC0guSKdaed/rinhJpeZr61IhxYfIH8NhEqlWHsCtXzRE0FOvo171BVg==
X-Received: by 2002:a05:600c:1f0e:b0:450:d5bf:6720 with SMTP id 5b1f17b1804b1-45391c499bbmr96659485e9.3.1751202883835;
        Sun, 29 Jun 2025 06:14:43 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:43 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH v9 3/8] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Sun, 29 Jun 2025 15:14:18 +0200
Message-ID: <20250629131423.9013-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629131423.9013-1-benato.denis96@gmail.com>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 98b6a918f44f..26513338208c 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -92,7 +92,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
@@ -405,6 +406,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -418,6 +421,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 781e02623dc1..52c345de03a8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -76,6 +76,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.50.0

