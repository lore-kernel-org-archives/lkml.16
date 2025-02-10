Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70486243962
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207674; cv=none; b=F1HTFFL0eZCuo26rmW5gpZno3lRd7LKoAnUz8U/jBu+Y9aYAQTy7NBAEMxO+sCwCpeO8FGVEAOXtCIdrVZXsK4c6STiIXPJjx9FQMqgw+YT7xeJBVAHDja4Jgk8gov4UlQouZWCVwnsRGaNERMWlyExjusAp8TGaaLsNGx+JPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207674; c=relaxed/simple;
	bh=k6jr/CXwdRmaoLu7HUpsxgJQUi8x5nLNa87iazaBooU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxtmR34l3aa2biQymZTVeqbcWGS2QIoRKmPTkCgQWzITHthAD5CkbIIGuluJEFdHISDDDRBYUmnoAgGdKY5Kaco/INt6TlL3kRicHkbY/xd9fS4cQLDRihmgKWQkjwHaHHO2Tnm7P3ST3zMTB0YLe4SWO2YOIBi66BMFaMO96Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDQ0pxYc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDQ0pxYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739207674; x=1770743674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k6jr/CXwdRmaoLu7HUpsxgJQUi8x5nLNa87iazaBooU=;
  b=PDQ0pxYcWgCb1YKGMO3iv6soXzvmp7GpfY159U/EoDw97eHpRbpqOJ6p
   lQMJBlvBc02SvXRfnAUmYyNutBzpjnzWZZs23HYh3XxyNH+KQMk3635Y8
   amj4ruk5QCbsRqXqd3d8HxDKgiUut5DXmiCVMrIA+eZ+ZPQRYzZSiqfTL
   SqpBKYXZkJDvhwPxqtB8kbB05g5beMSld8Ad137Q/ZoGCb3rP4OR5cxNv
   hI6ThSKg4+Kebm8Ll9aSfzQL6OXkC+BCvfNhEcV2WbSzJnbVkUVjO0EZr
   bqToRg7yTp8uUuS0MGNgp/2XNY05YjD7wJJFrh7h5tZmbVu568NGuQVz6
   Q==;
X-CSE-ConnectionGUID: XNmzfm/SSd6rXBTFg3euZQ==
X-CSE-MsgGUID: lCrvjJUaS+iVcdOk+PpLog==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39913609"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39913609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:14:33 -0800
X-CSE-ConnectionGUID: uCW4ge7GRuuIoq8y+/x+HA==
X-CSE-MsgGUID: 8nG1jYcYQ9yPrbIkrQwrhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135506354"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.18])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:14:24 -0800
Date: Mon, 10 Feb 2025 18:14:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Qiang Yu <yuq825@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915: Constify 'struct bin_attribute'
Message-ID: <Z6oz7VJ7jW9qirxk@ashyti-mobl2.lan>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-3-210f2b36b9bf@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-3-210f2b36b9bf@weissschuh.net>

Hi Thomas,

On Mon, Dec 16, 2024 at 12:34:49PM +0100, Thomas Weiﬂschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
