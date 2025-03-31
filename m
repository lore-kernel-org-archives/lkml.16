Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A586250;
	Mon, 31 Mar 2025 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404989; cv=none; b=Qlqes17NwdsYvZKJ79kF3fDvnrTeSQygNer5rxEPwqes3MeSC1fVueiJI4KY5oTL1eKDp6LADv7d9wMMjXDxD/Hd1dPYxpPgLWuQptF1STCO+zj+AUsCpaRyajZFP9/Cc/YoMKWyK/FGnvz4lyldTTHgZYLmoxi7CuUqTMtlSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404989; c=relaxed/simple;
	bh=V/xr9JnXhnEFQaW81bqb/CrB//it7T9MT6dVOFsc1ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hlqd15zYDuojN++/eL20jFl+/YOwLw7rKv6VAQv9eO9E7R840YBDU7pVeUWceEG9xBPo4znjz+OWoOwsVnd//IfundH/usafNc9Alsv8JV8eyZ9MEAv9lGC4mjwvBoxa+IoFeFIUwGTyz7ngN/+hHG9owFR+PNKrZIiG4ibzmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBhJxyMf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBhJxyMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404988; x=1774940988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V/xr9JnXhnEFQaW81bqb/CrB//it7T9MT6dVOFsc1ww=;
  b=QBhJxyMfJ/vMD93pLm5xKiqCOmdTziNSTMNOIZgY7XIMgQAKsZFUUN0C
   yhivZmWRQ76XfBRE0l1pR4xObCWqbe/q02VxGKON00yy22F87bqyA7w+q
   Z8jF6MyWPP9FjkWggeDhSJPmxX9kBrRtgdvDHebPzYtFCJAIp9HfOC6vN
   kxXOi3QgApthXMLI91KRpf9+LnWtyonZvEa5lz6s37NFVV1s5FAaUk/CB
   T0tAgvKqVoDRdoJ5YHsya5SPYGpOw6LwpFQmnXBHwXzZClsumxweB9Mwj
   3yMS25IAsKg4JU0dPsIDIvT29zX1KawRE7mdUoc3/D7Q0HcplYp7UvAX5
   A==;
X-CSE-ConnectionGUID: ubYWtdWKR0KaKV9D9FXlWQ==
X-CSE-MsgGUID: WhRwVaWVTbeasX4fLmM+uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44811992"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44811992"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:09:48 -0700
X-CSE-ConnectionGUID: IcMJpa+pRJmSAkVfp2syuQ==
X-CSE-MsgGUID: C1mUow/+SgSroeE4PZYzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125996388"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2025 00:09:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6D7171B4; Mon, 31 Mar 2025 10:09:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: amd: acp: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:09:43 +0300
Message-ID: <20250331070943.3986387-1-andriy.shevchenko@linux.intel.com>
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
 sound/soc/amd/acp/amd-sdw-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/amd-sdw-acpi.c b/sound/soc/amd/acp/amd-sdw-acpi.c
index 238b584887ee..0160b0df26a0 100644
--- a/sound/soc/amd/acp/amd-sdw-acpi.c
+++ b/sound/soc/amd/acp/amd-sdw-acpi.c
@@ -17,8 +17,8 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/fwnode.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/soundwire/sdw_amd.h>
 #include <linux/string.h>
 
-- 
2.47.2

