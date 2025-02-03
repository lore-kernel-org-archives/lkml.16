Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF220B207
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601342; cv=none; b=qseNDQpDdgIXqf4NxbTXm+6vqHeVDg+b0OpR1/saN5+0R23KcAq28VUUpj2Hrx0EDsDc0XY82Sq8JicdBjlKoM/NvTXcHBNW6BXeEmcJeAlQPol3bvb/nDiro4dq3dx7kWn6l/NM6vTWAGhXIEsIX23jZ7Nj0DE06FicU9STgfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601342; c=relaxed/simple;
	bh=qNfyVTD5FNQhz+vss8BGSvAzAI5/N4dGWiHy/12Bzl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aucOAHLkG2OB4WJNg0lGdq7i10a37zmfgGEjL6JSMJJHGOFSqlDA38OHYNuzUxWgLV0H2TNR/acxLJEhkfciDmn1bJ2hp3lo9NXJPn4cnqzYNtuZm6VswhCfXNWxFZ6qqn2aVfXgAK7dErj67sE20mG//dqEKaijhdU4DfynblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jj6wlAAj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jj6wlAAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738601341; x=1770137341;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qNfyVTD5FNQhz+vss8BGSvAzAI5/N4dGWiHy/12Bzl4=;
  b=jj6wlAAj5QWdr/BQpUFvDJhW1C1irtIKfRuDl8Qrlm5iuHqXhxMgTZJR
   FZrt49JVGWkBMiHQvyk5aErQyJWPE0TcvxmEn4TNhi5FZN/UIt6aT08sj
   vivy7GqQk0K1mv2wyp0mqUYXL55/yqgHycCUL6cLB55ztg2w/4Ddcy93Z
   deQKMFMNc0OQ/jFL50DBjXyHIZmZLJ+upuWjcSC5BawmPovyIaBQsiAYd
   DGfvHgdZT36096AY2e5WT/RaxGR0wYT2CcQwmr6F71UrVLjAIu5Khpwtv
   LdVGIw0HjYbTNzqdNR39+eT9MDMxfUYs6/tdInb4w+UHSrlUZ3539oPkq
   Q==;
X-CSE-ConnectionGUID: kc+pVEelS2Kv1xxcb7wYCQ==
X-CSE-MsgGUID: nye1OjSjREW9cclekIO9hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43027211"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43027211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:48:59 -0800
X-CSE-ConnectionGUID: j2q9kL4XRuyLicKwQtYRfw==
X-CSE-MsgGUID: WALe8HFtTDSoMywUNMWq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110506489"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 08:48:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 441BA23F; Mon, 03 Feb 2025 18:48:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Date: Mon,  3 Feb 2025 18:48:55 +0200
Message-ID: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently introduced kthread_affine_preferred() has a bug that the value
of ret variable set but not used. This breaks the compilation with error
(assume default CONFIG_WERROR=y and `make W=1` to run the build):

kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]

Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/kthread.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 4005b13ebd7f..8ab625e996d2 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -889,10 +889,12 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
 
 	mutex_unlock(&kthreads_hotplug_lock);
+
+	ret = 0;
 out:
 	free_cpumask_var(affinity);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.43.0.rc1.1336.g36b5255a03ac

