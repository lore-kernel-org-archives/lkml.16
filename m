Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6159246BCB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275991; cv=none; b=FgDYQ5i8ZxnuLzTj4l07iu+yatlY0fHnT6b5qttakccO3jVssZsZ6hkJF4lRz9u70jNp1h1hEiNL4Tj5CWUJmM0cBFmkazWGkCPnKMpIDg247MLHWRdOU+ShLoEnahesaNzPSNhH9Ahmv/aPiLLafnTFjHEwmnOA3zZgx81+LKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275991; c=relaxed/simple;
	bh=GsK1OIdfCnDeg2B6vJEkWD/flkOTW/TNAQ+J/NKLwK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeUOY20reX4Jz7gcOewpa1u5UcY6AYJeron4ZNIaBjSCVH9clzblzQXoyVrkoXA9ixhU5gIo5EEks5yFkbW+hbQ+TpSYhEDjISsv5pyGojaoYEtHLFFtuMHrnEmWbQ5u/+MvoZofARa16lqO93pUCfMKdpk+GaqpDuDp4NR+0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eY/b5tKP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eY/b5tKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275990; x=1782811990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GsK1OIdfCnDeg2B6vJEkWD/flkOTW/TNAQ+J/NKLwK4=;
  b=eY/b5tKPJvzyokD2HXjwp0nHRWDmo0JYITpHumpACDABVFgC8+yOrUhE
   mHmXO9oAYC6YW1crukc5u5Rofm85LTPTMgkrMWVxypUN2oeau0Pd7DPix
   XSGzkjaXOvPezVs5GvWmohZ8IGNUf00Sos0WnR/FwcdYZ2g2uj4kFWOoF
   nMWWXp9n0vSYGuT/fnykYMKn8FG8e4d9HjIaxo8tH6AWsvP+9nVzbzWVv
   3/uVrPEjfwCy+LxjIwr1mI1dmyb6rMYDVxAU2FgNWLikGEHmC7UO9hjP5
   VRiLcaOPw3Ip3PuW+JXBh3UvrP3JwYrMvMHG5Tt1xMEb85PZ1D11KktpR
   g==;
X-CSE-ConnectionGUID: P+Go5FiDQOO1vtTjoA4l9Q==
X-CSE-MsgGUID: cGnqmoSaTKGy2TLo9vQm1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53218601"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53218601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:10 -0700
X-CSE-ConnectionGUID: JiczxoBXT02WygQLvP2+fQ==
X-CSE-MsgGUID: vsiQNsABRvaGyIevDI3Q+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153039578"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:08 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2 4/5] mei: more prints with client prefix
Date: Mon, 30 Jun 2025 12:19:41 +0300
Message-ID: <20250630091942.2116676-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630091942.2116676-1-alexander.usyskin@intel.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use client-aware print macro instead of
usual device print in more places.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hbm.c       | 14 ++++-----
 drivers/misc/mei/interrupt.c |  2 +-
 drivers/misc/mei/main.c      | 55 +++++++++++++++++-------------------
 3 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
index 026b1f686c16..4fe9a2752d43 100644
--- a/drivers/misc/mei/hbm.c
+++ b/drivers/misc/mei/hbm.c
@@ -510,7 +510,7 @@ int mei_hbm_cl_notify_req(struct mei_device *dev,
 
 	ret = mei_hbm_write_message(dev, &mei_hdr, &req);
 	if (ret)
-		dev_err(dev->dev, "notify request failed: ret = %d\n", ret);
+		cl_err(dev, cl, "notify request failed: ret = %d\n", ret);
 
 	return ret;
 }
@@ -626,7 +626,7 @@ int mei_hbm_cl_dma_map_req(struct mei_device *dev, struct mei_cl *cl)
 
 	ret = mei_hbm_write_message(dev, &mei_hdr, &req);
 	if (ret)
-		dev_err(dev->dev, "dma map request failed: ret = %d\n", ret);
+		cl_err(dev, cl, "dma map request failed: ret = %d\n", ret);
 
 	return ret;
 }
@@ -654,7 +654,7 @@ int mei_hbm_cl_dma_unmap_req(struct mei_device *dev, struct mei_cl *cl)
 
 	ret = mei_hbm_write_message(dev, &mei_hdr, &req);
 	if (ret)
-		dev_err(dev->dev, "dma unmap request failed: ret = %d\n", ret);
+		cl_err(dev, cl, "dma unmap request failed: ret = %d\n", ret);
 
 	return ret;
 }
@@ -679,10 +679,10 @@ static void mei_hbm_cl_dma_map_res(struct mei_device *dev,
 		return;
 
 	if (res->status) {
-		dev_err(dev->dev, "cl dma map failed %d\n", res->status);
+		cl_err(dev, cl, "cl dma map failed %d\n", res->status);
 		cl->status = -EFAULT;
 	} else {
-		dev_dbg(dev->dev, "cl dma map succeeded\n");
+		cl_dbg(dev, cl, "cl dma map succeeded\n");
 		cl->dma_mapped = 1;
 		cl->status = 0;
 	}
@@ -709,10 +709,10 @@ static void mei_hbm_cl_dma_unmap_res(struct mei_device *dev,
 		return;
 
 	if (res->status) {
-		dev_err(dev->dev, "cl dma unmap failed %d\n", res->status);
+		cl_err(dev, cl, "cl dma unmap failed %d\n", res->status);
 		cl->status = -EFAULT;
 	} else {
-		dev_dbg(dev->dev, "cl dma unmap succeeded\n");
+		cl_dbg(dev, cl, "cl dma unmap succeeded\n");
 		cl->dma_mapped = 0;
 		cl->status = 0;
 	}
diff --git a/drivers/misc/mei/interrupt.c b/drivers/misc/mei/interrupt.c
index c484f416fae4..d472f6bbe767 100644
--- a/drivers/misc/mei/interrupt.c
+++ b/drivers/misc/mei/interrupt.c
@@ -35,7 +35,7 @@ void mei_irq_compl_handler(struct mei_device *dev, struct list_head *cmpl_list)
 		cl = cb->cl;
 		list_del_init(&cb->list);
 
-		dev_dbg(dev->dev, "completing call back.\n");
+		cl_dbg(dev, cl, "completing call back.\n");
 		mei_cl_complete(cl, cb);
 	}
 }
diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 5335cf39d663..90c9eef0d876 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -258,7 +258,7 @@ static ssize_t mei_read(struct file *file, char __user *ubuf,
 	length = min_t(size_t, length, cb->buf_idx - *offset);
 
 	if (copy_to_user(ubuf, cb->buf.data + *offset, length)) {
-		dev_dbg(dev->dev, "failed to copy data to userland\n");
+		cl_dbg(dev, cl, "failed to copy data to userland\n");
 		rets = -EFAULT;
 		goto free;
 	}
@@ -381,7 +381,7 @@ static ssize_t mei_write(struct file *file, const char __user *ubuf,
 
 	rets = copy_from_user(cb->buf.data, ubuf, length);
 	if (rets) {
-		dev_dbg(dev->dev, "failed to copy data from userland\n");
+		cl_dbg(dev, cl, "failed to copy data from userland\n");
 		rets = -EFAULT;
 		mei_io_cb_free(cb);
 		goto out;
@@ -423,7 +423,7 @@ static int mei_ioctl_connect_client(struct file *file,
 	/* find ME client we're trying to connect to */
 	me_cl = mei_me_cl_by_uuid(dev, in_client_uuid);
 	if (!me_cl) {
-		dev_dbg(dev->dev, "Cannot connect to FW Client UUID = %pUl\n",
+		cl_dbg(dev, cl, "Cannot connect to FW Client UUID = %pUl\n",
 			in_client_uuid);
 		rets = -ENOTTY;
 		goto end;
@@ -433,24 +433,21 @@ static int mei_ioctl_connect_client(struct file *file,
 		bool forbidden = dev->override_fixed_address ?
 			 !dev->allow_fixed_address : !dev->hbm_f_fa_supported;
 		if (forbidden) {
-			dev_dbg(dev->dev, "Connection forbidden to FW Client UUID = %pUl\n",
+			cl_dbg(dev, cl, "Connection forbidden to FW Client UUID = %pUl\n",
 				in_client_uuid);
 			rets = -ENOTTY;
 			goto end;
 		}
 	}
 
-	dev_dbg(dev->dev, "Connect to FW Client ID = %d\n",
-			me_cl->client_id);
-	dev_dbg(dev->dev, "FW Client - Protocol Version = %d\n",
-			me_cl->props.protocol_version);
-	dev_dbg(dev->dev, "FW Client - Max Msg Len = %d\n",
-			me_cl->props.max_msg_length);
+	cl_dbg(dev, cl, "Connect to FW Client ID = %d\n", me_cl->client_id);
+	cl_dbg(dev, cl, "FW Client - Protocol Version = %d\n", me_cl->props.protocol_version);
+	cl_dbg(dev, cl, "FW Client - Max Msg Len = %d\n", me_cl->props.max_msg_length);
 
 	/* prepare the output buffer */
 	client->max_msg_length = me_cl->props.max_msg_length;
 	client->protocol_version = me_cl->props.protocol_version;
-	dev_dbg(dev->dev, "Can connect?\n");
+	cl_dbg(dev, cl, "Can connect?\n");
 
 	rets = mei_cl_connect(cl, me_cl, file);
 
@@ -517,19 +514,19 @@ static int mei_ioctl_connect_vtag(struct file *file,
 	cl = file->private_data;
 	dev = cl->dev;
 
-	dev_dbg(dev->dev, "FW Client %pUl vtag %d\n", in_client_uuid, vtag);
+	cl_dbg(dev, cl, "FW Client %pUl vtag %d\n", in_client_uuid, vtag);
 
 	switch (cl->state) {
 	case MEI_FILE_DISCONNECTED:
 		if (mei_cl_vtag_by_fp(cl, file) != vtag) {
-			dev_err(dev->dev, "reconnect with different vtag\n");
+			cl_err(dev, cl, "reconnect with different vtag\n");
 			return -EINVAL;
 		}
 		break;
 	case MEI_FILE_INITIALIZING:
 		/* malicious connect from another thread may push vtag */
 		if (!IS_ERR(mei_cl_fp_by_vtag(cl, vtag))) {
-			dev_err(dev->dev, "vtag already filled\n");
+			cl_err(dev, cl, "vtag already filled\n");
 			return -EINVAL;
 		}
 
@@ -548,7 +545,7 @@ static int mei_ioctl_connect_vtag(struct file *file,
 				continue;
 
 			/* replace cl with acquired one */
-			dev_dbg(dev->dev, "replacing with existing cl\n");
+			cl_dbg(dev, cl, "replacing with existing cl\n");
 			mei_cl_unlink(cl);
 			kfree(cl);
 			file->private_data = pos;
@@ -658,7 +655,7 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 
 	dev = cl->dev;
 
-	dev_dbg(dev->dev, "IOCTL cmd = 0x%x", cmd);
+	cl_dbg(dev, cl, "IOCTL cmd = 0x%x", cmd);
 
 	mutex_lock(&dev->device_lock);
 	if (dev->dev_state != MEI_DEV_ENABLED) {
@@ -668,9 +665,9 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 
 	switch (cmd) {
 	case IOCTL_MEI_CONNECT_CLIENT:
-		dev_dbg(dev->dev, ": IOCTL_MEI_CONNECT_CLIENT.\n");
+		cl_dbg(dev, cl, "IOCTL_MEI_CONNECT_CLIENT\n");
 		if (copy_from_user(&conn, (char __user *)data, sizeof(conn))) {
-			dev_dbg(dev->dev, "failed to copy data from userland\n");
+			cl_dbg(dev, cl, "failed to copy data from userland\n");
 			rets = -EFAULT;
 			goto out;
 		}
@@ -691,7 +688,7 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 
 		/* if all is ok, copying the data back to user. */
 		if (copy_to_user((char __user *)data, &conn, sizeof(conn))) {
-			dev_dbg(dev->dev, "failed to copy data to userland\n");
+			cl_dbg(dev, cl, "failed to copy data to userland\n");
 			rets = -EFAULT;
 			goto out;
 		}
@@ -699,10 +696,10 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 		break;
 
 	case IOCTL_MEI_CONNECT_CLIENT_VTAG:
-		dev_dbg(dev->dev, "IOCTL_MEI_CONNECT_CLIENT_VTAG\n");
+		cl_dbg(dev, cl, "IOCTL_MEI_CONNECT_CLIENT_VTAG\n");
 		if (copy_from_user(&conn_vtag, (char __user *)data,
 				   sizeof(conn_vtag))) {
-			dev_dbg(dev->dev, "failed to copy data from userland\n");
+			cl_dbg(dev, cl, "failed to copy data from userland\n");
 			rets = -EFAULT;
 			goto out;
 		}
@@ -713,13 +710,13 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 
 		rets = mei_vt_support_check(dev, cl_uuid);
 		if (rets == -EOPNOTSUPP)
-			dev_dbg(dev->dev, "FW Client %pUl does not support vtags\n",
+			cl_dbg(dev, cl, "FW Client %pUl does not support vtags\n",
 				cl_uuid);
 		if (rets)
 			goto out;
 
 		if (!vtag) {
-			dev_dbg(dev->dev, "vtag can't be zero\n");
+			cl_dbg(dev, cl, "vtag can't be zero\n");
 			rets = -EINVAL;
 			goto out;
 		}
@@ -731,7 +728,7 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 		/* if all is ok, copying the data back to user. */
 		if (copy_to_user((char __user *)data, &conn_vtag,
 				 sizeof(conn_vtag))) {
-			dev_dbg(dev->dev, "failed to copy data to userland\n");
+			cl_dbg(dev, cl, "failed to copy data to userland\n");
 			rets = -EFAULT;
 			goto out;
 		}
@@ -739,10 +736,10 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 		break;
 
 	case IOCTL_MEI_NOTIFY_SET:
-		dev_dbg(dev->dev, ": IOCTL_MEI_NOTIFY_SET.\n");
+		cl_dbg(dev, cl, "IOCTL_MEI_NOTIFY_SET\n");
 		if (copy_from_user(&notify_req,
 				   (char __user *)data, sizeof(notify_req))) {
-			dev_dbg(dev->dev, "failed to copy data from userland\n");
+			cl_dbg(dev, cl, "failed to copy data from userland\n");
 			rets = -EFAULT;
 			goto out;
 		}
@@ -750,15 +747,15 @@ static long mei_ioctl(struct file *file, unsigned int cmd, unsigned long data)
 		break;
 
 	case IOCTL_MEI_NOTIFY_GET:
-		dev_dbg(dev->dev, ": IOCTL_MEI_NOTIFY_GET.\n");
+		cl_dbg(dev, cl, "IOCTL_MEI_NOTIFY_GET\n");
 		rets = mei_ioctl_client_notify_get(file, &notify_get);
 		if (rets)
 			goto out;
 
-		dev_dbg(dev->dev, "copy connect data to user\n");
+		cl_dbg(dev, cl, "copy connect data to user\n");
 		if (copy_to_user((char __user *)data,
 				&notify_get, sizeof(notify_get))) {
-			dev_dbg(dev->dev, "failed to copy data to userland\n");
+			cl_dbg(dev, cl, "failed to copy data to userland\n");
 			rets = -EFAULT;
 			goto out;
 
-- 
2.43.0

