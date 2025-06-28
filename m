Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E10220694;
	Sat, 28 Jun 2025 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086886; cv=none; b=YLAdE47qe0zkyEbpDRWNa8pnFloRzdfWiZdpGJuh1hpOgMLU+FuhlcxLddQMkd2aNGqqVd1vNBgTPWnVLWw6e4WZKkNxAyIcebhNwFuc2RSOI0NYLsjSe4J3xVLIyqxIchIW8I0pWvckfhi7Q95EeHr12dHrpXspvdOB1IcgFDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086886; c=relaxed/simple;
	bh=xwIOPQzp0CO3CmXlsDJnb/CIg4qQWC9AW3Q9DCnl/l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q93bKSYGHJWu0tlAZ98NAWJbRk4rOe90La0u0s20uZhAAfyCjIaw0gksE+GJskQxy75D/ANsC9CcWpoH2VuJ6OxqxaNYCkk+ksMtFH6mboeH5nfNwR4KzWwJ6n4hwrL50WCDXluD+zB8J0/WnH61qVlmyWeyekktCZa1XbKSYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NglNz79k; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NglNz79k"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fabe9446a0so29436886d6.2;
        Fri, 27 Jun 2025 22:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086883; x=1751691683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUvrkQsWXj+PLipOZYg/AMH/QOdAbiTxRFe5XCl9bn8=;
        b=NglNz79k1IyvggEzWt7Eyelx2S/p2BbAX6oTXk/v96kIyK3OGoL2Cpjs0No1PupTAR
         W7piVZQ0pOml+VhSNGJl544PuRs95DFsrZRBR4FIz5mzk48AnTSP4t/n6hgIraet3xoL
         kSPD0IizNkf7Ioz9eSUDzTM3bMjgHnbWHiosaBqI5ipogOQW3Lgm/Q2rlQ6FNBstmrtq
         M58SohYq/vEGyPT+ZMkuhnGKtrDR7TNnUBrDOXrqTzsWi5wULLXRHizxM+dUC3R1NIWL
         pZ3L47SegulhRsB5uCu7RS+w1G9CJYU4A5Gv7jOmrZQzNerozSmB0I/TtgLrw75aANR4
         6rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086883; x=1751691683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUvrkQsWXj+PLipOZYg/AMH/QOdAbiTxRFe5XCl9bn8=;
        b=YJWmq4HtRF+1wqVyFMUcwRUn6Effi1FiV6NAbFx1hW0SFJo7AwokNPUWd8mdmxrcaC
         qrd/B01+6WdC9PdELqv15unri+aC3oze96pmcv79QkT/m8FuDGaozUOW0TZH1vFCLMGB
         lIcUFC1jDA8w0loNULNaaqCe6ftXH5WNsUMfqI/3u5qybNDSlnKEEYMMBOLOlZy6X90R
         XYg1TEYp8jA1YM9udb5HP2mQ1yqkjsu82MrliVkeUfkCE/Q51X5BLprCrfgJBcB+hg5r
         ZQQy7kVJg6m6obOaAlMhANqy37+U5zxNfo6ZpfDYrHHjFLKoKjzBmEnFRrFWYouw1uYO
         UfWw==
X-Forwarded-Encrypted: i=1; AJvYcCWbm2Gb1Fsz9gZGa1/YbdZBFWWYER7PxNrAb9HHqdSw0fevwDotis46FfqL9vLIwexv/5dsOd43GGk44k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzauGUy5CYN0bngHcnUNBWQcDMjdvUBeWDoH50oKyywWMfPCAUv
	+I+HQ7iBW6obqoySfReiW+pJJe/0FdN5MWSFg9Rr/f/rF8Wbz/TmurB5es/cUbEy
X-Gm-Gg: ASbGnctEUxr6T18qsJrIsN0YUiakS/V56Qtc0rVZ0mdii8x+MDAuP5ll+rfTxtJVNLU
	hE0jyjtmi/gzDQgdcKWlSEgQy5Dt52f2btjeLywxERVbrVnMRUnOGQabdxxx/U3kFwdt38wDDPl
	daFZcNPVAJ4iP654/xIJsQzLiwPAxJZjClM1ehBLj776jmxqsCFOvHVDVj4n3CVm/5wEmJvozjm
	mjh70cB7NMgKjfxzXPSnyzMrusB9uZ0tTqVYbWyunk59CUWT007TDQX7bF5AKsFTR3l4jyKr5bJ
	yU4fFJMyzz0xTLImUdrzsEXSZbZFHPewcQO6iao8z8wm0ZLKqS03CjAhwr2NTQ==
X-Google-Smtp-Source: AGHT+IHlfgEq66Ajo2smNviFqc07tlhE097H/PMai94CvRwZW0HOuBMjBw4QWm/IonglatgCc1GibA==
X-Received: by 2002:a05:6214:260b:b0:6f5:4214:774a with SMTP id 6a1803df08f44-70003c91593mr79847216d6.41.1751086883359;
        Fri, 27 Jun 2025 22:01:23 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e34besm31504966d6.75.2025.06.27.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:01:23 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 28 Jun 2025 02:00:48 -0300
Subject: [PATCH 3/3] platform/x86: think-lmi: Fix sysfs group cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-lmi-fix-v1-3-c6eec9aa3ca7@gmail.com>
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5169; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=xwIOPQzp0CO3CmXlsDJnb/CIg4qQWC9AW3Q9DCnl/l0=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnx5VI/LugtfSC8aWt1+OElT57FtMnGXvuSG/Ex6eP2p
 1bzd7KldpSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBE1sxkZGiwcluSOW2iu+uT
 7Y6ZWk98+g3PHbz5NMTm0BOjDxNyBVkYGTbzWsTsOCg7Pd3MaXbC3f8tbeHS5TPWGEX6lOvwbLo
 Tww8A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Many error paths in tlmi_sysfs_init() lead to sysfs groups being removed
when they were not even created.

Fix this by letting the kobject core manage these groups through their
kobj_type's defult_groups.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 43 +++------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index da3568727d79832f4669d7217e2fdf691acf1cf5..a38262295abad9f97f67208dc9e3f4f4c6b27b32 100644
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
 
@@ -1409,15 +1407,6 @@ static void tlmi_release_attr(void)
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
 	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry) {
 		kobject_del(pos);
 		kobject_put(pos);
@@ -1490,10 +1479,6 @@ static int tlmi_sysfs_init(void)
 					   NULL, "%s", tlmi_priv.setting[i]->display_name);
 		if (ret)
 			goto fail_create_attr;
-
-		ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
-		if (ret)
-			goto fail_create_attr;
 	}
 
 	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
@@ -1517,20 +1502,12 @@ static int tlmi_sysfs_init(void)
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
@@ -1538,29 +1515,17 @@ static int tlmi_sysfs_init(void)
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

