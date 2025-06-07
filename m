Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C719DFB4;
	Sat,  7 Jun 2025 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304679; cv=none; b=nSun0VvUoBx73ZPzvyDNgsgb4XZHAuwnCGy6OygRxrCoIuzSce/ZhIAHOg9GeelAS2cd45HMfC9TG8Bv4OhzdcVvdR/Xgq0jYE2KGxP/FQnOCMqDG0ebx8xMTo1eT2Gd9houoOaxwOdhvj0i0DWUQZ1/Eijfp+AMcYBOTg6gp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304679; c=relaxed/simple;
	bh=ZkklqS7arFxbNibCDzdIGbIBOtXlERPPHbvd6SA2j70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QETnayVtLuABXSHPgyMC8RJlBcNrWmWE0M/DV2+8LZTvMpvMfxwuCkbb7Uh3+Ftx7yFjCzVRGJ5XDIebFYVLHyAhAC+QQFNz4xhXCK+2lWQsYKly3RZRGnjtQshsFTZqNhGsfTf/8cjZMhWvpRO+V0PtZjbwnn6U6hTtVZDQI3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2TBhhDx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2TBhhDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749304676; x=1780840676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZkklqS7arFxbNibCDzdIGbIBOtXlERPPHbvd6SA2j70=;
  b=Z2TBhhDxJfkxkZ68KJo2IQ6N1667wuvH33qUtiSoE1MTiqzmAd9aFHo3
   EAnPygF7mJLE1Ezg1OhKnitZtv+XlpNWz1EkjdgvexQHDqbePBHuUuzeG
   pTWNDJuj90+jQHjl4Pg72LovYhbOm8GNVDFL5M3MDamq1QYXl+iTH64rA
   Ex2h/wy/54pQ8Cu/4w75DzQBjCDCI5YYp+RvqIbxbh6Ho8gNAUeO8T2VH
   ANRKAUJvtjf4kLEzVaruDXmkPuGxs1B5aepbEHJRL9Pu7W7mj2YaFMzJs
   ABJoW++YB7AqaJdd62cduxqAkLNPLHM2hEK7MFst7FhlcmyeFF3ibxISZ
   A==;
X-CSE-ConnectionGUID: Izy+m8uWREG+op/nbKwxFg==
X-CSE-MsgGUID: hZ/91P3eR8WRYcP8TSXFJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51436321"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="51436321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 06:57:56 -0700
X-CSE-ConnectionGUID: vCNHFlBhTvi4yv6Wq1O+Mg==
X-CSE-MsgGUID: xtUWFEO4R626dZrg6ZVYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="146077328"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2025 06:57:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNu3T-0005ov-0i;
	Sat, 07 Jun 2025 13:57:51 +0000
Date: Sat, 7 Jun 2025 21:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
Message-ID: <202506072119.6uaFEBw1-lkp@intel.com>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/ALSA-pcm-Convert-multiple-get-put-_user-to-user_access_begin-user_access_end/20250607-195119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to user_access_begin/user_access_end()
config: x86_64-buildonly-randconfig-003-20250607 (https://download.01.org/0day-ci/archive/20250607/202506072119.6uaFEBw1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506072119.6uaFEBw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506072119.6uaFEBw1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/pcm_native.c:3068:2: error: call to undeclared function 'unsafe_copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3068 |         unsafe_copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control),
         |         ^
>> sound/core/pcm_native.c:3069:47: error: use of undeclared identifier 'Efault'
    3069 |                               sizeof(struct snd_pcm_mmap_control), Efault);
         |                                                                    ^
   2 errors generated.


vim +/unsafe_copy_from_user +3068 sound/core/pcm_native.c

  3053	
  3054	static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
  3055				    struct snd_pcm_sync_ptr __user *_sync_ptr)
  3056	{
  3057		struct snd_pcm_runtime *runtime = substream->runtime;
  3058		struct snd_pcm_sync_ptr sync_ptr;
  3059		volatile struct snd_pcm_mmap_status *status;
  3060		volatile struct snd_pcm_mmap_control *control;
  3061		int err;
  3062	
  3063		memset(&sync_ptr, 0, sizeof(sync_ptr));
  3064	
  3065		if (!user_read_access_begin(_sync_ptr, sizeof(*_sync_ptr)))
  3066			return -EFAULT;
  3067		unsafe_get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags), Efault);
> 3068		unsafe_copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control),
> 3069				      sizeof(struct snd_pcm_mmap_control), Efault);
  3070		user_read_access_end();
  3071	
  3072		status = runtime->status;
  3073		control = runtime->control;
  3074		if (sync_ptr.flags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
  3075			err = snd_pcm_hwsync(substream);
  3076			if (err < 0)
  3077				return err;
  3078		}
  3079		scoped_guard(pcm_stream_lock_irq, substream) {
  3080			if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL)) {
  3081				err = pcm_lib_apply_appl_ptr(substream,
  3082							     sync_ptr.c.control.appl_ptr);
  3083				if (err < 0)
  3084					return err;
  3085			} else {
  3086				sync_ptr.c.control.appl_ptr = control->appl_ptr;
  3087			}
  3088			if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
  3089				control->avail_min = sync_ptr.c.control.avail_min;
  3090			else
  3091				sync_ptr.c.control.avail_min = control->avail_min;
  3092			sync_ptr.s.status.state = status->state;
  3093			sync_ptr.s.status.hw_ptr = status->hw_ptr;
  3094			sync_ptr.s.status.tstamp = status->tstamp;
  3095			sync_ptr.s.status.suspended_state = status->suspended_state;
  3096			sync_ptr.s.status.audio_tstamp = status->audio_tstamp;
  3097		}
  3098		if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL))
  3099			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
  3100		if (copy_to_user(_sync_ptr, &sync_ptr, sizeof(sync_ptr)))
  3101			return -EFAULT;
  3102		return 0;
  3103	
  3104	Efault:
  3105		user_read_access_end();
  3106	
  3107		return -EFAULT;
  3108	}
  3109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
