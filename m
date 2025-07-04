Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978802EF2AC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615694; cv=none; b=ITp4/pEUJdaXpA6bq4YZeHWvqXchNyH11QZvoObFwb0kbzhWMZz84RbNLLZZiXnhV1R+YhuQ2bkkR5Ieax4JYa4OYBzZu0b2hPDNaeY6JOjk2K/Vzu4yh9Msv30/HxjdmIIRkNaFIl2C9GA7CBmMnBmhkiLb4WSZcnphQJtReKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615694; c=relaxed/simple;
	bh=NO75yl0C/QCwRChAfVosDGNmtR5VgVEkJtdizny75eQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HrwWoS6l//o9bB66E5CL+vuz3+f5qpZc+fFSNsj7+BxYbNxK5UQBZgI6wqVXyYXAIgbIgpsv+iX19hVLdtxIWBB2VzYHPHMIufdOg9r4avsmp6zK6CLWYf1cyPq8vxef05ClWbq0ZZbetXfRxAgjlKUGxxo9CeVZQIqWGhU4wv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFPyJhM/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFPyJhM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615693; x=1783151693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NO75yl0C/QCwRChAfVosDGNmtR5VgVEkJtdizny75eQ=;
  b=XFPyJhM/0Gidlo4lwigeJVw8jzfMAeiag83nE6MVPTKNHSGdONv0a1VM
   9HovT2WeKESPwrAfL4vK0rIr1LUFA4Xe3F4ufeR/c/kA3RhglZzqDSzHz
   en90n+Mp7jsEjrGKP4sgllqM6BFaHZ4vTg0w6u4/KyncwPyFak3Ufg2w4
   ujkkMsRKk7urmyCOTvVith6OItUL5IUIuHLHxsNv1mfqiH09Y3Q2kQepD
   khpcsH8VkurFCddrwMf4NBj1wEKbqknOUEWx8xEa4av7pZFPmI5lNKjQy
   fde6X0eXM3VuWdiQYDp2SCGhzE38OBw07n5q/kqayV62153PvQMiMDQ7g
   Q==;
X-CSE-ConnectionGUID: jv8gXHKIQfeC9rj0BeVDNA==
X-CSE-MsgGUID: SMCd7f+wQDKY3rKRbryQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194220"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:47 -0700
X-CSE-ConnectionGUID: QEo8glDxTqWRbZPCkwigrA==
X-CSE-MsgGUID: Vww84vogRU6mgpGMnplGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616602"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:43 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 30B1844910;
	Fri,  4 Jul 2025 10:54:41 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	David Lechner <dlechner@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 52/80] phy: motorola: phy-mapphone-mdm6600: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:40 +0300
Message-Id: <20250704075440.3221183-1-sakari.ailus@linux.intel.com>
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

 drivers/phy/motorola/phy-mapphone-mdm6600.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index fd0e0cd1c1cf..c82826bd2832 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -248,7 +248,6 @@ static irqreturn_t phy_mdm6600_wakeirq_thread(int irq, void *data)
 	}
 
 	/* Just wake-up and kick the autosuspend timer */
-	pm_runtime_mark_last_busy(ddata->dev);
 	pm_runtime_put_autosuspend(ddata->dev);
 
 	return IRQ_HANDLED;
@@ -616,7 +615,6 @@ static int phy_mdm6600_probe(struct platform_device *pdev)
 		error = PTR_ERR(ddata->phy_provider);
 
 idle:
-	pm_runtime_mark_last_busy(ddata->dev);
 	pm_runtime_put_autosuspend(ddata->dev);
 
 cleanup:
-- 
2.39.5

