Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B222D786
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069256; cv=none; b=D+b5esFW2l6Nq8iSwIBAs1xMdLz2XGh4eCRsihA7mcaHEvw5VIzy2kyyGPeWs9ycM4/QjXSckTBZIra+wrT4rVePL7lXrJv5uRPGTdSmtVQuH05YqIZTB2V2TaafA2AtTOViH2uCJaS+5liI/MJ9nA/QX8TSXDAnuKyTJ+Jn+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069256; c=relaxed/simple;
	bh=VfHjgFdJazMMHE4237qTcYtk4/5M6s7Jls2ygjhzuhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3QvuGunMweHw5skpikYv8Ghxeh3XbDEtLkKeGwqLdx5MlrTlsj/y6JC7GIjSpoyomogilqH8nmFJBqg5GDj4gEYYrCg3OJYWvTW8z2qJ2ZXWawiupFv6zDXqx95x1UH/Rr4Z5heevoSqGNeqfE2sA9Vt9JvItf5kyXEtApcu3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD5fsmcI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD5fsmcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069255; x=1775605255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VfHjgFdJazMMHE4237qTcYtk4/5M6s7Jls2ygjhzuhE=;
  b=YD5fsmcI1JimB4dX9phiXQ3tC8tscIxHNc9KgjSzD4AWzv6WunroZbgV
   mttNhjoUNmjJi93iQ4567gclo20X+FFuOWRB5hQtAEz95Rw24Wuq3OnSj
   G5KqP8FmP9PLyuIl+Z7QKy+nbk4GnZpji2mKFi2JxdLpA27bIcWc6z4Td
   aYrYIMdPkc6sDOgf2LeJAsGG5xrCTRFMJMxfdlri5Xj+LbGOYBitUvhal
   pHPZ9f9g8XokyjQYxPixkDKgCzE/k4Drs0RrQu6c4qTN8m0Lt+LeHfpRO
   /NlZUq/P24+YQu0bLab9gbSBZgLdjVJjt8b7mIPrV8oYDiLHBaOWRaNTe
   Q==;
X-CSE-ConnectionGUID: lVYzGzxvRkaO7iQ5jKh83Q==
X-CSE-MsgGUID: VkdM+GzHSw+gLQor+JHECQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193201"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:51 -0700
X-CSE-ConnectionGUID: 6t46yy/eQMyJZyQ/RpVa7g==
X-CSE-MsgGUID: ar7dh7HIRLOECgKO229nEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315483"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:50 -0700
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
Subject: [PATCH v3 12/26] fs/resctrl: Add hook for architecture code to set monitor event attributes
Date: Mon,  7 Apr 2025 16:40:14 -0700
Message-ID: <20250407234032.241215-13-tony.luck@intel.com>
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

Architecture code knows whether an event can be read from any CPU, or
from a CPU on a specific domain. It also knows what format to use
when printing each event value.

Add a hook to set mon_event.any_cpu and mon_event.type.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h |  3 +++
 fs/resctrl/monitor.c    | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 0fce626605b9..8ac77b738de5 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -418,6 +418,9 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 void resctrl_online_cpu(unsigned int cpu);
 void resctrl_offline_cpu(unsigned int cpu);
 
+int resctrl_set_event_attributes(enum resctrl_event_id evt,
+				 enum resctrl_event_type type, bool any_cpu);
+
 /**
  * resctrl_arch_rmid_read() - Read the eventid counter corresponding to rmid
  *			      for this resource and domain.
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1efad57d1d85..5846a13c631a 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -863,6 +863,18 @@ static struct mon_evt all_events[QOS_NUM_EVENTS] = {
 	},
 };
 
+int resctrl_set_event_attributes(enum resctrl_event_id evt,
+				 enum resctrl_event_type type, bool any_cpu)
+{
+	if (evt >= QOS_NUM_EVENTS)
+		return -ENOENT;
+
+	all_events[evt].type = type;
+	all_events[evt].any_cpu = any_cpu;
+
+	return 0;
+}
+
 int rdt_lookup_evtid_by_name(char *name)
 {
 	int evt;
-- 
2.48.1

