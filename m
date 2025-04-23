Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77DD19AD8B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412076; cv=none; b=FENANsY1/1VTplQv8pOABwMMsx0eBBbgoCc208xD39eYTkhUkoefYhyocZd/TUxBOoVa+JUDIydDYBCrTnaxtVU8MOg83JEpfBwcXpUJlThyI80w6Ggh7dEWhmiLsle47VWGoAlcWEW4+rPNs4Kxikfgs5zwiddAkFilNV02U/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412076; c=relaxed/simple;
	bh=XfCm0RjBHS506E9Qj5OmIwv66Wd6rwvPe7T25BAzSx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLMvftiDWNSH35arsnjaP1krO4HedVyF0QJGwmQeF11zttLhAIicwo0YfoI4PBGcUOEkF5mZTwD98fYBy5EzIFwH0G6vtem8FdtvJ4KUyGs4Wlqa+nIKDX6F1Jlu5UVnOcRHh9+7yqQENj7nUQxPrTRK0CB4i4588aZPBNUkrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ce83ABvU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ce83ABvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBBEC4CEED;
	Wed, 23 Apr 2025 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745412076;
	bh=XfCm0RjBHS506E9Qj5OmIwv66Wd6rwvPe7T25BAzSx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ce83ABvUMyqJxsTZQW5pIZaNgzQVqqGmg4zPoAZcw9o6eJif7JlWjQ7cjykM7RUKY
	 3irk9jHkkR+2Aa9A/CwiIBi4i0QeioQGgDFO3TxdQVpVxntIqPfcmYivGUxI+2Ki1H
	 Nh4qQcV6L986vEYb0iBPeXNY1yY8eT2gOjTJ0DpqnvY5Ecncr4uWwQEmm8whNtCSxI
	 MXN7Ht88s+9PBk9BcTHpXNfyVXVNlVoZZZZ3vQ5Pkufe1C2QG+z9FFGUYbWDxVH4ci
	 75he68nNJGmQjfty/QJh2e9Bf5/KqJhuWN7r/qskJ/7NGZLgMvzYVVzvgbzqY5kDt6
	 6X3sMs447aAVw==
Date: Wed, 23 Apr 2025 15:41:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add core mm section
Message-ID: <aAjf5jk8aEJSPBZI@kernel.org>
References: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>

On Wed, Apr 23, 2025 at 01:30:42PM +0100, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a 'core' memory management section establishing David as
> co-maintainer alongside Andrew (thanks David for volunteering!) along with
> a number of relevant reviewers.
> 
> We try to keep things as fine-grained as possible, so we place only
> obviously 'general' mm things here. For files which are specific to a
> particular part of mm, we prefer new entries.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  MAINTAINERS | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)

-- 
Sincerely yours,
Mike.
