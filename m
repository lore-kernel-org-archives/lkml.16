Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868127A128
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642868; cv=none; b=Ok5c7w99uN40uiCQ2oZi/BMDxlWGm+RRPS9G5jshu/npu+mFj1gY1t5ZLsFwS1AkMNjiWIkpU5QuE9uYrSP9JCI7YSwpo8kvSlV8dlY7Wbe6fYL12uyQYXm7TPl2a6bnJ13Uu83w0OnA0WaqC56Mg0PzokMHWIDPLpVOr8gjhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642868; c=relaxed/simple;
	bh=iKZ7y//es/7BqMLPkXySAEsHNWoQJ66pKSxkMkdGzx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzePJbr7ILC1ZprLktElmkPxcaAwNhI8gtJXK7iZ1saQ50dTBTCc+4S7SDBgPNPcLFpku2zey3+RfIwDwWaaC8nIQ6m/WxmYqOsa9sluNanaIqYoKB7CngAdSROaPmnAjPKLuFT8q50WDcxqPWvbVH6oAJiNY7/dj7vxFT9xinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu3vCbql; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu3vCbql"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f60so3011161b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642866; x=1745247666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/oPnzCyp3nNUOf+Gh6zEg1fsjVzRm2EqUu3QrubZZg=;
        b=Vu3vCbqlJnGyzR/K6x3dA8rLiP/qywtS9xAttPXPEWP9n0jKtXvSK/Vba8hUJn73Xe
         edZ6M585a7JljSbU1cGtU2jdCUlgpnD+hTi2GzFiG6wJxrCb3X0Ja5LmBaSTrSHzXopx
         5PfSSGwPtnDwcbxiVYUWZJDF+Gge7JZ4PasyOJw/Nk+NtfzCJxS/8Cd1Sx0CdeDSaaNW
         ROO6XayPOF+Zhc3hxtt1clNV2MPfvxvxsYgemAh8lcoUBSPSwL4BwGxP25bP+cmmgVgQ
         Fgsg+NdrdDZQ/a3yEt4Mgl285rSwa5onFvlU+f8T8iryZghYdvTGJSvfGdhgsDr/BPXS
         +5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642866; x=1745247666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/oPnzCyp3nNUOf+Gh6zEg1fsjVzRm2EqUu3QrubZZg=;
        b=HUSRWPUOIDOq/7BTauoQtDorzxXXM/PlJdXmWk/pIqtAjt+0g+FjgzIs8QGRh7uXn+
         04YP3BJ5SUZPOoWsaee+d/ZzUIxysq+l7PkydfnvCB4HGToqigQzawsZ6/EQ/CRfgbB0
         mYU0+XomSDHeWxwxsNvIT5KK0lyZdqswky+pFGXHXQHvJT6PXKe7qoKzipcVRtS/6aw5
         +pRt0BEl7nWAxhT9atdxVdiGB4aIdHxNXDK/kOtX5A7Rgrqy7sLVIRD7iLlBzUfKox/7
         7dWvf7In/lwq3XOn7zVGRLKgiI1Hsz8eA3dDVMgDgk2Dup91C3tXn12G+rAKE6CHYcz0
         dYfg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Qxb24kMzfORHv2dtiptrZ7NX+9TO8idgG1zm4wSi/OhUncU0bfVqTNtMa/JPVj4sG5+vlvAxaMjsJJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1/FwPX6MZ8so5O/n9UC35lBmmMg9cGaKoacn/GtoQ6lEE4PN
	XuBRl1xKm7D8G1ttnLDio0OfQrZyLfdJspgANmwB7U5ex0DjAwfK
X-Gm-Gg: ASbGncuFSNR+NwrGuUnvdBFRTP9UZeGdgaoK2/lB9WNOaytGqU83rQVE41CH2nogE3n
	2urb9N3rKnWRdZ3cR4R1coVTenet3ADjppGBrp9813mJR5xH2GOZ28tlBlZIAyGEh5ofdaouS9S
	idTd4LGyyQ4C40BT4LQLEmBN7XdNzRGk31qYwihjY989Uv4AjNzRh3DMhL1rN8ulNREJTQHA14r
	7AzDnmXalLmaXlSfZSiogXwjHsbFm8cWZOanXnIq4pWW9OLs49ZYU4/LwGthcKsebFa1haeBnqu
	1YXl1/bFNlTmqUz0qAD+XkGUdZpYTa4gQekUU+JXZNGR/e1K
X-Google-Smtp-Source: AGHT+IEzW1IyYBCVn81irD15H9jAjpJZuK4goGvOHmJdb+vI1rHREqMC844qLrMcru+2X6lbQMiLoA==
X-Received: by 2002:a05:6a00:2188:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-73bd11e32f1mr14962635b3a.7.1744642865267;
        Mon, 14 Apr 2025 08:01:05 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e0b95sm6726329b3a.82.2025.04.14.08.01.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 08:01:04 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: will@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	longman@redhat.com,
	mhiramat@kernel.org,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	amaindex@outlook.com,
	jstultz@google.com,
	Lance Yang <ioworker0@gmail.com>
Subject: [PATCH v5 3/3] samples: extend hung_task detector test with semaphore support
Date: Mon, 14 Apr 2025 22:59:45 +0800
Message-ID: <20250414145945.84916-4-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145945.84916-1-ioworker0@gmail.com>
References: <20250414145945.84916-1-ioworker0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zi Li <amaindex@outlook.com>

Extend the existing hung_task detector test module to support multiple lock
types, including mutex and semaphore, with room for future additions (e.g.,
spinlock, etc.). This module creates dummy files under <debugfs>/hung_task,
such as 'mutex' and 'semaphore'. The read process on any of these files
will sleep for enough long time (256 seconds) while holding the respective
lock. As a result, the second process will wait on the lock for a prolonged
duration and be detected by the hung_task detector.

This change unifies the previous mutex-only sample into a single,
extensible hung_task_tests module, reducing code duplication and improving
maintainability.

Usage is:

	> cd /sys/kernel/debug/hung_task
	> cat mutex & cat mutex          # Test mutex blocking
	> cat semaphore & cat semaphore  # Test semaphore blocking

Update the Kconfig description to reflect multiple debugfs files support.

Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Lance Yang <ioworker0@gmail.com>
Signed-off-by: Zi Li <amaindex@outlook.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 samples/Kconfig                     |  9 +--
 samples/hung_task/Makefile          |  2 +-
 samples/hung_task/hung_task_mutex.c | 66 --------------------
 samples/hung_task/hung_task_tests.c | 97 +++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+), 71 deletions(-)
 delete mode 100644 samples/hung_task/hung_task_mutex.c
 create mode 100644 samples/hung_task/hung_task_tests.c

diff --git a/samples/Kconfig b/samples/Kconfig
index 09011be2391a..753ed1f170b5 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -304,10 +304,11 @@ config SAMPLE_HUNG_TASK
 	tristate "Hung task detector test code"
 	depends on DETECT_HUNG_TASK && DEBUG_FS
 	help
-	  Build a module which provide a simple debugfs file. If user reads
-	  the file, it will sleep long time (256 seconds) with holding a
-	  mutex. Thus if there are 2 or more processes read this file, it
-	  will be detected by the hung_task watchdog.
+	  Build a module that provides debugfs files (e.g., mutex, semaphore,
+	  etc.) under <debugfs>/hung_task. If user reads one of these files,
+	  it will sleep long time (256 seconds) with holding a lock. Thus,
+	  if 2 or more processes read the same file concurrently, it will
+	  be detected by the hung_task watchdog.
 
 source "samples/rust/Kconfig"
 
diff --git a/samples/hung_task/Makefile b/samples/hung_task/Makefile
index f4d6ab563488..86036f1a204d 100644
--- a/samples/hung_task/Makefile
+++ b/samples/hung_task/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_SAMPLE_HUNG_TASK) += hung_task_mutex.o
+obj-$(CONFIG_SAMPLE_HUNG_TASK) += hung_task_tests.o
diff --git a/samples/hung_task/hung_task_mutex.c b/samples/hung_task/hung_task_mutex.c
deleted file mode 100644
index 47ed38239ea3..000000000000
--- a/samples/hung_task/hung_task_mutex.c
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * hung_task_mutex.c - Sample code which causes hung task by mutex
- *
- * Usage: load this module and read `<debugfs>/hung_task/mutex`
- *        by 2 or more processes.
- *
- * This is for testing kernel hung_task error message.
- * Note that this will make your system freeze and maybe
- * cause panic. So do not use this except for the test.
- */
-
-#include <linux/debugfs.h>
-#include <linux/delay.h>
-#include <linux/fs.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-
-#define HUNG_TASK_DIR   "hung_task"
-#define HUNG_TASK_FILE  "mutex"
-#define SLEEP_SECOND 256
-
-static const char dummy_string[] = "This is a dummy string.";
-static DEFINE_MUTEX(dummy_mutex);
-static struct dentry *hung_task_dir;
-
-static ssize_t read_dummy(struct file *file, char __user *user_buf,
-			  size_t count, loff_t *ppos)
-{
-	/* If the second task waits on the lock, it is uninterruptible sleep. */
-	guard(mutex)(&dummy_mutex);
-
-	/* When the first task sleep here, it is interruptible. */
-	msleep_interruptible(SLEEP_SECOND * 1000);
-
-	return simple_read_from_buffer(user_buf, count, ppos,
-				dummy_string, sizeof(dummy_string));
-}
-
-static const struct file_operations hung_task_fops = {
-	.read = read_dummy,
-};
-
-static int __init hung_task_sample_init(void)
-{
-	hung_task_dir = debugfs_create_dir(HUNG_TASK_DIR, NULL);
-	if (IS_ERR(hung_task_dir))
-		return PTR_ERR(hung_task_dir);
-
-	debugfs_create_file(HUNG_TASK_FILE, 0400, hung_task_dir,
-			    NULL, &hung_task_fops);
-
-	return 0;
-}
-
-static void __exit hung_task_sample_exit(void)
-{
-	debugfs_remove_recursive(hung_task_dir);
-}
-
-module_init(hung_task_sample_init);
-module_exit(hung_task_sample_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Masami Hiramatsu");
-MODULE_DESCRIPTION("Simple sleep under mutex file for testing hung task");
diff --git a/samples/hung_task/hung_task_tests.c b/samples/hung_task/hung_task_tests.c
new file mode 100644
index 000000000000..a5c09bd3a47d
--- /dev/null
+++ b/samples/hung_task/hung_task_tests.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * hung_task_tests.c - Sample code for testing hung tasks with mutex,
+ * semaphore, etc.
+ *
+ * Usage: Load this module and read `<debugfs>/hung_task/mutex`,
+ *        `<debugfs>/hung_task/semaphore`, etc., with 2 or more processes.
+ *
+ * This is for testing kernel hung_task error messages with various locking
+ * mechanisms (e.g., mutex, semaphore, etc.). Note that this may freeze
+ * your system or cause a panic. Use only for testing purposes.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/semaphore.h>
+
+#define HUNG_TASK_DIR		"hung_task"
+#define HUNG_TASK_MUTEX_FILE	"mutex"
+#define HUNG_TASK_SEM_FILE	"semaphore"
+#define SLEEP_SECOND		256
+
+static const char dummy_string[] = "This is a dummy string.";
+static DEFINE_MUTEX(dummy_mutex);
+static DEFINE_SEMAPHORE(dummy_sem, 1);
+static struct dentry *hung_task_dir;
+
+/* Mutex-based read function */
+static ssize_t read_dummy_mutex(struct file *file, char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	/* Second task waits on mutex, entering uninterruptible sleep */
+	guard(mutex)(&dummy_mutex);
+
+	/* First task sleeps here, interruptible */
+	msleep_interruptible(SLEEP_SECOND * 1000);
+
+	return simple_read_from_buffer(user_buf, count, ppos, dummy_string,
+				       sizeof(dummy_string));
+}
+
+/* Semaphore-based read function */
+static ssize_t read_dummy_semaphore(struct file *file, char __user *user_buf,
+				    size_t count, loff_t *ppos)
+{
+	/* Second task waits on semaphore, entering uninterruptible sleep */
+	down(&dummy_sem);
+
+	/* First task sleeps here, interruptible */
+	msleep_interruptible(SLEEP_SECOND * 1000);
+
+	up(&dummy_sem);
+
+	return simple_read_from_buffer(user_buf, count, ppos, dummy_string,
+				       sizeof(dummy_string));
+}
+
+/* File operations for mutex */
+static const struct file_operations hung_task_mutex_fops = {
+	.read = read_dummy_mutex,
+};
+
+/* File operations for semaphore */
+static const struct file_operations hung_task_sem_fops = {
+	.read = read_dummy_semaphore,
+};
+
+static int __init hung_task_tests_init(void)
+{
+	hung_task_dir = debugfs_create_dir(HUNG_TASK_DIR, NULL);
+	if (IS_ERR(hung_task_dir))
+		return PTR_ERR(hung_task_dir);
+
+	/* Create debugfs files for mutex and semaphore tests */
+	debugfs_create_file(HUNG_TASK_MUTEX_FILE, 0400, hung_task_dir, NULL,
+			    &hung_task_mutex_fops);
+	debugfs_create_file(HUNG_TASK_SEM_FILE, 0400, hung_task_dir, NULL,
+			    &hung_task_sem_fops);
+
+	return 0;
+}
+
+static void __exit hung_task_tests_exit(void)
+{
+	debugfs_remove_recursive(hung_task_dir);
+}
+
+module_init(hung_task_tests_init);
+module_exit(hung_task_tests_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Masami Hiramatsu <mhiramat@kernel.org>");
+MODULE_AUTHOR("Zi Li <amaindex@outlook.com>");
+MODULE_DESCRIPTION("Simple sleep under lock files for testing hung task");
-- 
2.49.0

