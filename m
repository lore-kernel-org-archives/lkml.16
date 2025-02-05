Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B115022A4C9;
	Wed,  5 Feb 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745146; cv=none; b=nmtmx4qW4Rw1qVAD3VzZuaOC3yRgrXDvAJ4UqNF+7EUP2FfaheZXYi/HyVdkoGHQgJCIxMQGq7liUTU1If2HMrtR7HPvXtAJwyuI8RBRIrV1xznoHz9T8X2BvEZSMO7vgH+Z0raB6vSVd4Ki+Prl19xG4/UEHO3SX3qgm7x9c/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745146; c=relaxed/simple;
	bh=HSF+H1PDIlrUCc++S+iDhYzlOmMHnlfrSJQjr96Q2lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZbdVJLZhur3AEKBV+Sh1Bn47AeKe4+KEVc8a/h9XAjOXquFU2oT340sVQlS65BIjVnHRCA9y8nxiCFY+5x+xvpLtG3c2oVxjHKemV55rHyhYRsZjRfDAWO+KebvRPciyTRK/smkBrewXGjuQ1jmRQqmDwR30S+OnPT+nwRRlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8c/N58o; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8c/N58o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745144; x=1770281144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HSF+H1PDIlrUCc++S+iDhYzlOmMHnlfrSJQjr96Q2lo=;
  b=c8c/N58oHt3lYAsG3mtCHsc9CaXcVytDdPF7/v+tc7J3dOznl2YAKf20
   Qy4Cd5kmgAn7nxlAnPlUHMeKGe5wjUSiofcKOp8eHpbs3gN1iM2OlhWyq
   nAq6E2E5hZlYfrOUGsytLFOJf2xXbau1pWoe9PmuxyxQiEZATX0SdahWI
   n7XGEh8YtZUrSPV83FUIF1SFLRldajaQ87eNvStrpINU5sZE/ooZTDiGZ
   KwG27VO0AXmTC+2QVbSMDfS8fWiBZse3t478f2U1a3Etwdap0phwWMKxp
   1eZmEJbu3H4VGPPh9Ib3Nwj2TzocNf+y32el91NCm2p32gSmw3/mu0nGp
   Q==;
X-CSE-ConnectionGUID: NBIK8YXOQzGzQSI0Ixo+iw==
X-CSE-MsgGUID: L2gOgz/7RL+iC16CfqzAAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532497"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:44 -0800
X-CSE-ConnectionGUID: MyF4FNqeShmN1tG1F2lnnw==
X-CSE-MsgGUID: bQGzG9kHTbCuJ2ZWB171/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887813"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:44 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 03/16] soundwire: extend sdw_stream_type to BPT
Date: Wed,  5 Feb 2025 16:45:17 +0800
Message-ID: <20250205084531.158763-4-yung-chuan.liao@linux.intel.com>
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

BPT/BRA need to be special cased, i.e. there's no point in using the
bandwidth allocation since the entire frame can be used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2d6c30317792..857b670eb9a5 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -150,12 +150,14 @@ enum sdw_dpn_pkg_mode {
  *
  * @SDW_STREAM_PCM: PCM data stream
  * @SDW_STREAM_PDM: PDM data stream
+ * @SDW_STREAM_BPT: BPT data stream
  *
  * spec doesn't define this, but is used in implementation
  */
 enum sdw_stream_type {
 	SDW_STREAM_PCM = 0,
 	SDW_STREAM_PDM = 1,
+	SDW_STREAM_BPT = 2,
 };
 
 /**
@@ -879,7 +881,7 @@ struct sdw_port_config {
  * @ch_count: Channel count of the stream
  * @bps: Number of bits per audio sample
  * @direction: Data direction
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  */
 struct sdw_stream_config {
 	unsigned int frame_rate;
@@ -929,7 +931,7 @@ struct sdw_stream_params {
  * @name: SoundWire stream name
  * @params: Stream parameters
  * @state: Current state of the stream
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  * @m_rt_count: Count of Master runtime(s) in this stream
  * @master_list: List of Master runtime(s) in this stream.
  * master_list can contain only one m_rt per Master instance
-- 
2.43.0

