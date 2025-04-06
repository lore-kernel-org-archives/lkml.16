Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9413633F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743926410; cv=none; b=cpwprOP6vO6/TWD0CUjOrzCfFUeiVEPvCipAikCKO/ir5AEeflr476LkNQF0tbPfHhuUJcr22yxVTbvbb2KCuRlWKwKIMm3rrBTFbDMy9sE/oLzQXwux20Ok67oo+0FigsDTFrWzOTv5N1uG2zhChNsjc6MCbN1XDcCCXIoftbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743926410; c=relaxed/simple;
	bh=BfU9gIiDSTYVE11msVzua1sw9u3IfGvOcKn/bztei4c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=I/nSzPZlUwwxFuvRS8zXBvulfPiyLijHWVRwD3ylaVPRVeD8Dw+ZAE3tV3Us8dJgmRVXvkdKwd8LS2LpHFAPhm+ipJYDeb5iDFK3FV4dahOMzCnpJfQzx84y54/6jEsePEAS1Ess2H7A1kqSRdBZOl5tmehg+wkhX3ZdEcSn7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=JATpg2la; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="JATpg2la"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+aOFXCQ30yLKmU8KeVHCSQYH3N4oNyYgYnnfUrMsRJ0=; b=JATpg2la1W2kw7S+glFpB1wrsm
	Dds79dJ56v1+0/gpTjqF+w9ffte4dySU3Yh4d20d3wWehHSM8NPf4K0Y60LfOyUvuAcyYpF2g/ng1
	c2rVvXC4iisY+scMXzfigN6q4ccfSba2ulNjNr+D4wSZ9abdaqCxV8+BPGuMugaL6/6Dkf502lYav
	lMLyfm4vvRa4Zcv03+Ywh/jgXd0JFlpxuZSL5nYU8+FnOf2Cx+v2irggMHli98Ysrc1fLHJAd+8fY
	ktqYCFscnoY9P4JsMJtomlAw+XWUufVcO6vKvR3Hpfw2K682eQdkPpdCYYhhyxKbfDh6v7M4CsVmE
	Ux2DNn1g==;
Received: from [::1] (port=39592 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u1Koa-0000000056a-3OnL;
	Sun, 06 Apr 2025 11:53:12 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 11:53:10 +0400
From: Igor Belousov <igor.b@beldev.am>
To: vitaly.wool@konsulko.se
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham
 <nphamcs@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
X-Sender: igor.b@beldev.am
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server4.hayhost.am
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - beldev.am
X-Get-Message-Sender-Via: server4.hayhost.am: authenticated_id: igor.b@beldev.am
X-Authenticated-Sender: server4.hayhost.am: igor.b@beldev.am

Hi Vitaly,

2025-04-05 03:56 Vitaly wrote:
> 
>> Do you have zswap/zswapped meminfo metrics from these tests?
> Yep, and those look somewhat similar:
>  - zblock:
> Zswap:            234128 kB
> Zswapped:         733216 kB
> -  zsmalloc:
> Zswap:            286080 kB
> Zswapped:         774688 kB

I tested the kernel build on a 4-core virtual machine with allocated 4 
GB RAM running on a Ryzen 9.

The results are the following:

1. make -j4:
1.1 zsmalloc:
     real   10m59.689s
     user   30m53.913s
     sys   6m20.720s
     zswpin 127811
     zswpout 443914
     zswpwb 764
     Zswap:           292428 kB
     Zswapped:        801536 kB
1.2 zblock:
     real   11m1.971s
     user   30m51.411s
     sys   6m18.752s
     zswpin 306020
     zswpout 732145
     zswpwb 2215
     Zswap:           291016 kB
     Zswapped:        741176 kB

2. make -j8:
2.1 zsmalloc
     real	11m40.640s
     user	33m3.675s
     sys	6m28.126s
     Zswap:            281336 kB
     Zswapped:         785344 kB
     zswpin 308624
     zswpout 641576
     zswpwb 2674
2.2 zblock
     real	11m21.161s
     user	32m21.012s
     sys	5m53.864s
     zswpin 207039
     zswpout 621107
     zswpwb 3391
     Zswap:            326580 kB
     Zswapped:         836088 kB

3. make -j16:
3.1 zsmalloc
     real	12m42.544s
     user	36m3.171s
     sys	6m46.036s
     Zswap:            249192 kB
     Zswapped:         695664 kB
     zswpin 193202
     zswpout 778746
     zswpwb 2611
3.2 zblock
     real	12m12.276s
     user	35m41.100s
     sys	6m30.100s
     zswpin 211179
     zswpout 853612
     zswpwb 2610
     Zswap:            327544 kB
     Zswapped:         721828 kB

We can observe that the gap between zsmalloc and zblock increases with 
the increase of thread number.

>> My concern with this allocator, and the other alternatives to zsmalloc
>> before, is the following:
>> You might be faster at allocating objects. But if storage density is
>> worse, it means you have to zswap more pages to meet the same incoming
>> allocation demand. That means more object allocations and more
>> compression, and often a higher rate of refaults and decompressions.

I don't think we see a substantial difference in storage density, and on 
16K pages zblock seems to act even better than zsmalloc. I wasn't able 
to test 16K pages on x86_64 because there are multiple dependencies on 
the PAGE_SIZE as 4K in the code, but the testing on ARM64 does suggest 
that.
Besides, now when we use rbtree for search for the right block type we 
can enlarge the table and get better matches and better storage density 
without significant impact on performance.

Thanks,
Igor
