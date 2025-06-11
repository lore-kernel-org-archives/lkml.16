Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4ED1B4F1F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749661990; cv=none; b=DwuWpONpGBcr5I3MJlM+GnE3+Mkq39zj3nR4rQ8aHafWnuY526aV6WfTNbNJBOik5xMKVboC1F44HlZMuQ4rnMtgZ5oj1QwAS7MxvVWhitmP4y26jRZ2lXqnfdzGuN+l4koAI/JT5NIkn3GqPe++2tDz6fXlt+DsY9jPPysbL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749661990; c=relaxed/simple;
	bh=84WoXnekke+/EOYukFwA6C4CFkxRvsEpoPC0KWQ4GBo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Eac8na+pGex+GsregVjX2RNWsAlIDbTl37x22cgxQNsqGukbjhEZcVsss+mFSQ05Swmt9+Cm3o6YRStTeVpkdi2dBcw6/xR5X+iIf6EPCRe69UzoeoDVJhg8XR8SMxzR4vkIMA51UWKO40NSfDZPSuTtUW2VDg7/iHfnkixwA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Lcj3M4cX; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=92h/a/6B; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Lcj3M4cX";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="92h/a/6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749661916; x=1750266716;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=GaVAQSgpZoBNTHsju8IZV9S1B2pmDlHGv+cf1Lx2veQ=;
	b=Lcj3M4cXuSGOglipCNW0A9sFPKhE7gIdV/r9KNuSPSyGTf2Z1G+h97Q0RL0sJSBTu3k18QBQXiCy2
	 e5NsyswtIHh8duxE/mabUWKikHRyCJdcPWmTJSSmU7ZlMfN5FLCaLj0ljgZx0Qy7dzuAXlt/LU9fmc
	 uXdQoykaNT/w+a1ymWGl+IbZIO+Lpzys0FqLtQqW45dfbEQSQEV4jJ70jrgnRqd1Y6aq9GmL855Bqa
	 QbA2gdIJSvsGGGA1CD5tlKD6EhBDxgu2Bv6tWPy12mTVvwEl5FGPrZWhXUjnWNgNZiicH6STlq4xv5
	 FX9dQ8Xzo40SQPe/nXNCH26RigqDeiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749661916; x=1750266716;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=GaVAQSgpZoBNTHsju8IZV9S1B2pmDlHGv+cf1Lx2veQ=;
	b=92h/a/6B2VYlQP+RYkY/9XxN1YeHpMZedVHeGcdnYmANnQfBEBHIEzawaClWaTD4FLgNG42pJxnN9
	 +90fAcGCQ==
X-HalOne-ID: 2cb8d90a-46e7-11f0-ae00-e90f2b8e16ca
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 2cb8d90a-46e7-11f0-ae00-e90f2b8e16ca;
	Wed, 11 Jun 2025 17:11:55 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v4] mm: add zblock allocator
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aBoI39N_mHx0Tlp-@google.com>
Date: Wed, 11 Jun 2025 19:11:53 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Igor Belousov <igor.b@beldev.am>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84279524-384D-4843-B205-0F850828C782@konsulko.se>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.> <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
 <aBIXJrbxCmYSoCuz@Asmaa.> <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>
 <aBoI39N_mHx0Tlp-@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
X-Mailer: Apple Mail (2.3826.200.121)



> On May 6, 2025, at 3:04=E2=80=AFPM, Yosry Ahmed =
<yosry.ahmed@linux.dev> wrote:
>=20
> On Thu, May 01, 2025 at 02:41:29PM +0200, Vitaly Wool wrote:
>> Hi Yosry,
>>=20
>> On 4/30/25 14:27, Yosry Ahmed wrote:
>>> On Wed, Apr 23, 2025 at 09:53:48PM +0200, Vitaly Wool wrote:
>>>> On 4/22/25 12:46, Yosry Ahmed wrote:
>>>>> I didn't look too closely but I generally agree that we should =
improve
>>>>> zsmalloc where possible rather than add a new allocator. We are =
trying
>>>>> not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc =
is
>>>>> getting a lot of mileage from both zswap and zram, and is =
more-or-less
>>>>> battle-tested. Let's work toward building upon that instead of =
starting
>>>>> over.
>>>>=20
>>>> The thing here is, zblock is using a very different approach to =
small object
>>>> allocation. The idea is: we have an array of descriptors which =
correspond to
>>>> multi-page blocks divided in chunks of equal size (block_size[i]). =
For each
>>>> object of size x we find the descriptor n such as:
>>>> block_size[n-1] < n < block_size[n]
>>>> and then we store that object in an empty slot in one of the =
blocks. Thus,
>>>> the density is high, the search is fast (rbtree based) and there =
are no
>>>> objects spanning over 2 pages, so no extra memcpy involved.
>>>=20
>>> The block sizes seem to be similar in principle to class sizes in
>>> zsmalloc. It seems to me that there are two apparent differentiating
>>> properties to zblock:
>>>=20
>>> - Block lookup uses an rbtree, so it's faster than zsmalloc's list
>>>   iteration. On the other hand, zsmalloc divides each class into
>>>   fullness groups and tries to pack almost full groups first. Not =
sure
>>>   if zblock's approach is strictly better.
>>=20
>> If we free a slot in a fully packed block we put it on top of the =
list.
>> zswap's normal operation pattern is that there will be more free =
slots in
>> that block so it's roughly the same.
>=20
> How so? IIUC the order in which slots are freed depends on the LRU =
(for
> writeback) and swapins (for loads). Why do we expect that slots from =
the
> same block will be freed in close succession?
>=20
>>=20
>>> - Zblock uses higher order allocations vs. zsmalloc always using =
order-0
>>>   allocations. I think this may be the main advantage and I remember
>>>   asking if zsmalloc can support this. Always using order-0 pages is
>>>   more reliable but may not always be the best choice.
>>=20
>> There's a patch we'll be posting soon with "opportunistic" high order
>> allocations (i. e. if try_alloc_pages fails, allocate order-0 pages
>> instead). This will leverage the benefits of higher order allocations
>> without putting too much stress on the system.
>>=20
>>> On the other hand, zblock is lacking in other regards. For example:
>>> - The lack of compaction means that certain workloads will see a lot =
of
>>>   fragmentation. It purely depends on the access patterns. We could =
end
>>>   up with a lot of blocks each containing a single object and there =
is
>>>   no way to recover AFAICT.
>>=20
>> We have been giving many variants of stress load on the memory =
subsystem and
>> the worst compression ratio *after* the stress load was 2.8x using =
zstd as
>> the compressor (and about 4x under load). With zsmalloc under the =
same
>> conditions the ratio was 3.6x after and 4x under load.
>>=20
>> With more normal (but still stressing) usage patterns the numbers =
*after*
>> the stress load were around 3.8x and 4.1x, respectively.
>>=20
>> Bottom line, ending up with a lot of blocks each containing a single =
object
>> is not a real life scenario. With that said, we have a quite simple =
solution
>> in the making that will get zblock on par with zsmalloc even in the =
cases
>> described above.
>=20
> Could you share a high-level description of how this issue will be
> addressed in zblock? I am trying to understand why/how zblock can =
handle
> this better/simpler than zsmalloc.
>=20
>>=20
>>> - Zblock will fail if a high order allocation cannot be satisfied, =
which
>>>   is more likely to happen under memory pressure, and it's usually =
when
>>>   zblock is needed in the first place.
>>=20
>> See above, this issue will be addressed in the patch coming in a =
really
>> short while.
>>=20
>>> - There's probably more, I didn't check too closely, and I am hoping
>>>   that Minchan and Sergey will chime in here.
>>>=20
>>>>=20
>>>> And with the latest zblock, we see that it has a clear advantage in
>>>> performance over zsmalloc, retaining roughly the same allocation =
density for
>>>> 4K pages and scoring better on 16K pages. E. g. on a kernel =
compilation:
>>>>=20
>>>> * zsmalloc/zstd/make -j32 bzImage
>>>> real 8m0.594s
>>>> user 39m37.783s
>>>> sys 8m24.262s
>>>> Zswap:            200600 kB <-- after build completion
>>>> Zswapped:         854072 kB <-- after build completion
>>>> zswpin 309774
>>>> zswpout 1538332
>>>>=20
>>>> * zblock/zstd/make -j32 bzImage
>>>> real 7m35.546s
>>>> user 38m03.475s
>>>> sys 7m47.407s
>>>> Zswap:            250940 kB <-- after build completion
>>>> Zswapped:         870660 kB <-- after build completion
>>>> zswpin 248606
>>>> zswpout 1277319
>>>>=20
>>>> So what we see here is that zblock is definitely faster and at =
least not
>>>> worse with regard to allocation density under heavy load. It has =
slightly
>>>> worse _idle_ allocation density but since it will quickly catch up =
under
>>>> load it is not really important. What is important is that its
>>>> characteristics don't deteriorate over time. Overall, zblock is =
simple and
>>>> efficient and there is /raison d'etre/ for it.
>>>=20
>>> Zblock is performing better for this specific workload, but as I
>>> mentioned earlier there are other aspects that zblock is missing.
>>> Zsmalloc has seen a very large range of workloads of different =
types,
>>> and we cannot just dismiss this.
>>=20
>> We've been running many different work loads with both allocators but
>> posting all the results in the patch description will go well beyond =
the
>> purpose of a patch submission. If there are some workloads you are
>> interested in in particular, please let me know, odds are high we =
have some
>> results for those too.
>=20
> That's good to know. I don't have specific workloads in mind, was just
> stating the fact that zsmalloc has been tested with a variety of
> workloads in production environments.
>=20
>>=20
>>>> Now, it is indeed possible to partially rework zsmalloc using =
zblock's
>>>> algorithm but this will be a rather substantial change, equal or =
bigger in
>>>> effort to implementing the approach described above from scratch =
(and this
>>>> is what we did), and with such drastic changes most of the testing =
that has
>>>> been done with zsmalloc would be invalidated, and we'll be out in =
the wild
>>>> anyway. So even though I see your point, I don't think it applies =
in this
>>>> particular case.
>>>=20
>>>=20
>>> Well, we should start by breaking down the differences and finding =
out
>>> why zblock is performing better, as I mentioned above. If it's the
>>> faster lookups or higher order allocations, we can work to support =
that
>>> in zsmalloc. Similarly, if zsmalloc has unnecessary complexity it'd =
be
>>> great to get rid of it rather than starting over.
>>>=20
>>> Also, we don't have to do it all at once and invalidate the testing =
that
>>> zsmalloc has seen. These can be incremental changes that get spread =
over
>>> multiple releases, getting incremental exposure in the process.
>>=20
>> I believe we are a lot closer now to having a zblock without the =
initial
>> drawbacks you have pointed out than a faster zsmalloc, retaining the =
code
>> simplicity of the former.
>=20
> This does not answer my question tho. I am trying to understand what
> makes zblock faster than zsmalloc.
>=20
> If it's the (optionally opportunistic) higher order allocations, we =
can
> probably do the same in zsmalloc and avoid memcpys as well. I guess we
> can try to allocate zspages as a high-order contiguous allocation =
first,
> and fallback to the current "chain" structure on failure.

We got rid of high order allocations and see better results now. vmalloc =
works well for our purpose.


> I am not arguing that you're seeing better results from zblock, what I
> am saying is let's pinpoint what makes zblock better first, then =
decide
> whether the same can be applied to zsmalloc or if it's really better =
to
> create a new allocator instead. Right now we don't have full
> information.
>=20
> WDYT?

I would suggest that we focused on what zblock could deliver what =
zsmalloc doesn=E2=80=99t seem to be able to. E. g. it=E2=80=99s easy to =
add block descriptors at runtime basing on the statistics from the =
existing allocations, and it will lead to even higher compression =
density. Since zsmalloc only operates on 2^n sized objects, it doesn=E2=80=
=99t have that flexibility and it=E2=80=99s not possible to add it =
without making it essentially a zblock. I believe this is also why =
zsmalloc is losing to zblock in compression density on 16K pages =
already.

~Vitaly=
