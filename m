Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC522500D3;
	Fri,  7 Feb 2025 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943221; cv=none; b=T9fo84ezq3n4iB47QM9mrQf1WN+UVobERGFnHiQ1vaAr0cTSGEmK2MVFUppZ0zGFFGPxSqhcIiG3hBP0YFAbYDn3VqRyzj9AGerpgWF2cT2cb8G6svqX6n4PP2/DSofuGMINuYTm9h7dQ0ErvEnKQF7kUCFVU4fmv3jkBIfxmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943221; c=relaxed/simple;
	bh=TpImHDyw13v88DYqCWjn7O634fBAq+Jz7uz+a4wm1hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+TzQcUcTt18K23bGjP1pc1CuE4AcdPJ078J0VdL876ferMsDf3bvqpK1UguOiC71eptwM8Uba1glUnlmDcdBlcTecxFoQlkzH2b3PLZxejAg21S3IjXWc53it7QJqKqdwlN/nuVaM5zEzl24Jd9LIkKAskNmMhTRHI/XqiEFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjiMbKIm; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjiMbKIm"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4ba7d79cb57so460614137.2;
        Fri, 07 Feb 2025 07:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943218; x=1739548018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT5BPDOOXltaw9HQr5o8Si+JPli8HqWhNbfpXgv/A8c=;
        b=kjiMbKImvA+sOpGGRPrYEVtNMK3fAXcJSGUf4LKWOeEhzvyU9qYrCBuL/76sr+6BCP
         uePzZb5f40ERREhvTRVJYMq5tnTTxwW6AbclonlrNWE8o+z3hTnWdrWb5U/+le4LaZ2V
         iygEZ0FPs1a19X8JIUp1FuhCkQtRUTyG/JS+MiJQOLKNfpln1f7BDRgmky/lmllva6ZE
         c/N669rMhjLw9uoyP8dQvh8lzSkQA8Sxpdn6rvfJaoBFvp2HB1w3a01SAaAOPt2mu8+v
         cRAYmvWnLUUWaLC++cmPw5AAeMiMz61/aGUsTbtUe4S15Io40RI85h/ciKKuqXQt/fX/
         i5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943218; x=1739548018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT5BPDOOXltaw9HQr5o8Si+JPli8HqWhNbfpXgv/A8c=;
        b=W7tPHcWbdW8CysBKVH/iEKAeH40aWeXMiroqwGrnTRVxtosvAR3oEhnem9MSbhjoFo
         ma0+FNdlLbEyuUlIsD6f3mDsJ+cgBl6xNZKVarK4FUuSFk7qj/ik2EIfmQUT12g+v+nj
         r0ZcBF6+UnhG9OSXULPPBAwMpau42X8oMMTLlz7TF5f/eQON5um3ohaiPy17EdSdTvvZ
         /wVdtUmKQ5ohrkHAqV2ZANYzxDoCpHU6gsgdDXUucVNnBJNWcohnngcXsrzD0UoXmPS/
         iwhl3gVJ5MrPOsGF5HUENbJ0Mx6EwGPIL/5ZQw6X2khnphUz7Al0Hfq8ZmUDKYkhSyWs
         mOOg==
X-Forwarded-Encrypted: i=1; AJvYcCWCx9wVBWNB3FzQ+r0IL6exCBD5+hm2yZ9H3TVvp951QzivnE/aw8Dc6C3WIKo2hfQWIym3TRAt0dMj3JY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg/CPPR+ESOrYLxDVZFnNxD2TphNtbhsFCLV5xpEPhPpKafP3l
	G+A6vkgZGpFkXEPajfAkfx7vkCevCqzCN6mCrsiRxw/VaM5/PvWKtBIXPg==
X-Gm-Gg: ASbGncvlXzqZ4VpB2IW9O/VioM8sFBlnQBbrVavHugqKKX+8N8YKVtf2qJs58iCkHZf
	HVMrEoUzgu+KMSrUTIQCkNGNYbsWL9t1Ng1tWGLoWgBX9OmYBXrjoYwIJNaXUibzl2Sukhose0z
	addplS3iaO0Ea1TbhMY/1dZIaTdMi+w0IuzxpWYM/Wj6WR2xL7Omzg2Jwy9hbASIGnBo2gtuGpw
	msPXj+4u6sspiONeV21//IO98yBSfeyW0+4fslEGhucYfXTz2Ba+MmUXzwtsanyKeggdqdZJ2Sr
	tjQUapPDR7lztBgaWuj+eMw=
X-Google-Smtp-Source: AGHT+IFdCbCrEDbHqgeIro5mJhxBZa0YFL+Aw68w+AiAOOxB2ev9vms8Z5zl4cOx9sYtBGODK3DMIA==
X-Received: by 2002:a05:6102:1591:b0:4b2:5ccb:1596 with SMTP id ada2fe7eead31-4ba85fa2a61mr3661616137.24.1738943218221;
        Fri, 07 Feb 2025 07:46:58 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:46:57 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 05/14] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Fri,  7 Feb 2025 10:46:01 -0500
Message-ID: <20250207154610.13675-6-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 76 ++++++++++++-----------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 525d25a1fa6c..6e12164132a6 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -711,53 +711,55 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
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
 
-	status =
-	    alienware_wmax_command(&in_args, sizeof(in_args),
-				   WMAX_METHOD_HDMI_CABLE, &out_data);
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
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
-
-	if (ACPI_SUCCESS(status)) {
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
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
@@ -767,12 +769,11 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_HDMI_SOURCE, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
-		       status);
 	return count;
 }
 
@@ -805,22 +806,23 @@ static const struct attribute_group hdmi_attribute_group = {
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
 
@@ -850,15 +852,16 @@ static const struct attribute_group amplifier_attribute_group = {
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
+	if (!ret) {
 		if (out_data == 0)
 			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
 		else if (out_data == 1)
@@ -866,15 +869,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
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
@@ -884,12 +889,11 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
 		args.arg = 2;
 	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
 
-	status = alienware_wmax_command(&args, sizeof(args),
-					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
 
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
-			status);
 	return count;
 }
 
-- 
2.48.1

