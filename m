Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D57191F92
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747117434; cv=none; b=cAz8C3uw1RbWOGFUgXVWvFlmpzkpYXRSzZzawF74RNW4o9z9fEtCWZm1eemBYu/1qEr7e+3T6bBcrLnJdo/KTtmVsfXfTZqCpPCYHIfo7nBAth56xSVzxhtUohHSEP7dki+bqT5orWIPSoGT/7t/MhrDE6G8AeeChEIiYz6EfVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747117434; c=relaxed/simple;
	bh=SbAsF4jObTssV5tAsLSukZD5RH2gQWdLvFumb8MT8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2WwNSIrTwBTxBjVQYZiutINNcM2wVdH2GNfmpxOsDpIZByA3ADqADhArSvMjVL/4KuMKEL+dJNV4HmDfs+1KUIL3hzwnnrAeUaylWmzMaSNpU1iSYmhw82zUvtZTRkrzZZTs4LIQHJLFJdRXdFQH/jDjc0rxfDznVQjNr+pttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SumWJy9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SumWJy9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0840EC4CEE4;
	Tue, 13 May 2025 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747117434;
	bh=SbAsF4jObTssV5tAsLSukZD5RH2gQWdLvFumb8MT8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SumWJy9mL/itK8sk6Xa7573kABN892lpS+S8yMhszSg9OHtrqi5Ga46lEW9b5lH2K
	 TnLpHdMUcjxK21nq+CDGdzW0wsAoBSedzODZ+EzMbnvd5QIjTHb+VdhV9hYmTIUp9n
	 DfCJ7j74muD9NY/BJ64MX1nH9mNfesgteYh1wZq3ZV++dcXsMtUlQw0/XjcEIk67L1
	 6yScED1XN7SLMB+2boycHAvZAv8LK19ePeBTy3iMIobMzoiWUDP9jMOvchItVLNdlu
	 UE7volyAw+kmcbMBQ9dVBM3OZ2ho3HebP33U/XiY/sdeHvVVrqxHkr9MXZ47mUdQXz
	 U0kB/a5+jUzPQ==
Date: Tue, 13 May 2025 09:23:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <aCLlc7V5XbUYIQ7v@kernel.org>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
 <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>

+cc Johannes

On Wed, May 07, 2025 at 10:23:34AM +0100, Lorenzo Stoakes wrote:
>
> > > > (looks at vmscan.c)
> > >
> > > Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> > > implicit:
> > >
> > >  $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
> > >  198195 total
> > >    7937 mm/hugetlb.c		# Muchun
> > >    7881 mm/slub.c		# Christoph/David/Vlastimil
> > >    7745 mm/vmscan.c		#
> 
> This is, as Andrew rightly points out, a key one, I will have a look around
> the git history and put something together here. I'm not sure if we will
> get an M here, but at least can populate some reviewers.

I remember Johannes doing a lot of work in vmscan, let's volunteer him :)
 
> Cheers, Lorenzo
> 

-- 
Sincerely yours,
Mike.
