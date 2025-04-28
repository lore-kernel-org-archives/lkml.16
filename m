Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0E1DA4E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745809110; cv=none; b=GehvAR6UANe7ImODmeu9k95yI3Afw44ZZ8ng0jBTiuH2j5dlvyx254Z8pRJ+2ldeOcc/0bZrYvoQzfhFXlXAQuInc/52zcyuMNgbCFCihyKzQOcjNbpYaqVdPVPiAEJwvj4mhz4xV/pTtVRxGEGccfT+gYMzUYK0fkU7c6qEGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745809110; c=relaxed/simple;
	bh=CrWa0zaqR+fioX4ZGe0U5ET7aY952ibB9y2/fFe/jSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lme6BY91wCZytQr7io5cXMIFxnVfbO34raSpRftHzp/hLgIoHMakr3a/HjlaJK94Sfg7uysSO90AsPnmO+CB/JpT0lU+iLn2Bygu3LcCmWbV515XwOEzqtnRqLb5tiIAHYT4i1fbhP77abqkbbDDyF8rmD2LZIlv//ZrnVUOajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGiAqE2+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGiAqE2+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-310447fe59aso49188531fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745809106; x=1746413906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgaskaohNiGB8SMl25dOp7kdmIomeDvKcnSgFFSAa/Q=;
        b=mGiAqE2+jaXe5hKJWyjWNw5FmZJtFbwaYeCJgYkSR/cjVzZK2gKZq3WZ8zWRukyet6
         8IEV0xxYpncMWjkbt5le7tLbBDVTwrkRWUcF4+K8WnFh1w37a4jAvBXgQJgY/77xlxJI
         HfdOPTdfRfIwXAc2SOOtIAwnb1r25gPASx8m/wRyrKRjyoi5vxshKIjvD+o0P4DzNAMc
         fQuwj0eX6sA8tfzAO++6GOVWG5U9/ohX3QTIHVAcVJH3Ihww7LZ5P/Q7Js4D27CDsXRP
         p3lrjp4EhAtKAaiNSu5uaSYEWQBIHQUVdIGD6ldldU/yR1nfOdZ8F74G1F6NHRCTatfI
         Y6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745809106; x=1746413906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgaskaohNiGB8SMl25dOp7kdmIomeDvKcnSgFFSAa/Q=;
        b=wbLVUahQUcsE6DINhnHXea3AWu3jiebLzFpwn1yzkhLfw/ktkReFWs3zJN0U+NWTVy
         9liYRMYj1ARrvpUlVE7C1wp4nXgYDVU8mcU46fZr9vPebi3sfk6ucdtPCANggVC8VBKK
         8GcIDv1Fyhnxhzed5b9ZT4Al0ioGNHll4IHWzKcAK1wv2vxiqkmc8ApmBphARmpY9jk2
         a5MavjsWyRUa6mnLQ93iy7DIiVTenPNUr58QJVU0nPE5FKbnHiQ/DDXCik5JKFU8N+A4
         ds5qTG10DHKgzYkHSaJpn7/O5Awd2q2DfLxqefoY/RDyJiPA9+ZOCGEP9o5tqGGZbWVl
         /63A==
X-Forwarded-Encrypted: i=1; AJvYcCWexs2FqcqlhZVeXKIfZlry9QTGdQOqD2nrUQ3xS8nMQdBGHPfz2vz+EnUg+vF4RfOHksT+/65GIE+ANXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5IVAbRDd7KiDlIbrp2W3tR5cc5eogJXcbCLnw45YHxlW0ANL
	cMNP4k9UjhoJgZBp9Z6cfPqxrv5zN7AVcJLtahLZfR23mRJ2Z0ag97V5ZIbE3Qm1mmRaMCJodRn
	cttrMqiB3joG48sNBasUbeiUy9zk=
X-Gm-Gg: ASbGncsEPVpswCInrwkRXoHGvfL/8lRBxaktZU6MLJccqtiE9QQJrA7a6xRYoI4usZe
	t30XjvHQKIU4lb22454oBMjSgp/E4Y9bvrgEhTUFmUiHse6lBMfjVJDKdArN4Zcs9OVVtGDtK3/
	4n6cAx+IUsgpx/zHAvWsTEkI3gzvSY957q
X-Google-Smtp-Source: AGHT+IGZOTubn4VjyvSeuz299nYuDnHDnNdU5pA5hyhqNITQwhbGXmiPCTox/7qcT8nfbShuuY9sWWcjVmSf5erf208=
X-Received: by 2002:a05:651c:248:b0:30c:5190:b264 with SMTP id
 38308e7fff4ca-3190673b945mr33604131fa.20.1745809106179; Sun, 27 Apr 2025
 19:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com> <20250427185908.90450-5-ryncsn@gmail.com>
 <aA7PbiXv92WiTy8T@casper.infradead.org>
In-Reply-To: <aA7PbiXv92WiTy8T@casper.infradead.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Apr 2025 10:58:09 +0800
X-Gm-Features: ATxdqUGu6YXco98zNPmPLy-X9iEnBe9n5XHBSiGkhoZ7yVSo6O49Fou8fYKa8H4
Message-ID: <CAMgjq7CTtJ69W=6kOaEn740seY9Nh7To7WL+JTb_hFUHJ-TqAg@mail.gmail.com>
Subject: Re: [PATCH 4/6] filemap: do not use folio_contains for swap cache folios
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:44=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Apr 28, 2025 at 02:59:06AM +0800, Kairui Song wrote:
> > For filemap and truncate, folio_contains is only used for sanity checks
> > to verify the folio index matches the expected lookup/invalidation targ=
et.
> > The swap cache does not utilize filemap or truncate helpers in ways tha=
t
> > would trigger these checks, as it mostly implements its own cache manag=
ement.
> >
> > Shmem won't interact with these sanity checks either unless thing went
> > wrong, it would directly trigger a BUG, because swap cache index are
> > unrelated to shmem index, and would almost certainly mismatch (unless
> > on collide).
>
> It does happen though.  If shmem is writing the folio to swap at the
> same time that the file containing the folio is being truncated, we
> can hit this.

Thanks for the info! I didn't check it in detail because that would
likley trigger a BUG_ON but so far I didn't see any BUG_ON commit from
there.

Just checked there are two users in truncate:

One will lock the folio and check if `folio->mapping !=3D mapping`
first, on swapout shmem removes the folio from shmem mapping so this
check will skip the folio_contains check.

Another seems might hit the check, the time window is extremely tiny
though, only if the truncate's `xa_is_value(folio)` check passed while
another CPU is running between `folio_alloc_swap` and
`shmem_delete_from_page_cache` in shmem_writepage, then the next
VM_BUG_ON_FOLIO(!folio_contains) will fail as folio is now  a
swap cache, not shmem folio anymore. Let me double check if this needs
another fix.
