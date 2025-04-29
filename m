Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03C214A90
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886870; cv=none; b=n2yKxipI7wxwZwNRPf1uZA0x4/mwVhYGz7ihAE9G0mvpbZVSBJ7uzwbL3vW69GraxWWQbyW9FYcgdq3M97DmkiLgECT7kttNA2ZFi+08GidhwcHq8HAGs/Qm3PfgW3oK/dJenJ13GFCEyNCOQibBa6KdPvf7WjwRVCa60k3rfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886870; c=relaxed/simple;
	bh=rmmM2/1ELIlDH8mRrn9+En13+yPbD0Vwms0V/5K0CoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRTsdw8hVFKGPz5X6ZInePpZGxjVNzcYxVKcuY+omDZBqcy4ka/mztE1WZuqwQS/z/VcQDQmuRXwaNWiVuUFe5U1tHHV3Z0CishRKUduRB8dLyZnd/sU7gNvo0wmJ4IR3HZMEh6uaSTdnBP4bcO7geE7uiSbcYRNQODvl8SaACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fls6gmok; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fls6gmok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745886868; x=1777422868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmmM2/1ELIlDH8mRrn9+En13+yPbD0Vwms0V/5K0CoM=;
  b=fls6gmokv4WDSbLI8fk59E+yOpAXTOtB4eSmQXa1M1d+CsNU7Qw2ULUN
   OvrjTEed3zfiCYUrmyGSZxNE9+bYJmCLWdIAJ/OLzoy8UzcRnuiSju3Wy
   Q9WtLl3UKYq8BfCzGIQG5OPPktfK9m88VAswdGdqFAn4xeKlAD2848ldz
   yuNIG4RI8m3exvieJEnzckjOFez7aPa7kuJK3L8yibFCRG47s9Rcu4VIH
   WnoLuiK3zAvhsXyLeYsOAgzVcAYo9XASW0gCh8Pm9GwitTRwTO1Ji/+0K
   cuowNe086UBMRN507dtv5GFG1DjHqTduBxuM69TvQugHMYdjrL6yff5fX
   w==;
X-CSE-ConnectionGUID: z+uUPW1fTLaFnTJHqpRMcg==
X-CSE-MsgGUID: Oj/FCC9OT32dt2cKfWFKpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58148266"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="58148266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:21 -0700
X-CSE-ConnectionGUID: KmXTL6uSSHWQ1l1tmdxnaA==
X-CSE-MsgGUID: 45MHkHiHTT+uBvpYlgDLoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133394060"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 17:34:21 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v4 24/31] fs/resctrl: Add type define for PERF_PKG files
Date: Mon, 28 Apr 2025 17:33:50 -0700
Message-ID: <20250429003359.375508-25-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429003359.375508-1-tony.luck@intel.com>
References: <20250429003359.375508-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creation of the default info file for monitor resources requires
an RFTYPE_RES_ define and for fflags_from_resource() to map from
the RDT_RESOURCE_PERF_PKG resource to the RFTYPE_RES_PERF_PKG value.

Add the define and case in fflags_from_resource().

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 fs/resctrl/internal.h | 2 ++
 fs/resctrl/rdtgroup.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index aaa74a17257d..623a9fadc18a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -250,6 +250,8 @@ struct rdtgroup {
 
 #define RFTYPE_DEBUG			BIT(10)
 
+#define RFTYPE_RES_PERF_PKG		BIT(11)
+
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5e0d1777f162..544fa721e067 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2191,6 +2191,8 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	case RDT_RESOURCE_MBA:
 	case RDT_RESOURCE_SMBA:
 		return RFTYPE_RES_MB;
+	case RDT_RESOURCE_PERF_PKG:
+		return RFTYPE_RES_PERF_PKG;
 	}
 
 	return WARN_ON_ONCE(1);
-- 
2.48.1

