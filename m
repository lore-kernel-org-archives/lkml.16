Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF94A21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153968; cv=none; b=pBHJsBz1brwFgf3V6ddTySxBu4jQQqoy4dAP+/vAsadKm/eevnwblKPHAtUpMDwlh87qxlWwVQn04uHSwW9SlusKPrkI9X3iE14NqtV3iFXCoBRLHK7q+ZSQ+WM44q1rgT+tkizqE9EGMTwTvfTx4FYQwF/UGxMmZXK3/rGpOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153968; c=relaxed/simple;
	bh=h9DDZOmUzxP2zKuD0TuYJdDRKLvWdLZ3WGLWuUbG0Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBJ6DEgDp2LY7lpyc3YklIKC0YosVZdXDMl22pMQmkUfvUR2l/OxSiINvWuS3elegj5EI/CUqMiY6tPilKvZ3BlW34hG8CJEyWLOoKDlYj20A6TOnsjq9vp7EVZ3r+Lu7Ipb9DgBoxL3OvbXqr60GdYsmZTvLzyS29x0td2rvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=vvSWBgNZ; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Aoke+BTH; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="vvSWBgNZ";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Aoke+BTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744153959; x=1744758759;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=Y+YiStRvb9f3Iob4ax1/jWCFHRVxG9qjdqNePl5lmL4=;
	b=vvSWBgNZUyj0z4H+0cV1bylSZnOy0qTLeMI4htnAI8WeJcQJ1IhntC6jXkuCQgrjfd/50uKAf3KyY
	 eFA9rK65tJjlR6N/6LcAafhjboFdEn7AcDYLPYK1+UVLHwfuMS600T59UD0p7CBBbY2j1BaanLPdTY
	 n8kC2sWM6/eFLM8OcSZLGvDz7Wsp53+LPQ4x9koUuB+cPJfW1dNhuEg2gHPkPTl6gBKWRafha74W0O
	 sNIr4xbsjXGrsXElg74DzRTEb1pQ3f3JSMCnNjkNuqYmwlhfhPeXCadczUgYa+TkG0ApsW7cKhzdHX
	 1oBH3VzsBJ8SDBCH063e9t2ltLP0LsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744153959; x=1744758759;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=Y+YiStRvb9f3Iob4ax1/jWCFHRVxG9qjdqNePl5lmL4=;
	b=Aoke+BTH8IDPVT4OO+RoxOsvU2gYpEEwASCH+iny4aVBwfUpBtEKu+pgQEbnRfyYQJWlX6/MNonaQ
	 /nGW4fPBg==
X-HalOne-ID: f5ff7cc9-14ce-11f0-94d3-29b2d794c87d
Received: from [192.168.10.245] (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id f5ff7cc9-14ce-11f0-94d3-29b2d794c87d;
	Tue, 08 Apr 2025 23:12:39 +0000 (UTC)
Message-ID: <ed517e4a-70db-4e80-9fbe-b1a4cfe3a11c@konsulko.se>
Date: Wed, 9 Apr 2025 01:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Igor Belousov <igor.b@beldev.am>,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am>
 <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am>
 <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am>
 <20250408195533.GA99052@cmpxchg.org>
 <24e77aad-08ca-41c4-8e64-301fcc9370b1@konsulko.se>
 <CAKEwX=Pf3qA=u7KBcknnkYnfJ48YmUj8FYN=X5C8OCXrsMW9=w@mail.gmail.com>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <CAKEwX=Pf3qA=u7KBcknnkYnfJ48YmUj8FYN=X5C8OCXrsMW9=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> So zstd results in nearly double the compression ratio, which in turn
>>> cuts total execution time *almost in half*.
>>>
>>> The numbers speak for themselves. Compression efficiency >>> allocator
>>> speed, because compression efficiency ultimately drives the continuous
>>> *rate* at which allocations need to occur. You're trying to optimize a
>>> constant coefficient at the expense of a higher-order one, which is a
>>> losing proposition.
>>
>> Well, not really. This is an isolated use case with
>> a. significant computing power under the hood
>> b. relatively few cores
>> c. relatively short test
>> d. 4K pages
>>
>> If any of these isn't true, zblock dominates.
>> !a => zstd is too slow
>> !b => parallelization gives more effect
>> !c => zsmalloc starts losing due to having to deal with internal
>> fragmentation
>> !d => compression efficiency of zblock is better.
>>
>> Even !d alone makes zblock a better choice for ARM64 based servers.
>>
>> ~Vitaly
> 
> Could you expand on each point? And do you have data to show this?
> 
> For b, we run zswap + zsmalloc on hosts with hundreds of cores, and
> have not found zsmalloc to be a noticeable bottleneck yet, FWIW.

I don't have the numbers at hand, I think Igor will be able to provide 
those tomorrow.

> For c - in longer runs, how does zblock perform better than zsmalloc?
> In fact, my understanding is that zsmalloc does compaction, which
> should help with internal fragmentation over time. zblock doesn't seem
> to do this, or maybe I missed it?

The thing is, zblock doesn't have to. Imagine a street with cars parked 
at side. If you have cars of different lengths which drive in and out, 
you'll end up with spaces in between that longer cars won't be able to 
squeeze in to. This is why zsmalloc does compaction.

Now for zblock you can say that only same length cars are allowed to 
park on one street and therefore that street is either full or you will 
have a place.

> For d too. I see that you hard code special configurations for zblock
> blocks in the case of 0x4000 page size, but how does that help with
> compression efficiency?

Well, to be able to answer that I need to dig more into zsmalloc 
operation, but i would guess that zsmalloc's chunks are just multiplied 
by 4 in case of 16K page and thus you lose all the granularity you used 
to have, but I'm not completely certain.

Meanwhile I did a quick measurement run with zblock and zsmalloc on a 
Raspberry Pi 5 (native kernel build test) with zstd as the compression 
backend and the results are the following:

1. zsmalloc
*** The build was OOM killed ***
real    26m58.876s
user    95m32.425s
sys     4m39.017s
Zswap:            250944 kB
Zswapped:         871536 kB
zswpin 108
zswpout 54473
663296  /mnt/tmp/build/

2. zblock
real    27m31.579s
user    96m42.845s
sys     4m40.464s
Zswap:             66592 kB
Zswapped:         563168 kB
zswpin 243
zswpout 35262
1423200 /mnt/tmp/build/

You can see by the size of the build folder that the first run was 
terminated prematurely not at all close to the end of it.

So, I can re-run the tests on 8-core high performance ARM64 with 16K 
pages tomorrow, but so far everything we have seen points in one 
direction: zblock is clearly superior to zsmalloc in 16K page configuration.

Besides, zblock can do even better if we extend that very hardcoded 
table you mentioned (and BTW, it can be automatically generated at init 
but I don't see the point in that).

~Vitaly
