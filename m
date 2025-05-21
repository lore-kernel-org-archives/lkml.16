Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C61A23A6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747859196; cv=none; b=p4xB9obdxxgvV7JGGzAM3hZR/+EPZ6r0K5fbWdecRQt8JZoAq6pFxGHsoVLS7u2bSkUjc1x5xRBmJHD4ZqiHqKV1eMz4PNReR4AbZsZwK3QXL0HS6VHejUvr1EXYLZW/iJpmeeZ2xZJLzWDr6r/rVsxmVsc3rkJ3yM18IZh+dt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747859196; c=relaxed/simple;
	bh=aLtQzNGu5/O0fU0Cv03GWH9zFR3LL3UOULcLPG921iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+an0+1eziIJs5fewOV4mdsgq2tJlrrA3p5CKU9EntWcTZ8BKrrNwe6e6RK9wE15ZkVOra5PIoiiMAzoL41mCHGsOWmD9zjdj4DPfgHBOXLjZX8NUrAx9d9jDPwbnJcK/Nh5o8lTyt96dfWmP6qOYifbugHeQQ/cv5ppchvUBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX7E3lMx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX7E3lMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747859196; x=1779395196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLtQzNGu5/O0fU0Cv03GWH9zFR3LL3UOULcLPG921iI=;
  b=EX7E3lMxtSy12LxNi3nfG4JSUyAmqQLaQ1M1anZ/SMm+Bz91m1X+eRGd
   N2jz0kP0ce3Jtvoggd2L27UhABJemPPFmObD9x7k4VKKeatD4npSvwsnN
   TegPAbCrM4dsPdUr/LXTKdXGcOmLx/fzxSRYzjYUrhrg8YWEDSaGPNF1t
   un0X5YIl25rkisCsYV1TGU3WoSBSpuyB2Q/lBaHd7CFQBwYplrLYfwTdm
   lT35jkxvxyZLmIOg3noxkcJQnH4ISsr5htlR8pb3mOMZZ7oNsgi4qyR1j
   o8vt+/2nyIn9bSJvSu4kmsnkpalV7B6DZS88BPwsybPKnZ8fVDPJ0j+lJ
   A==;
X-CSE-ConnectionGUID: DN5BT6F7TDOWY73//DOBAA==
X-CSE-MsgGUID: f4QOF/PvS5yI07S2f/NbEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49762876"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49762876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 13:26:35 -0700
X-CSE-ConnectionGUID: qZCX3NfvRmW5MjpehmDrkQ==
X-CSE-MsgGUID: D1ORkfQ1S9OCFvbKBj7yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140088834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 13:26:29 -0700
Date: Wed, 21 May 2025 23:26:24 +0300
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
Message-ID: <aC428Ak5j_x6Cr2o@black.fi.intel.com>
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
> +static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> +			 loff_t to, size_t len, const unsigned char *buf)
> +{
> +	size_t i;
> +	size_t len8;
> +	size_t len4;
> +	size_t to4;
> +	size_t to_shift;
> +	size_t len_s = len;
> +	ssize_t ret;
> +
> +	idg_nvm_set_region_id(nvm, region);
> +
> +	to4 = ALIGN_DOWN(to, sizeof(u32));
> +	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
> +	if (to - to4) {
> +		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (uint32_t *)&buf[0]);

Forgot to add, you're using both uint32_t and u32.
Perhaps make it consistent?

> +		if (ret < 0)
> +			return ret;
> +
> +		buf += to_shift;
> +		to += to_shift;
> +		len_s -= to_shift;
> +	}
> +
> +	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> +	for (i = 0; i < len8; i += sizeof(u64)) {
> +		u64 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u64));
> +		idg_nvm_write64(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +	}
> +
> +	len4 = len_s - len8;
> +	if (len4 >= sizeof(u32)) {
> +		u32 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u32));
> +		idg_nvm_write32(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		i += sizeof(u32);
> +		len4 -= sizeof(u32);
> +	}
> +
> +	if (len4 > 0) {
> +		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (uint32_t *)&buf[i]);

Ditto (and also in all other places if any).

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return len;
> +}

Raag
