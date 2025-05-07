Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665B1DE3A7;
	Wed,  7 May 2025 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594615; cv=none; b=HgE+T7z8yaSm2JmhxDfximUIhLdV9eeTzvDichEOWUOvZIP3QHiY7daxSKfLqwb5I5bS9/dHy0IgH86L8cj2S6sEOeH008wR+la6aM1eYy6Dj3N0kYfQnvscYP77Yr5uLvmyQ6SdfhWgGC9vdUQ88aXBWvV7cFehmM6bJC+M2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594615; c=relaxed/simple;
	bh=lQRBfRC32IDAASPS7Geerd3Dn5IGKAhisipapRsgEZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFRPg9Cy4bkcr0NTqHcjwgYm8WhfktnQxg9eYwx7MPKI8QN+BhJshv0xwOwIBnqyaANPaf15k6/KNuYoT0FrGgCGHFSi8GG6fzrYPQacFv0+4A6o09VJ2d6Lk2gUxEIUCTe6zf+EqJa8QyGw5u+vh34YRmwIi78fcwmTUlbNEvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En3QKUn1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En3QKUn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746594614; x=1778130614;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lQRBfRC32IDAASPS7Geerd3Dn5IGKAhisipapRsgEZg=;
  b=En3QKUn140L+BMtcnmkr673OwBVA681iluJp7SGcI8dmmcojTRWmTnZ4
   elmuT207PxI+oB3aRUFNrI/uB8hfax0o6t764jq3fbhXj+BQoxMViwk8i
   L/ieMvAvbGxoR/7+PXPM5B+1unSY+0uXmr/UCanIqGTk7DddY/+HxuBn1
   SrRrO9dVGrc4sYYOyqgyGy++dyF/qU7ooi0BJqbo0RHIW73gpOKamIFk0
   qrtHUMSKpgDqMcCKonI+dMwRuXpUp8BP/6n+RotscRvK/Z4l7vQDUqb79
   UO1CZgWDZUJcAKXC8bKF8fw0RFMrYm0ShPOTidKXeYvPyEQgzQ6+gl3AT
   A==;
X-CSE-ConnectionGUID: /bVB5i8+QS+Rc32AEGh9Sg==
X-CSE-MsgGUID: xGbkgiYeRnKRqTh06V29YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65833192"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="65833192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:10:13 -0700
X-CSE-ConnectionGUID: cpHomlQ+SACF0PCVTupp2A==
X-CSE-MsgGUID: 64pk8ejJTDSPEx0DqAtPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="139894940"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.105.120]) ([10.246.105.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:10:10 -0700
Message-ID: <405eaed5-0671-4dc0-a7bc-c4dab8be5e8f@linux.intel.com>
Date: Wed, 7 May 2025 13:09:59 +0800
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
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/2025 11:12 PM, Tavian Barnes wrote:
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

It will break the existing tplg name fixup mechanism. Please see below
in hda_machine_select()
		if (!sof_pdata->tplg_filename) {
			/* remove file extension if it exists */
			tplg_filename = remove_file_ext(mach->sof_tplg_filename);
			if (!tplg_filename)
				return NULL;

			sof_pdata->tplg_filename = tplg_filename;
			tplg_fixup = true;
		}
With the change, sof_pdata->tplg_filename will be set and we won't do
tplg fixup for other components.

>  			}
>  
>  			if (codec_num == 2 ||

