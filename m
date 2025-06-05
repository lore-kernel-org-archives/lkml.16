Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784501F941;
	Thu,  5 Jun 2025 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091549; cv=none; b=Zca0sjlL4OHzv9G4cKILbD8FitA/DTdHkU4NbNnijDFONNd29vaqctrw69WgsmbidIr8IREQnTeIak3ijmHOg6bFx/Wy+yIpUnXPQ2JqDTHo2smaaytFPFmBXD7t49jh/EkuCWyQl2wwAJRkoOtS7Wf8WH0T1fzz8QODlwjWVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091549; c=relaxed/simple;
	bh=wOT3dxcPMr/aBtP5WIY57zOtKNM58BZ84zwXf3+Wt00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEOryWSlMHoO6vCyXXWZ9n860cIUNxM9vNoIka4a/IezKnCRE3zlcLC7SpAMLXw4ml12rDkSx5d+zsJ+AiT79Tv2NrH1MZqR5A2O/a4NN7LzkRw5ADGZKPJ5ePYmgJIvvmV0SsmEnbBLYxylGjaBJWaTdIE2FBH7wVm/XAqoKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=grjm5QTA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="grjm5QTA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ybymiTW/sTnUwIL/ifqHR4IjvOprDbSAcrwiBFu/t2Q=; b=grjm5QTA4ICS3pR/Pd2iLzzyM7
	Nu9dKfSDs8UCq98dZ6LI2GT2nRoLbACugdanRHmsPSC7CrYhkAN3lrDNQR317pYWByQL/dsLpN6ZG
	JJsdiuZSOddj4HR3wE9zSUT79B5H5l3Wb/zNrc0fflYmWFaUPnXfIuJk5nTRNUw6PuuzP6/+ZHmZf
	EQ7kTRP9OkpCB3dabiMIzU6khPsI0TTTMtMLFv+2S2PiVgdFc+3a4+nAyjkbRVrFMN6+HiszIV/Bi
	4YtGQfoWk5ehXVX8Bb/kzYQ9M46EZivegJa9St3pRbW6BOvpXg94FVF40r+jTNLnuSIr9Otyt9DhZ
	49IOOuuw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0bh-00000003msR-2m7c;
	Thu, 05 Jun 2025 02:45:29 +0000
Date: Thu, 5 Jun 2025 03:45:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] scatterlist: fix extraneous '@'-sign kernel-doc notation
Message-ID: <aEEEySwOMEcBlbud@casper.infradead.org>
References: <20250605002337.2842659-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605002337.2842659-1-rdunlap@infradead.org>

On Wed, Jun 04, 2025 at 05:23:37PM -0700, Randy Dunlap wrote:
> Using "@argname@" in kernel-doc produces "argname****" (with "argname"
> in bold) in the generated html output, so use the expected kernel-doc
> notation of just "@argname" instead.
> 
> "Fixes:" are added in case Matthew's patch [1] is backported.

Thanks!  I only skimmed the built docs and didn't notice this ... oddity.

> Fixes: 0db9299f48eb ("SG: Move functions to lib/scatterlist.c and add sg chaining allocator helpers")
> Fixes: 8d1d4b538bb1 ("scatterlist: inline sg_next()")
> Fixes: 18dabf473e15 ("Change table chaining layout")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: linux-doc@vger.kernel.org

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
