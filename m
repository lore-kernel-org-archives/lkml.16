Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B962BEFF0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095186; cv=none; b=GHNYByo+DTxde9nVT0nbvwmbstPZEEVhwxdYyfmZPlqcqYWC5+fgElypSZCZ6LgufoGvzoPIbrZIC75N+lVJO+8xteKidm66HyebEIsPYAYPfRThUDXLyCfiphDiVGfN1gPIUmn31S78rfRJ1uet2/2r1VcgWz4jvUAIYdWdSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095186; c=relaxed/simple;
	bh=lPnt8Z+cgi8NsPeQHEkKvCoqYNwhus+Lu+T9Xzml/MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8qqUkgJBV4prG9B7pCkPXtRckc1fZHkJjdNiSniuLR0y0XtKVuzcuF/ATCwRoTs7LpLtXY/w15I3bI1aoK/GsCMktcdVhuspE9n7dXnX58MZ2zKvQOrf4KL7kyfagKe7M0KhbqSZCFTHzrByvG65kelGDgUNpPH+4Ny9Iuvcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3QuZMvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3QuZMvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B888EC4CEEA;
	Mon, 16 Jun 2025 17:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095185;
	bh=lPnt8Z+cgi8NsPeQHEkKvCoqYNwhus+Lu+T9Xzml/MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3QuZMvWeThHSVHgSc5teNy98vBSZefp3t5tBYGfV/2oaUNhD20J51SW+Wx12Rw5k
	 5clZHGpTPwLzkqx6lYeLct1RClJEycSD4gpRzomvRPhBf0Qvr+/W2iIBl/6iDPHliK
	 g0aoM2sy7+1OT38IaLW7fJ/uF/kjWRiEhaiK6AoRULbfsXn1iOFaYFnNmfjdNsVELm
	 cMgfpxQjwsNsTXEq4VVnsEch0w4ID5jTq9gMUpzYiy1WGTokzU5zFlGO05m+nZ8jDC
	 /IfScgZj7ac+BDms3njLcfgt0NEoFlvJOE5tqlHkiW8nTw8FiC+CmOA8Q56Q9Bekt/
	 2577wuoXMXwOg==
Date: Mon, 16 Jun 2025 07:33:04 -1000
From: Tejun Heo <tj@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: linux-kernel@vger.kernel.org, void@manifault.com, arighi@nvidia.com,
	changwoo@igalia.com, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] sched_ext: Return NULL in llc_span
Message-ID: <aFBVUAlgDzEw6KeZ@slm.duckdns.org>
References: <20250615200414.42827-1-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615200414.42827-1-yphbchou0911@gmail.com>

On Mon, Jun 16, 2025 at 04:04:14AM +0800, Cheng-Yang Chou wrote:
> Use NULL instead of 0 to signal no LLC domain, matching numa_span() and
> the function comment.
> 
> No functional change.
> 
> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>

Applied to sched_ext/for-6.17.

Thanks.

-- 
tejun
