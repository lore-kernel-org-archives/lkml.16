Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E638384;
	Thu,  8 May 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727865; cv=none; b=fJgSu4lPvacCQ3fojbDrWCFRMIKARL3y3cAFsRzF9f/nD15YYkZwUBOkNwDaWnYnlzsfOB4VtSKlNb5fJSfrjgHS3FCmPekDKgFELtxei0/u5vTElD4ozoUIvusZ0RK8KSqElcXWhGnMaPnfuPLeVHisUOWdBQ+GTP2STJ7T8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727865; c=relaxed/simple;
	bh=h2z7asBiLWhRr6KyfeycB+CvmHgHDalytvMwoHOAQOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rauOhTeglgnN2QUe/ObShldJEK/1uCVNdjxhW+kEgF7/k3H22AEWzfWT4B9UcEU/Wf1DhkD4DJFve83IdbxVrI8z6y284nd4qwa1x3DNMWMdAx4YqfmM1Q86OFQolNO49jkK1oYpER594zOFKk95x9TZ9DlmWkPhxv8ODsfrQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWd9QRAr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWd9QRAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746727861; x=1778263861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h2z7asBiLWhRr6KyfeycB+CvmHgHDalytvMwoHOAQOE=;
  b=RWd9QRAr+ZCP+ZbckSTFLJmZauvT3tkIQ6aOosb9YPcirj5Rvuthx0Xz
   SPit5JPV/9bXxfbyYAX9K9AeY1V3URTNoNzneRu/64R0USomFOc2gN3K9
   rWdlcfPEEO2yDFaiaXNLjztnZLUU4Tl/qJUW08JONBO1OlAGaZktJte01
   Aq1jOUFa4CrqOojir8IwTRP4JqN3F3Grr3NrT5CZ2fqBVg07ds20SADpq
   zOzw4GyK1nKM2ptc/KDqyXt5JzF8ITqAUZ21qkB3gZAHZ0riJtK/jVnDG
   oAhn8pUJkSD/lx7h5B93qQ18E6QYaymfO2d3KNTninERgqir8Cf5l1GLb
   A==;
X-CSE-ConnectionGUID: dcHN0FiZSa+kq/cIwrs59A==
X-CSE-MsgGUID: nvdHN7sRQUSY/DghPvvxAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71044164"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="71044164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:11:00 -0700
X-CSE-ConnectionGUID: 7+RJvBV3R36MDgF8vvbepw==
X-CSE-MsgGUID: B3uGSd1+T42KCZNkdTl6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137372177"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.123])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:10:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ALSA/hda: intel-sdw-acpi: Correct sdw_intel_acpi_scan() function parameter
Date: Thu,  8 May 2025 21:12:07 +0300
Message-ID: <20250508181207.22113-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The acpi_handle should be just a handle and not a pointer in
sdw_intel_acpi_scan() parameter list.
It is called with 'acpi_handle handle' as parameter and it is passing it to
acpi_walk_namespace, which also expects acpi_handle and not  acpi_handle*

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 2 +-
 sound/hda/intel-sdw-acpi.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 493d9de4e472..dc6ebaee3d18 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -365,7 +365,7 @@ struct sdw_intel_res {
  * on e.g. which machine driver to select (I2S mode, HDaudio or
  * SoundWire).
  */
-int sdw_intel_acpi_scan(acpi_handle *parent_handle,
+int sdw_intel_acpi_scan(acpi_handle parent_handle,
 			struct sdw_intel_acpi_info *info);
 
 void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx);
diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 8686adaf4531..d3511135f7d3 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -177,7 +177,7 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
  * sdw_intel_startup() is required for creation of devices and bus
  * startup
  */
-int sdw_intel_acpi_scan(acpi_handle *parent_handle,
+int sdw_intel_acpi_scan(acpi_handle parent_handle,
 			struct sdw_intel_acpi_info *info)
 {
 	acpi_status status;
-- 
2.49.0

