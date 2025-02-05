Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466322A7EB;
	Wed,  5 Feb 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745149; cv=none; b=qi/S7d395sH1IiRtqWnQbN7zrzcZokC5PDUw1cPBNXJIh6rmIxlSF60zkwTwA9UU4+lNHq2WdJrUg+y0sXaFnbX45S5VfyW9S7g/cPX4amQZeiyYvBSkdWQ7+nVPCggGfxbKl0egg1lCs+EA2FeX+TYXx82V+Y0jGbk0q1ikCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745149; c=relaxed/simple;
	bh=rgmme76n2CzNqkUCcP3NAi7yfETqH2iSYt1NYJV6DOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nb77nuszpFsbOkcyYl8aXY7OyuzpGStgEJGXSR9MXwMd1cm6e1NneGmUcTGWkuj1aRmbwNeAcCWMYOGUI+/k/hoX8RLZhPIdTHmsj9DOy/uMewK3V778c/TZYWnicghGlCKYGLGgOWgwHUFW2E9GLV/GluWDeQDocDoAWoMu5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVh06Rmw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVh06Rmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745147; x=1770281147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rgmme76n2CzNqkUCcP3NAi7yfETqH2iSYt1NYJV6DOg=;
  b=AVh06RmwKXwfBpvGaUtAaiVXi5vxCUKPrn+9xpjW7n4HQIOwsMxSrX28
   pKBHfYfKRjlPU/sd1fGzLc3Zg2qn2qMS5HPdis9sJOD+qvprCDwp4qkFx
   qqNVGcz5ZXumVMrDBQGVBN13Q0V0iFDikUxncB/5pmGAPKFXU/WQ8wlmQ
   nafDzn3dMQ9/V4A6YzWH1Go/erSYIaOYXCd+jvsTJbYF1Xjubz2hWKjjK
   +/DKZzqEySH711s8G7H/k3MTOHehhy62ee6zNAnoeNe/xjGwjea+GEpya
   D3YBGTa5XWj7+My1iRlfRDA7diL/wlpsCCe6ac3FqgfN5ZPqA1dbiua56
   w==;
X-CSE-ConnectionGUID: m+ygSSesQg+b7WkTT0x+3g==
X-CSE-MsgGUID: Ijl2kJAiQRO0s38l7kEVBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532508"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:47 -0800
X-CSE-ConnectionGUID: Bep3KNIFRGKlQDkXyzQBIg==
X-CSE-MsgGUID: ojzDs/qLS1qhJ5gfFYL6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887831"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 05/16] soundwire: stream: special-case the bus compute_params() routine
Date: Wed,  5 Feb 2025 16:45:19 +0800
Message-ID: <20250205084531.158763-6-yung-chuan.liao@linux.intel.com>
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

For BPT support, we want to allocate the entire audio payload and
bypass the allocation based on PCM/PDM parameters.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 59965f43c2fb..b646c2ffe84a 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -86,6 +86,49 @@ void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 }
 EXPORT_SYMBOL(sdw_compute_slave_ports);
 
+static void sdw_compute_dp0_slave_ports(struct sdw_master_runtime *m_rt)
+{
+	struct sdw_bus *bus = m_rt->bus;
+	struct sdw_slave_runtime *s_rt;
+	struct sdw_port_runtime *p_rt;
+
+	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num, false,
+					      SDW_BLK_GRP_CNT_1, bus->params.col, 0, 0, 1,
+					      bus->params.col - 1, SDW_BLK_PKG_PER_PORT, 0x0);
+
+			sdw_fill_port_params(&p_rt->port_params, p_rt->num, bus->params.col - 1,
+					     SDW_PORT_FLOW_MODE_ISOCH, SDW_PORT_DATA_MODE_NORMAL);
+		}
+	}
+}
+
+static void sdw_compute_dp0_master_ports(struct sdw_master_runtime *m_rt)
+{
+	struct sdw_port_runtime *p_rt;
+	struct sdw_bus *bus = m_rt->bus;
+
+	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num, false,
+				      SDW_BLK_GRP_CNT_1, bus->params.col, 0, 0, 1,
+				      bus->params.col - 1, SDW_BLK_PKG_PER_PORT, 0x0);
+
+		sdw_fill_port_params(&p_rt->port_params, p_rt->num, bus->params.col - 1,
+				     SDW_PORT_FLOW_MODE_ISOCH, SDW_PORT_DATA_MODE_NORMAL);
+	}
+}
+
+static void sdw_compute_dp0_port_params(struct sdw_bus *bus)
+{
+	struct sdw_master_runtime *m_rt;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		sdw_compute_dp0_master_ports(m_rt);
+		sdw_compute_dp0_slave_ports(m_rt);
+	}
+}
+
 static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 				     struct sdw_group_params *params,
 				     int *port_bo, int hstop)
@@ -618,6 +661,11 @@ int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 	if (ret < 0)
 		return ret;
 
+	if (stream->type == SDW_STREAM_BPT) {
+		sdw_compute_dp0_port_params(bus);
+		return 0;
+	}
+
 	/* Compute transport and port params */
 	ret = sdw_compute_port_params(bus, stream);
 	if (ret < 0) {
-- 
2.43.0

