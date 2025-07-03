Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004662E338E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559168; cv=none; b=obKxR5Ova4Iwc4vyhvqAnasxFRNYlQ/ds7X+il7Xiqmz+ziEDUFwAQMBS5fVdjOEw+OPw2yNq4cq+/Glt7K3MXb90PGKEnMoIZPR6hjZH8QXyh0Q2ZSHhOVuoBS/z29jkCCxLPKzhsmcDdLbVmAsgx2gTtkmBMT8gCe8ipN8giY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559168; c=relaxed/simple;
	bh=/1Xcbv7DHWPMWnutmLmYpXLQkI8SK/2SLoif4ibr2W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQZdAI0NWxPton8uEFnQdE2X2QyQme+IR9Qodgzld3Yz1BXMpWic/9UvKG75nmALTNDEucFUS9USowwkVcfnwfTAmuwDKfQ78HokDtfoeH1z0saeOeg0plDriAHBUyl8T7vXR5DwIe3BprtufqzP54QBSekbyoIzDMpsbRa9YEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izPW6UbX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izPW6UbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751559167; x=1783095167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1Xcbv7DHWPMWnutmLmYpXLQkI8SK/2SLoif4ibr2W0=;
  b=izPW6UbXOQlKKIUOM5zS2K4HciEp1AnwTUYLjsWrLMxD2dd/Qh46rp7f
   zoCEGxmeWaJe2beEaFtXhgqOBuIWacr7tKy8KRx3mAs2aQYc9ScImpy1O
   FkXLzBl2qrZOkC8s8HZ6EcBwgbada5ZMuCcYZrlZbKANofQqWD96lHKV7
   AlJi4TSFZcMb/shThKrQpFO2QBNH7f2El3ZSFNt7+njp8TCwhW60neTZK
   FAT8CdcHbjnnkeiM95IKmqTzpIe9uDp0dDo8vrT0S4wynHS9/DkvK4ozV
   3htIGS2ntb1Qq1xBQ/MXB1gMZe/7ZSzWsLinTjTqRl6Dsr7tXQ0Z5mnog
   Q==;
X-CSE-ConnectionGUID: 109OLge2TR+zxsdFgl7I6Q==
X-CSE-MsgGUID: Pcr1YXr9QUmv1UEe06AmpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53761231"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53761231"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 09:12:46 -0700
X-CSE-ConnectionGUID: TJLxhh/LSmeAZJxwGZLaQQ==
X-CSE-MsgGUID: xezOal8XSw23TuHzlyVaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154776173"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2025 09:12:45 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXMYF-0002mV-0J;
	Thu, 03 Jul 2025 16:12:43 +0000
Date: Fri, 4 Jul 2025 00:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Eiji Uchiyama <lucaseiji54@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lucas Eiji Uchiyama <lucaseiji54@gmail.com>
Subject: Re: [PATCH] iio: dps310.c: Remove duplication in functions
Message-ID: <202507032329.6gxPgmu4-lkp@intel.com>
References: <20250702233441.94203-1-lucaseiji54@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702233441.94203-1-lucaseiji54@gmail.com>

Hi Lucas,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Eiji-Uchiyama/iio-dps310-c-Remove-duplication-in-functions/20250703-073628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250702233441.94203-1-lucaseiji54%40gmail.com
patch subject: [PATCH] iio: dps310.c: Remove duplication in functions
config: arm64-randconfig-001-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032329.6gxPgmu4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032329.6gxPgmu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032329.6gxPgmu4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/pressure/dps310.c:553:47: error: too few arguments to function call, expected 3, have 2
     553 |                         rc = dps310_set_samp_freq(data, TEMPERATURE);
         |                              ~~~~~~~~~~~~~~~~~~~~                  ^
   drivers/iio/pressure/dps310.c:309:12: note: 'dps310_set_samp_freq' declared here
     309 | static int dps310_set_samp_freq(struct dps310_data *data, int freq, int mode)
         |            ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +553 drivers/iio/pressure/dps310.c

   534	
   535	static int dps310_write_raw(struct iio_dev *iio,
   536				    struct iio_chan_spec const *chan, int val,
   537				    int val2, long mask)
   538	{
   539		int rc;
   540		struct dps310_data *data = iio_priv(iio);
   541	
   542		if (mutex_lock_interruptible(&data->lock))
   543			return -EINTR;
   544	
   545		switch (mask) {
   546		case IIO_CHAN_INFO_SAMP_FREQ:
   547			switch (chan->type) {
   548			case IIO_PRESSURE:
   549				rc = dps310_set_samp_freq(data, val, PRESSURE);
   550				break;
   551	
   552			case IIO_TEMP:
 > 553				rc = dps310_set_samp_freq(data, TEMPERATURE);
   554				break;
   555	
   556			default:
   557				rc = -EINVAL;
   558				break;
   559			}
   560			break;
   561	
   562		case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
   563			switch (chan->type) {
   564			case IIO_PRESSURE:
   565				rc = dps310_set_precision(data, val, PRESSURE);
   566				break;
   567	
   568			case IIO_TEMP:
   569				rc = dps310_set_precision(data, val, TEMPERATURE);
   570				break;
   571	
   572			default:
   573				rc = -EINVAL;
   574				break;
   575			}
   576			break;
   577	
   578		default:
   579			rc = -EINVAL;
   580			break;
   581		}
   582	
   583		mutex_unlock(&data->lock);
   584		return rc;
   585	}
   586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
