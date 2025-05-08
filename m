Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CFA2A1BB;
	Thu,  8 May 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728661; cv=none; b=Vx4d6IQiGc8Zcg2wbk37Y2bbN2llAhy1OVVY6aKOuVymga4CR2jeEfUIHftBsXfCbKpHf/OsDQPntBDwl3CyoN0LRnT6ip0g1J+XYFupMYJbt9I8lWQNEbIGiYqyEq/GeF+ygXYjCuzvJPAioBo/z57yRZAxqB4j1DIGDCSGl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728661; c=relaxed/simple;
	bh=wy7Hm7WWE6KUctlNRNHdG2pofR8kbdBCRVqncmV5x1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePQJ/zmea8+pKV2NI+qvQU8mGBSwoDV+U/k7fDXTG8RLjq0qFFWYmeVz81CBGoU0NNMIeEJHSNvcjGEUDjG8r0inOAvgSMoYZVPXo5dj6mt+QskdVD/48L9+pKXbitq77/J39wf0mKsF8jtcXstrBOu4zFZzBHxxPEHdKciAzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0UhHSeZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0UhHSeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746728660; x=1778264660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wy7Hm7WWE6KUctlNRNHdG2pofR8kbdBCRVqncmV5x1A=;
  b=h0UhHSeZ4T2gG2v/e+5U7cm2gDwuYQpIAjOTc47pTNrx8U0E1G6kPO8v
   bPvN1299qjiEcnJQsQxPVntzZeIgs6cWEv7hkZ9Etc5DRbtr3kBmMdpHp
   gPUdJ7PhxDV972iES1qiG3Twqprgt+AliNFDuJJtuNf3BxeIKvFKuzNMR
   GjSWibfbrWpBc2gG1UHpQnuZqOtf8r2YlJU5V3mN9QNNFn5I/RYQfiiZA
   vVsH1jzdV/DzV9jVUaXFK3BKxqhPJmaGiaemIsZmTyIgtuV6MVD2p3+X0
   5QvlF8BtmquhwJIFOmN6xM2EyNnmw1ETRiLZM7Ly5IwWse76OLAt7Euu6
   w==;
X-CSE-ConnectionGUID: lm/P4yWbR4WfjXCQrCxDMw==
X-CSE-MsgGUID: IYrYpp4ySQ2cIANVcfbTBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59528712"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59528712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:24:19 -0700
X-CSE-ConnectionGUID: dqhiX814RE+mTzdjGP/elQ==
X-CSE-MsgGUID: TxG6ibazRVKDkmcTOQouyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136385923"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.123]) ([10.245.246.123])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:24:15 -0700
Message-ID: <b3132bd1-7e00-4443-ba58-a3cbda275e5e@linux.intel.com>
Date: Thu, 8 May 2025 21:25:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: SOF: Intel: hda: Fix UAF when reloading module
To: Tavian Barnes <tavianator@tavianator.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
References: <832255bf606f9ddcf45167d3f066d603d707731a.1746713571.git.tavianator@tavianator.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <832255bf606f9ddcf45167d3f066d603d707731a.1746713571.git.tavianator@tavianator.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/05/2025 18:21, Tavian Barnes wrote:
> hda_generic_machine_select() appends -idisp to the tplg filename by
> allocating a new string with devm_kasprintf(), then stores the string
> right back into the global variable snd_soc_acpi_intel_hda_machines.
> When the module is unloaded, this memory is freed, resulting in a global
> variable pointing to freed memory.  Reloading the module then triggers
> a use-after-free:
> 
> BUG: KFENCE: use-after-free read in string+0x48/0xe0
> 
> Use-after-free read at 0x00000000967e0109 (in kfence-#99):
>  string+0x48/0xe0
>  vsnprintf+0x329/0x6e0
>  devm_kvasprintf+0x54/0xb0
>  devm_kasprintf+0x58/0x80
>  hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
>  sof_probe_work+0x7f/0x600 [snd_sof]
>  process_one_work+0x17b/0x330
>  worker_thread+0x2ce/0x3f0
>  kthread+0xcf/0x100
>  ret_from_fork+0x31/0x50
>  ret_from_fork_asm+0x1a/0x30
> 
> kfence-#99: 0x00000000198a940f-0x00000000ace47d9d, size=64, cache=kmalloc-64
> 
> allocated by task 333 on cpu 8 at 17.798069s (130.453553s ago):
>  devm_kmalloc+0x52/0x120
>  devm_kvasprintf+0x66/0xb0
>  devm_kasprintf+0x58/0x80
>  hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
>  sof_probe_work+0x7f/0x600 [snd_sof]
>  process_one_work+0x17b/0x330
>  worker_thread+0x2ce/0x3f0
>  kthread+0xcf/0x100
>  ret_from_fork+0x31/0x50
>  ret_from_fork_asm+0x1a/0x30
> 
> freed by task 1543 on cpu 4 at 141.586686s (6.665010s ago):
>  release_nodes+0x43/0xb0
>  devres_release_all+0x90/0xf0
>  device_unbind_cleanup+0xe/0x70
>  device_release_driver_internal+0x1c1/0x200
>  driver_detach+0x48/0x90
>  bus_remove_driver+0x6d/0xf0
>  pci_unregister_driver+0x42/0xb0
>  __do_sys_delete_module+0x1d1/0x310
>  do_syscall_64+0x82/0x190
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Fix it by copying the match array with devm_kmemdup_array() before we
> modify it.
> 
> Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
> Suggested-by: Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
> ---
> v4: Copy the whole array, including the sentinel.
> 
> v3: Copy the whole machine struct instead so we can safely modify it
>     (instead of storing the name in pdata->tplg_filename, breaking other
>     fixups).  The problem with v2 was pointed out by Bard Liao, with the
>     alternative fix suggested by Péter Ujfalusi.
> 
> v2: Typo fix.
> 
>  sound/soc/sof/intel/hda.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index b34e5fdf10f1..13ecb9473eb6 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1049,7 +1049,21 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
>  		if (!*mach && codec_num <= 2) {
>  			bool tplg_fixup = false;
>  
> -			hda_mach = snd_soc_acpi_intel_hda_machines;
> +			/*
> +			 * make a local copy of the match array since we might
> +			 * be modifying it
> +			 */
> +			hda_mach = devm_kmemdup_array(sdev->dev,
> +					snd_soc_acpi_intel_hda_machines,
> +					2 /* we have one entry + sentinel in the array */,

I would prefer the comment after the comma.
and I just noticed that my suggestion had it wrong as well, sorry.

With that you can add my:
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> +					sizeof(snd_soc_acpi_intel_hda_machines[0]),
> +					GFP_KERNEL);
> +			if (!hda_mach) {
> +				dev_err(bus->dev,
> +					"%s: failed to duplicate the HDA match table\n",
> +					__func__);
> +				return;
> +			}
>  
>  			dev_info(bus->dev, "using HDA machine driver %s now\n",
>  				 hda_mach->drv_name);

-- 
Péter

