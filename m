Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A886250;
	Mon, 31 Mar 2025 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404894; cv=none; b=usnBU2m+g+m/zo+he0HEQfHIBr8XuFRxtgKYQ4nK7LWFRqVTQa6kMsfTBZbd0czcn3C3M+0FkCrQphaaDP004b16CrCMAYuED+qZuWMu2kdtxdP1h7sjBhV9qLYQZvsELcbqmb8kVW1qsAhzpkbkllSPEKeSdVXCHi+V4+vIDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404894; c=relaxed/simple;
	bh=tD5tfTS4WH5AtYJNkSnk/LkniVjgN+9AKK8eT5IyK5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GY47Ly2VjUS05BWMZBUTyo5r2oKf6NWerThu1XPNEYe2TpUt5Vrvlk6tj7ynLzFQ8CvVp3bhYczcq2a6qbpP5yMi7JwIK9eZ4xY6GCZuRQ5nL+gVdq2m0tDj9w82jEyABBeYDXxeSI5Nc9eMh2NqHCmJxXQ4D8Sh3UJmdxu4WHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pe1N58hr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pe1N58hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404892; x=1774940892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tD5tfTS4WH5AtYJNkSnk/LkniVjgN+9AKK8eT5IyK5c=;
  b=Pe1N58hrkNIv10t3OwZRr9QNQNzTLuzaYgVedmNGmN3Loax5VequC+WB
   vBwsHZ9SxCt4zCvhG6WmUJ7+NMpLs9bhaePtAOdSGzy2clCMkxElDlDoH
   PyEvH5GVOu8a/eUqLkEMC+yJz6lJ7R+vsBtrF+J3CCYme9ar2WdmBfPBm
   or/xY+YsVcLjlF6Qptqp6parpeUGCP+Os0jl5bFyhNOrc7YDmHjgF8F3n
   sXGkrGbCimIuIhiGD9JK3YNYLqrPG3t2SyAQNgCPm7HIGsbj55gByroFj
   I5qfLTtJFPIuau6q9HAX/XLR+a3VwU/I2I6ru01yjGrZfB/hwyHKeKYik
   w==;
X-CSE-ConnectionGUID: VLTRN6e9SweqFXcToe+pSg==
X-CSE-MsgGUID: o76VEjCSTdSKA6wEfxqXxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="67159555"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="67159555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:08:02 -0700
X-CSE-ConnectionGUID: J+0zYREwQDiqny65CW1kog==
X-CSE-MsgGUID: rwCGXI9HRHiELv0zwrvt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130720345"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 00:08:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 894A81B4; Mon, 31 Mar 2025 10:07:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ALSA/hda: intel-sdw-acpi: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:07:58 +0300
Message-ID: <20250331070758.3986134-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Note, that fwnode API for drivers is provided in property.h
which is included here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 49d3e0e30073..8686adaf4531 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -11,8 +11,8 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/fwnode.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/soundwire/sdw_intel.h>
 #include <linux/string.h>
 
-- 
2.47.2

