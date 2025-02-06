Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7056215F52;
	Thu,  6 Feb 2025 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851587; cv=none; b=G8dfStn+yYNJFyhnZuQzWHDDMWeIECgK/qV4+mALcLzZqOlrKmWzjR6BpHk3Z3ftfRMmBO6xR7W0kL83UhSNF7q8Z1ZhpSX/kz7zYfOB/xyggSGExXyLE2/isBXBP2sMV5k9oHYIFyP8+JflGeoGdhUcryAOBqRpXWoI2hi3axE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851587; c=relaxed/simple;
	bh=wk46ujDYbje+fD/ko0oiX1Lk4Y/S72U1noDjKpDyGtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9OhjwmFrIEse3NZyF1U+AMF/Bt+INEba2XLWVfosRf7jnGLzDGrrz8lBZ2DHqCM9hHd7ELHlLMlYI41OvZ7j025gkb5XS45e8xL2mlVj9EdYOhQBLo3yqW7wwKCwI1rxaRc+fJhXzwfnZEyk7CGZKFBChmdl5RrFifYK/8hnVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdxkuXEb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdxkuXEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738851586; x=1770387586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wk46ujDYbje+fD/ko0oiX1Lk4Y/S72U1noDjKpDyGtA=;
  b=EdxkuXEbtnPQl4wZNJ32NeTf5nrc7fSST6pNR9WFaGRtYa3rQ/0IGqhR
   Jk/TujPA6j3wxV1sVm1ecnZnUT76283OKAatRDB9w3PRi2K/tzAl6/xWw
   0p1hyXtXzzy0s/E5D8v5pOab/v0P0ZEROOMLaJsSQ72ERQqdZ7y1U1Ntb
   KDALCyM3qZCN6rzHWjhYousMmiJj2ECQEShLkL7n+Sntc4T1zw1ekyjiW
   RXQitzzpwts3NKR8OYQJpEOtq3FAZBaMAlG0L/WfrOEHW8FhlbxpIHyXl
   tdUCNtxINYWbF6g0TwA4xYJlQmGLG7AIs6ItqD2tgZp/Ke9R1XFi3syts
   w==;
X-CSE-ConnectionGUID: +bmDLz+5RbGkweWU0DX1+A==
X-CSE-MsgGUID: chM1NOauTcqvtoQwzLHdvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27056892"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27056892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 06:19:45 -0800
X-CSE-ConnectionGUID: Vlp3+Yj0T2mTCAV3aXxmKg==
X-CSE-MsgGUID: cLfIM4AjRoW8t/a8H6kJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142118095"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2025 06:19:41 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	"Pathak, Asutosh" <asutosh.pathak@intel.com>,
	"Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] usb: typec: ucsi: Command mailbox interface for the userspace
Date: Thu,  6 Feb 2025 16:19:31 +0200
Message-ID: <20250206141936.1117222-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
References: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the UCSI commands can be used to configure the
entire Platform Policy Manager (PPM) instead of just
individual connectors. To allow the user space communicate
those commands with the PPM, adding a mailbox interface. The
interface is a single attribute file that represents the
main "OPM to PPM" UCSI data structure.

The mailbox allows any UCSI command to be sent to the PPM so
it should be also useful for validation, testing and
debugging purposes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-driver-ucsi |  20 +++
 drivers/usb/typec/ucsi/Makefile             |   2 +-
 drivers/usb/typec/ucsi/sysfs.c              | 127 ++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c               |  31 +++--
 drivers/usb/typec/ucsi/ucsi.h               |   7 ++
 5 files changed, 173 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ucsi
 create mode 100644 drivers/usb/typec/ucsi/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-driver-ucsi b/Documentation/ABI/testing/sysfs-driver-ucsi
new file mode 100644
index 000000000000..9da15577f4ae
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-ucsi
@@ -0,0 +1,20 @@
+What:		/sys/class/typec/<port>/device/ucsi
+Date:		February 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Command mailbox for UCSI (USB Type-C System Software Interface).
+
+		The mailbox contains a copy of the main UCSI data structure.
+		Sending a command happens by writing the command specific data
+		structure to the CONTROL offset just like defined in the UCSI
+		specification. When a command is written to the mailbox, it is
+		automatically forwarded to the Platform Policy Manager (PPM) of
+		the UCSI instance.
+
+		After writing the command to the mailbox, the result can be read
+		directly from the CCI and MESSAGE_IN offsets. The mailbox takes
+		care of command completion acknowledges automatically.
+
+		Note. The mailbox is meant, and can only be used for, sending
+		commands. I.e. the mailbox is not updated when the UCSI receives
+		asynchronous events.
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index be98a879104d..5ebc74e3055b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -3,7 +3,7 @@ CFLAGS_trace.o				:= -I$(src)
 
 obj-$(CONFIG_TYPEC_UCSI)		+= typec_ucsi.o
 
-typec_ucsi-y				:= ucsi.o
+typec_ucsi-y				:= ucsi.o sysfs.o
 
 typec_ucsi-$(CONFIG_DEBUG_FS)		+= debugfs.o
 
diff --git a/drivers/usb/typec/ucsi/sysfs.c b/drivers/usb/typec/ucsi/sysfs.c
new file mode 100644
index 000000000000..06ea1b54aefa
--- /dev/null
+++ b/drivers/usb/typec/ucsi/sysfs.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI sysfs mailbox.
+ *
+ * Copyright (C) 2025, Intel Corporation
+ */
+
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include "ucsi.h"
+
+#define UCSI_MAILBOX_SIZE(ucsi) ((ucsi)->version < UCSI_VERSION_2_0 ? 48 : 528)
+
+struct ucsi_sysfs {
+	struct bin_attribute	bin_attr;
+	struct ucsi		*ucsi;
+	struct mutex		lock; /* mailbox lock */
+	u8			mailbox[];
+};
+
+static ssize_t ucsi_read(struct file *filp, struct kobject *kobj,
+			 const struct bin_attribute *attr,
+			 char *buf, loff_t off, size_t count)
+{
+	struct ucsi_sysfs *sysfs = attr->private;
+
+	mutex_lock(&sysfs->lock);
+	memcpy(buf, sysfs->mailbox + off, count);
+	mutex_unlock(&sysfs->lock);
+
+	return count;
+}
+
+static ssize_t ucsi_write(struct file *filp, struct kobject *kobj,
+			  const struct bin_attribute *attr,
+			  char *buf, loff_t off, size_t count)
+{
+	struct ucsi_sysfs *sysfs = attr->private;
+	struct ucsi *ucsi = sysfs->ucsi;
+	int ret;
+
+	u64 *control = (u64 *)&sysfs->mailbox[UCSI_CONTROL];
+	u32 *cci = (u32 *)&sysfs->mailbox[UCSI_CCI];
+	void *data = &sysfs->mailbox[UCSI_MESSAGE_IN];
+
+	/* TODO: MESSAGE_OUT. */
+	if (off != UCSI_CONTROL || count != sizeof(*control))
+		return -EFAULT;
+
+	mutex_lock(&sysfs->lock);
+
+	memset(data, 0, UCSI_MAX_DATA_LENGTH(ucsi));
+
+	/* PPM_RESET has to be handled separately. */
+	*control = get_unaligned_le64(buf);
+	if (UCSI_COMMAND(*control) == UCSI_PPM_RESET) {
+		ret = ucsi_reset_ppm(ucsi, cci);
+		goto out_unlock_sysfs;
+	}
+
+	mutex_lock(&ucsi->ppm_lock);
+
+	ret = ucsi->ops->sync_control(ucsi, *control, cci, NULL, 0);
+	if (ret)
+		goto out_unlock_ppm;
+
+	if (UCSI_CCI_LENGTH(*cci) && ucsi->ops->read_message_in(ucsi, data, UCSI_CCI_LENGTH(*cci)))
+		dev_err(ucsi->dev, "failed to read MESSAGE_IN\n");
+
+	ret = ucsi->ops->sync_control(ucsi, UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE,
+				      NULL, NULL, 0);
+out_unlock_ppm:
+	mutex_unlock(&ucsi->ppm_lock);
+out_unlock_sysfs:
+	mutex_unlock(&sysfs->lock);
+
+	return ret ?: count;
+}
+
+int ucsi_sysfs_register(struct ucsi *ucsi)
+{
+	struct ucsi_sysfs *sysfs;
+	int ret;
+
+	sysfs = kzalloc(struct_size(sysfs, mailbox, UCSI_MAILBOX_SIZE(ucsi)), GFP_KERNEL);
+	if (!sysfs)
+		return -ENOMEM;
+
+	sysfs->ucsi = ucsi;
+	mutex_init(&sysfs->lock);
+	memcpy(sysfs->mailbox, &ucsi->version, sizeof(ucsi->version));
+
+	sysfs_bin_attr_init(&sysfs->bin_attr);
+
+	sysfs->bin_attr.attr.name = "ucsi";
+	sysfs->bin_attr.attr.mode = 0644;
+
+	sysfs->bin_attr.size = UCSI_MAILBOX_SIZE(ucsi);
+	sysfs->bin_attr.private = sysfs;
+	sysfs->bin_attr.read_new = ucsi_read;
+	sysfs->bin_attr.write_new = ucsi_write;
+
+	ret = sysfs_create_bin_file(&ucsi->dev->kobj, &sysfs->bin_attr);
+	if (ret)
+		kfree(sysfs);
+	else
+		ucsi->sysfs = sysfs;
+
+	return ret;
+}
+
+void ucsi_sysfs_unregister(struct ucsi *ucsi)
+{
+	struct ucsi_sysfs *sysfs = ucsi->sysfs;
+
+	if (!sysfs)
+		return;
+
+	sysfs_remove_bin_file(&ucsi->dev->kobj, &sysfs->bin_attr);
+	ucsi->sysfs = NULL;
+	kfree(sysfs);
+}
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 559390a07a4e..9dadfe879319 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1340,16 +1340,18 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 	return ucsi_send_command(con->ucsi, command, NULL, 0);
 }
 
-static int ucsi_reset_ppm(struct ucsi *ucsi)
+int ucsi_reset_ppm(struct ucsi *ucsi, u32 *cci)
 {
 	u64 command;
 	unsigned long tmo;
-	u32 cci;
+	u32 _cci;
 	int ret;
 
+	cci = cci ?: &_cci;
+
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi->ops->read_cci(ucsi, &cci);
+	ret = ucsi->ops->read_cci(ucsi, cci);
 	if (ret < 0)
 		goto out;
 
@@ -1359,7 +1361,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	 * UCSI_SET_NOTIFICATION_ENABLE command to achieve this.
 	 * Ignore a timeout and try the reset anyway if this fails.
 	 */
-	if (cci & UCSI_CCI_RESET_COMPLETE) {
+	if (*cci & UCSI_CCI_RESET_COMPLETE) {
 		command = UCSI_SET_NOTIFICATION_ENABLE;
 		ret = ucsi->ops->async_control(ucsi, command);
 		if (ret < 0)
@@ -1367,17 +1369,17 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
 		do {
-			ret = ucsi->ops->read_cci(ucsi, &cci);
+			ret = ucsi->ops->read_cci(ucsi, cci);
 			if (ret < 0)
 				goto out;
-			if (cci & UCSI_CCI_COMMAND_COMPLETE)
+			if (*cci & UCSI_CCI_COMMAND_COMPLETE)
 				break;
 			if (time_is_before_jiffies(tmo))
 				break;
 			msleep(20);
 		} while (1);
 
-		WARN_ON(cci & UCSI_CCI_RESET_COMPLETE);
+		WARN_ON(*cci & UCSI_CCI_RESET_COMPLETE);
 	}
 
 	command = UCSI_PPM_RESET;
@@ -1396,18 +1398,18 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 		/* Give the PPM time to process a reset before reading CCI */
 		msleep(20);
 
-		ret = ucsi->ops->read_cci(ucsi, &cci);
+		ret = ucsi->ops->read_cci(ucsi, cci);
 		if (ret)
 			goto out;
 
 		/* If the PPM is still doing something else, reset it again. */
-		if (cci & ~UCSI_CCI_RESET_COMPLETE) {
+		if (*cci & ~UCSI_CCI_RESET_COMPLETE) {
 			ret = ucsi->ops->async_control(ucsi, command);
 			if (ret < 0)
 				goto out;
 		}
 
-	} while (!(cci & UCSI_CCI_RESET_COMPLETE));
+	} while (!(*cci & UCSI_CCI_RESET_COMPLETE));
 
 out:
 	mutex_unlock(&ucsi->ppm_lock);
@@ -1423,7 +1425,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 		u64 c;
 
 		/* PPM most likely stopped responding. Resetting everything. */
-		ucsi_reset_ppm(con->ucsi);
+		ucsi_reset_ppm(con->ucsi, NULL);
 
 		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
 		ucsi_send_command(con->ucsi, c, NULL, 0);
@@ -1766,7 +1768,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	int i;
 
 	/* Reset the PPM */
-	ret = ucsi_reset_ppm(ucsi);
+	ret = ucsi_reset_ppm(ucsi, NULL);
 	if (ret) {
 		dev_err(ucsi->dev, "failed to reset PPM!\n");
 		goto err;
@@ -1846,7 +1848,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	kfree(connector);
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
-	ucsi_reset_ppm(ucsi);
+	ucsi_reset_ppm(ucsi, NULL);
 err:
 	return ret;
 }
@@ -1958,6 +1960,7 @@ EXPORT_SYMBOL_GPL(ucsi_create);
 void ucsi_destroy(struct ucsi *ucsi)
 {
 	ucsi_debugfs_unregister(ucsi);
+	ucsi_sysfs_unregister(ucsi);
 	kfree(ucsi);
 }
 EXPORT_SYMBOL_GPL(ucsi_destroy);
@@ -1989,6 +1992,8 @@ int ucsi_register(struct ucsi *ucsi)
 	queue_delayed_work(system_long_wq, &ucsi->work, 0);
 
 	ucsi_debugfs_register(ucsi);
+	ucsi_sysfs_register(ucsi);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ucsi_register);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index feb012db4c89..d5b90e57cf42 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -468,6 +468,8 @@ struct ucsi {
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
+
+	void *sysfs;
 };
 
 #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
@@ -535,6 +537,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
 int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
 			     void *data, size_t size);
 
+int ucsi_reset_ppm(struct ucsi *ucsi, u32 *cci);
+
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
 void ucsi_unregister_port_psy(struct ucsi_connector *con);
@@ -578,6 +582,9 @@ static inline void ucsi_debugfs_register(struct ucsi *ucsi) { }
 static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
 #endif /* CONFIG_DEBUG_FS */
 
+int ucsi_sysfs_register(struct ucsi *ucsi);
+void ucsi_sysfs_unregister(struct ucsi *ucsi);
+
 /*
  * NVIDIA VirtualLink (svid 0x955) has two altmode. VirtualLink
  * DP mode with vdo=0x1 and NVIDIA test mode with vdo=0x3
-- 
2.47.2

