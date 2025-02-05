Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446322B8A8;
	Wed,  5 Feb 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745156; cv=none; b=Y2M3Kydq87X+802RuDrqiafIrqeyNGfz+W6A0IQZTHiyggsCPzRUuRuHpQSNnEC7K8DHWdcnnH813KXA27lQpH3ou6Fa4jhARogKyN+8PeKX7LhdDWdytt1emW63agem4ccpRILn8Nmt7l+UyewLhqguBNBzSCrsGDtVR/2AJiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745156; c=relaxed/simple;
	bh=nmAdw3SbdQ3HfIKGggry5T4iL3pNV55r+kPr/yeWC7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHFskbkZvAjgF395dbEsZb2ld0dUM89glGv4e0mjEJ6QZL2LdKNgPNAZF7+vuQnesY+urZbXs6/JqWTcP8ry7oHbXf5O6j4atBSdwAGDk3Bu9bi15YLbG90leF+mfAw1/HrgSFQdKpLPQGfriv7v6xDjHuF1hW2MuoWUsD3ifIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbJv+k+J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbJv+k+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745155; x=1770281155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nmAdw3SbdQ3HfIKGggry5T4iL3pNV55r+kPr/yeWC7I=;
  b=YbJv+k+JGKFeLBTOJwlrLDEIdRPMucngJR/9ORLcsGRSbEf2ifJg6/38
   BiQ4yVhwTGv63tcJpS9vYUVyMA/Ler6yVF5/vJJrZrcyWsHH7q1wbXPVO
   uDV5aVP9cfcefv/x6m0nSKckHfo2pbfJ5pMouCFJrNnMnQLDt7vEN/7M1
   ODfbPbgns4lBV6IuKsDtsRbt/lTwI/DTWiELdE1UsLqJX07b8nsNVhUg8
   XHPGKDevuVHYtzIinp0fwvL5dPZqViHQ98GR73qdQ9tYyQ8z2K5pb4OVB
   WsD5bEdvqbM7N81HCEDpSsln4CqdX/PKxOWUiAQtmW5TSVNd5qtyN8bhQ
   A==;
X-CSE-ConnectionGUID: DbdZ+AjLRKqbuIcxttw1yw==
X-CSE-MsgGUID: Py0xe27sQpSXJ8gbFcTcTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532536"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:54 -0800
X-CSE-ConnectionGUID: +GQB7gA0RJeEm1gxkh5A/A==
X-CSE-MsgGUID: 785VSONXTUaQHsPE0ZG03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887888"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 10/16] soundwire: intel_auxdevice: add indirection for BPT send_async/wait
Date: Wed,  5 Feb 2025 16:45:24 +0800
Message-ID: <20250205084531.158763-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Mirror abstraction added for master ops.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 24 ++++++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 599954d92752..b34b897400fc 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -79,6 +79,27 @@ static bool is_wake_capable(struct sdw_slave *slave)
 	return false;
 }
 
+static int generic_bpt_send_async(struct sdw_bus *bus, struct sdw_slave *slave,
+				  struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_send_async)
+		return sdw->link_res->hw_ops->bpt_send_async(sdw, slave, msg);
+	return -EOPNOTSUPP;
+}
+
+static int generic_bpt_wait(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_wait)
+		return sdw->link_res->hw_ops->bpt_wait(sdw, slave, msg);
+	return -EOPNOTSUPP;
+}
+
 static int generic_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
@@ -288,6 +309,9 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.get_device_num =  intel_get_device_num_ida,
 	.put_device_num = intel_put_device_num_ida,
 	.new_peripheral_assigned = generic_new_peripheral_assigned,
+
+	.bpt_send_async = generic_bpt_send_async,
+	.bpt_wait = generic_bpt_wait,
 };
 
 /*
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 580086417e4b..493d9de4e472 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -436,6 +436,10 @@ struct sdw_intel_hw_ops {
 	bool (*sync_check_cmdsync_unlocked)(struct sdw_intel *sdw);
 
 	void (*program_sdi)(struct sdw_intel *sdw, int dev_num);
+
+	int (*bpt_send_async)(struct sdw_intel *sdw, struct sdw_slave *slave,
+			      struct sdw_bpt_msg *msg);
+	int (*bpt_wait)(struct sdw_intel *sdw, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.43.0

