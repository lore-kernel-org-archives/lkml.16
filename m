Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440428A41C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615648; cv=none; b=UzZ4GW/+L0TY0GrdSC0U7SnRad2IhmCW8+kArJneoao3EACz+ad+qAUWmQncGJmiXRZuwq9hFGm8qcrdVBxdTmJiKQ7II6CphM14/5hk2cuVQGmmPAANmFL31v4zi+W5vdDB7r8BZmpLBzobRI6p5f2G/VYobnHtPK55X8VFhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615648; c=relaxed/simple;
	bh=nHMM1O4IslvrfeqGodyglti8CaB1ROJeZIDQqlgaxII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kcgYRr7eqeF5MO7NtHBkwf8z1wjLmnbYmpVIXyycR4c4HWDXxIEwsm9VtWQFXnyu7DNw7QBgwSI5HykjrOXvEdaRsOVNXvCPzkqnQXz8NxD8alFRgglvnHFJWkYa58tHSIIHhEu/tb2QDlWlqglkCpePDKTzW9kl52sG3jLL0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjgSbj4S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjgSbj4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615646; x=1783151646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nHMM1O4IslvrfeqGodyglti8CaB1ROJeZIDQqlgaxII=;
  b=XjgSbj4SAIXbvAlmLFjnToeJPx1T9qdrQDUDNPEz+o2qmf2LbcuPcyzR
   J26XdO7ntK+AZzRwpAyO4yzD8Y/PXgSXh/R15bAVNDfcmyMfKBlifwy+G
   A0Twqexx3VaSRFQ/Ske4/9ueirHWV7D6/NaBRIkdhiWJr5u5m6j5L2lFC
   RQTBuJ6i1KluDIkV7NL9W4rpn4KFKdvkjTPUGQthprJ9YAtT46C/0hbmY
   Jpam6BDavHZsrF93DqEYAMSIBKS1JoO0GWKqFT7KrfDvAGHawQqMnO/Zw
   Kp0UAXY7pqDX7AREzE/wiEd9CUjDZ9c90GO3L5tJxpWzCGyAlQWBqk81O
   A==;
X-CSE-ConnectionGUID: 8o4mhb0XSNOmnB5BUDFLxg==
X-CSE-MsgGUID: l+yFIRPwTSuqgM0M9jtKzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494459"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:05 -0700
X-CSE-ConnectionGUID: 7LTrMyx/QlqWGtX+avivNw==
X-CSE-MsgGUID: xH/cd10lR62+1jlZ97J90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924163"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:01 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 14D6944433;
	Fri,  4 Jul 2025 10:53:59 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/80] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:58 +0300
Message-Id: <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
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

 drivers/bus/sunxi-rsb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 7a33c3b31d1e..82735c58be11 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -373,7 +373,6 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 unlock:
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
@@ -417,7 +416,6 @@ static int sunxi_rsb_write(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
-- 
2.39.5

