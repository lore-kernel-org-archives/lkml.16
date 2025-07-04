Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB552F5C35;
	Fri,  4 Jul 2025 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615711; cv=none; b=mWD/2H9r1i5xygmdj/i5F1Dw6nkWXEdKQ1R99/HGBISTznCvX4590zM/P5zZAGr+/vLJkwvM1ik9KWoDY8Zau3IwDigRpJeNJs3LuiNiiDfiHtxhHzmGVnWbDfcZXTrZ6GTCAtxd6KmTM0F2YyIuNwO3IafRSpc2g0vmCv961Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615711; c=relaxed/simple;
	bh=eVLkIeLgEFxD0O6073m8DnwCRdtHe+L5RdLUWpA3UoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PTLhI1ruNjKQvG2RXQ6cOwUUZ/mrKbLkLoeTcGCHI+mG8dxzemKvJVSGoIWEOLYHu6VRXhEV7Ldjm2Yp2VqFRbo7yVGlW65lVFvOiHZ+uFsS66P/loC0vVWjNF2K/kQ5AunyjmIrOcLng2rmnTGvp84z8OYcJDyFtzfH16Q2yDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9QF1w+f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9QF1w+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615710; x=1783151710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eVLkIeLgEFxD0O6073m8DnwCRdtHe+L5RdLUWpA3UoM=;
  b=l9QF1w+fhZJtMNpbrYOKLUNb1VEn1avrZoil81qCp0J4Qt7iNDqTPSPH
   +6gkNRuw4rOfeH3hcwHa6QdKPGJD+L7JzO7d35ecFF+QftQprzhKUW6Vg
   crLPHPJna0Hyk4Ba6efEb8a9NPUr/4e5+CI5g8kd4sRmhStLxLIG58GGX
   lHPMo6x82nuJJplUnIORhZmOZP/PzVmL9UCJk8VTrXkEzZG8qCQ3DWX4R
   SiuMLoiPHdMSIIqgBelGWRIrdREVV2lGCLF6cEZu9Qz5JKXHeEnPcg4Om
   NryVEO3LCAhia83aHULFKS5uw+LjvYpYCddsXcKf7Vun2+5qJA2Ro86vD
   w==;
X-CSE-ConnectionGUID: 8zTTKtBMTPmRViHcw0euXg==
X-CSE-MsgGUID: VmW1I5beTL+DeQEE45WcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194274"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194274"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
X-CSE-ConnectionGUID: e4q5kn2ZSyCHwss7ykn6BA==
X-CSE-MsgGUID: XMYFixcGQDireEw7dxOfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616682"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:57 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id D98F744419;
	Fri,  4 Jul 2025 10:54:55 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 70/80] ASoC: atmel: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:55 +0300
Message-Id: <20250704075455.3222541-1-sakari.ailus@linux.intel.com>
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

 sound/soc/atmel/mchp-spdifrx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index fb820609c043..521bee4998f8 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -577,7 +577,6 @@ static int mchp_spdifrx_cs_get(struct mchp_spdifrx_dev *dev,
 	       sizeof(ch_stat->data));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -660,7 +659,6 @@ static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
 	       sizeof(user_data->data));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -726,7 +724,6 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 
 	uvalue->value.integer.value[0] = ctrl->ulock;
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -762,7 +759,6 @@ static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
 		ctrl->badf = 0;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -811,7 +807,6 @@ static int mchp_spdifrx_signal_get(struct snd_kcontrol *kcontrol,
 		regmap_read(dev->regmap, SPDIFRX_RSR, &val);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 unlock:
@@ -875,7 +870,6 @@ static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
 	ucontrol->value.integer.value[0] = rate / (32 * SPDIFRX_RSR_IFS(val));
 
 pm_runtime_put:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
-- 
2.39.5

