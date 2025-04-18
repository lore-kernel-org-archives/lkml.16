Received: from mailrelay1-3.pub.mailoutpod2-cph3.one.com (mailrelay1-3.pub.mailoutpod2-cph3.one.com [46.30.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B54155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973848; cv=none; b=Yd/v7BSxTKlwC8xyVtkHAZGdAGHmJfIRlG2Hod2MuPTnN3R518lT0ARJQOe8gvH0kHtD+YqVzuHdJu67AiFcRIGkowWYZZoGvDMVBebT8K9DJWoN8mPKlIZWMtRwppaYMOckqeOaE4Ubsa+I4TNiGO/Ie+DKjKWygBiXBVV/WTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973848; c=relaxed/simple;
	bh=HPs9FiBq5foCz519e5ewfOOfcWb7gAuP6rKSM91uROE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NDYLf1CFTPWAGCzVVkuEV1Kb9kF2hb9LTEoPdC+GYlNVCoD1+b955R4+h7F81/GVWq2Pb1J2Rw1NNUlRAs+VolPUYStgZStUz1nsnyfso0Js2JsLDuZAixT1/NJCr2FBrA3DbE0ocJZBj/yhDXZm+KVT9BGF0SkdXXQaCKbvsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=svRdxr72; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=tfBYMVXl; arc=none smtp.client-ip=46.30.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="svRdxr72";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="tfBYMVXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744973775; x=1745578575;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=HPs9FiBq5foCz519e5ewfOOfcWb7gAuP6rKSM91uROE=;
	b=svRdxr725Lf68qvQ59iEVWn4ASYuWxnAgh5R+SbOTbem6AcJ9xULXRWx2SjZSbiv5WcnL7cZHLAPG
	 Gwn8rkk88axvq5XslV8vdVLcmBFBP4cP1mxxYKx2MUFbFNHWJA0eiYof/YCxD2SxvZjOeih4H6sw/2
	 DUBS3EWXoUr3/CnxtMBCHFqHPS7OlltzfthRkrXynF/QEjLiIrmwo5+vTu/AjaPKr0KjQ/v27WxONC
	 rQZJKZScmYbajryMWObEp4Tg9NP01kcSjCB6GcPs22qhXVcUM1Oe7RTuk+zw60fWbP71A5uouzMiVj
	 3Ejsl2bGk75u3q/Htl9vTiu/xH2rnlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744973775; x=1745578575;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=HPs9FiBq5foCz519e5ewfOOfcWb7gAuP6rKSM91uROE=;
	b=tfBYMVXlsYJm2qWJpketlpchsmhfFF8bfx8pQKk66dc1xkFVxsVJ2aBUu2TI/zKo3d5Nbswat5YVa
	 iRw1rpeBA==
X-HalOne-ID: be69ea01-1c43-11f0-a248-4d2191f5f3b5
Received: from smtpclient.apple (unknown [194.195.91.43])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id be69ea01-1c43-11f0-a248-4d2191f5f3b5;
	Fri, 18 Apr 2025 10:56:14 +0000 (UTC)
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
In-Reply-To: <1ed925bd-897e-44b6-ad20-7d61c8c57aa8@redhat.com>
Date: Fri, 18 Apr 2025 12:56:02 +0200
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Igor Belousov <igor.b@beldev.am>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CECDD1E-5227-4719-B826-F6AFC77D4D75@konsulko.se>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <20250416120912.GC741145@cmpxchg.org>
 <1ed925bd-897e-44b6-ad20-7d61c8c57aa8@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Apr 18, 2025, at 12:52=E2=80=AFPM, David Hildenbrand =
<david@redhat.com> wrote:
>=20
> On 16.04.25 14:09, Johannes Weiner wrote:
>> On Sat, Apr 12, 2025 at 05:42:07PM +0200, Vitaly Wool wrote:
>>> zblock is a special purpose allocator for storing compressed pages.
>>> It stores integer number of same size objects per its block. These
>>> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
>>>=20
>>> With zblock, it is possible to densely arrange objects of various =
sizes
>>> resulting in low internal fragmentation. Also this allocator tries =
to
>>> fill incomplete blocks instead of adding new ones, in many cases
>>> providing a compression ratio comparable to zmalloc's.
>>>=20
>>> zblock is also in most cases superior to zsmalloc with regard to
>>> average performance and worst execution times, thus allowing for =
better
>>> response time and real-time characteristics of the whole system.
>> Is there a reason not to use this allocation scheme in zsmalloc then?
>> I'm curious what others think, but I'm still not convinced a second
>> allocator makes sense. It's maintenance overhead, a permanent =
struggle
>> to match feature parity, and it fragments development and testing =
base.
>> Not long ago several slab allocators were removed for those
>> reasons. Likewise, we just deleted zbud and z3fold because they =
didn't
>> get any attention and bitrotted, but not before years of inflicting
>> pain through the zpool interface, users accidentally making very
>> suboptimal choices, reporting the same bugs over and over again etc.
>> If you discovered a better allocation scheme, that's excellent. But I
>> don't see why it warrants forking the entire allocator.
>=20
> Just curious, I see a review on v4 happening on something that was =
nacked by two people in v2 [1].
>=20
> Do these nack's still apply or were something clarified and they no =
longer apply?

The reasons for both NAKs are no longer valid (since v3).

~Vitaly

>=20
>=20
> [1] =
https://lore.kernel.org/linux-mm/CAKEwX=3DMa9phmURz5nyJm0MQrWmXGFLFBPwr8-C=
x=3Dzbc473rx9A@mail.gmail.com/
>=20
> --=20
> Cheers,
>=20
> David / dhildenb
>=20

