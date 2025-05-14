Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E8C1DFDA5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239533; cv=none; b=qe2+j17fEQD+L9wr6/Nuc08ttdctngOKOBfmVTTU7g6jfA025HMkETVjS2pquSmwC1cmjjT4DMF/84qZ22JZS4Y0vsUuelf4eXjcbrY15j7C48pN6r+xV026v4SfyWp6NzA32BSMDuN0Li36azo/8NQ29Oka5RCGggByPGd19Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239533; c=relaxed/simple;
	bh=P8DnB0gIJrwAy41V0jTm5jDLzgE8atqxVLPfzCoIUBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tgc+mWNXoan0HVLM8/0Uce6wwnBExw0C+aiRO34/A5FbLu5m9prfJNuRS7xW3qeZFJ8igznHuTwAfnH3cFW+bAAyWbpxl1cW96fVkp9C04NadNKxHkeSZpqsZXW7YmMLm7OHwhj81D/aCyRcC7qSs6nkhnFcR4JG/923fKz/l/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58DC1150C;
	Wed, 14 May 2025 09:18:39 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4063A3F63F;
	Wed, 14 May 2025 09:18:49 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: oresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 0/3] coresight: prevent deactivate active config while enabling the config
Date: Wed, 14 May 2025 17:18:44 +0100
Message-Id: <20250514161847.3427497-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While enable active config via cscfg_csdev_enable_active_config(),
active config could be deactivated via configfs' sysfs interface.
This could make UAF issue in below scenario:

CPU0                                          CPU1
(sysfs enable)                                load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt == 1)
...
cscfg_csdev_enable_active_config()
lock(csdev->cscfg_csdev_lock)
// here load config activate by CPU1
unlock(csdev->cscfg_csdev_lock)

                                              deactivate config // sysfs
                                              (sys_activec_cnt == 0)
                                              cscfg_unload_config_sets()
                                              unload module

// access to config_desc which freed
// while unloading module.
cfs_csdev_enable_config

To address this,
  Patch #1 fix missing disable config when etm4 device is disabled via sysfs
  Patch #2 holding cscfg_csdev_lock while removing config from cscfg_csdsev_list
  Patch #3 add wrapper to prevent deactivation of config whlie enabling it

Patch History
==============
From v5 to v6:
  - add fixes tag.
  - using guard for locking.
  - https://lore.kernel.org/all/20250513170622.3071637-1-yeoreum.yun@arm.com/

From v4 to v5
  - separate patch set (from Leo Yan)
  - https://lore.kernel.org/all/20250324191740.64964-1-yeoreum.yun@arm.com/


Yeoreum Yun (3):
  coresight/etm4: fix missing disable active config
  coresight: holding cscfg_csdev_lock while removing cscfg from csdev
  coresight: prevent deactivate active config while enabling the config

 .../hwtracing/coresight/coresight-config.h    |  2 +-
 .../coresight/coresight-etm4x-core.c          |  3 ++
 .../hwtracing/coresight/coresight-syscfg.c    | 51 +++++++++++++------
 3 files changed, 40 insertions(+), 16 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

