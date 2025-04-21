Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762CB70830
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745222530; cv=none; b=SH1fDdp/6CHFmjOFpj3TFyNrJh4zVAm8GOAJ374PjC7zO93w+nsdLvywKGcVuh0ykD4Zab55KC14agRQ+FKnOPaFzXwCdMt4iqi1lyRKajxxPvlIMa/QnV6SPWujtt3rixKEh+++RyjQePVH/vOxhkf048D/6ev3EwwkBnpkYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745222530; c=relaxed/simple;
	bh=33o/aggn7GYkoa/VaXBg+AI2cQuzh1N/Vw7JHs9uVDs=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=U23o3AUaAiAJp1CoswCcgBoPvMiUPCskYRk7NsYJSXnxP95fRRdqj0L0LT37Y3ygiz8UBUv2swP3ALT3SQT2L6DBJJBiJn2DENWX8szn5/Jxx5rYf5Ltr5lI9hb6nvx0zbpGPtoshtM5C/RWDKaCC9jkgm+5LVfJHWxW5PcaJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X9XRhR+D; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X9XRhR+D"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745222523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeLomQG/3eumv11HxKQE6tnY52ZFSGip0VlyTCwax8o=;
	b=X9XRhR+DAs992DQsL3z04Ifp53AOVSR+nqsk6DrmT7aO39CQ6X0nx5uoiDC3t+XLgSKrbf
	mjik200wP6h8FgBW/55A39FBsgGxNRvVeJ+Lk0yLjLwpojbBWFBUwCfyvGKi1XoNaA0f+Z
	WWCLvCctelxigCpP8c5wXLmmfo7iPWU=
Date: Mon, 21 Apr 2025 08:02:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Lance Yang" <lance.yang@linux.dev>
Message-ID: <9e3e1f9d238c01bdeacb165501483ab666a766cd@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/1] mm/rmap: optimize MM-ID mapcount handling with union
To: "David Hildenbrand" <david@redhat.com>
Cc: mingzhe.yang@ly.com, willy@infradead.org, ziy@nvidia.com,
 mhocko@suse.com, vbabka@suse.cz, surenb@google.com, linux-mm@kvack.org,
 jackmanb@google.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, "Lance Yang" <ioworker0@gmail.com>
In-Reply-To: <e3c635ed-7d4b-4d07-80ad-75be950b803c@redhat.com>
References: <20250420055159.55851-1-lance.yang@linux.dev>
 <2e501e48-8604-4813-b76a-d467cad67f53@redhat.com>
 <dcbb55dfef3d79de72ada29ea04a3610eead6437@linux.dev>
 <e3c635ed-7d4b-4d07-80ad-75be950b803c@redhat.com>
X-Migadu-Flow: FLOW_OUT

April 21, 2025 at 3:40 PM, "David Hildenbrand" <david@redhat.com> wrote:



>=20
>=20>=20
>=20> >=20
>=20> > Are we sure the compiler cannot optimize that itself?
> > >=20
>=20> >  On x86-64 I get with gcc 14.2.1:
> > >=20
>=20> >  ; folio->_mm_id_mapcount[0] =3D -1;
> > >=20
>=20> >  3f2f: 48 c7 42 60 ff ff ff ff movq $-0x1, 0x60(%rdx)
> > >=20
>=20> >  Which should be a quadword (64bit) setting, so exactly what you =
want to achieve.
> > >=20
>=20>=20
>=20>  > Yeah, the compiler should be as smart as we expect it to be.
> >=20
>=20>  However, it seems that gcc 4.8.5 doesn't behave as expected
> >=20
>=20>  with the -O2 optimization level on the x86-64 test machine.
> >=20
>=20>  struct folio_array {
> >=20
>=20>  int _mm_id_mapcount[2];
> >=20
>=20>  };
> >=20
>=20>  void init_array(struct folio_array *f) {
> >=20
>=20>  f->_mm_id_mapcount[0] =3D -1;
> >=20
>=20>  f->_mm_id_mapcount[1] =3D -1;
> >=20
>=20>  }
> >=20
>=20>  0000000000000000 <init_array>:
> >=20
>=20>  0: c7 07 ff ff ff ff movl $0xffffffff,(%rdi)
> >=20
>=20>  6: c7 47 04 ff ff ff ff movl $0xffffffff,0x4(%rdi)
> >=20
>=20>  d: c3 retq
> >=20
>=20>  ---
> >=20
>=20>  struct folio_union {
> >=20
>=20>  union {
> >=20
>=20>  int _mm_id_mapcount[2];
> >=20
>=20>  unsigned long _mm_id_mapcounts;
> >=20
>=20>  };
> >=20
>=20>  };
> >=20
>=20>  void init_union(struct folio_union *f) {
> >=20
>=20>  f->_mm_id_mapcounts =3D -1UL;
> >=20
>=20>  }
> >=20
>=20>  0000000000000010 <init_union>:
> >=20
>=20>  10: 48 c7 07 ff ff ff ff movq $0xffffffffffffffff,(%rdi)
> >=20
>=20>  17: c3 retq
> >=20
>=20>  Hmm... I'm not sure if it's valuable for those compilers that
> >=20
>=20>  are not very new.
> >=20
>=20
> Yeah, we shouldn't care about performance with rusty old compilers, esp=
ecially if the gain would likely not even be measurable.

Ah, nice to know that ;)

>=20
>=20Note that even Linux requires 5.1 ever since 2021. GCC seems to imple=
ment this optimization starting with 7.1 (at least when playing with the =
compiler explorer).


Thanks for the details. Let=E2=80=99s just drop it - no measurable gain.

Thanks,
Lance

>=20
>=20-- Cheers,
>=20
>=20David / dhildenb
>
