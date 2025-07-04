Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C132F5C5B;
	Fri,  4 Jul 2025 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615712; cv=none; b=qtU3aopXXYux+PnOskhY/pglvGxT0uqRPIhSSmqKEevvm0Kgoj6C9krHYp5okhuM/WBwvyGZTTQg3xZ3bMoTcIuhVOiONgEfeFZ/L4hGQTSqM8jm2qJUfdNIhR4OT24211+tW5z9c4b2jDnxzHoBK9U4vWWGDZmulx9l+2oUdSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615712; c=relaxed/simple;
	bh=Ow9GDcoq++fMSGKyfGiqKXk0DAXPUXz0U3h1b3nG6A4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mUj6xTlxuyy1cOmtoqwTs4M5jKntdEuF0gJWW+Qr1170CaaO8tzGCRn4Nz3YygUN5zItICaV6pmNeDC6BQ5oS2kZTntue+a1HZ8+FsD+BmQLoF8+UnF7E4Rv9DPEBc/+EwtZcjRhqoTZMfQqaFLy2hDXWJM1bCjgOxDBMFZp0so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZpGwSgp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZpGwSgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615711; x=1783151711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ow9GDcoq++fMSGKyfGiqKXk0DAXPUXz0U3h1b3nG6A4=;
  b=CZpGwSgpfe6SzNuDO1k3DrJs5XWIYKiYRQcTZYkSuDE4d2utTZr6FbO9
   F9OOgTHQJdIeM1FwwcMoTNllAVGxRdcGOGIIq9wmHqY7tVyBEU11QxC7o
   4/eenuZLht0BDJpz9kYnqIdiUGcPdYEzCUOcor/wKtFK1aAra6nAkOgfi
   Rv/Zd4ngzQHOamhS7AImH1bMwnACwEcchPaXC5IC3SMtRy6WL+MXYjQuL
   d4nc+MGJh0YPvHtFhq67dTaWh+8/3k9cZ+3XfkpcqR7GCZTGoiXxGeQ5G
   I8W8jLcGqRgTbxEjO1rYjSGhiXCJ9IoKeTFS7TisWwNWJMjDHHkoZT9vq
   Q==;
X-CSE-ConnectionGUID: GBEhOz1PQYuKY2uMFH375A==
X-CSE-MsgGUID: +XbVgguOSAKZphVea9Sm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194308"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:03 -0700
X-CSE-ConnectionGUID: Weazn6h3QRyxib0YQ8iwTg==
X-CSE-MsgGUID: yYhB1jCJQ0mMx26r49rSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616702"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:57 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4171E44910;
	Fri,  4 Jul 2025 10:54:55 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 69/80] ALSA: hda: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:55 +0300
Message-Id: <20250704075455.3222438-1-sakari.ailus@linux.intel.com>
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

 sound/hda/hdac_device.c         | 1 -
 sound/pci/hda/cs35l41_hda.c     | 4 ----
 sound/pci/hda/cs35l56_hda.c     | 1 -
 sound/pci/hda/tas2781_hda_i2c.c | 3 ---
 sound/pci/hda/tas2781_hda_spi.c | 4 ----
 5 files changed, 13 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 0053831eed2d..a02dce5f6a88 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -581,7 +581,6 @@ int snd_hdac_power_down(struct hdac_device *codec)
 {
 	struct device *dev = &codec->dev;
 
-	pm_runtime_mark_last_busy(dev);
 	return pm_runtime_put_autosuspend(dev);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_power_down);
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c2cf3813872a..fc3f9ed3be13 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -836,7 +836,6 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		 * Playback must be finished for all amps before we start runtime suspend.
 		 * This ensures no amps are playing back when we start putting them to sleep.
 		 */
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		break;
 	default:
@@ -1284,7 +1283,6 @@ static void cs35l41_fw_load_work(struct work_struct *work)
 	cs35l41->fw_request_ongoing = false;
 	mutex_unlock(&cs35l41->fw_mutex);
 
-	pm_runtime_mark_last_busy(cs35l41->dev);
 	pm_runtime_put_autosuspend(cs35l41->dev);
 }
 
@@ -1515,7 +1513,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		dev_warn(dev, "Unable to create device link\n");
 	unlock_system_sleep(sleep_flags);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	dev_info(cs35l41->dev,
@@ -2036,7 +2033,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
 	pm_runtime_use_autosuspend(cs35l41->dev);
-	pm_runtime_mark_last_busy(cs35l41->dev);
 	pm_runtime_set_active(cs35l41->dev);
 	pm_runtime_get_noresume(cs35l41->dev);
 	pm_runtime_enable(cs35l41->dev);
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 3f2fd32f4ad9..0391bbffed7d 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -89,7 +89,6 @@ static void cs35l56_hda_pause(struct cs35l56_hda *cs35l56)
 			  BIT(CS35L56_ASP_TX1_EN_SHIFT) | BIT(CS35L56_ASP_TX2_EN_SHIFT) |
 			  BIT(CS35L56_ASP_TX3_EN_SHIFT) | BIT(CS35L56_ASP_TX4_EN_SHIFT));
 
-	pm_runtime_mark_last_busy(cs35l56->base.dev);
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index b9cdbca951e4..8a461acbc3b9 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -157,7 +157,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		tas_hda->priv->playback_started = false;
 		mutex_unlock(&tas_hda->priv->codec_lock);
 
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		break;
 	default:
@@ -483,7 +482,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 out:
 	mutex_unlock(&tas_hda->priv->codec_lock);
 	release_firmware(fmw);
-	pm_runtime_mark_last_busy(tas_hda->dev);
 	pm_runtime_put_autosuspend(tas_hda->dev);
 }
 
@@ -526,7 +524,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 5c03e9d2283a..c4b9a3c1a7f0 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -400,7 +400,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		guard(mutex)(&tas_priv->codec_lock);
 		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
 			tasdevice_tuning_switch(tas_priv, 1);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 }
@@ -698,7 +697,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas2781_save_calibration(tas_hda);
 out:
 	release_firmware(fmw);
-	pm_runtime_mark_last_busy(tas_hda->priv->dev);
 	pm_runtime_put_autosuspend(tas_hda->priv->dev);
 }
 
@@ -731,7 +729,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -816,7 +813,6 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 
 	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
 	pm_runtime_use_autosuspend(tas_priv->dev);
-	pm_runtime_mark_last_busy(tas_priv->dev);
 	pm_runtime_set_active(tas_priv->dev);
 	pm_runtime_get_noresume(tas_priv->dev);
 	pm_runtime_enable(tas_priv->dev);
-- 
2.39.5

