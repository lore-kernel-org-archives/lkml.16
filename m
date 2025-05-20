Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1E1C860B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762286; cv=none; b=dCjFu2DYCrqTHlUcJWDhMJAqA8FLSHeucmb6Dw5jagvol8A8JZvc9Dl6wFqle/OojtNHvcn/AfZ4LKUB/1wouP+8fTfbxKzmxrptmuJfAx6KrfvAI/sq6c9D97pjeh/HF/J7n4DeMWt0awCvFfvMLpX5AvfkR3sI8B9GS7cX3ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762286; c=relaxed/simple;
	bh=aKyld7h5OwA2Tp0yE8iRRpriwlPf1t10b9g3LHZckzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up0zlFRkn5HhV8ZWlV4S3lNEtN5nYGW8THQ4D1daP4I99mhOh3rGDpfXJ/xKJ2oBJjVyhx+pIQypnTpC0yIGxf6Gn/73zDI934nY3BsxnBsQUtmvtPq35PQaXSyAzJh29ePOUVWZLYvxsHj1Gz7p6bDuMcCf5CuhKkwqxiAojlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR15hpZc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR15hpZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747762285; x=1779298285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKyld7h5OwA2Tp0yE8iRRpriwlPf1t10b9g3LHZckzk=;
  b=nR15hpZcSLQGv/WxwjL8KnYDrbEoUZo4nBp3D6VCOgofrb9l6dn0oUOM
   4FFu5Ql9WFLXxnelNaty1TbeY76R/2lMEg6WrjXJXhD5U+PiGUKsNXSgx
   WThdIiZEYQYb2TeB8rxOjjuS4sM6nL++YWBXXMbT2EugSLDaaev8E1moW
   DWBYOeP4DlfGORuSJsaKWVqtbgXRygx4b92Bs27aqa4QS4Y5d4Hf1HYUa
   mAV3W2Ahla/ScPq2BmKVn0q7XGw0w2CohdgXmXtdH0N5W/J8g6My8fdeb
   TP0sEIBZKFatIie3yObNLS0h5LSN+egSPyqjAOukfLK7DRaECIr/m0tik
   w==;
X-CSE-ConnectionGUID: KAa+p01gR9KudZom2UXiYA==
X-CSE-MsgGUID: ENAJody0ToibG/oGTZ0nVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49583719"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49583719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:31:25 -0700
X-CSE-ConnectionGUID: N2HUp1NUTKeNrYa5H8G9PA==
X-CSE-MsgGUID: cUQ/AInPT/yQWzIWv/8eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143754323"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:31:19 -0700
Date: Tue, 20 May 2025 20:31:16 +0300
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
Subject: Re: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Message-ID: <aCy8ZJq4eDMDQukx@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-4-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:38PM +0300, Alexander Usyskin wrote:
> Implement read(), erase() and write() functions.

...

> +__maybe_unused
> +static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nvm->nregions; i++) {
> +		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from &&

Since it's already off by one, I'm wondering if this should be >= ?

> +		    nvm->regions[i].offset <= from &&
> +		    nvm->regions[i].size != 0)
> +			break;
> +	}
> +
> +	return i;
> +}

...

> +__maybe_unused
> +static ssize_t
> +idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
> +{
> +	u64 i;
> +	const u32 block = 0x10;
> +	void __iomem *base = nvm->base;

Reverse xmas order (along with all other places).

> +	for (i = 0; i < len; i += SZ_4K) {
> +		iowrite32(from + i, base + NVM_ADDRESS_REG);
> +		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> +		/* Since the writes are via sguint

sguint?

> +		 * we cannot do back to back erases.
> +		 */
> +		msleep(50);
> +	}
> +	return len;
> +}

Raag
