Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAF221FA4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009407; cv=none; b=M1eqReyWcljP9wqFynN7193VGoO3smj15Y/BtxcgkBErwiQluj/LLxZrW65x2K/2yYnseRYoP/IQ7yXQbv4FgCqXowGbyMerWAiDnGGxnjGDQHl/7FFN9MnX1POqFrYGDQaqjPZfkDM4MF91pzZC54ayvCa7JF1oHtQkQAEbR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009407; c=relaxed/simple;
	bh=gLq5QR5UkZcDNZ4qEDEV0UgI3bwdOXiGKr7EDDC5UEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH3P7+BA5cPBwSiR3DCpWVVTjZiB3VJTeztCOehHP0E/5PaPut+RwLrkyOKy3c0EN+pDPAXm0zh6oBBoTrPhmZ9YgkIIO0BXpTKyeWfzrL65iGh5o/vXFg/bUWwYNNnCh7hfwfcrpytIVNwP+JHa10tWeD9M6hiAWv/hkt9S/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx1B+4/Z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx1B+4/Z"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1075914f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009404; x=1751614204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZx7HLeDxFUsTV7MB27dJE7edqAxtdtwVAh6e83NzOY=;
        b=jx1B+4/ZaITLW7T3f5modf4Q44sMWwaaTUcHE/eUzcPTe1AcrYKehHiEzTfiCfmO4r
         nK6Xz0hTJdvv9gWuRoQtRuN4/qHDriOFjSZNLBDiP7bNXxSoiPN93jp0vw1P0NfjxLTd
         1T8CBIkCnIv7mHqBJgKelRtDy1gqAMxbSooQQCNhJaI5qWqcgt64EV7R3oVeSAYIdSNb
         QKM86Z9whqbE6cR++ManLg398hUZLJYIdmXSXE9yNY0gJC8+2ATTH3kqz+Fl5rsd92n4
         LYSyZtFcs4MgI4INpX3OvkSVHjwpucTi8R0nWd6dvtDV/XaC7fQA4mczp+xOx+/k6kP/
         Xq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009404; x=1751614204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZx7HLeDxFUsTV7MB27dJE7edqAxtdtwVAh6e83NzOY=;
        b=OQ7mGI0G5kf7ZknKOQ4cohTdF6Pi3le6C1nq7EWnawNHQpLXIfDpj3ohYTpEr2oo3b
         3wPrbMJpQhRe0rEyZSqBcWPayXea+KQ6xn7N06Z5QoVqDHGQM+btjSWYNFwsHyKhOOFZ
         3VCVycaFlr57OAUDXoySaTnK1+9Q6SaMYwr1eVsOoKimkDeC1GOQyXK7jI8U96LepLsG
         4AAzfgnvxEGieW/uoBn/5Vdzh+X3K1qhHH3McaWmkdqeAYLapgzyFcFX9lQQBw6Ft6H2
         +oXK39KEbEA/dKG9n5lieVhWxFsmtlo2FGMRYwI68KNRvcYQxBW2Q4b/Y+i5SiUaXJrl
         L4zw==
X-Forwarded-Encrypted: i=1; AJvYcCXkBw+RulktkBOMv80oaQ2Ur3oVzmcX4kjoT7EHcStmtK/O6amcs/KTDhY83tqbL9a5IN/wXy7KSIB3L1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxtCA9cr2FMkk876B4Tk74X+k1flSCY/j2Bx1OlHSmfUORDo+
	SPemOdctCmTyL1uokU0ARwOF+UQxBy3HgEq/mkWQ6iQNECF6BO/dEIZy
X-Gm-Gg: ASbGncsWSjPklUvawTZPB+VkH0aV7YYXib9V9IuKTCgckhVkhosw9/hSBrGXKBoxxis
	YlRG6gE7GQlMSMVY9Q3jgYE57VlOqTkzOtT4u/JOGdbDuTVDnrFr7n9W9+rE8BsF8eE9ILh2ZIn
	jmTNZooMkjKAPjo7B1RbT+j3NnKbbrSo/or9Cc7ppSkRh0z7D0FTkR7pG0JVCEWv5/7IjWDjakm
	UpcOY+lRnV22gQ0hUf2lWEhsKOJsgiY1f7mhKQKeGk53XirsowakIq1bcioagPx4QAXR/EsgQAW
	HCC3E2lq268YVB8G7Wk1g7VcqqMSB1lZU2pxq30SdI2kImSI
X-Google-Smtp-Source: AGHT+IHLxuzOhCr2ZOuAnoMckWZohG8XUTUNZtVdZrbctK4w8YIIgD/ecNFvLienpmYMqTMQ43Nwvg==
X-Received: by 2002:a5d:59c9:0:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a8feb851f2mr1958251f8f.40.1751009403503;
        Fri, 27 Jun 2025 00:30:03 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72b6sm1955665f8f.15.2025.06.27.00.29.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Jun 2025 00:30:03 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org
Subject: [PATCH 3/3] samples: enhance hung_task detector test with read-write semaphore support
Date: Fri, 27 Jun 2025 15:29:24 +0800
Message-ID: <20250627072924.36567-4-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627072924.36567-1-lance.yang@linux.dev>
References: <20250627072924.36567-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zi Li <zi.li@linux.dev>

Extend the hung_task detector test module to include read-write semaphore
support alongside existing mutex and semaphore tests. This module now
creates additional debugfs files under <debugfs>/hung_task, namely
'rw_semaphore_read' and 'rw_semaphore_write', in addition to 'mutex' and
'semaphore'. Reading these files with multiple processes triggers a
prolonged sleep (256 seconds) while holding the respective lock, enabling
hung_task detector testing for various locking mechanisms.

This change builds on the extensible hung_task_tests module, adding
read-write semaphore functionality to improve test coverage for kernel
locking primitives. The implementation ensures proper lock handling and
includes checks to prevent redundant data reads.

Usage is:

        > cd /sys/kernel/debug/hung_task
        > cat mutex & cat mutex           # Test mutex blocking
        > cat semaphore & cat semaphore   # Test semaphore blocking
        > cat rw_semaphore_write \
            & cat rw_semaphore_read       # Test rwsem blocking
        > cat rw_semaphore_write \
            & cat rw_semaphore_write      # Test rwsem blocking

Update the Kconfig description to reflect the addition of read-write
semaphore debugfs files.

Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Zi Li <zi.li@linux.dev>
---
 samples/Kconfig                     |  7 ++-
 samples/hung_task/hung_task_tests.c | 81 ++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index ffef99950206..a8880c62d4c8 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -316,10 +316,9 @@ config SAMPLE_HUNG_TASK
 	depends on DETECT_HUNG_TASK && DEBUG_FS
 	help
 	  Build a module that provides debugfs files (e.g., mutex, semaphore,
-	  etc.) under <debugfs>/hung_task. If user reads one of these files,
-	  it will sleep long time (256 seconds) with holding a lock. Thus,
-	  if 2 or more processes read the same file concurrently, it will
-	  be detected by the hung_task watchdog.
+	  rw_semaphore_read, rw_semaphore_write) under <debugfs>/hung_task.
+	  Reading these files with multiple processes triggers hung task
+	  detection by holding locks for a long time (256 seconds).
 
 source "samples/rust/Kconfig"
 
diff --git a/samples/hung_task/hung_task_tests.c b/samples/hung_task/hung_task_tests.c
index a5c09bd3a47d..0360ec916890 100644
--- a/samples/hung_task/hung_task_tests.c
+++ b/samples/hung_task/hung_task_tests.c
@@ -4,11 +4,12 @@
  * semaphore, etc.
  *
  * Usage: Load this module and read `<debugfs>/hung_task/mutex`,
- *        `<debugfs>/hung_task/semaphore`, etc., with 2 or more processes.
+ *        `<debugfs>/hung_task/semaphore`, `<debugfs>/hung_task/rw_semaphore_read`,
+ *        `<debugfs>/hung_task/rw_semaphore_write`, etc., with 2 or more processes.
  *
  * This is for testing kernel hung_task error messages with various locking
- * mechanisms (e.g., mutex, semaphore, etc.). Note that this may freeze
- * your system or cause a panic. Use only for testing purposes.
+ * mechanisms (e.g., mutex, semaphore, rw_semaphore_read, rw_semaphore_write, etc.).
+ * Note that this may freeze your system or cause a panic. Use only for testing purposes.
  */
 
 #include <linux/debugfs.h>
@@ -17,21 +18,29 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/semaphore.h>
+#include <linux/rwsem.h>
 
-#define HUNG_TASK_DIR		"hung_task"
-#define HUNG_TASK_MUTEX_FILE	"mutex"
-#define HUNG_TASK_SEM_FILE	"semaphore"
-#define SLEEP_SECOND		256
+#define HUNG_TASK_DIR			"hung_task"
+#define HUNG_TASK_MUTEX_FILE		"mutex"
+#define HUNG_TASK_SEM_FILE		"semaphore"
+#define HUNG_TASK_RWSEM_READ_FILE	"rw_semaphore_read"
+#define HUNG_TASK_RWSEM_WRITE_FILE	"rw_semaphore_write"
+#define SLEEP_SECOND			256
 
 static const char dummy_string[] = "This is a dummy string.";
 static DEFINE_MUTEX(dummy_mutex);
 static DEFINE_SEMAPHORE(dummy_sem, 1);
+static DECLARE_RWSEM(dummy_rwsem);
 static struct dentry *hung_task_dir;
 
 /* Mutex-based read function */
 static ssize_t read_dummy_mutex(struct file *file, char __user *user_buf,
 				size_t count, loff_t *ppos)
 {
+	/* Check if data is already read */
+	if (*ppos >= sizeof(dummy_string))
+		return 0;
+
 	/* Second task waits on mutex, entering uninterruptible sleep */
 	guard(mutex)(&dummy_mutex);
 
@@ -46,6 +55,10 @@ static ssize_t read_dummy_mutex(struct file *file, char __user *user_buf,
 static ssize_t read_dummy_semaphore(struct file *file, char __user *user_buf,
 				    size_t count, loff_t *ppos)
 {
+	/* Check if data is already read */
+	if (*ppos >= sizeof(dummy_string))
+		return 0;
+
 	/* Second task waits on semaphore, entering uninterruptible sleep */
 	down(&dummy_sem);
 
@@ -58,6 +71,46 @@ static ssize_t read_dummy_semaphore(struct file *file, char __user *user_buf,
 				       sizeof(dummy_string));
 }
 
+/* Read-write semaphore read function */
+static ssize_t read_dummy_rwsem_read(struct file *file, char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	/* Check if data is already read */
+	if (*ppos >= sizeof(dummy_string))
+		return 0;
+
+	/* Acquires read lock, allowing concurrent readers but blocks if write lock is held */
+	down_read(&dummy_rwsem);
+
+	/* Sleeps here, potentially triggering hung task detection if lock is held too long */
+	msleep_interruptible(SLEEP_SECOND * 1000);
+
+	up_read(&dummy_rwsem);
+
+	return simple_read_from_buffer(user_buf, count, ppos, dummy_string,
+				       sizeof(dummy_string));
+}
+
+/* Read-write semaphore write function */
+static ssize_t read_dummy_rwsem_write(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	/* Check if data is already read */
+	if (*ppos >= sizeof(dummy_string))
+		return 0;
+
+	/* Acquires exclusive write lock, blocking all other readers and writers */
+	down_write(&dummy_rwsem);
+
+	/* Sleeps here, potentially triggering hung task detection if lock is held too long */
+	msleep_interruptible(SLEEP_SECOND * 1000);
+
+	up_write(&dummy_rwsem);
+
+	return simple_read_from_buffer(user_buf, count, ppos, dummy_string,
+				       sizeof(dummy_string));
+}
+
 /* File operations for mutex */
 static const struct file_operations hung_task_mutex_fops = {
 	.read = read_dummy_mutex,
@@ -68,6 +121,16 @@ static const struct file_operations hung_task_sem_fops = {
 	.read = read_dummy_semaphore,
 };
 
+/* File operations for rw_semaphore read */
+static const struct file_operations hung_task_rwsem_read_fops = {
+	.read = read_dummy_rwsem_read,
+};
+
+/* File operations for rw_semaphore write */
+static const struct file_operations hung_task_rwsem_write_fops = {
+	.read = read_dummy_rwsem_write,
+};
+
 static int __init hung_task_tests_init(void)
 {
 	hung_task_dir = debugfs_create_dir(HUNG_TASK_DIR, NULL);
@@ -79,6 +142,10 @@ static int __init hung_task_tests_init(void)
 			    &hung_task_mutex_fops);
 	debugfs_create_file(HUNG_TASK_SEM_FILE, 0400, hung_task_dir, NULL,
 			    &hung_task_sem_fops);
+	debugfs_create_file(HUNG_TASK_RWSEM_READ_FILE, 0400, hung_task_dir, NULL,
+			    &hung_task_rwsem_read_fops);
+	debugfs_create_file(HUNG_TASK_RWSEM_WRITE_FILE, 0400, hung_task_dir, NULL,
+			    &hung_task_rwsem_write_fops);
 
 	return 0;
 }
-- 
2.49.0

