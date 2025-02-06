Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D9239571
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871108; cv=none; b=fqpJCX76rJaxkJFZFfLfWcrcCcUrAUZ9TyXecSBJAn36E2CHAvabwqUytktmXFXPfCT5Glf1dZtbBunD69VFHt0qWZNnVgB+qTj1IU476f1YqIKhtpZ4kUGwJcpW0AOUN9nbyil3qzDLKgwUlpdBarGwd1SZ7HO3Jwh7XC9mGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871108; c=relaxed/simple;
	bh=3jaC5JBOqY1mbTklTusTlSNi6X3ydN5Q4l2Jagv5Rts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2oDsWErbYgbQrxWZY/qJZel/Qi0KyhkV+dYRrF/3u4TVPYbR3RoliDo5OkqvSCqe67rn9Gq2wgzOGtxR+46Ry2ovNh+xwRUsrZxGQo2THUpBDvBXWCcdQv3rdLjyqo6spGM4izT12xBdh6bI2+yqCxwH8z/8glsI8LNwtZ2aJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCVPhYvq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCVPhYvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738871106; x=1770407106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jaC5JBOqY1mbTklTusTlSNi6X3ydN5Q4l2Jagv5Rts=;
  b=ZCVPhYvq8YKTA86k4iV1MFKlaCeaD2DDfBI51dSQtrcZmwrCGGMGxDPs
   Rbh2u4LC50RkrJ0yJoBwCjSvAPcsE+nK1mq4g2PJh9JZ/vQvGdGgmFFLI
   YA2kWjHWibOuoa6Ojb0A6JBsmo/5KKcJz4AJtpImZfCM2fK6hLzkR8dK3
   tW1FvJ6fG4YuhNZaFDAOvDkFSRkBHEKSXNgIjNRoMlyNp3kG3jRQ4+H6d
   TxRcR98NYQiAGI3LxEM2fhF5UtfueyJNOo1v+4Yid17CEmWJ4GTjKjgpf
   xHHmvXkag1xqzO/bRPF1JPfPtfPVxvv1OGxrydY4Z8OOT++MxOkfgGrcs
   g==;
X-CSE-ConnectionGUID: JDWnvmT8QdKdiUW+o+knZw==
X-CSE-MsgGUID: jt3xcqwMQSyLj6bau1/MTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39650444"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39650444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:45:06 -0800
X-CSE-ConnectionGUID: DUKjyIbuSGOu4LD2s4nqxg==
X-CSE-MsgGUID: qOOx51KET0euCpaXAdUrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115926730"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 11:45:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg7o6-000xFz-1q;
	Thu, 06 Feb 2025 19:45:02 +0000
Date: Fri, 7 Feb 2025 03:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Subject: fs/dcache.c:2788:24-43: WARNING: atomic_dec_and_test variation
 before object free at line 2789.
Message-ID: <202502070322.IsdN65Ea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 95a4ccbbe596b45264af5e3a019cb920c05ccffd dissolve external_name.u into separate members
date:   10 days ago
config: alpha-randconfig-r053-20250206 (https://download.01.org/0day-ci/archive/20250207/202502070322.IsdN65Ea-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070322.IsdN65Ea-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/dcache.c:2788:24-43: WARNING: atomic_dec_and_test variation before object free at line 2789.
   fs/dcache.c:407:13-32: WARNING: atomic_dec_and_test variation before object free at line 408.
   fs/dcache.c:407:13-32: WARNING: atomic_dec_and_test variation before object free at line 416.
   fs/dcache.c:368:15-34: WARNING: atomic_dec_and_test variation before object free at line 369.

vim +2788 fs/dcache.c

  2774	
  2775	static void copy_name(struct dentry *dentry, struct dentry *target)
  2776	{
  2777		struct external_name *old_name = NULL;
  2778		if (unlikely(dname_external(dentry)))
  2779			old_name = external_name(dentry);
  2780		if (unlikely(dname_external(target))) {
  2781			atomic_inc(&external_name(target)->count);
  2782			dentry->d_name = target->d_name;
  2783		} else {
  2784			dentry->d_shortname = target->d_shortname;
  2785			dentry->d_name.name = dentry->d_shortname.string;
  2786			dentry->d_name.hash_len = target->d_name.hash_len;
  2787		}
> 2788		if (old_name && likely(atomic_dec_and_test(&old_name->count)))
> 2789			kfree_rcu(old_name, head);
  2790	}
  2791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
