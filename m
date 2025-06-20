Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCC12080E8;
	Fri, 20 Jun 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447748; cv=none; b=cETmetvx3x9AkNApcP/x8zrr5fVCCA08H/Ks4R85aGCPaIoTQpErUlqbcaw4yuwfH7vYh10BmXG2daWtr0QI4DxpX6erfzuyeFJOFtRrm//wvYwFJoDJxlk1bUXcpBXUH2R19KZ9iuRQ6xWIklQKJEIRRBv9WZUpl5R0PpM3gWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447748; c=relaxed/simple;
	bh=YRiU5FXB0wfYAoe2e3ofO+hKU2ldE2qB5AVI8IHooHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5Em8M4SLmq6MA/eKyi8PZQSGvvbPNaObLHvP0aa7Pl7DPBdkZkEngJc5Bq1HkVLOO7bRJ4mupRcBuaYw0ELwRQHLnUjioHW+Rco1pcYcCFcilYZvDDwxigMeBL1+Zuvl5GECcODGD2KrNLfkUfU2/vkdZ3qH07XFxkt43Hzg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C9D16A3;
	Fri, 20 Jun 2025 12:28:46 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65C313F673;
	Fri, 20 Jun 2025 12:29:03 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry chardev/ioctls API
Date: Fri, 20 Jun 2025 20:28:11 +0100
Message-ID: <20250620192813.2463367-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add to the SCMI Telemetry driver an alternative custom userspace API based
on a character device and ioctls.

Still lacking:
 - a few groups related ioctls
 - a telemetry-reset ioctl
 - mmap support for raw telenetry data access

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_system_telemetry.c | 496 +++++++++++++++++-
 include/uapi/linux/scmi.h                     | 253 +++++++++
 2 files changed, 747 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/scmi.h

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
index a2f59001747d..c354dbe8a0f7 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/atomic.h>
+#include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fs.h>
@@ -15,6 +16,8 @@
 #include <linux/sysfs.h>
 #include <linux/slab.h>
 
+#include <uapi/linux/scmi.h>
+
 #define MAX_BULK_LINE_CHAR_LENGTH	64
 
 struct scmi_tlm_setup;
@@ -39,13 +42,22 @@ struct scmi_tlm_de_dev {
 #define to_tlm_de_dev(d)					\
 	(container_of((d), struct scmi_tlm_de_dev, dev))
 
+struct scmi_tlm_ioctls_db {
+	struct scmi_tlm_info tlm_info;
+	struct scmi_tlm_intervals *tlm_intervals;
+	struct scmi_tlm_intervals **tlm_grp_intervals;
+	struct scmi_tlm_des_list *tlm_des_list;
+};
+
 struct scmi_tlm_instance {
 	struct device dev;
+	struct cdev cdev;
 	struct device des_dev;
 	struct device groups_dev;
 	struct scmi_tlm_de_dev **des;
 	struct scmi_tlm_setup *tsp;
 	const struct scmi_telemetry_info *info;
+	struct scmi_tlm_ioctls_db io_db;
 };
 
 #define dev_to_tlm_instance(d)	\
@@ -71,6 +83,8 @@ struct scmi_tlm_setup {
 	const void *priv;
 };
 
+static int scmi_tlm_major;
+
 static void scmi_telemetry_release(struct device *dev)
 {
 }
@@ -326,7 +340,6 @@ static ssize_t intervals_discrete_show(struct device *dev,
 	return __intervals_discrete_show(buf, ti->info->intervals.discrete);
 }
 
-//TODO Review available interval show
 #define BUF_SZ	1024
 static inline ssize_t
 __available_update_show(char *buf,
@@ -532,6 +545,31 @@ scmi_telemetry_dev_register(struct device *dev, struct device *parent,
 	return ret;
 }
 
+static int
+scmi_telemetry_cdev_register(struct device *dev, struct device *parent,
+			     struct cdev *cdev, const struct file_operations *fops,
+			     const char *name, unsigned int minor)
+{
+	int ret;
+
+	dev->parent = parent;
+	dev->release = scmi_tlm_dev_release;
+	dev_set_name(dev, "%s", name);
+	device_set_pm_not_required(dev);
+	dev_set_uevent_suppress(dev, true);
+
+	device_initialize(dev);
+
+	dev->devt = MKDEV(scmi_tlm_major, minor);
+	cdev_init(cdev, fops);
+
+	ret = cdev_device_add(cdev, dev);
+	if (ret)
+		put_device(dev);
+
+	return ret;
+}
+
 static int scmi_des_iter(struct device *dev, void *data)
 {
 	device_unregister(dev);
@@ -807,6 +845,448 @@ static int scmi_telemetry_des_initialize(struct device *dev,
 	return ret;
 }
 
+struct scmi_tlm_priv {
+	char *buf;
+	size_t buf_sz;
+	int buf_len;
+	struct scmi_tlm_instance *ti;
+};
+
+static int scmi_tlm_open(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_instance *ti;
+	struct scmi_tlm_priv *tp;
+
+	tp = kzalloc(sizeof(*tp), GFP_KERNEL);
+	if (!tp)
+		return -ENOMEM;
+
+	ti = container_of(ino->i_cdev, struct scmi_tlm_instance, cdev);
+	tp->ti = ti;
+
+	filp->private_data = tp;
+
+	return 0;
+}
+
+static int scmi_tlm_bulk_buffer_allocate_and_fill(struct scmi_tlm_priv *tp)
+{
+	struct scmi_tlm_instance *ti = tp->ti;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	struct scmi_telemetry_de_sample *samples;
+	int ret, num_samples;
+
+	tp->buf_sz = ti->info->num_de * MAX_BULK_LINE_CHAR_LENGTH;
+	tp->buf = kzalloc(tp->buf_sz, GFP_KERNEL);
+	if (!tp->buf)
+		return -ENOMEM;
+
+	num_samples = ti->info->num_de;
+	samples = kcalloc(num_samples, sizeof(*samples), GFP_KERNEL);
+	if (!samples) {
+		kfree(tp->buf);
+		return -ENOMEM;
+	}
+
+	ret = tsp->ops->des_bulk_read(tsp->ph, SCMI_TLM_GRP_INVALID,
+				      &num_samples, samples);
+	if (ret) {
+		kfree(samples);
+		kfree(tp->buf);
+		return ret;
+	}
+
+	ret = scmi_tlm_buffer_fill(&ti->dev, tp->buf, tp->buf_sz, &tp->buf_len,
+				   num_samples, samples);
+	kfree(samples);
+
+	return ret;
+}
+
+static ssize_t scmi_tlm_read(struct file *filp, char __user *buf, size_t count,
+			     loff_t *ppos)
+{
+	struct scmi_tlm_priv *tp = filp->private_data;
+	int ret;
+
+	if (!tp->buf) {
+		ret = scmi_tlm_bulk_buffer_allocate_and_fill(tp);
+		if (ret)
+			return ret;
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, tp->buf, tp->buf_len);
+}
+
+static __poll_t scmi_tlm_poll(struct file *, struct poll_table_struct *)
+{
+	return 0;
+}
+
+static long
+scmi_tlm_info_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+
+	if (copy_to_user(uptr, &ti->io_db.tlm_info,
+			 sizeof(ti->io_db.tlm_info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_intervals_ioctl(struct scmi_tlm_instance *ti, unsigned long arg,
+			 bool group)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_intervals ivs, *tlm_ivs;
+
+	if (copy_from_user(&ivs, uptr, sizeof(ivs)))
+		return -EFAULT;
+
+	if (!group) {
+		tlm_ivs = ti->io_db.tlm_intervals;
+	} else {
+		if (ivs.grp_id >= ti->info->num_groups)
+			return -EINVAL;
+
+		tlm_ivs = ti->io_db.tlm_grp_intervals[ivs.grp_id];
+	}
+
+	if (ivs.num != tlm_ivs->num)
+		return -EINVAL;
+
+	if (copy_to_user(uptr, tlm_ivs,
+			 sizeof(*tlm_ivs) + sizeof(u32) * ivs.num))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_config_set_ioctl(struct scmi_tlm_instance *ti, unsigned long arg,
+			     bool all)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	const struct scmi_telemetry_de *de;
+	struct scmi_tlm_de_config tcfg = {};
+	int ret;
+
+	if (copy_from_user(&tcfg, uptr, sizeof(tcfg)))
+		return -EFAULT;
+
+	if (!all)
+		return tsp->ops->state_set(tsp->ph, false, tcfg.id,
+					   (bool *)&tcfg.enable,
+					   (bool *)&tcfg.t_enable);
+
+	for (int i = 0; i < ti->info->num_de; i++) {
+		de = ti->info->des[i];
+
+		ret = tsp->ops->state_set(tsp->ph, false, de->id,
+					  (bool *)&tcfg.enable,
+					  (bool *)&tcfg.t_enable);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_config_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	struct scmi_tlm_de_config tcfg = {};
+	int ret;
+
+	if (copy_from_user(&tcfg, uptr, sizeof(tcfg)))
+		return -EFAULT;
+
+	ret = tsp->ops->state_get(tsp->ph, tcfg.id,
+				  (bool *)&tcfg.enable, (bool *)&tcfg.t_enable);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uptr, &tcfg, sizeof(tcfg)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_config_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_config cfg;
+
+	cfg.enable = !!ti->info->enabled;
+	cfg.current_update_interval =
+		ti->info->intervals.active_update_interval;
+
+	if (copy_to_user(uptr, &cfg, sizeof(cfg)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_config_set_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	struct scmi_tlm_config cfg = {};
+
+	if (copy_from_user(&cfg, uptr, sizeof(cfg)))
+		return -EFAULT;
+
+	return tsp->ops->collection_configure(tsp->ph, SCMI_TLM_GRP_INVALID,
+					      true, (bool *)&cfg.enable,
+					      &cfg.current_update_interval,
+					      NULL);
+}
+
+static long
+scmi_tlm_des_list_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_des_list dsl;
+
+	if (copy_from_user(&dsl, uptr, sizeof(dsl)))
+		return -EFAULT;
+
+	if (dsl.num_des < ti->io_db.tlm_des_list->num_des)
+		return -EFAULT;
+
+	if (copy_to_user(uptr, ti->io_db.tlm_des_list,
+			 sizeof(*ti->io_db.tlm_des_list) +
+			 ti->io_db.tlm_des_list->num_des * sizeof(ti->io_db.tlm_des_list->des[0])))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long
+scmi_tlm_de_value_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	struct scmi_tlm_de_sample sample;
+	int ret;
+
+	if (copy_from_user(&sample, uptr, sizeof(sample)))
+		return -EFAULT;
+
+	ret = tsp->ops->de_data_read(tsp->ph,
+				     (struct scmi_telemetry_de_sample *)&sample);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uptr, &sample, sizeof(sample)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long scmi_tlm_des_read_ioctl(struct scmi_tlm_instance *ti,
+				    unsigned long arg, bool single)
+{
+	void * __user uptr = (void * __user)arg;
+	struct scmi_tlm_setup *tsp = ti->tsp;
+	struct scmi_tlm_bulk_read bulk, *bulk_ptr;
+	int ret;
+
+	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
+		return -EFAULT;
+
+	bulk_ptr = kzalloc(sizeof(*bulk_ptr) +
+			     bulk.num_samples * sizeof(bulk_ptr->samples[0]),
+			     GFP_KERNEL);
+	if (!bulk_ptr)
+		return -ENOMEM;
+
+	bulk_ptr->grp_id = bulk.grp_id;
+	bulk_ptr->num_samples = bulk.num_samples;
+	if (!single)
+		ret = tsp->ops->des_bulk_read(tsp->ph, bulk_ptr->grp_id,
+					      &bulk_ptr->num_samples,
+			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
+	else
+		ret = tsp->ops->des_sample_get(tsp->ph, bulk_ptr->grp_id,
+					       &bulk_ptr->num_samples,
+			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
+	if (ret)
+		goto out;
+
+	if (copy_to_user(uptr, bulk_ptr, sizeof(*bulk_ptr) +
+			 bulk_ptr->num_samples * sizeof(bulk_ptr->samples[0])))
+		ret = -EFAULT;
+
+out:
+	kfree(bulk_ptr);
+
+	return ret;
+}
+
+static long scmi_tlm_unlocked_ioctl(struct file *filp, unsigned int cmd,
+				    unsigned long arg)
+{
+	struct scmi_tlm_priv *tp = filp->private_data;
+	struct scmi_tlm_instance *ti = tp->ti;
+
+	switch (cmd) {
+	case SCMI_TLM_GET_INFO:
+		return scmi_tlm_info_get_ioctl(ti, arg);
+	case SCMI_TLM_GET_CFG:
+		return scmi_tlm_config_get_ioctl(ti, arg);
+	case SCMI_TLM_SET_CFG:
+		return scmi_tlm_config_set_ioctl(ti, arg);
+	case SCMI_TLM_GET_INTRVS:
+		return scmi_tlm_intervals_ioctl(ti, arg, false);
+	case SCMI_TLM_GET_DE_CFG:
+		return scmi_tlm_de_config_get_ioctl(ti, arg);
+	case SCMI_TLM_SET_DE_CFG:
+		return scmi_tlm_de_config_set_ioctl(ti, arg, false);
+	case SCMI_TLM_GET_DE_INFO:
+		return -EOPNOTSUPP;
+	case SCMI_TLM_GET_DE_LIST:
+		return scmi_tlm_des_list_get_ioctl(ti, arg);
+	case SCMI_TLM_GET_DE_VALUE:
+		return scmi_tlm_de_value_get_ioctl(ti, arg);
+	case SCMI_TLM_GET_GRP_CFG:
+		return -EOPNOTSUPP;
+	case SCMI_TLM_SET_GRP_CFG:
+		return -EOPNOTSUPP;
+	case SCMI_TLM_GET_GRP_INTRVS:
+		return scmi_tlm_intervals_ioctl(ti, arg, true);
+	case SCMI_TLM_GET_GRP_INFO:
+		return -EOPNOTSUPP;
+	case SCMI_TLM_GET_GRP_LIST:
+		return -EOPNOTSUPP;
+	case SCMI_TLM_SINGLE_SAMPLE:
+		return scmi_tlm_des_read_ioctl(ti, arg, true);
+	case SCMI_TLM_BULK_READ:
+		return scmi_tlm_des_read_ioctl(ti, arg, false);
+	case SCMI_TLM_SET_ALL_CFG:
+		return scmi_tlm_de_config_set_ioctl(ti, arg, true);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static long scmi_tlm_compat_ioctl(struct file *, unsigned int, unsigned long)
+{
+	return 0;
+}
+
+static int scmi_tlm_mmap(struct file *, struct vm_area_struct *)
+{
+	return 0;
+}
+
+static int scmi_tlm_release(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_priv *tp = filp->private_data;
+
+	kfree(tp->buf);
+	kfree(tp);
+
+	return 0;
+}
+
+static const struct file_operations scmi_tlm_fops = {
+	.owner = THIS_MODULE,
+	.open = scmi_tlm_open,
+	.read = scmi_tlm_read,
+	.poll = scmi_tlm_poll,
+	.unlocked_ioctl = scmi_tlm_unlocked_ioctl,
+	.compat_ioctl = scmi_tlm_compat_ioctl,
+	.mmap = scmi_tlm_mmap,
+	.release = scmi_tlm_release,
+};
+
+static int scmi_tlm_setup_ioctl_data(struct device *dev,
+				     struct scmi_tlm_instance *ti)
+{
+	ti->io_db.tlm_info.version = ti->info->version;
+	for (int i = 0; i < SCMI_TLM_DE_IMPL_VERS; i++)
+		ti->io_db.tlm_info.de_impl_version[i] = ti->info->de_impl_version[i];
+	ti->io_db.tlm_info.num_des = ti->info->num_de;
+	ti->io_db.tlm_info.num_groups = ti->info->num_groups;
+	ti->io_db.tlm_info.num_intervals = ti->info->intervals.num;
+	if (ti->info->reset_support)
+		ti->io_db.tlm_info.flags = SCMI_TLM_CAN_RESET;
+
+	ti->io_db.tlm_intervals = devm_kzalloc(dev, sizeof(*ti->io_db.tlm_intervals) +
+					       ti->info->intervals.num * sizeof(__u32),
+					       GFP_KERNEL);
+	if (!ti->io_db.tlm_intervals)
+		return -ENOMEM;
+
+	ti->io_db.tlm_intervals->grp_id = 0;
+	ti->io_db.tlm_intervals->discrete = ti->info->intervals.discrete;
+	ti->io_db.tlm_intervals->num = ti->info->intervals.num;
+	for (int i = 0; i < ti->info->intervals.num; i++)
+		ti->io_db.tlm_intervals->available[i] =
+			ti->info->intervals.update_intervals[i];
+
+	ti->io_db.tlm_grp_intervals = devm_kcalloc(dev, ti->info->num_groups,
+						   sizeof(ti->io_db.tlm_grp_intervals),
+						   GFP_KERNEL);
+	if (!ti->io_db.tlm_grp_intervals)
+		return -ENOMEM;
+
+	for (int i = 0; i < ti->info->num_groups; i++) {
+		struct scmi_tlm_intervals *ivs;
+		struct scmi_telemetry_group *grp = &ti->info->des_groups[i];
+
+		ivs = devm_kzalloc(dev, sizeof(*ivs) +
+				   grp->intervals.num * sizeof(__u32),
+				   GFP_KERNEL);
+		if (!ivs)
+			return -ENOMEM;
+
+		ivs->grp_id = i;
+		ivs->discrete = grp->intervals.discrete;
+		ivs->num = grp->intervals.num;
+		for (int j = 0; j < ivs->num; j++)
+			ivs->available[i] = grp->intervals.update_intervals[i];
+
+		ti->io_db.tlm_grp_intervals[i] = ivs;
+	}
+
+	ti->io_db.tlm_des_list = devm_kzalloc(dev, sizeof(*ti->io_db.tlm_des_list) +
+					ti->info->num_de * sizeof(ti->io_db.tlm_des_list->des[0]),
+					GFP_KERNEL);
+	if (!ti->io_db.tlm_des_list)
+		return -ENOMEM;
+
+	ti->io_db.tlm_des_list->num_des = ti->info->num_de;
+	for (int i = 0; i < ti->info->num_de; i++) {
+		ti->io_db.tlm_des_list->des[i].id = ti->info->des[i]->id;
+		ti->io_db.tlm_des_list->des[i].grp_id =
+			ti->info->des[i]->grp ? ti->info->des[i]->grp->id : SCMI_TLM_GRP_INVALID;
+		ti->io_db.tlm_des_list->des[i].data_sz = ti->info->des[i]->data_sz;
+		ti->io_db.tlm_des_list->des[i].type = ti->info->des[i]->type;
+		ti->io_db.tlm_des_list->des[i].unit = ti->info->des[i]->unit;
+		ti->io_db.tlm_des_list->des[i].unit_exp = ti->info->des[i]->unit_exp;
+		ti->io_db.tlm_des_list->des[i].tstamp_exp = ti->info->des[i]->tstamp_exp;
+		ti->io_db.tlm_des_list->des[i].instance_id = ti->info->des[i]->instance_id;
+		ti->io_db.tlm_des_list->des[i].compo_instance_id =
+			ti->info->des[i]->compo_instance_id;
+		ti->io_db.tlm_des_list->des[i].compo_type = ti->info->des[i]->compo_type;
+		ti->io_db.tlm_des_list->des[i].persistent = ti->info->des[i]->persistent;
+		if (ti->info->des[i]->name)
+			strscpy(ti->io_db.tlm_des_list->des[i].name, ti->info->des[i]->name,
+				SCMI_SHORT_NAME_MAX_SIZE);
+	}
+
+	return 0;
+}
+
 static int
 scmi_tlm_root_instance_initialize(struct device *dev,
 				  struct scmi_tlm_instance *ti, int instance_id)
@@ -814,11 +1294,16 @@ scmi_tlm_root_instance_initialize(struct device *dev,
 	char name[16];
 	int ret;
 
+	ret = scmi_tlm_setup_ioctl_data(dev, ti);
+	if (ret)
+		return ret;
+
 	ti->dev.class = &scmi_telemetry_class;
 	ti->dev.groups = scmi_telemetry_groups;
 
 	snprintf(name, 16, "scmi_tlm_%d", instance_id);
-	ret = scmi_telemetry_dev_register(&ti->dev, NULL, name);
+	ret = scmi_telemetry_cdev_register(&ti->dev, NULL, &ti->cdev,
+					   &scmi_tlm_fops, name, instance_id);
 	if (ret)
 		return ret;
 
@@ -940,8 +1425,15 @@ static struct scmi_driver scmi_telemetry_driver = {
 
 static int __init scmi_telemetry_init(void)
 {
+	dev_t devt;
 	int ret;
 
+	ret = alloc_chrdev_region(&devt, 0, 1024, "scmi-tlm");
+	if (ret)
+		return ret;
+
+	scmi_tlm_major = MAJOR(devt);
+
 	ret = class_register(&scmi_telemetry_class);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
new file mode 100644
index 000000000000..8a0f365fca52
--- /dev/null
+++ b/include/uapi/linux/scmi.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2025 ARM Ltd.
+ */
+#ifndef _UAPI_LINUX_SCMI_H
+#define _UAPI_LINUX_SCMI_H
+
+/*
+ * Userspace interface SCMI Telemetry
+ */
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+#define SCMI_TLM_DE_IMPL_VERS		4
+#define SCMI_TLM_GRP_INVALID            0xFFFFFFFF
+
+/**
+ * scmi_tlm_info  - Basic info about an instance
+ *
+ * @version: SCMI Telemetry protocol version
+ * @de_impl_version: SCMI Telemetry DE implementation revision
+ * @num_desi: Number of defined DEs
+ * @num_groups Number of defined DEs groups
+ * @num_intervals: Number of update intervals available (instance-level)
+ * @flags: Instance specific feature-support bitmap
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_INFO
+ */
+struct scmi_tlm_info {
+	__u32 version;
+	__u32 de_impl_version[SCMI_TLM_DE_IMPL_VERS];
+	__u32 num_des;
+	__u32 num_groups;
+	__u32 num_intervals;
+	__u32 flags;
+#define SCMI_TLM_CAN_RESET	(1 << 0)
+};
+
+/**
+ * scmi_tlm_config  - Basic instance configuration
+ *
+ * @enable: Enable/Disable Telemetry for the whole instance
+ * @current_update_interval: Get/Set currently active update interval
+ *			     (periodic tick for SHMTIs and Notifications)
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_CFG
+ *	WO - SCMI_TLM_SET_CFG
+ */
+struct scmi_tlm_config {
+	__u32 enable;
+	__u32 current_update_interval;
+};
+
+/**
+ * scmi_tlm_intervals  - Update intervals descriptor
+ *
+ * @grp_id: Group identifier (ignored by SCMI_TLM_GET_INTRVS)
+ * @discrete: Flag to indicate the nature of the intervals described in
+ *	      @available. When 'false' @available is a triplet: min/max/step
+ * @num: Number of entries of @available
+ * @available: A variably-sized array containing the update intervals
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_INTRVS
+ *	RW - SCMI_TLM_GET_GRP_INTRVS
+ */
+struct scmi_tlm_intervals {
+	__u32 grp_id;
+	__u32 discrete;
+	__u32 num;
+	__u32 available[];
+};
+
+/**
+ * scmi_tlm_de_config  - DE configuration
+ *
+ * @id: Identifier of the DE to act upon (ignored by SCMI_TLM_SET_ALL_CFG)
+ * @enable: A boolean to enable/disable the DE
+ * @t_enable: A boolean to enable/disable the timestamp for this DE
+ *	      (if supported)
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_CFG
+ *	RW - SCMI_TLM_SET_DE_CFG
+ *	WO - SCMI_TLM_SET_ALL_CFG
+ */
+struct scmi_tlm_de_config {
+	__u32 id;
+	__u32 enable;
+	__u32 t_enable;
+};
+
+/**
+ * scmi_tlm_de_info  - DE Descriptor
+ *
+ * @id: DE identifier
+ * @grp_id: Identifier of the group which this DE belongs to; reported as
+ *	    SCMI_TLM_GRP_INVALID when not part of any group
+ * @data_sz: DE data size in bytes
+ * @type: DE type
+ * @unit: DE unit of measurements
+ * @unit_exp: Power-of-10 multiplier for DE unit
+ * @tstamp_exp: Power-of-10 multiplier for DE timestamp (if supported)
+ * @instance_id: DE instance ID
+ * @compo_instance_id: DE component instance ID
+ * @compo_type: Type of component which is associated to this DE
+ * @peristent: Data value for this DE survives reboot (non-cold ones)
+ * @name: Optional name of this DE
+ *
+ * Used to get the full description of a DE: it reflects DE Descriptors
+ * definitions in 3.12.4.6.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_INFO
+ *	RO - SCMI_TLM_GET_DE_LIST
+ */
+struct scmi_tlm_de_info {
+	__u32 id;
+	__u32 grp_id;
+	__u32 data_sz;
+	__u32 type;
+	__u32 unit;
+	__s32 unit_exp;
+	__s32 tstamp_exp;
+	__u32 instance_id;
+	__u32 compo_instance_id;
+	__u32 compo_type;
+	__u32 persistent;
+	__u8 name[16];
+};
+
+/**
+ * scmi_tlm_des_list  - List of all defined DEs
+ *
+ * @num_des: Number of entries in @des
+ * @des: An array containing descriptors for all defined DEs
+ *
+ * Used by:
+ *	RO - SCMI_TLM_GET_DE_LIST
+ */
+struct scmi_tlm_des_list {
+	__u32 num_des;
+	struct scmi_tlm_de_info des[];
+};
+
+/**
+ * scmi_tlm_de_sample - A DE reading
+ *
+ * @id: DE identifier
+ * @tstamp: DE reading timestamp (equal 0 is NOT supported)
+ * @val: Reading of the DE data value
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_DE_VALUE
+ *	RO - SCMI_TLM_SINGLE_READ
+ */
+struct scmi_tlm_de_sample {
+	__u32 id;
+	__u64 tstamp;
+	__u64 val;
+};
+
+/**
+ * scmi_tlm_bulk_read - Bulk read of multiple DEs
+ *
+ * @grp_id: The identifier of the group to query with a single asynchronous
+ *	    sample read. Set to SCMI_TLM_GRP_INVALID to ignore.
+ * @num_samples: Number of entries returned in @samples
+ * @samples: An array of samples containing an entry for each DE that was
+ *	     enabled when the single sample read request was issued.
+ *
+ * Used by:
+ *	RW - SCMI_TLM_SINGLE_SAMPLE
+ *	RW - SCMI_TLM_BULK_READ
+ */
+struct scmi_tlm_bulk_read {
+	__u32 grp_id;
+	__u32 num_samples;
+	struct scmi_tlm_de_sample samples[];
+};
+
+/**
+ * scmi_tlm_grp_info  - DE-group descriptor
+ *
+ * @id: Group identifier
+ * @flags: Group capabilities
+ * @num_intervals: Number of update intervals supported
+ * @num_des: Number of DEs part of this group
+ *
+ * Used by:
+ *	WR - SCMI_TLM_GET_GRP_INFO
+ */
+struct scmi_tlm_grp_info {
+	__u32 id;
+	__u32 flags;
+#define SCMI_TLM_GRP_HAS_UPDATE		(1 << 0)
+	__u32 num_intervals;
+	__u32 num_des;
+};
+
+/**
+ * scmi_tlm_grps_list  - DE-groups List
+ *
+ * @num_grps: Number of entries returned in @grps
+ * @grps: An array containing descriptors for all defined DE Groups
+ */
+struct scmi_tlm_grps_list {
+	__u32 num_grps;
+	struct scmi_tlm_grp_info grps[];
+};
+
+/**
+ * scmi_tlm_grp_config  - Group config
+ *
+ * @id: Identifier of the DEs-group to act upon
+ * @enable: A boolean to enable/disable the group
+ * @t_enable: A boolean to enable/disable the timestamp for this group
+ *
+ * Used by:
+ *	RW - SCMI_TLM_GET_GRP_CFG
+ *	WO - SCMI_TLM_SET_GRP_CFG
+ */
+struct scmi_tlm_grp_config {
+	__u32 id;
+	__u32 enable;
+	__u32 t_enable;
+	__u32 current_update_interval;
+};
+
+#define SCMI 0xF1
+
+#define SCMI_TLM_GET_INFO	_IOR(SCMI,  0x00, struct scmi_tlm_info)
+#define SCMI_TLM_GET_CFG	_IOR(SCMI,  0x01, struct scmi_tlm_config)
+#define SCMI_TLM_SET_CFG	_IOW(SCMI,  0x02, struct scmi_tlm_config)
+#define SCMI_TLM_GET_INTRVS	_IOR(SCMI,  0x03, struct scmi_tlm_intervals)
+#define SCMI_TLM_GET_DE_CFG	_IOWR(SCMI, 0x04, struct scmi_tlm_de_config)
+#define SCMI_TLM_SET_DE_CFG	_IOW(SCMI,  0x05, struct scmi_tlm_de_config)
+#define SCMI_TLM_GET_DE_INFO	_IOWR(SCMI, 0x06, struct scmi_tlm_de_info)
+#define SCMI_TLM_GET_DE_LIST	_IOWR(SCMI, 0x07, struct scmi_tlm_des_list)
+#define SCMI_TLM_GET_DE_VALUE	_IOWR(SCMI, 0x08, struct scmi_tlm_de_sample)
+#define SCMI_TLM_GET_GRP_CFG	_IOWR(SCMI, 0x09, struct scmi_tlm_grp_config)
+#define SCMI_TLM_SET_GRP_CFG	_IOW(SCMI,  0x0A, struct scmi_tlm_grp_config)
+#define SCMI_TLM_GET_GRP_INTRVS	_IOWR(SCMI, 0x0B, struct scmi_tlm_intervals)
+#define SCMI_TLM_GET_GRP_INFO	_IOWR(SCMI, 0x0C, struct scmi_tlm_grp_info)
+#define SCMI_TLM_GET_GRP_LIST	_IOR(SCMI,  0x0D, struct scmi_tlm_grps_list)
+#define SCMI_TLM_SINGLE_SAMPLE	_IOWR(SCMI, 0x0E, struct scmi_tlm_bulk_read)
+#define SCMI_TLM_BULK_READ	_IOWR(SCMI, 0x0F, struct scmi_tlm_bulk_read)
+#define SCMI_TLM_SET_ALL_CFG	_IOW(SCMI,  0x10, struct scmi_tlm_de_config)
+
+#endif /* _UAPI_LINUX_SCMI_H */
-- 
2.47.0

