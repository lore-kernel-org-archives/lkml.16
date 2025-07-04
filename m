Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA392FCE23;
	Fri,  4 Jul 2025 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615721; cv=none; b=lzRdrcKe1AaN3sqs79S5x2hc0Urh/Rq5/6jNwiURz79vcf9ylSQVVFMe30G3FkVXbJdHUNKNP6npVqLZVe19Y9tFYWSovnr+qCFNI+r7+QvXJjheLwnLHrCOTzKRhRgNxYO9k1tq0PQKUKxmMYIoZLVJKM8UjsgiojrrpCqaq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615721; c=relaxed/simple;
	bh=lpsHDsgCN1/Ne3kQyUJDyzv5amh4CMh7kdrVAedLdF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hG1PGqRlw5C/G2R4w2ZDiXoI8HcYL0K/LAi0V5R+PaH1O11F3Xip3CXGCfYmnP5sgJHOJ1nK4/ybXQPLKqJtg4sH+eqC5FKcfNIMsGIjtQekUgHsBDx6jWHHxNepq7WoVB13P/Mqrs9CVGZ8rf0hWBsXua3twiPntnxtmIUSoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJ7U/vhq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJ7U/vhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615720; x=1783151720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lpsHDsgCN1/Ne3kQyUJDyzv5amh4CMh7kdrVAedLdF4=;
  b=hJ7U/vhquwpWgPSQ1Ms7idmsVHcqBPhTJ6nXJUi0xh6FQfz9LmmACG4t
   fva+XM6n/sRFs6ZJSVajef5Vw5ky3Z/ePq3GW/uH8LR62H2NZoc4s+0za
   8j4yXxjg0Xy0T4Yr54C3B8IiVkWHHgi3kcbbKpPQyV250e2txXsubaUGP
   cnT5sZAZpRt4aZUGMzhMr8fS4mPZxrZoLM5GHsJZ8xRC2tXL/3GjyV7i7
   GUhi1KmAXD7AFBTWs+1XNSZqfvk9t/Qhdmb77S0dLkUJt6wsgE0c+7Q19
   8m95ajJYdCk7Jq8mwY1Lg7D+6sw19lMAnHwDx4ndfnASpRKMPbD+h2Wn+
   A==;
X-CSE-ConnectionGUID: fBIu+HXWRbO4Ub8VHqAoYw==
X-CSE-MsgGUID: 1hirFAE7RbGER5hdyejPsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194397"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:06 -0700
X-CSE-ConnectionGUID: VylmM25lR82HHD1Zdi0W7g==
X-CSE-MsgGUID: 6SdYExSXQCy1pSMZ9X5Z6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616730"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B49CF44A4B;
	Fri,  4 Jul 2025 10:54:57 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Ethan Carter Edwards <ethan@ethancedwards.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 72/80] ASoC: Intel: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:57 +0300
Message-Id: <20250704075457.3222746-1-sakari.ailus@linux.intel.com>
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

 sound/soc/intel/atom/sst/sst_pvt.c | 1 -
 sound/soc/intel/avs/core.c         | 1 -
 sound/soc/intel/avs/debugfs.c      | 2 --
 sound/soc/intel/avs/ipc.c          | 1 -
 sound/soc/intel/avs/pcm.c          | 1 -
 sound/soc/intel/catpt/pcm.c        | 6 ------
 sound/soc/intel/catpt/sysfs.c      | 1 -
 7 files changed, 13 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 5d08f7d803f9..c01b29616ebc 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -259,7 +259,6 @@ int sst_pm_runtime_put(struct intel_sst_drv *sst_drv)
 {
 	int ret;
 
-	pm_runtime_mark_last_busy(sst_drv->dev);
 	ret = pm_runtime_put_autosuspend(sst_drv->dev);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index ec1b3f55cb5c..7af324753673 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -231,7 +231,6 @@ static void avs_hda_probe_work(struct work_struct *work)
 	/* configure PM */
 	pm_runtime_set_autosuspend_delay(bus->dev, 2000);
 	pm_runtime_use_autosuspend(bus->dev);
-	pm_runtime_mark_last_busy(bus->dev);
 	pm_runtime_put_autosuspend(bus->dev);
 	pm_runtime_allow(bus->dev);
 }
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index c625cf879f17..f508f215ecd2 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -315,7 +315,6 @@ static int enable_logs(struct avs_dev *adev, u32 resource_mask, u32 *priorities)
 	if (!adev->logged_resources) {
 		avs_dsp_enable_d0ix(adev);
 err_d0ix:
-		pm_runtime_mark_last_busy(adev->dev);
 		pm_runtime_put_autosuspend(adev->dev);
 	}
 
@@ -342,7 +341,6 @@ static int disable_logs(struct avs_dev *adev, u32 resource_mask)
 	/* If that's the last resource, allow for D3. */
 	if (!adev->logged_resources) {
 		avs_dsp_enable_d0ix(adev);
-		pm_runtime_mark_last_busy(adev->dev);
 		pm_runtime_put_autosuspend(adev->dev);
 	}
 
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 0314f9d4ea5f..6bfb9d1a1ca8 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -141,7 +141,6 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 	if (ret < 0)
 		dev_err(adev->dev, "dsp reboot failed: %d\n", ret);
 
-	pm_runtime_mark_last_busy(adev->dev);
 	pm_runtime_enable(adev->dev);
 	pm_request_autosuspend(adev->dev);
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ccf90428126d..3a22a8cb5185 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -979,7 +979,6 @@ static int avs_component_load_libraries(struct avs_soc_component *acomp)
 	if (!ret)
 		ret = avs_module_info_init(adev, false);
 
-	pm_runtime_mark_last_busy(adev->dev);
 	pm_runtime_put_autosuspend(adev->dev);
 
 	return ret;
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 81a2f0339e05..46acb7fdc547 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -673,7 +673,6 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 
 	ret = catpt_ipc_set_device_format(cdev, &devfmt);
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
@@ -871,7 +870,6 @@ static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
 	}
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	return 0;
@@ -892,7 +890,6 @@ static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
 	ret = catpt_set_dspvol(cdev, cdev->mixer.mixer_hw_id,
 			       ucontrol->value.integer.value);
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	return ret;
@@ -927,7 +924,6 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
 	}
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	return 0;
@@ -958,7 +954,6 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 	ret = catpt_set_dspvol(cdev, stream->info.stream_hw_id,
 			       ucontrol->value.integer.value);
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
@@ -1035,7 +1030,6 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 
 	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 936ac9d503ff..048253002ec8 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -21,7 +21,6 @@ static ssize_t fw_version_show(struct device *dev,
 
 	ret = catpt_ipc_get_fw_version(cdev, &version);
 
-	pm_runtime_mark_last_busy(cdev->dev);
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
-- 
2.39.5

