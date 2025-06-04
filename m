Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE6685C5E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998315; cv=none; b=m1tJPOPrNUygNkwAen4DRJ3Qny/rQLEmXr/llgIdEXmpuSZ1GwZxUxYq5/eRhnPkUMFFjnZMY++u99MUZnKMGedTSCdS2aJ9U3NL9vE0CmfF3JtEgEarHJN15cRGZzgOqVE+AK/nTTFQmmhDbZJ+dJUaXjRaumI8m5rox6krF70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998315; c=relaxed/simple;
	bh=9GZ1X1eX5tuvtagwQoq7PN+4ufnqZ4w7To92odq8Gws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aavy0SkF2dzaxqmrnW90uOPJiSklwaAQohzW0bxxRSXXO/yqYf8vPzrw86wyNQT/zq/J7LLRbIwoSKz+R7Y1hFed2hCvHlVGwylf30the0BA2DatyQ6NRfgr7DiQoUP8jKjrKgam9D7lyfNlv/SHFYrNkBxM0/mxQEs4VDAELO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3L6b/f1H; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3L6b/f1H"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47e9fea29easo132321cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 17:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748998313; x=1749603113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GZ1X1eX5tuvtagwQoq7PN+4ufnqZ4w7To92odq8Gws=;
        b=3L6b/f1HvxNxnX/ZF9eNSPJ/FTR1B/oH+3/hWfapnXbPKdaQwLUVr5+rRpe+blFixP
         iJsmy9+lbU9FQtREmxq/Xhm41eyguXU+Phok7zrCzSG+f4HQtDnlsKksI4WBe5cdffUN
         QncPW80J6t5NHF+zDRC9W366VFxknaDQSpF9HGvyMlEIdXZaRjE52unQW0GuUgFfyj7o
         fbmWE8wRyu5Y9LnQYkUFZKFj2x45g78lANIjQITckY/qwshoE56hqcBGpavuDHCkgJ1M
         mu1dcQUJGktxDJyE0o9ALNQvNVVKET0YNVAH0vhPk1Wu/3ao+f33puJJ2M3PJPabvihI
         GlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748998313; x=1749603113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GZ1X1eX5tuvtagwQoq7PN+4ufnqZ4w7To92odq8Gws=;
        b=kAfndBatk8q3IYN0nZg8psh6UqM0LR8pRmbcWz1ZUEX07JChKxJFsLWtqV9maxkcTx
         rFUf5mXZtBrBzZgzcNqAZPyeYf+FtAfMc9B/01KpdUvbNxBMn3w/uL5cKe43EeLbSe2A
         MaKZlShuoOdftGIEOasCY4y0CoED0oStApqbTLR3vNzgm0r92VT+EOBf674UPQtBXsg3
         LDzPg2jhRSYAai2kJ3tkMJIAjc80WqL0j5UZlH0WTALE3t8fyE4O8voB4KsT3/PyLrgo
         5OZSqXt5A7/B7gmP8Z7T2IMljex8+OkJFnsB5vOxU641mt1VJYMR9j315XtRn/HR3nNg
         Qr5w==
X-Forwarded-Encrypted: i=1; AJvYcCXb3Rr0RF8SEArW4LF2c+LfO2iXO83IN+t08XtmxftoKdjTamK1Jaui4NVL2CioW750MMEw4nG0qolGmZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/x/2Xs5IYWa2qnJst1v70Tv72UR+E3ZD8IK2aEhgOTCTQLp5
	qMwElpRXIpwadD1PhLphko78qaVyw0+p/I/YwGvtIycl/tXbIReLJxhPiaZcHqCGp1sNreZ8Ybi
	JkhfWfI1lxrsywKO0A870Eg8iGeXmfOys930N73Q6
X-Gm-Gg: ASbGncuLlaiem7gqjo4dY8ixKo5spGf001dVx2EOeruCK2xRtgOz5sgs8+1VxE4T5Rw
	KXmX/D12mZVCYpiyHdjT9xiIaSHYh924KzwMwoBVLPtK1P7tWU0jN6qUwUuPeJudKILnZqBre1o
	F7VnHgpSVJJe5OocHwZ6XL0OxoAId+M0wSWh3nyriqSg==
X-Google-Smtp-Source: AGHT+IE6h2Ckb7KMmnnETjQdbNcdY5DVtcVbGTPVil7WKcQwPZMmxbVDhK9DC7J7Rx+YodWq+VrA0i2ejNt8EZnt7WY=
X-Received: by 2002:a05:622a:6092:b0:486:b41d:b0ed with SMTP id
 d75a77b69052e-4a5a5281a0cmr1461481cf.12.1748998312604; Tue, 03 Jun 2025
 17:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com> <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
 <CAJuCfpGRaP2H8S6ZEr4PmxktL1tVdGM-18QyQ_N54S=RwE5tvA@mail.gmail.com> <59aed5fa-1d19-442b-9b7b-a99aee9b7689@lucifer.local>
In-Reply-To: <59aed5fa-1d19-442b-9b7b-a99aee9b7689@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Jun 2025 17:51:41 -0700
X-Gm-Features: AX0GCFvLmXNvNcnG6loABZSWkoE6v8JbRF-Dj9yyYGCaf93cpqx9pKYuItJ3iH0
Message-ID: <CAJuCfpHeHYxo1ZvG-mjDxcHd63nq_g9o5i-au-wZWHj+_dRy_A@mail.gmail.com>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:19=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Jun 02, 2025 at 07:16:40AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Jun 2, 2025 at 6:04=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > +cc Suren
> > >
> > > Suren - could you take a look at this please?
> >
> > Sure. I'll take a look today or tomorrow once I sort out my email
> > backlog. I was away for 10 days and have 2K emails to go through.
> >
>

I spent some time trying to connect the dots and still don't have the
definitive answer. I'll dive into it again tomorrow and post once I
have something useful.
Thanks,
Suren.

> Oh man and I thought my inbox was bad :) Sorry to add to it!
>
> No pressure, just a weird locking case, I'm wondering if there's somethin=
g
> here or we just need to teach lockdep that this situation is ok.
>
> Hope you had some nice time away anyway :)
>
> Cheers, Lorenzo
