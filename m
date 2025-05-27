Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842741F4C99
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371794; cv=none; b=AzYMdDVEkZaCnj3rQnTTWWzAhi9hPXURgsWmaC28xhdpPKN/8R8RxAJ2b/ZIZKe8666UnnSGvMnogzaYue6SRclp5anUBS7jiX3OFs/41Z/ffZUXiixv8q/b+hjKMMLKgpKmR+Ool1Kmn/fA4ZGmpM0nqEEs3t8wZpdJ6KRijlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371794; c=relaxed/simple;
	bh=4XPP3GOIqEuNTDva7xUb4Pijg8qL5gQlGrrO0uFeFTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRl2eU+ot7bYhXa5NJKzPe42lyKQfAsBQV9zt8zPfdJTDR5SBavc6tN1XiAQsUSW4el+J7aljuucsZNHl6ESibSMNmni2Xa1xuP/r9HOqKeCfNDKw6OMh1FmWmAv9e3SDEduFOi73XjloXcAVpmLukgjSBIA64IItS79VW+nvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt9/Qigb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt9/Qigb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748371792; x=1779907792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4XPP3GOIqEuNTDva7xUb4Pijg8qL5gQlGrrO0uFeFTI=;
  b=Qt9/QigbyUaMDKJCmJglFTiCmWak2kYQ4QKDNT4cBo970gRCwDHFfpSf
   xi6JwV5yZi5jNJYw/H5lindv6MEgU7mUvMH40VUgjzVsPXYENpXrDznvO
   iKj71HaKBLcFK2uYUmGrVPy1OypiTWA2UG6JyWVM/6EFXhF1O8CyvGLVn
   PoAKRO3X7D3+U0f+o4OafLuSfVp9USaDctbaqR+o/yMCqrT5S0pp9Ab7r
   TGiF4tWp9FhRorSinhIUKMSxBaPD3EKNmKRfJT6Qyk4FM+roqQEdaDBAk
   U9bMvHpN611Sy1dAiFl+/sT6ko/BDfA8Es6PwT/VzRdL0lIuCGwSYELf5
   A==;
X-CSE-ConnectionGUID: 1mmDWOJJQauiHCwjedfT4w==
X-CSE-MsgGUID: DaaWwTvbSwW8MnXukLdFPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61431119"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61431119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:49:52 -0700
X-CSE-ConnectionGUID: NTG3c+mbSlWEHG5NEwB8JA==
X-CSE-MsgGUID: ldVFg4/LSoqXZ5tLnXnV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148212316"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:49:47 -0700
Date: Tue, 27 May 2025 21:49:43 +0300
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
Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDYJR8r6BCd6cSe8@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
 <aDGZCL_B3fEkvahj@black.fi.intel.com>
 <CY5PR11MB636674D63B2769B15A79B172ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636674D63B2769B15A79B172ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Tue, May 27, 2025 at 11:33:10AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
> > 
> > On Thu, May 15, 2025 at 04:33:40PM +0300, Alexander Usyskin wrote:
> > > GSC NVM controller HW errors on quad access overlapping 1K border.
> > > Align 64bit read and write to avoid readq/writeq over 1K border.
> > >
> > > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > ---
> > >  drivers/mtd/devices/mtd_intel_dg.c | 35
> > ++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/mtd/devices/mtd_intel_dg.c
> > b/drivers/mtd/devices/mtd_intel_dg.c
> > > index eedc0974bb5b..2f32ed311ffd 100644
> > > --- a/drivers/mtd/devices/mtd_intel_dg.c
> > > +++ b/drivers/mtd/devices/mtd_intel_dg.c
> > > @@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm,
> > u8 region,
> > >  		len_s -= to_shift;
> > >  	}
> > >
> > > +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> > > +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> > > +		/*
> > > +		 * Workaround reads/writes across 1k-aligned addresses
> > > +		 * (start u32 before 1k, end u32 after)
> > > +		 * as this fails on hardware.
> > 
> > If there's a spec definition, we usually mention workarounds with
> > Wa_ID:platform so that they're easy to track. intel_workarounds.c
> > is good reference for it.
> > 
> There is nothing in spec that I can find.
> Not sure that i can formalize i as workaround.

I'm a bit uninformed about the history here, but in any case I'm fine
as long as the maintainers are okay with it.

Raag
