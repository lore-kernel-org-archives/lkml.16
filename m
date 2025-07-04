Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AD2BE7C0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615662; cv=none; b=L7f+mUPWzW/GLpU/avTEUZD28zOOmur+BP7CkpnM93Qokl2WPs/aSlyVmz+0L0k9X97E5OOMN8UlKwsDXMoUImsMZUo9lrl4V8Rs1HLLScTnJU1yQRz8Fd4NqgRYt3z5QwDtP1jxDocXYaOYFuIugtREpHwS8V1fRMBqeqw0KAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615662; c=relaxed/simple;
	bh=5Hx4Vms6Gxu/8rFa2Up0txUhrMnFHymKtoeJok1L+Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mY/ZBHuur5848IH9Bhjx/+bJIfj2lNPt+C5p/9Ucno/ApqI2iYA12YuIrnhO4f4p2LyaEnBN6gHoel2r064sWrhwy/MCy1A4s3LdrFC/p86+1lIfJyIlHPwzc6DLSDMNw5bbPS6+bIfH416sdtYpdpRAkrJe72ySkHJkpJ930Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=how2gwV7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="how2gwV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615660; x=1783151660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Hx4Vms6Gxu/8rFa2Up0txUhrMnFHymKtoeJok1L+Oo=;
  b=how2gwV706mcxIhlonzd/l3+DPyjm7ZK99/8k4hSpvj79ANqkv41mB8Y
   BbY3d6dDVC9J7kuHUSuJ4RV0YHTvf97EgRBaaW/ZITm1FO+3m0srXeeiT
   hMmLOxM0v26ocvFHnEV8gvwXqMIA3dUS164AkgAFQj4q/qa9dfuweT9ZV
   pTL9LfZTb+NWgSkEP9WqVf90LoA5tj27o6dvWO56c3eQzvxLcTHSFuLJh
   KIqniYgLG8vYFkaYfASi1BoMspRCgjv1u7k/dFVkLQCN6z5j+ezxBgYE/
   Ah4sJ0+X0zsMDutiqbR0pO0jjVTs1Ojn9x7vG0Nf7byZUIJIq37yBINd4
   g==;
X-CSE-ConnectionGUID: KMXHZs2GSwa+0l816VgG3g==
X-CSE-MsgGUID: LoRJooxIS6e99pgNDBVjzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494572"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494572"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:18 -0700
X-CSE-ConnectionGUID: 2mqtTLXUTq+bpmvXXnf6rQ==
X-CSE-MsgGUID: FVacNX9iRDuVwQJgPpJ6DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924242"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:16 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B059A4445A;
	Fri,  4 Jul 2025 10:54:14 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/80] stm class: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:14 +0300
Message-Id: <20250704075414.3218411-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/hwtracing/stm/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..f75d06e3787a 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -659,7 +659,6 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 
 	count = stm_write(stm, &stmf->output, 0, kbuf, count, NULL);
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 	kfree(kbuf);
 
@@ -679,7 +678,6 @@ static void stm_mmap_close(struct vm_area_struct *vma)
 	struct stm_file *stmf = vma->vm_file->private_data;
 	struct stm_device *stm = stmf->stm;
 
-	pm_runtime_mark_last_busy(&stm->dev);
 	pm_runtime_put_autosuspend(&stm->dev);
 }
 
@@ -1082,7 +1080,6 @@ static int __stm_source_link_drop(struct stm_source_device *src,
 
 	stm_output_free(link, &src->output);
 	list_del_init(&src->link_entry);
-	pm_runtime_mark_last_busy(&link->dev);
 	pm_runtime_put_autosuspend(&link->dev);
 	/* matches stm_find_device() from stm_source_link_store() */
 	stm_put_device(link);
-- 
2.39.5

