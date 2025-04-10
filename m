Received: from server4.hayhost.am (server4.hayhost.am [2.56.206.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A922036ED
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=2.56.206.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268549; cv=none; b=dspt5yYBmT/lzfNT2xsOnYVfjmvJpnbdh63NkbLsq8ePFz8Wrm6uGZzRBzneuGZh0xaCshsJHyUui1lYRzXJ/waJ2o4zZlmDZMki8qArdMAjuEcSpWIjIIWHTTbjl5YZfYX1guhW8TzzNGbQy5D4kUzybqvam8TCX1bdKZy70uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268549; c=relaxed/simple;
	bh=Ty3wfbkYGid/c8LJyC7C9XKcQvbGvUAoykWgPvfRXS0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VWF/+Lus5I8QePwYOUNpa43vwF/5c9yluJcFEaTSdvmkIfLFtfW1Xe4HuNY7NsBhTn/nZoXFW8MgBWb4CKdfVepeHBR5kU7vIFJPytY5BwkFjPncsancG3USx6/+2xjch7nscXXQ1X80cpiGBaV51LNbFf+FdBqXJ0Fq/YNkSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am; spf=pass smtp.mailfrom=beldev.am; dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b=PM2B6bWS; arc=none smtp.client-ip=2.56.206.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beldev.am
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beldev.am
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beldev.am header.i=@beldev.am header.b="PM2B6bWS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beldev.am;
	s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DWL82tPIOM6tWzfIcLAFHYbFC9Hsnba5uU2kE1Kr1Jw=; b=PM2B6bWS971oxZKQ9UzRyHAxKW
	MO/d4O00gCyQr/ts0I6+D55yytt5BNEbPAA29vYe2lBhv71AEjF3EGkNAMxriqMkrkVxZyXCKt8c0
	pfRsw0y2cea25Zol6g3e3s4FdmgaRuH6jzu5lai1tUF6paCeBIxqg4gzmBrj/S3gelsRQuWyi1bEV
	JPd5QIsMR48uVAbie/Iwu1hlEUkt/0dEeYHKDQ/B1IVzm3x27yPmfxTXMSAcjsm93KtTno9vBeQui
	prYW8hNWU11MT1nfAEGxq06UjK0OfHGEJ6TEDTArFtMr5mbSXyb5AKaNTrtSn5cBT0G2NxDAMGSW2
	NOTD/3pg==;
Received: from [::1] (port=39210 helo=server4.hayhost.am)
	by server4.hayhost.am with esmtpa (Exim 4.98.1)
	(envelope-from <igor.b@beldev.am>)
	id 1u2lvl-00000000CQ2-2CCd;
	Thu, 10 Apr 2025 11:02:33 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 11:02:31 +0400
From: Igor Belousov <igor.b@beldev.am>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, vitaly.wool@konsulko.se,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
In-Reply-To: <6e1c6b20481c2cb41930d37da4fe8aeb@beldev.am>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am>
 <20250408195533.GA99052@cmpxchg.org>
 <6e1c6b20481c2cb41930d37da4fe8aeb@beldev.am>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <019035e5ecae12390048b73c042ec54d@beldev.am>
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

> Hi Johannes,
> 
>>> Sure. zstd/8 cores/make -j32:
>>> 
>>> zsmalloc:
>>> real	7m36.413s
>>> user	38m0.481s
>>> sys	7m19.108s
>>> Zswap:            211028 kB
>>> Zswapped:         925904 kB
>>> zswpin 397851
>>> zswpout 1625707
>>> zswpwb 5126
>>> 
>>> zblock:
>>> real	7m55.009s
>>> user	39m23.147s
>>> sys	7m44.004s
>>> Zswap:            253068 kB
>>> Zswapped:         919956 kB
>>> zswpin 456843
>>> zswpout 2058963
>>> zswpwb 3921
>> 
>> So zstd results in nearly double the compression ratio, which in turn
>> cuts total execution time *almost in half*.
>> 
>> The numbers speak for themselves. Compression efficiency >>> allocator
>> speed, because compression efficiency ultimately drives the continuous
>> *rate* at which allocations need to occur. You're trying to optimize a
>> constant coefficient at the expense of a higher-order one, which is a
>> losing proposition.
> 
> Actually there's a slight bug in zblock code for 4K page case which 
> caused storage inefficiency for small (== well compressed) memory 
> blocks. With that one fixed, the results look a lot brighter for 
> zblock:
> 
> 1. zblock/zstd/8 cores/make -j32 bzImage
> real	7m28.290s
> user	37m27.055s
> sys	7m18.629s
> Zswap:            221516 kB
> Zswapped:         904104 kB
> zswpin 425424
> zswpout 2011503
> zswpwb 4111

For the sake of completeness I re-ran that test with the bugfix and LZ4 
(so, zblock/lz4/8 cores/make -j32 bzImage) and I got:
real	7m44.154s
user	38m26.645s
sys	7m38.302s
zswpin 648108
zswpout 2490449
zswpwb 9499

So there's *no* significant cut with zstd in execution time, even on a 
Ryzen 9 and that invalidates your point. Sorry for the past confusion, 
it was an honest mistake from our side. If zsmalloc didn't OOM with lz4 
we probably would have seen the discrepancy and found the bug earlier.

And on ARM64 and RISC-V targets we have run the tests on, zstd is slower 
than lz4.

/Igor
