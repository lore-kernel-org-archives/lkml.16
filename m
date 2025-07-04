Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B02877C1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615683; cv=none; b=kH6lGQcl5Mf04cuDdhzr1ibURz4wg/+jf9Qik0svEJFysffNu4/5djFhoWgEj3ynowHt/GddriRKDM47RoCBrG1FHTq/AFmJ2q6qp9rM7gf74hgnz8XC33zfhWW5Cw5bZabsQXDciXSijuNPRk1es1jOqTqREGVYHGsAUwVZJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615683; c=relaxed/simple;
	bh=fZSPKC9lEpywQR5wVlMhCiGiyi1wk01/vlOQcZOZU0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ts79saLZ6HnnbZnfIAUR6aQZP9pGQbKJ9W56WosmGY/xDKE+MzI9GI3RWKPrJoJL+kz/7jcvXhH+IZ5W0HPxb5V2WhHwVl/QvGYtENzPl71cbsuSL2bvT736aEbdjKakZSMlZtzFXOsSms8a4EjnNdxRpRjNgWiRn7qc25fRmpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9G8ixUb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9G8ixUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615680; x=1783151680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZSPKC9lEpywQR5wVlMhCiGiyi1wk01/vlOQcZOZU0o=;
  b=X9G8ixUb+uVL35wIWH9I7vLiJrF4kF/929dGtJtgoHFLWtBlTQlzD426
   KKh/i2Wp0Mp+TGVR31CvcWlkqA7hAITaTQsC/jLofYv4ww4cKyu4G9lpX
   rIOe0bEXewqJ9qsq1H5U01oqRjl13JMDC1dnxe+Kpp/gQQnMu2Kxv0GdP
   d6+xDDBarGvzCyIm3yENvvxUyJE8CFCmq4YjQuObWb0EJbcW1w3kSPosX
   zqF9ntp4Xeemvy0Nnk6CIHOzgyEbwJpk69t0Vt6D25zFOhlcOPSkCOda8
   dSLHqios2CNEDpwtO+dmK5DzBWHtEgReWJ1T8qL+S8iSRgiXafL+vaXkh
   w==;
X-CSE-ConnectionGUID: 8etS7fzJS5qYX3KTotB3sg==
X-CSE-MsgGUID: xLYJNzn2SrODBhB6bHhrxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194105"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:37 -0700
X-CSE-ConnectionGUID: bY013aNITeWIbNWEFRISBw==
X-CSE-MsgGUID: UYApL9RjQeWx4KDV6nz/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616570"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:35 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 3E4E744394;
	Fri,  4 Jul 2025 10:54:33 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 43/80] mei: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:33 +0300
Message-Id: <20250704075433.3220381-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/misc/mei/client.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 3db07d2a881f..191ab784e160 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -709,7 +709,6 @@ void mei_host_client_init(struct mei_device *dev)
 
 	schedule_work(&dev->bus_rescan_work);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	dev_dbg(dev->dev, "rpm: autosuspend\n");
 	pm_request_autosuspend(dev->dev);
 }
@@ -991,7 +990,6 @@ int mei_cl_disconnect(struct mei_cl *cl)
 	rets = __mei_cl_disconnect(cl);
 
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return rets;
@@ -1167,7 +1165,6 @@ int mei_cl_connect(struct mei_cl *cl, struct mei_me_client *me_cl,
 	rets = cl->status;
 out:
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	mei_io_cb_free(cb);
@@ -1554,7 +1551,6 @@ int mei_cl_notify_request(struct mei_cl *cl,
 
 out:
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	mei_io_cb_free(cb);
@@ -1702,7 +1698,6 @@ int mei_cl_read_start(struct mei_cl *cl, size_t length, const struct file *fp)
 
 out:
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 nortpm:
 	if (rets)
@@ -2092,7 +2087,6 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
 	rets = buf_len;
 err:
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 free:
 	mei_io_cb_free(cb);
@@ -2119,7 +2113,6 @@ void mei_cl_complete(struct mei_cl *cl, struct mei_cl_cb *cb)
 		if (waitqueue_active(&cl->tx_wait)) {
 			wake_up_interruptible(&cl->tx_wait);
 		} else {
-			pm_runtime_mark_last_busy(dev->dev);
 			pm_request_autosuspend(dev->dev);
 		}
 		break;
@@ -2366,7 +2359,6 @@ int mei_cl_dma_alloc_and_map(struct mei_cl *cl, const struct file *fp,
 		mei_cl_dma_free(cl);
 
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	mei_io_cb_free(cb);
@@ -2444,7 +2436,6 @@ int mei_cl_dma_unmap(struct mei_cl *cl, const struct file *fp)
 		mei_cl_dma_free(cl);
 out:
 	cl_dbg(dev, cl, "rpm: autosuspend\n");
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	mei_io_cb_free(cb);
-- 
2.39.5

