Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DB27702A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744221602; cv=none; b=fqbivl64FTTsFSaEyf05ZJlTwIxd8PUl5ztQVhAnh1Z+ew7UOnaMCXKo1oRtUn5wEqt0Yvteop627nNvwu4OAF2T3V0E+IRh+66btdf0U+uuTX1rpRhn/se2jEhNrwC7gRzDELpvM8+A63+d5hiGCBqOKaCi7BB1hPkxXxYO8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744221602; c=relaxed/simple;
	bh=UuS6LYvXNWA44Pgxg1N98PQIAEFpYAZcrTzOfuPOOB8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YtmjqKBN+Fp7dupuaOJi8rGosBrWzP4QcMqyAKyamrx5BzzU+caiQW99KZoR0UOcUAltYmr8Ogu+kdUeIx9H/34e6X0rikD69IdQlgt66IAs1Uoht2xzEpWHJgWC7vts2m+hvKHWUOTwu/dvTuUCtFzbuJVAsvFyaeunOh/KeYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=WfudGgJF; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="WfudGgJF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iIGQFu4G3YqScRtn1MdkImVOLsmCd0SCKYsM1/9sow4=; b=WfudGgJFc8NHhnZPweTnChCxw1
	ThmJub96UFa/mtraG2OhweC3Z/gQa9zM1l1CJsMqFfxuJsZhyr4+EQDYqsdzQzUWEub9MlLmtmV8R
	csnd3HiaxvxNF81IC4Hoz6/nGZGyazNQ7SeVlAluckRMispp8wD4TCJx6UpTMtGel1gt7WFflNly3
	fKTS1jOH4F7A8nW1LAz8wwDND+i3UwN0/Y/y/rKcKHcfzX27xqCrmIOIktVilODERqHmTk6ScCOG4
	hkrN5t26vCBC5zFGtFBvd7x7R0x8mLDyCvnuRLu2ULeFeRadB4MUBI6NdIgYA04dvr3drNewxhlxY
	sukcUCIA==;
Received: from [::1] (port=17876 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u2ZiT-00000000Ejy-04sK;
	Wed, 09 Apr 2025 22:00:01 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 09 Apr 2025 21:59:58 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, vitaly.wool@konsulko.se,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <20250408195533.GA99052@cmpxchg.org>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am>
 <20250408195533.GA99052@cmpxchg.org>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <6e1c6b20481c2cb41930d37da4fe8aeb@beldev.am>
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

Hi Johannes,

>> Sure. zstd/8 cores/make -j32:
>> 
>> zsmalloc:
>> real	7m36.413s
>> user	38m0.481s
>> sys	7m19.108s
>> Zswap:            211028 kB
>> Zswapped:         925904 kB
>> zswpin 397851
>> zswpout 1625707
>> zswpwb 5126
>> 
>> zblock:
>> real	7m55.009s
>> user	39m23.147s
>> sys	7m44.004s
>> Zswap:            253068 kB
>> Zswapped:         919956 kB
>> zswpin 456843
>> zswpout 2058963
>> zswpwb 3921
> 
> So zstd results in nearly double the compression ratio, which in turn
> cuts total execution time *almost in half*.
> 
> The numbers speak for themselves. Compression efficiency >>> allocator
> speed, because compression efficiency ultimately drives the continuous
> *rate* at which allocations need to occur. You're trying to optimize a
> constant coefficient at the expense of a higher-order one, which is a
> losing proposition.

Actually there's a slight bug in zblock code for 4K page case which 
caused storage inefficiency for small (== well compressed) memory 
blocks. With that one fixed, the results look a lot brighter for zblock:

1. zblock/zstd/8 cores/make -j32 bzImage
real	7m28.290s
user	37m27.055s
sys	7m18.629s
Zswap:            221516 kB
Zswapped:         904104 kB
zswpin 425424
zswpout 2011503
zswpwb 4111

2a. zblock/zstd/16 cores/make -j16 modules
real	15m53.119s
user	199m45.722s
sys	36m21.544s
zswpin 26600
zswpout 287021
zswpwb 0
Zswap:            205908 kB
Zswapped:         858516 kB

2b. zsmalloc/zstd/16 cores/make -j16 modules
real	16m31.052s
user	207m3.612s
sys	37m49.891s
zswpin 27044
zswpout 296763
zswpwb 61
Zswap:            198740 kB
Zswapped:         868020 kB

So what we see is:
* on 4K pages, zblock matches zsmalloc with regard to storage density on 
longer tests and gives better performance in virtually all scenarios
* on 16K pages, zblock is superior to zsmalloc in terms of both 
performance and storage density.

> This is a general NAK from me on any new allocators that cannot match
> or outdo zsmalloc storage density in common scenarios. I'm sorry, but
> I really don't see any reason to do this.

Given the above, I sincerely hope that you reconsider.

Thanks,
Igor
