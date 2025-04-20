Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986017CA17
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745138034; cv=none; b=NbXhSf+id1/EF2AqQphBTql2tS0bkDp4DNM0OZmmeMRtP3itToHjTzLlghjVkOdLxRYwAACmxzAXhCDEh6nLM49U8Qlp6m0G26O/Mn5m/qnEmqEu6XAqWaom4uVk5mxHoGNxal+A9TLVWmM9Y9sfANmzMieymFkZSwx4cmiOXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745138034; c=relaxed/simple;
	bh=LBLZGkGg/iCfYQCp8/kPENxmGkAQnUo+FY8qHwWzIQs=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=X12eBKuc3KFu4y0oKFqHgknkZ8geuMj4+/AwvAmD8Qt26qN78pQ0ked7j4vJ3TuMhy/ipLJXYtdxto/tmfrGBDSrFo8rVlj5UuSjnxZtaJNRIE9CrakWvYw/tzihycS8+A03nyI6TYGAjxaoqXJCJnUuJm3ZshhHiuJ7UIcDgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SgZ/BzvW; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SgZ/BzvW"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745138028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYuILlImZQTlg7sctwVnY82spfkD4xH0j6uwgGAf9ow=;
	b=SgZ/BzvWEGnHv+owOD82Hz+Z+xG0w/vsDIzgdZJm/GsbQW9Wm4bN0GTWw9kC8pPEqLF8F4
	TVgyjSEql4QVxTTfVn/9K+kxtrTf9WrCQ1+j5yCazFYikDkljSLrjaz+P9RO0I0eBEKGqc
	vjkUeMnKjOD68JHQVGkZX1GG2p9TpWg=
Date: Sun, 20 Apr 2025 08:33:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <dcbb55dfef3d79de72ada29ea04a3610eead6437@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/1] mm/rmap: optimize MM-ID mapcount handling with union
To: "David Hildenbrand" <david@redhat.com>, "Lance Yang"
 <ioworker0@gmail.com>, akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com, willy@infradead.org, ziy@nvidia.com,
 mhocko@suse.com, vbabka@suse.cz, surenb@google.com, linux-mm@kvack.org,
 jackmanb@google.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org
In-Reply-To: <2e501e48-8604-4813-b76a-d467cad67f53@redhat.com>
References: <20250420055159.55851-1-lance.yang@linux.dev>
 <2e501e48-8604-4813-b76a-d467cad67f53@redhat.com>
X-Migadu-Flow: FLOW_OUT

April 20, 2025 at 3:12 PM, "David Hildenbrand" <david@redhat.com> wrote:



>=20
>=20>=20
>=20> /* Note: mapcounts start at -1. */
> >=20
>=20>  atomic_set(&folio->_large_mapcount, mapcount - 1);
> >=20
>=20>  diff --git a/mm/internal.h b/mm/internal.h
> >=20
>=20>  index 838f840ded83..1505174178f4 100644
> >=20
>=20>  --- a/mm/internal.h
> >=20
>=20>  +++ b/mm/internal.h
> >=20
>=20>  @@ -772,8 +772,13 @@ static inline void prep_compound_head(struct =
page *page, unsigned int order)
> >=20
>=20>  atomic_set(&folio->_nr_pages_mapped, 0);
> >=20
>=20>  if (IS_ENABLED(CONFIG_MM_ID)) {
> >=20
>=20>  folio->_mm_ids =3D 0;
> >=20
>=20>  - folio->_mm_id_mapcount[0] =3D -1;
> >=20
>=20>  - folio->_mm_id_mapcount[1] =3D -1;
> >=20
>=20>  + /*
> >=20
>=20>  + * One-shot initialization of both mapcount slots to -1.
> >=20
>=20>  + * Using 'unsigned long' ensures cross-arch compatibility:
> >=20
>=20>  + * - 32-bit: Fills both short slots (0xFFFF each)
> >=20
>=20>  + * - 64-bit: Fills both int slots (0xFFFFFFFF each)
> >=20
>=20>  + */
> >=20
>=20>  + folio->_mm_id_mapcounts =3D -1UL;
> >=20
>=20
> Are we sure the compiler cannot optimize that itself?
>=20
>=20On x86-64 I get with gcc 14.2.1:
>=20
>=20; folio->_mm_id_mapcount[0] =3D -1;
>=20
>=20 3f2f: 48 c7 42 60 ff ff ff ff movq $-0x1, 0x60(%rdx)
>=20
>=20Which should be a quadword (64bit) setting, so exactly what you want =
to achieve.


Yeah, the compiler should be as smart as we expect it to be.
However, it seems that gcc 4.8.5 doesn't behave as expected
with the -O2 optimization level on the x86-64 test machine.

struct folio_array {
    int _mm_id_mapcount[2];
};

void init_array(struct folio_array *f) {
    f->_mm_id_mapcount[0] =3D -1;
    f->_mm_id_mapcount[1] =3D -1;
}

0000000000000000 <init_array>:
   0:	c7 07 ff ff ff ff    	movl   $0xffffffff,(%rdi)
   6:	c7 47 04 ff ff ff ff 	movl   $0xffffffff,0x4(%rdi)
   d:	c3                   	retq

---

struct folio_union {
    union {
        int _mm_id_mapcount[2];
        unsigned long _mm_id_mapcounts;
    };
};

void init_union(struct folio_union *f) {
    f->_mm_id_mapcounts =3D -1UL;
}

0000000000000010 <init_union>:
  10:	48 c7 07 ff ff ff ff 	movq   $0xffffffffffffffff,(%rdi)
  17:	c3                   	retq

Hmm... I'm not sure if it's valuable for those compilers that
are not very new.


Thanks,
Lance

>=20
>=20-- Cheers,
>=20
>=20David / dhildenb
>
