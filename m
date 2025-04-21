Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71C145A03
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221835; cv=none; b=Av3c0o+FybeHEMt3m+r/10XGgAMIA5MT+FavT2iSS6tLt3zzhUTn4quVXi+Zm4YhRyeKRmcfno2dCZrWkSv2opoZHtOI8UOh7I1sZ8V25oMPVFrEid+PyJW+0bGl2nvlURcn60Kg4xDGVxbJe33k5f39mml6SsPr3MxNsLKG4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221835; c=relaxed/simple;
	bh=W2Qp/d8PvHnrcy34x9Hl8x2Af2CyHvmp/Vz5c6ghKuQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=ELu3zvsvALSria0Tk6E53cy5Rv32YMzJMBAAg0VlcFA4aQCXVQCo/+3xTJTZrvn7X125tWUYhxA95hweBMBGM7wYnlKc8zpQu/+ZMtGfB9kM5uEgx7CLVWb6QVzNAkYeNSX4cJtGDg1moldaFdAAW2+sV/AnnRzkK0MRsddVfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ssFRZZiq; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ssFRZZiq"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745221830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzZEsd+SPVpO1m5I3YRQWEXq4CH8cQcLxPi4udO/QS0=;
	b=ssFRZZiqfaMpX2SkYW/lXwV24BV2/PA6+K2c0UZzMju1IU48FRMzWIdvpl2uplQrzUx9ci
	KBOwTHWCCKaewk3Verc2oHN7pN+/VWT4m9zfyxWWt1ny29Fj4+C2qzKsyd1AHEzLcdAA9+
	aAefDUF2tYA2YIPhXJ6igKalMkM6vk8=
Date: Mon, 21 Apr 2025 07:50:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <63cc131c78e6fe37755b3e39f90558469a0e80f4@linux.dev>
TLS-Required: No
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: "David Hildenbrand" <david@redhat.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Lance Yang" <ioworker0@gmail.com>
In-Reply-To: <d562572c-6b0d-443f-bcae-b862338fa7f7@redhat.com>
References: <20250418152228.20545-1-lance.yang@linux.dev>
 <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
 <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
 <1c81b176893c349dfb12feaebd17e0694fedec0b@linux.dev>
 <d562572c-6b0d-443f-bcae-b862338fa7f7@redhat.com>
X-Migadu-Flow: FLOW_OUT

April 21, 2025 at 3:17 PM, "David Hildenbrand" <david@redhat.com> wrote:



>=20
>=20On 21.04.25 07:16, Lance Yang wrote:
>=20
>=20>=20
>=20> April 21, 2025 at 1:13 PM, "Lance Yang" <lance.yang@linux.dev> wrot=
e:
> >=20
>=20>  > >>
> >=20
>=20> >=20
>=20> > April 21, 2025 at 7:29 AM, "Andrew Morton" <akpm@linux-foundation=
.org> wrote:
> > >=20
>=20>=20
>=20>  On Fri, 18 Apr 2025 23:22:28 +0800 Lance Yang <ioworker0@gmail.com=
> wrote:
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  From: Lance Yang <lance.yang@linux.dev>
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  To prevent folio_test_large_maybe_mapped_shared() from being used =
without
> >=20
>=20>  >>>
> >=20
>=20>  CONFIG_MM_ID, we add a compile-time check rather than wrapping it =
in
> >=20
>=20>  >>>
> >=20
>=20>  '#ifdef', avoiding even more #ifdef in callers that already use
> >=20
>=20>  >>>
> >=20
>=20>  IS_ENABLED(CONFIG_MM_ID).
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  Also, we used plenty of IS_ENABLED() on purpose to keep the code f=
ree of
> >=20
>=20>  >>>
> >=20
>=20>  '#ifdef' mess.
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  I dunno, this just seems really whacky.
> >=20
>=20> >=20
>=20> > I'd hope David could leave some comments on that.
> > >=20
>=20>=20
>=20>  --- a/include/linux/page-flags.h
> >=20
>=20>  >>>
> >=20
>=20>  +++ b/include/linux/page-flags.h
> >=20
>=20>  >>>
> >=20
>=20>  @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const st=
ruct folio *folio)
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  static inline bool folio_test_large_maybe_mapped_shared(const stru=
ct folio *folio)
> >=20
>=20>  >>>
> >=20
>=20>  {
> >=20
>=20>  >>>
> >=20
>=20>  + /* This function should never be called without CONFIG_MM_ID ena=
bled. */
> >=20
>=20>  >>>
> >=20
>=20>  >>>
> >=20
>=20>  A correcter comment would be "This function should never be compil=
ed
> >=20
>=20>  >>>
> >=20
>=20>  without CONFIG_MM_ID enabled".
> >=20
>=20> >=20
>=20> > Yes, that is more exact ;)
> > >=20
>=20>=20
>=20>  Which lets the cat out of the bag. Why the heck is it being compil=
ed
> >=20
>=20>  >>>
> >=20
>=20>  with CONFIG_MM_ID=3Dn?? We have tools to prevent that.
> >=20
>=20>  >>>
> >=20
>=20>  Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? =
It
> >=20
>=20>  >>>
> >=20
>=20>  should have no callers, right? If the linker ends up complaining t=
hen
> >=20
>=20>  >>>
> >=20
>=20>  something went wrong.
> >=20
>=20> >=20
>=20> > The reason we can't simply add #ifdef CONFIG_MM_ID around folio_t=
est_large_maybe_mapped_shared()
> > >=20
>=20> >  is because its caller folio_maybe_mapped_shared() relies on IS_E=
NABLED(CONFIG_MM_ID).
> > >=20
>=20>=20
>=20>  static inline bool folio_maybe_mapped_shared(struct folio *folio)
> >=20
>=20>  {
> >=20
>=20>  [...]
> >=20
>=20>  if (!IS_ENABLED(CONFIG_MM_ID))
> >=20
>=20>  return true;
> >=20
>=20>  [...]
> >=20
>=20>  return folio_test_large_maybe_mapped_shared(folio);
> >=20
>=20>  }
> >=20
>=20>  folio_maybe_mapped_shared() is always available - doesn't depend o=
n
> >=20
>=20>  CONFIG_MM_ID or CONFIG_TRANSPARENT_HUGEPAGE.
> >=20
>=20
> We could #ifdef in folio_maybe_mapped_shared(), which I find rather sub=
optimal ...
>=20
>=20or simply inline it into the 4 callers.
>=20
>=20That might be the best approach, given that only selected user should=
 be using the low-level primitive and everybody else should be using foli=
o_maybe_mapped_shared().

Yep, I tend to prefer the second approach as well, given there are only
four callers. Andrew, wdyt?

Thanks,
Lance

>=20
>=20-- Cheers,
>=20
>=20David / dhildenb
>
