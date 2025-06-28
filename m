Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E6223302
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751109655; cv=none; b=HnvEuKqg9snarOWbXDfT+/tkycWjDMgdbwnuu+hVCJQ0j1E1XgXScCqtRWb1FhqQ1gw80hXZDdWYcJuKwpi8XHD4zll89KUu6nmftwEBBF/3hkGZcIoIkFHEumvgwDjhHBdW8ropCyzwKBFKTXmDxN/Be3SnXqrcG61GSWnB5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751109655; c=relaxed/simple;
	bh=5hRsgFtGknKzSmWy0qbz0oiEOBs4iV/BxLCdUTZiHhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NH5t/4pmO2Xj9LF/w4CFEgeihBg6VYQmypZPR67Q5hSHOGORJvESyt48D8knoIOtWRknpAbSFLUnoAY1hvpJwLXu7UZch9rRF5bHrL/GINkckHAoKKMPKA3MVAnZNMQX/9oDS9yUMOzxLdkTrv2laMBsCvIWTPRre13/Mf+o1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nfs2Bi0G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nfs2Bi0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751109654; x=1782645654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hRsgFtGknKzSmWy0qbz0oiEOBs4iV/BxLCdUTZiHhE=;
  b=Nfs2Bi0Ga3NKUrE31tRc3wAA4jlwPo4yG7eAK8xXxjlVkJ1FG9URPNsH
   0LLHYoJH8wYjOc1gZD0iU4wWhuT7vtLUOpN7UAF+qgyc90SFXLdHblHwb
   zRdsv3+SLTdjKOIj4sTSoYL9wXti8q5QZq+2ktwQoRPOYjll/jt7Ub828
   m+5CEoKacxmA7N+wk5Mnr2fz0CbUVJRfdMHXxxza1SlfEvSmD1bGqoOkf
   +yxDPmwkCIMtoy8kJK5TRdUsy4dqM8AxZgrwJW5x02euM4ZBbOg9lxJnM
   2d/FBNlbhXVhEWBxF1/EV72R2bOmMP4xu0l4PeVfiO5ptGMDRl8aZpcHF
   A==;
X-CSE-ConnectionGUID: Q4C0lueGSbiu/gwmSUG2EA==
X-CSE-MsgGUID: eXh3PwO3S7eL3Ldr+aQx4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="56026415"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="56026415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 04:20:53 -0700
X-CSE-ConnectionGUID: EAQA53eESNyl2C78KB4Yjg==
X-CSE-MsgGUID: Y9a4d4aKQOmy9xTW4jv7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="190199959"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jun 2025 04:20:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVTc1-000X0I-0t;
	Sat, 28 Jun 2025 11:20:49 +0000
Date: Sat, 28 Jun 2025 19:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/connection.c:42:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 43.
Message-ID: <202506281916.wVorCT8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: ee426bfb9d09b29987369b897fe9b6485ac2be27 ksmbd: add refcnt to ksmbd_conn struct
date:   10 months ago
config: i386-randconfig-052-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281916.wVorCT8Y-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281916.wVorCT8Y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/connection.c:42:5-24: WARNING: atomic_dec_and_test variation before object free at line 43.

vim +42 fs/smb/server/connection.c

    24	
    25	/**
    26	 * ksmbd_conn_free() - free resources of the connection instance
    27	 *
    28	 * @conn:	connection instance to be cleand up
    29	 *
    30	 * During the thread termination, the corresponding conn instance
    31	 * resources(sock/memory) are released and finally the conn object is freed.
    32	 */
    33	void ksmbd_conn_free(struct ksmbd_conn *conn)
    34	{
    35		down_write(&conn_list_lock);
    36		list_del(&conn->conns_list);
    37		up_write(&conn_list_lock);
    38	
    39		xa_destroy(&conn->sessions);
    40		kvfree(conn->request_buf);
    41		kfree(conn->preauth_info);
  > 42		if (atomic_dec_and_test(&conn->refcnt))
  > 43			kfree(conn);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
