Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CC515E97
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612294; cv=none; b=Otl128zIzgkPBX/tHsHCXFFC6cGEP7hdQOXYBxNI6uekV7BKVOcxWxlfwKlIUVYTJ9sLOGkUrNmXefXYQM47iUfWs2+SWl9mWUX/HvSc0MRcjNCk5Ce1zXx3PnqZM9DL5epq0RY/zxed/hutYdyxBqIdkWKhBpgLdD6EkluJuxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612294; c=relaxed/simple;
	bh=o9P7/wYQPmYQaKNuFq7NSX+ZmEYiCM91XW9864V4KnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ8SVg6dwn9mIEg5e9wBez+BfgbnZ1kyJj6xEC1VmQ2wzqvtvPlZKIOtDEPxl5F2w6FctQC3AZJXQ4VZe85AeKTs7t4U5IosqNb5651+xtR9chQskFhpJm/Y3NdkN2UDLG7+AWn3todVHojzJTYgXxJmb5AK7oFntSzbDj9/mzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZWgVwKB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZWgVwKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748612293; x=1780148293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9P7/wYQPmYQaKNuFq7NSX+ZmEYiCM91XW9864V4KnY=;
  b=jZWgVwKBI80nSG3tkUc5hcPtai+I5Jf4jLxGajHLzxWmYx0l/dllcYXr
   YAUWyqkbyYzRtIjd8jBLpqP4qhJS/KWOlqQlp4N8MjKyVWlD/SjhQJXtl
   4m44iGCh+yMCx0XUg5W/T2j5tZrSbGgfeSWwJPefITYheXKAeCFjaAs2d
   2t1XEN+Nf1ytZLu27BZcchz7K7dXZ1MBkjfCBJ5TNFNlsFJC0zFS7Lrfr
   Z3bqSJ0dXOID6ax6oBFPVY4zoyrvERCvufmzNYlBKxUMuabnSDEtfj2OZ
   05i5B3q4vz8DVqz7YqMRIv9U7W5Iak4XXPhjSB2f4Qzup6tN0305mbYKZ
   w==;
X-CSE-ConnectionGUID: x5RBEMzQSYeb510ztr03Bg==
X-CSE-MsgGUID: OHZYQuLsQgOalez1WyQtTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68255154"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68255154"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:38:12 -0700
X-CSE-ConnectionGUID: 7q9JNVmpQ92f3Tt4LHEuCw==
X-CSE-MsgGUID: 0qqq19ioSmGK5DnanuKaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174759679"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:38:07 -0700
Date: Fri, 30 May 2025 16:38:03 +0300
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
	Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v11 02/10] mtd: intel-dg: implement region enumeration
Message-ID: <aDm0u4wXDCqO5rFK@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-3-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-3-alexander.usyskin@intel.com>

On Wed, May 28, 2025 at 04:51:07PM +0300, Alexander Usyskin wrote:
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
