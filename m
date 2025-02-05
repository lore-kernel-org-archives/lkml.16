Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08B822AE49;
	Wed,  5 Feb 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745153; cv=none; b=cBcctac5aEWJnxqqyuDO3v0nPIwBIwYwALeq6VWXIpMZap5FBMOGvAfyIyFShsaOGOwE+w7fcAOLg0TwliUyKB0B5C2lzjaWUOUp3JR8Bj3yf5FC9gqYpCaF7ko+pjSPxREgI8/FdYjKvixawl/DcbNugeoDw1APJfeNW++u+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745153; c=relaxed/simple;
	bh=n/tmGf7u2M+6dJ0HA/2jjiroZMIY7BNs+wBOXTsMTSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3+AJYpY+lJ3AcxADC9CcC2Z1uEdjtbL0JyTzUzZNYs4anbKqeC3w0e9f3QEh84BWyTpgohb7yyRqsMDwOKJbkAgTfvgz7JOirhuMhQaamgLBNssmAMG0ss1NKSaPEJvC2PegGoBQickLOADEZFskzTB3xa5dJML0rQzkrvlAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bssY+rEK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bssY+rEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745151; x=1770281151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n/tmGf7u2M+6dJ0HA/2jjiroZMIY7BNs+wBOXTsMTSg=;
  b=bssY+rEK+1iW3yZLHpWOMRLMKv2KWXai6cF0X4WZZX7ith9DhAKN6i2v
   ktm/pUZ8yX+RRgM70V9IW/wz52bS2qd8Zp7G81vUdNQC1LgeAG5zhyXSe
   cK58h6/0JswGyIvTJ5GBnWo9za/V1GCN+v5GZrl634HaxUUGuoa+9YKoT
   FuOrcjYYl6hdWddg5Vg2Rgvavwstocff1ifjmbXiHLhMGZP4w1m52GvNH
   UpX2KIl0HNirz33AMLd+OB1Pfx0NtJ8CtW6RqsS+1Ui2LoqBZv8ZWLOTA
   JVJViWfj43XMpMg+cqFPFUwxLbJZho7Zs2Vqysh13sw1Ksgv2CC2CNorp
   g==;
X-CSE-ConnectionGUID: o7w/AKW6QY+CwBiBSGs3VQ==
X-CSE-MsgGUID: hseejEscQfC9qBfExfMqQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532524"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:51 -0800
X-CSE-ConnectionGUID: mTmHM13UQuq2vfkuVpKiFA==
X-CSE-MsgGUID: 69Fq1gM5TWC+OusQmCDn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887860"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 08/16] soundwire: bus: add bpt_stream pointer
Date: Wed,  5 Feb 2025 16:45:22 +0800
Message-ID: <20250205084531.158763-9-yung-chuan.liao@linux.intel.com>
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

Add a convenience pointer to the 'sdw_bus' structure. BPT is a
dedicated stream which will typically not be handled by DAIs or
dailinks. Since there's only one BPT stream per link, storing the
pointer at the link level seems rather natural.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 69f3e700796d..2362f621d94c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -979,6 +979,7 @@ struct sdw_stream_runtime {
  * @stream_refcount: number of streams currently using this bus
  * @btp_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
+ * @bpt_stream: pointer stored to handle BTP streams.
  * @ops: Master callback ops
  * @port_ops: Master port callback ops
  * @prop: Master properties
@@ -1017,6 +1018,7 @@ struct sdw_bus {
 	struct sdw_bus_params params;
 	int stream_refcount;
 	int bpt_stream_refcount;
+	struct sdw_stream_runtime *bpt_stream;
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_master_prop prop;
-- 
2.43.0

