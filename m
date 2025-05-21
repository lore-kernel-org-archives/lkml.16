Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4B1624CE
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863447; cv=none; b=R8g1cohjn375qk2dbnAT1cDYgqhkST/ASukqMQqXYmurDVy/KXRwMOC3wppi9jhz/uWH5GFXnik3fgzAGBLB/twAkTUnMyuoFu4L/b8Xm516SeB4JZpxQvSzS5OJ+NcH6F3+kFHW+m2M1GfSzilTDtixwP5StnhbBRXoRKO0Oxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863447; c=relaxed/simple;
	bh=/TRHgk4WgbfqINcXZ2LzA/XzOmn7LII0S0I9TtZCzhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib3Ty6yAJB90K268cq1DMWz03jkUkYtu1ClgdK7G9WitocEPenwqpE3Z9FUU0yqthVo3ao9siQM95PYuFffP6onzx1N5Ao5oIgSIFMnL1aN3lLz7IdArv3ZkT96/wUXxTJ3D7QXDjj5eTM8RP+vvXurmVDc6DhkLOoGuA1wfuTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8IDtbSq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8IDtbSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863447; x=1779399447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TRHgk4WgbfqINcXZ2LzA/XzOmn7LII0S0I9TtZCzhk=;
  b=A8IDtbSqQFFsfRg3cex80kESaGVb5HDfibyHNT0+TTiqyoGhmXJ035uX
   9MTvYg/SLayloPHYKx+85laF3UpO1ftHD37fh2/AV3/ZRFZMX1teIzsOP
   2aXYodFmjgulW6YndDavCNCwa9uebMQdi+yiqJeO4dEyilnhKFyJZovwz
   18mVQ45q5pJqNNj0zw56hCzq1RW+y9nFmWYwTtS8Y99C9kOxMZr+/KpcM
   DHGC8d54O/YqtN+WDp0jXmBszyOz/mQoN86eV20j/40zGEVu664FAZpxz
   NMjimuetj1eQYeEsYYLD1dClmp4O+p+b1hZw+xuXnBvFiPBPSTJvdFXPi
   A==;
X-CSE-ConnectionGUID: yBLdT/qUQjiRuCYCaMZZJQ==
X-CSE-MsgGUID: eTXHWl1gTuOXue82hOMyUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49851091"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49851091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:37:26 -0700
X-CSE-ConnectionGUID: yOQi57DvSxaVw+HjU/f7UA==
X-CSE-MsgGUID: hTBnemMxSU2khYiz+9BJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="144987316"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:37:21 -0700
Date: Thu, 22 May 2025 00:37:17 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomasw@gmail.com>,
	Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Message-ID: <aC5HjQKRf_4Ewous@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-5-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-5-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:39PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.

...

> +static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device,
> +				 unsigned int nparts, bool writable_override)
> +{
> +	unsigned int i;
> +	unsigned int n;
> +	struct mtd_partition *parts = NULL;
> +	int ret;

Reverse xmas order (along with all other places).

> +	dev_dbg(device, "registering with mtd\n");
> +
> +	nvm->mtd.owner = THIS_MODULE;
> +	nvm->mtd.dev.parent = device;
> +	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;

Isn't MTD_CAP_NORFLASH already writable?

> +	nvm->mtd.type = MTD_DATAFLASH;
> +	nvm->mtd.priv = nvm;
> +	nvm->mtd._write = intel_dg_mtd_write;
> +	nvm->mtd._read = intel_dg_mtd_read;
> +	nvm->mtd._erase = intel_dg_mtd_erase;
> +	nvm->mtd._get_device = intel_dg_mtd_get_device;
> +	nvm->mtd._put_device = intel_dg_mtd_put_device;
> +	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
> +	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
> +	nvm->mtd.size = nvm->size;
> +
> +	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
> +	if (!parts)
> +		return -ENOMEM;
> +
> +	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
> +		if (!nvm->regions[i].is_readable)
> +			continue;
> +		parts[n].name = nvm->regions[i].name;
> +		parts[n].offset  = nvm->regions[i].offset;
> +		parts[n].size = nvm->regions[i].size;
> +		if (!nvm->regions[i].is_writable && !writable_override)
> +			parts[n].mask_flags = MTD_WRITEABLE;
> +		n++;
> +	}
> +
> +	ret = mtd_device_register(&nvm->mtd, parts, n);
> +
> +	kfree(parts);

I didn't find anything questionable about this, but hope this is tested
and there are no side-effects of this.

> +

Nit: Redundant blank line.

> +	return ret;
> +}

Raag
