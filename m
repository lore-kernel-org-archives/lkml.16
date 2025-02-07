Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F9154C05;
	Fri,  7 Feb 2025 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926176; cv=none; b=MUKp8AI/VoMHVOKqVLroQsA9XWBssIHuiWpPzfa1Zm0g8r/6EhA9jZZz5Jcn4/2EC8OG46js5DtfGhQH1gQOVK/FajiZcbeQMdvKGSqHY6kZjw0nieLU91uUnA8iqbsM/GzJyRDOYqlztUJjn9djo50huMK1hUbuKjAjmCAsF2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926176; c=relaxed/simple;
	bh=ENAbJglwPtDhtDx4sNdFeUf2Z9r1yDUmaR1yOF86pgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pfv4AMtC8k71kYjTH9H64lUMbWZPPyzSoS7ueaHn0PXJcb9D+X/YhZvh21HIR2xXInIdYg9JeZlxu9JNo8lRO8SmMmk1Sj8BoLQSmXstHQmZg/f887FxIWGFclN1WqdMCKkczkXC2J6fbTJqRUDe9ND+xPxXPxWYtGaOF0zYvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Phx43996; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Phx43996"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738926175; x=1770462175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ENAbJglwPtDhtDx4sNdFeUf2Z9r1yDUmaR1yOF86pgM=;
  b=Phx43996is7qW8icH50DXbFD33bIgZy85dzC6JH0Ef8Y6n9ceueAT9LS
   fY3lRytwhkCSTYhXxbfqMjKbK4q2+XxCLhain35XRGJ0Mtr14zjS1zJGM
   me/5YaoXqevA3JZ8T76HnGr9QaS+Hn9XyDjxqYdZb8pDl2SYyxn6IOUrm
   bMBoFZr7YhotDT4Tx/26OuoRCWvI2kWEYpmRLrSTY7zvx46gkvo0KGswe
   XDY+csrsOw4uATzrYkwrM+egaNvMCMju2nus3QxkpupxhSwOgFZ4FP2SI
   29HblBe2nyp0Xscrjnxhe5HOwr2qeQwYQbDF9zLXUmVp02mnPgxUm/2U/
   Q==;
X-CSE-ConnectionGUID: e15hLEjaReiqyGd3qs488A==
X-CSE-MsgGUID: +FI6wE/5QAaQws+kauJMOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27171045"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="27171045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:02:54 -0800
X-CSE-ConnectionGUID: Qr/W36oXSyagrZRF/uopAg==
X-CSE-MsgGUID: o5fEKG/UTgqZr7FYL0UY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111928610"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.140])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:02:47 -0800
Date: Fri, 7 Feb 2025 12:02:43 +0100
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
Message-ID: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
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

Hi Dan,

On Thu, Feb 06, 2025 at 11:17:02AM +0300, Dan Carpenter wrote:
> The filemap_lock_folio() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index a784fb44e59c..fb263b421958 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
>  		struct folio *folio;
>  
>  		folio = filemap_lock_folio(mapping, i);
> -		if (!folio)
> +		if (IS_ERR(folio))

I don't see this patch yet in -next yet (and of course not in
drm-tip), which branch is it based on?

Thanks,
Andi

>  			continue;
>  
>  		if (!folio_mapped(folio) && folio_clear_dirty_for_io(folio)) {
> -- 
> 2.47.2
