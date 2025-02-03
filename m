Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353A1E7C2F;
	Mon,  3 Feb 2025 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563786; cv=none; b=CU3UgqvCPS27bqLyszoAiuWP7k0YlNrONgJDWjBbT3FYNSdMrOmoAgIoYWwrJKwc5l7QFIky2G01FN6vwiTK5JG83rY+oK0oO2D2Xbu3nLz2HT6ARt8CQTuru1kCU4xu1lC3ebKJWolSPntoytPgndPKOvQfq647pZhOVA2sC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563786; c=relaxed/simple;
	bh=Vkmcshd6+Pw+U4Vhd8zkxfSSwfZ6jB9Ub0mpkQ5gusI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khjU2mOQfAWrH5fpCZkTdmVuCMLocB0i7YghW74jytMfZdzQvTN2a2PaJ85VMw/U86sayHN7+lH1O48SjayJCImzGHimYGFYfOCSo7AqBhKM7Tf1mTj2YplZV6uBZ05nl00IuOjPbLPKqIYnxiA5RsSt2dlugzjTqPA2VghYQwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvYOrosY; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvYOrosY"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51873bc7377so1371887e0c.1;
        Sun, 02 Feb 2025 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563783; x=1739168583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbkHrV/xDeNjrQkI7TvjOH1o/Jz2Ncph7yGYZeBkeJM=;
        b=dvYOrosYlE0srQrczCc+M8wuPCKcCcu2Ub43iL2EoWsVl5WQqOq57BSPd6d8Wouwpz
         kM0rzO3yp7KqfrDm6CpOXgtEd/7V1w+Igsg6Jx89qwngKbRREg79Arrv6IKgqN4mqVdG
         lsOqwLydiEoltEQPJ1fFD//NdpZa9oyh0gmzkpHeObqcYc47DIexgwLfB56fWYV5WE20
         g3VFNhv6OKSVpLzVMaF1dm/wKkcjhQMsrT7t2FmnDTJSSih0MItYqfgsO+y3K4TaxRB7
         dhgQvNuMOOBFQGtZ07cP8woRCo0QzzPjYjMemvpd3XDv31Ik9bjQcQ3KRg8yMFAVdmnv
         lOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563783; x=1739168583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbkHrV/xDeNjrQkI7TvjOH1o/Jz2Ncph7yGYZeBkeJM=;
        b=PyqdHaLRnEu7grXXUK8lo2eNc3DF8gTPZ9gOKSXzo5EniMeJyEKP+bynh9AoG1IJpK
         k6O69ToCBnwrbe9m9xbBvhF2v1plE73KzLdy55OnZFmDVqZ1jpbQfsb1eQI4fdexrOV3
         FMlbXoIa/TxX2t9+2lFl6UhCXN9lqvF/zHu1WureUtO0o+GXNy9tPeR7Nl9w8dBrWPdu
         8xvEKj1LkRk7vdMODo2heZaYGUiBYxyQpEWu+jJRzoSALrpQMKAqLPQB7l6EvRhWcciy
         cJIRZjxj+DeNfJM4dkoVauSdj/gi6J7Np01vlFk9Rg/bgiQ3yOQK+WfzQBN8GlkaQaie
         CmCg==
X-Forwarded-Encrypted: i=1; AJvYcCXrFlMaSP3n3Gt4Hj2d1ZSV5+xZU/M8gcJ4XYYnPIGcb4+Kcqzvr8ESEFWM+iGeGgg67ETN1BgTOkbO0t4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkabK+oiIGwwWik/WxONahx4V/IP6CJtO/G4gvuHUgW9IaJFF
	XGBYOC8qCj4LSXG2Mz+hup4yYNu4swAZpIRbwaZxhlz8/JfnOQwVKciw7A==
X-Gm-Gg: ASbGncvnCHI6mJynfChae9XfCYC65qAdxgX56aycZUHC6q5SUG+2vzjwkDOgl3W2VZd
	J3tWv6FmlpfvspA9IPGDzlccgDHYNeEXg5xvJSMJWcUUPLCQ5c+dxapPA6yirlkhvtA6QfiUODV
	yag1Ch3+pbTrsKALQ64JgoE8fdx9WdICkKbMrQErRinL2Yf6bkShgsiMBpkfHrfFuwBDkdFGfic
	UQrf93aPEYzjS4V0lGpTmX8DNsCf+IapGpj4YmJcwqceLfbMBsQfOo7cGqSkFIonYUvW6fOSN0f
	Fvr1Ee+QLEN4YUTXCwH9Q3c=
X-Google-Smtp-Source: AGHT+IF7MtOA/2kYPLJrhIRnzfVQiMNzZM0nFl/SU0j9HQ9O7a0yXUr2IOiDEScY72WuJOWpOcP6rA==
X-Received: by 2002:a05:6122:2108:b0:518:865e:d177 with SMTP id 71dfb90a1353d-51e9e4303c2mr14847792e0c.9.1738563782791;
        Sun, 02 Feb 2025 22:23:02 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:01 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 05/14] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Mon,  3 Feb 2025 01:20:46 -0500
Message-ID: <20250203062055.2915-6-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
use alienware_wmi_command() instead of alienware_wmax_command() which
uses deprecated WMI methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 80 +++++++++++++----------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index b069c5c585be..a219d68ff84e 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -711,53 +711,57 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
 static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
 static ssize_t source_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_STATUS, &out_data);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
 
-	if (ACPI_SUCCESS(status)) {
+	if (!ret) {
 		if (out_data == 1)
 			return sysfs_emit(buf, "[input] gpu unknown\n");
 		else if (out_data == 2)
 			return sysfs_emit(buf, "input [gpu] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
+
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
 	return sysfs_emit(buf, "input gpu [unknown]\n");
 }
 
 static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
 
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
@@ -767,12 +771,12 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_HDMI_SOURCE, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
-		       status);
 	return count;
 }
 
@@ -805,22 +809,24 @@ static const struct attribute_group hdmi_attribute_group = {
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[unconnected] connected unknown\n");
 		else if (out_data == 1)
 			return sysfs_emit(buf, "unconnected [connected] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
 	return sysfs_emit(buf, "unconnected connected [unknown]\n");
 }
 
@@ -850,15 +856,17 @@ static const struct attribute_group amplifier_attribute_group = {
 static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
 		else if (out_data == 1)
@@ -866,15 +874,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
 		else if (out_data == 2)
 			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
 	}
-	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
+
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
 	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
 }
 
 static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
 {
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	struct wmax_basic_args args;
-	acpi_status status;
+	int ret;
 
 	if (strcmp(buf, "disabled\n") == 0)
 		args.arg = 0;
@@ -884,12 +894,12 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
 		args.arg = 2;
 	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
-			status);
 	return count;
 }
 
-- 
2.48.1

