Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482551A8419;
	Sun, 29 Jun 2025 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751164406; cv=none; b=RhcM+NnkxLWpxSrRGq93zYYcpnX5YrebxjOHKov8uSAvHuyssojdNywSDB6FUIyGe+Z3c5Srmg6qPRkIQnS8i2QAI4QZg8011cXUnKFpL0sAQlz+7cbeSqB3gFx+s4u97BuTtl88E2D7+xpQkEOfb+l00rpPiB3WhrV5DlbGb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751164406; c=relaxed/simple;
	bh=FaQPTkm6B0uaTh4SF38aYxONyNRJUBKGoYUMqX8jP8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8Z9QgZd9Iizyp/70xM5gGwi892feo5jx6TU2BcKEZmBcDes5hqq4z458lf4X3dnnxYOy+Oz6513/Gb96xCwv2G5/2YE1ow2oymTMUOoJXncxbAYs9R+bOg9Nls3ze7OMQgXYSeWRSrJQWmAjfrAtc85VQXkx7rpmJ60vlmefDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG0A66qf; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG0A66qf"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a4312b4849so39534331cf.1;
        Sat, 28 Jun 2025 19:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751164403; x=1751769203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlxZ5m41HrSs0oPioWCRWil7R6kunOaWMyh4q2HiDWQ=;
        b=eG0A66qfY4un/LW2hKE0lB/EN82EE9ei0OAOQzw0f5eCVYYapUdWtPnYy7sEONp2ed
         iRnNTW28F5r1ISm8igSXMJOCEfcihDvhj0B7IlgcZIJv5sIUFYoNL3R6afJqWoUJOBAw
         AeO0uaEkOmPNMV943UV7TIZT9QRKGGd1C5DNccjmnXbGnPrN4GuGaob63yW9ORQentXt
         VsMggw1jUS3ODF/eKE0GDuqZSXm1WArkZjbx0RwAjSmRH5b0lmilW+obsMyCmlKcTqPx
         8PD8EaqlWFTEMIiOaQXlNgPQgpOCkPZshtX13NqfhP4LZjzUPUbpyjFFPj9Lh03F/kUQ
         HPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751164403; x=1751769203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlxZ5m41HrSs0oPioWCRWil7R6kunOaWMyh4q2HiDWQ=;
        b=edRQ3M7hpkdriKX9RXpbNbB+ReWnOmXRKGkpOU0Z8E6vUn09PRQMlAuWP11Mjzw3As
         OHMAqPGtmxNyKsKWzWVAprnia7s2VLIRxE7MjQF1xcL6IDYAmyjvFbTLAfuIaurzkFx0
         xEatjJzwNKg5Mw5Mrz7cixOCVXwMV6l2vGj+MQcZDxzpYV0fnNavtEZSA0mm4pOvdVKY
         UGuEbyq8Sh336GBP5jmWK5kVBzYg6V+LcLcP+a5Yy9mGCeYQUdgdISgliwCJz04qLwJX
         4+o/3HNQXdPF4Xc+4veuN34z5Y7Lcr/ehmj1mTO5lnBAJCQzXHY6vt1FAZxZ0UbjMjZx
         0y5w==
X-Forwarded-Encrypted: i=1; AJvYcCVk+WhPVp0HWiA1o5yb4/Pjkm3C63iooGDhzu2PvhrYhvjfbyqENmsNEFMWdvrURmIABqMXC+DGzvcOWGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgpaqgKSFinFd9ssBbv9Yoehw4tETHs9sh2y18FgIujBC+ToL
	OJfR8DKEdaT80Iw0qNP8NafZms/DqLN4RTr+1JWYLgg/H4p+sfq3ChCc6l5Nazh+
X-Gm-Gg: ASbGncuNS6lr9srLDiyTNvDB8tj7q++GWD0PWhFMj5Z4WFIjjxasTVTyfCZ6Okd2OQB
	/Vaoie5d6baGLper2YN56AkaBxkPFph0d4QbBD0QEg1p4QG+FfvbGNMTRcGfGMacF6vaJY9InH4
	pFmaXBDVwLlrd1qnXQOxQrv60lMdA0CCIpGD4ITqaYNHqyL9bRIdWCrmMt1qr+3yF5W1ukN7mWd
	exrTjfEGybYMWoP2p+esSXemyUD5HkkNNWWSZsAOlCu2k7Tz/JhrBsNEsMJcVhtcC3U/Ra1ky7Q
	zPsAaOyFZU2OOjKAs/7nLxh9/HJpL7Og4nr6ApEs/YhDUOZCO9AEGeqxCgdI1s+syTlDPbyo
X-Google-Smtp-Source: AGHT+IEAF5zZJc8SLBXvF6M/br0xjc9eqTI7I/rxemotIKCCVSxoKIddHDjM6IueW1kcBDvS+Q8Tkg==
X-Received: by 2002:a05:622a:19a9:b0:4a7:1402:3b1 with SMTP id d75a77b69052e-4a7fc9d42e0mr148114811cf.11.1751164403045;
        Sat, 28 Jun 2025 19:33:23 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e285sm374242985a.45.2025.06.28.19.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 19:33:22 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 23:32:55 -0300
Subject: [PATCH v2 3/3] platform/x86: think-lmi: Fix sysfs group cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v2-3-c530e1c959d7@gmail.com>
References: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5203; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=FaQPTkm6B0uaTh4SF38aYxONyNRJUBKGoYUMqX8jP8I=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkJS1/LTZvH8DVWXljtf8r5ku9/3xhXBv24/e/cVOlVL
 0sqDst2dZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBE9NoYGSYnLZhVMq9xlZOp
 2aaFSRNvF0t5hezt1H+/QGmyofX58GZGhmVXu+QeX93L9267X0TrK5nvu98a8kyzu6rtmOXV0/3
 qOBsA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Many error paths in tlmi_sysfs_init() lead to sysfs groups being removed
when they were not even created.

Fix this by letting the kobject core manage these groups through their
kobj_type's defult_groups.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 43 +++------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 200e58f130f8874b929ceb0d98bf4daea77740c8..d57fc456c12315361ca451d1d914826205960ab4 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -975,6 +975,7 @@ static const struct attribute_group auth_attr_group = {
 	.is_visible = auth_attr_is_visible,
 	.attrs = auth_attrs,
 };
+__ATTRIBUTE_GROUPS(auth_attr);
 
 /* ---- Attributes sysfs --------------------------------------------------------- */
 static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -1190,6 +1191,7 @@ static const struct attribute_group tlmi_attr_group = {
 	.is_visible = attr_is_visible,
 	.attrs = tlmi_attrs,
 };
+__ATTRIBUTE_GROUPS(tlmi_attr);
 
 static void tlmi_attr_setting_release(struct kobject *kobj)
 {
@@ -1209,11 +1211,13 @@ static void tlmi_pwd_setting_release(struct kobject *kobj)
 static const struct kobj_type tlmi_attr_setting_ktype = {
 	.release        = &tlmi_attr_setting_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = tlmi_attr_groups,
 };
 
 static const struct kobj_type tlmi_pwd_setting_ktype = {
 	.release        = &tlmi_pwd_setting_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = auth_attr_groups,
 };
 
 static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -1383,14 +1387,8 @@ static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
 static void tlmi_release_attr(void)
 {
 	struct kobject *pos, *n;
-	int i;
 
 	/* Attribute structures */
-	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
-		if (tlmi_priv.setting[i]) {
-			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
-		}
-	}
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &save_settings.attr);
 
@@ -1407,15 +1405,6 @@ static void tlmi_release_attr(void)
 	kfree(tlmi_priv.pwd_admin->save_signature);
 
 	/* Authentication structures */
-	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
-	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
-
-	if (tlmi_priv.opcode_support) {
-		sysfs_remove_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
-		sysfs_remove_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
-		sysfs_remove_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
-	}
-
 	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry)
 		kobject_put(pos);
 
@@ -1486,10 +1475,6 @@ static int tlmi_sysfs_init(void)
 					   NULL, "%s", tlmi_priv.setting[i]->display_name);
 		if (ret)
 			goto fail_create_attr;
-
-		ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
-		if (ret)
-			goto fail_create_attr;
 	}
 
 	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
@@ -1513,20 +1498,12 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
-	ret = sysfs_create_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
-	if (ret)
-		goto fail_create_attr;
-
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
 				   NULL, "%s", "Power-on");
 	if (ret)
 		goto fail_create_attr;
 
-	ret = sysfs_create_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
-	if (ret)
-		goto fail_create_attr;
-
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
@@ -1534,29 +1511,17 @@ static int tlmi_sysfs_init(void)
 		if (ret)
 			goto fail_create_attr;
 
-		ret = sysfs_create_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
-		if (ret)
-			goto fail_create_attr;
-
 		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
 					   NULL, "%s", "HDD");
 		if (ret)
 			goto fail_create_attr;
 
-		ret = sysfs_create_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
-		if (ret)
-			goto fail_create_attr;
-
 		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
 					   NULL, "%s", "NVMe");
 		if (ret)
 			goto fail_create_attr;
-
-		ret = sysfs_create_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
-		if (ret)
-			goto fail_create_attr;
 	}
 
 	return ret;

-- 
2.50.0

