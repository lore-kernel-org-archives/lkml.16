Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C6275B08;
	Thu, 26 Jun 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939007; cv=none; b=NKy/cwHVIrP3Tu5Xs1SdH3GL7RB83WA+5JRN2q/M7pwm2QRt1OMwDV/X3oVwbqLPx74zwZhsCv6/F29TC1P3DsUPWu6Chwafov3Iuki7VuChjcQCtC2y6NXP3OcJqcAa46gc3qpj/G4hIG+2NQG67CZshfgZfFcDtCtdNhHJjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939007; c=relaxed/simple;
	bh=Yfr0P0vg7a2fWi2QizXPf/WipE7iGQ1sFhE5LDo3Jkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QswuJaveXcadzKr12fpO0DW6H2rQ9uS4/B3ychgpO9Ez7kk5pmXO+IKQYg9OTzOu3Oq32+USXzstjjL6c3OPs/yhNg/MocfdEhpEGliTudnxftM/2uZxZ/Bp4qiqhcrmkr0BeBWSqwWTtJl+5hZLfUajSuYPPRBtSABhkESJTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DckGpYfb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DckGpYfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939005; x=1782475005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yfr0P0vg7a2fWi2QizXPf/WipE7iGQ1sFhE5LDo3Jkk=;
  b=DckGpYfbji7JCgO7aMqbuZOToXpDJ8PA6VQTq6I8pA2hVwKjLyyI4K4z
   GDp/q6ESGzng558/jfDSuREaRhXr4+iaK+4yXe5yYdmHvZ3cKSOCgRY5g
   Aunq/Pj+om3NpTCtQhoWWUSaE9EgbdFeRrDb1ao5pIOCX40GhdB/Vb1tQ
   TjcAO5AhIqhi9Ww5OArLpFTHvCs2uKXqFPmrjIgw1hV0qEi8s0/rFh4gf
   ev4YTBaDqtNzzbzmzGSsWX6VOnuXVktrmGi5L0yifNXiOYsyvI+yJQykx
   XGBmAA08uasD6kTug5UZ7b7zXRQH8ifjGKr4UmeCGNrqZlnu+ZPHIKfZr
   Q==;
X-CSE-ConnectionGUID: 14XVvgXKSqmio0Whm9iLYw==
X-CSE-MsgGUID: 2PMr7nH9QZeSqwuzVtjFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304520"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:44 -0700
X-CSE-ConnectionGUID: 9r4Zx2t7Sbensz7JUsccsg==
X-CSE-MsgGUID: THIUErPGT+yHvyseXkv4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800551"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:10 +0800
Message-ID: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code waits for the codec initialization in the resume
callback. It could cause the resume takes a long time while waiting for
the codec being attached and initialized. Move the waiting to the
hw_params callback when the driver really needs it and shorten the
resume time.
The change is mainly on the ASoC tree. Let's go through the ASoC tree.

Bard Liao (15):
  soundwire: add sdw_slave_wait_for_initialization helper
  ASoC: rt722: wait codec init in hw_params
  ASoC: rt712: wait codec init in hw_params
  ASoC: rt1320: wait codec init in hw_params
  ASoC: rt721: wait codec init in hw_params
  ASoC: rt715-sdca: wait codec init in hw_params
  ASoC: rt711-sdca: wait codec init in hw_params
  ASoC: rt711: wait codec init in hw_params
  ASoC: rt715: wait codec init in hw_params
  ASoC: rt700: wait codec init in hw_params
  ASoC: rt1316: wait codec init in hw_params
  ASoC: rt1318: wait codec init in hw_params
  ASoC: rt1308: wait codec init in hw_params
  ASoC: rt5682: wait codec init in hw_params
  ASoC: rt1017: wait codec init in hw_params

 drivers/soundwire/slave.c          | 17 ++++++++++++++
 include/linux/soundwire/sdw.h      |  1 +
 sound/soc/codecs/rt1017-sdca-sdw.c | 32 ++++++++++++++++----------
 sound/soc/codecs/rt1308-sdw.c      | 32 ++++++++++++++++----------
 sound/soc/codecs/rt1316-sdw.c      | 32 ++++++++++++++++----------
 sound/soc/codecs/rt1318-sdw.c      | 30 ++++++++++++++++--------
 sound/soc/codecs/rt1320-sdw.c      | 32 ++++++++++++++++++--------
 sound/soc/codecs/rt5682-sdw.c      | 29 +++++++++++++++--------
 sound/soc/codecs/rt700-sdw.c       | 27 ++++++++++++----------
 sound/soc/codecs/rt700.c           |  6 +++++
 sound/soc/codecs/rt711-sdca-sdw.c  | 28 ++++++++++++----------
 sound/soc/codecs/rt711-sdca.c      |  6 +++++
 sound/soc/codecs/rt711-sdw.c       | 26 +++++++++++++--------
 sound/soc/codecs/rt711.c           |  6 +++++
 sound/soc/codecs/rt712-sdca-sdw.c  | 28 ++++++++++++----------
 sound/soc/codecs/rt712-sdca.c      |  6 +++++
 sound/soc/codecs/rt715-sdca-sdw.c  | 37 ++++++++++++++++++++----------
 sound/soc/codecs/rt715-sdca.c      |  6 +++++
 sound/soc/codecs/rt715-sdw.c       | 27 ++++++++++++----------
 sound/soc/codecs/rt715.c           |  6 +++++
 sound/soc/codecs/rt721-sdca-sdw.c  | 29 ++++++++++++-----------
 sound/soc/codecs/rt721-sdca.c      |  6 +++++
 sound/soc/codecs/rt722-sdca-sdw.c  | 26 +++++++++++----------
 sound/soc/codecs/rt722-sdca.c      |  6 +++++
 24 files changed, 320 insertions(+), 161 deletions(-)

-- 
2.43.0

