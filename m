Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E11DF738;
	Thu, 29 May 2025 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748543507; cv=none; b=UDcGpsUrdbZDLsAmIod/xl/gp7CG9bG9YhgohQ6+KWuKxnntH1MdWoMF1RtiUpBSMTKIKpaMYtJh+iIsb8gEglxD8PuuMf5/7ByTT6jIrf2bO510vx2R1tfuOePRqLo7dv81v5aNFYAIisCsmqkFrnJJp5dWoBKVOnDk+8cy1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748543507; c=relaxed/simple;
	bh=tvdb9zj58cvDAS6PCxKYpi5glIKRt4zKu2kRcZVy9DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haB4F+/pySYPtvptMGCGkY0NuSRa5der7TPpD3CkaQ6EvKxKPbZFib50vDKX9F4PQRsjdyM/4iIwIvSvYhDf3jXsUd+Y+048GI0iL7YM+iZHxwGWCPEYdMuOQFK/PcIHNOJneY6EHBVFKEB0lSGTEe9/5i07MiRthnMDUtaxj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiZMtIuU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiZMtIuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748543507; x=1780079507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tvdb9zj58cvDAS6PCxKYpi5glIKRt4zKu2kRcZVy9DQ=;
  b=fiZMtIuUAgKTAU+2dTe4YGP6XcXKtGy2hMhBJxrY4SXWRSlnsgGrdBoj
   FowGOaVgRmqeK/XyqUp0zj/8jXu4ffa+Or4JbnB9brsbaV59GLxUcPicP
   J0yG9F/yieFrwv9VvrgzYBoTetEY3VPehoni7bgJsGzQ3wqbs/kQwWh1Y
   jqJVZu5qRYTq68MKv+PetG6v+xgdcj5SOaioic/IVfT0I6zZYgU6ynGDe
   GphrDmM0AAAq6cax7WgFsqKBcKIGuQ9kCoE2inLi3mBsJJyWWMqiX0+S+
   t+fzFzuMoqUYNH21H4vZ8wxRhshrMGJOquXPiCWk1myAc5rj1v1npzi3A
   g==;
X-CSE-ConnectionGUID: YeJOY621RHyVTHpcJnJ90Q==
X-CSE-MsgGUID: tE3Stl7USDeBDo9x6xKZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50769479"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="50769479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:31:46 -0700
X-CSE-ConnectionGUID: bRKXYJWESgqIGlos4DB4sA==
X-CSE-MsgGUID: 68CCrVNmQRKAO7a4zuL43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="143472020"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2025 11:31:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKi2W-000Wz6-14;
	Thu, 29 May 2025 18:31:40 +0000
Date: Fri, 30 May 2025 02:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to
 yaml format
Message-ID: <202505300219.7v1CVviw-lkp@intel.com>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529164822.777908-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-display-convert-himax-hx8357d-txt-to-yaml-format/20250530-004954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529164822.777908-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505300219.7v1CVviw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300219.7v1CVviw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/himax,hx8357d.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
