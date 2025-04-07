Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DA922B5B8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069253; cv=none; b=So40oY5qDnfvQbQsIO933W6SWUO9/y6rAeKwRN27yEjETZoY+AzDSSx6DfWhXtCm4/ZGoLZChLV5GN5d8WWcNF3eZ52Q4oehxF9PS/s3AjoYh63LFrnqUiADzb+2SjpSu7cAGTJoKNLr6w/ZYOEtOo8TLbwtlobr2c1AHrvjOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069253; c=relaxed/simple;
	bh=ZcpL39/pJu+djv6xLTCjvr5JuzZQWBqesTDoiIZdfxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlNeuepO9RMoHiTjxsAwdsAfR/XMzttxdZYaAOMCNN2CUT93hkKI7MonoN4Oa4yUXZM/Se4ueUlzQYZRc4S+baRAWww+LGi4PpVh3CINqAkcOv7M6CFqB6ivzZ0wV0XgqPLOsYI/eqhMvCNh14rzrNyBxqPrQZxUf5qa+PE8oKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMD94Sod; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMD94Sod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069252; x=1775605252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZcpL39/pJu+djv6xLTCjvr5JuzZQWBqesTDoiIZdfxo=;
  b=eMD94SodNU9akduUz+vTIoNE72cXH+lgtDf12jlXZn+JxYGl8QXFG+gm
   W2/TWBSJ+xFkb8pO5PPCpBjpC+n0JcFajYxeTd/nRJbE0bCxu6D685RYo
   2IIGehFE0mJe+lWI1h0rUZQuJVAAkKsJ+5PTPhxiDYCQXr30+6Ig1mTkO
   rS5Yrg/NbmIVXjC80wKdmHRv+Z6qezA2ay48OPUmEmXazEEUXY4ODZBU0
   i+u1plDFQ8ILasuaP1jviHWZLdZReueyaCtIt15P3AUMUpw0r061vBNt/
   hBwV9XCoF4vAFzFj17e50m+nrkWXvoUbBtuce+KPAseHfkxd2WdD7vtyQ
   g==;
X-CSE-ConnectionGUID: MzTgDdrTQ/yux1E0ACtBdw==
X-CSE-MsgGUID: oTgEmLqOTUKmFOUeNcFBVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193170"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:48 -0700
X-CSE-ConnectionGUID: 1O/BrV3AQ5eSgi+aq84kfA==
X-CSE-MsgGUID: +FOU/zA1SvWWFsSmOql6MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315469"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:48 -0700
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
Subject: [PATCH v3 08/26] x86/resctrl: Refactor domain_remove_cpu_mon() ready for new domain types
Date: Mon,  7 Apr 2025 16:40:10 -0700
Message-ID: <20250407234032.241215-9-tony.luck@intel.com>
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

Different types of domains require different actions when the last
CPU in the domain is removed.

Refactor to make it easy to add new actions for new types of domains.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 703423b0be0e..7080447028b0 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -644,17 +644,19 @@ static void domain_remove_cpu_mon(int cpu, struct rdt_resource *r)
 	if (WARN_ON_ONCE(hdr->type != DOMTYPE(r->rid, DOMTYPE_MON)))
 		return;
 
-	d = container_of(hdr, struct rdt_mon_domain, hdr);
-	hw_dom = resctrl_to_arch_mon_dom(d);
+	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
+	if (!cpumask_empty(&hdr->cpu_mask))
+		return;
 
-	cpumask_clear_cpu(cpu, &d->hdr.cpu_mask);
-	if (cpumask_empty(&d->hdr.cpu_mask)) {
+	switch (r->rid) {
+	case RDT_RESOURCE_L3:
+		d = container_of(hdr, struct rdt_mon_domain, hdr);
+		hw_dom = resctrl_to_arch_mon_dom(d);
 		resctrl_offline_mon_domain(r, d);
 		list_del_rcu(&d->hdr.list);
 		synchronize_rcu();
 		mon_domain_free(hw_dom);
-
-		return;
+		break;
 	}
 }
 
-- 
2.48.1

