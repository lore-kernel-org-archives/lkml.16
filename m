Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAEA1DE2A7;
	Fri,  7 Feb 2025 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926290; cv=none; b=MUKsK87YLLNYSQ8Hi9kMCnB/g+L9UFkm/9z5iJ6UiNsuQpUEEs4PYTmaHgL3ia/B5gAD9aSUSU/sqJ0jE5CS6veh2NNTCF6Dj1FWi4DKwIrU3pfloTHnoVmcbnlm5iNuEgcTvJIj1ho+mNi+8tkoyRYqaDH7nmj53q2ESJ1t4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926290; c=relaxed/simple;
	bh=z7AWC7cEJQR2Xez4ESakcjQvGOcNMRHSVon+moZHDRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ0i1vohr4LT7IFGUOUruv8mkHoGP/G9FbVWZugvQfwIXEUlxsqIgjYB+losqO0Q93sn3GN6rDYehr29CBUzrsKI1JXCOIvckaul8pQjFwOp8RRyDTxGLIsGJ/tpNtCOR/boGLFDOTZW+FjbIGh5XAw4bOeLNiheIRTibvYGkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agPYoITi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agPYoITi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738926289; x=1770462289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z7AWC7cEJQR2Xez4ESakcjQvGOcNMRHSVon+moZHDRQ=;
  b=agPYoITiyqgc3Z7CWRdUuZq6CrKYar5bxhF//x0xHs0YWkU8G2MSTsZb
   2i6kD/rBopLlmbb8wfwwQlRKfyWDNo+5MJ4V7hMWQ7DmjSG/6NGNFk+cI
   hR/DA6tUA8bSqj/tX5viOmGlIXTrqudpexEVIzdz+Vg91YcognuGdaer4
   vUBER30RspVTOOjvwf0jTo9vb8RcJ6F5RfcBelTi5N9bbWMSDNyocQZNl
   G5w+elnHFah2anyIwPptKgVPEzxVV0PUTH+KR+2R+ZNInQ2q48dWIsCG9
   Yra87JcYh4RVRfxpV8+0YxnB9kMGqq3Ed/S0JqdZZtcpPMkdSjrZWcC7r
   A==;
X-CSE-ConnectionGUID: k6OeuzvRRHe3p88RKSDzDQ==
X-CSE-MsgGUID: k8muXuEAQySHGgaS02Wx4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27171261"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="27171261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:04:48 -0800
X-CSE-ConnectionGUID: eULHLgzER9+dgkAp4I6OLw==
X-CSE-MsgGUID: fi2GWJneTdq0KGj+SiOweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111282496"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.140])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:04:42 -0800
Date: Fri, 7 Feb 2025 12:04:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <Z6Xoxpa8tKb6Fx2U@ashyti-mobl2.lan>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
 <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>

> > -		if (!folio)
> > +		if (IS_ERR(folio))
> 
> I don't see this patch yet in -next yet (and of course not in
> drm-tip), which branch is it based on?

To be precise, not this patch, but the patch(*) that this is fixing :-)

Andi

(*) "drm/i915/gem: Convert __shmem_writeback() to folios" from
Kirill
