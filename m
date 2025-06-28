Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CD1854;
	Sat, 28 Jun 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086884; cv=none; b=o1YiV31KY5vDk4BbnFVjrJtTR9MJBoOCwObdY2pGGOLCXzfrKP+M7i3wkH1JNEVEZG4B+9Qo7p4Ewnzb4wTb9AoYNkNq58OzvpYnPpvdxGmldHpMkqDRzTwsKuCS09gEiLsAz0FE6kEXozymCveXwTNpfNy8jMGFFRPf4nVq6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086884; c=relaxed/simple;
	bh=I/rWz8kdUcx1aXjVUl6mNjq06Z+nxm6Clw1x2jurgwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNHSDWT3mcyLwprKuiUBE7hgv4hOzLFt2u3JVbvcEeSr+wBHWCckEzdZbdQ8JwbuBaJ4HU04LEigEawAE3u1eTttNxa/u21faWOsDpHztgKx/nUJ3cCyjdAR9/rVvh39EZnyG+md2NByvXsCdsaDzd/7zIAbY1iRIb9djjWfpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFf89Cbd; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFf89Cbd"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fadb9a0325so4318976d6.2;
        Fri, 27 Jun 2025 22:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086881; x=1751691681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/5Kgexb9RXmRPI7iym6vR22zD7XYW22SybC1207JdU=;
        b=XFf89Cbd3KT1nKo6xvtEpXykxalEjNDFSy3ByyIAMM2i/CHB9kUH4PySAxTyziDFoT
         3r5RfnkJibmEkbtOtizWjuDaJczJ3tvviqVBBSqvb1Cw+u28lOdwM4KFPpMM153Tl6J8
         cEqOTh6KSe5x/0GUniFjJLKQm9vUTUKuKdjZsn408Okou3R2RvjAKGn8et6hdaHyHcHG
         MU8/HxIkJu5NR0YfGc5ED7sPs70d828ur/H0/smD99iYfSFLd8nrCy1vxP+pP0X7j5Aj
         g5gX31z3i6gdLGAobwVbBtR4BjOGw5tFU5Lp9A3f1YkN3M1oZVZKXBzioKG3dUXUuze4
         R+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086881; x=1751691681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/5Kgexb9RXmRPI7iym6vR22zD7XYW22SybC1207JdU=;
        b=c4bNV9JhD11Loomt6NZVBGtxjg9torAnR37mQYqrghvp5sd05r7yG2KWWOzHJzEWCQ
         DdtMNamffAFNl1iSymvs6GspjSE+EfScSCLnokJDW6rvbEinhK3t27cRoVb0hrQt/q8I
         QLKO/9jLEIl411VSL6JczEyy/3cVkBluLbOB93Bddtv1O8s+fefamn5jKDG0F/jJeQ93
         zXbVWTQtMU9UQPPFa1gf66/cLS1MJpc3raRswh4JEmkgqDBOjtNt7Nf1SfIkNjqfJg9Z
         HYDDOM0lqHCPBPXpJpd2dee+U6BZyP/tO0u5qUgDm7/geksqwyOE1mM6Wb1CEV3g9ZeL
         zByQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOw00EPw/svvybsaZgAB+05UsoPs5sVtMhika/uVYhW11+SPZ7QnB3fiMPUIjiiV7VK285c7PygQxzyEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxzDgojWiuPLkEMyK92EwJKDr3pSHdK65I10qp1iGwjTaIxdT
	sSKQ3KgTc4CnOpwM19e3CPeje6aCfDHZA49GVh9Tpkwkxz+Deta7ZGdYZIBQ7TVx
X-Gm-Gg: ASbGncvIOEfLxhpJDCZkPSL+o6fLK2NmWdvX9ur+4P1dGv02XfStgdNCHP9CZAIlEns
	HDKxGk45BeukXX/lviJPRBJnL7tgrK+Npc8muL8f48R9pMhs7s3UGUBLgvgkucQDUQLJhyRSTJH
	cg3evoRb7mPpRpQgGQgnwrmlUfOD2aas3IbDcet+7t7VUSn+WrfpozPS/ZIrGYk6lbpXdrqspA4
	UCl0JZBEr9IAGPPa2CH/IirSx+KO0OQtJ7b7qlU2TP4XrsvtfoF+xRbS9krrdQ6yXeQLPXiTYIz
	Ys4dB1ACZjnu66/Fd76T1QybBkEzxzScC1vlLq1OrfbPHV/6bqytjmee8ssG2g==
X-Google-Smtp-Source: AGHT+IEq3ITQaVwO8eClbFveGCyCTqwvCl7bhnwgreCWQKLzEqGVcxKu8x1r2Ngh8p9WHp7kE0uX9g==
X-Received: by 2002:a05:6214:489:b0:6fb:1db:e9e7 with SMTP id 6a1803df08f44-70001d66606mr101820346d6.10.1751086881102;
        Fri, 27 Jun 2025 22:01:21 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e34besm31504966d6.75.2025.06.27.22.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:01:20 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 02:00:47 -0300
Subject: [PATCH 2/3] platform/x86: think-lmi: Fix kobject cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v1-2-c6eec9aa3ca7@gmail.com>
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5991; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=I/rWz8kdUcx1aXjVUl6mNjq06Z+nxm6Clw1x2jurgwQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnx5VIfY65NuG8pdOqw8AmX0pZjfznWbZNb0ix0ye/51
 7mHt26M7ChlYRDjYpAVU2RpT1j07VFU3lu/A6H3YeawMoEMYeDiFICJaG9j+Ke/6rruGtdtYjVf
 txZk7PWpfLMzsdPwk97f5VqVx0P2689mZNicxfD/6uLtc7VXS/7469wVzX9nytlJM4/evu8jvIY
 3LYoPAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Cleanup of allocated kobjects has many flaws.

In tlmi_analyze(), allocated structs with an embedded kobject are freed
in error paths after the they were already initialized.

In tlmi_release_attr(), which is called in tlmi_sysfs_init() error paths
and in module exit, kobject_del() is never called. This, between other
things, leaks the reference of the parent kobject, which is a kset in
this case.

Fix this flaws simultaneously, first by avoiding the initialization of
kobjects in tlmi_analyze() and then by correctly cleaning them up in
tlmi_release_attr() using their kset's kobject list.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 39 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index b3e7d76cccf7840a5bcf7f849f2a70e164cb7086..da3568727d79832f4669d7217e2fdf691acf1cf5 100644
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
@@ -1397,6 +1397,11 @@ static void tlmi_release_attr(void)
 	if (tlmi_priv.can_debug_cmd && debug_support)
 		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
 
+	list_for_each_entry_safe(pos, n, &tlmi_priv.attribute_kset->list, entry) {
+		kobject_del(pos);
+		kobject_put(pos);
+	}
+
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Free up any saved signatures */
@@ -1405,17 +1410,17 @@ static void tlmi_release_attr(void)
 
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
+	}
+
+	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry) {
+		kobject_del(pos);
+		kobject_put(pos);
 	}
 
 	kset_unregister(tlmi_priv.authentication_kset);
@@ -1481,8 +1486,8 @@ static int tlmi_sysfs_init(void)
 
 		/* Build attribute */
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
-		ret = kobject_add(&tlmi_priv.setting[i]->kobj, NULL,
-				  "%s", tlmi_priv.setting[i]->display_name);
+		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
+					   NULL, "%s", tlmi_priv.setting[i]->display_name);
 		if (ret)
 			goto fail_create_attr;
 
@@ -1507,7 +1512,8 @@ static int tlmi_sysfs_init(void)
 
 	/* Create authentication entries */
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_add(&tlmi_priv.pwd_admin->kobj, NULL, "%s", "Admin");
+	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Admin");
 	if (ret)
 		goto fail_create_attr;
 
@@ -1516,7 +1522,8 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "Power-on");
+	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Power-on");
 	if (ret)
 		goto fail_create_attr;
 
@@ -1526,7 +1533,8 @@ static int tlmi_sysfs_init(void)
 
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_system->kobj, NULL, "%s", "System");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "System");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1535,7 +1543,8 @@ static int tlmi_sysfs_init(void)
 			goto fail_create_attr;
 
 		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_hdd->kobj, NULL, "%s", "HDD");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "HDD");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1544,7 +1553,8 @@ static int tlmi_sysfs_init(void)
 			goto fail_create_attr;
 
 		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
-		ret = kobject_add(&tlmi_priv.pwd_nvme->kobj, NULL, "%s", "NVMe");
+		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
+					   NULL, "%s", "NVMe");
 		if (ret)
 			goto fail_create_attr;
 
@@ -1581,8 +1591,6 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
 	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
 	new_pwd->index = 0;
 
-	kobject_init(&new_pwd->kobj, &tlmi_pwd_setting_ktype);
-
 	return new_pwd;
 }
 
@@ -1687,7 +1695,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		if (setting->possible_values)
 			strreplace(setting->possible_values, ',', ';');
 
-		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
 		kfree(item);
 	}

-- 
2.50.0

