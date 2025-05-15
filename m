Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC900267F70
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333429; cv=none; b=uMYNlPg0KodfYXz/BY8WdLzhz2Pst9Ev5iipb2fa93LqKbY88/595H4cGeuuEJRCiXnX7xZ8+HVt/wye0Y8TpAHo3Jv0HGRzl+RPxKtaxEEcNyqrgFtS65UBt0MGRYEDyFLE+Ti2Mlfqt7ciVSBwA4o0jd7DG0uodqZURCgwYXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333429; c=relaxed/simple;
	bh=hgPuW5Ys7sC8BGWu94CgKexhMd9oEBDpOch4SttenXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hS5jibR3giKOoAY6btOhaoceoDB73Rpfpmtk/DKRHT/nTulD6i/2LWS95xLu6duWyVfXCtQhMoiW3K1jXdqrxuLzyZ5hZdafLN+f0gN7FLc+vA9wNEzk/TdK/eA/mPLR4mmPHacXPXXBo5auWEwe5IWfD+cbAcffAaxq1LFCzck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=Zl0dQx4+; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="Zl0dQx4+"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c54b651310so159297985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333425; x=1747938225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oENjR2vhI4RJwAs+G75r0Z5r6ExS3XdaJkL9pQx4Wu0=;
        b=Zl0dQx4+PboHfc3P9u7cnYFU522svQn14sfZFc+mGUYsmledY5OqFp6jr0qIZ/1nv/
         0ClBAKj6PtbiJLRf9QTzMURmSHGDG/0yWF03gZGK+NFp+Wv7+Ky2z2N9IUYL+1IK+h19
         G0aXPjXsoTnrQffdlrwp/sGLcixe9jNmqpE7kOY0jFxaDgGWCoimQ4ygCGb+aw4RKXW7
         2JL1oTQaw8ZWx8YQm19ZeR74RC3N51v8aAybjcazbCKNt4WTqEXTRdI28MmLausrZooo
         SdEC9iqCO234w9OCq/SbmDiz2oQfuYP7NVx2gW9feRoEewRJHFNT6Q2ZjwwkwxC8+Egm
         2YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333425; x=1747938225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oENjR2vhI4RJwAs+G75r0Z5r6ExS3XdaJkL9pQx4Wu0=;
        b=Tb85IxBVAV8JqU3eG+3wET3itbKxCesBdI0YOzTOOGstlVMZfMTe64B4Q8PSK6P3PU
         hG40+Qn1PHju9tncJibnFNaNsAGbTi8G5vH5qSClfMy+Ax+dzZGH2ff4RUSgo1rc6QO3
         IqTgs5L9SX5ul5aA6ZRzsNtCm0qHak0uZsDMgquGTLOHOMvwFnfX1Kuzj1RkukLjV3wK
         CeECZYUmR9tvXUpeiJM1608rZgA92/B2ffQA6sxj8jrtwhY7zCa0LSUa4yGGHgorLsje
         H9O1PWYaTTN1hfY0iYhS59OcoY8JuU0hyVqFAiQQnhuMtxuQRfTQ7PI3DlPOiRIhDgXn
         Skrg==
X-Forwarded-Encrypted: i=1; AJvYcCUwWu55SaAXPKWoRaM7jrkvXSd7U3PywDpmHYLEQf8uMZYqxWTKzHpFzaKTl8AUel1NzqQg+trU2X6nIUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFVcqcEV9VGa0IQQ8n9VFurrDQ8o7R5HomlMbkp7yjSN393GF
	EiGD7Q4xjKedMyr82hcPaRUKes/JRHLGyEGlYgJJ92kWQw4worxgghIAKx4QgvRnioE=
X-Gm-Gg: ASbGncvPhHI1xTcJTq7Yo7LJye+kFEaQyLmsiNsQSj5Hq0U28u9cGqqdFqoYTzH1D4k
	WuOqVazPfz930xxDEerRGpdKX3Jol2MpAVR+dPB+agemW9QQjZuVQdyyhjFxblIvkwtB9nxcCdG
	l+hmxAtgoCEbMyK2eBl8TSjh02IW8FNAEbNYV62xg8XmfvtveyAyVY9vPhV/4F5A2mBd6h1owuW
	hw2/9z8BfmLW6YLtM4hGPlgkAnS10uaLChwG7wY7U6RmHDKj75KXbq7Yy+T9ebzWje++XXL3iNl
	b/cRZ5S7s3qSNpP3DeKEFQT05bmqepF28eteUbuuU6oIWQ+VBl2QMT06ub25gtQKVd0Tfm/Qwhu
	12F9fKmFFLshhWGFG2a3B5RA3V9x0kHrgdfEz2C9BAVns
X-Google-Smtp-Source: AGHT+IHP1cJdLqVJKJ+0AFAF8cX8CxtBKtnuYkRWk6aLTFzY+RY4Wob1Ir0/sZcQQGuhUB+Whzp0DQ==
X-Received: by 2002:a05:620a:4707:b0:7c5:d888:7098 with SMTP id af79cd13be357-7cd46779dc9mr86813885a.44.1747333425466;
        Thu, 15 May 2025 11:23:45 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:44 -0700 (PDT)
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
Subject: [RFC v2 13/16] luo: add selftests for subsystems un/registration
Date: Thu, 15 May 2025 18:23:17 +0000
Message-ID: <20250515182322.117840-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a self-test mechanism for the LUO to allow verification of
core subsystem management functionality. This is primarily intended
for developers and system integrators validating the live update
feature.

The tests are enabled via the new Kconfig option
CONFIG_LIVEUPDATE_SELFTESTS (default 'n') and are triggered through
a new ioctl command, LIVEUPDATE_IOCTL_SELFTESTS, added to the
/dev/liveupdate device node.

This ioctl accepts commands defined in luo_selftests.h to:
- LUO_CMD_SUBSYSTEM_REGISTER: Creates and registers a dummy LUO
  subsystem using the liveupdate_register_subsystem() function. It
  allocates a data page and copies initial data from userspace.
- LUO_CMD_SUBSYSTEM_UNREGISTER: Unregisters the specified dummy
  subsystem using the liveupdate_unregister_subsystem() function and
  cleans up associated test resources.
- LUO_CMD_SUBSYSTEM_GETDATA: Copies the data page associated with a
  registered test subsystem back to userspace, allowing verification of
  data potentially modified or preserved by test callbacks.

This provides a way to test the fundamental registration and
unregistration flows within the LUO framework from userspace without
requiring a full live update sequence.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/misc/liveupdate/Kconfig         |  15 ++
 drivers/misc/liveupdate/Makefile        |   1 +
 drivers/misc/liveupdate/luo_internal.h  |   9 +
 drivers/misc/liveupdate/luo_ioctl.c     |   4 +
 drivers/misc/liveupdate/luo_selftests.c | 283 ++++++++++++++++++++++++
 drivers/misc/liveupdate/luo_selftests.h |  23 ++
 include/uapi/linux/liveupdate.h         |  24 ++
 7 files changed, 359 insertions(+)
 create mode 100644 drivers/misc/liveupdate/luo_selftests.c
 create mode 100644 drivers/misc/liveupdate/luo_selftests.h

diff --git a/drivers/misc/liveupdate/Kconfig b/drivers/misc/liveupdate/Kconfig
index 09940f9a724a..304217e2fe95 100644
--- a/drivers/misc/liveupdate/Kconfig
+++ b/drivers/misc/liveupdate/Kconfig
@@ -43,3 +43,18 @@ config LIVEUPDATE_SYSFS_API
 	  needed to coordinate application restarts and minimize downtime.
 
 	  If unsure, say N.
+
+config LIVEUPDATE_SELFTESTS
+	bool "Live Update Orchestrator - self tests"
+	depends on LIVEUPDATE
+	help
+	  Say Y here to build self-tests for the LUO framework. When enabled,
+	  these tests can be initiated via the ioctl interface to help verify
+	  the core live update functionality.
+
+	  This option is primarily intended for developers working on the
+	  live update feature or for validation purposes during system
+	  integration.
+
+	  If you are unsure or are building a production kernel where size
+	  or attack surface is a concern, say N.
diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
index 190323c10220..1afa4059b99f 100644
--- a/drivers/misc/liveupdate/Makefile
+++ b/drivers/misc/liveupdate/Makefile
@@ -2,5 +2,6 @@
 obj-y					+= luo_ioctl.o
 obj-y					+= luo_core.o
 obj-y					+= luo_files.o
+obj-$(CONFIG_LIVEUPDATE_SELFTESTS)	+= luo_selftests.o
 obj-y					+= luo_subsystems.o
 obj-$(CONFIG_LIVEUPDATE_SYSFS_API)	+= luo_sysfs.o
diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
index bf1ba18722e2..45bf8398ab6e 100644
--- a/drivers/misc/liveupdate/luo_internal.h
+++ b/drivers/misc/liveupdate/luo_internal.h
@@ -40,6 +40,15 @@ void luo_sysfs_notify(void);
 static inline void luo_sysfs_notify(void) {}
 #endif
 
+#ifdef CONFIG_LIVEUPDATE_SELFTESTS
+int luo_ioctl_selftests(void __user *argp);
+#else
+static inline int luo_ioctl_selftests(void __user *argp)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 extern const char *const luo_state_str[];
 
 /* Get the current state as a string */
diff --git a/drivers/misc/liveupdate/luo_ioctl.c b/drivers/misc/liveupdate/luo_ioctl.c
index 76c687ff650b..f92cea7eff82 100644
--- a/drivers/misc/liveupdate/luo_ioctl.c
+++ b/drivers/misc/liveupdate/luo_ioctl.c
@@ -152,6 +152,10 @@ static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			ret = -EFAULT;
 		break;
 
+	case LIVEUPDATE_IOCTL_SELFTESTS:
+		ret = luo_ioctl_selftests((void __user *)arg);
+		break;
+
 	default:
 		pr_warn("ioctl: unknown command nr: 0x%x\n", _IOC_NR(cmd));
 		ret = -ENOTTY;
diff --git a/drivers/misc/liveupdate/luo_selftests.c b/drivers/misc/liveupdate/luo_selftests.c
new file mode 100644
index 000000000000..7956e5c2371f
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_selftests.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO Selftests
+ *
+ * We provide ioctl-based selftest interface for the LUO. It provides a
+ * mechanism to test core LUO functionality, particularly the registration,
+ * unregistration, and data handling aspects of LUO subsystems, without
+ * requiring a full live update event sequence.
+ *
+ * The tests are intended primarily for developers working on the LUO framework
+ * or for validation purposes during system integration. This functionality is
+ * conditionally compiled based on the `CONFIG_LIVEUPDATE_SELFTESTS` Kconfig
+ * option and should typically be disabled in production kernels.
+ *
+ * Interface:
+ * The selftests are accessed via the `/dev/liveupdate` character device using
+ * the `LIVEUPDATE_IOCTL_SELFTESTS` ioctl command. The argument to the ioctl
+ * is a pointer to a `struct liveupdate_selftest` structure (defined in
+ * `uapi/linux/liveupdate.h`), which contains:
+ * - `cmd`: The specific selftest command to execute (e.g.,
+ * `LUO_CMD_SUBSYSTEM_REGISTER`).
+ * - `arg`: A pointer to a command-specific argument structure. For subsystem
+ * tests, this points to a `struct luo_arg_subsystem` (defined in
+ * `luo_selftests.h`).
+ *
+ * Commands:
+ * - `LUO_CMD_SUBSYSTEM_REGISTER`:
+ * Registers a new dummy LUO subsystem. It allocates kernel memory for test
+ * data, copies initial data from the user-provided `data_page`, sets up
+ * simple logging callbacks, and calls the core
+ * `liveupdate_register_subsystem()`
+ * function. Requires `arg` pointing to `struct luo_arg_subsystem`.
+ * - `LUO_CMD_SUBSYSTEM_UNREGISTER`:
+ * Unregisters a previously registered dummy subsystem identified by `name`.
+ * It calls the core `liveupdate_unregister_subsystem()` function and then
+ * frees the associated kernel memory and internal tracking structures.
+ * Requires `arg` pointing to `struct luo_arg_subsystem` (only `name` used).
+ * - `LUO_CMD_SUBSYSTEM_GETDATA`:
+ * Copies the content of the kernel data page associated with the specified
+ * dummy subsystem (`name`) back to the user-provided `data_page`. This allows
+ * userspace to verify the state of the data after potential test operations.
+ * Requires `arg` pointing to `struct luo_arg_subsystem`.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <linux/kexec_handover.h>
+#include <linux/liveupdate.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/liveupdate.h>
+#include "luo_internal.h"
+#include "luo_selftests.h"
+
+struct luo_subsystems {
+	struct liveupdate_subsystem handle;
+	char name[LUO_NAME_LENGTH];
+	void *data;
+	bool in_use;
+} luo_subsystems[LUO_MAX_SUBSYSTEMS];
+
+/* Only allow one selftest ioctl operation at a time */
+static DEFINE_MUTEX(luo_ioctl_mutex);
+
+static int luo_subsystem_prepare(void *arg, u64 *data)
+{
+	unsigned long i = (unsigned long)arg;
+	unsigned long phys_addr = __pa(luo_subsystems[i].data);
+	int ret;
+
+	ret = kho_preserve_phys(phys_addr, PAGE_SIZE);
+	if (ret)
+		return ret;
+
+	*data = phys_addr;
+	pr_info("Subsystem '%s' prepare data[%lx]\n",
+		luo_subsystems[i].name, phys_addr);
+
+	return 0;
+}
+
+static int luo_subsystem_freeze(void *arg, u64 *data)
+{
+	unsigned long i = (unsigned long)arg;
+
+	pr_info("Subsystem '%s' freeze data[%llx]\n",
+		luo_subsystems[i].name, *data);
+
+	return 0;
+}
+
+static void luo_subsystem_cancel(void *arg, u64 data)
+{
+	unsigned long i = (unsigned long)arg;
+
+	pr_info("Subsystem '%s' canel data[%llx]\n",
+		luo_subsystems[i].name, data);
+}
+
+static void luo_subsystem_finish(void *arg, u64 data)
+{
+	unsigned long i = (unsigned long)arg;
+
+	pr_info("Subsystem '%s' finish data[%llx]\n",
+		luo_subsystems[i].name, data);
+}
+
+static int luo_subsystem_idx(char *name)
+{
+	int i;
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		if (luo_subsystems[i].in_use &&
+		    !strcmp(luo_subsystems[i].name, name))
+			break;
+	}
+
+	if (i == LUO_MAX_SUBSYSTEMS) {
+		pr_warn("Subsystem with name '%s' is not registred\n", name);
+
+		return -EINVAL;
+	}
+
+	return i;
+}
+
+static void luo_put_and_free_subsystem(char *name)
+{
+	int i = luo_subsystem_idx(name);
+
+	if (i < 0)
+		return;
+
+	free_page((unsigned long)luo_subsystems[i].data);
+	luo_subsystems[i].in_use = false;
+}
+
+static int luo_get_and_alloc_subsystem(char *name, void __user *data,
+				       struct liveupdate_subsystem **hp)
+{
+	unsigned long page_addr, i;
+
+	page_addr = get_zeroed_page(GFP_KERNEL);
+	if (!page_addr) {
+		pr_warn("Failed to allocate memory for subsystem data\n");
+		return -ENOMEM;
+	}
+
+	if (copy_from_user((void *)page_addr, data, PAGE_SIZE)) {
+		free_page(page_addr);
+		return -EFAULT;
+	}
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		if (!luo_subsystems[i].in_use)
+			break;
+	}
+
+	if (i == LUO_MAX_SUBSYSTEMS) {
+		pr_warn("Maximum number of subsystems registered\n");
+		return -ENOMEM;
+	}
+
+	luo_subsystems[i].in_use = true;
+	luo_subsystems[i].handle.prepare = luo_subsystem_prepare;
+	luo_subsystems[i].handle.freeze = luo_subsystem_freeze;
+	luo_subsystems[i].handle.cancel = luo_subsystem_cancel;
+	luo_subsystems[i].handle.finish = luo_subsystem_finish;
+	luo_subsystems[i].handle.name = luo_subsystems[i].name;
+	luo_subsystems[i].handle.arg = (void *)i;
+	strscpy(luo_subsystems[i].name, name, LUO_NAME_LENGTH);
+	luo_subsystems[i].data = (void *)page_addr;
+
+	*hp = &luo_subsystems[i].handle;
+
+	return 0;
+}
+
+static int luo_cmd_subsystem_unregister(void __user *argp)
+{
+	struct luo_arg_subsystem arg;
+	int ret, i;
+
+	if (copy_from_user(&arg, argp, sizeof(arg)))
+		return -EFAULT;
+
+	i = luo_subsystem_idx(arg.name);
+	if (i < 0)
+		return i;
+
+	ret = liveupdate_unregister_subsystem(&luo_subsystems[i].handle);
+	if (ret)
+		return ret;
+
+	luo_put_and_free_subsystem(arg.name);
+
+	return 0;
+}
+
+static int luo_cmd_subsystem_register(void __user *argp)
+{
+	struct liveupdate_subsystem *h;
+	struct luo_arg_subsystem arg;
+	int ret;
+
+	if (copy_from_user(&arg, argp, sizeof(arg)))
+		return -EFAULT;
+
+	ret = luo_get_and_alloc_subsystem(arg.name,
+					  (void __user *)arg.data_page, &h);
+	if (ret)
+		return ret;
+
+	ret = liveupdate_register_subsystem(h);
+	if (ret)
+		luo_put_and_free_subsystem(arg.name);
+
+	return ret;
+}
+
+static int luo_cmd_subsystem_getdata(void __user *argp)
+{
+	struct luo_arg_subsystem arg;
+	int i;
+
+	if (copy_from_user(&arg, argp, sizeof(arg)))
+		return -EFAULT;
+
+	i = luo_subsystem_idx(arg.name);
+	if (i < 0)
+		return i;
+
+	if (copy_to_user(arg.data_page, luo_subsystems[i].data,
+			 PAGE_SIZE)) {
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+int luo_ioctl_selftests(void __user *argp)
+{
+	struct liveupdate_selftest luo_st;
+	void __user *cmd_argp;
+	int ret = 0;
+
+	if (copy_from_user(&luo_st, argp, sizeof(luo_st)))
+		return -EFAULT;
+
+	cmd_argp = (void __user *)luo_st.arg;
+
+	mutex_lock(&luo_ioctl_mutex);
+	switch (luo_st.cmd) {
+	case LUO_CMD_SUBSYSTEM_REGISTER:
+		ret =  luo_cmd_subsystem_register(cmd_argp);
+		break;
+
+	case LUO_CMD_SUBSYSTEM_UNREGISTER:
+		ret =  luo_cmd_subsystem_unregister(cmd_argp);
+		break;
+
+	case LUO_CMD_SUBSYSTEM_GETDATA:
+		ret = luo_cmd_subsystem_getdata(cmd_argp);
+		break;
+
+	default:
+		pr_warn("ioctl: unknown self-test command nr: 0x%llx\n",
+			luo_st.cmd);
+		ret = -ENOTTY;
+		break;
+	}
+	mutex_unlock(&luo_ioctl_mutex);
+
+	return ret;
+}
diff --git a/drivers/misc/liveupdate/luo_selftests.h b/drivers/misc/liveupdate/luo_selftests.h
new file mode 100644
index 000000000000..a30c6ce2273e
--- /dev/null
+++ b/drivers/misc/liveupdate/luo_selftests.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#ifndef _LINUX_LUO_SELFTESTS_H
+#define _LINUX_LUO_SELFTESTS_H
+
+/* Maximum number of subsystem self-test can register */
+#define LUO_MAX_SUBSYSTEMS		16
+#define LUO_NAME_LENGTH			32
+
+#define LUO_CMD_SUBSYSTEM_REGISTER	0
+#define LUO_CMD_SUBSYSTEM_UNREGISTER	1
+#define LUO_CMD_SUBSYSTEM_GETDATA	2
+struct luo_arg_subsystem {
+	char name[LUO_NAME_LENGTH];
+	void *data_page;
+};
+
+#endif /* _LINUX_LUO_SELFTESTS_H */
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index c673d08a29ea..e77a7b4e3448 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -81,6 +81,18 @@ struct liveupdate_fd {
 	__u64		token;
 };
 
+/**
+ * struct liveupdate_selftest - Holds directions for the self-test operations.
+ * @cmd:    Selftest comman defined in luo_selftests.h.
+ * @arg:    Argument for the self test command.
+ *
+ * This structure is used only for the selftest purposes.
+ */
+struct liveupdate_selftest {
+	__u64		cmd;
+	__u64		arg;
+};
+
 /* The ioctl type, documented in ioctl-number.rst */
 #define LIVEUPDATE_IOCTL_TYPE		0xBA
 
@@ -297,4 +309,16 @@ struct liveupdate_fd {
 #define LIVEUPDATE_IOCTL_EVENT_FINISH					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, 0x07)
 
+/**
+ * LIVEUPDATE_IOCTL_SELFTESTS - Interface for the LUO selftests
+ *
+ * Argument: Pointer to &struct liveupdate_selftest.
+ *
+ * Use by LUO selftests, commands are declared in luo_selftests.h
+ *
+ * Return: 0 on success, negative error code on failure (e.g., invalid token).
+ */
+#define LIVEUPDATE_IOCTL_SELFTESTS					\
+	_IOWR(LIVEUPDATE_IOCTL_TYPE, 0x08, struct liveupdate_selftest)
+
 #endif /* _UAPI_LIVEUPDATE_H */
-- 
2.49.0.1101.gccaa498523-goog

