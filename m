Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E42AE96;
	Sat, 19 Apr 2025 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055288; cv=none; b=nzbHYCKvXuxFwkQlMJ9c9KRb2P48eNPsJbcKOK6ta4v83z/Im8AsQ2Ue8yezdJx4WlMkzK4/LpLwEbBL6ngy9LOlJxsVKOgID96uXh9oatWc+rUPx9ZVQl7Ylxsy+WJ3RtidezWgmCJBDnLNaEwuZbqJAxrWIVQXVrZ0qF7rp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055288; c=relaxed/simple;
	bh=1B1NECF7Um9EjeZ8aeb8TdCHxRkrxV8x+Cv1DGD1UOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp69+ukKZGIOm5ps+U05xyOs09YYT7lyk8bTso6TJWzaaAWzyS63j5Fw+kC0pbJrJw8u9Qkg1IYTtV+DOU9PD1YPYtT7dqvbtuz8zBSxX+m/lQo9yO+hGKighlfMhgdxVYp1v5xXRKjvyUcMwDSDJAhgWCEjsrcM5xU/l5WkO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Er7D1Ge/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Er7D1Ge/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282DBC4CEE7;
	Sat, 19 Apr 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745055287;
	bh=1B1NECF7Um9EjeZ8aeb8TdCHxRkrxV8x+Cv1DGD1UOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Er7D1Ge/22AHl2WX242AHUdEKGv9wqDttuSxbwP27l00DXsV+z+ZwKqTMULb45cjq
	 DSWoIgFQWxpKyKZ6vgF4danEo8TycLfePJK7i7ML+Bd043nvZnMOV4Q6aXx4thdbHT
	 btgJNDI5NoVHPRM4q3GPGywyRfBYV6lC12F/iNPxgctFB3jMlrmyF8a45wW1a9P4xY
	 A3CJIXHOSid84dDRUlcflOi4PvFMMrXVIpyMgqdVfwcCzue3fD4njXDtMur4gf8swU
	 x56ZKzmP49PJP4TNXB8T/NbFdQJmq7MA4z0yIBEbA84Z9mVvRhJhgLAXmbICaYbUf6
	 4F52q7GlrQbaA==
Date: Sat, 19 Apr 2025 11:34:42 +0200
From: Carlos Maiolino <cem@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Hans Holmberg <Hans.Holmberg@wdc.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
Message-ID: <ypoik2o7aedsdmzslodhkpngwxu3qlufdo465rjhbdmmrzu6ux@fkd2ibcjdii2>
References: <JFG83gowJu7PQG7cgkRFCITghKWsYeEpl0cJ6taDtZfbh4UFDCne2aW3fz7CzitHRGYciMHb7iO-Qewa_wteRw==@protonmail.internalid>
 <202504181233.F7D9Atra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504181233.F7D9Atra-lkp@intel.com>

On Fri, Apr 18, 2025 at 12:23:44PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> commit: 845abeb1f06a8a44e21314460eeb14cddfca52cc xfs: add tunable threshold parameter for triggering zone GC
> date:   4 days ago
> config: i386-buildonly-randconfig-004-20250418 (https://download.01.org/0day-ci/archive/20250418/202504181233.F7D9Atra-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181233.F7D9Atra-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
> >> fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
> >> ld: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divdi3'

I don't think there is anything xfs can do here, this likely
requires to be fixed on math.h and make mult_frac be properly built
on i386. I'm testing a patch here and will submit it at least to start
a discussion.

> 
> 
> vim +186 fs/xfs/xfs_zone_gc.c
> 
>    162
>    163	/*
>    164	 * We aim to keep enough zones free in stock to fully use the open zone limit
>    165	 * for data placement purposes. Additionally, the m_zonegc_low_space tunable
>    166	 * can be set to make sure a fraction of the unused blocks are available for
>    167	 * writing.
>    168	 */
>    169	bool
>    170	xfs_zoned_need_gc(
>    171		struct xfs_mount	*mp)
>    172	{
>    173		s64			available, free;
>    174
>    175		if (!xfs_group_marked(mp, XG_TYPE_RTG, XFS_RTG_RECLAIMABLE))
>    176			return false;
>    177
>    178		available = xfs_estimate_freecounter(mp, XC_FREE_RTAVAILABLE);
>    179
>    180		if (available <
>    181		    mp->m_groups[XG_TYPE_RTG].blocks *
>    182		    (mp->m_max_open_zones - XFS_OPEN_GC_ZONES))
>    183			return true;
>    184
>    185		free = xfs_estimate_freecounter(mp, XC_FREE_RTEXTENTS);
>  > 186		if (available < mult_frac(free, mp->m_zonegc_low_space, 100))
>    187			return true;
>    188
>    189		return false;
>    190	}
>    191
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
