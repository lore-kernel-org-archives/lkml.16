Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043222B8AA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613102; cv=none; b=BL99EthdkvWZztBI5PE9zeM5WPgD7zyZRF5ehH37kA1Ollioo2f6zg52J9/d353tyNK7melcOJNXo9JGRnpH/ndPzK9CqiutNXZCr+Pmna9xe9yZX/sUbvZsIQ34yh//HL3XWTpqxRrn7k4bALd9jtnN7uHGGu8gdhtBa2f3T5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613102; c=relaxed/simple;
	bh=pX2PTHtPzqLQ5kA1NmW2FjwzP4CXJktF96ar71uadBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQo0xcBVc0/g5nm8uh39Km/Tbn9DJyFiPiW32V0aBEBiyONO7C5xAj3HO6CPzykVjm6frJc5nTBgTg0y5xk7BtCqNhUcVJEq4u0y96F+CRDwBr/HjpMUtKNAK1YGJ6X/KAPhhEo4XFGboMGr6A0XHj4z4hfd42ui5faPWTWiEiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhZz1V7H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhZz1V7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613100; x=1780149100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pX2PTHtPzqLQ5kA1NmW2FjwzP4CXJktF96ar71uadBI=;
  b=KhZz1V7HZpT1lTWCixRKiPNu0n/2jjxfxvd26JFcyq7HSGzmk1StFJXs
   /hrhPTxEy34Gf/7602ypcwnVt4XD1SUQjX7MOpUOVOO0+NIFHMQmywyDL
   uxdbGKiF/NAGT3Rqi3NYSG4hUkNs2/CteQ25aIIAPgNkplgTnrmuzQ4Hz
   K4ZrglkUxOdgY9CDPhk3rTXUTMwDjPbl7PFKEB+/DDm/HbYibjzVErF/2
   bD/zeE45H5rYbDvItCMnfsKFXLOOH95Q17T1nB7UZGOjH+zqWhv+r+3av
   vOEx9ptOLvdTLaSGeRhSmb2FqcSXJvuhvYoLeeZq7ABsd4cNjV/oDXYLF
   A==;
X-CSE-ConnectionGUID: MXk8CQboQW+uhWWQJEdihg==
X-CSE-MsgGUID: mnbBTU04T2CcE0PhoBoMmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50402009"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50402009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:51:39 -0700
X-CSE-ConnectionGUID: ZJN+7x+rQCm/0h/vPOARow==
X-CSE-MsgGUID: P+15Gi7KSJGyJHH3fdtplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143850083"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:51:34 -0700
Date: Fri, 30 May 2025 16:51:30 +0300
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
Subject: Re: [PATCH v11 04/10] mtd: intel-dg: register with mtd
Message-ID: <aDm34rQxtYhvt6fc@black.fi.intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-5-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528135115.2512429-5-alexander.usyskin@intel.com>

On Wed, May 28, 2025 at 04:51:09PM +0300, Alexander Usyskin wrote:
> Register the on-die nvm device with the mtd subsystem.
> Refcount nvm object on _get and _put mtd callbacks.
> For erase operation address and size should be 4K aligned.
> For write operation address and size has to be 4bytes aligned.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
