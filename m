Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98C2FCE22
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615721; cv=none; b=ENmqxjbzQZFuS6TCtorPLheCBqCtEhaPxhktPCLUKfB/pYaxSrv8oKVdTt8iQzMuvW5LUTl1+KgrWwBP6QyVsEXHtQ2EE5o+YhtY4wUVN5DjPg7dNct7WNR+XuOn7m7Fy8EzHSplDooAkGbVgJudvLrbEXQWcxQHVGbZtay0j6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615721; c=relaxed/simple;
	bh=EoYEpuIhjevRLmOMCR7f7TcajIGyH0zpZLQ+nin4C+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuvtwFu056plaBwcQrEy3SvX8faONhCVVntCKIUDQiS9dMN2X/Vke8AhF6SGt/RNHCBt1dXiCqjtjZXemdKV3Ia+TfUPbVYaQtxDm8zP6TwkLhqsgAKdEtFxBq1sSXJdse5ovZztJbma386CA8HGX1dr++cMUiVLNvddja2EmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCuUkhmB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCuUkhmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615720; x=1783151720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EoYEpuIhjevRLmOMCR7f7TcajIGyH0zpZLQ+nin4C+I=;
  b=XCuUkhmBGr2aH5SmQgniYn0qZnGw7fgk2P5HVF7uuqrW1o5vkV9wjQR1
   9Ae1Uvanb6sLrZPoliQFQgIKmyXe96vGnvZGgPZaeQfl6AiQaYVYlocpk
   GzyPNXwR9G9VzjE73SgCvx/45pGqleN8RNPKTkLbjVLojjDtJBE20N7zz
   68CiEY3IPMEdl/e2EpOMHARMK+3j8XKij5bniQMIW0oGhdfQcE7SKBf+T
   tpwV5V5YQkMq+ZnGSb+dxBcP6dV7zSVE8L1KhhAW9SWCbZD3f3w8pdO8A
   YK0ufkPgabu1o0ahV0Q9qLJeDHiwcmNZXc17F6gTj7oLCfD6RPps09P0+
   Q==;
X-CSE-ConnectionGUID: ImewDs+/SDWAyUmezeE7hw==
X-CSE-MsgGUID: nsAXlgPZRP6Axsw9tR5ftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194383"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:05 -0700
X-CSE-ConnectionGUID: vgQ8PaqkSnqJO8aISIvvhg==
X-CSE-MsgGUID: vTwceVOmQzGj0D8RXANUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616716"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id EDE1344BAC;
	Fri,  4 Jul 2025 10:55:00 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 76/80] soc: apple: mailbox: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:55:00 +0300
Message-Id: <20250704075500.3223019-1-sakari.ailus@linux.intel.com>
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

 drivers/soc/apple/mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 49a0955e82d6..b56600229a7d 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -275,7 +275,6 @@ void apple_mbox_stop(struct apple_mbox *mbox)
 
 	mbox->active = false;
 	disable_irq(mbox->irq_recv_not_empty);
-	pm_runtime_mark_last_busy(mbox->dev);
 	pm_runtime_put_autosuspend(mbox->dev);
 }
 EXPORT_SYMBOL(apple_mbox_stop);
-- 
2.39.5

