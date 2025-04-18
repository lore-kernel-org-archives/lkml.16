Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740B2586E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962297; cv=none; b=gcFWNsJQHMO1bDVd1Kep6n4t+599pLteu89pVXUf8BBGRMFk68QZ2s+UnbmYgEiDg72skxDKJlt73JxyH20NtMILhi/s+69qhVlrFNgATxY5g/Nm0ih7YhJDZbH0SW1ZXApei8xfgXifUbV8qtQSCQw3jZ4MiGfIrCj4orjHwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962297; c=relaxed/simple;
	bh=8lxoWw9UQYOpkhhkceLfuseVPwo3ooXzBMIcimgB49Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WQM24t/FJ2Fq5Z3ztccjmGyG8t8pjcexTph1IM25bA+IM51ysxBOL/eelUt2X2ulgTk/mqtkK8kBH1T+BKjsNScdv/7k3+QQfgYIFSdB3tpNuV6nVfW5duJLdbDFrMbr5Z9rnpGn01zilZW/0euez3hP/zM4NRAz/JqZIOgl58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=BMFmGMHh; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=N3+o/VLq; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="BMFmGMHh";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="N3+o/VLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744962219; x=1745567019;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=8lxoWw9UQYOpkhhkceLfuseVPwo3ooXzBMIcimgB49Y=;
	b=BMFmGMHhvJMaVlx5BSP0wrqKH3iM8IhdycjnxOYgkJSPmN9skNomhnrYEY73QYt2wVUzKLRswSn2N
	 a+TcoaDo24Xx+VVIk4AqRYVUufCPvZFvYbK2irfJLTqjNnUumrHSGPZ1pY0t/t0WKOTDbLucwXlNZu
	 wQN5GjbHdMCryfCOmtaj/QALwXg4uOgdZcAs3FIohZMm6iOoNWiXeDKiR7ivN9FNRKHw0k9GAF8cVQ
	 K5Cr9BvPqbNL/cEG64ai4O65dtNHG9ZIcoHD/SDX+FXb47DJEbgygrOijQJ9Fxfie6bWemV1L2MVWy
	 umhuPDBKMHVqbGXruYtW8jWoALf460Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744962219; x=1745567019;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=8lxoWw9UQYOpkhhkceLfuseVPwo3ooXzBMIcimgB49Y=;
	b=N3+o/VLqQKXJ2LvQMMuErMNEAYdBekID9qsf9YUdXNBzAUJgnHCqZNzDR2kbBGqZR7/lIbTz9mhvw
	 omNMeNuCQ==
X-HalOne-ID: d55280a5-1c28-11f0-8f47-417246ffdc90
Received: from smtpclient.apple (unknown [82.118.29.98])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id d55280a5-1c28-11f0-8f47-417246ffdc90;
	Fri, 18 Apr 2025 07:43:39 +0000 (UTC)
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
In-Reply-To: <20250417141656.GC780688@cmpxchg.org>
Date: Fri, 18 Apr 2025 09:43:26 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Igor Belousov <igor.b@beldev.am>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A7AB7E7-4369-456D-80E9-A6B35227C373@konsulko.se>
References: <20250416120912.GC741145@cmpxchg.org>
 <1744834223790.7.2308@webmail-backend-production-58ff969799-kbd7f>
 <20250417141656.GC780688@cmpxchg.org>
To: Johannes Weiner <hannes@cmpxchg.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Apr 17, 2025, at 4:16=E2=80=AFPM, Johannes Weiner =
<hannes@cmpxchg.org> wrote:
>=20
> On Wed, Apr 16, 2025 at 10:10:23PM +0200, Vitaly wrote:
>>=20
>> On Wednesday, April 16, 2025 at 2:09:12 pm +02:00, Johannes Weiner =
<hannes@cmpxchg.org> wrote:
>>=20
>>>> zblock is also in most cases superior to zsmalloc with regard to
>>>> average performance and worst execution times, thus allowing for =
better
>>>> response time and real-time characteristics of the whole system.
>>=20
>>>> Is there a reason not to use this allocation scheme in zsmalloc =
then?
>>=20
>> Introducing such a scheme in zsmalloc is theoretically possible but
>> it appears to be more complicated than implementing it from scratch,
>> which is exactly what was done.
>=20
> Sure, but having two options adds sizable complexity as well.
>=20
>>> I'm curious what others think, but I'm still not convinced a second
>>> allocator makes sense. It's maintenance overhead, a permanent =
struggle
>>> to match feature parity, and it fragments development and testing =
base.
>>=20
>>> Not long ago several slab allocators were removed for those
>>> reasons. Likewise, we just deleted zbud and z3fold because they =
didn't
>>> get any attention and bitrotted, but not before years of inflicting
>>> pain through the zpool interface, users accidentally making very
>>> suboptimal choices, reporting the same bugs over and over again etc.
>>=20
>> I'm not sure what pain you are talking about.
>=20
> I list them in the paragraph you're replying to, and I've previously
> outlined the burden on developers, maintainers, and admins to support
> multiple implementations of the same functionality.
>=20
> There is a real cost to doing this that you seem to dismiss.

I don=E2=80=99t dismiss the cost of maintenance, I just don=E2=80=99t =
buy this =E2=80=9Cyears of pain=E2=80=9D point because it=E2=80=99s very =
subjective. There are many people who still think that using Linux is a =
pain. OTOH back in 2016-2017 mobile devices using z3fold had better =
response metrics than those using zsmalloc.
>=20
>> There were reasons why z3fold and zbud existed. z3fold and zbud were
>> the ones that supported page reclaim, zsmalloc wasn't quite usable
>> with zswap until recently. When we did z3fold it was outperforming
>> zsmalloc.
>=20
> We see a higher compression ratio than 3 on a wide variety of
> workloads, so I'm a little doubtful z3fold ever outperformed zsmalloc
> in general-purpose environments.

z3fold never outperformed zsmalloc in terms of allocation density but =
before zsmalloc got a *working* compaction implementation it was on par.
Besides, compression ratios higher than 3 had been pretty rare before =
zstd was introduced, and if you ever tried zstd on msm8009 which was the =
SoC for many mobile devices back then you=E2=80=99d have probably =
understood how pointless it was back then for most of the embedded =
world.

And at that time z3fold was indeed faster than zsmalloc on multi-core =
systems, and especially on big.LITTLE.

>=20
> When Meta started using zswap, certainly zsmalloc was the only real
> contender. zbud's storage density was almost not worth the cost of
> compression. z3fold was also not dense enough, and we ran into
> stability issues and crashes. The page reclaim/writeback
> implementation was not very useful either - take a look at the history
> of changes from Nhat and Domenico. These weren't just issues specific
> to our usecases, but much more blatant "how was this ever supposed to
> work?" problems.
>=20
> There is nothing wrong with the evolution from zbud to more
> sophisticated allocators. But there is a pretty mature and
> feature-rich allocator now, and that sets a floor on what new
> allocators need to support to be considered general-purpose.
>=20
>> With that said, I didn't object to removing z3fold because I did
>> understand that it made no sense to keep it at that point.
>=20
> But you're proposing to do the same thing again, when multiple people
> just got done phasing out and cleaning up your previous experiments.

Oh well, the conversation is taking a twist. Do you mean that any new =
submission is =E2=80=9Cthe same thing again=E2=80=9D? Or what exactly do =
you mean here?
=20
>=20
>>> I also don't buy the fragmentation argument. Even if you are better =
at
>>> packing during allocation time (although, citation needed), the
>>> workload can unmap swap pages such that they leave partial blocks
>>> behind indefinitely if you don't have block compaction.
>>=20
>> We published Zswap/Zswapped values for zblock/zsmalloc after stress
>> loads and those were on par, basically.
>=20
> Those are accounted in zswap, so unfortunately don't capture backend
> fragmentation. You'd need to implement some of the debugging features
> and memory counters that zsmalloc has in order to compare them.

zblock reports total_pages in an honest way, i. e. the amount of pages =
it allocated, no matter how full or empty these are, and the numbers =
clearly show there=E2=80=99s no substantial internal fragmentation for =
any real life workloads we could come up with. You can of course =
allocate a bunch of slots and then free every second one and not do =
anything else at all and then the fragmentation will be large, but this =
is not how zswap operates.=20

FWIW it is possible to make zsmalloc constantly alternate between =
compaction and fragmentation but this will not mimic either zram or =
zswap operation too.


>>> Then there is the migration support, which you said is planned, but
>>> which would presumably require the same indirection between handle =
and
>>> the backing pages that zsmalloc has. How much will this eat into the
>>> performance advantage?
>>=20
>> I don't think that will be necessary. We're working on supporting
>> GFP_MOVABLE and minimising high order allocations
>=20
>>> I'd much rather you'd focus on making zsmalloc better. Improve the
>>> packing scheme, make expensive features optional/configurable etc.
>>> That would be easier on developers and users alike.
>>=20
>> zblock's source code is almost 5x smaller in size than zsmalloc's
>=20
> It's an apple-to-oranges comparison.
>=20
> zsmalloc has memory pressure handling and a rich debugging
> infrastructure that was added over time based on what people thought
> necessary and useful from production experience.
>=20
> Implement the same functionality in zblock and we can compare lines
> and performance.

You assume that e.g. memory pressure handing implemented in zsmalloc is =
necessary for zblock, which I don=E2=80=99t think is the case.=20
Debug facilitating additions are good but I _really_ _doubt_ these will =
bloat zblock code by 5x.
>=20
>> and yet zblock works better in many cases with just a few
>> bottlenecks. Why would you mind that we'd focus on making zblock
>> better instead and possibly retire zsmalloc when that mission is
>> accomplished, just like we retired z3fold a while ago?
>=20
> You're proposing a significant, open-ended maintenance burden for
> everybody else. I'm just asking for some justification stronger than
> "the small subset of the backend allocator that we implemented is
> slightly faster in a limited number of benchmarks."

Obviously we will be maintaining and extending the code, we have already =
discussed that.

>=20
> The fact that zstd - a very commonly used compressor - immediately
> surfaced bugs that made it *much slower* is not reassuring.

I would expect that someone stating that first would first ask what the =
problem actually was. :)

~Vitaly


