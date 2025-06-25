Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2333211A15
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839308; cv=none; b=cOvYrphh2HtWuL13GHXBl/5J8SH+y1zm4XA7Wd6VwYkMJ1agn3BvW0rSBeI1ALy4Jqjq+iCVXZtwg69X6WR5PqfvRwOfAT+fGiKoZ0t0fbypsdlHpID0e4IqKdWZZZLJGN+3JNqJ4ywVFu/hXKM/7d3ve4gMt0ZpJzi3rQ9muYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839308; c=relaxed/simple;
	bh=VcCasfOKf3wY7lXUeCooCr/f7j0f+z8fz2NB7sEXlwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2jdWmInapL2Zio3PdmD0TJE89A0Stj0tRhfP0uCZjUTxuigiHA26pBl0Q9KXmm2Y06bAXvQT93J378VP/qRAksvD/fAkA+fb9YJHHS0QP/KfsaajPMVEAAPRJUpUvFAY25Kz+aaNFmLuXrI8aOmWtYRDanBdCdc7f4yG/sj1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLWLEBRJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLWLEBRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750839307; x=1782375307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VcCasfOKf3wY7lXUeCooCr/f7j0f+z8fz2NB7sEXlwA=;
  b=MLWLEBRJ/myjFCWlLX9se9DU2PJb8Ke2D5RZXJCv37SHFADBhjvr6pjY
   ZkEnh4l/1xOwC6FgJCQFzp7yXreQRthMcu08AYcZ/hwUSTiU8Ot8C/qCe
   Rj3SwI2oTPRCZOMc5gvm1596bvFHPG69Bn2/UEcItcj83D/ZB9xeCGw6b
   pCuWoa+wSv09yA2qdpVeiumch7rZV3AXdUi907haGLLaQKBlvfBqycRLy
   ZGuWB7CCbfINqSgM1vnneYFtdpB3tiu3GbUUuGiNBn+p5iJwFCMsnkhFl
   Pd4BgHF8tzzo+OB3WuyKmMY2LVbJtgGeGTioMhvqYOC8XBmnBluUoNG/G
   A==;
X-CSE-ConnectionGUID: F00JEZaeTKuzjaqN+DmZIg==
X-CSE-MsgGUID: GCRU1pDBTmOgefFKAHpXnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56775912"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56775912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:15:06 -0700
X-CSE-ConnectionGUID: SEsMtY16SReC2E4iL3FkOA==
X-CSE-MsgGUID: 4EhfEAXgQKqA5x5dAH4ATw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156716161"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C24FC11F742;
	Wed, 25 Jun 2025 11:15:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uULHZ-009zq9-2U;
	Wed, 25 Jun 2025 11:15:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] mailbox: mtk-cmdq: Switch to pm_runtime_put_autosuspend()
Date: Wed, 25 Jun 2025 11:15:01 +0300
Message-Id: <20250625081501.2382657-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__pm_runtime_put_autosuspend() was meant to be used by callers that needed
to put the Runtime PM usage_count without marking the device's last busy
timestamp. It was however seen that the Runtime PM autosuspend related
functions should include that call. Thus switch the driver to
use pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ab4e8d1954a1..532929916e99 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -390,7 +390,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
 	if (!task) {
-		__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		pm_runtime_put_autosuspend(cmdq->mbox.dev);
 		return -ENOMEM;
 	}
 
@@ -440,7 +440,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	list_move_tail(&task->list_entry, &thread->task_busy_list);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 }
@@ -488,7 +488,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 }
 
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
@@ -528,7 +528,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 
@@ -543,7 +543,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 		return -EFAULT;
 	}
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	pm_runtime_put_autosuspend(cmdq->mbox.dev);
 	return 0;
 }
 
-- 
2.39.5

