Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A1129E0E7;
	Fri,  4 Jul 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617601; cv=none; b=KMEi1npZQOIuMg9ET33zDkeyFK2x8Bw7fc06/yjtILItEHGy/RJHnGe+lBse+IXYHcgCTFgNc2mUdvOwxZ0gRDd+HFUvdSBMbPMDZ1y4Mw2G+DpATsoYifRzsOjm+7jj632LP7W3X9vJGBIWfcqN6sUiJFuVRzUaCPhVCDlrNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617601; c=relaxed/simple;
	bh=tpOePvuS/rtwf9Yos7ZmASayusy4h1VU45IOLhIRZas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyeu2WfoXSf0o9PU8DTipdqATjS10d4dPEclyBcGOnCt1pOG5AdAwZaNJUCTTDvksqNkiGzRu+fFSle6XJVM2Qy58MFbClyN4iOw3g7i831KMiNAGREV6SSf6gMy5OlOxvLL9H15JC9WF0Rgho9GZ1isIOz2TUy4jZbTTI6O2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkbcZZFG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkbcZZFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751617599; x=1783153599;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tpOePvuS/rtwf9Yos7ZmASayusy4h1VU45IOLhIRZas=;
  b=dkbcZZFG8XQ7tTTi/b4k62B4pO0q3uZbZ77yjr18hBC5hfv0yek+iRhQ
   tTvSLS0h28jlLAqgWhlOagW/nwy6dHxIcKcwv+A6lTvXnVwjxBOTJ72Da
   x6rLHdDQcEnuiYpdNQecnw5mRQ0QOkqd+NQ6IKUORCjmXQA/LSLxCwcPA
   jFXy9saLrtUOSzqFq5ppaPHnX2Vo00U+RzEfIJ9Vc4LaPV/4C7S7fHf5+
   y1O3OokQwTZADHxl4DHSkR96acxhrYa3iQqkaELcNoxHodp2wzAfucmB0
   fNbx0u0W3jCx2XFC1IuqXPRiOeOqrY8trL/5jqrsCueEbnIdolUPJcbLk
   g==;
X-CSE-ConnectionGUID: tK9jsCqITneVxK81aurkVQ==
X-CSE-MsgGUID: YiKVLRY9SsWKNSl4RCOdZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54093170"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="54093170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:26:38 -0700
X-CSE-ConnectionGUID: g0dS5P9+TvepElwO4Gc/3g==
X-CSE-MsgGUID: F5Oze5hYRyq3rkPDGSClnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="191761696"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.92]) ([10.245.246.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:26:35 -0700
Message-ID: <36559b7c-d77e-4cb0-b8da-e4877bb81943@linux.intel.com>
Date: Fri, 4 Jul 2025 11:26:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 74/80] ASoC: SOF: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075459.3222908-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20250704075459.3222908-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/07/2025 10:54, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  sound/soc/sof/control.c                        | 1 -
>  sound/soc/sof/debug.c                          | 1 -
>  sound/soc/sof/ipc3-dtrace.c                    | 1 -
>  sound/soc/sof/ipc4-loader.c                    | 1 -
>  sound/soc/sof/pcm.c                            | 1 -
>  sound/soc/sof/sof-client-ipc-flood-test.c      | 1 -
>  sound/soc/sof/sof-client-ipc-kernel-injector.c | 1 -
>  sound/soc/sof/sof-client-ipc-msg-injector.c    | 1 -
>  sound/soc/sof/sof-client-probes.c              | 3 ---
>  9 files changed, 11 deletions(-)
> 
> diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
> index 463d418e7200..a3fd1d523c09 100644
> --- a/sound/soc/sof/control.c
> +++ b/sound/soc/sof/control.c
> @@ -196,7 +196,6 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
>  	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_volatile_get)
>  		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
>  
> -	pm_runtime_mark_last_busy(scomp->dev);
>  	err = pm_runtime_put_autosuspend(scomp->dev);
>  	if (err < 0)
>  		dev_err_ratelimited(scomp->dev, "%s: failed to idle %d\n", __func__, err);
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index d0ffa1d71145..b24943a65c89 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -217,7 +217,6 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
>  	}
>  
>  	ret = sof_ipc_tx_message(sdev->ipc, &msg, msg.size, reply, SOF_IPC_MSG_MAX_SIZE);
> -	pm_runtime_mark_last_busy(sdev->dev);
>  	pm_runtime_put_autosuspend(sdev->dev);
>  	if (ret < 0 || reply->rhdr.error < 0) {
>  		ret = min(ret, reply->rhdr.error);
> diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
> index 744a91a150bc..e5c8fec173c4 100644
> --- a/sound/soc/sof/ipc3-dtrace.c
> +++ b/sound/soc/sof/ipc3-dtrace.c
> @@ -172,7 +172,6 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
>  		goto error;
>  	}
>  	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
> -	pm_runtime_mark_last_busy(sdev->dev);
>  	pm_runtime_put_autosuspend(sdev->dev);
>  
>  error:
> diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
> index ee61394e73d7..b0d293f62d1c 100644
> --- a/sound/soc/sof/ipc4-loader.c
> +++ b/sound/soc/sof/ipc4-loader.c
> @@ -236,7 +236,6 @@ static int sof_ipc4_load_library(struct snd_sof_dev *sdev, unsigned long lib_id,
>  
>  	ret = ipc4_data->load_library(sdev, fw_lib, false);
>  
> -	pm_runtime_mark_last_busy(sdev->dev);
>  	err = pm_runtime_put_autosuspend(sdev->dev);
>  	if (err < 0)
>  		dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 090ea3a76892..fe43de1fe96c 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -712,7 +712,6 @@ static int sof_pcm_probe(struct snd_soc_component *component)
>  			ret);
>  
>  pm_error:
> -	pm_runtime_mark_last_busy(component->dev);
>  	pm_runtime_put_autosuspend(component->dev);
>  
>  	return ret;
> diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
> index 11b6f7da2882..373f3a125372 100644
> --- a/sound/soc/sof/sof-client-ipc-flood-test.c
> +++ b/sound/soc/sof/sof-client-ipc-flood-test.c
> @@ -223,7 +223,6 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
>  	ret = sof_debug_ipc_flood_test(cdev, flood_duration_test,
>  				       ipc_duration_ms, ipc_count);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	err = pm_runtime_put_autosuspend(dev);
>  	if (err < 0)
>  		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
> diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
> index 8b28c3dc920c..249bd2d6c8d2 100644
> --- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
> @@ -65,7 +65,6 @@ static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __u
>  
>  	sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	ret = pm_runtime_put_autosuspend(dev);
>  	if (ret < 0)
>  		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", ret);
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index ba7ca1c5027f..9c8a0fbfb8df 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -137,7 +137,6 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
>  	if (ret)
>  		dev_err(dev, "IPC message send failed: %d\n", ret);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	err = pm_runtime_put_autosuspend(dev);
>  	if (err < 0)
>  		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index aff9ce980429..663c0d3c314c 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -238,7 +238,6 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
>  	kfree(desc);
>  
>  pm_error:
> -	pm_runtime_mark_last_busy(dev);
>  	err = pm_runtime_put_autosuspend(dev);
>  	if (err < 0)
>  		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
> @@ -289,7 +288,6 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
>  	if (!ret)
>  		ret = count;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	err = pm_runtime_put_autosuspend(dev);
>  	if (err < 0)
>  		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
> @@ -337,7 +335,6 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
>  	if (!ret)
>  		ret = count;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	err = pm_runtime_put_autosuspend(dev);
>  	if (err < 0)
>  		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);

-- 
Péter

