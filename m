Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE3B2641CC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634424; cv=none; b=XHKaOK/OiyI6ItsVqJTHoTyFFua4eQfff4aG25Fyp2Zr27D41TtOncFFScfKkIaMtliBr2XE5BcrvV6Ljv7Tadb/8HI5jY4/XDEjr2IhBT3daGwwSI2JoGnqYG6ZIU6UPXXHzrnTq3sdUZW3iZnSvOf8QB/QHx2pzMJWTyV6r18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634424; c=relaxed/simple;
	bh=dCxYhXgXkoUEmgozhBC3G0zLWKAepHqQDL8jsvt0uPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOLzgKhpLOfRrJb4pZjXQBY4OIJcvuTrDGrOgX03wvf4R85yOMmhMnzj5Oj1eaKverM5usVtCynJv/27A4IIJcWk2ho6HBJab2SNLkTVZ06HhzQd1lJUcynOq1oH0+L9GaBrRLSbq5GBU0J/UaBq8YWeHcNxRxFBQlZJhw4yrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjP8eK0u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjP8eK0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A122CC4CEF1;
	Wed, 11 Jun 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749634423;
	bh=dCxYhXgXkoUEmgozhBC3G0zLWKAepHqQDL8jsvt0uPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjP8eK0u553Rmcc4iup0emJYRA+W3FmA9kUZBpIAUv8hyBKhUMASw9CiNn4j5CvZw
	 C4/Yc3KKIBvZnQ5+PugChPTPH6fDy4EeboidarhmIQuEZMUNXtrtimx4pZsKpTf7J/
	 LJKJpC4jcAk84Xw4CFH0QRaNnH4tAhxxzIUxfjcDE1EyOnINKpnRh0qpoh4oKpXu+/
	 wIjNFZ6lvdko5oJ4ULeZ/oDsmVvb7Xq7CvSrOIyuYusFpKeyyenPO5FnOlOIE1iXh0
	 xclN8LqtjskAP/7DfVBKFXzZioC2AdfdlPd9hU7mR0fusgKWyOJ+ycB2ZROesYA+RK
	 hfF3cOsNEqzWQ==
Date: Wed, 11 Jun 2025 10:33:38 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250611093337.GB10885@willie-the-truck>
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
 <20250530133625.GA30622@willie-the-truck>
 <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
 <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 05, 2025 at 01:46:01PM +0530, Dev Jain wrote:
> On 05/06/25 10:18 am, Dev Jain wrote:
> > On 30/05/25 7:06 pm, Will Deacon wrote:
> > > On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
> > > > On 30/05/2025 13:35, Will Deacon wrote:
> > > > > I really don't think we should be adding unconditional
> > > > > locking overhead
> > > > > to core mm routines purely to facilitate a rarely used debug option.
> > > > > 
> > > > > Instead, can we either adopt something like the RCU-like walk used by
> > > > > fast GUP or stick the locking behind a static key that's only enabled
> > > > > when a ptdump walk is in progress (a bit like how
> > > > > hugetlb_vmemmap_optimize_folio() manipulates
> > > > > hugetlb_optimize_vmemmap_key)?
> > > > My sense is that the static key will be less effort and can be
> > > > contained fully
> > > > in arm64. I think we would need to enable the key around the call to
> > > > ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx().
> > > > Then where Dev is
> > > > currently taking the read lock, that would be contingent on the
> > > > key being
> > > > enabled and the unlock would be contingent on having taken the lock.
> > > > 
> > > > Does that sound like an acceptable approach?
> > > Yup, and I think you'll probably need something like a synchronize_rcu()
> > > when flipping the key to deal with any pre-existing page-table freers.
> > 
> > IIUC, you mean to say that we need to ensure any existing readers having
> > a reference to the isolated table in pmd_free_pte_page and friend, have
> > exited.
> > But the problem is that we take an mmap_write_lock() around
> > ptdump_walk_pgd() so
> > this is a sleepable code path.
> 
> The mmap_write_lock around ptdump_walk_pgd() is definitely restrictive. I
> think that
> 
> was put because ptdump is rarely used, I think we could have done
> RCU-freeing of pagetables to
> 
> synchronize between ptdump and vmalloc pagetable lazy freeing/ hotunplug
> pagetable freeing.

The other idea was to use a static key like the HVO code does, which
shouldn't place any RCU requirements on the debug walk.

Will
