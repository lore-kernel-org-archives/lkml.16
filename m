Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FD22ACE3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310924; cv=none; b=e0n1DjtHog5qElemHfYyYugJNxKrsX3cfeCeBTf3LFz2raJ3FFbFz4GGrM3d0x46OPW7jCOIqcDP9QUnNFX3AkFr/KTtxyGLLD5c3kf+Z/FsIC9wPcGscaCQWL1Yiq+M3jUTtUd1Vj4X85j9N2pOvZsA1/1zQFebHXZiD1L1SVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310924; c=relaxed/simple;
	bh=tkcz3fDoQtNMo4Zmg+sngA67GADtQkWp13qhVcacadk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF/Ec9AhWwy457iwPSULnLlw+HvtfAKfGJrxJuHnuePToT1a7N2oOULKjfEHVMjX5AQSmWpow0lCuwCljmHuDhC293RvrblfLaYz96B+wYqoO+FYZMjR65QziT8uA2gB7NXLxAYQz7Y5xJH2BAEYMa+ovPa9TseNrsJgNhgm/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7+8ljZa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7+8ljZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457E8C4CEEA;
	Tue, 22 Apr 2025 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745310924;
	bh=tkcz3fDoQtNMo4Zmg+sngA67GADtQkWp13qhVcacadk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7+8ljZag9MrMdygB/e5mTshdnVjmpMziL5L0xJEcDaZY8DYtpt7fNbFPgA/SVWxt
	 2Yh0hgP7jPhR4y4DTAfUd7sG7e6+xC2ORhALpoGls/i+F1610naxJf2JBqPnsH0vRo
	 3TI5FZu+7LSxVki7fAOtVyXq5W/yD/oiOLIoDrLDpIHtlv2u2BWt0N6DCLcXSWqZLf
	 HFdXaNg1GpqjOxf3kjwOKadK3E2omKDA/UhFkZQPHIyvJUbuUdf1ddUoYVIB6g2X3x
	 KtPOM60g96iMDCSmVxW/UHsImBJvRfb6qGIuTwccVssytmjoNmwxqxyfnb2ncw3Q+5
	 pZXUfVZwnSGlA==
Date: Tue, 22 Apr 2025 11:35:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Dave Hansen <dave.hansen@intel.com>, x86-ml <x86@kernel.org>
Subject: Re: Kernel 6.15-rc2 unable to boot on 32bit x86 with PAE
Message-ID: <aAdUxY8i4TV3q9Lt@kernel.org>
References: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>
 <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
 <aAc-h1TJV7do7JXa@gmail.com>
 <ecca749e-9c84-40ef-ae2a-d630a249b764@gmx.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecca749e-9c84-40ef-ae2a-d630a249b764@gmx.com>

On Tue, Apr 22, 2025 at 05:02:55PM +0930, Qu Wenruo wrote:
> 
> 
> 在 2025/4/22 16:30, Ingo Molnar 写道:
> > 
> > * Borislav Petkov <bp@alien8.de> wrote:
> > 
> > > On Fri, Apr 18, 2025 at 08:31:23PM +0930, Qu Wenruo wrote:
> > > > Hi,
> > > > 
> > > > Recently I'm testing a situation where highmem is involved, thus I'm
> > > > building the latest 32bit x86 with HIGHMEM and PAE, and run it inside a qemu
> > > > VM.
> > > 
> > > Does that fix it:
> > > 
> > > https://git.kernel.org/tip/1e07b9fad022e0e02215150ca1e20912e78e8ec1
> > > 
> > > ?
> > 
> > That commit caused other problems - the best fix we have right now is:
> > 
> > 	https://git.kernel.org/tip/83b2d345e1786fdab96fc2b52942eebde125e7cd
> 
> Thanks, I'll take a try again.
> 
> But considering how rare 32bit + highmem systems are nowadays, I still have
> one questions/concern:
> 
> - How to make sure we really got highmems?
>   The kernel docs only mention that highmems need temporary mapping,
>   and proper kmap/kunmap() handling.
> 
>   But I still didn't have a straightforward idea of how to verify,
>   without adding manual ftrace events when a highmem page is hit.
> 
>   E.g. free only shows 3GB memory even if I enabled highmem + PAE.

Without HIGHMEM it would be less than 900M.

You can look for "HIGHMEM available" and "Memory: n/m available" in the
kernel log to see how much highmem is there. 
 
>   Since HIGHMEM64G is removed, I'd expect to get some values more like
>   4G instead?

There are some gaps under 4G, so it's surely less that 4G of usable memory
there.
 
> Thanks,
> Qu

-- 
Sincerely yours,
Mike.
