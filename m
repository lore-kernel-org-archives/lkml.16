Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC71D79B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536564; cv=none; b=EI8G89t9GtKd5BfdCwr/vfOH+Hpyb0Rf2Cri4wzcjXLVUMkKFz1Ov81TsTjQureCUGQK6nnfaCYQLBOJdQtZc3vrbk+EiaXO9ehJNcbEfLY+yoaeLGGrc7zuFf4nl+cWG6Gzk8Mf3A648RfbvOM4bCX46WkyrF0FAZXXRUhnNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536564; c=relaxed/simple;
	bh=pQxv5Dt51GqwzaRvw88SWAtlH92vzbXWDPb6VUXwIJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nFSXvljktXIAMz+d8J8WkaqTg11ml7z3WcJt/S1AXe9QX8zHhZKsTD26YF5c0mEHG7yOV5JyilR4arJVFIwbvWmf/dLGotyA4CJpCF58MDrUtkbBJVaRFRbTsAC3iZRT/jf7V9vw6ZcAhjKFQGE+v8ZTIqLuhPgOLO5VheyyzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sb5hfMEd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sb5hfMEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743536562; x=1775072562;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=pQxv5Dt51GqwzaRvw88SWAtlH92vzbXWDPb6VUXwIJM=;
  b=Sb5hfMEd37KiPH8WJ6udn+dNQA4T1KjVqpITNTzURu53oeHMygOCC1oI
   e249hDfCVfQ4PjEZ+lT6v/j8kpe5vlFkhnQY3a2CijC9fy290XGAo5QTT
   GpNu+vt3CxaHDsaP9a+WToUTyi4nv8RLUkPDA9bNo7i/yhQYH3Tc6u5ZL
   iuRiD7/NcF5fbJjfaQkLOezqHEuJwQlXnupmT46KOvGN/1qXlQdHIzgFP
   s9NhHdxvt9Jc33vwIqCH81nD2/TS+klHYP7hAYcpf6HHpBRn026D4e5oH
   mjlEroVLqMZppT2xeR5a4odorizmDVn4Nlc1g+JiiND6/v4zL9rQJwTWa
   A==;
X-CSE-ConnectionGUID: dROArJcKS82R9maRReTbyA==
X-CSE-MsgGUID: SV2C0i3dRx6Pd1cS/lmzkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55538380"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="55538380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:42:41 -0700
X-CSE-ConnectionGUID: TMKqicpOQbePKXBHOY1KMQ==
X-CSE-MsgGUID: qf68Du+PRm29D1/ggkQhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="157421072"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:42:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250401191455.GC325917@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com>
Date: Tue, 01 Apr 2025 22:42:35 +0300
Message-ID: <877c433bys.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> So, I'd suggest a better way to run this is first build the kernel,
> then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> generate a list of headers that are actually part of the build, then
> only test those. That eliminates all the kconfig problems. Opt out any
> special headers that really have a good reason not to be stand alone.

I think we'd want the drm headers pass the checks independent of configs
(apart from CONFIG_DRM). One size doesn't fit all.

BR,
Jani.


-- 
Jani Nikula, Intel
