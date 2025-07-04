Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA83257C2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615841; cv=none; b=UKIE1UDeFrvCLYqNJKUae+hGWi6n06NDJmAnjG5n2GGTymcMhUCpIsIlNX0w/oE4eAJXNn3oKhmaCB0ho0xQAIHoaPrkxkUx3kZv8cVNjvO2eawvdo/K64dd4nMHC8IWhTAhpr5LHWbSu8gMsi8XvFR8j6BPFMNdHGcw35wdVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615841; c=relaxed/simple;
	bh=4CMG7CKyFsqz/xv0iHM3N/fNKnYNr2VNReejD6yUAR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjDxdJh29j9Ha7IkN0j3b/aJpFn55NL4Qx2HcVi0zpy6WFxjURPzBaIivXG0xgwxShw4OMIcE0X/mWOMDXJW6bcwMue5U8idX0FCMdqkP7X+xJGqMlM99YBw9Lpg0K9hjHv5zsD0+ovoBJZgjiXMm8s6IQLTJiF0pXfhy6tXc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 5647uVAl1550164;
	Fri, 4 Jul 2025 13:26:31 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5647uVqF1550163;
	Fri, 4 Jul 2025 13:26:31 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v10 2/4] drm: add debugfs support on per client-id basis
Date: Fri,  4 Jul 2025 13:25:46 +0530
Message-Id: <20250704075548.1549849-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704075548.1549849-1-sunil.khatri@amd.com>
References: <20250704075548.1549849-1-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

add support to add a directory for each client-id
with root at the dri level. Since the clients are
unique and not just related to one single drm device,
so it makes more sense to add all the client based
nodes with root as dri.

Also create a debugfs file which show the process
information for the client and create a symlink back
to the parent drm device from each client.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 81 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_file.c    | 11 +++++
 include/drm/drm_debugfs.h     | 11 +++++
 include/drm/drm_file.h        |  7 +++
 4 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index a084d16a3cb4..365cf337529f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -311,6 +311,87 @@ void drm_debugfs_remove_root(void)
 	debugfs_remove(drm_debugfs_root);
 }
 
+static int drm_debugfs_proc_info_show(struct seq_file *m, void *unused)
+{
+	struct pid *pid;
+	struct task_struct *task;
+	struct drm_file *file = m->private;
+
+	if (!file)
+		return -EINVAL;
+
+	rcu_read_lock();
+	pid = rcu_dereference(file->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+
+	seq_printf(m, "pid: %d\n", task ? task->pid : 0);
+	seq_printf(m, "comm: %s\n", task ? task->comm : "Unset");
+	rcu_read_unlock();
+	return 0;
+}
+
+static int drm_debufs_proc_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, drm_debugfs_proc_info_show, inode->i_private);
+}
+
+static const struct file_operations drm_debugfs_proc_info_fops = {
+	.owner = THIS_MODULE,
+	.open = drm_debufs_proc_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+/**
+ * drm_debugfs_clients_add - Add a per client debugfs directory
+ * @file: drm_file for a client
+ *
+ * Create the debugfs directory for each client. This will be used to populate
+ * driver specific data for each client.
+ *
+ * Also add the process information debugfs file for each client to tag
+ * which client belongs to which process.
+ */
+void drm_debugfs_clients_add(struct drm_file *file)
+{
+	char *client;
+
+	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
+	if (!client)
+		return;
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
+	kfree(client);
+
+	debugfs_create_file("proc_info", 0444, file->debugfs_client, file,
+			    &drm_debugfs_proc_info_fops);
+
+	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
+	if (!client)
+		return;
+
+	/* Create a link from client_id to the drm device this client id belongs to */
+	debugfs_create_symlink("device", file->debugfs_client, client);
+	kfree(client);
+}
+
+/**
+ * drm_debugfs_clients_remove - removes all debugfs directories and files
+ * @file: drm_file for a client
+ *
+ * Removes the debugfs directories recursively from the client directory.
+ *
+ * There is also a possibility that debugfs files are open while the drm_file
+ * is released.
+ */
+void drm_debugfs_clients_remove(struct drm_file *file)
+{
+	debugfs_remove_recursive(file->debugfs_client);
+	file->debugfs_client = NULL;
+}
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 3952e27447ee..eebd1a05ee97 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -46,6 +46,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -168,6 +169,9 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	drm_prime_init_file_private(&file->prime);
 
+	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		drm_debugfs_clients_add(file);
+
 	if (dev->driver->open) {
 		ret = dev->driver->open(dev, file);
 		if (ret < 0)
@@ -182,6 +186,10 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 		drm_syncobj_release(file);
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_release(dev, file);
+
+	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		drm_debugfs_clients_remove(file);
+
 	put_pid(rcu_access_pointer(file->pid));
 	kfree(file);
 
@@ -236,6 +244,9 @@ void drm_file_free(struct drm_file *file)
 		     (long)old_encode_dev(file->minor->kdev->devt),
 		     atomic_read(&dev->open_count));
 
+	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		drm_debugfs_clients_remove(file);
+
 	drm_events_release(file);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index cf06cee4343f..ea8cba94208a 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
 
 int drm_debugfs_gpuva_info(struct seq_file *m,
 			   struct drm_gpuvm *gpuvm);
+
+void drm_debugfs_clients_add(struct drm_file *file);
+void drm_debugfs_clients_remove(struct drm_file *file);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
 {
 	return 0;
 }
+
+static inline void drm_debugfs_clients_add(struct drm_file *file)
+{
+}
+
+static inline void drm_debugfs_clients_remove(struct drm_file *file)
+{
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..eab7546aad79 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -400,6 +400,13 @@ struct drm_file {
 	 * @client_name_lock: Protects @client_name.
 	 */
 	struct mutex client_name_lock;
+
+	/**
+	 * @debugfs_client:
+	 *
+	 * debugfs directory for each client under a drm node.
+	 */
+	struct dentry *debugfs_client;
 };
 
 /**
-- 
2.34.1

