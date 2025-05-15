Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025C265CC5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333423; cv=none; b=l4ULq89kZ2wyJMPBu3Sfx4lzTNhLLEAkK1dSIMDuj8qpo9NhRn2/t5RKe0edsQCp2au7MVs+hQ0UGrPBXu78ggQ3KjVXzSjgWb/C+7aRBu4UTSynoevCwA9uBtdzLXKxKIqmUGEq6DbAp+Z3goV1/fm+lbxDk+Ab+cnrKAbQLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333423; c=relaxed/simple;
	bh=LNJ7Yn25BV+W1LC7/VlfM1LG6ohTFEm6NdrbazXB0S0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0gCT7D5aWU3jufmGs0PxtJwaisrJDd0Rv5ggx/qXqInr55TsY33LlzgGLWklOk1urymkJSSr9iAPCS7N09pweA8d0+fEtTH/K1hYFGbegeD6H/k+T3z7b2+xKOuBpjnW+O/DyvvlcF9VDWDbma0BuDKAaFxqigdX5SPiM/UFDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=yfKrWokI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="yfKrWokI"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5b2472969so126964085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333418; x=1747938218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9X5I0ERJIQ3sR+dONy6m+vwr4x0n0wOEhUsfS8F8y4=;
        b=yfKrWokIELvJKsaB94A729Qpw8DkOPO6B7vGDmpsNwRzGz5P1SpqK0MCne7OhRERM3
         +URkADbiSGCEFdX3XpmT3sB9IzDPAxpYKOUWsPQJqrF+Wi2v0RDssjtEISzILEe8Xikk
         hcyDBBXe900+5VV04iBx4QMMr5/iHJVQFyfBhi7TqoohkDxdfFE23+jdKXTJ7iOgTwl2
         wx7EgNLjyhgfHNUoTKdvAamvoJXyyOkVa1fL/exFeNt9e/35gXo8+f/iIbS5G8SR8mGe
         wBxxmRWW2XmH5tQvwmi0XWvO8fpODz3SQBaSsWaJZH3G1guJWJ05SNZDKZhDD7lrd/Ep
         HXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333418; x=1747938218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9X5I0ERJIQ3sR+dONy6m+vwr4x0n0wOEhUsfS8F8y4=;
        b=GKR6u3Td6oRiMhoqcxvuvyKcqSHwETj3b94a/AWVjYGJ6YFYCEh0ljy+3IvxX/rdy2
         vWmtz1JGxSwPkzKNEKoGuTfmPc0y2sIjQf4BkgXsDB3yoTfFPYO8J43gV/tJlqxW0q0T
         rduwyE2g7lnR1VFjtC/z/iGGP/R+B5U6+NWu8ofJqtRn2JomKMLwygZxQKNt1asrJrle
         1/ZqFgY6SWuYepsm0McdfxVcuqMCKhifxFwaZGnXLdmriSFC01eWXjFxUn+w5F1SZPQT
         EBv9cOgTd0/3H9S9PEEgDGp/GKG2aMldxawLrvRLhzBAKNMTSsfAiw2rZ5pXCF/eUMme
         ullQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCKvLKO6nKexnR0WnS0lvWHAblMzZ5/7pWwCilabZuAmHJW5wI/mo+S/yzvoikHDXgllrtvF9asAnwj4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZBFdECiXxozvV6BfT+YEF2wkNyYmZ5OTuvHkxXDzVFfNI8BY
	WNOReW/2GHbJ9fDCXi8ZFJv92ahdABWg/IAglSXmgubmYUFNES/+0dEChuxWE4SLQrQ=
X-Gm-Gg: ASbGnctoghHFph9Z5bQ8MyfHyVu1+H6K2SMNoDwItGL8VUGTonAiKK3czOW0/ws6pdu
	tsMEwwD7H/98IATvvbKf881cKK0tCBrgsJ6YiU0g5G/JSKRrt0caXZPtAwag6sGQGehVFbVZa11
	ZMk3jjx0W1oAGOycYhQUQxL4S+9hr04WdCh5/ptZuNQipLJ/f7+pxvhG+vr4UZFW0MfRz+5oQE0
	IZBjNjL60YfuTfWd8xcjDgeRVAfwovvNhrzWLiy2dulitPL2jlmV93S5hWtYnDMqlCgKOT+t4Em
	+mMgZQVOujc3Pn0UjNi/5u4gcJKopCewxQtPbWgY6m3aKfA3gbVa1G78X1cEfKSsr50sbzgdCRW
	BtRqQkVTMdcrJeWTgKpS42c9V/Lv6AuaW+th9npA5dV52
X-Google-Smtp-Source: AGHT+IHjVBt8H6HfJ0JCB/KGKK5fDmLxLCaQwGuXFQZwwfyBbHpU4K4wMmeetHkz+S+qBh3MPxccnw==
X-Received: by 2002:a05:620a:261b:b0:7ca:e8cc:5f08 with SMTP id af79cd13be357-7cd467241fbmr93206085a.23.1747333418244;
        Thu, 15 May 2025 11:23:38 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:37 -0700 (PDT)
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
Subject: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
Date: Thu, 15 May 2025 18:23:12 +0000
Message-ID: <20250515182322.117840-9-pasha.tatashin@soleen.com>
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

Introduce the framework within LUO to support preserving specific types
of file descriptors across a live update transition. This allows
stateful FDs (like memfds or vfio FDs used by VMs) to be recreated in
the new kernel.

Note: The core logic for iterating through the luo_files_list and
invoking the handler callbacks (prepare, freeze, cancel, finish)
within luo_do_files_*_calls, as well as managing the u64 data
persistence via the FDT for individual files, is currently implemented
as stubs in this patch. This patch sets up the registration, FDT layout,
and retrieval framework.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/Makefile       |   1 +
 drivers/misc/liveupdate/luo_core.c     |  19 +
 drivers/misc/liveupdate/luo_files.c    | 563 +++++++++++++++++++++++++
 drivers/misc/liveupdate/luo_internal.h |  11 +
 include/linux/liveupdate.h             |  62 +++
 5 files changed, 656 insertions(+)
 create mode 100644 drivers/misc/liveupdate/luo_files.c

diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
index df1c9709ba4f..b4cdd162574f 100644
--- a/drivers/misc/liveupdate/Makefile
+++ b/drivers/misc/liveupdate/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= luo_core.o
+obj-y					+= luo_files.o
 obj-y					+= luo_subsystems.o
diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
index 417e7f6bf36c..ab1d76221fe2 100644
--- a/drivers/misc/liveupdate/luo_core.c
+++ b/drivers/misc/liveupdate/luo_core.c
@@ -110,6 +110,10 @@ static int luo_fdt_setup(struct kho_serialization *ser)
 	if (ret)
 		goto exit_free;
 
+	ret = luo_files_fdt_setup(fdt_out);
+	if (ret)
+		goto exit_free;
+
 	ret = luo_subsystems_fdt_setup(fdt_out);
 	if (ret)
 		goto exit_free;
@@ -145,7 +149,13 @@ static int luo_do_prepare_calls(void)
 {
 	int ret;
 
+	ret = luo_do_files_prepare_calls();
+	if (ret)
+		return ret;
+
 	ret = luo_do_subsystems_prepare_calls();
+	if (ret)
+		luo_do_files_cancel_calls();
 
 	return ret;
 }
@@ -154,18 +164,26 @@ static int luo_do_freeze_calls(void)
 {
 	int ret;
 
+	ret = luo_do_files_freeze_calls();
+	if (ret)
+		return ret;
+
 	ret = luo_do_subsystems_freeze_calls();
+	if (ret)
+		luo_do_files_cancel_calls();
 
 	return ret;
 }
 
 static void luo_do_finish_calls(void)
 {
+	luo_do_files_finish_calls();
 	luo_do_subsystems_finish_calls();
 }
 
 static void luo_do_cancel_calls(void)
 {
+	luo_do_files_cancel_calls();
 	luo_do_subsystems_cancel_calls();
 }
 
@@ -436,6 +454,7 @@ static int __init luo_startup(void)
 	}
 
 	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
+	luo_files_startup(luo_fdt_in);
 	luo_subsystems_startup(luo_fdt_in);
 
 	return 0;
diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupdate/luo_files.c
new file mode 100644
index 000000000000..953fc40db3d7
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_files.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO file descriptors
+ *
+ * LUO provides the infrastructure necessary to preserve
+ * specific types of stateful file descriptors across a kernel live
+ * update transition. The primary goal is to allow workloads, such as virtual
+ * machines using vfio, memfd, or iommufd to retain access to their essential
+ * resources without interruption after the underlying kernel is  updated.
+ *
+ * The framework operates based on handler registration and instance tracking:
+ *
+ * 1. Handler Registration: Kernel modules responsible for specific file
+ * types (e.g., memfd, vfio) register a &struct liveupdate_filesystem
+ * handler. This handler contains callbacks (&liveupdate_filesystem.prepare,
+ * &liveupdate_filesystem.freeze, &liveupdate_filesystem.finish, etc.)
+ * and a unique 'compatible' string identifying the file type.
+ * Registration occurs via liveupdate_register_filesystem().
+ *
+ * 2. File Instance Tracking: When a potentially preservable file needs to be
+ * managed for live update, the core LUO logic (luo_register_file()) finds a
+ * compatible registered handler using its &liveupdate_filesystem.can_preserve
+ * callback. If found,  an internal &struct luo_file instance is created,
+ * assigned a unique u64 'token', and added to a list.
+ *
+ * 3. State Persistence (FDT): During the LUO prepare/freeze phases, the
+ * registered handler callbacks are invoked for each tracked file instance.
+ * These callbacks can generate a u64 data payload representing the minimal
+ * state needed for restoration. This payload, along with the handler's
+ * compatible string and the unique token, is stored in a dedicated
+ * '/file-descriptors' node within the main LUO FDT blob passed via
+ * Kexec Handover (KHO).
+ *
+ * 4. Restoration: In the new kernel, the LUO framework parses the incoming
+ * FDT to reconstruct the list of &struct luo_file instances. When the
+ * original owner requests the file, luo_retrieve_file() uses the corresponding
+ * handler's &liveupdate_filesystem.retrieve callback, passing the persisted
+ * u64 data, to recreate or find the appropriate &struct file object.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/libfdt.h>
+#include <linux/liveupdate.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/xarray.h>
+#include "luo_internal.h"
+
+#define LUO_FILES_NODE_NAME	"file-descriptors"
+#define LUO_FILES_COMPATIBLE	"file-descriptors-v1"
+
+static DEFINE_XARRAY(luo_files_xa_in);
+static DEFINE_XARRAY(luo_files_xa_out);
+static bool luo_files_xa_in_recreated;
+
+/* Regestred filesystems. */
+static DECLARE_RWSEM(luo_filesystems_list_rwsem);
+static LIST_HEAD(luo_filesystems_list);
+
+static void *luo_fdt_out;
+static void *luo_fdt_in;
+
+static u64 luo_next_file_token;
+
+/**
+ * struct luo_file - Represents a file descriptor instance preserved
+ * across live update.
+ * @fs:            Pointer to the &struct liveupdate_filesystems containing
+ *                 the implementation of prepare, freeze, cancel, and finish
+ *                 operations specific to this file's type.
+ * @file:          A pointer to the kernel's &struct file object representing
+ *                 the open file descriptor that is being preserved.
+ * @private_data:  Internal storage used by the live update core framework
+ *                 between phases.
+ * @reclaimed:     Flag indicating whether this preserved file descriptor has
+ *                 been successfully 'reclaimed' (e.g., requested via an ioctl)
+ *                 by user-space or the owning kernel subsystem in the new
+ *                 kernel after the live update.
+ * @state:         The current state of file descriptor, it is allowed to
+ *                 prepare, freeze, and finish FDs before the global state
+ *                 switch.
+ * @mutex:          Lock to protect FD state, and allow independently to change
+ *                 the FD state compared to global state.
+ *
+ * This structure holds the necessary callbacks and context for managing a
+ * specific open file descriptor throughout the different phases of a live
+ * update process. Instances of this structure are typically allocated,
+ * populated with file-specific details (&file, &arg, callbacks, compatibility
+ * string, token), and linked into a central list managed by the LUO. The
+ * private_data field is used internally by the core logic to store state
+ * between phases.
+ */
+struct luo_file {
+	struct liveupdate_filesystem *fs;
+	struct file *file;
+	u64 private_data;
+	bool reclaimed;
+	enum liveupdate_state state;
+	struct mutex mutex;
+};
+
+/**
+ * luo_files_startup - Validates the LUO file-descriptors FDT node at startup.
+ * @fdt: Pointer to the LUO FDT blob passed from the previous kernel.
+ *
+ * This __init function checks the existence and validity of the
+ * '/file-descriptors' node in the FDT. This node is considered mandatory. It
+ * calls panic() if the node is missing, inaccessible, or invalid (e.g., missing
+ * compatible, wrong compatible string), indicating a critical configuration
+ * error for LUO.
+ */
+void __init luo_files_startup(void *fdt)
+{
+	int ret, node_offset;
+
+	node_offset = fdt_subnode_offset(fdt, 0, LUO_FILES_NODE_NAME);
+	if (node_offset < 0)
+		panic("Failed to find /file-descriptors node\n");
+
+	ret = fdt_node_check_compatible(fdt, node_offset,
+					LUO_FILES_COMPATIBLE);
+	if (ret) {
+		panic("FDT '%s' is incompatible with '%s' [%d]\n",
+		      LUO_FILES_NODE_NAME, LUO_FILES_COMPATIBLE, ret);
+	}
+	luo_fdt_in = fdt;
+}
+
+static void luo_files_recreate_luo_files_xa_in(void)
+{
+	int parent_node_offset, file_node_offset;
+	const char *node_name, *fdt_compat_str;
+	struct liveupdate_filesystem *fs;
+	struct luo_file *luo_file;
+	const void *data_ptr;
+	int ret = 0;
+
+	if (luo_files_xa_in_recreated || !luo_fdt_in)
+		return;
+
+	/* Take write in order to gurantee that we re-create list once */
+	down_write(&luo_filesystems_list_rwsem);
+	if (luo_files_xa_in_recreated)
+		goto exit_unlock;
+
+	parent_node_offset = fdt_subnode_offset(luo_fdt_in, 0,
+						LUO_FILES_NODE_NAME);
+
+	fdt_for_each_subnode(file_node_offset, luo_fdt_in, parent_node_offset) {
+		bool handler_found = false;
+		u64 token;
+
+		node_name = fdt_get_name(luo_fdt_in, file_node_offset, NULL);
+		if (!node_name) {
+			panic("Skipping FDT subnode at offset %d: Cannot get name\n",
+			      file_node_offset);
+		}
+
+		ret = kstrtou64(node_name, 0, &token);
+		if (ret < 0) {
+			panic("Skipping FDT node '%s': Failed to parse token\n",
+			      node_name);
+		}
+
+		fdt_compat_str = fdt_getprop(luo_fdt_in, file_node_offset,
+					     "compatible", NULL);
+		if (!fdt_compat_str) {
+			panic("Skipping FDT node '%s': Missing 'compatible' property\n",
+			      node_name);
+		}
+
+		data_ptr = fdt_getprop(luo_fdt_in, file_node_offset, "data",
+				       NULL);
+		if (!data_ptr) {
+			panic("Can't recover property 'data' for FDT node '%s'\n",
+			      node_name);
+		}
+
+		list_for_each_entry(fs, &luo_filesystems_list, list) {
+			if (!strcmp(fs->compatible, fdt_compat_str)) {
+				handler_found = true;
+				break;
+			}
+		}
+
+		if (!handler_found) {
+			panic("Skipping FDT node '%s': No registered handler for compatible '%s'\n",
+			      node_name, fdt_compat_str);
+		}
+
+		luo_file = kmalloc(sizeof(*luo_file),
+				   GFP_KERNEL | __GFP_NOFAIL);
+		luo_file->fs = fs;
+		luo_file->file = NULL;
+		memcpy(&luo_file->private_data, data_ptr, sizeof(u64));
+		luo_file->reclaimed = false;
+		mutex_init(&luo_file->mutex);
+		luo_file->state = LIVEUPDATE_STATE_UPDATED;
+		ret = xa_err(xa_store(&luo_files_xa_in, token, luo_file,
+				      GFP_KERNEL | __GFP_NOFAIL));
+		if (ret < 0) {
+			panic("Failed to store luo_file for token %llu in XArray: %d\n",
+			      token, ret);
+		}
+	}
+	luo_files_xa_in_recreated = true;
+
+exit_unlock:
+	up_write(&luo_filesystems_list_rwsem);
+}
+
+/**
+ * luo_files_fdt_setup - Adds and populates the 'file-descriptors' node in the
+ * FDT.
+ * @fdt: Pointer to the LUO FDT blob.
+ *
+ * Add file-descriptors node and each FD node to the LUO FDT blob.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int luo_files_fdt_setup(void *fdt)
+{
+	int ret, files_node_offset, node_offset;
+	const u64 zero_data = 0;
+	unsigned long token;
+	struct luo_file *h;
+	char token_str[19];
+
+	ret = fdt_add_subnode(fdt, 0, LUO_FILES_NODE_NAME);
+	if (ret < 0)
+		goto exit_error;
+
+	files_node_offset = ret;
+	ret = fdt_setprop_string(fdt, files_node_offset, "compatible",
+				 LUO_FILES_COMPATIBLE);
+	if (ret < 0)
+		goto exit_error;
+
+	xa_for_each(&luo_files_xa_out, token, h) {
+		snprintf(token_str, sizeof(token_str), "%#0llx", (u64)token);
+
+		ret = fdt_add_subnode(fdt, files_node_offset, token_str);
+		if (ret < 0)
+			goto exit_error;
+
+		node_offset = ret;
+		ret = fdt_setprop_string(fdt, node_offset, "compatible",
+					 h->fs->compatible);
+		if (ret < 0)
+			goto exit_error;
+
+		ret = fdt_setprop(fdt, node_offset, "data",
+				  &zero_data, sizeof(zero_data));
+	}
+
+	luo_fdt_out = fdt;
+
+	return 0;
+exit_error:
+	pr_err("Failed to setup 'file-descriptors' node to FDT: %s\n",
+	       fdt_strerror(ret));
+	return -ENOSPC;
+}
+
+/**
+ * luo_do_files_prepare_calls - Calls prepare callbacks and updates FDT
+ * if all prepares succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'prepare' for all files and stores results temporarily.
+ * If any 'prepare' fails, calls 'cancel' on previously prepared files
+ * and returns the error.
+ * Phase 2: If all 'prepare' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* prepared files and
+ * returns the FDT error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_files_prepare_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_files_freeze_calls - Calls freeze callbacks and updates FDT
+ * if all calls succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'freeze' for all files and stores results temporarily.
+ * If any 'freeze' fails, calls 'cancel' on previously called files.
+ * and returns the error.
+ * Phase 2: If all 'freeze' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* files and returns the FDT
+ * error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_files_freeze_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_files_finish_calls - Calls finish callbacks for all file descriptors.
+ *
+ * This function is called at the end of live update cycle to do the final
+ * clean-up or housekeeping of the post-live update states.
+ */
+void luo_do_files_finish_calls(void)
+{
+	luo_files_recreate_luo_files_xa_in();
+}
+
+/**
+ * luo_do_files_cancel_calls - Calls cancel callbacks for all file descriptors.
+ *
+ * This function is typically called when the live update process needs to be
+ * aborted externally, for example, after the prepare phase may have run but
+ * before actual reboot. It iterates through all registered files and calls
+ * the 'cancel' callback for those that implement it and likely completed
+ * prepare.
+ */
+void luo_do_files_cancel_calls(void)
+{
+}
+
+/**
+ * luo_register_file - Register a file descriptor for live update management.
+ * @tokenp: Return argument for the token value.
+ * @file: Pointer to the struct file to be preserved.
+ *
+ * Context: Must be called when LUO is in 'normal' state.
+ *
+ * Return: 0 on success. Negative errno on failure.
+ */
+int luo_register_file(u64 *tokenp, struct file *file)
+{
+	struct liveupdate_filesystem *fs;
+	bool found = false;
+	int ret = -ENOENT;
+	u64 token;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		pr_warn("File can be registered only in normal or prepared state\n");
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	down_read(&luo_filesystems_list_rwsem);
+	list_for_each_entry(fs, &luo_filesystems_list, list) {
+		if (fs->can_preserve(file, fs->arg)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		struct luo_file *luo_file = kmalloc(sizeof(*luo_file),
+						    GFP_KERNEL);
+
+		if (!luo_file) {
+			ret = -ENOMEM;
+			goto exit_unlock;
+		}
+
+		token = luo_next_file_token;
+		luo_next_file_token++;
+
+		luo_file->private_data = 0;
+		luo_file->reclaimed = false;
+
+		luo_file->file = file;
+		luo_file->fs = fs;
+		mutex_init(&luo_file->mutex);
+		luo_file->state = LIVEUPDATE_STATE_NORMAL;
+		ret = xa_err(xa_store(&luo_files_xa_out, token, luo_file,
+				      GFP_KERNEL));
+		if (ret < 0) {
+			pr_warn("Failed to store file for token %llu in XArray: %d\n",
+				token, ret);
+			kfree(luo_file);
+			goto exit_unlock;
+		}
+		*tokenp = token;
+	}
+
+exit_unlock:
+	up_read(&luo_filesystems_list_rwsem);
+	luo_state_read_exit();
+
+	return ret;
+}
+
+/**
+ * luo_unregister_file - Unregister a file instance using its token.
+ * @token: The unique token of the file instance to unregister.
+ *
+ * Finds the &struct luo_file associated with the @token in the
+ * global list and removes it. This function *only* removes the entry from the
+ * list; it does *not* free the memory allocated for the &struct luo_file
+ * itself. The caller is responsible for freeing the structure after this
+ * function returns successfully.
+ *
+ * Context: Can be called when a preserved file descriptor is closed or
+ * no longer needs live update management. Uses down_write_killable
+ * for list modification.
+ *
+ * Return: 0 on success. Negative errno on failure.
+ */
+int luo_unregister_file(u64 token)
+{
+	struct luo_file *luo_file;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		pr_warn("File can be unregistered only in normal or updates state\n");
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	luo_file = xa_erase(&luo_files_xa_out, token);
+	if (luo_file) {
+		kfree(luo_file);
+	} else {
+		pr_warn("Failed to unregister: token %llu not found.\n",
+			token);
+		ret = -ENOENT;
+	}
+	luo_state_read_exit();
+
+	return ret;
+}
+
+/**
+ * luo_retrieve_file - Find a registered file instance by its token.
+ * @token: The unique token of the file instance to retrieve.
+ * @file: Output parameter. On success (return value 0), this will point
+ * to the retrieved "struct file".
+ *
+ * Searches the global list for a &struct luo_file matching the @token. Uses a
+ * read lock, allowing concurrent retrievals.
+ *
+ * Return: 0 on success. Negative errno on failure.
+ */
+int luo_retrieve_file(u64 token, struct file **file)
+{
+	struct luo_file *luo_file;
+	int ret = 0;
+
+	luo_files_recreate_luo_files_xa_in();
+	luo_state_read_enter();
+	if (!liveupdate_state_updated()) {
+		pr_warn("File can be retrieved only in updated state\n");
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	luo_file = xa_load(&luo_files_xa_in, token);
+	if (luo_file && !luo_file->reclaimed) {
+		luo_file->reclaimed = true;
+		ret = luo_file->fs->retrieve(luo_file->fs->arg,
+					     luo_file->private_data,
+					     file);
+		if (!ret)
+			luo_file->file = *file;
+	} else if (luo_file && luo_file->reclaimed) {
+		pr_err("The file descriptor for token %lld has already been retrieved\n",
+		       token);
+		ret = -EINVAL;
+	} else {
+		ret = -ENOENT;
+	}
+
+	luo_state_read_exit();
+
+	return ret;
+}
+
+/**
+ * liveupdate_register_filesystem - Register a filesystem handler with LUO.
+ * @fs: Pointer to a caller-allocated &struct liveupdate_filesystem.
+ * The caller must initialize this structure, including a unique
+ * 'compatible' string and a valid 'fs' callbacks. This function adds the
+ * handler to the global list of supported filesystem handlers.
+ *
+ * Context: Typically called during module initialization for filesystems or
+ * file types that support live update preservation.
+ *
+ * Return: 0 on success. Negative errno on failure.
+ */
+int liveupdate_register_filesystem(struct liveupdate_filesystem *fs)
+{
+	struct liveupdate_filesystem *fs_iter;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	down_write(&luo_filesystems_list_rwsem);
+	list_for_each_entry(fs_iter, &luo_filesystems_list, list) {
+		if (!strcmp(fs_iter->compatible, fs->compatible)) {
+			pr_err("Filesystem handler registration failed: Compatible string '%s' already registered.\n",
+			       fs->compatible);
+			ret = -EEXIST;
+			goto exit_unlock;
+		}
+	}
+
+	INIT_LIST_HEAD(&fs->list);
+	list_add_tail(&fs->list, &luo_filesystems_list);
+
+exit_unlock:
+	up_write(&luo_filesystems_list_rwsem);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_register_filesystem);
+
+/**
+ * liveupdate_unregister_filesystem - Unregister a filesystem handler.
+ * @fs: Pointer to the specific &struct liveupdate_filesystem instance
+ * that was previously returned by or passed to liveupdate_register_filesystem.
+ *
+ * Removes the specified handler instance @fs from the global list of
+ * registered filesystem handlers. This function only removes the entry from the
+ * list; it does not free the memory associated with @fs itself. The caller
+ * is responsible for freeing the structure memory after this function returns
+ * successfully.
+ *
+ * Return: 0 on success. Negative errno on failure.
+ */
+int liveupdate_unregister_filesystem(struct liveupdate_filesystem *fs)
+{
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	down_write(&luo_filesystems_list_rwsem);
+	list_del_init(&fs->list);
+	up_write(&luo_filesystems_list_rwsem);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_unregister_filesystem);
diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
index 63a8b93254a6..b7a0f31ddc99 100644
--- a/drivers/misc/liveupdate/luo_internal.h
+++ b/drivers/misc/liveupdate/luo_internal.h
@@ -23,6 +23,17 @@ int luo_do_subsystems_freeze_calls(void);
 void luo_do_subsystems_finish_calls(void);
 void luo_do_subsystems_cancel_calls(void);
 
+void luo_files_startup(void *fdt);
+int luo_files_fdt_setup(void *fdt);
+int luo_do_files_prepare_calls(void);
+int luo_do_files_freeze_calls(void);
+void luo_do_files_finish_calls(void);
+void luo_do_files_cancel_calls(void);
+
+int luo_retrieve_file(u64 token, struct file **file);
+int luo_register_file(u64 *token, struct file *file);
+int luo_unregister_file(u64 token);
+
 extern const char *const luo_state_str[];
 
 /* Get the current state as a string */
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 7a130680b5f2..7afe0aac5ce4 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -86,6 +86,55 @@ enum liveupdate_state  {
 	LIVEUPDATE_STATE_UPDATED = 3,
 };
 
+/* Forward declaration needed if definition isn't included */
+struct file;
+
+/**
+ * struct liveupdate_filesystem - Represents a handler for a live-updatable
+ * filesystem/file type.
+ * @prepare:       Optional. Saves state for a specific file instance (@file,
+ *                 @arg) before update, potentially returning value via @data.
+ *                 Returns 0 on success, negative errno on failure.
+ * @freeze:        Optional. Performs final actions just before kernel
+ *                 transition, potentially reading/updating the handle via
+ *                 @data.
+ *                 Returns 0 on success, negative errno on failure.
+ * @cancel:        Optional. Cleans up state/resources if update is aborted
+ *                 after prepare/freeze succeeded, using the @data handle (by
+ *                 value) from the successful prepare. Returns void.
+ * @finish:        Optional. Performs final cleanup in the new kernel using the
+ *                 preserved @data handle (by value). Returns void.
+ * @retrieve:      Retrieve the preserved file. Must be called before finish.
+ * @can_preserve:  callback to determine if @file with associated context (@arg)
+ *                 can be preserved by this handler.
+ *                 Return bool (true if preservable, false otherwise).
+ * @compatible:    The compatibility string (e.g., "memfd-v1", "vfiofd-v1")
+ *                 that uniquely identifies the filesystem or file type this
+ *                 handler supports. This is matched against the compatible
+ *                 string associated with individual &struct liveupdate_file
+ *                 instances.
+ * @arg:           An opaque pointer to implementation-specific context data
+ *                 associated with this filesystem handler registration.
+ * @list:          used for linking this handler instance into a global list of
+ *                 registered filesystem handlers.
+ *
+ * Modules that want to support live update for specific file types should
+ * register an instance of this structure. LUO uses this registration to
+ * determine if a given file can be preserved and to find the appropriate
+ * operations to manage its state across the update.
+ */
+struct liveupdate_filesystem {
+	int (*prepare)(struct file *file, void *arg, u64 *data);
+	int (*freeze)(struct file *file, void *arg, u64 *data);
+	void (*cancel)(struct file *file, void *arg, u64 data);
+	void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
+	int (*retrieve)(void *arg, u64 data, struct file **file);
+	bool (*can_preserve)(struct file *file, void *arg);
+	const char *compatible;
+	void *arg;
+	struct list_head list;
+};
+
 /**
  * struct liveupdate_subsystem - Represents a subsystem participating in LUO
  * @prepare:      Optional. Called during LUO prepare phase. Should perform
@@ -142,6 +191,9 @@ int liveupdate_register_subsystem(struct liveupdate_subsystem *h);
 int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
 int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
 
+int liveupdate_register_filesystem(struct liveupdate_filesystem *h);
+int liveupdate_unregister_filesystem(struct liveupdate_filesystem *h);
+
 #else /* CONFIG_LIVEUPDATE */
 
 static inline int liveupdate_reboot(void)
@@ -180,5 +232,15 @@ static inline int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h,
 	return -ENODATA;
 }
 
+static inline int liveupdate_register_filesystem(struct liveupdate_filesystem *h)
+{
+	return 0;
+}
+
+static inline int liveupdate_unregister_filesystem(struct liveupdate_filesystem *h)
+{
+	return 0;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
-- 
2.49.0.1101.gccaa498523-goog

