Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19189EEB1;
	Thu,  8 May 2025 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695557; cv=none; b=JgwgjEcz9pJ+c7lcYozBO7HW9NSstwFjRoEjqJJAoPpWIeLOApP4MTe6rYLeT8cG+/X0jfJ7zne5m+5265zzIeo+0b6oUMNWs3GO6yj4b2+Fb+kiJDtiqB5iqAtHXueaqSUYUtbsTq4ZnDidiRvSkfq/vPQwbQbOCgGy7yyNJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695557; c=relaxed/simple;
	bh=c8HTw2PEs39RKVW9YjDZM/YxK/OUElK/P3XWJwYuRSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8HKlCYfiH2NwE7nAckrwz6VjEFRDNZQLU7QtefORd+ZiHZlMB2YbeH/fl9w2XxxhjOeC0tWbgb5Cf8CxDuC2dVffp6YpIRaSddaR+vHNgSiAAC9Rn4t3ZfCTxXjnqoKg8ARjmNrnWlzA3Efeg2thsc6CnUhcDwcp/ePHkYLsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bZNCT/VA; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bZNCT/VA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lX
	SY4NhSRcyujqIjdzeFHTqo5/xHrlwm6zeeNIy2Jd8=; b=bZNCT/VAMYo1FyO9Ek
	HIeR+NLYRXc9HE9GOaY0UP7I7eE2q6RajwbukmrYV3HaEtEMxopk8wWumHE8/oJT
	8QVEpyvRSdBZ5h6VNcNm6AmuLLGMdLZt9Xy+CO2tku5tnP+Ug49xaQVrvXOEihlD
	ofX9OVwwxroY7K/WCyHHV9xNs=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnkrxXdRxoTLzdCA--.3706S3;
	Thu, 08 May 2025 17:11:54 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	markgross@kernel.org,
	arnd@arndb.de,
	eric.piel@tremplin-utc.net,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH 1/2] driver core:add device's platform_data set for faux device
Date: Thu,  8 May 2025 17:11:47 +0800
Message-Id: <b03b374bc3adad275893e2ad60d4bf5a0ad358e3.1746662386.git.zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746662386.git.zhouzongmin@kylinos.cn>
References: <cover.1746662386.git.zhouzongmin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnkrxXdRxoTLzdCA--.3706S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFy5KrW7Ar1fXrWrWr4DArb_yoWrWF13pa
	yDXFyUArWUWa1Du3yDZayqv34ftw1S93yrKr17J34S9rn3A393ZFWrGFyUA3sxJFW5KF4q
	qFyYkrW8CF18CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwku7UUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixwRHq2gccH6XcwABsw

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Most drivers based on platform bus may have specific data
for the device.And will get this specific data to use
after device added.
So keep the setting for device's platform_data is necessary
for converting platform device to faux device.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/base/faux.c                | 9 +++++++--
 drivers/char/tlclk.c               | 2 +-
 drivers/misc/lis3lv02d/lis3lv02d.c | 2 +-
 include/linux/device/faux.h        | 3 ++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 407c1d1aad50..42ec843235cb 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -94,6 +94,8 @@ static void faux_device_release(struct device *dev)
  *		into, can be NULL.
  * @groups:	The set of sysfs attributes that will be created for this
  *		device when it is registered with the driver core.
+ * @plat_data:	The specific data that want to associated with this new device,
+ * 		can be NULL.Just call 'dev_get_platdata()' to get the data.
  *
  * Create a new faux device and register it in the driver core properly.
  * If present, callbacks in @faux_ops will be called with the device that
@@ -113,7 +115,8 @@ static void faux_device_release(struct device *dev)
 struct faux_device *faux_device_create_with_groups(const char *name,
 						   struct device *parent,
 						   const struct faux_device_ops *faux_ops,
-						   const struct attribute_group **groups)
+						   const struct attribute_group **groups,
+						   void *plat_data)
 {
 	struct faux_object *faux_obj;
 	struct faux_device *faux_dev;
@@ -141,6 +144,8 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 	dev->groups = groups;
 	dev_set_name(dev, "%s", name);
 
+	dev->platform_data = plat_data;
+
 	ret = device_add(dev);
 	if (ret) {
 		pr_err("%s: device_add for faux device '%s' failed with %d\n",
@@ -191,7 +196,7 @@ struct faux_device *faux_device_create(const char *name,
 				       struct device *parent,
 				       const struct faux_device_ops *faux_ops)
 {
-	return faux_device_create_with_groups(name, parent, faux_ops, NULL);
+	return faux_device_create_with_groups(name, parent, faux_ops, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(faux_device_create);
 
diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index b381ea7e85d2..9334880dec67 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -813,7 +813,7 @@ static int __init tlclk_init(void)
 		goto out3;
 	}
 
-	tlclk_device = faux_device_create_with_groups("telco_clock", NULL, NULL, tlclk_groups);
+	tlclk_device = faux_device_create_with_groups("telco_clock", NULL, NULL, tlclk_groups, NULL);
 	if (!tlclk_device) {
 		ret = -ENODEV;
 		goto out4;
diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index 6957091ab6de..e63cb353f425 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -864,7 +864,7 @@ ATTRIBUTE_GROUPS(lis3lv02d);
 
 static int lis3lv02d_add_fs(struct lis3lv02d *lis3)
 {
-	lis3->fdev = faux_device_create_with_groups(DRIVER_NAME, NULL, NULL, lis3lv02d_groups);
+	lis3->fdev = faux_device_create_with_groups(DRIVER_NAME, NULL, NULL, lis3lv02d_groups, NULL);
 	if (!lis3->fdev)
 		return -ENODEV;
 
diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
index 9f43c0e46aa4..36532288a09a 100644
--- a/include/linux/device/faux.h
+++ b/include/linux/device/faux.h
@@ -53,7 +53,8 @@ struct faux_device *faux_device_create(const char *name,
 struct faux_device *faux_device_create_with_groups(const char *name,
 						   struct device *parent,
 						   const struct faux_device_ops *faux_ops,
-						   const struct attribute_group **groups);
+						   const struct attribute_group **groups,
+						   void *plat_data);
 void faux_device_destroy(struct faux_device *faux_dev);
 
 static inline void *faux_device_get_drvdata(const struct faux_device *faux_dev)
-- 
2.25.1

