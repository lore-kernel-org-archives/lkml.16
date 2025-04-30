Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36750184E;
	Wed, 30 Apr 2025 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999250; cv=none; b=Hl4sqzwMFUauO3cbTVXX7s88S4O4hHmFM8SCUeH+HdLphETZHhqXNMrLMpLZHkstMXMlFd9eA+jxnsrkEi5Sq4Odpv2bslLY8rt0tNfVB21FtEHlLtWiAxxjOH4n0uj6CTCFAASDtxsPqgbq9v2eYSGbPrbTaWpm4y0KT44qPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999250; c=relaxed/simple;
	bh=m8QqWpP5vTekHDqvE3M+D2l43nKw9si3U2iUU2Tpz84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6paHzpjzpe/qSChvdxL5fMALU/PQ3So0iJ/JvEK6fmJ7uo8dNtadEBK3zuWilPu0UdKGO8gtBi5jwszusERyhW+pBrvUzJO8kmsAg6NZQAz1SHj/ltYDcHRmKKUWYIeooM1t0IiRTs9xv8SRoHja2BYG4KCcFUORIhVEGSDJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPwAOW7o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPwAOW7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745999249; x=1777535249;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m8QqWpP5vTekHDqvE3M+D2l43nKw9si3U2iUU2Tpz84=;
  b=jPwAOW7oKPnA/Jrto+5if7wmU54RCEKOY/QDSsmT06vey7K12rw8eezY
   aegkilD0Mly3xBW3fqYRPVfhSkHWC7ufI6HWWzf8HgX7DOFeWCxyDUEpU
   X7t2upMu9Z7oJIEsMmL7UZ8Zc60ESK/blR8Zr/VAJGyzIzoJpnQt1ck7S
   zGFc9HY5+s6uJnunWfdWFEk28ToOzqVawQAviiWcJvuVkG+AxCIzKG11g
   yaiZ49ardjHoZ++S7R0zRmNdbuZXSlNfsYXnlvC8jU1hKEG8OOOTrxQ5D
   6AVD2XKU6jDrzBpKWELrb9jM0sfti6BhwqjmaOWTY/eJzVkPGScukVkVD
   A==;
X-CSE-ConnectionGUID: WkLxnzjTRvqcUgZsOe+Qpg==
X-CSE-MsgGUID: XY0j4OkYThCsfZOS22lUyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50304190"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50304190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:27 -0700
X-CSE-ConnectionGUID: bse2DIHaRA6Blj9S9TIvwA==
X-CSE-MsgGUID: ycyAW+8iT5uMxP+r7tpZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133994204"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.233])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] SoundWire/ASoC: Intel: Add suppoirt for printing ACE3+ PVCCS (mic privacy) register in register dump
Date: Wed, 30 Apr 2025 15:47:12 +0800
Message-ID: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series print the PVCCS register alongside with the other SHIM
registers in soundwire link register dump when ACE3 or newer is in use.
The change is mainly on the SoundWire tree. It would be better to go
through the SoundWire tree with Mark's Acked-by tag.

Peter Ujfalusi (2):
  soundwire: intel: Add awareness of ACE3+ microphone privacy
  ASoC: SOF: Intel: hda: Set the mic_privacy flag for soundwire with
    ACE3+

 drivers/soundwire/intel.h               | 2 ++
 drivers/soundwire/intel_ace2x_debugfs.c | 6 ++++++
 drivers/soundwire/intel_init.c          | 1 +
 include/linux/soundwire/sdw_intel.h     | 5 +++++
 sound/soc/sof/intel/hda.c               | 3 +++
 5 files changed, 17 insertions(+)

-- 
2.43.0

