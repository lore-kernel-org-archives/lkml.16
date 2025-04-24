Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF114E2E2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527555; cv=none; b=cgZ02JKmXy+VMW2ndt7YiRIs2P8eos4vkAcig5phd/UZl4HBETdqDMt4tRDRq7NjkSWXRR5sM1szS/eCqHmTDpc33u93+bHz1ewS/DqeeLdUeVb+G0rZor7NmbbmtN7XLf6e/5NVp6YpCv0VZA0HDLJxPE6SC/gvk/6wJunHv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527555; c=relaxed/simple;
	bh=n+aTDLXwam16d7Jw0KV6JznaHn3Vfm9UniyBCXnD1hQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sC+u27nSnuI9uW7xIuy8KeBvXRtpdBFJvX1HSJjhtddNwV0g8Siudci+ob8YVIZqO4C4bRHjA8sBPJFO3vrcEurfKGY0Zf9tzvfAX9HV5qbtuymCvK39AJiZsyDDK/19GejYVbRiDq9xdDNmcJNNxOQMQsgx4B4MMHlAZrOtpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtXwAhw1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtXwAhw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745527554; x=1777063554;
  h=date:from:to:cc:subject:message-id;
  bh=n+aTDLXwam16d7Jw0KV6JznaHn3Vfm9UniyBCXnD1hQ=;
  b=dtXwAhw13wqFVNvIQ+NLx+7DOZLtmkUMX5Gqi3NAsQsz6TTUaZBNB25Z
   nGLF1F2alXoePjlXgYozVwJdstnUdgj7rFt6rdVlZ8lMpHpUylCK0Lti1
   BbR8akFD/xDqzpQ6UN9mKpYCNm3a+9CTuSyjSQSiZ66F6NrR0F98VReG3
   FGJNskCJVYrWIpTlR7TCahcmg7JdQ3EvCJhRAh7CajHMS3BFkQFCsIYIv
   VQQz6yWzLRCNyJh7kWMlDAzE6YZtAscA9a2rpNY1vmFAMMqdZF5e5RDZQ
   JVrvgJJhuuLmFz1+dip6ZSOnpMMzaB6NGaIk8qxUCWd60hXVGxAJiApR1
   A==;
X-CSE-ConnectionGUID: w/tIaQ82Tomlwif+rM9xXw==
X-CSE-MsgGUID: mBaE/IcUR2+f3JcRAk9uwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58555841"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="58555841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:45:53 -0700
X-CSE-ConnectionGUID: UvQcsuW8TCa9uDmV3U3ySw==
X-CSE-MsgGUID: PLa+iQrARWKnT+zRY7/zEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137717380"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Apr 2025 13:45:53 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u83S9-0004Zf-2J;
	Thu, 24 Apr 2025 20:45:49 +0000
Date: Fri, 25 Apr 2025 04:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 f8bdf90d8f5e0b2636b74318305f470fe09fab9a
Message-ID: <202504250400.0z4uxM2X-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: f8bdf90d8f5e0b2636b74318305f470fe09fab9a  fixup! rcutorture: Complain if an ->up_read() is delayed more than 10 seconds

elapsed time: 1456m

configs tested: 6
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386  buildonly-randconfig-001-20250425    gcc-12
i386  buildonly-randconfig-002-20250425    gcc-12
i386  buildonly-randconfig-003-20250425    clang-20
i386  buildonly-randconfig-004-20250425    gcc-12
i386  buildonly-randconfig-005-20250425    gcc-12
i386  buildonly-randconfig-006-20250425    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
