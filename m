Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D22BB04;
	Sun, 29 Jun 2025 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222051; cv=none; b=HGTTyrTCZOVm8A2mr3XNMTPWOvrHBYQHRKtUU5+q2FVHs3EatEOiO1lhuw/dNfyFUoVlWHv9Q7DYOo9UVVEeNCl7csv7+XKEdZSYTgou6SjLRixFstp7hQic6Znli9a19LKn6MGJtc1fgVcjoQleGYaVzGQ4uQ6KR6takqxNI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222051; c=relaxed/simple;
	bh=jrVu989F/TnS7OrvrDa2n6Iw2dhmPQwnlx/AVue9EDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wx6qGzR5mCXG8UFhoFKm58DEex/X8Z0akriqo4yIVoBsSGA1AMytWMol0tjuqx73cGfgqDPDX8ZEkNMCdl8aiV1WbgZ80xgjO9biAm7q0Wzx14rVuQNz5iXWe26sIuvfcQ+yuW2u7EkAP8u7mTN5phzBX2v4vG4wJ2V7R8fIUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/Dx0YNP; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/Dx0YNP"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d098f7bd77so434767385a.0;
        Sun, 29 Jun 2025 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751222048; x=1751826848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/cjhqCcLmVGUCnBK893/yp/jMoU9tIeu5L0LyrcK/Y=;
        b=R/Dx0YNPouZNfhDDmQgu0sLdkr9zAaPSAQhQE0k4Vd+3eyshwNhzg3LoQYTDsPNh9i
         N9yfZ5O+n2VGuDewsh2H7RZU3LXk8q7HWulRp2MKUOx4Px5Hw2l63bUZl5KXXRLBXwku
         zxvUknydw4qfF+NRNwxCn9vKrUFB0oxNq8+n/ENyRFyQXXw5oaw0Sid78HmMBBvNcVgx
         PzL1gz4cd3NJqnO5YGbeF5pxdb4+6/GoeD1dXDkeiEONvC9qj3aNjcCSul35pH6kXh6Q
         jUvxAsWno1BNaZ5g8gESZVcx1atwbvvRzfRRCDJEsj9AjnlcX07pVFvnuUAQcoK+Xh4G
         OMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751222048; x=1751826848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/cjhqCcLmVGUCnBK893/yp/jMoU9tIeu5L0LyrcK/Y=;
        b=aJbTzPllVYjJreoJb357B/aHfSyqBE6pVgW7j1uGPZCX8hmpcgX6IOv/dFui5B+ldb
         Ai06vUpoGZVknLdGpGOyrzhRSFAPntxk5oo3yxB9SwKZMT29go5ZxHRUgzjt6wh2gKxz
         AEY28D/yERlQptHdCYoLSeiM5zfrImGKy1kjG+Iqp09iXN46Sk/MZx+1QA1XN3W4EOMn
         zfKxP7YhoSSfSOmOXiMBW44QW7BAfiLkxAiTttnRU7N+BBohE7Jr4Cpzh0KYvLxsN7qT
         YHisex69PsHOTcpYe3k83iYpaI4rof1TsS4PmUoRNx1EqNmJ/JeJqh9XhXQkZjjYmSt3
         PUxA==
X-Forwarded-Encrypted: i=1; AJvYcCUpgvhrb+rhGlTN43houb95GnyRo5gprO6IdM2eB81bGHYrkwThKK39VLA80CzUyTHSXLx1o/zTPrizfHM=@vger.kernel.org, AJvYcCW3ZXVlr+HRspTHkd+OH0SjHpHCYltEHrCkO9eoJXtuU7dgCnJUYDM3rxFgrfp+p8TafrcrMlcFelePVxV/y8MJihCAPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTZCmbE52WSFJTo4G+MApdnbOq7po5ZMhw4HFOk2Vdg2OAMqm
	OsJqLDuYDLbT1zoI9i0nvhRq6Xw5edqO8zWGZXnKFD12SIrzW38XqSSV
X-Gm-Gg: ASbGncu2DDUd5ftaIforCc+pvBdU3lLccc6676MTSn0DJyaTpwffhFlgavNo4ry8wKI
	vn28nS4Neah1dDOv9GWN3P7Xl2hs31emcZBAT6OAkPDEQhkZoj1Bn3kXUmn9d2vPk0a7A1d9QhJ
	y8MsC0vu9kKGR4AYAdRAB/EtpzR76riLmGiTHLmHbCGX11Yepym7YqU6X9Om7m7I6YZEh13aNga
	KnfE4jX2bU70qk5O7Ll3jInF2Vq5Q7Z/EJf9jHrhXxCR8vBWQhVQs6r3BWc6igsTSX16MILa9u+
	1eAa/C+UhiFYziNKbHOvrEZekOYVZ0i4jmzrTxUFYhBql/HFuR+lzPZ9ZQ3rxA==
X-Google-Smtp-Source: AGHT+IFBfZq6IZw9PCCTfeTzHkfLxpaDY1FwR4g7fewr0TAosZVqbGHcnXQpg6iurWSq3PxHo6uEuw==
X-Received: by 2002:a05:620a:4149:b0:7c0:af6d:a52a with SMTP id af79cd13be357-7d4441a75a0mr1307645585a.26.1751222048100;
        Sun, 29 Jun 2025 11:34:08 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4594acf00sm95196385a.31.2025.06.29.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:34:07 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 29 Jun 2025 15:33:04 -0300
Subject: [PATCH] platform/x86: dell-wmi-sysman: Fix WMI data block
 retrieval in sysfs callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-sysman-fix-v1-1-fce0000a781d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN+GYWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNL3eLK4tzEPN20zApdy2RTI/NEI4s0w5QUJaCGgqJUoDDYsOjY2lo
 AiiKClVwAAAA=
X-Change-ID: 20250629-sysman-fix-9c527a28f1dd
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>, Armin Wolf <W_Armin@gmx.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jan Graczyk <jangraczyk@yahoo.ca>, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6574; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=jrVu989F/TnS7OrvrDa2n6Iw2dhmPQwnlx/AVue9EDk=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmJ7TJZXx8+n/bLWzLd2mBqnUlr6fMbjz/N15bv+7ti5
 UmXy1puHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRxiKGv1K5B5q2zUnSnVc/
 qf/19y9/DhowTV/w9MSHLg7euB1n57xj+F+tuJw77zZP8uvilNMGcx68No15fHm1XM4F0yn9Vz9
 6c/ACAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

After retrieving WMI data blocks in sysfs callbacks, check for the
validity of them before dereferencing their content.

Reported-by: Jan Graczyk <jangraczyk@yahoo.ca>
Closes: https://lore.kernel.org/r/CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com/
Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 7 +++++++
 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c    | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c     | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c  | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c             | 8 ++++----
 6 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 3ad33a094588c6a258786a02f952eaa6bf953234..792e7d865bfb1cfc13b59c90ddf7de47feff408f 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -89,6 +89,13 @@ extern struct wmi_sysman_priv wmi_priv;
 
 enum { ENUM, INT, STR, PO };
 
+enum {
+	ENUM_MIN_ELEMENTS	= 8,
+	INT_MIN_ELEMENTS	= 9,
+	STR_MIN_ELEMENTS	= 8,
+	PO_MIN_ELEMENTS		= 4,
+};
+
 enum {
 	ATTR_NAME,
 	DISPL_NAME_LANG_CODE,
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
index 8cc212c852668312096f756bc1fb1e3054a1f5c0..fc2f58b4cbc6eff863f2c3293cb4322d28048bb8 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
@@ -23,9 +23,10 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
 	obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID);
 	if (!obj)
 		return -EIO;
-	if (obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_STRING) {
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < ENUM_MIN_ELEMENTS ||
+	    obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_STRING) {
 		kfree(obj);
-		return -EINVAL;
+		return -EIO;
 	}
 	ret = snprintf(buf, PAGE_SIZE, "%s\n", obj->package.elements[CURRENT_VAL].string.pointer);
 	kfree(obj);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
index 951e75b538fad42509614c2ebf2ef77aa05b614f..73524806423914bf210b9b5f78c0b5b4f6a7984c 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
@@ -25,9 +25,10 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
 	obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
 	if (!obj)
 		return -EIO;
-	if (obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_INTEGER) {
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < INT_MIN_ELEMENTS ||
+	    obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_INTEGER) {
 		kfree(obj);
-		return -EINVAL;
+		return -EIO;
 	}
 	ret = snprintf(buf, PAGE_SIZE, "%lld\n", obj->package.elements[CURRENT_VAL].integer.value);
 	kfree(obj);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
index d8f1bf5e58a0f441cfd6c21f299c5426b2e28ce9..3167e06d416ede61cda5ad4c860dcb41b05cd5fa 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
@@ -26,9 +26,10 @@ static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr
 	obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID);
 	if (!obj)
 		return -EIO;
-	if (obj->package.elements[IS_PASS_SET].type != ACPI_TYPE_INTEGER) {
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < PO_MIN_ELEMENTS ||
+	    obj->package.elements[IS_PASS_SET].type != ACPI_TYPE_INTEGER) {
 		kfree(obj);
-		return -EINVAL;
+		return -EIO;
 	}
 	ret = snprintf(buf, PAGE_SIZE, "%lld\n", obj->package.elements[IS_PASS_SET].integer.value);
 	kfree(obj);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
index c392f0ecf8b55ba722246d67ba0073772a4f0094..0d2c74f8d1aad7843effcd7b600dd42e6947dc15 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
@@ -25,9 +25,10 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
 	obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID);
 	if (!obj)
 		return -EIO;
-	if (obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_STRING) {
+	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count < STR_MIN_ELEMENTS ||
+	    obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_STRING) {
 		kfree(obj);
-		return -EINVAL;
+		return -EIO;
 	}
 	ret = snprintf(buf, PAGE_SIZE, "%s\n", obj->package.elements[CURRENT_VAL].string.pointer);
 	kfree(obj);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index d00389b860e4ea0655c740c78bc3751f323b6370..3c74d5e8350a413a55739ca5e9647be30bac50d4 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -407,10 +407,10 @@ static int init_bios_attributes(int attr_type, const char *guid)
 		return retval;
 
 	switch (attr_type) {
-	case ENUM:	min_elements = 8;	break;
-	case INT:	min_elements = 9;	break;
-	case STR:	min_elements = 8;	break;
-	case PO:	min_elements = 4;	break;
+	case ENUM:	min_elements = ENUM_MIN_ELEMENTS;	break;
+	case INT:	min_elements = INT_MIN_ELEMENTS;	break;
+	case STR:	min_elements = STR_MIN_ELEMENTS;	break;
+	case PO:	min_elements = PO_MIN_ELEMENTS;		break;
 	default:
 		pr_err("Error: Unknown attr_type: %d\n", attr_type);
 		return -EINVAL;

---
base-commit: 173bbec6693f3f3f00dac144f3aa0cd62fb60d33
change-id: 20250629-sysman-fix-9c527a28f1dd
-- 
 ~ Kurt

