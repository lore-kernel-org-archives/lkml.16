Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC98828
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745296527; cv=none; b=n3BcpGgV3N2bR2Bi39N4MupvBEKOmXulvrbcp8PNywV0J8ReNeQMgTDghnWc7kbx81cibWRJpp9CpeWqO19IW6D17hnArP4PxVURGVWfDMZp5Rwas+vbHGbw9p8KqhxUeyVp24GIlWcXwODFlt6VFeSzrSmfsoolMfZIR/+CVkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745296527; c=relaxed/simple;
	bh=qLYJYeZ4EefTD1QL0PqRJShFjKw7T0uE0yUqE8upZWU=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=gMM1fRH86aU0d3bCdasM5bXeWZS5c7KM4zi4mSC0qNo8/8UVYQziJdiQkLm9H0B41QU/T5QkAVT2RBZZC19fh+4LF67vHsrx2jMFgdBrU6uNQvfQOFiZjOC6NoGiSN77USxSWFdmdG7d4iBkLQy1YnGUIxRS3L8oMvUYWXtYOeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oBfoJJdr; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oBfoJJdr"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745296517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfm/xW4Ogh3To9+LnQW2Co4714wv98el26JPYuLacLQ=;
	b=oBfoJJdrG69JOiyKYXNFzMQ5DjWWwY/TkWUu+bBv+LRMKgylBSodgjGIzhE+q++AuJApKo
	NMuqQZdHIRc95gl8+McmerUrh0JidKUP7gCDhe4lUveJjm5imAUcwBOeEQ1svyFQiL5732
	NqRJOLRSdgoSoZ+mt6JO7CfRoan7WgQ=
Date: Tue, 22 Apr 2025 04:35:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <f091c3e4183e6d6384f645e609aeed926b320818@linux.dev>
TLS-Required: No
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@redhat.com>
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Lance Yang" <ioworker0@gmail.com>
In-Reply-To: <20250421122239.710f5d63487853556cb8f57e@linux-foundation.org>
References: <20250418152228.20545-1-lance.yang@linux.dev>
 <20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
 <641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
 <20250421122239.710f5d63487853556cb8f57e@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

April 22, 2025 at 3:22 AM, "Andrew Morton" <akpm@linux-foundation.org> wr=
ote:



>=20
>=20On Mon, 21 Apr 2025 05:13:03 +0000 "Lance Yang" <lance.yang@linux.dev=
> wrote:
>=20
>=20>=20
>=20> Can we just slap "#ifdef CONFIG_MM_ID" around the whole function? I=
t
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
>=20>=20=20
>=20>=20
>=20>  The reason we can't simply add #ifdef CONFIG_MM_ID around folio_te=
st_large_maybe_mapped_shared()
> >=20
>=20>  is because its caller folio_maybe_mapped_shared() relies on IS_ENA=
BLED(CONFIG_MM_ID).
> >=20
>=20>=20=20
>=20>=20
>=20>  If we do, with CONFIG_TRANSPARENT_HUGEPAGE=3DN, we'll hit compilat=
ion errors like:
> >=20
>=20>=20=20
>=20>=20
>=20>  ./include/linux/mm.h: In function =E2=80=98folio_maybe_mapped_shar=
ed=E2=80=99:
> >=20
>=20>  ./include/linux/mm.h:2337:16: error: implicit declaration of funct=
ion =E2=80=98folio_test_large_maybe_mapped_shared=E2=80=99; did you mean =
=E2=80=98folio_maybe_mapped_shared=E2=80=99? [-Werror=3Dimplicit-function=
-declaration]
> >=20
>=20>  2337 | return folio_test_large_maybe_mapped_shared(folio);
> >=20
>=20>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
>=20>  | folio_maybe_mapped_shared
> >=20
>=20>  cc1: some warnings being treated as errors
> >=20
>=20
> That's OK - provide a declaration of folio_maybe_mapped_shared() but no
>=20
>=20definition. So the compiled-out code can be compiled and the linker
>=20
>=20will confirm that it's never actually called.
>

Got it, that works as well ;)

So if David is cool with it, I'll send out the new version like this:

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d3909cb1e576..a762e4b4eab4 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1230,10 +1230,15 @@ static inline int folio_has_private(const struct =
folio *folio)
 	return !!(folio->flags & PAGE_FLAGS_PRIVATE);
 }

+#ifdef CONFIG_MM_ID
 static inline bool folio_test_large_maybe_mapped_shared(const struct fol=
io *folio)
 {
 	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
 }
+#else
+bool folio_test_large_maybe_mapped_shared(const struct folio *folio);
+#endif
+

Thanks,
Lance
