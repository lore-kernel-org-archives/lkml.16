Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701E1E5B7E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253331; cv=none; b=cHJpCsNMtfOgC1gMe6AYwB5xELl95A1rueyZP8T9WPzF8a4sDpPv5LreVz5wfZIaqZ+o3PQA7/g/JA2Kr3dtkEVQNzYYSK5a450zl311Adl0Jgm0Sy7tHbMuLvXyZAwbH6fADSls9RpjZw5A/Z0U5eXa6pNW5ri6ntLkgF5XuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253331; c=relaxed/simple;
	bh=3mFuU2DUGI7GC/f6E3ePt0mrV93b5VvBdvwSVwqYDa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJQDuGDWraI4Rwoz8bGKVlTm5isAiBZp5YsqSQctqzZpuzCYLY3IW3ZnO3T8m1BWkyaYTZx82w+5z56YO+gtlpnvn0fY/zpy173uI4FDKgBORrnG6zMEycNms4P+Q7DLCYtdEpgjpFOZSuzKQ1s2UD+PBWOU2fCL73RPUNrrOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMMOicHW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMMOicHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D454C4CEEB;
	Mon, 21 Apr 2025 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253330;
	bh=3mFuU2DUGI7GC/f6E3ePt0mrV93b5VvBdvwSVwqYDa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMMOicHWTRtMFJd3ibw5uTk5PRTQKMxdj34sO+hKbQTUywjRYCVPA3H3jjPtGFWgO
	 NPrPJY9vvWd4FSsKYLsVE+XBd+NRdEGUVOIkXPuOeS/Ud2mB5CG7Y4t0yL9qJajp/k
	 6z1KBciH+0nIs1VGfiz5cW+3HSNHCmbqNFFY2gYCk8voVTM0m+t5bhZaLRIUpcc91N
	 iLfaMJeD1bsgT/EbcRF0xXgpzcCkUjXjtWF+Fr1OTdDeBxtPy12PVzh6X+R80ZNVXM
	 Dlu7QcFhfQhl7QnzT5Z0Kb8opnwDwerWbiCIg/PnpByBM07PusB1/dlsNUvekysMfp
	 JDy8ambtHveiQ==
Date: Mon, 21 Apr 2025 19:35:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ruihan Li <lrh2000@pku.edu.cn>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <aAZzzVDsmtqP3uAg@kernel.org>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
 <20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>

On Sun, Apr 20, 2025 at 01:57:09PM -0700, Andrew Morton wrote:
> On Sat, 19 Apr 2025 20:28:01 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:
> 
> > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> > kernel is used as a library and loaded at a very high address), the
> > pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> > long time, and the kernel will look stuck at boot time.
> > 
> > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> > avoids the problematic and useless iteration mentioned above.
> > 
> > This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> > unavailable struct pages").
> > 
> > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > ---
> > Link to v1:
> >  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> > Changes since v1:
> >  - Removed the unnecessary Fixes tag.
> 
> Why was the Fixes: considered unnecessary?  It seems to be useful
> information?

I didn't think it was important enough for AUTOSEL to pick it. 

-- 
Sincerely yours,
Mike.
