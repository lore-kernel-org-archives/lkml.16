Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA2D2820D1;
	Thu, 15 May 2025 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296250; cv=none; b=VGJY5xc2pmzg3Emt8kzYlVcwUJ9ZO3qSeS7lnvxOZpQ8g1bM59poT2MzXYKKNhziqsULnEhwE5PQQPoJiWzACAYLSBF2mgQTKhTaM9KAznFkv51c9XI06vfffW2G2kIiR875eyC/2mvX++ZobbYJbkVFcE9c6CZoozwQ4GCiC5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296250; c=relaxed/simple;
	bh=THKJ2oXHLY+7wr2OH9ge9M0MBGGf76tWox5+99a7hYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5b1XKfAOUMeOYN4Kek3NeJIb1xBBQk8zTqxPW4QLdXpyeaUprDgkuFF7AZJoWDogw8J1Ja54riZFXshXOsCEh2frBxaFKQzy4hMuVQNo0wPTVwQ7kM1zGLZGNPti8YaU4z+Y3Obx+FRms2Mp8vgUIl2/U1D1DHiwrDLdcOxqII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqxQEg+E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqxQEg+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747296249; x=1778832249;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=THKJ2oXHLY+7wr2OH9ge9M0MBGGf76tWox5+99a7hYs=;
  b=eqxQEg+E2jwHl3hi+VpN/sKvua5PM7/+QBse4BC+tkTl9N2HcdbXZim0
   yY3QRdUT2CG+EYhonew9kwJvSqOjCHQfETocoNX7NDu0SpLWmRMD2uZ21
   1cBdIBT7ipsCzWnN2KjvUM5u8mkFm21Yp0+Ahluptgh51vhet8YkYFzoX
   HrSXQxUJGtEVDbMwU47LNrGVuFn3Gv2BErhmlmhpWPLt0iGBD3pX2jgPr
   uQkg5JlC9Zt0mGv1nh6UkcLDqKo/AM1nnNcNFnB2balTi22A1BBZVlpIC
   VyETM38KhjMixpEPnh50mbO14PU+wsNhZFuqAmDorSeldCgF361Lxi7Hl
   w==;
X-CSE-ConnectionGUID: iWYo9YSHSBqGp5j2Wl1lvg==
X-CSE-MsgGUID: Z8gv0nQdSKu1tRLXDXCelg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48905047"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48905047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:04:08 -0700
X-CSE-ConnectionGUID: WdufQpgQSeOBqsZVRunKWw==
X-CSE-MsgGUID: DYCyFVPESzuR+6Pf8INw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138191068"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.202]) ([10.245.246.202])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:04:04 -0700
Message-ID: <69a5dcdd-fa1f-41a8-ad6f-4c2f2c97128d@linux.intel.com>
Date: Thu, 15 May 2025 11:05:17 +0300
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

Did you sent this as a mistake? The v5 patch looks to be the correct
one, this is not.

>  			}
>  
>  			if (codec_num == 2 ||

-- 
Péter

