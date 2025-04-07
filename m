Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6023BFA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069263; cv=none; b=HRsVgMcvhdRyPhLD6X2Amm744ZUWPh4dn4j2S3HnxxZX11yMCgpkhJObfsqshZrMN1npy9X9H3onw4kNfKdQhZ8n67E7VJuloSTOxRUpKPHxk7ANpjcNOIi33kZE5d2YaN2n8+ETaAdAtUfUp+7SnNXXFmsySbTLtWD4tmMAKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069263; c=relaxed/simple;
	bh=sJ8ho4sQaoe/V4caQsu5Rg0O+TjhTAyA8IQqtw/iH0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udtowpyiK6evk1cynaVaW+6PuPy81afa7+vh2T0qcHZVZ2MS8cdimOaFDLsp4Fe/UD/XpLiuFhcY1dCGQIrzrYRpl8GIJWm1hAsKx+tK/E1ZVSv8YaXX12281XdIlWM1rJ1l7czmatJSrr3zniIO2GU4BYGcCBhda/PRLYAAdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTyFMkBt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTyFMkBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069262; x=1775605262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sJ8ho4sQaoe/V4caQsu5Rg0O+TjhTAyA8IQqtw/iH0U=;
  b=RTyFMkBteym/QEhHaj5IiFYdYqXQWOxbtg0lmBva5qUpnHlj7BWXfqOB
   KcUL7KT1sgzeWv5tNLHjnyqOO1J4yBHlo617gN3qqaI2wMu6K5+/Ncr4X
   ED9H7tAG9hqBAPXTaQacfgE/PZ5dp422QnVOnO+a42am4odbbF21q+JXC
   CPhazd0liJ1xPdG40UVD4Kj3HsQlOKrBaClzUj1+qtRC4KpXayNcrdegm
   NHJkB7Wpo6ceOji4OJicYgXgPHGEqZ6UsPomgnR/1lfNZeH17kaROv4d8
   uIamCTHckx5QCZFYj0JZ3h2BfQegd1TsIEE5Cj2CGa9TQImI2ZM/IYJSW
   w==;
X-CSE-ConnectionGUID: 4AOBx8itSX+pHpxiVr0J2g==
X-CSE-MsgGUID: KBkkquYaTRWPQlVNHP5Xcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193277"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193277"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:56 -0700
X-CSE-ConnectionGUID: JNpsx4/FS8Gcy2CVvtLVAQ==
X-CSE-MsgGUID: jAKkrK7HRy+j1Nr2T3NT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315518"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:56 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v3 22/26] fs/resctrl: Add type define for PERF_PKG files
Date: Mon,  7 Apr 2025 16:40:24 -0700
Message-ID: <20250407234032.241215-23-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407234032.241215-1-tony.luck@intel.com>
References: <20250407234032.241215-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creation of the default info file for monitor resources requires
an RFTYPE_RES_ define and mapping from the resource id.

Add the define and case in fflags_from_resource().

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 fs/resctrl/internal.h | 2 ++
 fs/resctrl/rdtgroup.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4a840e683e96..b7bc820da726 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -253,6 +253,8 @@ struct rdtgroup {
 
 #define RFTYPE_DEBUG			BIT(10)
 
+#define RFTYPE_RES_PERF_PKG		BIT(11)
+
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 34fcd20f8dd7..cae68e8b9f86 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2175,6 +2175,8 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	case RDT_RESOURCE_MBA:
 	case RDT_RESOURCE_SMBA:
 		return RFTYPE_RES_MB;
+	case RDT_RESOURCE_PERF_PKG:
+		return RFTYPE_RES_PERF_PKG;
 	}
 
 	return WARN_ON_ONCE(1);
-- 
2.48.1

