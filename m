Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0462DBF71
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080802; cv=none; b=nve/e/zQzJR2Zac6LEBEmk/OWQbDHo4G0rICGbVrLE+GzaLjGK1LXpDEuuT73Lh3yeCOmrPKp2SfrGmh4BflmWQFBevpxPSYyC8oCE02Ahb0dSPvSK98Z5wySww1iEerpn+WTytaTD/rkVfHNjNvrHcOnA6E+2NVK9evqUBYsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080802; c=relaxed/simple;
	bh=3/DRUHcMTi2y3mpOqN273fqCN7TXxAZm6Dg+1+doKTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESsYnOmZeXKUy9Q9abKIfHCWP+1UXB1Sw77BNb/xZasz8ZA8LU0ZHLvvkSWE74jRX7RECsj5xB0UZ1kRyL1NUxAfvoTV8/tX2p7UMjLi7fWwcsLvCmUtCFgz8qowcBc1ynLazI+52GqS//0D2nC1INFHq2Rgk71/j+o4LPSGtBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OhYGMn/9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OhYGMn/9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so497512a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080798; x=1750685598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ08ykcaUh86luL6nlhAeVkvWPVp9UYwGXyL0gTTMNk=;
        b=OhYGMn/9cK50w2ys0eROu1jfa6/WwjUJwvlZ08jjwsYjIhza8+D5UVVcx9XVfKYoUo
         GyLT6lGVONgDP6JLPjPtPH9qPcd2bOkVg4z7KaRwopR8iO+ixMEbuRp61jfRURaGFIeT
         rF3O4gzEaHNwmEvvxQb4y3I7ehinmyMwcbsSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080798; x=1750685598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ08ykcaUh86luL6nlhAeVkvWPVp9UYwGXyL0gTTMNk=;
        b=poz0oH4bw3SYzfE8kbk0aXnVx8XGiSYHkQJNmEguVE589P1FAX3MYtjCrtyNp2Cfhg
         F7Nqu34GgQAPVSKHc6td4fBzizQrZMKeVMSnho7XJRC0iL6Wcn3DmYawICa4RR+HcBVU
         JWKbChoLWQiHJyhSY/HwHb1E3iFq3GRqWabPNhNCKL8Mixjwsg84XcOZNm/zm3wDe34C
         eLFj2SahVqKeWr0U/mVu+DRQuf9aAwwx0mk+7ugN5KnkjXya6qxJMTccVIp2LYKh1+1f
         PU+n0QLaUrH/QktoqCS43xS2w0D9j39OzZUViuABLzmbieBtaoXltjZMHjL9bBs8NhJL
         rorA==
X-Forwarded-Encrypted: i=1; AJvYcCWdHf6k98haxX+hWJr8zm8BGBQN5/77zCFV5JPxqR42VWCC1iJIOO64wMFf+/b8UFtHD8wAkKN4fQJrYus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9vpBSOdxpwi+ym1Ft8mNZ7mHW2E+zQCVhaL8y1WSuOa/Pv1n
	D3kLHooVBI+UICOKjblqTXd9pOOkM1zfn3B5OoKImNMAti2Kkgc1H0MM+Q8DtBaPmQ==
X-Gm-Gg: ASbGncu57SfxAspbQ/G/IuyAJua/xwYuz7Iq3P9SjCtZFYd5uIPlrbmZJLicALt8Plz
	3pwo+8lOZW+6gDJWxaLS/tISqFaVh1s6FkWKGkV4b3ZIlXypcQUEaiGEx57mfUtegj2djxRp3yF
	O/1q3/YosHsQdpcSjhjOT3BV44SHXHZ6d0V60/n5zsX4rIVXgK407CCQemhaT9nxecOaqV3DcAL
	3RPLS2R58Y78qOFEOTpBWzBz8RyzSGzegUY+QXedJ+8CNDg+mkVO6APhdlHTSe9Fs8o9VznKt7t
	MoKejprH6UFxhNtjT/gr/dZ8Y0pC+XcVG8h1I3eWseUwdj77i18gnApD1t4bSgMrOpDvX3rbmo/
	PVeO6JDEzjLBw9jjcIGHIwYEhryoiIkp2Iq/SO71ygmH5JFRHBRZ8XRIlCbN/6YEbjQhU
X-Google-Smtp-Source: AGHT+IF6GKFag0i4Lv/O+v/7mDdJI4fryPv5+oukAaxB/RbyOwFkxmlwO5un2SAx2VKkhO7cXQoPzw==
X-Received: by 2002:a05:6402:13d0:b0:601:9afe:8da9 with SMTP id 4fb4d7f45d1cf-608ce59a873mr7840208a12.11.1750080797505;
        Mon, 16 Jun 2025 06:33:17 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:17 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 05/10] usb: typec: Implement automated alternate mode selection
Date: Mon, 16 Jun 2025 13:31:42 +0000
Message-ID: <20250616133147.1835939-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces mode_selection sysfs attribute to control automated
alternate mode negotiation. Writing "yes" to this file activates the
automated selection process for DisplayPort alt-mode, Thunderbolt alt-mode,
and USB4 mode. Conversely, writing "no" will cancel any ongoing selection
process and exit the currently active alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec |  17 +
 drivers/usb/typec/class.c                   |  55 ++-
 drivers/usb/typec/class.h                   |  12 +
 drivers/usb/typec/mode_selection.c          | 412 ++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  37 ++
 include/linux/usb/pd_vdo.h                  |   2 +
 include/linux/usb/typec_altmode.h           |   5 +
 7 files changed, 537 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 46eee82042ab..ec205f49964e 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -264,6 +264,23 @@ Description:	The USB Modes that the partner device supports. The active mode
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
index 726fc0411c44..e8432070b403 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -541,7 +541,7 @@ static void typec_altmode_release(struct device *dev)
 }
 
 const struct device_type typec_altmode_dev_type = {
-	.name = "typec_alternate_mode",
+	.name = ALTERNATE_MODE_DEVICE_TYPE_NAME,
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
@@ -741,6 +741,34 @@ static ssize_t number_of_alternate_modes_show(struct device *dev, struct device_
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
+	if (ret)
+		return ret;
+
+	if (start)
+		ret = typec_mode_selection_start(partner);
+	else
+		ret = typec_mode_selection_reset(partner);
+
+	return ret ? : size;
+}
+static DEVICE_ATTR_RW(mode_selection);
+
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
@@ -748,6 +776,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_usb_mode.attr,
 	&dev_attr_usb_power_delivery_revision.attr,
+	&dev_attr_mode_selection.attr,
 	NULL
 };
 
@@ -772,6 +801,10 @@ static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attrib
 		if (!get_pd_product_type(kobj_to_dev(kobj)))
 			return 0;
 
+	if (attr == &dev_attr_mode_selection.attr)
+		if (!port->alt_mode_override)
+			return 0444;
+
 	return attr->mode;
 }
 
@@ -850,8 +883,10 @@ int typec_partner_set_identity(struct typec_partner *partner)
 			usb_capability |= USB_CAPABILITY_USB2;
 		if (devcap & DEV_USB3_CAPABLE)
 			usb_capability |= USB_CAPABILITY_USB3;
-		if (devcap & DEV_USB4_CAPABLE)
+		if (devcap & DEV_USB4_CAPABLE) {
 			usb_capability |= USB_CAPABILITY_USB4;
+			typec_mode_selection_add_mode(partner, TYPEC_ALTMODE_USB4);
+		}
 	} else {
 		usb_capability = PD_VDO_DFP_HOSTCAP(id->vdo[0]);
 	}
@@ -971,7 +1006,12 @@ struct typec_altmode *
 typec_partner_register_altmode(struct typec_partner *partner,
 			       const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&partner->dev, desc);
+	struct typec_altmode *alt = typec_register_altmode(&partner->dev, desc);
+
+	if (alt)
+		typec_mode_selection_add_mode(partner, TYPEC_SVID_TO_ALTMODE(alt->svid));
+
+	return alt;
 }
 EXPORT_SYMBOL_GPL(typec_partner_register_altmode);
 
@@ -1075,6 +1115,8 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 		typec_partner_link_device(partner, port->usb3_dev);
 	mutex_unlock(&port->partner_link_lock);
 
+	typec_mode_selection_create(partner);
+
 	return partner;
 }
 EXPORT_SYMBOL_GPL(typec_register_partner);
@@ -1092,6 +1134,7 @@ void typec_unregister_partner(struct typec_partner *partner)
 	if (IS_ERR_OR_NULL(partner))
 		return;
 
+	typec_mode_selection_destroy(partner);
 	port = to_typec_port(partner->dev.parent);
 
 	mutex_lock(&port->partner_link_lock);
@@ -1360,6 +1403,7 @@ int typec_cable_set_identity(struct typec_cable *cable)
 }
 EXPORT_SYMBOL_GPL(typec_cable_set_identity);
 
+static struct typec_partner *typec_get_partner(struct typec_port *port);
 /**
  * typec_register_cable - Register a USB Type-C Cable
  * @port: The USB Type-C Port the cable is connected to
@@ -1374,6 +1418,7 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 					 struct typec_cable_desc *desc)
 {
 	struct typec_cable *cable;
+	struct typec_partner *partner;
 	int ret;
 
 	cable = kzalloc(sizeof(*cable), GFP_KERNEL);
@@ -1405,6 +1450,10 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
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
index dffe5ef03bc6..30e66d283a10 100644
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
+			roundup_pow_of_two(TYPEC_ALTMODE_MAX));
+	struct mutex mode_sequence_lock;
+	struct mode_selection_state *mode_states;
+	struct mode_selection_state *active_mode;
+
 	void (*attach)(struct typec_partner *partner, struct device *dev);
 	void (*deattach)(struct typec_partner *partner, struct device *dev);
 };
@@ -113,4 +123,6 @@ static inline int typec_link_ports(struct typec_port *connector) { return 0; }
 static inline void typec_unlink_ports(struct typec_port *connector) { }
 #endif
 
+#define ALTERNATE_MODE_DEVICE_TYPE_NAME "typec_alternate_mode"
+
 #endif /* __USB_TYPEC_CLASS__ */
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
index d984c79eef45..2bef50226af4 100644
--- a/drivers/usb/typec/mode_selection.c
+++ b/drivers/usb/typec/mode_selection.c
@@ -5,9 +5,22 @@
 
 #include <linux/usb/typec_altmode.h>
 #include <linux/vmalloc.h>
+#include <linux/usb/pd_vdo.h>
+#include <linux/kfifo.h>
+#include "mode_selection.h"
 #include "class.h"
 
 #define MODE_PRIORITY_DISABLED -1
+#define MODE_SELECTION_NO_RESULT 1
+
+static unsigned int mode_selection_timeout = 4000;
+module_param(mode_selection_timeout, uint, 0644);
+MODULE_PARM_DESC(mode_selection_timeout, "The timeout mode entry, ms");
+
+static unsigned int mode_selection_delay = 1000;
+module_param(mode_selection_delay, uint, 0644);
+MODULE_PARM_DESC(mode_selection_delay,
+	"The delay between attempts to enter or exit a mode, ms");
 
 static const char * const altmode_names[] = {
 	[TYPEC_ALTMODE_DP] = "DP",
@@ -16,6 +29,14 @@ static const char * const altmode_names[] = {
 };
 static const char * const default_priorities = "USB4=0 TBT=1 DP=2";
 
+struct mode_selection_state {
+	int mode;
+	bool enable;
+	bool cable_capability;
+	bool enter;
+	int result;
+};
+
 /* -------------------------------------------------------------------------- */
 /* port 'altmode_priorities' attribute */
 
@@ -91,3 +112,394 @@ int typec_mode_priorities_get(struct typec_port *port, char *buf)
 	}
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
+ * attempt. Based on this result, it determines the next alternate mode to
+ * process and schedules `mode_selection_work()` if further actions are
+ * required.
+ *
+ * If the previous mode entry was successful, the mode selection sequence is
+ * considered complete for the current cycle.
+ *
+ * If the previous mode entry failed, this function schedules
+ * `mode_selection_work()` to attempt exiting the currently active mode.
+ *
+ * If the previous operation was an exit (after a failed entry attempt),
+ * `mode_selection_next()` then advances the internal list of candidate
+ * modes to determine the next mode to enter.
+ */
+static void mode_selection_next(
+	struct typec_partner *partner, struct mode_selection_state *ms)
+{
+	if (!ms->result && ms->enter) {
+		dev_info(&partner->dev, "%s mode entered\n", altmode_names[ms->mode]);
+
+		partner->active_mode = ms;
+		kfifo_reset(&partner->mode_sequence);
+	} else {
+		if (ms->result && ms->enter)
+			dev_err(&partner->dev, "%s mode entry failed: %pe\n",
+				altmode_names[ms->mode], ERR_PTR(ms->result));
+
+		if (ms->result != -EBUSY) {
+			if (ms->enter)
+				ms->enter = false;
+			else
+				kfifo_skip(&partner->mode_sequence);
+		}
+
+		if (!kfifo_is_empty(&partner->mode_sequence)) {
+			cancel_delayed_work(&partner->mode_selection_work);
+			schedule_delayed_work(&partner->mode_selection_work,
+				msecs_to_jiffies(mode_selection_delay));
+		}
+	}
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
+		TYPEC_SVID_TO_ALTMODE(alt->svid), result);
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_altmode_complete);
+
+void typec_mode_selection_usb4_complete(struct typec_partner *partner,
+				const int result)
+{
+	mode_selection_complete(partner, TYPEC_ALTMODE_USB4, result);
+}
+EXPORT_SYMBOL_GPL(typec_mode_selection_usb4_complete);
+
+static int mode_selection_activate_altmode(struct device *dev, void *data)
+{
+	if (!strcmp(dev->type->name, ALTERNATE_MODE_DEVICE_TYPE_NAME)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+		struct mode_selection_state *ms = (struct mode_selection_state *)data;
+
+		if (ms->mode == TYPEC_SVID_TO_ALTMODE(alt->svid)) {
+			int result = -EOPNOTSUPP;
+
+			if (alt->ops && alt->ops->activate)
+				result = alt->ops->activate(alt, ms->enter ? 1 : 0);
+			if (ms->enter)
+				ms->result = result;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static void mode_selection_activate_mode(struct typec_partner *partner,
+	struct mode_selection_state *ms)
+{
+	dev_info(&partner->dev, "Attempt to %s %s mode\n",
+		ms->enter ? "enter" : "exit", altmode_names[ms->mode]);
+
+	if (ms->mode == TYPEC_ALTMODE_USB4) {
+		struct typec_port *port = to_typec_port(partner->dev.parent);
+		int result = -EOPNOTSUPP;
+
+		if (port->ops && port->ops->enter_usb_mode)
+			result = port->ops->enter_usb_mode(port,
+				ms->enter ? USB_MODE_USB4 : USB_MODE_NONE);
+
+		if (ms->enter)
+			ms->result = result;
+	} else {
+		const int ret = device_for_each_child(&partner->dev, ms,
+				mode_selection_activate_altmode);
+		if (!ret && ms->enter)
+			ms->result = -ENODEV;
+	}
+}
+
+/**
+ * mode_selection_work() - Activate entry into the upcoming mode
+ *
+ * This function works in conjunction with `mode_selection_next()`.
+ * It attempts to activate the next alternate mode in the selection sequence.
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
+			if (!ms->enter || ms->result)
+				mode_selection_next(partner, ms);
+			else {
+				ms->result = -ETIME;
+				schedule_delayed_work(&partner->mode_selection_work,
+					msecs_to_jiffies(mode_selection_timeout));
+			}
+		}
+	}
+	mutex_unlock(&partner->mode_sequence_lock);
+}
+
+static void mode_selection_init(struct typec_partner *partner)
+{
+	int i;
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++) {
+		partner->mode_states[i].mode = i;
+		partner->mode_states[i].result = MODE_SELECTION_NO_RESULT;
+	}
+
+	kfifo_reset(&partner->mode_sequence);
+	partner->active_mode = NULL;
+}
+
+int typec_mode_selection_create(struct typec_partner *partner)
+{
+	partner->mode_states = vmalloc(
+		sizeof(struct mode_selection_state) * TYPEC_ALTMODE_MAX);
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
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+
+	if (!partner->mode_states)
+		return;
+
+	if (mode < TYPEC_ALTMODE_MAX) {
+		if (mode == TYPEC_ALTMODE_USB4) {
+			if (!(port->cap->usb_capability & USB_CAPABILITY_USB4))
+				return;
+		}
+		partner->mode_states[mode].enable = true;
+	}
+}
+
+void typec_mode_selection_add_cable(struct typec_partner *partner,
+		struct typec_cable *cable)
+{
+	const u32 id_header = cable->identity->id_header;
+	const u32 vdo0 = cable->identity->vdo[0];
+	const u32 vdo1 = cable->identity->vdo[1];
+	const u32 type = PD_IDH_PTYPE(id_header);
+	const u32 speed = VDO_TYPEC_CABLE_SPEED(vdo0);
+	bool capable_dp = true;
+	bool capable_tbt = false;
+	bool capable_usb4 = false;
+
+	if (!partner->mode_states)
+		return;
+
+	if (type == IDH_PTYPE_PCABLE) {
+		capable_dp = (speed > CABLE_USB2_ONLY);
+		capable_tbt = capable_dp;
+		capable_usb4 = capable_dp;
+	} else if (type == IDH_PTYPE_ACABLE) {
+		const u32 version = VDO_TYPEC_CABLE_VERSION(vdo0);
+		const bool usb4_support = VDO_TYPEC_CABLE_USB4_SUPP(vdo1);
+		const bool modal_support = PD_IDH_MODAL_SUPP(id_header);
+
+		capable_dp = modal_support;
+		capable_tbt = true;
+		capable_usb4 = (version == 3) ? usb4_support : modal_support;
+	}
+
+	if (capable_dp || capable_tbt || capable_usb4)
+		dev_info(&partner->dev, "cable capabilities: %s %s %s\n",
+			capable_dp ? altmode_names[TYPEC_ALTMODE_DP] : "",
+			capable_tbt ? altmode_names[TYPEC_ALTMODE_TBT] : "",
+			capable_usb4 ? altmode_names[TYPEC_ALTMODE_USB4] : "");
+	partner->mode_states[TYPEC_ALTMODE_DP].cable_capability = capable_dp;
+	partner->mode_states[TYPEC_ALTMODE_TBT].cable_capability = capable_tbt;
+	partner->mode_states[TYPEC_ALTMODE_USB4].cable_capability = capable_usb4;
+}
+
+static void mode_selection_cancel_work(struct typec_partner *partner)
+{
+	/*
+	 * mode_sequence_lock provides exclusive access to `mode_sequence` FIFO
+	 * If the FIFO is empty, no further mode selection activities are expected
+	 */
+	mutex_lock(&partner->mode_sequence_lock);
+	kfifo_reset(&partner->mode_sequence);
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	cancel_delayed_work_sync(&partner->mode_selection_work);
+}
+
+void typec_mode_selection_destroy(struct typec_partner *partner)
+{
+	if (!partner->mode_states)
+		return;
+
+	mode_selection_cancel_work(partner);
+	mutex_destroy(&partner->mode_sequence_lock);
+	vfree(partner->mode_states);
+	partner->mode_states = NULL;
+}
+
+/**
+ * typec_mode_selection_start() - Starts the alternate mode selection process.
+ *
+ * This function populates a 'mode_sequence' FIFO with pointers to
+ * `struct mode_selection_state` instances. The sequence is generated based on
+ * partner/cable capabilities and prioritized according to the port's settings.
+ */
+int typec_mode_selection_start(struct typec_partner *partner)
+{
+	struct typec_port *port = to_typec_port(partner->dev.parent);
+	int priorities[TYPEC_ALTMODE_MAX];
+	bool pending_mode = true;
+	int i;
+
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (!kfifo_is_empty(&partner->mode_sequence)) {
+		mutex_unlock(&partner->mode_sequence_lock);
+		return -EINPROGRESS;
+	}
+	if (partner->active_mode) {
+		mutex_unlock(&partner->mode_sequence_lock);
+		return -EALREADY;
+	}
+
+	mode_selection_init(partner);
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++) {
+		if (partner->mode_states[i].enable &&
+			partner->mode_states[i].cable_capability)
+			priorities[i] = port->altmode_priorities[i];
+		else
+			priorities[i] = MODE_PRIORITY_DISABLED;
+	}
+
+	while (pending_mode) {
+		int mode = TYPEC_ALTMODE_MAX;
+		int max_priority = INT_MAX;
+
+		for (i = 0; i < TYPEC_ALTMODE_MAX; i++) {
+			if (priorities[i] != MODE_PRIORITY_DISABLED &&
+				priorities[i] < max_priority) {
+				max_priority = priorities[i];
+				mode = i;
+			}
+		}
+
+		if (mode == TYPEC_ALTMODE_MAX)
+			pending_mode = false;
+		else {
+			partner->mode_states[mode].enter = true;
+			kfifo_put(&partner->mode_sequence, &partner->mode_states[mode]);
+			priorities[mode] = MODE_PRIORITY_DISABLED;
+		}
+	}
+
+	if (!kfifo_is_empty(&partner->mode_sequence))
+		schedule_delayed_work(&partner->mode_selection_work, 0);
+	mutex_unlock(&partner->mode_sequence_lock);
+
+	return 0;
+}
+
+int typec_mode_selection_reset(struct typec_partner *partner)
+{
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mode_selection_cancel_work(partner);
+
+	if (partner->active_mode) {
+		partner->active_mode->enter = false;
+		mode_selection_activate_mode(partner, partner->active_mode);
+	}
+	mode_selection_init(partner);
+
+	return 0;
+}
+
+int typec_mode_selection_get(struct typec_partner *partner, char *buf)
+{
+	ssize_t count = 0;
+	int i;
+	struct mode_selection_state *running_ms;
+
+	if (!partner->mode_states)
+		return -ENOMEM;
+
+	mutex_lock(&partner->mode_sequence_lock);
+	if (!kfifo_peek(&partner->mode_sequence, &running_ms))
+		running_ms = NULL;
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++) {
+		struct mode_selection_state *ms = &partner->mode_states[i];
+
+		if (ms->enable) {
+			if (!ms->cable_capability)
+				count += sysfs_emit_at(buf, count, "%s=nc ", altmode_names[i]);
+			else if (ms == running_ms)
+				count += sysfs_emit_at(buf, count, "%s=... ", altmode_names[i]);
+			else if (ms->result == MODE_SELECTION_NO_RESULT)
+				count += sysfs_emit_at(buf, count, "%s ", altmode_names[i]);
+			else if (ms->result == 0)
+				count += sysfs_emit_at(buf, count, "[%s] ", altmode_names[i]);
+			else
+				count += sysfs_emit_at(buf, count, "%s=%pe ", altmode_names[i],
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
index 643f04f48343..62e92aed76c7 100644
--- a/drivers/usb/typec/mode_selection.h
+++ b/drivers/usb/typec/mode_selection.h
@@ -1,5 +1,42 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
+
+#define TYPEC_SVID_TO_ALTMODE(svid) \
+	(((svid) == USB_TYPEC_DP_SID) ? TYPEC_ALTMODE_DP : \
+	 ((svid) == USB_TYPEC_TBT_SID) ? TYPEC_ALTMODE_TBT : TYPEC_ALTMODE_MAX)
+
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
index 7ca2040ee1e4..46b0ab2b8f5d 100644
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
2.50.0.rc1.591.g9c95f17f64-goog

