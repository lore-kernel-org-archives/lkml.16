Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5022D4E6;
	Thu,  6 Feb 2025 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840594; cv=none; b=f4fKp4lmCCeHSaiLC37tDXkOqeUh/xczcQLsO1OXRYSLisVF7nDpu4jy2EgqTQS74OwN292Sf/WJxEqTCIffYd9lHz0lE3KktGJyv8waycghTAD7dcjNH+5lGCwafpc6pXZV/gw36hg6TvNMpUEOzRA+F2USHY6qa3JkJthLNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840594; c=relaxed/simple;
	bh=zs0+BwxLlK6ivUzSt1CK3pZxZ6vu1Uq4LmDa+8MwPrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPDXd1wCoQUKXLIngz1viUY5ye6ASfGzVkvtInr/gy93CpXt8teODQlJhugkD80nCrothpFrpHwETXwRBRfzdlM3s1mMA6q/P0TAT5t3vJGMqmdfRkzhsMrihgoduXfWF7nBB9klDBmNaGcmp/Y7ZwXhLJSSRuhmyYvtb83EKWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIGCPeqv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIGCPeqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738840593; x=1770376593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zs0+BwxLlK6ivUzSt1CK3pZxZ6vu1Uq4LmDa+8MwPrs=;
  b=DIGCPeqv8ZrsUtcePx4yoj6qI/mrWslx9c2wl6/n5ss2oOnANJ5/fnYY
   kEqj/Kae7TB7lbR6LsBX6EEBODTe2R+q4kGLteS2s/GCNv0CygvPIIdVz
   YfVgmOzO1IiZG+//+zsNleCoSKOBqfxadpillrcQicKARRbIGw+cQPvZj
   /oFnbRh8SMX0c44ovkRYOuJkcv2mZWXec1VfubkL5vwrU16UpC96iqpYj
   dzAZmBV7XKduly+xMvueHW0T3Vys0CGgT/qHuB3edbuUzduPBkdantTDO
   aydo8uyDbqS/9zul6u7//l71LXeHxROoDsNrHjScMwWs14XFVPRwxtTvu
   Q==;
X-CSE-ConnectionGUID: 9OD8Y+ldQcyPLvTlka+glw==
X-CSE-MsgGUID: eUL47CTCRmmfif1sYL7jWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27039874"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27039874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:16:31 -0800
X-CSE-ConnectionGUID: ys+oaFQtTTOPXHbXt6DIJw==
X-CSE-MsgGUID: v/Q8hn8WRWapAGS1Wo2XZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111104631"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com) ([10.245.246.42])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:16:25 -0800
Date: Thu, 6 Feb 2025 12:16:21 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <Z6SaBeZ_DmdDstka@ashyti-mobl2.lan>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>

> The filemap_lock_folio() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

...

>  		struct folio *folio;
>  
>  		folio = filemap_lock_folio(mapping, i);
> -		if (!folio)
> +		if (IS_ERR(folio))

ops! Thanks, Dan

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
