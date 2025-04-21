Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0F11DF246
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745212395; cv=none; b=ToUoPBukbstzhBpZv14XswwizrSffSW991lry6mpe/az3Ci3QAJ7ds+vZBzixsrTop3NDeredhulZC15Z9SztkOuznIH/HTXEs3j67OOXc1mF5JK6ZEYn8/s4EIPK9ApERSfgWn0WYxZgOHUKzj8lDGliOd/UF41wg5AODE+5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745212395; c=relaxed/simple;
	bh=mReNNPuNhp7xf3f+8g5zttLQwu1tj4uLl3lDmZGL9u4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Da/plqYF8QofecBH41pfFemP8Uaa+wmysYa8dAZ6sGcRXmjaBaRii9xwxcQBUjOhYzFD6ionSK3e+SCcBgD61+XQMZErd5ZQCuk4FWFHXAbs3Ggbc5alxq9rwyCUpCW9PP3/BlFjV9asqhzxFiulK6JMOsETDZW+x8QQzYjSSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fhM1GVzx; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fhM1GVzx"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745212388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yba2DH1EDjNgUXaKKw6VxTi22gaO7PDpRoTTNn5NzZY=;
	b=fhM1GVzxQjaB8x1SFxwmzboWOamHOE0Rbn8NO4APvL2/MHiixtTPE1IzY3nnSwa+Q7nO3Z
	9H06+n43qByybukVepL4b6c/TlJ/nICrronhpL1Hgnkb7zEIxD0DqKzkgksR+HM15NQ6Pp
	QlpKjOt1nIkSgR9xomwKuyCFg13yhZc=
Date: Mon, 21 Apr 2025 05:13:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
TLS-Required: No
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@redhat.com>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Lance Yang" <ioworker0@gmail.com>
In-Reply-To: <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
References: <20250418152228.20545-1-lance.yang@linux.dev>
 <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

April 21, 2025 at 7:29 AM, "Andrew Morton" <akpm@linux-foundation.org> wr=
ote:



>=20
>=20On Fri, 18 Apr 2025 23:22:28 +0800 Lance Yang <ioworker0@gmail.com> w=
rote:
>=20
>=20>=20
>=20> From: Lance Yang <lance.yang@linux.dev>
> >=20
>=20>=20=20
>=20>=20
>=20>  To prevent folio_test_large_maybe_mapped_shared() from being used =
without
> >=20
>=20>  CONFIG_MM_ID, we add a compile-time check rather than wrapping it =
in
> >=20
>=20>  '#ifdef', avoiding even more #ifdef in callers that already use
> >=20
>=20>  IS_ENABLED(CONFIG_MM_ID).
> >=20
>=20>=20=20
>=20>=20
>=20>  Also, we used plenty of IS_ENABLED() on purpose to keep the code f=
ree of
> >=20
>=20>  '#ifdef' mess.
> >=20
>=20
> I dunno, this just seems really whacky.

I'd hope David could leave some comments on that.

>=20
>=20>=20
>=20> --- a/include/linux/page-flags.h
> >=20
>=20>  +++ b/include/linux/page-flags.h
> >=20
>=20>  @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const st=
ruct folio *folio)
> >=20
>=20>=20=20
>=20>=20
>=20>  static inline bool folio_test_large_maybe_mapped_shared(const stru=
ct folio *folio)
> >=20
>=20>  {
> >=20
>=20>  + /* This function should never be called without CONFIG_MM_ID ena=
bled. */
> >=20
>=20
> A correcter comment would be "This function should never be compiled
>=20
>=20without CONFIG_MM_ID enabled".

Yes, that is more exact ;)

>=20
>=20Which lets the cat out of the bag. Why the heck is it being compiled
>=20
>=20with CONFIG_MM_ID=3Dn?? We have tools to prevent that.
>=20
>=20Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? It
>=20
>=20should have no callers, right? If the linker ends up complaining then
>=20
>=20something went wrong.

The reason we can't simply add #ifdef CONFIG_MM_ID around folio_test_larg=
e_maybe_mapped_shared()
is because its caller folio_maybe_mapped_shared() relies on IS_ENABLED(CO=
NFIG_MM_ID).

If we do, with CONFIG_TRANSPARENT_HUGEPAGE=3DN, we'll hit compilation err=
ors like:

./include/linux/mm.h: In function =E2=80=98folio_maybe_mapped_shared=E2=
=80=99:
./include/linux/mm.h:2337:16: error: implicit declaration of function =E2=
=80=98folio_test_large_maybe_mapped_shared=E2=80=99; did you mean =E2=80=
=98folio_maybe_mapped_shared=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
 2337 |         return folio_test_large_maybe_mapped_shared(folio);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                folio_maybe_mapped_shared
cc1: some warnings being treated as errors


Thanks,
Lance
>
