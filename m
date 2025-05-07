Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB41211A11;
	Wed,  7 May 2025 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603142; cv=none; b=EZXLZB/5OopStyLjU/lMBwe4dAf6FAVrEmqPLHEjrg1IihmU37GCPR2zcN9YEtaFunhIhIS8G0dtYj6vPpi4aVC57VwPSeVk5B+bfnZPGWVbADy+UgSKEO+ElWH4Bf/v/B2dM+gpbmToSD8SJiORm5NBkS7Hnsvf04bC4DibKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603142; c=relaxed/simple;
	bh=FoWncUHZ05ggnRvOTTMYwbUhcFb3cRvPVojt8az5VkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzpsXTyjZAsHcqwnGNj7zEjhOLA7o4d4FzNWqNcyq7sd5n27W73X3ikpEIjGhOUCqM2/ghrivZjeYZK75dKUgD5npsTnzS9NsYK0J+opuxcPq/vYVjfKpN7D2lTgDzy0MHp0mbpCSKiac4dUtyQGpdUG+asha+fGcI54rMEav1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JePko0pa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JePko0pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603140; x=1778139140;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FoWncUHZ05ggnRvOTTMYwbUhcFb3cRvPVojt8az5VkQ=;
  b=JePko0pa/BNTW4HGNI+wTk4owA5Hn4D/r+2F/qyBmmF0v9TmxhGEHPvo
   +RrDMwP6QaMlUoJW8qLCEL9xQwaxsNc1iL5PxZFjCPgHTRN/bQbaGevFZ
   y6VzGx3w0oD4qgU/O3duM5F8lWPi08Vg4+k48VsOsiB+YNNbGpZtJYjRn
   xU58LGFe/EQKmIeg7amAaMKjbb+uygrMkrvoWZOaHLSP0M2ImBYS7cnp8
   0zrz5CajDxLzHVvtwceML0uD2+qk7CerOZi+2YzrZBRC6BnT2VVxp6kQ5
   bp0k7k+1dZqGoqTQVTTyrnD3qrpisQ+kKKf1qaVNal02m9+flM0+WlExn
   g==;
X-CSE-ConnectionGUID: ktyWbuqvRkmxYahimm5TDw==
X-CSE-MsgGUID: 3urvVEQgSCan+Bl5hnKV6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35944853"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35944853"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:32:19 -0700
X-CSE-ConnectionGUID: IjxHa7UHQ9W23yHUUIx55Q==
X-CSE-MsgGUID: kd0RLDwdRjuguPFI3EEgHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136271270"
Received: from shalevit-mobl1.ger.corp.intel.com (HELO [10.245.250.18]) ([10.245.250.18])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:32:14 -0700
Message-ID: <7637e816-8c63-4e95-98fc-aea6a4843391@linux.intel.com>
Date: Wed, 7 May 2025 10:33:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] ASoC: SOF: Intel: hda: Fix UAF when reloading
 module
To: Tavian Barnes <tavianator@tavianator.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/05/2025 18:12, Tavian Barnes wrote:
> hda_generic_machine_select() appends -idisp to the tplg filename by
> allocating a new string with devm_kasprintf(), then stores the string
> right back into the global variable snd_soc_acpi_intel_hda_machines.
> When the module is unloaded, this memory is freed, resulting in a global
> variable pointing to freed memory.  Reloading the modules then triggers
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
> Fix it by saving the filename in pdata->tplg_filename instead, just like
> every other code path that appends to the tplg filename.
> 
> Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
> Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
> ---
> v2: Fix typo
> 
>  sound/soc/sof/intel/hda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index b34e5fdf10f1..1767977e7cff 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1069,7 +1069,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
>  				if (!tplg_filename)
>  					return;
>  
> -				hda_mach->sof_tplg_filename = tplg_filename;
> +				pdata->tplg_filename = tplg_filename;
>  			}
>  
>  			if (codec_num == 2 ||

I think the correct way would be to make a local copy of the
snd_soc_acpi_intel_hda_machines array as we might be modifying it:


/*
 * make a local copy of the match array since we might
 * be modifying it
 */
hda_mach = devm_kmemdup_array(sdev->dev,
		snd_soc_acpi_intel_hda_machines,
		2 /* we have one entry + sentinel in the array */,
		sizeof(snd_soc_acpi_intel_hda_machines[0]),
		GFP_KERNEL);
if (!hda_mach) {
	dev_err(bus->dev,
		"%s: Failed to duplicate the HDA match table\n",
		__func__);
	return;
}

or if the "2" is not satisfactory (we _know_ that the array size is 2
for this and will not change):
include/sound/soc-acpi-intel-match.h
+extern size_t snd_soc_acpi_num_intel_hda_machines;

sound/soc/intel/common/soc-acpi-intel-hda-match.c
+size_t snd_soc_acpi_num_intel_hda_machines =
ARRAY_SIZE(snd_soc_acpi_intel_hda_machines);
+EXPORT_SYMBOL_GPL(snd_soc_acpi_num_intel_hda_machines);

and:
/*
 * make a local copy of the match array since we might
 * be modifying it
 */
hda_mach = devm_kmemdup_array(sdev->dev,
		snd_soc_acpi_intel_hda_machines,
		snd_soc_acpi_num_intel_hda_machines,
		sizeof(snd_soc_acpi_intel_hda_machines[0]),
		GFP_KERNEL);
if (!hda_mach) {
	dev_err(bus->dev,
		"%s: Failed to duplicate the HDA match table\n",
		__func__);
	return;
}



-- 
Péter

