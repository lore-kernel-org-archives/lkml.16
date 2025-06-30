Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A624DCF5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275989; cv=none; b=Y9lpV3FmAeu+RhWKbYelg/I9XxLVXzQxIAtu+lU4bu7xVoL7IgSCBloRgYrKf7qbzneepT84vgRcsbgFRCSiCEu5TULg44WuSHijzbbdoOxnBPbKDhLPBP5/vGfOxrj2Tkf3a5YQb2Gy7E5/qfsOQEaKMezrCnbDcmSYul92Tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275989; c=relaxed/simple;
	bh=k6CpQI6U2HXDC55vGr6BSJJaxh2hOKhfwA+pkGvRtyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoTBBO88P60M5H3G1FiWBYRfq/Wq6qO0iyIeuVCUa35Er4qIXdM5vxcVL5dEjRpVOIz/hVTm8huqO6T3RHIUXDsVisVa1qVyMcqqgQNrEz5ed0a96vMiZb3N8EwpxTsDKqjvYzdUYEjlQ9CRdNm7bMzh0cFe4KrFdD/2CqN1QFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ1tdvYD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ1tdvYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275989; x=1782811989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6CpQI6U2HXDC55vGr6BSJJaxh2hOKhfwA+pkGvRtyM=;
  b=HQ1tdvYD1rf8+Ui9zzt6h2nUKf6oThfE9DBsNwyvCkyL0oaCkNbk+oCO
   LfwX4X1242y3C66pqGe4ma9G77oTCp/R99rUurlcMzT4PWx5BdBKKeAfn
   B+838aWfKJyI5aW0uvXBEXn2TJ0APOxKwmPmgXhRF2QFqg9tofZYUvyNJ
   HLHVV+hfSA1wZqskh/xN++jP/7mPEUMFpKs4E74C8TV1unzfDKSNgz8Lf
   SajKrfFxTK3I/wDMi0g4najzUxD1L0nyShw7UQ0ovpMZPJGb41DzZFVtm
   R46N5DkUazngm4WABWDnKDx3Z0k3s8jq2J1cWQ8aJaelv2iVljgXAj8d2
   g==;
X-CSE-ConnectionGUID: LCrFoELqRyOyarJ/2jMIxA==
X-CSE-MsgGUID: CxUO9itBSD67KZ6DFm+0xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53218596"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53218596"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:08 -0700
X-CSE-ConnectionGUID: U5Xtf1ZAS3CIztt2GkbnHQ==
X-CSE-MsgGUID: upvenSqBQliRvM1PqC1TDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153039564"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:07 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2 3/5] mei: bus: use cldev in prints
Date: Mon, 30 Jun 2025 12:19:40 +0300
Message-ID: <20250630091942.2116676-4-alexander.usyskin@intel.com>
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

For unifomity, print using client device on bus
where possible.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/bus-fixup.c | 10 +++++-----
 drivers/misc/mei/bus.c       | 18 +++++++++---------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
index 9eebeffcd8fd..90dba20b2de7 100644
--- a/drivers/misc/mei/bus-fixup.c
+++ b/drivers/misc/mei/bus-fixup.c
@@ -463,14 +463,14 @@ static void mei_nfc(struct mei_cl_device *cldev)
 	if (IS_ERR(cl)) {
 		ret = PTR_ERR(cl);
 		cl = NULL;
-		dev_err(bus->dev, "nfc hook alloc failed %d\n", ret);
+		dev_err(&cldev->dev, "nfc hook alloc failed %d\n", ret);
 		goto out;
 	}
 
 	me_cl = mei_me_cl_by_uuid(bus, &mei_nfc_info_guid);
 	if (!me_cl) {
 		ret = -ENOTTY;
-		dev_err(bus->dev, "Cannot find nfc info %d\n", ret);
+		dev_err(&cldev->dev, "Cannot find nfc info %d\n", ret);
 		goto out;
 	}
 
@@ -496,13 +496,13 @@ static void mei_nfc(struct mei_cl_device *cldev)
 		goto disconnect;
 	}
 
-	dev_dbg(bus->dev, "nfc radio %s\n", radio_name);
+	dev_dbg(&cldev->dev, "nfc radio %s\n", radio_name);
 	strscpy(cldev->name, radio_name, sizeof(cldev->name));
 
 disconnect:
 	mutex_lock(&bus->device_lock);
 	if (mei_cl_disconnect(cl) < 0)
-		dev_err(bus->dev, "Can't disconnect the NFC INFO ME\n");
+		dev_err(&cldev->dev, "Can't disconnect the NFC INFO ME\n");
 
 	mei_cl_flush_queues(cl, NULL);
 
@@ -515,7 +515,7 @@ static void mei_nfc(struct mei_cl_device *cldev)
 	if (ret)
 		cldev->do_match = 0;
 
-	dev_dbg(bus->dev, "end of fixup match = %d\n", cldev->do_match);
+	dev_dbg(&cldev->dev, "end of fixup match = %d\n", cldev->do_match);
 }
 
 /**
diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..d90d830b8261 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -875,14 +875,14 @@ int mei_cldev_disable(struct mei_cl_device *cldev)
 	mei_cl_bus_vtag_free(cldev);
 
 	if (!mei_cl_is_connected(cl)) {
-		dev_dbg(bus->dev, "Already disconnected\n");
+		dev_dbg(&cldev->dev, "Already disconnected\n");
 		err = 0;
 		goto out;
 	}
 
 	err = mei_cl_disconnect(cl);
 	if (err < 0)
-		dev_err(bus->dev, "Could not disconnect from the ME client\n");
+		dev_err(&cldev->dev, "Could not disconnect from the ME client\n");
 
 out:
 	/* Flush queues and remove any pending read unless we have mapped DMA */
@@ -935,7 +935,7 @@ ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
 	cl = cldev->cl;
 	bus = cldev->bus;
 
-	dev_dbg(bus->dev, "client_id %u, fence_id %u\n", client_id, fence_id);
+	dev_dbg(&cldev->dev, "client_id %u, fence_id %u\n", client_id, fence_id);
 
 	if (!bus->hbm_f_gsc_supported)
 		return -EOPNOTSUPP;
@@ -983,11 +983,11 @@ ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
 	/* send the message to GSC */
 	ret = __mei_cl_send(cl, (u8 *)ext_hdr, buf_sz, 0, MEI_CL_IO_SGL);
 	if (ret < 0) {
-		dev_err(bus->dev, "__mei_cl_send failed, returned %zd\n", ret);
+		dev_err(&cldev->dev, "__mei_cl_send failed, returned %zd\n", ret);
 		goto end;
 	}
 	if (ret != buf_sz) {
-		dev_err(bus->dev, "__mei_cl_send returned %zd instead of expected %zd\n",
+		dev_err(&cldev->dev, "__mei_cl_send returned %zd instead of expected %zd\n",
 			ret, buf_sz);
 		ret = -EIO;
 		goto end;
@@ -997,7 +997,7 @@ ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
 	ret = __mei_cl_recv(cl, (u8 *)&rx_msg, sizeof(rx_msg), NULL, MEI_CL_IO_SGL, 0);
 
 	if (ret != sizeof(rx_msg)) {
-		dev_err(bus->dev, "__mei_cl_recv returned %zd instead of expected %zd\n",
+		dev_err(&cldev->dev, "__mei_cl_recv returned %zd instead of expected %zd\n",
 			ret, sizeof(rx_msg));
 		if (ret >= 0)
 			ret = -EIO;
@@ -1006,13 +1006,13 @@ ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
 
 	/* check rx_msg.client_id and rx_msg.fence_id match the ones we send */
 	if (rx_msg.client_id != client_id || rx_msg.fence_id != fence_id) {
-		dev_err(bus->dev, "received client_id/fence_id  %u/%u  instead of %u/%u sent\n",
+		dev_err(&cldev->dev, "received client_id/fence_id  %u/%u  instead of %u/%u sent\n",
 			rx_msg.client_id, rx_msg.fence_id, client_id, fence_id);
 		ret = -EFAULT;
 		goto end;
 	}
 
-	dev_dbg(bus->dev, "gsc command: successfully written %u bytes\n",  rx_msg.written);
+	dev_dbg(&cldev->dev, "gsc command: successfully written %u bytes\n", rx_msg.written);
 	ret = rx_msg.written;
 
 end:
@@ -1399,7 +1399,7 @@ static int mei_cl_bus_dev_add(struct mei_cl_device *cldev)
 {
 	int ret;
 
-	dev_dbg(cldev->bus->dev, "adding %pUL:%02X\n",
+	dev_dbg(&cldev->dev, "adding %pUL:%02X\n",
 		mei_me_cl_uuid(cldev->me_cl),
 		mei_me_cl_ver(cldev->me_cl));
 	ret = device_add(&cldev->dev);
-- 
2.43.0

