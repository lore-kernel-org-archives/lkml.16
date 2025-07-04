Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E572BD038
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615660; cv=none; b=i7O+/DqOHWKSWndfSg4rI0dspLQErIgRxNz4xWlXOGAZVgL7fIFlanXYjjVlBsHb1O2yteoZc11Np3zgcd1TZXgjMs9eoziVqiiJ+jGmkLLNd+Vb4E94Am1eQuj1dOobxNybEjhQaMYyRiQJ5rRPchMWv9kPJRi0ddj97tFTQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615660; c=relaxed/simple;
	bh=jkS9/YATNHGwePG4Z6nuBAAtHBE+gydJOzbwcD0bugw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fbJ2fvnM6VEk+LVki3ipgso7Goud/KaT310GlgHSfHLK/9uw6s2ALuvDcVmxfsrU+JpNe7ejGNdaRh+Sw21qcqgi9TIb2oKRzu+G3Xf6zXG6yyyFIo2ZOBEY3KQBAyY0m7O0SNJsAbsm9yesUKBoGMGdJ1+9WDhWQ1xLNLWmDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTKCaS07; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTKCaS07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615658; x=1783151658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jkS9/YATNHGwePG4Z6nuBAAtHBE+gydJOzbwcD0bugw=;
  b=PTKCaS07+uVUD22F+XJehbYJGDMnwtu03rT+WyVMiAaxL7uXf5kYCAMV
   FEB+ytjseDduNrfvrenBgxGJrhiBFuELRM2ueEys5ldp5XWq+6bXT5ebx
   LWpvPdJTWIXNP8AzFo6QMEt1cC+a6jKQQ01uzNiF2FMiR5MYq4agTSA9I
   glMEoOLP1TTolFaWPRsIwHxFAAZGD1wGNltXBFdYlYxzhIWIk21WEo1/J
   Uwz7ae3NlerhCGq+Fr2rSzk38jqMb1rFUzwt+cSwfPWO1WDbenCa4qaAs
   9ziithr+WCX6osOykJ1JNHBa1eyvf66pTTvwa715FqJqvVu3uLrkuG3iM
   A==;
X-CSE-ConnectionGUID: MVdk2ttBS92J7ipwPMPAkw==
X-CSE-MsgGUID: Sd0qg+uRTZuV1EVhceXXUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494566"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:17 -0700
X-CSE-ConnectionGUID: RxateKRvQpesT7CzRi+HIw==
X-CSE-MsgGUID: rJnaQAiQS7Sm1KrgVEE8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924238"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:16 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1C36044424;
	Fri,  4 Jul 2025 10:54:14 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sebastian Reichel <sre@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 21/80] HSI: omap_ssi_port: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:13 +0300
Message-Id: <20250704075413.3218357-1-sakari.ailus@linux.intel.com>
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

 drivers/hsi/controllers/omap_ssi_port.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/controllers/omap_ssi_port.c
index aeb92b803a17..50dde968febe 100644
--- a/drivers/hsi/controllers/omap_ssi_port.c
+++ b/drivers/hsi/controllers/omap_ssi_port.c
@@ -362,7 +362,6 @@ static int ssi_async_break(struct hsi_msg *msg)
 		spin_unlock_bh(&omap_port->lock);
 	}
 out:
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 
 	return err;
@@ -401,7 +400,6 @@ static int ssi_async(struct hsi_msg *msg)
 		msg->status = HSI_STATUS_ERROR;
 	}
 	spin_unlock_bh(&omap_port->lock);
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 	dev_dbg(&port->device, "msg status %d ttype %d ch %d\n",
 				msg->status, msg->ttype, msg->channel);
@@ -504,7 +502,6 @@ static int ssi_setup(struct hsi_client *cl)
 	omap_port->ssr.mode = cl->rx_cfg.mode;
 out:
 	spin_unlock_bh(&omap_port->lock);
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 
 	return err;
@@ -570,7 +567,6 @@ static int ssi_flush(struct hsi_client *cl)
 	pinctrl_pm_select_default_state(omap_port->pdev);
 
 	spin_unlock_bh(&omap_port->lock);
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 
 	return 0;
@@ -625,7 +621,6 @@ static int ssi_stop_tx(struct hsi_client *cl)
 	writel(SSI_WAKE(0), omap_ssi->sys + SSI_CLEAR_WAKE_REG(port->num));
 	spin_unlock_bh(&omap_port->wk_lock);
 
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev); /* Release clocks */
 
 
@@ -653,7 +648,6 @@ static void ssi_transfer(struct omap_ssi_port *omap_port,
 		}
 	}
 	spin_unlock_bh(&omap_port->lock);
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 }
 
@@ -683,7 +677,6 @@ static void ssi_cleanup_queues(struct hsi_client *cl)
 			txbufstate |= (1 << i);
 			status |= SSI_DATAACCEPT(i);
 			/* Release the clocks writes, also GDD ones */
-			pm_runtime_mark_last_busy(omap_port->pdev);
 			pm_runtime_put_autosuspend(omap_port->pdev);
 		}
 		ssi_flush_queue(&omap_port->txqueue[i], cl);
@@ -739,7 +732,6 @@ static void ssi_cleanup_gdd(struct hsi_controller *ssi, struct hsi_client *cl)
 		 * ssi_cleanup_queues
 		 */
 		if (msg->ttype == HSI_MSG_READ) {
-			pm_runtime_mark_last_busy(omap_port->pdev);
 			pm_runtime_put_autosuspend(omap_port->pdev);
 		}
 		omap_ssi->gdd_trn[i].msg = NULL;
@@ -936,7 +928,6 @@ static void ssi_pio_complete(struct hsi_port *port, struct list_head *queue)
 	reg = readl(omap_ssi->sys + SSI_MPU_ENABLE_REG(port->num, 0));
 	if (msg->ttype == HSI_MSG_WRITE) {
 		/* Release clocks for write transfer */
-		pm_runtime_mark_last_busy(omap_port->pdev);
 		pm_runtime_put_autosuspend(omap_port->pdev);
 	}
 	reg &= ~val;
@@ -981,7 +972,6 @@ static irqreturn_t ssi_pio_thread(int irq, void *ssi_port)
 		/* TODO: sleep if we retry? */
 	} while (status_reg);
 
-	pm_runtime_mark_last_busy(omap_port->pdev);
 	pm_runtime_put_autosuspend(omap_port->pdev);
 
 	return IRQ_HANDLED;
@@ -1018,7 +1008,6 @@ static irqreturn_t ssi_wake_thread(int irq __maybe_unused, void *ssi_port)
 		}
 		hsi_event(port, HSI_EVENT_STOP_RX);
 		if (test_and_clear_bit(SSI_WAKE_EN, &omap_port->flags)) {
-			pm_runtime_mark_last_busy(omap_port->pdev);
 			pm_runtime_put_autosuspend(omap_port->pdev);
 		}
 	}
-- 
2.39.5

