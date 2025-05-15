Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF9129CB57
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311224; cv=none; b=Evl4xS4zfOvHsM4xY/WPpF6dtG9OQHbwdTD0DRK8/f4H+08sECiFd2ZoN+xSxeCWcxRNr1G5DAf2nUYsUChkI/TGOWdd/z+8Tf43/bXtwAmZs1lJ9VSsJwmBzNQunWXqSl1FOLPPRiVHOKvpwB9PV/NHXd6EgJ0ZYZoPwMSryqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311224; c=relaxed/simple;
	bh=SMzCIxMMZEO9396KBs8rN2h+xUSN4fGX3RDCLaGg6m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLRV0vnVVjwAHK232HbdAZfwa2e5+s02zOyiejCdxoMXlMn+362RVOB3JHm8WcxmxzbtPcCBVTIcqrgnEQ09s9zHfeT+bJmo2la6JCj5cuBLu7YAuU2TQYtyz7s5j1oCmaCLB76YX6voaw8VyOWya10637NxitL/gZHfj9K/ODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/nEksP4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/nEksP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747311223; x=1778847223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMzCIxMMZEO9396KBs8rN2h+xUSN4fGX3RDCLaGg6m4=;
  b=Q/nEksP4GSkatiz0YkufmgnbDu+IrqVsQG+NqE3NZuWkIYMcmCRxrWj2
   mlfAmHXXD+DqZyGtek/b2BqwnHpUBx7wdLuDDEFjTL7wqgUkDSNtk3C5t
   d+aVDpSKSsBHOZjnfQpxO3Jstfjf+sMXDnEdkIgUKEPFsLiQikL4peIll
   DU+ri6RqxW+OCnMEbZiaYLgE7pUbtwr8faaqjBJb06xqVjdD/LMt+iUcs
   A98Tf0uU49y6YrFCD+jsv8MSrHzFpF0tF2gwRYnPuUDhmnFt5yJ9/uPCB
   CL9mtzh74xY/C3bz+hO0kfWu+rPxg7SzLLRkBpom1tAub3azGdJ5NfgKc
   w==;
X-CSE-ConnectionGUID: kRv/SIHmRmKd6RHxOdESiw==
X-CSE-MsgGUID: 3H1ZlCboSZS/uUPPhxYECw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48360738"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48360738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:13:42 -0700
X-CSE-ConnectionGUID: W8qAHBCoTcuDraKKNLsqjA==
X-CSE-MsgGUID: k/GCdjmUSmOyXOBwmWmUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169290312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:13:37 -0700
Date: Thu, 15 May 2025 15:13:33 +0300
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Message-ID: <aCXabQt_nhiTa1pF@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
 <aBCcdPbIxthARrMj@black.fi.intel.com>
 <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Thu, May 15, 2025 at 03:41:08PM +0530, Usyskin, Alexander wrote:
> > On Thu, Apr 24, 2025 at 04:25:26PM +0300, Alexander Usyskin wrote:
> > > Add auxiliary driver for intel discrete graphics
> > > non-volatile memory device.

...

> > > +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > > +		if (!invm->regions[i].name)
> > > +			continue;
> > > +
> > > +		name = kasprintf(GFP_KERNEL, "%s.%s",
> > > +				 dev_name(&aux_dev->dev), invm-
> > >regions[i].name);
> > > +		if (!name)
> > > +			continue;
> > > +		nvm->regions[n].name = name;
> > > +		nvm->regions[n].id = i;
> > > +		n++;
> > > +	}
> > > +	nvm->nregions = n; /* in case where kasprintf fail */
> > 
> > Considering kasprintf failure, should we move forward if n == 0?
> Not sure if adding exit path here adds something positive to driver
> other than complexity.

With an error path already in place it shouldn't be too complex, but upto you.

...

> > > +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> > > +{
> > > +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> > > +
> > > +	if (!nvm)
> > > +		return;
> > 
> > Are we expecting this?
> > 
> > > +	dev_set_drvdata(&aux_dev->dev, NULL);
> > 
> > Do we need this?
> Is there guaranty by auxiliary device that after release nothing is called?

Any reports/link to read about such issues? My understanding is that driver
->remove() callbacks are bus lock held and there won't be an active instance
to be called after unbind.

Raag
