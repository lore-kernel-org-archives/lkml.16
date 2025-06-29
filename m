Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46222422D;
	Sun, 29 Jun 2025 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202888; cv=none; b=Spbn4vMzdalquZ7KxVRhrkTtDih0ecRVlWxCKJB9pVUiQiw3rkSed4uo3TXlul1zEWaCC0pWS7PP5XaSYJaYpDsrONLamp56fsYagVH9EyWahGH4vKQAWXq+eOY+Nz7rf1ycsoWb0jH0mZ0RUq8Ys1LzxLXYZemr26vTjNgq/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202888; c=relaxed/simple;
	bh=PFkyoH6RXYCH7Oc77ngWsYVhybmPGzBkI8FfJnlVTJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVkQfLNJlMZBPU2dtycjJSy0puh/Jy5BKvtt7kBd4/mp74693EBpGPNTmEr+YzbHiNstZ4Ln2Gez0RS5qMC3zANWSSjJIsobRIRVWLgZzUBP7G86KNORAfuBmjWXJO4MfYA14iXujTv7JVovzmEGsR4LnFPPf7dOjzASRbkeTus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK+VEN20; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK+VEN20"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so13726435e9.1;
        Sun, 29 Jun 2025 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202885; x=1751807685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4ozp3RvzsMd9K6m9KNqjEeFwl7v82h3sF2+3BdGbYo=;
        b=XK+VEN2080AGyzeqRPeo2BbcE3U2HBE0hfPnaHoz9+v0uqFz16zm4xhpz3LdBGizTd
         GDkOA6M0dyWUwIvudJSRM3DECzxxFgEfXjYFigD6h6aMz8sMeLMYwcveyWpetzG2i6/V
         Q1surR744cKhAhtayZtOaWyitPqIzQBJs6HqM12TEqq7qCrQ1+1au01zWYDzAZYaeuR7
         +k/17aIerQ0XmKPODl0mJBPjFTK+8cZmXmlQNH0hbWFwWedhkfMRujsUSqtbMQP3u1/b
         AuxX/c2sJBkPgueGNcojNjpE09FkUBf76/pGF2EECll03EDEj4OlSXlCQlxpsnZMZhYA
         grDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202885; x=1751807685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4ozp3RvzsMd9K6m9KNqjEeFwl7v82h3sF2+3BdGbYo=;
        b=v2yhegSQklEfrDO68sfofyIJnNZP15ilOmkZo69IaKMnI44D645o8b2G5Vv+t0Qswi
         MyC+4XD3fxPCrxwixEhaiQnoJpl718WEDx7P6aI46Af5sZY01FrJ1fZ/fwLZvhopD/oe
         oywXeJ3/EEzmmz7v4MRN6RAqaKhh+Xd20L7obfsa8oaTDTtfIQF2wARlFzR+in893m+r
         8Hg4O93fAZpJE37kIQBBwaTRiLGStYliYjFloOEkgPYR7DtyRryBi1oJpIt6adVIqwlD
         psvhEmlYH1KRhQMo1+SMjrljGKr0QPZkSF0HHQ6osbCiR4Yk9zEClYk27A8pGvPOKfO8
         mwlw==
X-Forwarded-Encrypted: i=1; AJvYcCUBjgWjJVrAcshO3o+n0AQh4jj865ksLRc7sW0UsGMwbDM3CNbP27kNLbcc46cCWjFQVneNa2jUH3y2DaS4va8PXAi1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2fXsEppWI9xK1+7eURjHIHLnJiIc6PHlY76a3sH1HLk5JUln
	EuJg5AsEE2M8VfUZp/SB0oPJj16fZsWnZ5UnpgXFdO3KMzeirJwqSKrZLIxKZQ==
X-Gm-Gg: ASbGncttVGt+meCZ1c6Ve7RMZRTHCcqT60iIftHbRcLhzcIPkksQ/m1dDxtDcrIuajp
	dVQOCOKp8gYbdMrCEbMjEEmHg5/t3YNuxjnVQXolUm1mW1bBNBM/zsQ9iwolIvpzUPrHdVM6+l7
	vUheRqhjuAtgCyzBlHEhEBsb96m0DgnVHH+Ivtkl656ipS8/WUOb05/a0Hk+hN/A0mgalJ0qaES
	zmoZKhAeL7oSjlDBOukVCkgdBJyd6dDiAwMCb4FaMnhMJsqrwBfDBg3KxQfyTBSxZ5LmwF3zHst
	RNi2rGQWYg4zzlXO4YJiVqO4bTiSidTf7cpGfha9e8Cy2wFLv7m0zg9zx7nmBZQ=
X-Google-Smtp-Source: AGHT+IHlNx7xuDPLjst1ikvMZs4nE9HL5mo/Ji+h/wMuqaoTAdvBR3z/KnW/32G4+jvJciQB5pwlNg==
X-Received: by 2002:a05:600c:3b03:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-4538ee7da93mr99459785e9.21.1751202884443;
        Sun, 29 Jun 2025 06:14:44 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:44 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v9 4/8] platform/x86: asus-armoury: add apu-mem control support
Date: Sun, 29 Jun 2025 15:14:19 +0200
Message-ID: <20250629131423.9013-5-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629131423.9013-1-benato.denis96@gmail.com>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Implement the APU memory size control under the asus-armoury module using
the fw_attributes class.

This allows the APU allocated memory size to be adjusted depending on
the users priority. A reboot is required after change.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        | 81 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  2 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 26513338208c..25b56d4fa53d 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -396,6 +396,86 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
 ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
+/* Device memory available to APU */
+
+/* Values map for APU memory: some looks out of order but are actually correct */
+static u32 apu_mem_map[] = {
+	[0] = 0x000, /* called "AUTO" on the BIOS, is the minimum available */
+	[1] = 0x102,
+	[2] = 0x103,
+	[3] = 0x104,
+	[4] = 0x105,
+	[5] = 0x107,
+	[6] = 0x108,
+	[7] = 0x109,
+	[8] = 0x106,
+};
+
+static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	int err;
+	u32 mem;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
+	if (err)
+		return err;
+
+	if ((mem & ASUS_WMI_DSTS_PRESENCE_BIT) == 0)
+		return -ENODEV;
+
+	mem &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
+
+	/* After 0x000 is set, a read will return 0x100 */
+	if (mem == 0x100)
+		return sysfs_emit(buf, "0\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(apu_mem_map); i++) {
+		if (apu_mem_map[i] == mem)
+			return sysfs_emit(buf, "%u\n", i);
+	}
+
+	pr_warn("Unrecognised value for APU mem 0x%08x\n", mem);
+	return sysfs_emit(buf, "%u\n", mem);
+}
+
+static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int result, err;
+	u32 requested, mem;
+
+	result = kstrtou32(buf, 10, &requested);
+	if (result)
+		return result;
+
+	if (requested > ARRAY_SIZE(apu_mem_map))
+		return -EINVAL;
+
+	mem = apu_mem_map[requested];
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
+	if (err) {
+		pr_warn("Failed to set apu_mem: %d\n", err);
+		return err;
+	}
+
+	pr_info("APU memory changed to %uGB, reboot required\n", requested+1);
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
+					    char *buf)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(apu_mem_map) != 9);
+	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
+}
+ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
+
 /* Simple attribute creation */
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
@@ -416,6 +496,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 52c345de03a8..c0fcdad6443f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,8 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
+
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
-- 
2.50.0

