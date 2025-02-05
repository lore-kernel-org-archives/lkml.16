Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E301DAC81
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738789561; cv=none; b=uOe5Xbds4Mxy+cxqLPvq5M4lZRLezj0cNYFzMcl8iyuL/L5ugpcFPFgBGLYJt7134zP4QqMpjUO09EW0tEKnMvrmm1auYN2ir/4iJD7+7T1Qt9/MFliB57ivX6Tw5h1wW3qyPJvkoJ/Ba4GhUozS4Q8CjZiFKpJokPzejcs/Arc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738789561; c=relaxed/simple;
	bh=R+J5+tB55YPKvnlpGRU//KK+e/Ej0H9uNXx6KS+09JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZfk2AEjgGsIWF5bhiZvZ8ibi80VsiDT/g3z4fwVnhnwcSWvG8pMDDH17eIY+Y+Ll+EUwPaTCwOEP1UeEtxeulFD0aJ2QJcWphQN0cftC5gs5qeZry2UtuiUHJTWIianPTRAUOVbI4/mPutTZJqjlc2x+lttmwLhcflmJTZc0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAE2hTQl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAE2hTQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738789560; x=1770325560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R+J5+tB55YPKvnlpGRU//KK+e/Ej0H9uNXx6KS+09JM=;
  b=AAE2hTQlZYcANT2tbLzT59zWh5wW+PysmL3zeDkbWNKje57wsA8w88KE
   nliYWbMXuI0y4jPn7ncgS1jSc051fWpTvizKBV6/tFNwIaMpLY9ulwzJD
   8ARhmtRn10D7ThrClEkmUEOQsQINpB5A2uEcZFL9k1DrJI4FTw0Cl+URI
   oJGtRWJMFFgpq+PpArpDtyoLwGscG9h6waMI+yTH2p+JhrAncv4stV9II
   xx9IqNhagakrFUBBB1S+m4AAbZi9u0RFjrjueBrx+misVs5LY9PhMM4z6
   XI1arcGdaOaaOOlNKK4jtTG+ZDLhBjv3Oq45BzZsyJjvPetynJNWdJNfx
   g==;
X-CSE-ConnectionGUID: Mr+oL5viSZGi4qJ6HtwArA==
X-CSE-MsgGUID: IxWJI6WRSYSlRSupSzaIEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39402539"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39402539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 13:05:59 -0800
X-CSE-ConnectionGUID: kwWNlG1TRni50liK1M87mg==
X-CSE-MsgGUID: 9NzHte6HSBiY5LJAQDifmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110864786"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 13:05:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drivers: base: component: Allow more space for device name
Date: Wed,  5 Feb 2025 12:58:52 -0800
Message-ID: <20250205205851.2355820-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some drivers use <BDF>-<UUID> as the aggregate device name which uses
more than 20 chars, causing the status not to be aligned correctly.
Example for mei_gsc_proxy on LNL:

Before:
	aggregate_device name                                  status
	-------------------------------------------------------------
	0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464                bound

After:
	aggregate_device name                                            status
	-----------------------------------------------------------------------
	0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464                 bound

Give it 10 more chars for proper alignment.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/component.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 741497324d78a..747c5542c70fa 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -87,17 +87,17 @@ static int component_devices_show(struct seq_file *s, void *data)
 	size_t i;
 
 	mutex_lock(&component_mutex);
-	seq_printf(s, "%-40s %20s\n", "aggregate_device name", "status");
-	seq_puts(s, "-------------------------------------------------------------\n");
-	seq_printf(s, "%-40s %20s\n\n",
+	seq_printf(s, "%-50s %20s\n", "aggregate_device name", "status");
+	seq_puts(s, "-----------------------------------------------------------------------\n");
+	seq_printf(s, "%-50s %20s\n\n",
 		   dev_name(m->parent), m->bound ? "bound" : "not bound");
 
-	seq_printf(s, "%-40s %20s\n", "device name", "status");
-	seq_puts(s, "-------------------------------------------------------------\n");
+	seq_printf(s, "%-50s %20s\n", "device name", "status");
+	seq_puts(s, "-----------------------------------------------------------------------\n");
 	for (i = 0; i < match->num; i++) {
 		struct component *component = match->compare[i].component;
 
-		seq_printf(s, "%-40s %20s\n",
+		seq_printf(s, "%-50s %20s\n",
 			   component ? dev_name(component->dev) : "(unknown)",
 			   component ? (component->bound ? "bound" : "not bound") : "not registered");
 	}
-- 
2.48.1

