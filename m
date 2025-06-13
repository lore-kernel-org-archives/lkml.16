Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E82E1743
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800316; cv=none; b=K3M/y+6TAMfKF2ic9Ztq+i7AITzFEFtjELgvxe/0SfjNlBPf7QPbJ3/kouXsAG9smR8SqroFrYJpcU6fpTUxz5UKm7EB2yPqKXegbreaKTkEqzhZyokQM4it90ezJ9ToE1Wc+70eZnuc+dVGk2OlDobkNyE/R202Tr5NGI9WUss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800316; c=relaxed/simple;
	bh=6HqDFnBo7ijranK3V4U3MjjxmMiZ6DlCz2pS276dmwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1nJDZkhnDZaY1edFQHRdYbsR91is5DYbKqclJSwsRAhW5DEwY9eP6lUzH50C6IKuYJfyaZJYTpX6mjsy5lU/lKqoNG4c/LwEz/0JcTpZ9z2oYlhBy+rXjlAXlFHJY4ux/i+7LCoq2pYT0B8IeTJvDdbTCbeQB9E8weJ2cqPXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=L7cOZvYd; arc=none smtp.client-ip=68.232.139.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="L7cOZvYd"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749800314; x=1781336314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6HqDFnBo7ijranK3V4U3MjjxmMiZ6DlCz2pS276dmwQ=;
  b=L7cOZvYdnmUb5fHrPkuAM0SL14xekCwhys+pWIlT+vMYZRl1qEgIB1Qh
   8ZTGXnMcZoqjNfsBGygSc7bc/X9tuLqDqJPy5iH/dS9yCKXfwTnv4wnHZ
   fAhy1jF/3F1AZYbBV3kSnGNeONttg6ekFMLKYw/cWdWdGFN1EDXxghbUl
   TpqED0Q64H4c6GnPKgK44lgq0Pad+Pkc7CUAfUha4gTlD1KPzaSLwjWml
   4rHoucP05dFyjVuITsHpQ1JyD0UMT8vRgv/yN5vcvc4DqXKbdqYb/lWe5
   iXnXEhd1/JQ04N9edfSHPEJ2/W4T0KIif6iIGxP9TkP1yxiP74/TIkatZ
   Q==;
X-CSE-ConnectionGUID: P5n+WB9xS9GnJ/Zg9/BVlA==
X-CSE-MsgGUID: h1z9DBoKT2Cn2M5obHXryg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="205729535"
X-IronPort-AV: E=Sophos;i="6.16,233,1744038000"; 
   d="scan'208";a="205729535"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:38:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CAC3AD4C24
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:38:23 +0900 (JST)
Received: from yto-om3.fujitsu.com (yto-om3.o.css.fujitsu.com [10.128.89.164])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 88EA2BF3C9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:38:23 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om3.fujitsu.com (Postfix) with ESMTP id 58A9C400585A4;
	Fri, 13 Jun 2025 16:38:22 +0900 (JST)
From: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Martin <dave.martin@arm.com>,
	fenghuay@nvidia.com,
	peternewman@google.com,
	Babu Moger <Babu.Moger@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	shameerali.kolothum.thodi@huawei.com,
	bobo.shaobowang@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	baolin.wang@linux.alibaba.com,
	lcherian@marvell.com,
	amitsinght@marvell.com,
	Ingo Molnar <mingo@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	H Peter Anvin <hpa@zytor.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	dfustini@baylibre.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] fs/resctrl: Optimize code in rdt_get_tree()
Date: Fri, 13 Jun 2025 16:37:31 +0900
Message-ID: <20250613073733.3642679-2-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
References: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

schemata_list_destroy() has to be called if schemata_list_create() fails.

rdt_get_tree() calls schemata_list_destroy() in two different ways: 
directly if schemata_list_create() itself fails and 
on the exit path via the out_schemata_free goto label.

Remove schemata_list_destroy() call on schemata_list_create() failure.
Use existing out_schemata_free goto label instead.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
---
 fs/resctrl/rdtgroup.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1beb124e25f6..592d4f69fce9 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2608,10 +2608,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		goto out_root;
 
 	ret = schemata_list_create();
-	if (ret) {
-		schemata_list_destroy();
-		goto out_ctx;
-	}
+	if (ret)
+		goto out_schemata_free;
 
 	ret = closid_init();
 	if (ret)
@@ -2683,7 +2681,6 @@ static int rdt_get_tree(struct fs_context *fc)
 	closid_exit();
 out_schemata_free:
 	schemata_list_destroy();
-out_ctx:
 	rdt_disable_ctx();
 out_root:
 	rdtgroup_destroy_root();
-- 
2.43.5

