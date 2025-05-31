Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7AC4C74
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748701543; cv=none; b=nMzxfRRKVU7VfrGeISJcVQ2aCsGE4MMhqt8kpr+Z9NORTX7YQU/6WeI1klZOXzpScns04HGiYjQg7LHrioNs3xYM2B8JtDspa1kpFUQac/Nl92vMeVLEkDeyACXKZeP24/g/JzQTdGgDXsY7Ms/bKW3in2M2FCZeKJ0bznbKLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748701543; c=relaxed/simple;
	bh=xuDCvCvdHEHm3JsKagYF8rxk9+nEuh+sV/bde5HWyJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfiR+xuGqIp38N+7bBKr1RZn0YElR3IBP9rSxgOTnV+NNZRbJBa0UkJyfRrrQeB7Ppt8Yki7eg5Qa1aJPMM+iVPwfVX2VMwDGy44/+fRsWtDzfqrQa8p00q5LJnqpr7698zZnhKolNY7jGk0pEJea0/MmFg8vFhUbsIws9i00nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1Fcj70a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1Fcj70a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748701541; x=1780237541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuDCvCvdHEHm3JsKagYF8rxk9+nEuh+sV/bde5HWyJs=;
  b=a1Fcj70aj25gsA42UEPI04IY1xMwdjxnKYk7+4QW1JEgOR9KWtQXKtov
   2QIEoMRs1BJMJCfVEp+eJ0MIqYfsROq0mR6x0xdA5ZNPf568CpjAjno4b
   aKzC+ItxvNisjMuYIoM0sRCldUtW+CVqrI9b+lp8sijGibZVQs3Ef6lZM
   2+ySMjmvlYpmBwev8tFnhGo0z9GPFwbxxwMBU8z4ShC2Zq5aWiCTRY5ze
   TsUpb8aJaQAbIWZG+5ukm37AiI2hwbIiJvkDBFBQDaE711t7d9YAVa+0/
   phrjkPK4b9FWyt6ZDYQYkevkEKw7HOJYkTsOZrCQlVf2c06d9uoUfC57K
   A==;
X-CSE-ConnectionGUID: ClLb40EAQMS0KJjhicAPLw==
X-CSE-MsgGUID: 037/w4esQeOxs3fA/UiKww==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61444928"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61444928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 07:25:40 -0700
X-CSE-ConnectionGUID: Xm9pf0XRSJyonE3c40gLbg==
X-CSE-MsgGUID: hzGyegY7QHqecWTpXY6J3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="167324262"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 May 2025 07:25:39 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLN9U-00011S-2t;
	Sat, 31 May 2025 14:25:36 +0000
Date: Sat, 31 May 2025 22:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pohsun Su <pohsuns@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Lin <robelin@nvidia.com>
Subject: drivers/clocksource/timer-tegra186.c:282: undefined reference to
 `__udivdi3'
Message-ID: <202505312203.NmHWLzpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f70f5b08a47a3bc1a252e5f451a137cde7c98ce
commit: 28c842c8b0f5d1c2da823b11326e63cdfdbc3def clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support
date:   2 weeks ago
config: i386-buildonly-randconfig-2002-20250531 (https://download.01.org/0day-ci/archive/20250531/202505312203.NmHWLzpj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312203.NmHWLzpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312203.NmHWLzpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
>> drivers/clocksource/timer-tegra186.c:282: undefined reference to `__udivdi3'


vim +282 drivers/clocksource/timer-tegra186.c

   241	
   242	static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
   243	{
   244		struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
   245		u32 expiration, val;
   246		u64 timeleft;
   247	
   248		if (!watchdog_active(&wdt->base)) {
   249			/* return zero if the watchdog timer is not activated. */
   250			return 0;
   251		}
   252	
   253		/*
   254		 * Reset occurs on the fifth expiration of the
   255		 * watchdog timer and so when the watchdog timer is configured,
   256		 * the actual value programmed into the counter is 1/5 of the
   257		 * timeout value. Once the counter reaches 0, expiration count
   258		 * will be increased by 1 and the down counter restarts.
   259		 * Hence to get the time left before system reset we must
   260		 * combine 2 parts:
   261		 * 1. value of the current down counter
   262		 * 2. (number of counter expirations remaining) * (timeout/5)
   263		 */
   264	
   265		/* Get the current number of counter expirations. Should be a
   266		 * value between 0 and 4
   267		 */
   268		val = readl_relaxed(wdt->regs + WDTSR);
   269		expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
   270		if (WARN_ON_ONCE(expiration > 4))
   271			return 0;
   272	
   273		/* Get the current counter value in microsecond. */
   274		val = readl_relaxed(wdt->tmr->regs + TMRSR);
   275		timeleft = FIELD_GET(TMRSR_PCV, val);
   276	
   277		/*
   278		 * Calculate the time remaining by adding the time for the
   279		 * counter value to the time of the counter expirations that
   280		 * remain.
   281		 */
 > 282		timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
   283	
   284		/*
   285		 * Convert the current counter value to seconds,
   286		 * rounding up to the nearest second. Cast u64 to
   287		 * u32 under the assumption that no overflow happens
   288		 * when coverting to seconds.
   289		 */
   290		timeleft = DIV_ROUND_CLOSEST_ULL(timeleft, USEC_PER_SEC);
   291	
   292		if (WARN_ON_ONCE(timeleft > U32_MAX))
   293			return U32_MAX;
   294	
   295		return lower_32_bits(timeleft);
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
