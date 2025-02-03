Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288AE204C29
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587635; cv=none; b=KIyLH/D4NjK+5VetwKlC4OBKOidGTKFIdbLzkgx6BSy2YKQ3dFSNPMeAXsL3ZSAW4WrTsH2vWaGj/+44YB2woxTLkxy5VP6eeIVBmaNSQ41WLYamDkHbNXT5aDNQIecHpNQidKhUprUthYKZBS3KNYdjnqAKok2NCA2IbvEH4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587635; c=relaxed/simple;
	bh=DSN06IxcdIfuGR/BXO1SLB8Tt7tDFehbwoTUfPgr4vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grSgOCSiw07aJXjcYlRt2VGq3RPAwa3r2fD/RFAz4428rolP5SNxtGwkV7O0iTi2bB/cYPqil260yxOG+FU3hc99P6BFmgDCqdzYj/t3eVXukjUeoZV3am4BK7ya2zYpOKfMQY61eplVzbuxy6hmrAEDTcTFtSqKlkrpCAkW9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dZVnWPqj; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dZVnWPqj"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso10136117a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738587631; x=1739192431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMTIp+RZ6kEe92QzkrU5leVcNbLxPqPNP9qaL/EdXKI=;
        b=dZVnWPqjhX1GYEHzZnZ0eCuhyqHBdFXeThVi8p8ul2i62fiMXQgk3ELvH4lyhF5Hdj
         elBaQyJ9bvmE0MmNQMFtd1f5aebwbCHY0zFybPgsB1zYl1NVmA3tazdQiiFYudP0e/h7
         jYTI3seP3q3xB/aL1GcIt6jfp5KO5BXee8MkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587631; x=1739192431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMTIp+RZ6kEe92QzkrU5leVcNbLxPqPNP9qaL/EdXKI=;
        b=TU2qSmBXCwHD3G9ZcX5hi9oTJyYY47uwssrPGBfeg1zqRYff0444xZewnErONBc6bA
         TyV2Jn31m8pHOQdz1+A2CTmq3KNSlRV1z2gcLVWjBwGs2l7FUnTt5fQGKfqk7hl6cmL2
         wrxWV0Kk8sfe/XtoA1Wj/PluOT4baWOUtM4Hq+cvksm4JXoIXV5WIB9jRkt7Pq5OoIv0
         kj1kUa9mzEItUAXhFazFHvSSjUGYk6PvLX4d0yZGQoRsHjJEZEDBxAxb4iKiogW6Hvvu
         5g3e0TmWEwf9LAWMNZg8Z0eWiYjhecN68zytRPfXhd8589bkYMYDRQmWXwqjNF+y8E7e
         6+KA==
X-Forwarded-Encrypted: i=1; AJvYcCUr1VHu0g6obpwxOPZohI0erIEBXZowrLWJ2KLlVJSEX6ZjkvkW/IGjifcCaMdCyt2yvDjIu5+l3w7TTps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyigjSm8DJdQpYTUf3Gvyr3hgX+Q2nd+w/8wUkk3r2eo6nxsPgv
	beGcTO2h3XaqhOqMhEW9NKl2QrfW62gcXJyWnGYY82ttag4CJ31l7g2gIuAKmQ==
X-Gm-Gg: ASbGncv1vO/+f1CpcGfMw0ofqnXPtgQnJri/4e2/xHGPukR+8H+se0Kf2WCj3fL5reD
	jwqWPhOIoAQb+Tq3ueewtIDWWYaVPHu8eHWI5zDqHOyCBCaDusJfLloN8Nz+0fxizN3Wtsh1SyH
	jO0O9lN1tKT0akxnx4iJo1Wnm+gKw5vTmXvCPNh73EqnPmZYL3omh1D+5v9QkRzoi3Itd422JMG
	ENXcekFd1JJ2tztBVGBdDp2MdhnbQKM2btpuLUElq5xHXkZpK0bEw+aSMpgCZbfS9GYTgm+K6Ll
	cG6j+h+UEHCB63jZJtyrpQqLJhVV/g6QMp6yzuxq2be6/vL4aFYQihNO72onhmMO4P7w10xXSMu
	vjD0egg==
X-Google-Smtp-Source: AGHT+IFaj+AVyjD4nCvMckB54qr4raahN5XXtSLRYqzScx5HMHiza/xh72eb8PU+j3YTB77VuX/Qdw==
X-Received: by 2002:a05:6402:2746:b0:5dc:5c18:6cb with SMTP id 4fb4d7f45d1cf-5dc7fd26d74mr16090641a12.13.1738587629849;
        Mon, 03 Feb 2025 05:00:29 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc87f2e5easm5319055a12.57.2025.02.03.05.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:00:29 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/2] platform/chrome: cros_ec_typec: Expose PD mux status via sysfs
Date: Mon,  3 Feb 2025 12:59:46 +0000
Message-ID: <20250203125947.2701106-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203125947.2701106-1-akuchynski@chromium.org>
References: <20250203125947.2701106-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds sysfs attribute /sys/class/chromeos/cros_ec/usbpdmuxinfo
to expose the PD mux status for each Type-C port.
This allows user-space applications to easily determine
the current mux state without using ioctls.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 .../ABI/testing/sysfs-class-chromeos          | 13 +++++
 drivers/platform/chrome/cros_ec_sysfs.c       | 58 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-chromeos b/Documentation/ABI/testing/sysfs-class-chromeos
index 74ece942722e..e067dbdab170 100644
--- a/Documentation/ABI/testing/sysfs-class-chromeos
+++ b/Documentation/ABI/testing/sysfs-class-chromeos
@@ -31,3 +31,16 @@ Date:		August 2015
 KernelVersion:	4.2
 Description:
 		Show the information about the EC software and hardware.
+
+What:		/sys/class/chromeos/cros_ec/usbpdmuxinfo
+Date:		February 2025
+Description:
+		Show PD mux status for each typec port with following flags:
+		- "USB": USB connected
+		- "DP": DP connected
+		- "POLARITY": CC line Polarity inverted
+		- "HPD_IRQ": Hot Plug Detect interrupt is asserted
+		- "HPD_LVL": Hot Plug Detect level is asserted
+		- "SAFE": DP is in safe mode
+		- "TBT": TBT enabled
+		- "USB4": USB4 enabled
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index bc1a5ba09528..93e9ed87249c 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -296,18 +296,69 @@ static ssize_t kb_wake_angle_store(struct device *dev,
 	return count;
 }
 
+static ssize_t usbpdmuxinfo_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	ssize_t count = 0;
+	struct ec_response_usb_pd_ports resp_pd_ports;
+	int ret;
+	int i;
+
+	ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
+			  &resp_pd_ports, sizeof(resp_pd_ports));
+	if (ret < 0)
+		return -EIO;
+
+	for (i = 0; i < resp_pd_ports.num_ports; i++) {
+		struct ec_response_usb_pd_mux_info resp_mux;
+		struct ec_params_usb_pd_mux_info req = {
+			.port = i,
+		};
+
+		ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_USB_PD_MUX_INFO,
+			  &req, sizeof(req), &resp_mux, sizeof(resp_mux));
+
+		if (ret >= 0) {
+			count += sysfs_emit_at(buf, count, "Port %d:", i);
+			count += sysfs_emit_at(buf, count, " USB=%d",
+					!!(resp_mux.flags & USB_PD_MUX_USB_ENABLED));
+			count += sysfs_emit_at(buf, count, " DP=%d",
+					!!(resp_mux.flags & USB_PD_MUX_DP_ENABLED));
+			count += sysfs_emit_at(buf, count, " POLARITY=%s",
+					(resp_mux.flags & USB_PD_MUX_POLARITY_INVERTED) ?
+					"INVERTED" : "NORMAL");
+			count += sysfs_emit_at(buf, count, " HPD_IRQ=%d",
+					!!(resp_mux.flags & USB_PD_MUX_HPD_IRQ));
+			count += sysfs_emit_at(buf, count, " HPD_LVL=%d",
+					!!(resp_mux.flags & USB_PD_MUX_HPD_LVL));
+			count += sysfs_emit_at(buf, count, " SAFE=%d",
+					!!(resp_mux.flags & USB_PD_MUX_SAFE_MODE));
+			count += sysfs_emit_at(buf, count, " TBT=%d",
+					!!(resp_mux.flags & USB_PD_MUX_TBT_COMPAT_ENABLED));
+			count += sysfs_emit_at(buf, count, " USB4=%d\n",
+					!!(resp_mux.flags & USB_PD_MUX_USB4_ENABLED));
+		}
+	}
+
+	return count ? : -EIO;
+}
+
 /* Module initialization */
 
 static DEVICE_ATTR_RW(reboot);
 static DEVICE_ATTR_RO(version);
 static DEVICE_ATTR_RO(flashinfo);
 static DEVICE_ATTR_RW(kb_wake_angle);
+static DEVICE_ATTR_RO(usbpdmuxinfo);
 
 static struct attribute *__ec_attrs[] = {
 	&dev_attr_kb_wake_angle.attr,
 	&dev_attr_reboot.attr,
 	&dev_attr_version.attr,
 	&dev_attr_flashinfo.attr,
+	&dev_attr_usbpdmuxinfo.attr,
 	NULL,
 };
 
@@ -320,6 +371,13 @@ static umode_t cros_ec_ctrl_visible(struct kobject *kobj,
 	if (a == &dev_attr_kb_wake_angle.attr && !ec->has_kb_wake_angle)
 		return 0;
 
+	if (a == &dev_attr_usbpdmuxinfo.attr) {
+		struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
+
+		if (strcmp(ec_platform->ec_name, CROS_EC_DEV_NAME))
+			return 0;
+	}
+
 	return a->mode;
 }
 
-- 
2.48.1.362.g079036d154-goog

