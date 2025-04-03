Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB52505CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743705034; cv=none; b=s0Fc7/RgR9EQcWQTNbDd1rb5BphAjVeSChSoj02v++PDpw31gZo0ErnJWZl/LkXYVsMfEnXu6fBeA7USPbcFGCagi35F5YUtbrDnc7oVZNVtBEdP5O0IYmSQI6LYzz/f1csmO9qV01Bie39fYkMSJAbsZ5OL1UiEUrlsLpdDQHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743705034; c=relaxed/simple;
	bh=1HlXRlQ+sRx+EKY6oH+sBIE+XiXRr0ftEttdjZz/qLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttI7QvYLTqce/Xw3X04ZBi96IJeciZS5JoXDQ8/bPGZC3lMR5M/CaTKy1iLQJgULguS9RB3xaCmiO5t8LyiEgAXEXvucC4DtWlx/dEXv033Kh7lKflKNdzVGX8R3e1n3CaapLz7w/4r+Dl0CJKt1+Ox13JM+sDWgTep3fX+FBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pr/Hcdy5; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pr/Hcdy5"
Date: Thu, 3 Apr 2025 11:30:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743705029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ArYKiUFMnEOVml+ahZzr+rsVltz9Am8Fwrx6AQaomzI=;
	b=pr/Hcdy5U+g8jz5usJ4LCnof/q9gv8w3IYRENXLye3PGpA1C+lLUknPgex7+yH2vJyb2Ar
	kcUAn6OVbfkdg3+MQDBiq6/rE7BInTiX6vqujAODHnVOQucHSMbbszBa1fYHe5oERwY0mP
	Ywxc1xrb4yQ+R3J0PxdhY1SFyMGISwM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Dave Chinner <david@fromorbit.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>, joel.granados@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: kvmalloc: make kmalloc fast path real fast path
Message-ID: <hqoa4rhguuzytikznc3xahhwv25w5wcafjquif5nzuhct7e5bc@7or627iuuf2g>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
 <Z-43Q__lSUta2IrM@tiehlicka>
 <Z-48K0OdNxZXcnkB@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-48K0OdNxZXcnkB@tiehlicka>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 03, 2025 at 09:43:39AM +0200, Michal Hocko wrote:
> There are users like xfs which need larger allocations with NOFAIL
> sementic. They are not using kvmalloc currently because the current
> implementation tries too hard to allocate through the kmalloc path
> which causes a lot of direct reclaim and compaction and that hurts
> performance a lot (see 8dc9384b7d75 ("xfs: reduce kvmalloc overhead for
> CIL shadow buffers") for more details).
> 
> kvmalloc does support __GFP_RETRY_MAYFAIL semantic to express that
> kmalloc (physically contiguous) allocation is preferred and we should go
> more aggressive to make it happen. There is currently no way to express
> that kmalloc should be very lightweight and as it has been argued [1]
> this mode should be default to support kvmalloc(NOFAIL) with a
> lightweight kmalloc path which is currently impossible to express as
> __GFP_NOFAIL cannot be combined by any other reclaim modifiers.
> 
> This patch makes all kmalloc allocations GFP_NOWAIT unless
> __GFP_RETRY_MAYFAIL is provided to kvmalloc. This allows to support both
> fail fast and retry hard on physically contiguous memory with vmalloc
> fallback.
> 
> There is a potential downside that relatively small allocations (smaller
> than PAGE_ALLOC_COSTLY_ORDER) could fallback to vmalloc too easily and
> cause page block fragmentation. We cannot really rule that out but it
> seems that xlog_cil_kvmalloc use doesn't indicate this to be happening.
> 
> [1] https://lore.kernel.org/all/Z-3i1wATGh6vI8x8@dread.disaster.area/T/#u
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
