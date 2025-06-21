Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67517BD9;
	Sat, 21 Jun 2025 03:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750475698; cv=none; b=th1R74YoxvhJ7hopZJUI5MJEPwQr7p5WHVSaD9hYxdDIuC3chphFfw+tJab9QR3WQfqDWhrAUNRK/zz+qYmfVJlDOHT9mbKMXIMunpv8325li+NI6ll7ARAYFA22g8fr43QsLTamX7oeynuH2nsjkRiclNBtX0hVlZEYvd3W/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750475698; c=relaxed/simple;
	bh=mYPWYKu7cs8sYpUr06SPVxvvd4NaazFsx/56ns0vbUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i6Euq5EUs3We455+zGeipCrFSPnwR6iiqKsntcI7CRf5OSndfnmrVO+/6UVt9QBo+xxZx4hQeCNLRyU4ZIJvSLuJ7/5Ecqh+zBCDsLOYW+e9VSsVlAHjCFTIF770xAQ3W2wZIpjeAHxwJOLiYuNxdzCq7lFTl/5FsXfzsCy3fdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFsmBcPE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFsmBcPE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2972922b3a.0;
        Fri, 20 Jun 2025 20:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750475696; x=1751080496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJyuOMnKmGrLpCICn3PraIN85lAocywpTvtVDYaMEpc=;
        b=IFsmBcPEu8nJkwym9T0VSMIRnmI5hHdZN9UCg64rjL5czXAucIcwr541AmEuqEv4rL
         kfGoZxq4ec3iPi2SUctNIZ1KOfZekdcNqucOvnWv0JfTT2riPSAat0cfhh/+0e5iuCFt
         /hfFq5IHMGDz6V66hI1trNZV/gtP+4BP7cwQT0bMrbNBZmRUOlvdJJsAhH8Mle+V8BeN
         FOEbHenIFvqzGWzh+1xmS2VLKnwp2sFqFmp0ho/MsceXz7+mUuoCcfNMP/OhAr7RjC/d
         DUKWZl1ItA0Bp9b8hzRzyxyqfeVgYjNSY23D4LKC+x3xmJY8oT6+6Cp4QMniWjrbOFOw
         srlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750475696; x=1751080496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJyuOMnKmGrLpCICn3PraIN85lAocywpTvtVDYaMEpc=;
        b=YMOX+H4/qIKgVuQQG7pb1bCU8dkCGmkktf7q37Pd2UYnBzvYCo3eUaAjI/34pswfgY
         fKvKskowXfdKTs33pezwzV2yJSYouFiD6VfJMeFxzo7A/bih75m/bpcbgOS8bFIMKnYa
         qrhPOa9h294hiLZRkMNa1YLE02yketQJVsywuj2JnKvucn1rh6Tv7xTy6x84apQAGN15
         oUHOVlG4ZNE2bqVWO7BDOQbZn0mWvZL+Y+vMadyCU9Ao27YB+q1ZAAujZ/7TRfjw7tBq
         zr35qIFTC/b3GameeCGu67+4ne08SR7eqxuOdROXJGAfIGnXMXMqNG0ppWszfTq3xhG7
         yDnw==
X-Gm-Message-State: AOJu0YzNN7IAJghnmGkUPIrgno7b/huo2cZLHybMBEI0xQ2Tnulys4+G
	p41sF1CTfy7xgDY6Rl3xIjuj6prf4e1b0twlerdkB8xEI/QUZy0m4L3fdPQQyb8B
X-Gm-Gg: ASbGncumpd4apHMPM4plb2oi6GMfqxwbMqUwrnv3Nz76L9Osk1KP5/HtTdkg+9GeZh7
	LpZKbNqM1etj9ulGG8ZYt8qKT9dYx78r83bkbofY3Ur/tEg4VgzOzRxSRuapZxb97r2S/mz2qJ1
	ZWglQJr3ytxrpfmgGo5PpPjX4SGjuaXtqhu3QUvuaLJCnh/9twlNftX4slCGdBwe2xUgBeakXdi
	LQ1cPq+UyWzOzXvUmmFQ0G8FIAF6r2Rm1Au2JFUlFXesI6oye83DcGdzExTbzx+UOwpVHjb35z5
	Jmj6LKtvKzYK3Qz6v2c0E6RbhpaFrEb6SUBWbA9kiQnvbIdjztaOP3l2NQzPn22UZbtgpiWXJK/
	++r5lSfk=
X-Google-Smtp-Source: AGHT+IGIJIkY/sdIu/h7c+3WLsZdw0o2omEtWfacubG59/sbVA52TlUfWwTgFvxLm26hV4ckasiJIA==
X-Received: by 2002:a05:6a00:2d8c:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7490d6635femr7183493b3a.2.1750475696094;
        Fri, 20 Jun 2025 20:14:56 -0700 (PDT)
Received: from INBOOKX2PLUS.localdomain ([223.178.82.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a66a763sm3252364b3a.141.2025.06.20.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 20:14:55 -0700 (PDT)
From: Sasikumar C <sasikumar4289@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	Sasikumar C <sasikumar4289@gmail.com>
Subject: [PATCH] Add Machine Learning Core kernel driver with Kconfig and documentation for future Linux systems
Date: Sat, 21 Jun 2025 08:44:50 +0530
Message-ID: <20250621031451.81063-1-sasikumar4289@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 Documentation/index.rst                    |   8 +
 Documentation/misc/mlcore_driver.rst       |  65 ++++++
 drivers/misc/Kconfig                       |   1 +
 drivers/misc/Makefile                      |   1 +
 drivers/misc/mlcore/Kconfig                |   7 +
 drivers/misc/mlcore/Makefile               |   1 +
 drivers/misc/mlcore/mlcore_ioctl_proc_ts.c | 221 +++++++++++++++++++++
 7 files changed, 304 insertions(+)
 create mode 100644 Documentation/misc/mlcore_driver.rst
 create mode 100644 drivers/misc/mlcore/Kconfig
 create mode 100644 drivers/misc/mlcore/Makefile
 create mode 100644 drivers/misc/mlcore/mlcore_ioctl_proc_ts.c

diff --git a/Documentation/index.rst b/Documentation/index.rst
index c0cf79a87c3a..bdf9858b7017 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -127,3 +127,11 @@ Indices and tables
 ==================
 
 * :ref:`genindex`
+
+Miscellaneous
+=============
+
+.. toctree::
+   :maxdepth: 1
+
+   misc/mlcore_driver
diff --git a/Documentation/misc/mlcore_driver.rst b/Documentation/misc/mlcore_driver.rst
new file mode 100644
index 000000000000..9c274bdb98f5
--- /dev/null
+++ b/Documentation/misc/mlcore_driver.rst
@@ -0,0 +1,65 @@
+==============================
+MLCore Kernel ML Driver Guide
+==============================
+
+Overview
+--------
+
+This document describes the MLCore kernel-space machine learning driver,
+which supports:
+
+- Hybrid kernel + user-space ML workflows
+- IOCTL-based communication for inference and retraining
+- /proc interface for result + training data observation
+- History of predictions with timestamps
+- Optional persistent logging to /var/log/mlcore.log
+
+IOCTL Commands
+--------------
+
+The driver supports the following `ioctl()` commands:
+
+- `IOCTL_SEND_INTS`: Send 3 fixed-point input features (int32)
+- `IOCTL_SET_RESULT`: Set prediction result (int)
+- `IOCTL_GET_RESULT`: Retrieve last prediction
+- `IOCTL_ADD_TRAINING`: Add new training entry (features + label)
+- `IOCTL_CLEAR_TRAINING`: Clear all training data
+
+Procfs Interfaces
+-----------------
+
+- `/proc/mlcore_result` – current prediction + timestamped history
+- `/proc/mlcore_train`  – list of all training entries
+
+Device Node
+-----------
+
+The device can be accessed via:
+
+.. code-block:: bash
+
+    /dev/mlcore
+
+Major number used: `104` (or dynamic via devtmpfs + udev rule)
+
+Example Usage
+-------------
+
+From user space:
+
+.. code-block:: python
+
+    import fcntl, struct
+
+    fd = open(\"/dev/mlcore\", \"wb\")
+    features = [123, 456, 789]  # fixed-point (e.g., 1.23, 4.56)
+    packed = struct.pack(\"3i\", *features)
+    fcntl.ioctl(fd, 0x6800, packed)
+
+See `scripts/train_data_sender.py` for more.
+
+License
+-------
+
+This driver is licensed under GPL and authored by Sasikumar C.
+
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index b9ca56930003..73bb67f741a4 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -660,4 +660,5 @@ source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
 source "drivers/misc/amd-sbi/Kconfig"
+source "drivers/misc/mlcore/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 917b9a7183aa..8ebd4e08fea7 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -75,3 +75,4 @@ lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
 obj-y				+= amd-sbi/
+obj-$(CONFIG_MLCORE_DRIVER)     += mlcore/
\ No newline at end of file
diff --git a/drivers/misc/mlcore/Kconfig b/drivers/misc/mlcore/Kconfig
new file mode 100644
index 000000000000..005eb73b5d2f
--- /dev/null
+++ b/drivers/misc/mlcore/Kconfig
@@ -0,0 +1,7 @@
+config MLCORE_DRIVER
+    tristate "MLCore Machine Learning Kernel Driver"
+    depends on PROC_FS
+    help
+      A kernel-space ML helper driver with /proc and ioctl support.
+      Useful for hybrid kernel/user-space machine learning interaction.
+
diff --git a/drivers/misc/mlcore/Makefile b/drivers/misc/mlcore/Makefile
new file mode 100644
index 000000000000..6fe653e4177c
--- /dev/null
+++ b/drivers/misc/mlcore/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MLCORE_DRIVER) += mlcore_ioctl_proc_ts.o
diff --git a/drivers/misc/mlcore/mlcore_ioctl_proc_ts.c b/drivers/misc/mlcore/mlcore_ioctl_proc_ts.c
new file mode 100644
index 000000000000..e53c1aa3835d
--- /dev/null
+++ b/drivers/misc/mlcore/mlcore_ioctl_proc_ts.c
@@ -0,0 +1,221 @@
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <linux/ioctl.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <linux/timekeeping.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/ktime.h>
+#include <linux/err.h>
+
+#define DEVICE_NAME   "mlcore"
+#define PROC_RESULT   "mlcore_result"
+#define PROC_TRAIN    "mlcore_train"
+#define LOG_FILE_PATH "/var/log/mlcore.log"
+#define MAJOR_NUM     104
+
+#define IOCTL_SEND_INTS        _IOW(MAJOR_NUM, 0, int[3])
+#define IOCTL_SET_RESULT       _IOW(MAJOR_NUM, 1, int)
+#define IOCTL_GET_RESULT       _IOR(MAJOR_NUM, 2, int *)
+#define IOCTL_ADD_TRAINING     _IOW(MAJOR_NUM, 3, struct train_entry)
+#define IOCTL_CLEAR_TRAINING   _IO(MAJOR_NUM, 4)
+
+#define HISTORY_SIZE 10
+#define MAX_TRAINING_ENTRIES 50
+
+struct prediction_entry {
+    int result;
+    struct timespec64 timestamp;
+};
+
+struct train_entry {
+    int features[3]; // fixed-point representation: value * 100
+    int label;
+};
+
+static int features[3];
+static struct prediction_entry history[HISTORY_SIZE];
+static int hist_index = 0;
+static int hist_count = 0;
+static int latest_result = -1;
+
+static struct train_entry training_data[MAX_TRAINING_ENTRIES];
+static int train_count = 0;
+
+static void log_to_file(int result) {
+    struct file *filp;
+    struct timespec64 ts;
+    struct tm tm;
+    char log_msg[128];
+    ssize_t written;
+    loff_t pos = 0;
+
+    ktime_get_real_ts64(&ts);
+    time64_to_tm(ts.tv_sec, 0, &tm);
+
+    snprintf(log_msg, sizeof(log_msg),
+             "%04ld-%02d-%02d %02d:%02d:%02d - Prediction: %d\n",
+             tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+             tm.tm_hour, tm.tm_min, tm.tm_sec,
+             result);
+
+    filp = filp_open(LOG_FILE_PATH, O_WRONLY | O_CREAT | O_APPEND, 0644);
+    if (IS_ERR(filp)) {
+        printk(KERN_ERR "[mlcore] Failed to open log file.\n");
+        return;
+    }
+
+    written = kernel_write(filp, log_msg, strlen(log_msg), &pos);
+    if (written < 0) {
+        printk(KERN_ERR "[mlcore] Failed to write to log file.\n");
+    }
+
+    filp_close(filp, NULL);
+}
+
+static long dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
+    switch (cmd) {
+        case IOCTL_SEND_INTS:
+            if (copy_from_user(features, (int __user *)arg, sizeof(features)))
+                return -EFAULT;
+            printk(KERN_INFO "[mlcore] Received features: %d.%02d %d.%02d %d.%02d\n",
+                   features[0]/100, abs(features[0]%100),
+                   features[1]/100, abs(features[1]%100),
+                   features[2]/100, abs(features[2]%100));
+            return 0;
+
+        case IOCTL_SET_RESULT: {
+            int result;
+            if (copy_from_user(&result, (int __user *)arg, sizeof(int)))
+                return -EFAULT;
+
+            latest_result = result;
+
+            history[hist_index].result = result;
+            ktime_get_real_ts64(&history[hist_index].timestamp);
+            hist_index = (hist_index + 1) % HISTORY_SIZE;
+            if (hist_count < HISTORY_SIZE) hist_count++;
+
+            log_to_file(result);
+            printk(KERN_INFO "[mlcore] Prediction set: %d\n", result);
+            return 0;
+        }
+
+        case IOCTL_GET_RESULT:
+            if (copy_to_user((int __user *)arg, &latest_result, sizeof(int)))
+                return -EFAULT;
+            return 0;
+
+        case IOCTL_ADD_TRAINING: {
+            struct train_entry entry;
+            if (copy_from_user(&entry, (struct train_entry __user *)arg, sizeof(entry)))
+                return -EFAULT;
+            if (train_count < MAX_TRAINING_ENTRIES) {
+                training_data[train_count++] = entry;
+                printk(KERN_INFO "[mlcore] Training data added: %d.%02d %d.%02d %d.%02d => %d\n",
+                       entry.features[0]/100, abs(entry.features[0]%100),
+                       entry.features[1]/100, abs(entry.features[1]%100),
+                       entry.features[2]/100, abs(entry.features[2]%100),
+                       entry.label);
+            } else {
+                printk(KERN_WARNING "[mlcore] Training buffer full!\n");
+            }
+            return 0;
+        }
+
+        case IOCTL_CLEAR_TRAINING:
+            train_count = 0;
+            printk(KERN_INFO "[mlcore] Training buffer cleared\n");
+            return 0;
+
+        default:
+            return -EINVAL;
+    }
+}
+
+static int proc_result_show(struct seq_file *m, void *v) {
+    int i, idx;
+    struct prediction_entry *entry;
+    struct tm tm;
+
+    seq_printf(m, "Current Prediction: %d\n", latest_result);
+    seq_printf(m, "Prediction History (latest %d):\n", hist_count);
+
+    for (i = 0; i < hist_count; i++) {
+        idx = (hist_index + HISTORY_SIZE - hist_count + i) % HISTORY_SIZE;
+        entry = &history[idx];
+        time64_to_tm(entry->timestamp.tv_sec, 0, &tm);
+        seq_printf(m, "  [%d]: %d at %04ld-%02d-%02d %02d:%02d:%02d\n",
+                   i, entry->result,
+                   tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+                   tm.tm_hour, tm.tm_min, tm.tm_sec);
+    }
+    return 0;
+}
+
+static int proc_train_show(struct seq_file *m, void *v) {
+    int i;
+    for (i = 0; i < train_count; i++) {
+        seq_printf(m, "[%d]: %d.%02d %d.%02d %d.%02d => %d\n", i,
+                   training_data[i].features[0]/100, abs(training_data[i].features[0]%100),
+                   training_data[i].features[1]/100, abs(training_data[i].features[1]%100),
+                   training_data[i].features[2]/100, abs(training_data[i].features[2]%100),
+                   training_data[i].label);
+    }
+    return 0;
+}
+
+static int proc_result_open(struct inode *inode, struct file *file) {
+    return single_open(file, proc_result_show, NULL);
+}
+
+static int proc_train_open(struct inode *inode, struct file *file) {
+    return single_open(file, proc_train_show, NULL);
+}
+
+static const struct proc_ops proc_result_fops = {
+    .proc_open    = proc_result_open,
+    .proc_read    = seq_read,
+    .proc_lseek   = seq_lseek,
+    .proc_release = single_release,
+};
+
+static const struct proc_ops proc_train_fops = {
+    .proc_open    = proc_train_open,
+    .proc_read    = seq_read,
+    .proc_lseek   = seq_lseek,
+    .proc_release = single_release,
+};
+
+static int dev_open(struct inode *inode, struct file *file) { return 0; }
+static int dev_release(struct inode *inode, struct file *file) { return 0; }
+
+static struct file_operations fops = {
+    .unlocked_ioctl = dev_ioctl,
+    .open = dev_open,
+    .release = dev_release,
+};
+
+static int __init mlcore_init(void) {
+    register_chrdev(MAJOR_NUM, DEVICE_NAME, &fops);
+    proc_create(PROC_RESULT, 0, NULL, &proc_result_fops);
+    proc_create(PROC_TRAIN, 0, NULL, &proc_train_fops);
+    printk(KERN_INFO "[mlcore] Loaded with fixed-point logging.\n");
+    return 0;
+}
+
+static void __exit mlcore_exit(void) {
+    unregister_chrdev(MAJOR_NUM, DEVICE_NAME);
+    remove_proc_entry(PROC_RESULT, NULL);
+    remove_proc_entry(PROC_TRAIN, NULL);
+    printk(KERN_INFO "[mlcore] Unloaded.\n");
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sasikumar C <sasikumar4289@gmail.com>");
+MODULE_DESCRIPTION("ML driver using fixed-point instead of float");
+module_init(mlcore_init);
+module_exit(mlcore_exit);
-- 
2.43.0

