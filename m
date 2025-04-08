Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9F17A319
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148415; cv=none; b=Jt6cNpkAv8Jwn1oAHDJbCst/mDwPFGqWraHt8Ecaai6DxfFj3m12nV2T1ttn8/QDkYmPSD3gapalluQImX+wpVOr2P+VnZTu5zGgKLtx+82CnKg9n2cTn/ushFJuKN2PK3vre2XttvQgPL89XMp8GeFeuNyvN+S77KAVnTfR0eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148415; c=relaxed/simple;
	bh=h9S8zXZLZi67RlzX/pG2eZFsnZWHN6TY9ojoQXGumG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9IG+vWdi+Zdp6QZazkqfSVre2KGShWfUyyoW+hGJSAdhFmycjOFCWC2fhJg7b2RAp6l6HQBXAKCtC2q2Nub3+NN6i+TFiRqduv986eTsHLTDu4hxo1xGuYnlOCohPg62V9osJyo7kY7+z4CW4CxwznvNpNGLpUGCeM+oSdCQJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=UF6r02/x; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=qQu0hJIs; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="UF6r02/x";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="qQu0hJIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744148338; x=1744753138;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=DFqccygusJ2q4mLsj0hmSnYNuPPTLeqNCbWp99vTaLk=;
	b=UF6r02/x+oopiIYU0+noriCI1xgsP2xMeHjUYwxk5lyHYSNooyitx4xlL8pJAOKSTLRiyN+lLG0bF
	 Qe4UwfbwHhpXyA4r9uG7pxiKVjF5BRgn9Rsp7DTS3dNxmZrkWWHFEaR3Gw62r0vujWl9KmK9jTLR49
	 wx0hnlLVujFxhNTb5N+W07A0WQFS+VKd/EbKDUUBuiHt3W9/HUucJ90rpXSuAqhCE3YMciqMt2Nxsl
	 3y0CLweMgQdwnj/BwXp6qTeogwpY8jEO6pHFmvVyoLxNZqv8Mi7Vo9F3/jBvMIEY9/nYU4jBASMeh4
	 GMZnTUcpDCGDjnNUm8DHknUm2gkN2Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744148338; x=1744753138;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=DFqccygusJ2q4mLsj0hmSnYNuPPTLeqNCbWp99vTaLk=;
	b=qQu0hJIs4IgTLlFCRMMl40jlI7tFppi2Fv6+GR/5GU1y+SNUyHeF9P1GLuBRosqGQOvw7gotnKts/
	 F9hsC6gBg==
X-HalOne-ID: e02a6414-14c1-11f0-93e8-29b2d794c87d
Received: from [192.168.10.245] (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id e02a6414-14c1-11f0-93e8-29b2d794c87d;
	Tue, 08 Apr 2025 21:38:58 +0000 (UTC)
Message-ID: <24e77aad-08ca-41c4-8e64-301fcc9370b1@konsulko.se>
Date: Tue, 8 Apr 2025 23:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Johannes Weiner <hannes@cmpxchg.org>, Igor Belousov <igor.b@beldev.am>
Cc: Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am>
 <20250408195533.GA99052@cmpxchg.org>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <20250408195533.GA99052@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/8/25 21:55, Johannes Weiner wrote:
> On Tue, Apr 08, 2025 at 01:20:11PM +0400, Igor Belousov wrote:
>>>>>> Now what's funny is that when I tried to compare how 32 threaded build
>>>>>> would behave on a 8-core VM I couldn't do it because it OOMs with
>>>>>> zsmalloc as zswap backend. With zblock it doesn't, though, and the
>>>>>> results are:
>>>>>> real    12m14.012s
>>>>>> user    39m37.777s
>>>>>> sys     14m6.923s
>>>>>> Zswap:            440148 kB
>>>>>> Zswapped:         924452 kB
>>>>>> zswpin 594812
>>>>>> zswpout 2802454
>>>>>> zswpwb 10878
>>>>
>>>> It's LZ4 for all the test runs.
>>>
>>> Can you try zstd and let me know how it goes :)
>>
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

Well, not really. This is an isolated use case with
a. significant computing power under the hood
b. relatively few cores
c. relatively short test
d. 4K pages

If any of these isn't true, zblock dominates.
!a => zstd is too slow
!b => parallelization gives more effect
!c => zsmalloc starts losing due to having to deal with internal 
fragmentation
!d => compression efficiency of zblock is better.

Even !d alone makes zblock a better choice for ARM64 based servers.

~Vitaly
