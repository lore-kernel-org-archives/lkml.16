Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604821ABDA;
	Sat,  7 Jun 2025 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296028; cv=none; b=X/LuX1Ho5jsTIQqPnob6VKEQfOp7ThP0fXyA0IKvwgYthhDwFX9SIjCxHoMzGdEsb2jZu5G/VFGaMcP1CSYbDcyspyY+FfhsJASF/IzRfBsZsUhxnY1IzIl+IGRrxLH4OmDoqoNyuPUgJeTYI1Ely9UpbLscSsCcCRHT62I9YcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296028; c=relaxed/simple;
	bh=0g7hoOerIOQNYsd6/wmzKfkKmANJk3il76EdoP2oeW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3xnlbdPMqm5cMuXJ+5HV9L9aqV8m34iz97cnPY7q5PKgsgVA64uexHUlErmU/8tqu2y0vEOTpH4KrYagEbVD3B6C4glht6scteUwLlULTuH9C1B8zZPrJg1LXwMa4dxj9CCpq3aB28Y/qoFXL14D2c67EEd1jtg21FdcE0RKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+ANMF3o; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+ANMF3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749296026; x=1780832026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0g7hoOerIOQNYsd6/wmzKfkKmANJk3il76EdoP2oeW8=;
  b=i+ANMF3obXN9uLQYU6Hyrq5Tb/ipHDK0iLDNTz6OKNRD6sdDNm4Y0u0p
   PxLSE40BAq23sesTFfOSKwMLVCf1w6CdOZvxu5ohyhdhIG4HeM6VNmEC1
   HhbZhSjMDCm071DHnwT/gT0IQVReGt/FUh/L6rV5faQ8gKH72boT/iVOw
   kvxDPo0xlGyH9fss7hD5F+0YnQgUzN8xM3Fa88Id5l+QtvTWJVYaYd97I
   GSBs74CcsPGZ/9pyJCoLuxAmIvRf72asybAy46Kn7h1mBgaD6W1NlTh60
   m1v+Ez8zNH7cPsyGiW6b6xKkhBxvSNR5H7cs/VfmBDp/A9HaqwD1tdBXD
   w==;
X-CSE-ConnectionGUID: 4pvSgrhfSuCQsH55w9r3kA==
X-CSE-MsgGUID: lDDTYxoNQPe6JSlYBtMjsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="50662883"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="50662883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:33:45 -0700
X-CSE-ConnectionGUID: kU5UxezZTvSUUmpa+h2osg==
X-CSE-MsgGUID: 3qc73xTIRK+s+pWOwIKUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="147001012"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jun 2025 04:33:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrnw-0005kz-2g;
	Sat, 07 Jun 2025 11:33:40 +0000
Date: Sat, 7 Jun 2025 19:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, abd.masalkhi@gmail.com
Subject: Re: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC
 EEPROM chips
Message-ID: <202506071933.QIYSWX1a-lkp@intel.com>
References: <20250606120631.3140054-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120631.3140054-3-abd.masalkhi@gmail.com>

Hi Abd-Alrhman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-linus]
[also build test WARNING on soc/for-next robh/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus v6.15]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next linus/master next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/dt-bindings-eeprom-Add-ST-M24LR-support/20250606-201000
base:   char-misc/char-misc-linus
patch link:    https://lore.kernel.org/r/20250606120631.3140054-3-abd.masalkhi%40gmail.com
patch subject: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC EEPROM chips
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250607/202506071933.QIYSWX1a-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071933.QIYSWX1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071933.QIYSWX1a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/m24lr.c:341: warning: Function parameter or struct member 'is_eeprom' not described in 'm24lr_write'


vim +341 drivers/misc/m24lr.c

   322	
   323	/**
   324	 * m24lr_write - write buffer to M24LR device with page alignment handling
   325	 * @m24lr:  pointer to driver context
   326	 * @buf:    data buffer to write
   327	 * @size:   number of bytes to write
   328	 * @offset: target register address in the device
   329	 *
   330	 * Writes data to the M24LR device using regmap, split into chunks no larger
   331	 * than page_size to respect device-specific write limitations (e.g., page
   332	 * size or I2C hold-time concerns). Each chunk is aligned to the page boundary
   333	 * defined by page_size.
   334	 *
   335	 * Returns:
   336	 *	 Total number of bytes written on success,
   337	 *	 A negative error code if any write fails.
   338	 */
   339	static ssize_t m24lr_write(struct m24lr *m24lr, const u8 *buf, size_t size,
   340				   unsigned int offset, bool is_eeprom)
 > 341	{
   342		unsigned int n, next_sector;
   343		struct regmap *regmap;
   344		ssize_t ret = 0;
   345		long err;
   346	
   347		if (is_eeprom)
   348			regmap = m24lr->eeprom_regmap;
   349		else
   350			regmap = m24lr->ctl_regmap;
   351	
   352		n = min(size, m24lr->page_size);
   353		next_sector = roundup(offset + 1, m24lr->page_size);
   354		if (offset + n > next_sector)
   355			n = next_sector - offset;
   356	
   357		mutex_lock(&m24lr->lock);
   358		while (n) {
   359			err = m24lr_regmap_write(regmap, buf, n, offset);
   360			if (IS_ERR_VALUE(err)) {
   361				mutex_unlock(&m24lr->lock);
   362				if (ret)
   363					return ret;
   364				else
   365					return err;
   366			}
   367	
   368			offset += n;
   369			size -= n;
   370			ret += n;
   371			n = min(size, m24lr->page_size);
   372		}
   373		mutex_unlock(&m24lr->lock);
   374	
   375		return ret;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
