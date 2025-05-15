Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA91267700
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333426; cv=none; b=CEffVCQuf3fv4iU7G4IxjqnduejWhfnZgquXLCiPCuIdh0p6/dNO0UuJh4UNijZdGSpClyha+CBmUlhbxRSk5BDrkP7wgRrzoI7Btponyj78ingA5P5OUQBuT8SJxdJMVrvYBeR78PgXHYXiuQsYCLHUyYM0j91s6phSExqkJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333426; c=relaxed/simple;
	bh=IyCI45gm7LvyaR79piBMSG0ktcYZBhXIdzy96OlDz54=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2/rosisSd1V1dBK+TDa8HAN8ZCcYZle7zOXTx/nkiyeeWL5hQSgsOb2o6QfGb6v7TN6z9gQHszcSpPKjGmKNhSqMZALVsY2VGTUsuA7wa5cI8oBVvO2LByHyidehTcFXn2z40sxsXfh3i/S2Gx32TtScF2E8Y/Q8ITDz2AUdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=M1GslH8J; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="M1GslH8J"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c9376c4dbaso153710885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333423; x=1747938223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltL7NUHX20pXkC0VOJlR8mGY0Kaj9UtnVW/UYNskncc=;
        b=M1GslH8JrorVmR+H2/9OeorU98xcvezDrGCwrd9/70MxJFKlGVY/DntnGwfON721Tr
         wh5vpapv/14DR8f/Ygs/ssSQkOUXS76KASdDy4eKFtwBH+rIyWfrXYcoPT7GjeNfGGgs
         +5kMeslWFCLyPmW4JrCSCry4jT6wYhrdqffuC1Qq+RVk+EhldD/YXaB0XcvuCQmP17/q
         P/Dg664Tk6hszisxvKJHzZKWCT0fZBHq13Z7oYFOLU+nQkMYxfE3nWOur0Hh4ZX3h4Yq
         FEZRJi1wKKmXfqaMgS58TOruX87uSKpUIj3KHmPn64CeS5n6ykZO2B7BVSTd8DeW33rz
         6h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333423; x=1747938223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltL7NUHX20pXkC0VOJlR8mGY0Kaj9UtnVW/UYNskncc=;
        b=A4Mys3Gkamyq6SkhQZfBwjRabv+JjwgjINcUnPtGMMXBzPcA2o3ZU2wNIp1/BOnChx
         fixCqpsHbfWIlwbs7mRpwMPaPCok7tvvDC2GIQWryY45kWeCoKh9a/6aAQ2J2z9/JKyZ
         BeqgROTpnbJ+935x3ZzamV2MTLqH3DXAX41NF9nOMJECYgojMJAqm+14OKQas779kdn2
         uOK7+2OdGjCQba/QfrRYpzj2OzAGZqLD6+IVO0bAq3YOQcJIChUsRRqGDYWBdx78KEnf
         muj/SrvQQ1Rnk0rqgdek3SZwn6U0m9yh5/CYaVmineiicpRzOPdkoGG0sqlRYPwaacT8
         xo3w==
X-Forwarded-Encrypted: i=1; AJvYcCUaKsgNbxY3KbswPy1/4HKeaRGIt46y9eWHX0NPyXd/XWQGjUqTO2aPwUoHCcBWlktpWs85dDX3qEpoce8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tzTqA3aSNfdiSZlQieTvaBqwRqnCfRkRa39NPQ6XyMoUJdfc
	A60hmJXQROxci/oOMiV9WjysnYGK0hElwuZkorX/ff9SbmpalcsXvjUQS1nm8dxyWIE=
X-Gm-Gg: ASbGncuf+4MpqS24YbbMD0Ev0WqW4rnIMEUGS60Y2KCbnpi8zaRSzqzEclQp9TWkgLg
	DpGdepcEVQeoFOGZrW8G8h6nz5g1T7V+XUogKnEXvX1Jh7aPJE8oapSomzvt4m5j6H3zZS4iaas
	yVpLGWuCDYLJX7Ae1q7mwaZ3cWlAaKm86pnMWo/FYXv7QVpwdMR0O8QW5aZCinqazLzzXTK1KlQ
	+qQpmJctyjAr6ODpwQo929J+aH93GbilpkPfchAP03BauphjenWXh0Aya/UTkf4GOCwTRBuf/C7
	fhf440s+5tJ4b0qXkVTPzGPTi+iGJBaGpbGa/b8x5cw6vlaEhDGIbWxyFhvyhXG1obi9sG5pBAY
	aTmm5OR3bxO44P3HO/n5KMRrgC+MsNyCqXj9Njh2nBzZ1
X-Google-Smtp-Source: AGHT+IE+XvR/Oap8/b8tQ4cy4ncNNrPm3HTXrnPFPzaqq9DTCDamdPUIr8DrHH9ecT3KnE+qPIT/Rw==
X-Received: by 2002:a05:620a:880b:b0:7c0:5b5d:c82b with SMTP id af79cd13be357-7cd39e37279mr705912185a.28.1747333422544;
        Thu, 15 May 2025 11:23:42 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:41 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 11/16] luo: luo_sysfs: add sysfs state monitoring
Date: Thu, 15 May 2025 18:23:15 +0000
Message-ID: <20250515182322.117840-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a sysfs interface for the Live Update Orchestrator
under /sys/kernel/liveupdate/. This interface provides a way for
userspace tools and scripts to monitor the current state of the LUO
state machine.

The main feature is a read-only file, state, which displays the
current LUO state as a string ("normal", "prepared", "frozen",
"updated"). The interface uses sysfs_notify to allow userspace
listeners (e.g., via poll) to be efficiently notified of state changes.

ABI documentation for this new sysfs interface is added in
Documentation/ABI/testing/sysfs-kernel-liveupdate.

This read-only sysfs interface complements the main ioctl interface
provided by /dev/liveupdate, which handles LUO control operations and
resource management.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../ABI/testing/sysfs-kernel-liveupdate       | 51 ++++++++++
 drivers/misc/liveupdate/Kconfig               | 18 ++++
 drivers/misc/liveupdate/Makefile              |  1 +
 drivers/misc/liveupdate/luo_core.c            |  1 +
 drivers/misc/liveupdate/luo_internal.h        |  6 ++
 drivers/misc/liveupdate/luo_sysfs.c           | 92 +++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-liveupdate
 create mode 100644 drivers/misc/liveupdate/luo_sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-kernel-liveupdate b/Documentation/ABI/testing/sysfs-kernel-liveupdate
new file mode 100644
index 000000000000..7631410a10c3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-liveupdate
@@ -0,0 +1,51 @@
+What:		/sys/kernel/liveupdate/
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	pasha.tatashin@soleen.com
+Description:	Directory containing interfaces to query the live
+		update orchestrator. Live update is the ability to reboot the
+		host kernel (e.g., via kexec, without a full power cycle) while
+		keeping specifically designated devices operational ("alive")
+		across the transition. After the new kernel boots, these devices
+		can be re-attached to their original workloads (e.g., virtual
+		machines) with their state preserved. This is particularly
+		useful, for example, for quick hypervisor updates without
+		terminating running virtual machines.
+
+
+What:		/sys/kernel/liveupdate/state
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	pasha.tatashin@soleen.com
+Description:	Read-only file that displays the current state of the live
+		update orchestrator as a string. Possible values are:
+
+		"normal":	No live update operation is in progress. This is
+				the default operational state.
+
+		"prepared":	The live update preparation phase has completed
+				successfully (e.g., triggered via the 'prepare'
+				file). Kernel subsystems have been notified via
+				the %LIVEUPDATE_PREPARE event/callback and
+				should have initiated state saving. User
+				workloads (e.g., VMs) are generally still
+				running, but some operations (like device
+				unbinding or new DMA mappings) might be
+				restricted. The system is ready for the reboot
+				trigger.
+
+		"frozen":	The final reboot notification has been sent
+				(e.g., triggered via the 'reboot' file),
+				corresponding to the %LIVEUPDATE_REBOOT kernel
+				event. Subsystems have had their final chance to
+				save state. User workloads must be suspended.
+				The system is about to execute the reboot into
+				the new kernel (imminent kexec). This state
+				corresponds to the "blackout window".
+
+		"updated":	The system has successfully rebooted into the
+				new kernel via live update. Restoration of
+				preserved resources can now occur (typically via
+				ioctl commands). The system is awaiting the
+				final 'finish' signal after user space completes
+				restoration tasks.
diff --git a/drivers/misc/liveupdate/Kconfig b/drivers/misc/liveupdate/Kconfig
index a7424ceeba0b..09940f9a724a 100644
--- a/drivers/misc/liveupdate/Kconfig
+++ b/drivers/misc/liveupdate/Kconfig
@@ -25,3 +25,21 @@ config LIVEUPDATE
 	  running virtual machines.
 
 	  If unsure, say N.
+
+config LIVEUPDATE_SYSFS_API
+	bool "Live Update sysfs monitoring interface"
+	depends on SYSFS
+	depends on LIVEUPDATE
+	help
+	  Enable a sysfs interface for the Live Update Orchestrator
+	  at /sys/kernel/liveupdate/.
+
+	  This allows monitoring the LUO state ('normal', 'prepared',
+	  'frozen', 'updated') via the read-only 'state' file.
+
+	  This interface complements the primary /dev/liveupdate ioctl
+	  interface, which handles the full update process.
+	  This sysfs API may be useful for scripting, or userspace monitoring
+	  needed to coordinate application restarts and minimize downtime.
+
+	  If unsure, say N.
diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
index 7a0cd08919c9..190323c10220 100644
--- a/drivers/misc/liveupdate/Makefile
+++ b/drivers/misc/liveupdate/Makefile
@@ -3,3 +3,4 @@ obj-y					+= luo_ioctl.o
 obj-y					+= luo_core.o
 obj-y					+= luo_files.o
 obj-y					+= luo_subsystems.o
+obj-$(CONFIG_LIVEUPDATE_SYSFS_API)	+= luo_sysfs.o
diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
index ab1d76221fe2..1a5163c116a4 100644
--- a/drivers/misc/liveupdate/luo_core.c
+++ b/drivers/misc/liveupdate/luo_core.c
@@ -79,6 +79,7 @@ static inline bool is_current_luo_state(enum liveupdate_state expected_state)
 static void __luo_set_state(enum liveupdate_state state)
 {
 	WRITE_ONCE(luo_state, state);
+	luo_sysfs_notify();
 }
 
 static inline void luo_set_state(enum liveupdate_state state)
diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
index b7a0f31ddc99..bf1ba18722e2 100644
--- a/drivers/misc/liveupdate/luo_internal.h
+++ b/drivers/misc/liveupdate/luo_internal.h
@@ -34,6 +34,12 @@ int luo_retrieve_file(u64 token, struct file **file);
 int luo_register_file(u64 *token, struct file *file);
 int luo_unregister_file(u64 token);
 
+#ifdef CONFIG_LIVEUPDATE_SYSFS_API
+void luo_sysfs_notify(void);
+#else
+static inline void luo_sysfs_notify(void) {}
+#endif
+
 extern const char *const luo_state_str[];
 
 /* Get the current state as a string */
diff --git a/drivers/misc/liveupdate/luo_sysfs.c b/drivers/misc/liveupdate/luo_sysfs.c
new file mode 100644
index 000000000000..756b341dd886
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_sysfs.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO sysfs interface
+ *
+ * Provides a sysfs interface at ``/sys/kernel/liveupdate/`` for monitoring LUO
+ * state.  Live update allows rebooting the kernel (via kexec) while preserving
+ * designated device state for attached workloads (e.g., VMs), useful for
+ * minimizing downtime during hypervisor updates.
+ *
+ * /sys/kernel/liveupdate/state
+ * ----------------------------
+ * - Permissions:  Read-only
+ * - Description:  Displays the current LUO state string.
+ * - Valid States:
+ *     @normal
+ *       Idle state.
+ *     @prepared
+ *       Preparation phase complete (triggered via 'prepare'). Resources
+ *       checked, state saving initiated via %LIVEUPDATE_PREPARE event.
+ *       Workloads mostly running but may be restricted. Ready forreboot
+ *       trigger.
+ *     @frozen
+ *       Final reboot notification sent (triggered via 'reboot'). Corresponds to
+ *       %LIVEUPDATE_REBOOT event. Final state saving. Workloads must be
+ *       suspended. System about to kexec ("blackout window").
+ *     @updated
+ *       New kernel booted via live update. Awaiting 'finish' signal.
+ *
+ * Userspace Interaction & Blackout Window Reduction
+ * -------------------------------------------------
+ * Userspace monitors the ``state`` file to coordinate actions:
+ *   - Suspend workloads before @frozen state is entered.
+ *   - Initiate resource restoration upon entering @updated state.
+ *   - Resume workloads after restoration, minimizing downtime.
+ */
+
+#include <linux/kobject.h>
+#include <linux/liveupdate.h>
+#include <linux/sysfs.h>
+#include "luo_internal.h"
+
+static bool luo_sysfs_initialized;
+
+#define LUO_DIR_NAME	"liveupdate"
+
+void luo_sysfs_notify(void)
+{
+	if (luo_sysfs_initialized)
+		sysfs_notify(kernel_kobj, LUO_DIR_NAME, "state");
+}
+
+/* Show the current live update state */
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LUO_STATE_STR);
+}
+
+static struct kobj_attribute state_attribute = __ATTR_RO(state);
+
+static struct attribute *luo_attrs[] = {
+	&state_attribute.attr,
+	NULL
+};
+
+static struct attribute_group luo_attr_group = {
+	.attrs = luo_attrs,
+	.name = LUO_DIR_NAME,
+};
+
+static int __init luo_init(void)
+{
+	int ret;
+
+	ret = sysfs_create_group(kernel_kobj, &luo_attr_group);
+	if (ret) {
+		pr_err("Failed to create group\n");
+		return ret;
+	}
+
+	luo_sysfs_initialized = true;
+	pr_info("Initialized\n");
+
+	return 0;
+}
+subsys_initcall(luo_init);
-- 
2.49.0.1101.gccaa498523-goog

