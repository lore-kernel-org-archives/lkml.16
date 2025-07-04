Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB82FBFF2;
	Fri,  4 Jul 2025 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615719; cv=none; b=Nsv3k24kk3PCH6mkcdTAcOvaz3aw8vpfPrN2u5vfeNVQvs/nO4UMeZBW59rRXz458Mb5JTvee5DMzc8pbE4ltw3ee2xfrsPy0gX7/gxqBxwmnbLuTEQ1+jomuIpprQuIyVTPVsObKP2fNMNbo0+xHR14+M4LPwHA9CRLvmCZqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615719; c=relaxed/simple;
	bh=9q69OYL/7CXMUWdcHldof/LUdGaA7ZxaW92IuHgn28U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t3nbcG9eUwnEohDKXm/lZZWqIiREcP1kdhzUDKlm9ji4C0kv+iyTB3IYWNdmkKHfOZQppvpWux+gnSJNHBk0Xnfc9o2FrD2dKWA+uy7J3d8b4lBzpmxInD7J/dApFQnvgCik+lDXX5Yy+hPq73BPmuD3D68Kx/HNi+sejOo+mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bk0XzXxu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bk0XzXxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615718; x=1783151718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9q69OYL/7CXMUWdcHldof/LUdGaA7ZxaW92IuHgn28U=;
  b=Bk0XzXxul8g+M59MCbQ57GMYoYCXcIy1Ug6xJNeKzvlcp4JGpgSITBad
   yGFSm81Fzz0+06k0qivitY8h+zFaF6hncTqH1S5MpZsoplMwXDkd4PbQ9
   ZZRNaEEG88Gq2qZ3ueOeSBHCxfj8eghMT8ZMq2Hu4GE/ppB/caU137t7i
   ap9vd1e09SzdW2K9s1yLrMFtgN9o1qPDzOIrkDzRNu82GEtt0tz1KncrP
   cZbt0lFXg0CuqzrPJi5gAW6FSROq0Tdg5CCMz4VuiCZN7AGpR1+vsGI+j
   TOIZAdvbpfLr+7jWPmH4AFFXOnhPAJUtmx3RZLdXbBT6gc01cE2Xtso9a
   g==;
X-CSE-ConnectionGUID: au2DMQatSM2JnaU3vzeNwQ==
X-CSE-MsgGUID: PHnFYLHrSvOEp5tIOIqmZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194389"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:06 -0700
X-CSE-ConnectionGUID: 1RWBHqSlQQe4GhVeAOhq5g==
X-CSE-MsgGUID: B7ehfIh7QfWHqURRUlM27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616700"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:01 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 8B2364445A;
	Fri,  4 Jul 2025 10:54:59 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 74/80] ASoC: SOF: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:59 +0300
Message-Id: <20250704075459.3222908-1-sakari.ailus@linux.intel.com>
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

 sound/soc/sof/control.c                        | 1 -
 sound/soc/sof/debug.c                          | 1 -
 sound/soc/sof/ipc3-dtrace.c                    | 1 -
 sound/soc/sof/ipc4-loader.c                    | 1 -
 sound/soc/sof/pcm.c                            | 1 -
 sound/soc/sof/sof-client-ipc-flood-test.c      | 1 -
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 1 -
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 1 -
 sound/soc/sof/sof-client-probes.c              | 3 ---
 9 files changed, 11 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 463d418e7200..a3fd1d523c09 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -196,7 +196,6 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_volatile_get)
 		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
 
-	pm_runtime_mark_last_busy(scomp->dev);
 	err = pm_runtime_put_autosuspend(scomp->dev);
 	if (err < 0)
 		dev_err_ratelimited(scomp->dev, "%s: failed to idle %d\n", __func__, err);
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d0ffa1d71145..b24943a65c89 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -217,7 +217,6 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
 	}
 
 	ret = sof_ipc_tx_message(sdev->ipc, &msg, msg.size, reply, SOF_IPC_MSG_MAX_SIZE);
-	pm_runtime_mark_last_busy(sdev->dev);
 	pm_runtime_put_autosuspend(sdev->dev);
 	if (ret < 0 || reply->rhdr.error < 0) {
 		ret = min(ret, reply->rhdr.error);
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 744a91a150bc..e5c8fec173c4 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -172,7 +172,6 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 		goto error;
 	}
 	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
-	pm_runtime_mark_last_busy(sdev->dev);
 	pm_runtime_put_autosuspend(sdev->dev);
 
 error:
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index ee61394e73d7..b0d293f62d1c 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -236,7 +236,6 @@ static int sof_ipc4_load_library(struct snd_sof_dev *sdev, unsigned long lib_id,
 
 	ret = ipc4_data->load_library(sdev, fw_lib, false);
 
-	pm_runtime_mark_last_busy(sdev->dev);
 	err = pm_runtime_put_autosuspend(sdev->dev);
 	if (err < 0)
 		dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 090ea3a76892..fe43de1fe96c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -712,7 +712,6 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 			ret);
 
 pm_error:
-	pm_runtime_mark_last_busy(component->dev);
 	pm_runtime_put_autosuspend(component->dev);
 
 	return ret;
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 11b6f7da2882..373f3a125372 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -223,7 +223,6 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 	ret = sof_debug_ipc_flood_test(cdev, flood_duration_test,
 				       ipc_duration_ms, ipc_count);
 
-	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index 8b28c3dc920c..249bd2d6c8d2 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -65,7 +65,6 @@ static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __u
 
 	sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
 
-	pm_runtime_mark_last_busy(dev);
 	ret = pm_runtime_put_autosuspend(dev);
 	if (ret < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", ret);
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index ba7ca1c5027f..9c8a0fbfb8df 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -137,7 +137,6 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 	if (ret)
 		dev_err(dev, "IPC message send failed: %d\n", ret);
 
-	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index aff9ce980429..663c0d3c314c 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -238,7 +238,6 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	kfree(desc);
 
 pm_error:
-	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
@@ -289,7 +288,6 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 	if (!ret)
 		ret = count;
 
-	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
@@ -337,7 +335,6 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 	if (!ret)
 		ret = count;
 
-	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
-- 
2.39.5

