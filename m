Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E11DE89B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371037; cv=none; b=MwvI/nA1JOof0mDhiIN7MXd7+YYRcWco9WqGPd4iZHEb24o3Q4/SjPmlWVzBkHvlUhWVz9f0XuwUKw+MmLBlxoeeVKFAZi72Oi7EIds4s0IAJKY46RGCu+0acVbTOm7px7CnVvEhT2s6PVfYeSaI9pVreNW6L5g6mT5fzgCKtpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371037; c=relaxed/simple;
	bh=n1Hvv26+Zpv8SzTuLKYLJ1yZzLAggmKAgUbIT3iJPeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGfINqb/bWNZqUm2/LYZC3Ddrj1HMjcaX5j31rMRF3+deun6JDShS1A8t4nJqPdq7ck2DaE7M0LZk4OHsGMcqbQ2VP+tMzpNIHcxnj7QF9bYivdnmuDialmUF2I4u0dOiS1YJZ+eTh/1YPfVHCOOGZ6WY9yrLzMEXaIzBo0ebHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwGmTrVx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwGmTrVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748371036; x=1779907036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n1Hvv26+Zpv8SzTuLKYLJ1yZzLAggmKAgUbIT3iJPeU=;
  b=lwGmTrVx8NfqBzCd61wVc23TEzorNyKmbB/uHJLZMvREWCFw6jwQfVJM
   ITmJL3HP54Gi5tZew8/JDrUNbr8bAmF9cgYCBGa1yDo81Vg2qYb6Yw9Z/
   z4YD7rC/sM7T3WEwWdyeDpwT1agY34mMhAFGrz6LEvz5PLJvA3c2ruxMp
   bYiC4ghK5KiX7OyYlnoRbby7Mx7kkE54YShv01c/Qk8tAuYB90wIWvmua
   zeT4Fv/61C15uMlXA251j1YVBnuE2dXyGpjHfInEGipvZtefuA/grgMwG
   XOIM5jgpVJ8NSHTf7PJBdJ28O6FnzZruyrBFJQA1IWy+5mIy4VdnirOqo
   w==;
X-CSE-ConnectionGUID: NkGUNeGTTHShxP9epDpD9w==
X-CSE-MsgGUID: ncbOz6mMS8mCuvTQ+BP0Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49488059"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49488059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:37:15 -0700
X-CSE-ConnectionGUID: QP7Y5iKzQTiQfK4EH1nU1A==
X-CSE-MsgGUID: 5qVzn4b9QGOkky5MxopYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142896602"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:37:10 -0700
Date: Tue, 27 May 2025 21:37:07 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"De Marchi, Lucas" <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>,
	"Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
 <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Tue, May 27, 2025 at 11:55:13AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile
> > memory device
> > 
> > On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on DGFX
> > > with GSC/CSC devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void xe_nvm_init(struct xe_device *xe)
> > > +{
> > 
> > Same as patch 6, please handle errors.
> This device failure is non-fatal for Xe, caller will ignore
> the failure anyway.

Same as patch 6, let's atleast have the readiness.

Raag
