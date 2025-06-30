Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89A79D2;
	Mon, 30 Jun 2025 03:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255016; cv=none; b=eOcZKVDf7emrqNaf5UQaVGmP/puN15X0anbusjsxNQUPMmvAhfrGwN6jrP5FmxkvDyD+9APOUBH+6COZfCwfBRaJztK0R2xeHBmDXQLWCqsyqJyVIvxcT9abeYUCFgT1Ry/mqV/lCkW4iT/IwlR1rHHSq7SwPVzLLjKfuAta5p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255016; c=relaxed/simple;
	bh=aU3OF31XlKW7ZgsMb4VMmMEeuzG+p6hYnD7yS+wO6lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VUIS8J510b6XK8eT6QMGNrTXfP2TgpiBmV5V6jlVmT0PwxIZrOShg9rdwrbabwdJy7i85HzI4n01fcSDFU6TIRAXWEZM6WItqgDsk916FINcTNkXJuhCLkOn4I6lWh9wP5e4y/wn80aYqbaIaf7mN5yaVB4FLG8bEomJmmeAIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoNL6D9K; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoNL6D9K"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso1396620b3a.2;
        Sun, 29 Jun 2025 20:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751255014; x=1751859814; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bIwAhKqz4a8STFhK376kouBXKdmYNJTk3lqAL+u3CE=;
        b=hoNL6D9KxUm43LXck/9gI+7UqlrDjw0BasiMQWzC2Rg0sT1TZ36FVUogaVMWG/BCrV
         K/nLajxjkHixkB4mSqKLrCEJcfSCzykVw9LAVrLz6O9uV7UMe4ncQ8FgTYbCxlxT94qS
         9XSEY0u4+MvKeYViVrNwWP3H3pk5XoW7PB+csUtn4Eqdra8O0os1kksECkJNnV46lTYg
         ZsBUk2vX07HYHAGImriof5WCODD4eijRgAg705gD7GoRMyIYhPsQJyGtnYK3sAGquRqj
         Rp7PGhbkxgQSRgvdQcEI/WgV51Jod02u/edRy2xKsQ5VBSen2PAvcPozb6F0wb8O5Tgh
         XMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255014; x=1751859814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bIwAhKqz4a8STFhK376kouBXKdmYNJTk3lqAL+u3CE=;
        b=iRC625ynSoYQlPXXEKRvScDzrFdsygljxWY/ROUFTvml7W/0h30pioBuTnF5amf16m
         YaNzen8NsAVz/YvVrwMjRbsLJpAj4w8umxMe6rrkIy52zh/Qm/6Bnmn4X8CgqSqpOiVM
         2txxv1QxXTWV0UAxcXTklC4whottA6IO9f+VhirkW4k4muIw37vXTvNxgOndi7c8yugS
         0i/AdNOXmqjVp9UHlVVGFppf29SnRA43WKGmF5bMv8ApYtOH7E6/Aw65gp+X9iBf70nH
         0CXwir1CPJUDcMRs6O0XTA8TY97x8b8JN1r+p1PH7CJrgt8EKixTSFvCYwdVM7l5lO92
         UnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV73EpanumDqiIW0J7xqowfLA7wiW9N9lJB1G8jhCApPHFvDmh1O5+wVjRNQUf1vIz2QPsm0VL+iUDx3rkY/SBHr+oKIA==@vger.kernel.org, AJvYcCWkK6NTOjH8tZ3Loc2xZYgBZbPlpRFtsjBOQRCXWqSDaC1rKxaDU2Gt8BzxQWUhHyUY7PWKKRvWrzSGiyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxSYJyjsuTjqoqDlzFVgvCEZu5nrqyJID4jJJJcS1vqF8cWpRv
	krmCX5qfmgfaO+nVsGfI4TZL49HpxQnXWZrKlus7Ig4uKrvmGHjrOvnH0xWTWtaj
X-Gm-Gg: ASbGncuXbYHlMM87nJa4DrapS7LWG8BzizXHKclenKgkwUA69rOp/3xEGNLEtKGlO4G
	9RKX1hsS1HTFaTIKmEqO23ncKRZLI3ibF+npIyg3v9LNGoO3CSA4UjG02Ew0Mn4O8vpOIo32tKc
	IddO6J8qQKSKlY5D6X6CaXiPBidSVKKtLvsTV5f7CgQVsGlmn3JPebWz9T1U0UORVyzBuLoYdFY
	GluylYPHoJuo8nMDBBnViduFs6qT+vVMhJfJqNoBfWeaWGE1QCu7CTWHRidb4jO6CVa8101OGr2
	VubzHydtRtKGfWLJGDTR9FXWdj509bZyfLv2XHFgD4I8h/bYVUZSfCe1I9EnLg==
X-Google-Smtp-Source: AGHT+IFcg8jm6RxZyyIgmlhNKPBdDB85x+e1UBI38fidb/l3jtKUX/r5MGvW+cZ5adQpsDO/pb+L0g==
X-Received: by 2002:a05:6a00:b87:b0:74a:e29c:2879 with SMTP id d2e1a72fcca58-74af6f79036mr15052578b3a.15.1751255013553;
        Sun, 29 Jun 2025 20:43:33 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5579d37sm7464187b3a.81.2025.06.29.20.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:43:33 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 00:43:12 -0300
Subject: [PATCH v2] platform/x86: dell-wmi-sysman: Fix WMI data block
 retrieval in sysfs callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-sysman-fix-v2-1-d185674d0a30@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM8HYmgC/22MywqDMBBFf0Vm3ZRkwKpd9T+Ki5CHDjRJSSRUJ
 P/eqeve3TlwzwHFZXIF7t0B2VUqlCIDXjowq46LE2SZASX28oaTKHsJOgpPHzGZHgeNo1fWAh/
 e2bE+Y8+ZeaWypbyf7ap+9m+mKqGEN07y9DAq+1iCptfVpABza+0LSUetXqQAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6784; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=aU3OF31XlKW7ZgsMb4VMmMEeuzG+p6hYnD7yS+wO6lk=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJ7HfurliSrBb97IHFxMYT2QpMPeuXvNI6vGD5ErunE
 qt3/Vnu3lHKwiDGxSArpsjSnrDo26OovLd+B0Lvw8xhZQIZwsDFKQATmW7C8D8spPRdUuemhwvv
 nhBki36UdmbXje9fnpcrZ2n8bvpufuoawz+1YKeo0sV+6fHvL+QW1E86soJF80gSG8cEp3OmnAV
 ik1gB
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

After retrieving WMI data blocks in sysfs callbacks, check for the
validity of them before dereferencing their content.

Reported-by: Jan Graczyk <jangraczyk@yahoo.ca>
Closes: https://lore.kernel.org/r/CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com/
Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Changes in v2:
- Use #define instead of enum to name minimum values
- Link to v1: https://lore.kernel.org/r/20250629-sysman-fix-v1-1-fce0000a781d@gmail.com
---
 drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 5 +++++
 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c    | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c     | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c  | 5 +++--
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c             | 8 ++++----
 6 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 3ad33a094588c6a258786a02f952eaa6bf953234..817ee7ba07ca08cfe286d8ff5a6f864991c6522d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -89,6 +89,11 @@ extern struct wmi_sysman_priv wmi_priv;
 
 enum { ENUM, INT, STR, PO };
 
+#define ENUM_MIN_ELEMENTS		8
+#define INT_MIN_ELEMENTS		9
+#define STR_MIN_ELEMENTS		8
+#define PO_MIN_ELEMENTS			4
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

