Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2D2E1C6F;
	Fri,  4 Jul 2025 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615682; cv=none; b=OYTTEW81m/cMGGMwl11GI1QrH3UCTPkLGFDA9fz+/5otsQs727rTFxHZ9PyXj5oWiK+Rxqk/KXnnOUyKE1BZiXsrkgYQvAIqCTbGR41FF8lyTwxUM9KBbwrdbU6gA1RJd2tn2l6Ps1gpop4uWRPu+Pq2bovOKvxkLNru/ORGmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615682; c=relaxed/simple;
	bh=ygYb2C6/ZqATeJsBP/wXtZvBgqy/5CPElmXHxYKwYuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AuLK1m3JHrzwIZU+LoqcUjWfkvQHn0HkaQisKxWucxCBNIXI7EEkiT+Qev+1xfFCWdachgVFxUSKACt3NYgewXNRL7Fqxn9SM6KtxgKdQH0JNtM6RIHmBY4CVU+1maOkBqeTpFqi3j1pmr0FEM/pNae5Mwj2Z1oJq+7fm6EZLu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHzcRjXf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHzcRjXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615681; x=1783151681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ygYb2C6/ZqATeJsBP/wXtZvBgqy/5CPElmXHxYKwYuY=;
  b=FHzcRjXf8Y2XI/NvlLX80+DhXe+RsVFEQQ4z3v1sdS7mylEhv65cfYVN
   2sEBuk9Qs2Tl1Hk1SVYFKUVE9o8WYaOzLizbWxfkv6Cy5s5xeDYm9Sldl
   oyaT3NesEkMZTAYD61WT7seaPU9n20btJAlF9VW3SRh18brs/e/7IvTHb
   qWMCQ3kg9JLw2h6wgY5wu7uzMZAht+EePkgkh+Bi58NQ4/90zIX+05Rab
   /9sj9953dNhdudbxq9s146dUeZII5TU/ogsFT/HbBPa32uaeAwK3fW0mZ
   7RIGHlSQMmYZNtLJgsxY8qoRku9cxi/9spbHWtGBbgIrt+hbXPE7YvgzO
   Q==;
X-CSE-ConnectionGUID: 4ILEyjmHQ5qeVTbBQX7rWg==
X-CSE-MsgGUID: Yc0Qk4coTUOm15P3baPhoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194108"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:37 -0700
X-CSE-ConnectionGUID: W13V4ShFR1exPlMYQThahQ==
X-CSE-MsgGUID: +kgQWxw6TLS1TQNnKQeflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616557"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:34 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 7595E44433;
	Fri,  4 Jul 2025 10:54:32 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 42/80] mfd: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:32 +0300
Message-Id: <20250704075432.3220321-1-sakari.ailus@linux.intel.com>
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

 drivers/mfd/arizona-irq.c  | 1 -
 drivers/mfd/cs40l50-core.c | 1 -
 drivers/mfd/cs42l43.c      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index ac2139597fab..3f8622ee0e59 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -152,7 +152,6 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
 		}
 	} while (poll);
 
-	pm_runtime_mark_last_busy(arizona->dev);
 	pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
diff --git a/drivers/mfd/cs40l50-core.c b/drivers/mfd/cs40l50-core.c
index c91bccda0858..662d987b650b 100644
--- a/drivers/mfd/cs40l50-core.c
+++ b/drivers/mfd/cs40l50-core.c
@@ -531,7 +531,6 @@ int cs40l50_probe(struct cs40l50 *cs40l50)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request %s\n", CS40L50_FW);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 103787f37443..07c8f1b8183e 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -962,7 +962,6 @@ static void cs42l43_boot_work(struct work_struct *work)
 		goto err;
 	}
 
-	pm_runtime_mark_last_busy(cs42l43->dev);
 	pm_runtime_put_autosuspend(cs42l43->dev);
 
 	return;
-- 
2.39.5

