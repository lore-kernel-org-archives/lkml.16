Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32D28BAA1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292785; cv=none; b=VZl8p29dahp+++h+JXfURVYTL5MlnGOQ4c6RJUrtZFzotJ3V9nIIlw/vnxyU8LKJt9l1pk0s2X50uDVyTanC6NRMuNtAp+oG3nEQ6Ipz+JKMkvmTq4SxavCAq0jHdPuDepuFc36Cs25UUZfeC28qL44AtoA/tDK5X3bOTqNUql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292785; c=relaxed/simple;
	bh=s/k5WYOwT5p+nmwNFgcSXpx6SWgklWpQaiFbLfMDTDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2/5NWsFy/86ISPjjnZO51CrXBkxjRPkH3bbcqFjB7HxmnzpPpYyZmtm1w7fWh82MXf6Jzx6aEvtqa1Bb8KXzrU2ABBVCzZrKtJidHedSRBw2BrkCTMDkM4pQ6vEtgHqFMKoVU+vOGLbny5ve8f/hUV1vI3EU6JrcM8EMC84Pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WwzuidTP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WwzuidTP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so12051979a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292781; x=1751897581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjogWbmRChrVg/U9/QBtp789lljuLZEtjuIUOjGjLMA=;
        b=WwzuidTPT+epE7U00DUeRbDMCvcquOqAx3RxamW0Gi8f8qRZ8atjO9YtP/ox9a9vS3
         4J5VC5lcHz9cTRShDXUhp7b+352YUvs+3jaMjXZFKAU9knRSdC2kcAAJl7ZLpkH9zJ/E
         +fZ79VV8gDmEsuP1LlOq2t5rb/uBx7cAJwL0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292781; x=1751897581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjogWbmRChrVg/U9/QBtp789lljuLZEtjuIUOjGjLMA=;
        b=sNzxDHVmMJKiRWzpXyjDK6EKAtMxeUAM/b6eIa10Hjnb+gFMkM4cRsKd9YhWdwcs8z
         LUVAyf6s2osPVZT00hxs9vUGyJ3r7hSjypBQPRgrIy5uIBUuRAkxIISVLkziNGrpxlok
         K1Ho+Nx5V0MEyDr4qwYuGW/zCByX2z0ewVoklyF94nyAZ/YQLozqiCCo87XBr9aj70Dq
         uCzjo/C4nKEpEd7MVZ2gxghon8XJIMzO48ohkzoQ4AxgLTKCzJrbJmgcbRCLGtiJe3Cr
         DV0nrTRoBnADlYExUQH4nAD1XO30Hc9TG4SWtAO/LRKClfKQgpF//g2RcZuIczo19bQ9
         Mj6g==
X-Forwarded-Encrypted: i=1; AJvYcCUTRflX9pNmRH5oJfjDChqxnQDmxvS/K7Z/rBTqZjNrECPXkS63Uc7qz9+I+Z+HvkxM7RN4s37MKS7eWBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaCrlnMwBPgEeYCe5AL24XCQgBuy9nx0mTK6Y3s9mskTVxHMP
	A8UaUBh8S2/B5v8d4nZO46LwDKuuDxD3TEyL5yxfsiIKFEKHqDC5QPRcKj7kINgLGA==
X-Gm-Gg: ASbGncugmJ5qCl0A1tbWKS8mnmOTMhvkN5b2Pk9uiABY7/DGSyRWLjlGzfnP6S+km0M
	zSZwxqR+mIJSGzqN6vcsis9Lia8cNIxbBJmqpDlu3gOZrAfzjrdZEGhL6URT7MEZeG94ynrJEMW
	H+anTRPg0B135ua+9V7NVGtS3MemBtXayRYXQu1eMK4PG8CiNS3Y9PVnehMPvMwwgNsnNQDadT3
	ND6CrO9eVLkw1iuW87dOh6/wKDW0nmlPLMeEcOigwF9Q+/Yye0UGXeADUEFxlrF/rehQ16CICYK
	l6e6DjaT/7ppm+hW9dS8u/xhRkvub8JaOR1OyXvohfiNPE/OD9aWRR3be1wXbq78Ydk1MrBA5IM
	AojpUNPrvNoWShV8q0XgWZugoybBDEr2ch5I3mYPSWDtTCS5pAKZ3HBEodm6/uYY=
X-Google-Smtp-Source: AGHT+IHcLuKRmuowR4Ws5a+TXpVMjv8QGOB507cIESGE9ZRi1wNw2bdiobBj9vYSo52E+U4pHwEnMg==
X-Received: by 2002:a17:907:d25:b0:ae3:5be2:d9c8 with SMTP id a640c23a62f3a-ae35be2df63mr1229074666b.3.1751292780471;
        Mon, 30 Jun 2025 07:13:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:58 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 05/10] usb: typec: Implement automated mode selection
Date: Mon, 30 Jun 2025 14:12:34 +0000
Message-ID: <20250630141239.3174390-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces mode_selection sysfs attribute to control automated
mode negotiation. Writing "yes" to this file activates the automated
selection process for DisplayPort, Thunderbolt alternate modes, and USB4
mode. Conversely, writing "no" will cancel any ongoing selection process
and exit the currently active mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec |  17 +
 drivers/usb/typec/class.c                   |  52 ++-
 drivers/usb/typec/class.h                   |  10 +
 drivers/usb/typec/mode_selection.c          | 413 ++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  30 ++
 include/linux/usb/pd_vdo.h                  |   2 +
 include/linux/usb/typec_altmode.h           |   5 +
 7 files changed, 527 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index ff3296ee8e1c..0ffc71a7c374 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -263,6 +263,23 @@ Description:	The USB Modes that the partner device supports. The active mode
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>-partner/mode_selection
+Date:		June 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:	Lists the partner-supported alternate modes and mode entry
+		results with the currently entered mode bracketed. If a cable doesn't
+		support a mode, it's marked as 'nc'. An ellipsis indicates a mode
+		currently in progress. Automated mode selection is activated by writing
+		"yes" to the file. Conversely, writing "no" will cancel any ongoing
+		selection process and exit the currently active mode, if any.
+
+		Example values:
+		- "DP TBT=... USB4=nc": The cable does not support USB4 mode,
+			The driver is currently attempting to enter Thunderbolt alt-mode.
+		- "[DP] TBT=-EOPNOTSUPP USB4=-ETIME": USB4 mode entry failed due to
+			a timeout, Thunderbolt failed with the result -EOPNOTSUPP,
+			and DisplayPort is the active alt-mode.
+
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
 Note: Electronically Marked Cables will have a device also for one cable plug
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 93eadbcdd4c0..8455e07a9934 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -741,6 +741,33 @@ static ssize_t number_of_alternate_modes_show(struct device *dev, struct device_
 }
 static DEVICE_ATTR_RO(number_of_alternate_modes);
 
+static ssize_t mode_selection_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct typec_partner *partner = to_typec_partner(dev);
+
+	return typec_mode_selection_get(partner, buf);
+}
+
+static ssize_t mode_selection_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct typec_partner *partner = to_typec_partner(dev);
+	bool start;
+	int ret = kstrtobool(buf, &start);
+
+	if (!ret) {
+		if (start)
+			ret = typec_mode_selection_start(partner);
+		else
+			ret = typec_mode_selection_reset(partner);
+	}
+
+	return ret ? : size;
+}
+static DEVICE_ATTR_RW(mode_selection);
+
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
@@ -748,6 +775,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_usb_mode.attr,
 	&dev_attr_usb_power_delivery_revision.attr,
+	&dev_attr_mode_selection.attr,
 	NULL
 };
 
@@ -772,6 +800,10 @@ static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attrib
 		if (!get_pd_product_type(kobj_to_dev(kobj)))
 			return 0;
 
+	if (attr == &dev_attr_mode_selection.attr)
+		if (!port->alt_mode_override)
+			return 0;
+
 	return attr->mode;
 }
 
@@ -850,8 +882,10 @@ int typec_partner_set_identity(struct typec_partner *partner)
 			usb_capability |= USB_CAPABILITY_USB2;
 		if (devcap & DEV_USB3_CAPABLE)
 			usb_capability |= USB_CAPABILITY_USB3;
-		if (devcap & DEV_USB4_CAPABLE)
+		if (devcap & DEV_USB4_CAPABLE) {
 			usb_capability |= USB_CAPABILITY_USB4;
+			typec_mode_selection_add_mode(partner, TYPEC_USB4_MODE);
+		}
 	} else {
 		usb_capability = PD_VDO_DFP_HOSTCAP(id->vdo[0]);
 	}
@@ -971,7 +1005,12 @@ struct typec_altmode *
 typec_partner_register_altmode(struct typec_partner *partner,
 			       const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&partner->dev, desc);
+	struct typec_altmode *alt = typec_register_altmode(&partner->dev, desc);
+
+	if (alt)
+		typec_mode_selection_add_mode(partner, typec_svid_to_altmode(alt->svid));
+
+	return alt;
 }
 EXPORT_SYMBOL_GPL(typec_partner_register_altmode);
 
@@ -1075,6 +1114,8 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 		typec_partner_link_device(partner, port->usb3_dev);
 	mutex_unlock(&port->partner_link_lock);
 
+	typec_mode_selection_create(partner);
+
 	return partner;
 }
 EXPORT_SYMBOL_GPL(typec_register_partner);
@@ -1092,6 +1133,7 @@ void typec_unregister_partner(struct typec_partner *partner)
 	if (IS_ERR_OR_NULL(partner))
 		return;
 
+	typec_mode_selection_destroy(partner);
 	port = to_typec_port(partner->dev.parent);
 
 	mutex_lock(&port->partner_link_lock);
@@ -1360,6 +1402,7 @@ int typec_cable_set_identity(struct typec_cable *cable)
 }
 EXPORT_SYMBOL_GPL(typec_cable_set_identity);
 
+static struct typec_partner *typec_get_partner(struct typec_port *port);
 /**
  * typec_register_cable - Register a USB Type-C Cable
  * @port: The USB Type-C Port the cable is connected to
@@ -1374,6 +1417,7 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 					 struct typec_cable_desc *desc)
 {
 	struct typec_cable *cable;
+	struct typec_partner *partner;
 	int ret;
 
 	cable = kzalloc(sizeof(*cable), GFP_KERNEL);
@@ -1405,6 +1449,10 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 		return ERR_PTR(ret);
 	}
 
+	partner = typec_get_partner(port);
+	typec_mode_selection_add_cable(partner, cable);
+	put_device(&partner->dev);
+
 	return cable;
 }
 EXPORT_SYMBOL_GPL(typec_register_cable);
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 28b3c19a0632..17efaacc2b8f 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_altmode.h>
+#include <linux/kfifo.h>
 
 struct typec_mux;
 struct typec_switch;
@@ -27,6 +28,8 @@ struct typec_cable {
 	enum usb_pd_svdm_ver		svdm_version;
 };
 
+struct mode_selection_state;
+
 struct typec_partner {
 	struct device			dev;
 	unsigned int			usb_pd:1;
@@ -41,6 +44,13 @@ struct typec_partner {
 
 	struct usb_power_delivery	*pd;
 
+	struct delayed_work mode_selection_work;
+	DECLARE_KFIFO(mode_sequence, struct mode_selection_state *,
+			roundup_pow_of_two(TYPEC_MODE_MAX));
+	struct mutex mode_sequence_lock;
+	struct mode_selection_state *mode_states;
+	struct mode_selection_state *active_mode;
+
 	void (*attach)(struct typec_partner *partner, struct device *dev);
 	void (*deattach)(struct typec_partner *partner, struct device *dev);
 };
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
index cb7ddf679037..5b29ca0201ca 100644
--- a/drivers/usb/typec/mode_selection.c
+++ b/drivers/usb/typec/mode_selection.c
@@ -5,9 +5,25 @@
 
 #include <linux/usb/typec_altmode.h>
 #include <linux/vmalloc.h>
+#include <linux/usb/pd_vdo.h>
+#include <linux/kfifo.h>
 #include "mode_selection.h"
 #include "class.h"
 
+static unsigned int mode_selection_timeout = 4000;
+module_param(mode_selection_timeout, uint, 0644);
+MODULE_PARM_DESC(mode_selection_timeout, "The timeout mode entry, ms");
+
+static unsigned int mode_selection_delay = 1000;
+module_param(mode_selection_delay, uint, 0644);
+MODULE_PARM_DESC(mode_selection_delay,
+	"The delay between attempts to enter or exit a mode, ms");
+
+static unsigned int mode_selection_entry_attempts = 4;
+module_param(mode_selection_entry_attempts, uint, 0644);
+MODULE_PARM_DESC(mode_selection_entry_attempts,
+	"Max attempts to enter mode on BUSY result");
+
 static const char * const mode_names[] = {
 	[TYPEC_DP_ALTMODE] = "DP",
 	[TYPEC_TBT_ALTMODE] = "TBT",
@@ -15,6 +31,15 @@ static const char * const mode_names[] = {
 };
 static const char * const default_priorities = "USB4 TBT DP";
 
+struct mode_selection_state {
+	int mode;
+	bool enable;
+	bool cable_capability;
+	bool enter;
+	int attempt_count;
+	int result;
+};
+
 /* -------------------------------------------------------------------------- */
 /* port 'mode_priorities' attribute */
 static int typec_mode_parse_priority_string(const char *str, int *list)
@@ -114,3 +139,391 @@ int typec_mode_priorities_get(struct typec_port *port, char *buf)
 
 	return count + sysfs_emit_at(buf, count, "\n");
 }
+
+/* -------------------------------------------------------------------------- */
+/* partner 'mod_selection' attribute */
+
+/**
+ * mode_selection_next() - Process mode selection results and schedule next
+ * action
+ *
+ * This function evaluates the outcome of the previous mode entry or exit
+ * attempt. Based on this result, it determines the next mode to process and
+ * schedules `mode_selection_work()` if further actions are required.
+ *
+ * If the previous mode entry was successful, the mode selection sequence is
+ * considered complete for the current cycle.
+ *
+ * If the previous mode entry failed, this function schedules
+ * `mode_selection_work()` to attempt exiting the mode that was partially
+ * activated but not fully entered.
+ *
+ * If the previous operation was an exit (after a failed entry attempt),
+ * `mode_selection_next()` then advances the internal list of candidate
+ * modes to determine the next mode to enter.
+ */
+static void mode_selection_next(
+	struct typec_partner *partner, struct mode_selection_state *ms)
+{
+	if (!ms->enter) {
+		kfifo_skip(&partner->mode_sequence);
+	} else if (!ms->result) {
+		dev_info(&partner->dev, "%s mode entered\n", mode_names[ms->mode]);
+
+		partner->active_mode = ms;
+		kfifo_reset(&partner->mode_sequence);
+	} else {
+		dev_err(&partner->dev, "%s mode entry failed: %pe\n",
+			mode_names[ms->mode], ERR_PTR(ms->result));
+
+		if (ms->result != -EBUSY ||
+			ms->attempt_count >= mode_selection_entry_attempts)
+			ms->enter = false;
+	}
+
+	if (!kfifo_is_empty(&partner->mode_sequence))
+		schedule_delayed_work(&partner->mode_selection_work,
+			msecs_to_jiffies(mode_selection_delay));
+}
+
+static void mode_selection_complete(struct typec_partner *partner,
+				const int mode, const int result)
+{
+	struct mode_selection_state *ms;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (kfifo_peek(&partner->mode_sequence, &ms)) {
+		if (ms->mode == mode) {
+			ms->result = result;
+			cancel_delayed_work(&partner->mode_selection_work);
+			mode_selection_next(partner, ms);
+		}
+	}
+	mutex_unlock(&partner->mode_sequence_lock);
+}
+
+void typec_mode_selection_altmode_complete(struct typec_altmode *alt,
+				const int result)
+{
+	mode_selection_complete(to_typec_partner(alt->dev.parent),
+		typec_svid_to_altmode(alt->svid), result);
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_altmode_complete);
+
+void typec_mode_selection_usb4_complete(struct typec_partner *partner,
+				const int result)
+{
+	mode_selection_complete(partner, TYPEC_USB4_MODE, result);
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_usb4_complete);
+
+static void mode_selection_activate_usb4_mode(struct typec_partner *partner,
+	struct mode_selection_state *ms)
+{
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+	int result = -EOPNOTSUPP;
+
+	if (port->ops && port->ops->enter_usb_mode) {
+		if (ms->enter && port->usb_mode != USB_MODE_USB4)
+			result = -EPERM;
+		else
+			result = port->ops->enter_usb_mode(port,
+				ms->enter ? USB_MODE_USB4 : USB_MODE_USB3);
+	}
+
+	if (ms->enter)
+		ms->result = result;
+}
+
+static int mode_selection_activate_altmode(struct device *dev, void *data)
+{
+	struct typec_altmode *alt = to_typec_altmode(dev);
+	struct mode_selection_state *ms = (struct mode_selection_state *)data;
+	int result = -ENODEV;
+
+	if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
+		if (ms->mode == typec_svid_to_altmode(alt->svid)) {
+			if (alt->ops && alt->ops->activate)
+				result = alt->ops->activate(alt, ms->enter ? 1 : 0);
+			else
+				result = -EOPNOTSUPP;
+		}
+	}
+
+	if (ms->enter)
+		ms->result = result;
+
+	return result == -ENODEV ? 0 : 1;
+}
+
+static void mode_selection_activate_mode(struct typec_partner *partner,
+	struct mode_selection_state *ms)
+{
+	dev_info(&partner->dev, "%s %s mode\n",
+		ms->enter ? "Enter" : "Exit", mode_names[ms->mode]);
+
+	if (ms->enter)
+		ms->attempt_count++;
+
+	if (ms->mode == TYPEC_USB4_MODE)
+		mode_selection_activate_usb4_mode(partner, ms);
+	else
+		device_for_each_child(&partner->dev, ms,
+			mode_selection_activate_altmode);
+
+	if (ms->enter && ms->result)
+		dev_err(&partner->dev, "%s mode activation failed: %pe\n",
+			mode_names[ms->mode], ERR_PTR(ms->result));
+}
+
+/**
+ * mode_selection_work() - Activate entry into the upcoming mode
+ *
+ * This function works in conjunction with `mode_selection_next()`.
+ * It attempts to activate the next mode in the selection sequence.
+ *
+ * If the mode activation (`mode_selection_activate_mode()`) fails,
+ * `mode_selection_next()` will be called to initiate a new selection cycle.
+ *
+ * Otherwise, the result is temporarily set to -ETIME, and
+ * `mode_selection_activate_mode()` is scheduled for a subsequent entry after a
+ * timeout period. The alternate mode driver is expected to call back with the
+ * actual mode entry result. Upon this callback, `mode_selection_next()` will
+ * determine the subsequent mode and re-schedule mode_selection_work().
+ */
+static void mode_selection_work(struct work_struct *work)
+{
+	struct typec_partner *partner = container_of(work, struct typec_partner,
+						  mode_selection_work.work);
+	struct mode_selection_state *ms;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (kfifo_peek(&partner->mode_sequence, &ms)) {
+		if (ms->enter && ms->result == -ETIME) {
+			mode_selection_next(partner, ms);
+		} else {
+			mode_selection_activate_mode(partner, ms);
+
+			if (ms->enter) {
+				if (!ms->result) {
+					ms->result = -ETIME;
+					schedule_delayed_work(&partner->mode_selection_work,
+						msecs_to_jiffies(mode_selection_timeout));
+				} else {
+					ms->enter = ms->result == -EBUSY;
+					mode_selection_next(partner, ms);
+				}
+			} else
+				mode_selection_next(partner, ms);
+		}
+	}
+	mutex_unlock(&partner->mode_sequence_lock);
+}
+
+static void mode_selection_init(struct typec_partner *partner)
+{
+	for (int i = 0; i < TYPEC_MODE_MAX; i++) {
+		partner->mode_states[i].mode = i;
+		partner->mode_states[i].enter = true;
+		partner->mode_states[i].result = 0;
+		partner->mode_states[i].attempt_count = 0;
+	}
+
+	kfifo_reset(&partner->mode_sequence);
+	partner->active_mode = NULL;
+}
+
+int typec_mode_selection_create(struct typec_partner *partner)
+{
+	partner->mode_states = vmalloc(
+		sizeof(struct mode_selection_state) * TYPEC_MODE_MAX);
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	INIT_KFIFO(partner->mode_sequence);
+	mutex_init(&partner->mode_sequence_lock);
+	mode_selection_init(partner);
+	INIT_DELAYED_WORK(&partner->mode_selection_work, mode_selection_work);
+
+	return 0;
+}
+
+void typec_mode_selection_add_mode(struct typec_partner *partner,
+		const int mode)
+{
+	if (partner->mode_states)
+		partner->mode_states[mode].enable =
+			port_mode_supported(to_typec_port(partner->dev.parent), mode);
+}
+
+void typec_mode_selection_add_cable(struct typec_partner *partner,
+		struct typec_cable *cable)
+{
+	const u32 id_header = cable->identity->id_header;
+	const u32 vdo1 = cable->identity->vdo[0];
+	const u32 type = PD_IDH_PTYPE(id_header);
+	const u32 speed = VDO_TYPEC_CABLE_SPEED(vdo1);
+	bool capability[] = {
+		[TYPEC_DP_ALTMODE] = true,
+		[TYPEC_TBT_ALTMODE] = false,
+		[TYPEC_USB4_MODE] = false,
+	};
+
+	if (!partner->mode_states)
+		return;
+
+	if (type == IDH_PTYPE_PCABLE) {
+		capability[TYPEC_DP_ALTMODE] = (speed > CABLE_USB2_ONLY);
+		capability[TYPEC_TBT_ALTMODE] = (speed > CABLE_USB2_ONLY);
+		capability[TYPEC_USB4_MODE] = (speed > CABLE_USB2_ONLY);
+	} else if (type == IDH_PTYPE_ACABLE) {
+		const u32 vdo2 = cable->identity->vdo[1];
+		const u32 version = VDO_TYPEC_CABLE_VERSION(vdo1);
+		const bool usb4_support = VDO_TYPEC_CABLE_USB4_SUPP(vdo2);
+		const bool modal_support = PD_IDH_MODAL_SUPP(id_header);
+
+		capability[TYPEC_DP_ALTMODE] = modal_support;
+		capability[TYPEC_TBT_ALTMODE] = true;
+		if (version == CABLE_VDO_VER1_3)
+			capability[TYPEC_USB4_MODE] = usb4_support;
+		else
+			capability[TYPEC_USB4_MODE] = modal_support;
+	}
+
+	for (int i = 0; i < TYPEC_MODE_MAX; i++)
+		partner->mode_states[i].cable_capability = capability[i];
+}
+
+void typec_mode_selection_destroy(struct typec_partner *partner)
+{
+	if (!partner->mode_states)
+		return;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	kfifo_reset(&partner->mode_sequence);
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	cancel_delayed_work_sync(&partner->mode_selection_work);
+	mutex_destroy(&partner->mode_sequence_lock);
+	vfree(partner->mode_states);
+	partner->mode_states = NULL;
+}
+
+/**
+ * typec_mode_selection_start() - Starts the mode selection process.
+ *
+ * This function populates a 'mode_sequence' FIFO with pointers to
+ * `struct mode_selection_state` instances. The sequence is generated based on
+ * partner/cable capabilities and prioritized according to the port's settings.
+ */
+int typec_mode_selection_start(struct typec_partner *partner)
+{
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+	int ret = 0;
+
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mutex_lock(&partner->mode_sequence_lock);
+
+	if (!kfifo_is_empty(&partner->mode_sequence))
+		ret = -EINPROGRESS;
+	else if (partner->active_mode)
+		ret = -EALREADY;
+	else {
+		mode_selection_init(partner);
+
+		for (int i = 0; i < TYPEC_MODE_MAX; i++) {
+			const int mode = port->mode_priority_list[i];
+			struct mode_selection_state *ms;
+
+			if (mode < TYPEC_MODE_MAX) {
+				ms = &partner->mode_states[mode];
+				if (ms->enable && ms->cable_capability)
+					kfifo_put(&partner->mode_sequence, ms);
+			}
+		}
+
+		if (!kfifo_is_empty(&partner->mode_sequence))
+			schedule_delayed_work(&partner->mode_selection_work, 0);
+	}
+
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	return ret;
+}
+
+/**
+ * typec_mode_selection_reset() - Reset the mode selection process.
+ *
+ * This function cancels ongoing mode selection and exits the currently active
+ * mode, if present.
+ * It returns -EINPROGRESS when a mode exit is already scheduled, or a mode
+ * entry is ongoing, indicating that the reset cannot immediately complete.
+ */
+int typec_mode_selection_reset(struct typec_partner *partner)
+{
+	struct mode_selection_state *ms;
+
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (kfifo_peek(&partner->mode_sequence, &ms)) {
+		kfifo_reset(&partner->mode_sequence);
+
+		if (!ms->enter || ms->result) {
+			ms->attempt_count = mode_selection_entry_attempts;
+			kfifo_put(&partner->mode_sequence, ms);
+			mutex_unlock(&partner->mode_sequence_lock);
+
+			return -EINPROGRESS;
+		}
+	}
+
+	if (partner->active_mode) {
+		partner->active_mode->enter = false;
+		mode_selection_activate_mode(partner, partner->active_mode);
+	}
+	mode_selection_init(partner);
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	return 0;
+}
+
+int typec_mode_selection_get(struct typec_partner *partner, char *buf)
+{
+	ssize_t count = 0;
+	struct mode_selection_state *running_ms;
+
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (!kfifo_peek(&partner->mode_sequence, &running_ms))
+		running_ms = NULL;
+
+	for (int i = 0; i < TYPEC_MODE_MAX; i++) {
+		struct mode_selection_state *ms = &partner->mode_states[i];
+
+		if (ms->enable) {
+			if (!ms->cable_capability)
+				count += sysfs_emit_at(buf, count, "%s=nc ", mode_names[i]);
+			else if (ms == running_ms)
+				count += sysfs_emit_at(buf, count, "%s=... ", mode_names[i]);
+			else if (ms->attempt_count == 0)
+				count += sysfs_emit_at(buf, count, "%s ", mode_names[i]);
+			else if (ms->result == 0)
+				count += sysfs_emit_at(buf, count, "[%s] ", mode_names[i]);
+			else
+				count += sysfs_emit_at(buf, count, "%s=%pe ", mode_names[i],
+					ERR_PTR(ms->result));
+		}
+	}
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	if (count)
+		count += sysfs_emit_at(buf, count, "\n");
+
+	return count;
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
index c595c84e26a4..6a54792a20db 100644
--- a/drivers/usb/typec/mode_selection.h
+++ b/drivers/usb/typec/mode_selection.h
@@ -17,3 +17,33 @@ static inline int typec_svid_to_altmode(const u16 svid)
 int typec_mode_priorities_set(struct typec_port *port,
 		const char *user_priorities);
 int typec_mode_priorities_get(struct typec_port *port, char *buf);
+
+/**
+ * The mode selection process follows a lifecycle tied to the USB-C partner
+ * device. The API is designed to first build a set of desired modes and then
+ * trigger the selection process. The expected sequence of calls is as follows:
+ *
+ * Creation and Configuration:
+ * call typec_mode_selection_create() when the partner device is being set
+ * up. This allocates resources for the mode selection.
+ * After creation, call typec_mode_selection_add_mode() and
+ * typec_mode_selection_add_cable() to define the parameters for the
+ * selection process.
+ *
+ * Execution:
+ * Call typec_mode_selection_start() to trigger the mode selection.
+ * Call typec_mode_selection_reset() to prematurely stop the selection
+ * process and clear any stored results.
+ *
+ * Destruction:
+ * Before destroying a partner, call typec_mode_selection_destroy()
+ */
+int typec_mode_selection_create(struct typec_partner *partner);
+void typec_mode_selection_destroy(struct typec_partner *partner);
+int typec_mode_selection_start(struct typec_partner *partner);
+int typec_mode_selection_reset(struct typec_partner *partner);
+void typec_mode_selection_add_mode(struct typec_partner *partner,
+		const int mode);
+void typec_mode_selection_add_cable(struct typec_partner *partner,
+		struct typec_cable *cable);
+int typec_mode_selection_get(struct typec_partner *partner, char *buf);
diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 5c48e8a81403..20bcf37ad634 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -439,6 +439,8 @@
 	 | (trans) << 11 | (phy) << 10 | (ele) << 9 | (u4) << 8			\
 	 | ((hops) & 0x3) << 6 | (u2) << 5 | (u32) << 4 | (lane) << 3		\
 	 | (iso) << 2 | (gen))
+#define VDO_TYPEC_CABLE_VERSION(vdo) (((vdo) >> 21) & 0x7)
+#define VDO_TYPEC_CABLE_USB4_SUPP(vdo) (((vdo) & BIT(8)) == ACAB2_USB4_SUPP)
 
 /*
  * AMA VDO (PD Rev2.0)
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 4f05c5f5c91d..49213cf27565 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -225,4 +225,9 @@ void typec_altmode_unregister_driver(struct typec_altmode_driver *drv);
 	module_driver(__typec_altmode_driver, typec_altmode_register_driver, \
 		      typec_altmode_unregister_driver)
 
+void typec_mode_selection_altmode_complete(struct typec_altmode *alt,
+				const int result);
+void typec_mode_selection_usb4_complete(struct typec_partner *partner,
+				const int result);
+
 #endif /* __USB_TYPEC_ALTMODE_H */
-- 
2.50.0.727.gbf7dc18ff4-goog

