Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118902F5C28;
	Fri,  4 Jul 2025 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615717; cv=none; b=nKDkbsRvggf64NvbO+CeYJ22GZArcOQHu9QDqnM5yZmmTgEapHU9nLw4mLpcM03DIdD/QtViaZknXgAvcfGVVtjEZaoVIiLUF5M0suVpuoGSTHfy+56vb74nhxt0h/iL9OdtzPNb1kv9jtxZmLqWUX2YdfnKfePJF1c9c12WHEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615717; c=relaxed/simple;
	bh=4ldo25+N/tIFm8DeRcBCKb3twA4UajKK70i0GKs/kok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TTiw4TpP05WPTCHsscI3KtVHyjt+uG62hLqpzFoL/Vc/pbl4zI01oW3YlHf2IIZnxXFXQhXes80tQfjNMWJzNraSicN/5zypx4fXGgajkxILeG92lecD/iiL5g3vsuW4jvM4s8kV7SlVYe471FwV2gfJ/Am3LF8Xey9dGyvE45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Suv8p/HM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Suv8p/HM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615715; x=1783151715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ldo25+N/tIFm8DeRcBCKb3twA4UajKK70i0GKs/kok=;
  b=Suv8p/HMVE69tC2YMdWgd/T4+NuwIjOvMeKQZf7c2kruR8momzd3UWau
   cVnhLJMh9P0pQSw/NAwAx+/8mjYOSd3pdPduwybFas45FIUkzKqYRrWHu
   t1pyiIjfGJmRo9iG2CiH3SZG5Vl7CcBBYSgkY+7DwijUnlmQgqdzZjhN/
   XtaRH5EXmfpPHOnItXLWlZtveMXPvy5wJOCLNPQV76G4uw7QZW0N2FAZ3
   kISTPZaAAcFQYgyVd2y54lBcbvu95Dzb60LN2HpQFqcntrXyGSM1Hhg/Y
   pZvFCUt/mNFFs+XhmKJInB4VDqBf7bpbqEcUMWZ57c+lMynMVEbADcg+9
   Q==;
X-CSE-ConnectionGUID: bwFFjWQuR42xnfMrkTpipw==
X-CSE-MsgGUID: A8InFhvwQc2bhlF3NrzGpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194357"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:04 -0700
X-CSE-ConnectionGUID: bfQcSKCsSfCiGdfFB4zSUA==
X-CSE-MsgGUID: RS77KNxxS3mhIudXvS88zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616704"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:02 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 2FCB24488D;
	Fri,  4 Jul 2025 10:55:00 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 75/80] ALSA: intel_hdmi: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:55:00 +0300
Message-Id: <20250704075500.3222950-1-sakari.ailus@linux.intel.com>
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

 sound/x86/intel_hdmi_audio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index fe5cb4139088..cc54539c6030 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1102,7 +1102,6 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 
 	return retval;
  error:
-	pm_runtime_mark_last_busy(intelhaddata->dev);
 	pm_runtime_put_autosuspend(intelhaddata->dev);
 	return retval;
 }
@@ -1127,7 +1126,6 @@ static int had_pcm_close(struct snd_pcm_substream *substream)
 	}
 	spin_unlock_irq(&intelhaddata->had_spinlock);
 
-	pm_runtime_mark_last_busy(intelhaddata->dev);
 	pm_runtime_put_autosuspend(intelhaddata->dev);
 	return 0;
 }
@@ -1589,7 +1587,6 @@ static void had_audio_wq(struct work_struct *work)
 	}
 
 	mutex_unlock(&ctx->mutex);
-	pm_runtime_mark_last_busy(ctx->dev);
 	pm_runtime_put_autosuspend(ctx->dev);
 }
 
-- 
2.39.5

