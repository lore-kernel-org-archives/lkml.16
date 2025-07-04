Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1062877FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615707; cv=none; b=VkxfzJLQyRngDtKq+kCd35SkV+A2eYR16kq9g5ZcQBcHLGhQCCbM5XAQefHn7i9Nl+8VWIDPn7CfdnT66cajusmakNX8Bu7X2hNynV9hSdwumPF5wfodjnGV0tAu+OsU9sfkznqgHB5DDL6iBD2az9kiC2ZIHWCPJQ1LR92u00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615707; c=relaxed/simple;
	bh=BKWpek0YSB33XpRHAKPZmEHtn7tj983LU7A2QeoRjjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pyT2p3MvIzLAOCS6YwCvQZ3b6inZNQEYYLMTokc8INdFSQyQZ4VgFaqH3OvHolD+L557Hl//YUJQf3DrldhjNYa4TJHwt4d4t3ZwhL5C16Gv3bYcjwrXpM2GxoADu3UXEz5OiTFmQvj51oTKYSKWmM+1C30grclDpc3Nor+4krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKVWU6GM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKVWU6GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615706; x=1783151706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BKWpek0YSB33XpRHAKPZmEHtn7tj983LU7A2QeoRjjo=;
  b=BKVWU6GME0M13Kz22EuzSVQ9/qoNRtKqmRlT8dRGhTRi5V2jeKXL2uG8
   S+KYu5ALETxgRrPcq58juvAEBfL5SnO+HhXHvpP87T7etCMsUaZaUIamE
   3r6xe8xhihWPGB1GuAuGraNtlEhLLGXw06FlFBiRdsnS6IRrP0f4fa1b+
   mQRjK99zG1QcxT8TQeexmYu8GCpwtR4Q/PSCxzwqg6xktmlh2HxfkYHYv
   uukr1OFAAKos9yznjZtbm4FJ5WcjlkgDog64QUbAQkmxTMQ0biGyZA1kW
   ffpRuiPMaCC9Zt2Zii4jBJRkSTh50ww6oEIyGqWfB4lCNFA/mlp4yOpM6
   A==;
X-CSE-ConnectionGUID: MAg8QAhnQSmIwZev5L64SQ==
X-CSE-MsgGUID: na1P3YQfTI+YNp3S6KF2lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194269"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: BvArktvMTVuf69f8sKenGg==
X-CSE-MsgGUID: 669lKT7oSiWf/T/A4+vwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616678"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:56 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 6F2664488D;
	Fri,  4 Jul 2025 10:54:54 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 68/80] w1: omap-hdq: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:54 +0300
Message-Id: <20250704075454.3222362-1-sakari.ailus@linux.intel.com>
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

 drivers/w1/masters/omap_hdq.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 69b1d145657a..d13db3396570 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -445,7 +445,6 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 out:
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
-	pm_runtime_mark_last_busy(hdq_data->dev);
 	pm_runtime_put_autosuspend(hdq_data->dev);
 
 	return ret;
@@ -466,7 +465,6 @@ static u8 omap_w1_reset_bus(void *_hdq)
 
 	omap_hdq_break(hdq_data);
 
-	pm_runtime_mark_last_busy(hdq_data->dev);
 	pm_runtime_put_autosuspend(hdq_data->dev);
 
 	return 0;
@@ -490,7 +488,6 @@ static u8 omap_w1_read_byte(void *_hdq)
 	if (ret)
 		val = -1;
 
-	pm_runtime_mark_last_busy(hdq_data->dev);
 	pm_runtime_put_autosuspend(hdq_data->dev);
 
 	return val;
@@ -525,7 +522,6 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
 	}
 
 out_err:
-	pm_runtime_mark_last_busy(hdq_data->dev);
 	pm_runtime_put_autosuspend(hdq_data->dev);
 }
 
@@ -625,7 +621,6 @@ static int omap_hdq_probe(struct platform_device *pdev)
 
 	omap_hdq_break(hdq_data);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	omap_w1_master.data = hdq_data;
-- 
2.39.5

