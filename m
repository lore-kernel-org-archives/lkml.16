Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01A28A40A;
	Wed,  7 May 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631729; cv=none; b=iRwsQH3vva/MDZVURbtBYW+MeG0cKxZfWlVwMAm0NyjDX2rJGS7oVWlTlI7IxkHj2W3swPUBtu63t0o9hI9cIqHIrx8Jncbrd/XowwWpTwD1TCcSAExh1aC5sltgfNAXfmsepBoLk+t/QiNbOLvs/ePRa/U6LXkU7qEz+msSkU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631729; c=relaxed/simple;
	bh=U3gqx9HJDrBUxRXpFQ0kGmgcPR6L+B/y4mEAOBvP1VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYZP17GGJN1x8mLKzJ38iS6anjNtuTzgxLlGklgm8HD/ndlpW3b0t/u0uR6tDbqT8+F3W7PVpv9LKMQfHn1U8t5DDyoyJ0FWnBYqZADpKNt0XRJaTCnHBHMbBsYSPfvMYXA/dYZwga7n88MaN22iSBDPX6nxoFWPhoeSU65Ac30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltby96jY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltby96jY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746631727; x=1778167727;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U3gqx9HJDrBUxRXpFQ0kGmgcPR6L+B/y4mEAOBvP1VE=;
  b=ltby96jYdDoKeZTXqerJZLNLrak4ZiZV1Qz7TnQA4d75bwwC8f78H/k9
   nHxmJJ7UDyHYu6SO8mEjrFEDtH7nCnrU5z4LwZnqDaiXqMB9ln0r4/1fk
   A3sPwsjP5K9E374wXtwPXVsE5/pDK0GibMnLJvDKc5giUeYy4LfE8sh4B
   PxquWKdsOSlef3W9i/IdFL6PC9a+xIr75gfzJvZFEFQhznfIAVRYBsEWE
   Y7Z3KOn+4SZXFfrmJhfFZL4HvOUsggxPUPelILXvGd25EbHvJ4fXy74vc
   0pxXmD8Ecmf3/clyCN97nU1pAQpKoZLfkjRYTH+x3MtQrSGS6P2pn++4f
   A==;
X-CSE-ConnectionGUID: oiu4cotxTl2JIrkRw7Pp/Q==
X-CSE-MsgGUID: iOSfXmOATp+wMAFXvwzh3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36003902"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="36003902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:28:47 -0700
X-CSE-ConnectionGUID: qJxKP7HQSsqZicpk6Mrr1A==
X-CSE-MsgGUID: OB7GjsU/QqyFV3H/aeBaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="167057498"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:28:43 -0700
Message-ID: <40ac692b-2a97-4b4c-a9f5-47601571f6f3@linux.intel.com>
Date: Wed, 7 May 2025 18:29:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: SOF: Intel: hda: Fix UAF when reloading module
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
References: <fb47a18bdea9e9f86d6fccf1d881434cda3cd5f0.1746627007.git.tavianator@tavianator.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <fb47a18bdea9e9f86d6fccf1d881434cda3cd5f0.1746627007.git.tavianator@tavianator.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 07/05/2025 18:10, Tavian Barnes wrote:
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
> Fix it by copying the machine with devm_kmemdup() before we modify it.
> 
> Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
> Suggested-by: Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
> ---
> v3: Copy the whole machine struct instead so we can safely modify it
>     (instead of storing the name in pdata->tplg_filename, breaking other
>     fixups).  The problem with v2 was pointed out by Bard Liao, with the
>     alternative fix suggested by Péter Ujfalusi.
> 
>  sound/soc/sof/intel/hda.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index b34e5fdf10f1..cbf96b342005 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1049,7 +1049,13 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
>  		if (!*mach && codec_num <= 2) {
>  			bool tplg_fixup = false;
>  
> -			hda_mach = snd_soc_acpi_intel_hda_machines;
> +			/* make a copy so we can modify it below */
> +			hda_mach = devm_kmemdup(sdev->dev,
> +						snd_soc_acpi_intel_hda_machines,
> +						sizeof(*hda_mach),
> +						GFP_KERNEL);

We need to copy 2x the size as the snd_soc_acpi_intel_hda_machines[] has
two entries, the second is the sentinel (all 0).

> +			if (!hda_mach)
> +				return;
>  
>  			dev_info(bus->dev, "using HDA machine driver %s now\n",
>  				 hda_mach->drv_name);

-- 
Péter

