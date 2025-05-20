Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BD4255250
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724515; cv=none; b=Db6Sfio3sk6HHSu1Y8UJ7QA/ZEHFF3Zj+9JdV6mXbXtWwBtMl7slY2KJS3Eg3DN/Hu/af1DQHYXAhCi8WyQcXTxCvVqKoQun7VS05JmInGa4XvxUyTZ9Zrh3Fs4UHqw1A1X6NabwPvLLBcCCVuQM4zJpJsRxQ9zd71aHwa8G4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724515; c=relaxed/simple;
	bh=YJQouvoFwkbY/fOp2JD1wYmXX/okQ9EKMNpr2jY70WA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p8lcefW1Zi2seyoMA6Y92fjVQco0dXewUbvPbgSJgdV8z5E/6OYSupItKcTA4+LoSg9ErO9IC/B+BuTOytWfrvvANbOiqX6UBT1J3gZd1f1hKV0S1qAhuWDU97XvPs2W2VvnXhH+jv3Pb5X6eP2BW/CiKuh6rCL+a4nt0AI16Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LUPBYq9j; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LUPBYq9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MS
	evaegFQzBWfa3FzRcJhjO3v80wKbxaXbg9gIgT2c4=; b=LUPBYq9jBxRMmJfNYi
	PCqG1CMAt6bxU23EME7J4m8lNRxwAZS9bstyVak7pXItaKn9khk+2roif72aGJtq
	L0ZVhmkz4o1B59lfEw2Otp9gAjsMRYxtm7UoiUkgYxIMULGO33CWVUKiDWo4HaXG
	RwW2WHItTMV8QuSLWip3l4nac=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAHjbyoKCxoPgjwCg--.9174S2;
	Tue, 20 May 2025 15:00:57 +0800 (CST)
From: oushixiong1025@163.com
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/arm/komeda: Register sysfs groups through driver core
Date: Tue, 20 May 2025 15:00:46 +0800
Message-Id: <20250520070046.340122-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHjbyoKCxoPgjwCg--.9174S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JF4DZFy3Jw1DuF13KFy7Awb_yoW7urW8pF
	4xJa4UWrWUGF13C3yUCa18WF90kwn3K3yfJrW8uw1Ska42ya4ktFykZ34qyrWUJFZ5Cr17
	JFs0qFWj9rZakr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnVyxUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxtTD2gsIzaDNwAAsB

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY] If the call to sysfs_create_group() fails, there is no need to
      call function sysfs_remove_group().
      But if calling sysfs_create_group() fails, it will go to label
      'err_cleanup:' in komeda_dev_create(), and it will call
      komeda_dev_destroy() laterly.

[HOW] Register sysfs groups through driver core.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 .../gpu/drm/arm/display/komeda/komeda_dev.c   | 60 -------------------
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 51 ++++++++++++++++
 2 files changed, 51 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 5ba62e637a61..a285fec3be23 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -53,58 +53,6 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 			   &mdev->err_verbosity);
 }
 
-static ssize_t
-core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct komeda_dev *mdev = dev_to_mdev(dev);
-
-	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
-}
-static DEVICE_ATTR_RO(core_id);
-
-static ssize_t
-config_id_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct komeda_dev *mdev = dev_to_mdev(dev);
-	struct komeda_pipeline *pipe = mdev->pipelines[0];
-	union komeda_config_id config_id;
-	int i;
-
-	memset(&config_id, 0, sizeof(config_id));
-
-	config_id.max_line_sz = pipe->layers[0]->hsize_in.end;
-	config_id.n_pipelines = mdev->n_pipelines;
-	config_id.n_scalers = pipe->n_scalers;
-	config_id.n_layers = pipe->n_layers;
-	config_id.n_richs = 0;
-	for (i = 0; i < pipe->n_layers; i++) {
-		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
-			config_id.n_richs++;
-	}
-	return sysfs_emit(buf, "0x%08x\n", config_id.value);
-}
-static DEVICE_ATTR_RO(config_id);
-
-static ssize_t
-aclk_hz_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct komeda_dev *mdev = dev_to_mdev(dev);
-
-	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
-}
-static DEVICE_ATTR_RO(aclk_hz);
-
-static struct attribute *komeda_sysfs_entries[] = {
-	&dev_attr_core_id.attr,
-	&dev_attr_config_id.attr,
-	&dev_attr_aclk_hz.attr,
-	NULL,
-};
-
-static struct attribute_group komeda_sysfs_attr_group = {
-	.attrs = komeda_sysfs_entries,
-};
-
 static int komeda_parse_pipe_dt(struct komeda_pipeline *pipe)
 {
 	struct device_node *np = pipe->of_node;
@@ -253,12 +201,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 
 	clk_disable_unprepare(mdev->aclk);
 
-	err = sysfs_create_group(&dev->kobj, &komeda_sysfs_attr_group);
-	if (err) {
-		DRM_ERROR("create sysfs group failed.\n");
-		goto err_cleanup;
-	}
-
 	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
 
 	komeda_debugfs_init(mdev);
@@ -278,8 +220,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 	const struct komeda_dev_funcs *funcs = mdev->funcs;
 	int i;
 
-	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
-
 	debugfs_remove_recursive(mdev->debugfs_root);
 
 	if (mdev->aclk)
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 358c1512b087..598d2f985dad 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -4,6 +4,7 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
@@ -20,6 +21,55 @@ struct komeda_drv {
 	struct komeda_kms_dev *kms;
 };
 
+static ssize_t
+aclk_hz_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct komeda_dev *mdev = dev_to_mdev(dev);
+
+	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
+}
+static DEVICE_ATTR_RO(aclk_hz);
+
+static ssize_t
+config_id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct komeda_dev *mdev = dev_to_mdev(dev);
+	struct komeda_pipeline *pipe = mdev->pipelines[0];
+	union komeda_config_id config_id;
+	int i;
+
+	memset(&config_id, 0, sizeof(config_id));
+
+	config_id.max_line_sz = pipe->layers[0]->hsize_in.end;
+	config_id.n_pipelines = mdev->n_pipelines;
+	config_id.n_scalers = pipe->n_scalers;
+	config_id.n_layers = pipe->n_layers;
+	config_id.n_richs = 0;
+	for (i = 0; i < pipe->n_layers; i++) {
+		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
+			config_id.n_richs++;
+	}
+	return sysfs_emit(buf, "0x%08x\n", config_id.value);
+}
+static DEVICE_ATTR_RO(config_id);
+
+static ssize_t
+core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct komeda_dev *mdev = dev_to_mdev(dev);
+
+	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
+}
+static DEVICE_ATTR_RO(core_id);
+
+static struct attribute *komeda_sysfs_attrs[] = {
+	&dev_attr_aclk_hz.attr,
+	&dev_attr_config_id.attr,
+	&dev_attr_core_id.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(komeda_sysfs);
+
 struct komeda_dev *dev_to_mdev(struct device *dev)
 {
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
@@ -158,6 +208,7 @@ static struct platform_driver komeda_platform_driver = {
 	.driver	= {
 		.name = "komeda",
 		.of_match_table	= komeda_of_match,
+		.dev_groups	= komeda_sysfs_groups,
 		.pm = &komeda_pm_ops,
 	},
 };
-- 
2.17.1

