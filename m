Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82F25C6F7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851771; cv=none; b=anoN8v0Cg+wCTYAtSLtqBNr2wyuUaChDf+niTAuSCwS0Jb5Gj+j3iKk1rSXltxA7oQmsKON1SrdAt87oTBCcVt1by9EzTEKpBh6NRxQsy6CuasLdNufqg8m6L9Y7wIoPzULWevzVDZXX9G6hZgHag7oe9YEgtpKU+5YYXt+O44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851771; c=relaxed/simple;
	bh=N1qTjtHsxS1TkhrGpMsC7+3mR6VFDl9rgJ/ih+oeBy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mkli35Obf8wfVQpkItMCOES6TBMgxbTkfwHlv1oEMxRVJ4vu0dNJowIagKKTTDDlik7BFL4Vqyrh4QlCo82rf0l6EDDXt6JtIsN3QuVP9qCuYRFa/hmxlQuT6l0Bgj6d/wVSaUEF1zpUK05EyMZyA3h/bZYM2dSg5Z+86i6/IE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hq7NvFNS; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq7NvFNS"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e770bb7b45so505486137.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750851768; x=1751456568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=hq7NvFNS4yuMbCKPsax1BFSpqhDD7TTRRnE7N0xFkgIcgOTworo+xBisNKGojS8knM
         +2QPj88GiJCl9oj19i0F0m+bLQzqGBPGhRgC45UJb9VEXdshPcuvqYNVfUwTa5xHq4H1
         2huYnsmVQtOi2IX8R5+WMEXKCLC2NsHoznVgiDYhsnuf75KXDsikSOYX0U8r9Bn3NP9B
         VLAPzPe44olp7qg5cLHIG5v5xGgAt8jsn3+j+L6tgUYuVeDm3VItOND/7tWi8pf76ZnT
         ERlV+m/PlE29hL6XbYJqv96LW0syNNJyvZ7voNKgpkxApy4zyCjF5L01R1LJrepEaOf3
         3xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851768; x=1751456568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=Cr3mPzk1NJxFKwRYlBUEAOaE4lGvOfSVOYwwVOyexisN5DmuLvOrXXwzXndom8o2+F
         t8EDzy71k1eNwRio3gw44iqQBHDwOBhdAatSnXqW9IhH1rJG0eYE1DT+vBp+ZUWsMRgF
         olLKMgsspVZX4csVSlew9kiq9bdL8DcnS8S7AaezHy/3hO4PGRQdPIuMQIwZROP9Lal5
         o4ulIiXWmmX4Z1vsRB/osCuYW+upL95GL4NMiol1g/czu/APPnWrd+PWiQkELQubeGKV
         ZUBLxKeZi6qJzdGYfVsRXr9tla5736MhBLm4Qv41p+iA+yWTJFu1Mchzl3mtS7XD5KFk
         yphA==
X-Forwarded-Encrypted: i=1; AJvYcCWKbeYUGl2jjTYtfnxGnTqXzvkXjxvquu7QHpzUBATbOtoW1nmIxNQLBTbnN+vp11dZDx+8ALZ83yjLZBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysG4iK4IbcoTv2ZlIv9pxepTN231TP1A6XnhK35shDjmFysCGT
	FRsh2CKYfcWXovLfAiBIvGpc7fVU7xVYyZzlIX1cRLHi5ST5vAOROJKiM8tgjPeSet4KYtGylts
	GxpFoo9LxhqBl53U/qVPNaO5KZTB67us=
X-Gm-Gg: ASbGncthCBIZlBr5nW/32HFAF0sUAGSkfogyhShzsUljbngDMceJalKHsaOlGukyVgM
	cEPt/NYcsvkvMvpzRv2399HEQHpQY+ZUNHezYZ3dsd5+cseYhqQeYjJPcEHpS7F+o8xsowl2yG3
	EA9x6H5efatXsgY8NZE9Z5irURRJb0EQ3mwNYCe0nXY5fkjbLGPeJDsw==
X-Google-Smtp-Source: AGHT+IGsSxCfiBHYZxf4zTJngUXVXeIOT0PdP8VNFGZYgDUlzbW2AoPZQk3j5HWq3IA1WM6a9fvGa9ZMm28LZKzgbU4=
X-Received: by 2002:a05:6102:689a:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-4ecc6a67b6emr1171422137.5.1750851768456; Wed, 25 Jun 2025
 04:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com> <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
In-Reply-To: <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:42:36 +1200
X-Gm-Features: Ac12FXwHQ4LRq0KMwLDA3cdKc56s07Bk3-vMKyiAdfGW1BevfTrz5ebfq42hUs0
Message-ID: <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:27=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 13:15, Barry Song wrote:
> > On Wed, Jun 25, 2025 at 11:01=E2=80=AFPM David Hildenbrand <david@redha=
t.com> wrote:
> >>
> >> On 25.06.25 12:57, Barry Song wrote:
> >>>>>
> >>>>> Note that I don't quite understand why we have to batch the whole t=
hing
> >>>>> or fallback to
> >>>>> individual pages. Why can't we perform other batches that span only=
 some
> >>>>> PTEs? What's special
> >>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>>>
> >>>> That's a good point about the "all-or-nothing" batching logic ;)
> >>>>
> >>>> It seems the "all-or-nothing" approach is specific to the lazyfree u=
se
> >>>> case, which needs to unmap the entire folio for reclamation. If that=
's
> >>>> not possible, it falls back to the single-page slow path.
> >>>
> >>> Other cases advance the PTE themselves, while try_to_unmap_one() reli=
es
> >>> on page_vma_mapped_walk() to advance the PTE. Unless we want to manua=
lly
> >>> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), w=
hich
> >>> to me seems like a violation of layers. :-)
> >>
> >> Please explain to me why the following is not clearer and better:
> >
> > This part is much clearer, but that doesn=E2=80=99t necessarily improve=
 the overall
> > picture. The main challenge is how to exit the iteration of
> > while (page_vma_mapped_walk(&pvmw)).
>
> Okay, I get what you mean now.
>
> >
> > Right now, we have it laid out quite straightforwardly:
> >                  /* We have already batched the entire folio */
> >                  if (nr_pages > 1)
> >                          goto walk_done;
>
>
> Given that the comment is completely confusing whens seeing the check ...=
 :)
>
> /*
>   * If we are sure that we batched the entire folio and cleared all PTEs,
>   * we can just optimize and stop right here.
>   */
> if (nr_pages =3D=3D folio_nr_pages(folio))
>         goto walk_done;
>
> would make the comment match.

Yes, that clarifies it.

>
> >
> > with any nr between 1 and folio_nr_pages(), we have to consider two iss=
ues:
> > 1. How to skip PTE checks inside page_vma_mapped_walk for entries that
> > were already handled in the previous batch;
>
> They are cleared if we reach that point. So the pte_none() checks will
> simply skip them?
>
> > 2. How to break the iteration when this batch has arrived at the end.
>
> page_vma_mapped_walk() should be doing that?

It seems you might have missed the part in my reply that says:
"Of course, we could avoid both, but that would mean performing unnecessary
checks inside page_vma_mapped_walk()."

That=E2=80=99s true for both. But I=E2=80=99m wondering why we=E2=80=99re s=
till doing the check,
even when we=E2=80=99re fairly sure they=E2=80=99ve already been cleared or=
 we=E2=80=99ve reached
the end :-)

Somehow, I feel we could combine your cleanup code=E2=80=94which handles a =
batch
size of "nr" between 1 and nr_pages=E2=80=94with the
"if (nr_pages =3D=3D folio_nr_pages(folio)) goto walk_done" check.
In practice, this would let us skip almost all unnecessary checks,
except for a few rare corner cases.

For those corner cases where "nr" truly falls between 1 and nr_pages,
we can just leave them as-is=E2=80=94performing the redundant check inside
page_vma_mapped_walk().

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
