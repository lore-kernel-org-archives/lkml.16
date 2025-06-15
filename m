Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1F6261586;
	Sun, 15 Jun 2025 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749977922; cv=none; b=cAM/w6KOPUJa3Uz14nCz3qEHaJN5EA5nBxsweTHQtvbly2X9yhUds0dLSWbmhz2BVKymKCCUeSLIAxOwnfiB72YvX5n1IH1IUck9tEcrjBdbLSVlElQXpVJ4w7IfJw2VOO7ACixDpyFP8p5Q+rInLAQ7FpT/ImS1fCoQb+38ZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749977922; c=relaxed/simple;
	bh=vd9EWcG9WB3a/aRk95MO6cgl/oduG7IEefBMkFtrx/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMci2XaveajqsSaQVucWq1X3B17XBoqN18CbPxYwPraE7k9PXr7wqcFSDKfQnussFfcjPdUee67OfGNSGGh5vvnfRZ2QCGaNaZf8g+UpJ2FsO6l7Z9Szer7je3MsC5i7oOcxPfOuq2SrRzU2XdaDf+aCo5RPYSofxQiTfMpslV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYgoVdMb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYgoVdMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749977920; x=1781513920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vd9EWcG9WB3a/aRk95MO6cgl/oduG7IEefBMkFtrx/U=;
  b=IYgoVdMb7R7Ow0Uw2tV4O/hUX+grfsc7Zf7rL1AaqN+bihJ4gCW9/DGP
   Rqvwq6XFnj3efJflNH9LbeTC8TuuKNAdHGF1CV9zDZJ+0tgpOpcC3l4AT
   SrARM2hxR7rkNB6WrlqyuJ6JOVmMSlHhttbaqy5wsSGdlK+wR+dlxLz8H
   sg5qEa2yD2hHYsOU9lhBaxA7KFUUqfivt7A/omQk+HVx0QlmtI76Ez8n0
   dyAd0uAxldYJ/GfW62TPO95THIgeOqInCONL98QDYv+khmX0SS3cg7STn
   XOPOWKLPG79c/MfMo6cyyqeW9JGIEghoY/23eKKZhyYc+Av6WZe8ATOQQ
   w==;
X-CSE-ConnectionGUID: bAJ1st4wToGLASZ1kfuORg==
X-CSE-MsgGUID: dz+xYzlASNW56P9BGBwZlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="62748806"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="62748806"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 01:58:39 -0700
X-CSE-ConnectionGUID: xFOJF83dRSGTCkUmbw1xtw==
X-CSE-MsgGUID: m6FSb+f4TFWUuajt+B8hTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148094278"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jun 2025 01:58:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQjCE-000EDo-0E;
	Sun, 15 Jun 2025 08:58:34 +0000
Date: Sun, 15 Jun 2025 16:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32}
 to user_access_begin/user_access_end()
Message-ID: <202506151632.jvLtNHPb-lkp@intel.com>
References: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/ALSA-pcm-Convert-snd_pcm_ioctl_sync_ptr_-compat-x32-to-user_access_begin-user_access_end/20250612-185240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to user_access_begin/user_access_end()
config: x86_64-randconfig-008-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151632.jvLtNHPb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151632.jvLtNHPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151632.jvLtNHPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/core/pcm_native.c:4033:
   sound/core/pcm_compat.c: In function 'snd_pcm_ioctl_sync_ptr_x32':
>> sound/core/pcm_compat.c:473:70: error: macro "unsafe_put_user" requires 3 arguments, but only 2 given
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                      ^
   In file included from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/compat.h:17,
                    from sound/core/pcm_native.c:7:
   arch/x86/include/asm/uaccess.h:532: note: macro "unsafe_put_user" defined here
     532 | #define unsafe_put_user(x, ptr, label)  \
         | 
>> sound/core/pcm_compat.c:473:9: error: 'unsafe_put_user' undeclared (first use in this function)
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |         ^~~~~~~~~~~~~~~
   sound/core/pcm_compat.c:473:9: note: each undeclared identifier is reported only once for each function it appears in
>> sound/core/pcm_compat.c:473:73: error: 'Efault_wr' undeclared (first use in this function)
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                         ^~~~~~~~~
   sound/core/pcm_compat.c:473:71: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                       ^
>> sound/core/pcm_compat.c:473:82: error: expected ';' before ')' token
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                                  ^
         |                                                                                  ;
>> sound/core/pcm_compat.c:473:82: error: expected statement before ')' token


vim +/unsafe_put_user +473 sound/core/pcm_compat.c

   405	
   406	static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
   407					      struct snd_pcm_sync_ptr_x32 __user *src)
   408	{
   409		struct snd_pcm_runtime *runtime = substream->runtime;
   410		volatile struct snd_pcm_mmap_status *status;
   411		volatile struct snd_pcm_mmap_control *control;
   412		u32 sflags;
   413		struct snd_pcm_mmap_control scontrol;
   414		struct snd_pcm_mmap_status sstatus;
   415		snd_pcm_uframes_t boundary;
   416		int err;
   417	
   418		if (snd_BUG_ON(!runtime))
   419			return -EINVAL;
   420	
   421		if (!user_read_access_begin(src, sizeof(*src)))
   422			return -EFAULT;
   423		err = -EFAULT;
   424		unsafe_get_user(sflags, &src->flags, Efault_rd);
   425		unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
   426		unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
   427		err = 0;
   428	Efault_rd:
   429		user_read_access_end();
   430		if (err)
   431			return err;
   432	
   433		if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
   434			err = snd_pcm_hwsync(substream);
   435			if (err < 0)
   436				return err;
   437		}
   438		status = runtime->status;
   439		control = runtime->control;
   440		boundary = recalculate_boundary(runtime);
   441		if (!boundary)
   442			boundary = 0x7fffffff;
   443		scoped_guard(pcm_stream_lock_irq, substream) {
   444			/* FIXME: we should consider the boundary for the sync from app */
   445			if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
   446				control->appl_ptr = scontrol.appl_ptr;
   447			else
   448				scontrol.appl_ptr = control->appl_ptr % boundary;
   449			if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
   450				control->avail_min = scontrol.avail_min;
   451			else
   452				scontrol.avail_min = control->avail_min;
   453			sstatus.state = status->state;
   454			sstatus.hw_ptr = status->hw_ptr % boundary;
   455			sstatus.tstamp = status->tstamp;
   456			sstatus.suspended_state = status->suspended_state;
   457			sstatus.audio_tstamp = status->audio_tstamp;
   458		}
   459		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
   460			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
   461	
   462		if (!user_write_access_begin(src, sizeof(*src)))
   463			return -EFAULT;
   464		err = -EFAULT;
   465		unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
   466		unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
   467		unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
   468		unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
   469		unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
   470		unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
   471		unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
   472		unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
 > 473		unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
   474		err = 0;
   475	Efault_wr:
   476		user_write_access_end();
   477	
   478		return err;
   479	}
   480	#endif /* CONFIG_X86_X32_ABI */
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
