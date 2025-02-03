Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945320E013;
	Mon,  3 Feb 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607255; cv=none; b=M4L/MEMmIg1nJ3suokHhIAHS1GnlYXqAxHc9LVrNJeIVCVnnEQFmaT+KmbeqFu1OGyubfzKzMxF+JrpNjT9xVbKCk7/r1BolFvQSx/ze2BalxF5s6euDE2fysDFyDYU+iewV5RNCZVapeCywoS44AuP0K8g1/1smS8P8vxrDsqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607255; c=relaxed/simple;
	bh=OXqI7azAW92pYtrRn3DzzR1Z9b5weWM/XQY/sev/PRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqJAeZr8fm87biKRQC7Ib8eo/Qvv/C2+9+WX8OdQovqzMP+PgBY7gayQK4+OJHULckmgurMFPL5ftSWwDdV18iTyaD5riOkEuuLKy9IJEqo5rF1PPoUEjHTw9MeYrXxVVM2rjhlbHHL+sgIerelsCv74WsJtDtbnZ6khZgE2wNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNfru9DB; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNfru9DB"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso4358420276.1;
        Mon, 03 Feb 2025 10:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607252; x=1739212052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0mIQlPYxgWDt0+R+sP1cWfSpZUQPQWbWCy1x8q50IA=;
        b=aNfru9DBOJp41ZVKIxf8iaNAN32Ij1xmpjzIZ7QmTE5XvvQ89e/7WxH+FWvfnmdcPR
         mIc1Xf3oncnPQ2kEzZVaG4Txgqh48TfP0dEiUaVDDusXJvQCeTo6PMU10AlCmwsmlFlR
         CDrZTkjt42+JSX/hzAeHlWvoaoPo2o0PvCzWmYcNbMsNDEgjwu6z6v/vD4ZDwwZTN6yv
         DzJLnuxO/gXN69vcmvFsdNwvMJxKAhoLK50FjMpGH2dv90KGlk8RnxS6yOftEFNoTkXY
         JpQUwPAER32muBgLxWTcamytpqMj40DWG8ZGlju6mUgLXz3X3tNJzA+BjNhYq4+rlIFt
         S9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607252; x=1739212052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0mIQlPYxgWDt0+R+sP1cWfSpZUQPQWbWCy1x8q50IA=;
        b=ZgJ0m1BLB9sf7Oo354YIJFRTGE4x+X+YjB089B8B+yzVI94ByR4yxkFVoJgfTqSL7z
         DXlB0ruDVihVMazk8Wb1GsMZkPtSnvUUE8+eznWAOc9CytWNHKhnh05IWGnjM3Jv1Ffj
         ySFCFz3D37X7YTbVZOFKnes+YGlk312EVF7lxdtM7Zfawu7A01hiDzs03gcjsq0/U918
         5Il+He2lEwe/vvXGsp48tgCbyD7wLVquXny2nqPBQGVJ4Yqzr4ZK868Mgj5P0BnwUOVo
         dssdmIbV9xtDq0Z2eut2QpaIHCOEKPLugodBXS7+O39SDyxGmUycpPMTYJJ4Ca6y9GNP
         qtew==
X-Forwarded-Encrypted: i=1; AJvYcCXpFN9ItSJHSkWbtrt8ffxeHz/bv433T2q2V2dU0+c0+VAtKPo4VFS4+g+LrHzaGUKPaUBqrVXT9Zi9qwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCx3Ywn2ZlcNH7Zgc9WYiSG03CKSn2BtrjZSTn+1gCFjUB38g/
	zQcgjZFKShthlKkAUcN44QHqqC9SMU04S9bmvLzzViEhqc9kjR4IhlAtPQ==
X-Gm-Gg: ASbGncsespaiTdjWVHZNqvg9fNwZc0b3YElDIKkD9jKoC0yVnIAshpI38wQgfYj12lM
	sdjeTYC+9Y+SVV6FQw9h2jNOddOs2sWSFp4+N92BOoaPKrQwNHxsc2Q6i9PXjouYF37Q8z9VmNx
	naieKkCdD6Sc2ta2vERwaNvV/DnS/7KXsnCSzhZOgSz4TL268BPSbcNCi0kloqMD+61KydW3O7J
	FFZAdkvdPxcj1yLa6FTsWoWqk6UJxHmT7a+qUwvS+MdrIog/NleDNgLOuP0s/z7Az87gpjtnNat
	gk8dC5mxtdL+ryeWiadR6JU=
X-Google-Smtp-Source: AGHT+IH+IrPALF6LGHb5JmI5ZM9z25NnTpfxvBAotEM6ctFURG5NpTJN+0cAV4RrzMHE+hgd3EhSBQ==
X-Received: by 2002:a05:6902:1708:b0:e5a:c5fa:d42c with SMTP id 3f1490d57ef6-e5ac5fad4a0mr15905298276.25.1738607251809;
        Mon, 03 Feb 2025 10:27:31 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:31 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 05/14] platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
Date: Mon,  3 Feb 2025 13:27:04 -0500
Message-ID: <20250203182713.27446-6-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
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
index 525d25a1fa6c..412caf0e3b84 100644
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

