Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA425765;
	Wed,  5 Feb 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745142; cv=none; b=S1pLlin7V7FFGfQv9DJKL84bIhSxlqhRzf4GVPT6mLhHSFo/wntJCIk8sAVNyu5EkjGr+sejKZes9q8IfNRFvmWEv+/VyLpUClcGcFuR3xKv7EvfdxvlE92LhunuBHT/Po3Q7vJ5JmB2PXJcJqyfy6bSE6Lqwef3KYJhwqMEWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745142; c=relaxed/simple;
	bh=7kS3HeRnfWu3PX2k+3nbSPf5NiXeM8VxpQJjxNUx//s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jy22HoYqbR3n0UshxTUSh3JWMzpNW8T3qgI4O1ofL0fqGylWUi8FCNzW7cNy4fj8ZLw60+5OlRHibjNcCMnuSg/8gRBS0KXY53A3393FUw0gKLGaTqdYiA/EWgMEKdo2T5PzcenMwxAJ5N8JDSTPlbZo+Pua/Cf0nHbE+2XgkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSHSJixd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSHSJixd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745141; x=1770281141;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7kS3HeRnfWu3PX2k+3nbSPf5NiXeM8VxpQJjxNUx//s=;
  b=MSHSJixdl5sGXkHYr00vTZOZgZK36/L/qz4+VgT1GwzZZjTjBi+N9Scq
   MdZojrSgsdHeBUOBiZAXlculJlJicrvuSqI/OgHcwK3urGHoATknXwjQx
   33VGOBj/qBHL9Vme2b2TA7THib3Tfy4XEPfO7LfTd+4YLyR8py7CF14UJ
   lS2VdJuk10gUSNUBTh0gunz6zasajszA4KUsJcPwigf8yiu4cLLzTwk2V
   Qcfr/Z0fOIFzvLd4HYnxNxuLqP6NHTPoT/yr1ws//0hT2aPZG3Jij3iNq
   eezAoiyEn3ZBNC0OXG/95k1vDzhfkBlSmM+P7RPKTNwFxgnZrD33KfTCW
   w==;
X-CSE-ConnectionGUID: bcoMDQyZQtCXYrpkKmVthg==
X-CSE-MsgGUID: pT9JZwv8TQG8v4fu8ZbGDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532476"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:39 -0800
X-CSE-ConnectionGUID: oTmLRYNTTYiW01akvOxV3g==
X-CSE-MsgGUID: EOZlADGZQvakTSZoqkpRig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887783"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:39 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 00/16] SoundWire/ASoC: add SDW BPT/BRA support
Date: Wed,  5 Feb 2025 16:45:14 +0800
Message-ID: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds support for SoundWire BPT/BRA. The change is mainly on
the SoundWire tree. It is better to go through the SoundWire tree with
Mark's Acked-by tag.

Pierre-Louis Bossart (16):
  Documentation: driver: add SoundWire BRA description
  soundwire: cadence: add BTP support for DP0
  soundwire: extend sdw_stream_type to BPT
  soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
  soundwire: stream: special-case the bus compute_params() routine
  soundwire: stream: reuse existing code for BPT stream
  soundwire: bus: add send_async/wait APIs for BPT protocol
  soundwire: bus: add bpt_stream pointer
  soundwire: cadence: add BTP/BRA helpers to format data
  soundwire: intel_auxdevice: add indirection for BPT send_async/wait
  ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA
  soundwire: intel: add BPT context definition
  soundwire: intel_ace2x: add BPT send_async/wait callbacks
  ASoC: SOF: Intel: hda-sdw-bpt: add CHAIN_DMA support
  soundwire: debugfs: add interface for BPT/BRA transfers
  ASoC: rt711-sdca: add DP0 support

 Documentation/driver-api/soundwire/bra.rst    | 336 +++++++++
 .../driver-api/soundwire/bra_cadence.rst      |  67 ++
 Documentation/driver-api/soundwire/index.rst  |   2 +
 Documentation/driver-api/soundwire/stream.rst |   2 +-
 .../driver-api/soundwire/summary.rst          |   8 -
 drivers/soundwire/Kconfig                     |   1 +
 drivers/soundwire/bus.c                       |  43 ++
 drivers/soundwire/bus.h                       |  18 +
 drivers/soundwire/cadence_master.c            | 658 +++++++++++++++++-
 drivers/soundwire/cadence_master.h            |  20 +
 drivers/soundwire/debugfs.c                   |  84 ++-
 .../soundwire/generic_bandwidth_allocation.c  |  48 ++
 drivers/soundwire/intel.h                     |  23 +
 drivers/soundwire/intel_ace2x.c               | 312 +++++++++
 drivers/soundwire/intel_auxdevice.c           |  24 +
 drivers/soundwire/stream.c                    | 140 +++-
 include/linux/soundwire/sdw.h                 |  33 +-
 include/linux/soundwire/sdw_intel.h           |   4 +
 include/sound/hda-sdw-bpt.h                   |  69 ++
 sound/soc/codecs/rt711-sdca-sdw.c             |   8 +
 sound/soc/qcom/sdw.c                          |   2 +-
 sound/soc/sof/intel/Kconfig                   |   7 +
 sound/soc/sof/intel/Makefile                  |   4 +
 sound/soc/sof/intel/hda-sdw-bpt.c             | 444 ++++++++++++
 24 files changed, 2293 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/driver-api/soundwire/bra.rst
 create mode 100644 Documentation/driver-api/soundwire/bra_cadence.rst
 create mode 100644 include/sound/hda-sdw-bpt.h
 create mode 100644 sound/soc/sof/intel/hda-sdw-bpt.c

-- 
2.43.0

