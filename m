Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20CCA64
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745212617; cv=none; b=GSZ94KmM/IZwb6Ljh39JJrBpRee/UWBwNr0B7dvtPhNoVdST2DbWrB1hPFN3fwt36c6sSIweQ55zhs4ARK/67kg92BWBjGB0zwUtUbz2CCN3X4ZgIMbTw7m+DcyX1zWaAVQIlxQ+TOS6wmFbKQtv1Na6NmgaIRntiDHuH7gVpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745212617; c=relaxed/simple;
	bh=Xpgua8uY9AArNZuQxfVHNoQT+4ThDorZ4B4RMHKQMKE=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Y4JKhyKib14Umwx0r13RzMhgT4SfF4mjT+RBaKivQLMllRsCnff8yk689fp51OPZq1khycLF9dt3Uj8fVv3+rYrIvyD+LwKcyzuNe5iG5UnCdf3Zsfe+5Fplzj5IE2MRiQufHH6lmxDmsTbZ8G3Cg1d71NBPURfdI4aqeUIJBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kde8CY+a; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kde8CY+a"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745212612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4O7CDAquGBCTH1tiwOC9eraJRYUQuQ5ReGibCOzzl0=;
	b=Kde8CY+aUjqemZ8mMv8sIYFX7XhfWT3GRsXUqStLU5wXG3xNdw6LgfIGgsfFCVKldO0OTO
	Mu/nHnj4lulDD1iwzaKdt7zHWuOKa1y/0kBK70sqgnmCm0kOqFMKUAc7/lU2UlXB8u/2mA
	wVFDUaXclW5F7wFkexcX2WQdIlNcz/g=
Date: Mon, 21 Apr 2025 05:16:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <1c81b176893c349dfb12feaebd17e0694fedec0b@linux.dev>
TLS-Required: No
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@redhat.com>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Lance Yang" <ioworker0@gmail.com>
In-Reply-To: <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
References: <20250418152228.20545-1-lance.yang@linux.dev>
 <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
 <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
X-Migadu-Flow: FLOW_OUT

April 21, 2025 at 1:13 PM, "Lance Yang" <lance.yang@linux.dev> wrote:



>=20
>=20April 21, 2025 at 7:29 AM, "Andrew Morton" <akpm@linux-foundation.org=
> wrote:
>=20
>=20>=20
>=20> On Fri, 18 Apr 2025 23:22:28 +0800 Lance Yang <ioworker0@gmail.com>=
 wrote:
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  From: Lance Yang <lance.yang@linux.dev>
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  To prevent folio_test_large_maybe_mapped_shared() from being used =
without
> >=20
>=20>=20=20
>=20>=20
>=20>  CONFIG_MM_ID, we add a compile-time check rather than wrapping it =
in
> >=20
>=20>=20=20
>=20>=20
>=20>  '#ifdef', avoiding even more #ifdef in callers that already use
> >=20
>=20>=20=20
>=20>=20
>=20>  IS_ENABLED(CONFIG_MM_ID).
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  Also, we used plenty of IS_ENABLED() on purpose to keep the code f=
ree of
> >=20
>=20>=20=20
>=20>=20
>=20>  '#ifdef' mess.
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  I dunno, this just seems really whacky.
> >=20
>=20
> I'd hope David could leave some comments on that.
>=20
>=20>=20
>=20> --- a/include/linux/page-flags.h
> >=20
>=20>=20=20
>=20>=20
>=20>  +++ b/include/linux/page-flags.h
> >=20
>=20>=20=20
>=20>=20
>=20>  @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const st=
ruct folio *folio)
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  static inline bool folio_test_large_maybe_mapped_shared(const stru=
ct folio *folio)
> >=20
>=20>=20=20
>=20>=20
>=20>  {
> >=20
>=20>=20=20
>=20>=20
>=20>  + /* This function should never be called without CONFIG_MM_ID ena=
bled. */
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  A correcter comment would be "This function should never be compil=
ed
> >=20
>=20>=20=20
>=20>=20
>=20>  without CONFIG_MM_ID enabled".
> >=20
>=20
> Yes, that is more exact ;)
>=20
>=20>=20
>=20> Which lets the cat out of the bag. Why the heck is it being compile=
d
> >=20
>=20>=20=20
>=20>=20
>=20>  with CONFIG_MM_ID=3Dn?? We have tools to prevent that.
> >=20
>=20>=20=20
>=20>=20
>=20>  Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? =
It
> >=20
>=20>=20=20
>=20>=20
>=20>  should have no callers, right? If the linker ends up complaining t=
hen
> >=20
>=20>=20=20
>=20>=20
>=20>  something went wrong.
> >=20
>=20
> The reason we can't simply add #ifdef CONFIG_MM_ID around folio_test_la=
rge_maybe_mapped_shared()
>=20
>=20is because its caller folio_maybe_mapped_shared() relies on IS_ENABLE=
D(CONFIG_MM_ID).

static inline bool folio_maybe_mapped_shared(struct folio *folio)
{
        [...]
        if (!IS_ENABLED(CONFIG_MM_ID))
                return true;
        [...]
        return folio_test_large_maybe_mapped_shared(folio);
}

folio_maybe_mapped_shared() is always available - doesn't depend on
CONFIG_MM_ID or CONFIG_TRANSPARENT_HUGEPAGE.

Thanks,
Lance


>=20
>=20If we do, with CONFIG_TRANSPARENT_HUGEPAGE=3DN, we'll hit compilation=
 errors like:
>=20
>=20./include/linux/mm.h: In function =E2=80=98folio_maybe_mapped_shared=
=E2=80=99:
>=20
>=20./include/linux/mm.h:2337:16: error: implicit declaration of function=
 =E2=80=98folio_test_large_maybe_mapped_shared=E2=80=99; did you mean =E2=
=80=98folio_maybe_mapped_shared=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
>=20
>=20 2337 | return folio_test_large_maybe_mapped_shared(folio);
>=20
>=20 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
>=20 | folio_maybe_mapped_shared
>=20
>=20cc1: some warnings being treated as errors
>=20
>=20Thanks,
>=20
>=20Lance
> >=20
>=20>=20
>=20>
>
