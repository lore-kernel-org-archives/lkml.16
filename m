Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D69C18A953;
	Sun, 29 Jun 2025 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751164404; cv=none; b=P5uBkhEbgELdtD23silCOAiGY5UpPTt1XyMIcs5g6+talWTbwqpNRegQyZUXIXXC1f3pYQrkIEL6aHBGIEtg21ieK1t2UUdQqB6BZrOsg790DkTdn9sKOqHwLrBLXk0HIb0wCrXJsal+9d51swuA7656IrXDul/a1tjTpbVTYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751164404; c=relaxed/simple;
	bh=4frRl+NjI8ze8KHkLHFuHYY6hNNUOhVMtf0yzK6KW4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4QoGceBXZ6h/oSWjmr/rf9Tr4wnImOglsx3nyJjruiOTq/0jTDrQVf93u038EqwpwzoaY3h7tfpvP79en0ZVZlI8UwG0wJXEJ1gRIgvnCxi2009ZBv6n+39k388kgWZfuAyCyLp1ewOgHJC1JImbSCxauJVyaJ2eLi28lsTuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKlx3Sef; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKlx3Sef"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a442a3a2bfso21350421cf.1;
        Sat, 28 Jun 2025 19:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751164401; x=1751769201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtVZw/a0Pmqsz5CdBXUv/8QNoTvrF/mGpWCdQtvEPCw=;
        b=SKlx3SefxxKK3Lo/Vtgp87WgagT8skKii1q2ofFvg+yQCycB6lBBhy1NsOVjtPEeIc
         wTXCHfdSU6+FVN3HIQY8lLa5ShrKLZ9wY9OU8OFj5I6qFpfiuc4wBnIuJJHA3NvED4oQ
         2T5reuvH5hz2EraKuPjtRNh6SjTExbx5B24YKurifx6PcuX7/EOP0evd8KzYub8FTbr3
         RBrn0qPUQR0oF/Tr805hymtzKuOgDV6urRODbaKwXmSnphCSWuwzxCi/7ayFVIu54HyK
         YvsIGaHYcfZ/OenYQBkn4iVabPpjKwO8U2a1yIiARj+oow9x6lEopRT34lTRDsNHBnYA
         O6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751164401; x=1751769201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtVZw/a0Pmqsz5CdBXUv/8QNoTvrF/mGpWCdQtvEPCw=;
        b=S7xvdK6A9S4tHykguJlEyVfr+WhDk3VQ6fVq9pM80n3rQDn1+OHl8fiXMyrSssu9Ki
         RWCkB/PsWtizB4EFTs0CZhUQQibS/KTxDWYN/oVgjMDds6AIJlv4nR5L87h+zuQ9uJsu
         Qmt2ouCG0nrExa3miUR5Ctvuflz60SPidNUvosS4pw2cVLX25kptnIQs5TFMpdZjoO1I
         mYpAOa0+xZ0LL/o95CLPKNmWzlxxaoYXRnB75xQpzPj3OctjStKvix9DnsixeKkM9lnx
         YR2J70q9BYdhfcocwQiMfpS+LIQqH4ZNCrp4VATPifruTcFVvRNEKDiSglAKssTLOX0T
         +z1g==
X-Forwarded-Encrypted: i=1; AJvYcCWM20Tk98jxtON44HA4MQEExRZhBcKHaukHOq1XAJd7veCS2TKHLcO0nHRYhecG2qT3qwYFIB+hDlLlZi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVFxDUh+7ZPwuF8CBL8c1V4FBqAjhqkx1j/kcVU+McAw4H7MjF
	2+vkULateuBiYWiwqtF6TcyeynP6gFqB3fQhIPdTw3NEQWHOsTz6mI+N
X-Gm-Gg: ASbGnctZQdc+GYw7W/LP9w/EUUQjt4ZJ1X9vNaNG1q1FB5CTOIgW/qknV7MZu2dfLU6
	CDfRjc8Xek1kPUxtprIUqNHygnFz1SBgHwfTPcbcqnc5yZfMmJ5W6jIYcJSsjMpJC1DaSj/CG8l
	I7uJZX6zd7R3bkvCisyF+rg8BypeC/pNAn1O/8/n5SdlUYCwZybt0kPpnvdF7qHTUj5EKOqoxxY
	PtkflIqHbAdGnzPkrJ0sTCa08yOSXYKaMLgGLAgUjR/ChAMMF4K53m214nKw68OZmTcYRmqSQMo
	Fbit2hRU4Icth/LRdgOb8BFodc3XRJqAp6hlsc5YtBXOu1wseOYPl5tJDYnJpQ==
X-Google-Smtp-Source: AGHT+IG33knh5/EKRSMraS+XGepHzA9rayJus8oSr2nzUZ06QYx7b6jprFn7wmOcDX104MNf6fSuqQ==
X-Received: by 2002:a05:622a:1456:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a7fc9ca497mr117404131cf.10.1751164401075;
        Sat, 28 Jun 2025 19:33:21 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e285sm374242985a.45.2025.06.28.19.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 19:33:20 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 23:32:54 -0300
Subject: [PATCH v2 2/3] platform/x86: think-lmi: Fix kobject cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v2-2-c530e1c959d7@gmail.com>
References: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5694; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=4frRl+NjI8ze8KHkLHFuHYY6hNNUOhVMtf0yzK6KW4U=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkJS1/fnC/06+DXx/JHp23isKvOt49/bdPN02Fe1Zr+9
 GrEJGa1jlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZiIjwcjw68FbHWz2d/2+R2p
 LLL3+Kb28qg6R1bgv0191/cEdKYGf2L475zBWvlCepl8TvSO/R/PcS95rajE+P6/vJwWq8avt9l
 n+AA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

In tlmi_analyze(), allocated structs with an embedded kobject are freed
in error paths after the they were already initialized.

Fix this by first by avoiding the initialization of kobjects in
tlmi_analyze() and then by correctly cleaning them up in
tlmi_release_attr() using their kset's kobject list.

Fixes: 30e78435d3bf ("platform/x86: think-lmi: Split kobject_init() and kobject_add() calls")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 35 ++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index b3e7d76cccf7840a5bcf7f849f2a70e164cb7086..200e58f130f8874b929ceb0d98bf4daea77740c8 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1382,13 +1382,13 @@ static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
 /* ---- Initialisation --------------------------------------------------------- */
 static void tlmi_release_attr(void)
 {
+	struct kobject *pos, *n;
 	int i;
 
 	/* Attribute structures */
 	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
 		if (tlmi_priv.setting[i]) {
 			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
-			kobject_put(&tlmi_priv.setting[i]->kobj);
 		}
 	}
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
@@ -1397,6 +1397,9 @@ static void tlmi_release_attr(void)
 	if (tlmi_priv.can_debug_cmd && debug_support)
 		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
 
+	list_for_each_entry_safe(pos, n, &tlmi_priv.attribute_kset->list, entry)
+		kobject_put(pos);
+
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Free up any saved signatures */
@@ -1405,19 +1408,17 @@ static void tlmi_release_attr(void)
 
 	/* Authentication structures */
 	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
-	kobject_put(&tlmi_priv.pwd_admin->kobj);
 	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
-	kobject_put(&tlmi_priv.pwd_power->kobj);
 
 	if (tlmi_priv.opcode_support) {
 		sysfs_remove_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
-		kobject_put(&tlmi_priv.pwd_system->kobj);
 		sysfs_remove_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
-		kobject_put(&tlmi_priv.pwd_hdd->kobj);
 		sysfs_remove_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
-		kobject_put(&tlmi_priv.pwd_nvme->kobj);
 	}
 
+	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry)
+		kobject_put(pos);
+
 	kset_unregister(tlmi_priv.authentication_kset);
 }
 
@@ -1481,8 +1482,8 @@ static int tlmi_sysfs_init(void)
 
 		/* Build attribute */
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
-		ret = kobject_add(&tlmi_priv.setting[i]->kobj, NULL,
-				  "%s", tlmi_priv.setting[i]->display_name);
+		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
+					   NULL, "%s", tlmi_priv.setting[i]->display_name);
 		if (ret)
 			goto fail_create_attr;
 
@@ -1507,7 +1508,8 @@ static int tlmi_sysfs_init(void)
 
 	/* Create authentication entries */
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_add(&tlmi_priv.pwd_admin->kobj, NULL, "%s", "Admin");
+	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Admin");
 	if (ret)
 		goto fail_create_attr;
 
@@ -1516,7 +1518,8 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "Power-on");
+	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Power-on");
 	if (ret)
 		goto fail_create_attr;
 
@@ -1526,7 +1529,8 @@ static int tlmi_sysfs_init(void)
 
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_system->kobj, NULL, "%s", "System");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "System");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1535,7 +1539,8 @@ static int tlmi_sysfs_init(void)
 			goto fail_create_attr;
 
 		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_hdd->kobj, NULL, "%s", "HDD");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "HDD");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1544,7 +1549,8 @@ static int tlmi_sysfs_init(void)
 			goto fail_create_attr;
 
 		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_nvme->kobj, NULL, "%s", "NVMe");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "NVMe");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1581,8 +1587,6 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
 	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
 	new_pwd->index = 0;
 
-	kobject_init(&new_pwd->kobj, &tlmi_pwd_setting_ktype);
-
 	return new_pwd;
 }
 
@@ -1687,7 +1691,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		if (setting->possible_values)
 			strreplace(setting->possible_values, ',', ';');
 
-		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
 		kfree(item);
 	}

-- 
2.50.0

