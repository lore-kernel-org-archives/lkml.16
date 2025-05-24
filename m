Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A723B0
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748080916; cv=none; b=B9Y31TgBE84POwPUYxiCSNMfZLx0Kim41o2hlzEzp0VTe+rJF9tHNB3m7R+0BIPfOX9B5LaPNGBJPWxEtxCgMJknRTVzoJH3Mf7uHb1XS64oNqVghKe+CsXHgMRLWmV+GUw9vZJY9CS83NHw3hHgHU5w/UJB04k4Bc70tV638Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748080916; c=relaxed/simple;
	bh=8Z1S/hNWZ9pEp/mNhwra4+VgljiQYHC4PHrsvJbhuBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRem2Ma+ChB8cJrM8F/0hYqSoLpwU7XevJL0Lq6g3RAmvfSGTkUFGWC/3cKdy3iN9tkb9S8XAcM3HnW3JluR1hKJWOIr5sB6FPJE8jQKh2E252FDUfJwgaBgwTfw9/+YkChR1GowjZX4YnF1Gcd8i8Sc+BIxHWwiJtr0WTJ12Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5KE7o5Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5KE7o5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748080915; x=1779616915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Z1S/hNWZ9pEp/mNhwra4+VgljiQYHC4PHrsvJbhuBA=;
  b=c5KE7o5Y8Mu2K/6omVWYd9RYkxhUKaDYaKEpc2VXvH9WOYPL3D2VtX7b
   BKov5MvQ4NM7KbiK39WPlgnp3f1axAjAYcgCgHqLpdol6pr2VLfpCSIY9
   eRw3CsoG+NgKYJMuhkIccGMQwRcWG1XwevWREDr1MkXIm6pvwq6VCD3f3
   CagluXR3DODVeZSdcJFQRZPMPC1FJSQeY0jcL7enZi+dg1hg3IZdIG7Ok
   WzubYJDYEOGpRrZdtCDOYb4A79XCVF2LPe2Gr4h3/vgnu5EkMDvyk+ACz
   BNGrB2YlOF3fK8D2XMn+bBoYv5UXP2Scg9Kc4KdI9Zd2mFhBWklYFG8kO
   Q==;
X-CSE-ConnectionGUID: K9cy96o0S4WNY6bgnlv1Vw==
X-CSE-MsgGUID: t7VV26O5ShCIofidoEpUjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60778843"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60778843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:01:53 -0700
X-CSE-ConnectionGUID: Gsn2aVMxTheSeNn7uAZ8ig==
X-CSE-MsgGUID: x09pD8gQTg284T1blC2gRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142063527"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:01:47 -0700
Date: Sat, 24 May 2025 13:01:44 +0300
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
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Message-ID: <aDGZCL_B3fEkvahj@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-6-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:40PM +0300, Alexander Usyskin wrote:
> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd_intel_dg.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index eedc0974bb5b..2f32ed311ffd 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
>  		len_s -= to_shift;
>  	}
>  
> +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.

If there's a spec definition, we usually mention workarounds with
Wa_ID:platform so that they're easy to track. intel_workarounds.c
is good reference for it.

> +		 */
> +		u32 data;
> +
> +		memcpy(&data, &buf[0], sizeof(u32));
> +		idg_nvm_write32(nvm, to, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		buf += sizeof(u32);
> +		to += sizeof(u32);
> +		len_s -= sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data;
> @@ -303,6 +321,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
>  		from += from_shift;
>  	}
>  
> +	if (!IS_ALIGNED(from, sizeof(u64)) &&
> +	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data = idg_nvm_read32(nvm, from);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], &data, sizeof(data));
> +		len_s -= sizeof(u32);
> +		buf += sizeof(u32);
> +		from += sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data = idg_nvm_read64(nvm, from + i);
> -- 
> 2.43.0
> 
