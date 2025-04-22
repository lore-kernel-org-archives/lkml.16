Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8625CC6F;
	Tue, 22 Apr 2025 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357690; cv=none; b=MPswodLjk2cln8zXC+FpC8TgcyWDGn7i9zMjSPGTvPf+cGxNBzS7/Qg5nmcNPZ1WJwz8Mwraj4wqyVp8aZX1ww5hlStcKlJKwQyhgmi1ns4MsJHTAzBkRVO8Q1MNflNpCrfEcsN0sA7vfHFVLWlpfybJt25u9nMLzGCuZws2/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357690; c=relaxed/simple;
	bh=AnkJrFBkkfn9XNqrAtm49YgyvIfq2PfUAJSZ0+GDhz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlB6RfzkTS9r3UBkdVfoFl9EBQl+h7z/0+viptD0iMHIkzSBRp1Nua+Ks1cTLuHhVfUL6oBzSyB3XEWa2u3HheUhI9OuqnUt+5/7BhgrmclwgayTvQpB73+iQ4jdjAKq/OrvO1Wv1SHWbYfiOrzEoAkxtT2SaIl2rp2P3F1LDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrVBUXJx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrVBUXJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745357689; x=1776893689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AnkJrFBkkfn9XNqrAtm49YgyvIfq2PfUAJSZ0+GDhz8=;
  b=OrVBUXJxzamhAqQCbJkL2e/MB8PNtnlsoR4v0472B1fVBYAnWfWyTjR3
   qhQpCi9jMF6L1Kh4rAr0N4l8iGtTRHvHK2s1vsbsPnlx/X5updkI/gfPo
   zeE9j2M+vuUAGQcTqPKRx1vg0ElYXAkm6q+yScGkupsku0p4DX86W2XAD
   cFO2f5z/KpNDU0jsLUWTle73EE7wNmnpyCGAYuNk0YblaFEeBEtBxNB2e
   2mUqcINE49tiZ18/Dxx43U4US1RIRJb6/EviMmFm9cGPuLNQe7wwExFvj
   TiajhvdEdA+OpNuJaU1L/df1XoPB4IcdBKhOX6x1lVB6hJahzZbvxknlz
   Q==;
X-CSE-ConnectionGUID: RxoS5UWbQ/S78PYxFO1Q0Q==
X-CSE-MsgGUID: NxUn6MLOSRqMfGyVh/VyOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46053988"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46053988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 14:34:44 -0700
X-CSE-ConnectionGUID: Gc/RJ4qAQuGtjgbGHuXTCw==
X-CSE-MsgGUID: 1bokvClbSseNVe0Mtk/iGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="133070684"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 14:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/5] Documentation: admin-guide: pm: Add documentation for agent_types
Date: Tue, 22 Apr 2025 14:34:24 -0700
Message-ID: <20250422213427.1943328-3-srinivas.pandruvada@linux.intel.com>
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

Add documentation to describe agent_types attribute.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 5151ec312dc0..84608dad84bd 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -97,6 +97,11 @@ Attributes in each directory:
 ``package_id``
 	This attribute is used to get the package id of this instance.
 
+``agent_types``
+	This attribute displays all the hardware agents present within the
+	domain. Each agent has the capability to control one or more hardware
+	subsystems, which include: core, cache, memory, and I/O.
+
 The other attributes are same as presented at package_*_die_* level.
 
 In most of current use cases, the "max_freq_khz" and "min_freq_khz"
-- 
2.48.1

