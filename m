Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908E264F96
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333419; cv=none; b=F5nh80EFNMN4iWf8zzSr5DIkGiVl9BzrDQwmsLObvvKoP3n7/cmDAy3PuBtPywDv93nL4wD4WoD36HCro3PeLuYbShwmgdSARdM/oPjGtOuT5rgzFl9ho8i8W0PeBfrs/Lb1z20cfg17VDn3IdpLaX5F953gVPKCXa9Jcnahsuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333419; c=relaxed/simple;
	bh=BoLj1Ak1vQggmph+8uK4dV+pjb1sx6KyTa/pSg/IZEU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtif8GxDBvkj842aQA8blrlPHihtSOxqPVH+aiVlJV0rqcDgSBdyXiWiQouWeKUskvFK40/8BpHSfrqblt83XIsQ9baRH4rzNDWloFSi9PsA3+BREEPe9K3KMN3WuqCwrAIoQfcw1faZoBSOm60q7kwrQXWHsZnDbsw/Cni4kV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=nJekHMD1; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="nJekHMD1"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c59e7039eeso176796585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333416; x=1747938216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36BQafovF1Ac1o8l66KKhJYbiIRxHdYx4gFtUfBj6co=;
        b=nJekHMD16tyWs1ffW41eSjbKSlKniY9+40Cv939H24YdSE6PfNb+DiJwmOOkZM/WYQ
         +yOVa+06mgYb1IPghszJvcAntpme1l6kM/BWTL3CdTcLFXkzkMfTGJfHPyxTXsdCRkwW
         tA9msQXdKFxAIsLdX9F20E3FJsPjgghffpJECv1CMAPkCrdVhtHYLnZ5Dm2tlyHcVg9K
         DoSSRj6RQ+QPUS8OGsDLVgWlijq9OM+6FDEq270aIFxah1BkkEkZguAqU+kLhAaeVni+
         d8+gSeJi/23tI+KyAqnUZzqyKYEBBHAS0Oas3CpP0GvszXAOoZL/gUl/zke/tjxKJIga
         j+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333416; x=1747938216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36BQafovF1Ac1o8l66KKhJYbiIRxHdYx4gFtUfBj6co=;
        b=ohpmvrNvB6CIqoxx+/F822UvvIR7R79n6KMpZdDHfKr5qqNMyIUvA/WrBlBBItaKsn
         PorEVWjXknoDBAECRZ8wRwofpEKbsjjqYTdwtEd/76Wj5PYDymRdOND28gPR453ztcQv
         0ovt5Uv364GnzIBqPH7OWZx2+2NU/3as32T8ssVhqfMvjlKuUG1Pv1w1XcdP1oy2waAu
         H/qz7cq7TXvJAotgaXNoqE4Bg+UtEX6vmsnCvfDEqp1QLGVGcTZlsmdYYWYm5pw9ZQ9t
         AIPYjK8J6wYi7YKFAuisC/IwWy3vyAx/eFJtgOdzPQj2vRa26UY4PvbnTNUfy7DoO1uD
         os7g==
X-Forwarded-Encrypted: i=1; AJvYcCWFhWi+TqR8sjNzvTKTu7nAFuOTrlHd26m5E6IrpIvM4VxHOEDAlgjJ5/CVDFZc7slSAaxNCwuJlDnRdNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2NnHrlqmgAdNuOrgeHUHUc7DWxconHWRlMvHex3Hujgx4Eug
	m3+H8uGE0Y9ZSGAX63J2dnurUsYvLQe9WF/UspoB3ZB0uIhADQsR6pITyB4vccJK8TU=
X-Gm-Gg: ASbGncsQKMSw3mpBMhCeCmNg1UmcaIT2ghBTG6Am1WyjggIrzTYiPvG6qBr4/gd8viF
	NN/A255NZcCHY6LkiAed2iYNtfNvyr3XJ2GCqoeubyj5ORD1rPqKNMjqGcqv/Ervs1vpWkorG1F
	DqPs7kpL7Vb3MrpNnFZuns9H7RvtmqxaAoPjIM+2lLlMEyO8JblYSZHf0pruBaBvo8vQfeoOBBx
	K1sXUGcUVcMKhhDL4dk008DrxQbU9C+UzW64mOlsHgjryNRqCDWSKy07y1G5T2ubySfQK8cZQZh
	8ptF6Xb6wz3SpNyqc96OiJcHBaOH02dK7yT4wd1Zd01D5TtJlERi9H7Eu86TFo/YWXYDb7HZXka
	le359OyVPf9sz90J1Hbwemn+tq2y3SmHgsx3P9Lr3ZdgX
X-Google-Smtp-Source: AGHT+IHZNr27zFQP0NtQYhUod6TNi4DfrQJByS+jzjJRT8QrvEWlLHAp4pGsYYNOuKcOvMxot8QTuA==
X-Received: by 2002:a05:620a:bcb:b0:7ca:f3e2:92b0 with SMTP id af79cd13be357-7cd4670b0c5mr66666785a.3.1747333415512;
        Thu, 15 May 2025 11:23:35 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:34 -0700 (PDT)
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
Subject: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
Date: Thu, 15 May 2025 18:23:10 +0000
Message-ID: <20250515182322.117840-7-pasha.tatashin@soleen.com>
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

Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
drivers) to register with LUO and participate in the live update process
via callbacks.

Subsystem Registration:
- Defines struct liveupdate_subsystem in linux/liveupdate.h,
  which subsystems use to provide their name and optional callbacks
  (prepare, freeze, cancel, finish). The callbacks accept
  a u64 *data intended for passing state/handles.
- Exports liveupdate_register_subsystem() and
  liveupdate_unregister_subsystem() API functions.
- Adds drivers/misc/liveupdate/luo_subsystems.c to manage a list
  of registered subsystems.
  Registration/unregistration is restricted to
  specific LUO states (NORMAL/UPDATED).

Callback Framework:
- The main luo_core.c state transition functions
  now delegate to new luo_do_subsystems_*_calls() functions
  defined in luo_subsystems.c.
- These new functions are intended to iterate through the registered
  subsystems and invoke their corresponding callbacks.

FDT Integration:
- Adds a /subsystems subnode within the main LUO FDT created in
  luo_core.c. This node has its own compatibility string
  (subsystems-v1).
- luo_subsystems_fdt_setup() populates this node by adding a
  property for each registered subsystem, using the subsystem's
  name.
  Currently, these properties are initialized with a placeholder
  u64 value (0).
- luo_subsystems_startup() is called from luo_core.c on boot to
  find and validate the /subsystems node in the FDT received via
  KHO. It panics if the node is missing or incompatible.
- Adds a stub API function liveupdate_get_subsystem_data() intended
  for subsystems to retrieve their persisted u64 data from the FDT
      in the new kernel.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/Makefile         |   1 +
 drivers/misc/liveupdate/luo_core.c       |  19 +-
 drivers/misc/liveupdate/luo_internal.h   |   7 +
 drivers/misc/liveupdate/luo_subsystems.c | 284 +++++++++++++++++++++++
 include/linux/liveupdate.h               |  53 +++++
 5 files changed, 362 insertions(+), 2 deletions(-)
 create mode 100644 drivers/misc/liveupdate/luo_subsystems.c

diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
index 3bfb4b9fed11..df1c9709ba4f 100644
--- a/drivers/misc/liveupdate/Makefile
+++ b/drivers/misc/liveupdate/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= luo_core.o
+obj-y					+= luo_subsystems.o
diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
index a76e886bc3b1..417e7f6bf36c 100644
--- a/drivers/misc/liveupdate/luo_core.c
+++ b/drivers/misc/liveupdate/luo_core.c
@@ -110,6 +110,10 @@ static int luo_fdt_setup(struct kho_serialization *ser)
 	if (ret)
 		goto exit_free;
 
+	ret = luo_subsystems_fdt_setup(fdt_out);
+	if (ret)
+		goto exit_free;
+
 	ret = kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
 	if (ret)
 		goto exit_free;
@@ -139,20 +143,30 @@ static void luo_fdt_destroy(void)
 
 static int luo_do_prepare_calls(void)
 {
-	return 0;
+	int ret;
+
+	ret = luo_do_subsystems_prepare_calls();
+
+	return ret;
 }
 
 static int luo_do_freeze_calls(void)
 {
-	return 0;
+	int ret;
+
+	ret = luo_do_subsystems_freeze_calls();
+
+	return ret;
 }
 
 static void luo_do_finish_calls(void)
 {
+	luo_do_subsystems_finish_calls();
 }
 
 static void luo_do_cancel_calls(void)
 {
+	luo_do_subsystems_cancel_calls();
 }
 
 static int __luo_prepare(struct kho_serialization *ser)
@@ -422,6 +436,7 @@ static int __init luo_startup(void)
 	}
 
 	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
+	luo_subsystems_startup(luo_fdt_in);
 
 	return 0;
 }
diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
index 34e73fb0318c..63a8b93254a6 100644
--- a/drivers/misc/liveupdate/luo_internal.h
+++ b/drivers/misc/liveupdate/luo_internal.h
@@ -16,6 +16,13 @@ int luo_finish(void);
 void luo_state_read_enter(void);
 void luo_state_read_exit(void);
 
+void luo_subsystems_startup(void *fdt);
+int luo_subsystems_fdt_setup(void *fdt);
+int luo_do_subsystems_prepare_calls(void);
+int luo_do_subsystems_freeze_calls(void);
+void luo_do_subsystems_finish_calls(void);
+void luo_do_subsystems_cancel_calls(void);
+
 extern const char *const luo_state_str[];
 
 /* Get the current state as a string */
diff --git a/drivers/misc/liveupdate/luo_subsystems.c b/drivers/misc/liveupdate/luo_subsystems.c
new file mode 100644
index 000000000000..436929a17de0
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_subsystems.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO Subsystems support
+ *
+ * Various kernel subsystems register with the Live Update Orchestrator to
+ * participate in the live update process. These subsystems are notified at
+ * different stages of the live update sequence, allowing them to serialize
+ * device state before the reboot and restore it afterwards. Examples include
+ * the device layer, interrupt controllers, KVM, IOMMU, and specific device
+ * drivers.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/libfdt.h>
+#include <linux/liveupdate.h>
+#include <linux/mutex.h>
+#include <linux/string.h>
+#include "luo_internal.h"
+
+#define LUO_SUBSYSTEMS_NODE_NAME	"subsystems"
+#define LUO_SUBSYSTEMS_COMPATIBLE	"subsystems-v1"
+
+static DEFINE_MUTEX(luo_subsystem_list_mutex);
+static LIST_HEAD(luo_subsystems_list);
+static void *luo_fdt_out;
+static void *luo_fdt_in;
+
+/**
+ * luo_subsystems_fdt_setup - Adds and populates the 'subsystems' node in the
+ * FDT.
+ * @fdt: Pointer to the LUO FDT blob.
+ *
+ * Add subsystems node and each subsystem to the LUO FDT blob.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int luo_subsystems_fdt_setup(void *fdt)
+{
+	struct liveupdate_subsystem *subsystem;
+	const u64 zero_data = 0;
+	int ret, node_offset;
+
+	ret = fdt_add_subnode(fdt, 0, LUO_SUBSYSTEMS_NODE_NAME);
+	if (ret < 0)
+		goto exit_error;
+
+	node_offset = ret;
+	ret = fdt_setprop_string(fdt, node_offset, "compatible",
+				 LUO_SUBSYSTEMS_COMPATIBLE);
+	if (ret < 0)
+		goto exit_error;
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		ret = fdt_setprop(fdt, node_offset, subsystem->name,
+				  &zero_data, sizeof(zero_data));
+		if (ret < 0)
+			goto exit_error;
+	}
+
+	luo_fdt_out = fdt;
+	return 0;
+exit_error:
+	pr_err("Failed to setup 'subsystems' node to FDT: %s\n",
+	       fdt_strerror(ret));
+	return -ENOSPC;
+}
+
+/**
+ * luo_subsystems_startup - Validates the LUO subsystems FDT node at startup.
+ * @fdt: Pointer to the LUO FDT blob passed from the previous kernel.
+ *
+ * This __init function checks the existence and validity of the '/subsystems'
+ * node in the FDT. This node is considered mandatory. It calls panic() if
+ * the node is missing, inaccessible, or invalid (e.g., missing compatible,
+ * wrong compatible string), indicating a critical configuration error for LUO.
+ */
+void __init luo_subsystems_startup(void *fdt)
+{
+	int ret, node_offset;
+
+	node_offset = fdt_subnode_offset(fdt, 0, LUO_SUBSYSTEMS_NODE_NAME);
+	if (node_offset < 0)
+		panic("Failed to find /subsystems node\n");
+
+	ret = fdt_node_check_compatible(fdt, node_offset,
+					LUO_SUBSYSTEMS_COMPATIBLE);
+	if (ret) {
+		panic("FDT '%s' is incompatible with '%s' [%d]\n",
+		      LUO_SUBSYSTEMS_NODE_NAME, LUO_SUBSYSTEMS_COMPATIBLE, ret);
+	}
+	luo_fdt_in = fdt;
+}
+
+/**
+ * luo_do_subsystems_prepare_calls - Calls prepare callbacks and updates FDT
+ * if all prepares succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'prepare' for all subsystems and stores results temporarily.
+ * If any 'prepare' fails, calls 'cancel' on previously prepared subsystems
+ * and returns the error.
+ * Phase 2: If all 'prepare' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* prepared subsystems and
+ * returns the FDT error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_subsystems_prepare_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_subsystems_freeze_calls - Calls freeze callbacks and updates FDT
+ * if all freezes succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'freeze' for all subsystems and stores results temporarily.
+ * If any 'freeze' fails, calls 'cancel' on previously called subsystems
+ * and returns the error.
+ * Phase 2: If all 'freeze' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* subsystems and
+ * returns the FDT error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_subsystems_freeze_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_subsystems_finish_calls- Calls finish callbacks for all subsystems.
+ *
+ * This function is called at the end of live update cycle to do the final
+ * clean-up or housekeeping of the post-live update states.
+ */
+void luo_do_subsystems_finish_calls(void)
+{
+}
+
+/**
+ * luo_do_subsystems_cancel_calls - Calls cancel callbacks for all subsystems.
+ *
+ * This function is typically called when the live update process needs to be
+ * aborted externally, for example, after the prepare phase may have run but
+ * before actual reboot. It iterates through all registered subsystems and calls
+ * the 'cancel' callback for those that implement it and likely completed
+ * prepare.
+ */
+void luo_do_subsystems_cancel_calls(void)
+{
+}
+
+/**
+ * liveupdate_register_subsystem - Register a kernel subsystem handler with LUO
+ * @h: Pointer to the liveupdate_subsystem structure allocated and populated
+ * by the calling subsystem.
+ *
+ * Registers a subsystem handler that provides callbacks for different events
+ * of the live update cycle. Registration is typically done during the
+ * subsystem's module init or core initialization.
+ *
+ * Can only be called when LUO is in the NORMAL or UPDATED states.
+ * The provided name (@h->name) must be unique among registered subsystems.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int liveupdate_register_subsystem(struct liveupdate_subsystem *h)
+{
+	struct liveupdate_subsystem *iter;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	mutex_lock(&luo_subsystem_list_mutex);
+	list_for_each_entry(iter, &luo_subsystems_list, list) {
+		if (iter == h) {
+			pr_warn("Subsystem '%s' (%p) already registered.\n",
+				h->name, h);
+			ret = -EEXIST;
+			goto out_unlock;
+		}
+
+		if (!strcmp(iter->name, h->name)) {
+			pr_err("Subsystem with name '%s' already registered.\n",
+			       h->name);
+			ret = -EEXIST;
+			goto out_unlock;
+		}
+	}
+
+	INIT_LIST_HEAD(&h->list);
+	list_add_tail(&h->list, &luo_subsystems_list);
+
+out_unlock:
+	mutex_unlock(&luo_subsystem_list_mutex);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_register_subsystem);
+
+/**
+ * liveupdate_unregister_subsystem - Unregister a kernel subsystem handler from
+ * LUO
+ * @h: Pointer to the same liveupdate_subsystem structure that was used during
+ * registration.
+ *
+ * Unregisters a previously registered subsystem handler. Typically called
+ * during module exit or subsystem teardown. LUO removes the structure from its
+ * internal list; the caller is responsible for any necessary memory cleanup
+ * of the structure itself.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ * -EINVAL if h is NULL.
+ * -ENOENT if the specified handler @h is not found in the registration list.
+ * -EBUSY if LUO is not in the NORMAL state.
+ */
+int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
+{
+	struct liveupdate_subsystem *iter;
+	bool found = false;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	mutex_lock(&luo_subsystem_list_mutex);
+	list_for_each_entry(iter, &luo_subsystems_list, list) {
+		if (iter == h) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		list_del_init(&h->list);
+	} else {
+		pr_warn("Subsystem handler '%s' not found for unregistration.\n",
+			h->name);
+		ret = -ENOENT;
+	}
+
+	mutex_unlock(&luo_subsystem_list_mutex);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
+
+/**
+ * liveupdate_get_subsystem_data - Retrieve raw private data for a subsystem
+ * from FDT.
+ * @h:      Pointer to the liveupdate_subsystem structure representing the
+ * subsystem instance. The 'name' field is used to find the property.
+ * @data:   Output pointer where the subsystem's raw private u64 data will be
+ * stored via memcpy.
+ *
+ * Reads the 8-byte data property associated with the subsystem @h->name
+ * directly from the '/subsystems' node within the globally accessible
+ * 'luo_fdt_in' blob. Returns appropriate error codes if inputs are invalid, or
+ * nodes/properties are missing or invalid.
+ *
+ * Return:  0 on success. -ENOENT on error.
+ */
+int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(liveupdate_get_subsystem_data);
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index c2740da70958..7a130680b5f2 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -86,6 +86,39 @@ enum liveupdate_state  {
 	LIVEUPDATE_STATE_UPDATED = 3,
 };
 
+/**
+ * struct liveupdate_subsystem - Represents a subsystem participating in LUO
+ * @prepare:      Optional. Called during LUO prepare phase. Should perform
+ *                preparatory actions and can store a u64 handle/state
+ *                via the 'data' pointer for use in later callbacks.
+ *                Return 0 on success, negative error code on failure.
+ * @freeze:       Optional. Called during LUO freeze event (before actual jump
+ *                to new kernel). Should perform final state saving actions and
+ *                can update the u64 handle/state via the 'data' pointer. Retur:
+ *                0 on success, negative error code on failure.
+ * @cancel:       Optional. Called if the live update process is canceled after
+ *                prepare (or freeze) was called. Receives the u64 data
+ *                set by prepare/freeze. Used for cleanup.
+ * @finish:       Optional. Called after the live update is finished in the new
+ *                kernel.
+ *                Receives the u64 data set by prepare/freeze. Used for cleanup.
+ * @name:         Mandatory. Unique name identifying the subsystem.
+ * @arg:          Add this argument to callback functions.
+ * @list:         List head used internally by LUO. Should not be modified by
+ *                caller after registration.
+ * @private_data: For LUO internal use, cached value of data field.
+ */
+struct liveupdate_subsystem {
+	int (*prepare)(void *arg, u64 *data);
+	int (*freeze)(void *arg, u64 *data);
+	void (*cancel)(void *arg, u64 data);
+	void (*finish)(void *arg, u64 data);
+	const char *name;
+	void *arg;
+	struct list_head list;
+	u64 private_data;
+};
+
 #ifdef CONFIG_LIVEUPDATE
 
 /* Return true if live update orchestrator is enabled */
@@ -105,6 +138,10 @@ bool liveupdate_state_updated(void);
  */
 bool liveupdate_state_normal(void);
 
+int liveupdate_register_subsystem(struct liveupdate_subsystem *h);
+int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
+int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
+
 #else /* CONFIG_LIVEUPDATE */
 
 static inline int liveupdate_reboot(void)
@@ -127,5 +164,21 @@ static inline bool liveupdate_state_normal(void)
 	return true;
 }
 
+static inline int liveupdate_register_subsystem(struct liveupdate_subsystem *h)
+{
+	return 0;
+}
+
+static inline int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
+{
+	return 0;
+}
+
+static inline int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h,
+						u64 *data)
+{
+	return -ENODATA;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
-- 
2.49.0.1101.gccaa498523-goog

