Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43FE2D0270;
	Tue, 22 Apr 2025 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357692; cv=none; b=RJgLRZfzeT2j9kF3TJJYnD3vKUMh42caVyaLyPPGGwyBgS4SG/id7Cl6mKzYU4h8OklHbzuOi/lhaQKr7xl5S3Krk+QSsnigGS4p7JDcMFTYvC883oQgU/j7LjUPJgngWe3grZyVKBH7FBXRDq+NMWTWiNkvqgz5HNlXik/pCJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357692; c=relaxed/simple;
	bh=R6FrB2qp+1Ei30aaidxlel0iYIgtEEa1jY/++eIlYFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBsWh5o3v0SRQa2OGfWMDWW+knlFPis656DqgK69m9jRNJDoCzABv6bjgWwSmLy5CnnUUR7l87yGdCrzeTzrfYsb4yIpvRkFZmMVxjOJbEWf4HY0i7kDWorLwPt2/rqjfTqDq43aOpFuK3u6qotCoVVBy9lO10LPTJCFP4oJXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCSGszV5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCSGszV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745357690; x=1776893690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6FrB2qp+1Ei30aaidxlel0iYIgtEEa1jY/++eIlYFU=;
  b=JCSGszV5GRHBCj4g0wbKYt41S7NPOJp5Lkqzn1VmjuOQr4VaMWJekqwz
   BORnHVMObFcjTXTy17Vyb6+K+QqvMbbf7j60dQ8YWg1AUaWGxlTD7z9//
   RqXOmcfr8v3/fun9nxQB6X8Lb8HHk1s25cESROmcvehQxQkjhruO+U2Zb
   0OW+Pgg/gvsmQCWp55Lebn62frlr6oIb8HdmxYqjQDcIYjGYjpuGCqkyi
   53jqwFbeCfTGq5dxfqHA4m5oFvXTaz0ZE0sdmDU8SHaOdWKHx+SNKKgrQ
   f7K+K/B6IscsPCdLheN4t34M+jnIvRCN27QdfRka3hdi0/hP0mr19TPbO
   Q==;
X-CSE-ConnectionGUID: ZYFAP8CaTF+jihCeI1RXLQ==
X-CSE-MsgGUID: 7eTpE/NrRF6X+zvkFqK/tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46053993"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46053993"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 14:34:44 -0700
X-CSE-ConnectionGUID: x9tepe3xQ06Dm5U13/zE9g==
X-CSE-MsgGUID: ELCZjOfFShGFxyA9z+7Hhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="133070687"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 14:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 5/5] Documentation: admin-guide: pm: Add documentation for die_id
Date: Tue, 22 Apr 2025 14:34:27 -0700
Message-ID: <20250422213427.1943328-6-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
References: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
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
 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 84608dad84bd..689aca8bf9e1 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -91,6 +91,11 @@ Attributes in each directory:
 ``domain_id``
 	This attribute is used to get the power domain id of this instance.
 
+``die_id``
+	This attribute is used to get the Linux die id of this instance.
+	This attributes is only present for domains with core agents and
+        when the CPUID leaf 0x1f presents die ID.
+
 ``fabric_cluster_id``
 	This attribute is used to get the fabric cluster id of this instance.
 
-- 
2.48.1

