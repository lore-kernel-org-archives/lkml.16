Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE628BA8A;
	Mon, 28 Apr 2025 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859818; cv=none; b=F5K1NJdh9SZdkHKiXAx/ceMLoDqT7rqeTnKcDenJqiwiBXKIkqF2h/q/ejRMBFGYl4xSco4dsFZHUXzsQ+vnDFWpwHkooYp8VXMo1BkSBum+woX58rQfVgivw6KzIjHDBOvqg0jeSoGQT4h6jN+DesMRWmDySDTXlG/YxSBODH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859818; c=relaxed/simple;
	bh=2/e/VimGzs+OtIXefihvL1cVdLXRILM/yf3YIU2tVf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyoqYGM80wBdA/cB/G1zzbFGI80sZoagf8WK9BrEisjUc1oRxMzdV4JbNxNKMXgY1KTLGk64pqNI1mrzGd1C3c6uE3Aws3eXwrVVd4VmvZtQhz07BzdiHjdMkPG4yj7gzyDSs+loPuKPYDLUyI+Ptzom0GD7L39OoZSQlkh4B28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9WI52s7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9WI52s7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859816; x=1777395816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/e/VimGzs+OtIXefihvL1cVdLXRILM/yf3YIU2tVf4=;
  b=A9WI52s7xbqhJhnKRKBIit3zEgVnW759y4qMTUqhrOz4RzkBQDhvbTYq
   vMJ8qrIed9wZrDfDnIQMDqJonmHhRXrshprb7Dk4covbrZd5TdbAr5JFF
   N3X9a46LTdi06pnkL8LQSZsNiZNqPMNa6yig1xKEOPe1zUzbBC72uzBmz
   JEeGaGehF1+PJCuZm5EWL4H4BOcpHFImMUvM0P8TcCwB6c9dtPxohY/vE
   1F5wq0INKvqMsEI0pTn/LyAQtvbO85U41kQOJdsq3MNXgSu26Jr/ykg3g
   Tfo6/ERMS4DZLJaJ7fm7w7KfokSNrvJ1bfmwrCD0WuSJpebYp1G0Ipg3h
   w==;
X-CSE-ConnectionGUID: Png3vfABQcyEqh62tSSQcg==
X-CSE-MsgGUID: pJcTTNYIQomDPEcisz43/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111447"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:27 -0700
X-CSE-ConnectionGUID: 05JysD2uTl+Hi9DSwSypEg==
X-CSE-MsgGUID: 74YSxxBeTK2YNxh4ddM0MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309603"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:26 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 5/5] Documentation: admin-guide: pm: Add documentation for die_id
Date: Mon, 28 Apr 2025 10:03:16 -0700
Message-ID: <20250428170316.231353-6-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
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
v2:
Change "attributes" to "attribute"

 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 84608dad84bd..d7ffda6a8095 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -91,6 +91,11 @@ Attributes in each directory:
 ``domain_id``
 	This attribute is used to get the power domain id of this instance.
 
+``die_id``
+	This attribute is used to get the Linux die id of this instance.
+	This attribute is only present for domains with core agents and
+        when the CPUID leaf 0x1f presents die ID.
+
 ``fabric_cluster_id``
 	This attribute is used to get the fabric cluster id of this instance.
 
-- 
2.48.1

