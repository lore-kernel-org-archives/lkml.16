Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C9230BD9;
	Thu,  8 May 2025 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745379; cv=none; b=IptGYMfeMbKzSlAsdPPTZdYZgJejo0jTKgL61XTE5rA692pUgnK0r8x+sYqmmVrtruxHum4oquL8fzP3uZn/9+3od1/x9fepRK4MR+BzkB2iNpUB3KxJRHHlIuQpcDP5OqrMmDHKhGUrIQ5xL/R7I97lQhSVN9sgJcRZnbHSSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745379; c=relaxed/simple;
	bh=0LewRqX/PJo7QMm4ckzta/aZaj92bTJPV6ejYkp+qf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSm/K3U+QfYZOlPBA3GFZ9pWPkjn/mRrNXrDsEb2FQfA3oOzxm7vlBb6g2Ijl8sWMzdGSf5uk0oSktve2okCjjFjwbamo1BdKFVX9nCfhzYwd5ouSduTjvM3Mf0jdMtoh9gwz+HfSO2THtvFh93ROK1k/wOt/wNedCP2JNxogvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaLkK3Pd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaLkK3Pd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745379; x=1778281379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0LewRqX/PJo7QMm4ckzta/aZaj92bTJPV6ejYkp+qf4=;
  b=KaLkK3PdE+MvVJJqNiGvCXYPbHwpQmb2CJhR4r+m8Zf1SBzWBz9aM1bz
   rROfpo8TSb3/RjW8vq7elrWMfrCKJKwYLnT0umJEEMGz4/pJ05Pp1UPrh
   QPFsIL2VLHC0NsXPaPPQsAZT+mwC0uJQC5lWQGGmROgMmt42lto7CWAo2
   kz+Uutt2MiS5LInSs55ajhwIJjZqvUHdSOr7yW1oFqBJmYJUPqAxCLgsz
   3ClBf7e3Dko/SJ8fgzanyoxpSgvlVSlFW4JTEyzzSKU6Th28jnL/dQnAC
   66PZlqFrBlW141PK27VkbLHl3sCwJxznw4xeyESLTze6wYs4Rx7ALvQHX
   g==;
X-CSE-ConnectionGUID: w3FKJealT+KLWeX5EQNZHg==
X-CSE-MsgGUID: XP8JFaNsQZetPgfFKLWzBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552603"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: 1f8XwX45QDiIaMMQzfGDGA==
X-CSE-MsgGUID: mWNAqzexQkaT8vjhtoTZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931261"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:54 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 5/5] Documentation: admin-guide: pm: Add documentation for die_id
Date: Thu,  8 May 2025 16:02:42 -0700
Message-ID: <20250508230250.1186619-6-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation to describe die_id attribute.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v3:
Remove spaces before "when" and replace with tab.
v2:
Change "attributes" to "attribute"

 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 84608dad84bd..d367ba4d744a 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -91,6 +91,11 @@ Attributes in each directory:
 ``domain_id``
 	This attribute is used to get the power domain id of this instance.
 
+``die_id``
+	This attribute is used to get the Linux die id of this instance.
+	This attribute is only present for domains with core agents and
+	when the CPUID leaf 0x1f presents die ID.
+
 ``fabric_cluster_id``
 	This attribute is used to get the fabric cluster id of this instance.
 
-- 
2.49.0

