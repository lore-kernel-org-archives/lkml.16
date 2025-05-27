Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7B01DF980
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370916; cv=none; b=EOGgq8nIqJxKfmh6r1KInBnT1BVqk9RSibZWWv5So1W2EKbJ+hclqxono6tighaDgmMPB7mTyZl9YGmCaYnIT3UcQMquXOX8hgRGzNLcAwVT0vZvM/lDmdSsboRFarZ+4OpVCNirkMs23WCIWPqlpEq+T5M45lMlfw2/yrjFA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370916; c=relaxed/simple;
	bh=+8+iElqWcT0dDbkP3pmK2f9v7upnAUnEd8g7APK4p64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDwfi9YMuqGkxA50sz9wm+a8dGMihw8rLD23CCnntsPsVVs1SnJsCaqQLSwQii0W6e/xfnu6kMdJAdnfaG8lVfEU3FgxcQ9JmqxoDjrpKnn+K7BdxknXLrc/m9qY2nznOB6R/NigXXVi6wHSDBBEdWGmBz6f9QFKqlbKtoSfbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEDJ1Atv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEDJ1Atv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748370915; x=1779906915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8+iElqWcT0dDbkP3pmK2f9v7upnAUnEd8g7APK4p64=;
  b=XEDJ1AtvdkBXNgApt4XRWBE2KN66UTlbAJzFYKpVp4ukZTJcYnQKQ3kY
   yNYlshN0vm/R6MF7unWb9mhE916X8w7qs5XwFitwTmwzXLSl0Fd6LIDfK
   7gsW993NhG3UqVHV9VH5vDcuoyslp4I/REEm5b5/U0lA1LrVe/4Y5HLNI
   GIiHFJnV9yQw/csQHip6doPkPUU4TxhO7icfdi11xuKyxDyu3JbIGlAL3
   CWNZlfCSRM/LJ5A5GBnOshIzjDPqW2+ZmRnvEXt5JsRVZQ4eCHBnLRbPs
   sUSMML13r6lxlfBlFyLxW5UdXzU1bAymAJn8WOYo6XOmcEkkMYkSkzfdY
   A==;
X-CSE-ConnectionGUID: 4Iq79/KTQharLYrsh8dGDw==
X-CSE-MsgGUID: CRT8cYrpR+W2msIeWi11xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61038197"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61038197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:35:14 -0700
X-CSE-ConnectionGUID: 0Wi5oRxtSpqfrK8DIV1HeA==
X-CSE-MsgGUID: scnxzUhMSNq2G1HdZlyC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147688246"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 11:35:09 -0700
Date: Tue, 27 May 2025 21:35:05 +0300
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
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDYF2cBPdb0EHRrX@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
 <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Tue, May 27, 2025 at 11:30:20AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
> > graphics
> > 
> > On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on
> > > DGFX devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void intel_nvm_init(struct drm_i915_private *i915)
> > > +{
> > 
> > Lucas recently revamped xe driver to address this, so let's not hide bugs
> > and return an error where possible.
> > 
> I can return error from this call, but the SPI failure is non-fatal for Xe.
> Caller should ignore error from this init.

Fair. Let's atleast return error and leave the handling to the caller,
so we don't have to come back revamping it in the future.

Raag
