Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906D1DF75B;
	Tue, 17 Jun 2025 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202963; cv=none; b=V456RbmtYK7M7UGhH/ibBSzQWbUdSzahXH1yKuNHqQSmk3QGdS3blXnAnTYBiJdbI8jEulZd5Mrua45/ClUhWvKhnKyok3CWYDQWYPECyh1HnZ9VaN6bIDUPcro7foIR7iirNpuS16U11l6bq66XDhKzX8N2qer1aZAtZtVv060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202963; c=relaxed/simple;
	bh=vHIOJ3pYnf0kGz/veR/TaTT7eamc5Fqd1ge3/r9H95E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAvq0CvEnqkFb+rVspFRTguI5M4hu1ay6FIckkT2QCwFItJVqNK8g9KEuxMwChEgxOuNJnAVf/Lqi0cNNcMIsa3WeReFLt88UY3AXKpM4YdSVbL3mr+jEmaGW485xEv1eFPX+dkkVqQ2e/3TClyaT+YN2pRjmVM4QCwSc363c0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlSqDrsB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlSqDrsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750202962; x=1781738962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vHIOJ3pYnf0kGz/veR/TaTT7eamc5Fqd1ge3/r9H95E=;
  b=OlSqDrsBTtjy7coWE+YdqnMkft7dm1h9MWyYwzkXeh+9dVvP9IIsF/oy
   u/nMx9Cppzq2chHk8IVByc4WTd3PGNHvGKQeiqBArzUaUGu7Xx0W5s+Ba
   M/PzE+5YJN5p9t6dB5WwdzY+VOx1LXrTfiyspQ3XmUaeEfIUKGSjtJw1t
   /gXlrxqHvPEkmBT6HrRwRDEJYMGj4Qi2lPkdmwJ05wV+W+YVpK+wRbSsb
   kQwyrOB7E3sqObBICGf+zStlkF6ixjy9OETQh2s4j5JBKiqK8uX6+jW2z
   7YbEgK0r85uGze6n5RMlPlN+sIFfhzeFwW6Wj2TDwa2Ilb9NaLmCDx2D0
   A==;
X-CSE-ConnectionGUID: CP9qzXqkTguUxul96g0zdA==
X-CSE-MsgGUID: PBmzVFqZQ4+XIXazZ206Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52542602"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52542602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 16:29:20 -0700
X-CSE-ConnectionGUID: QdM+Fmg+RIeGfLvAs7h8AQ==
X-CSE-MsgGUID: Oahb12JiSNeQ7YoZp6/TdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149535458"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 16:29:20 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] Platform/x86/intel/hid: Add Wildcat Lake support
Date: Tue, 17 Jun 2025 16:29:13 -0700
Message-ID: <20250617232913.3314765-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ACPI ID for Wildcat Lake.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/hid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 0b5e43444ed6..f25a427cccda 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -54,6 +54,7 @@ static const struct acpi_device_id intel_hid_ids[] = {
 	{ "INTC107B" },
 	{ "INTC10CB" },
 	{ "INTC10CC" },
+	{ "INTC10F1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
-- 
2.49.0

