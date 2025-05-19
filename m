Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE5627CCDA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668628; cv=none; b=E4SGMyv7SkWrU5ESiLjUwxR/UvIsXEJe4/tY5CrBex2sr3PzQhg8ucnHyrB3g/HvhR76eqITzoc4XZXyNRZR2AV+sTTxyzEPjHdtHNqZu4CZcLyDTLebEsdzNs+/zBT1LdjbJh2HwIFBlUzZzK2DhdQknwa8kiZ+buDX3O5o6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668628; c=relaxed/simple;
	bh=fkFlVu+qSZ4MV+nfcuRKYA58hJOKW9NoQdJAOOm99X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKAsTfdUlEKNkudtMxgtUYkvUbFGO9TWsI+P7bJEPEfOfAWfO9giNZ4YurxgaWJFMzLcBUQ6VY4sd3FwAlGB/ABDEJUTH4PWwLhcdbzIoN3j2yKf2/jEkc+Cen9Tho6cE95FMCYstFD+kt/OoKhKzKS9TXYsUG0/hmGzN75MVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmzRytd+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmzRytd+"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7ba2583e10so953811276.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747668626; x=1748273426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM2NB/3HzJ5wj1PBg1WB1WKrV42DeuPH6QHE0a8NqcQ=;
        b=XmzRytd+L4/IlpaDayuRgYNjy0i1IfKXzXmq/qMQ3BPtcYcvZAyfexxWLAoj1KjsBO
         NpqamhT0gPAkbKNDc7HExgLx5O5yZAId5ss3I6vog4Iq4pXBbFZmWBpHkL+LuQmANOSV
         kHdf97KUDV5RYrBmRbkmPykP85HauwOK7Iubjdtso6VFtMZfcma+kuQLuAKhyt85+vhI
         NmGDcEBPHwYbASvkI4Fimsz4Ut1KeELgw1r+f7lsHbGWKBdXPPV6PJN23KmcEbKWc48x
         Oe0OdZOgs3s6DTo0rcKe3mjLrqT3CmDk1cC5XWadLcq6+nw504qAAL5I7sJogYob2BlD
         ZAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747668626; x=1748273426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM2NB/3HzJ5wj1PBg1WB1WKrV42DeuPH6QHE0a8NqcQ=;
        b=IEHHQQ8Kyst3aXfry4rhbTVPFoUbNeD4KHuHILF40gFRbkD3xqayCwmlYPxcuK1AS5
         WpPkVBC2vV5FklsFVl3j3Zb0Jf42aKrI1wIiPemxE8BdAdr0yjhWvBN4BEUXxuBwYSHS
         h1DaoNk0Lr4cDuku7skS1I012voxQnei4gDmWM/BpuBieI72iDAUMJgJA88RXecQbJ8+
         5bAOigd0SSAqlX/JQRr9XetgJzDMVTTUd5Q4mf0sh89kHpQbNaMaM39ZIQMRfg12jDdx
         s+SkqFTqFx3pcjJnaO0OgyUvxwOBj7M1VZLa1VA9+r2fu/Y1azliQrKZlQ/tiyUeOhOD
         2abQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzSKX9P/IVEyTPJyixiYuChfNRoZJ3/r6CvcwzLi13eOcopHeJ9O3O2xosh5zmBb9RG+zsVxlNQmMG5ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PwqkFyN1BSNZljNSTH8wNnb0JC3u3+mQ3joQcSr6V8nVJKnb
	iegFE/jEwReIiw07o+YyzCFarNfVtOC4O7++LAdHogfJmuyFH1jyXRPJw8QNXhBzFTWLEsV6lpG
	P7VNk8VcGHEuf2aOJoN48AeoFPdiZc3VQfTL3q3r+3T0IcQhfbRokj/P6N90=
X-Gm-Gg: ASbGncuDPXvTYUz4J1qPLKoc6Pb3Tkrfcw9Czh3OA0CXomfxDvXcg24oRngJvZ2aF2r
	hi17FiwbWok2UOMvpEJEKXGgD+KYgpsfDbn33Bg9vfSysoihuk3EvDJ3m0COd45JDX6xm7jiMEu
	H7mw3d/Defu+PUB7+DMfk3Fl2Dpb/Np2fPObHOhnaXuuqWJEW0E8Q3Rgo1gXCkRh36aY0=
X-Google-Smtp-Source: AGHT+IF4G7XKufk4nKQ8/07FV1dIbOJlzIo1f6O8lwRhNg1kWPvrBzIucmkiFgVls4GQsyRXFfqMSh2hVWS2Mb/gx44=
X-Received: by 2002:a05:6902:2087:b0:e7b:6714:3d0f with SMTP id
 3f1490d57ef6-e7b6b204794mr15500391276.24.1747668625365; Mon, 19 May 2025
 08:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com> <20250516215422.2550669-4-seanjc@google.com>
 <fb0580d9-103f-4aa1-94ae-c67938460d71@redhat.com> <aCsz_wF7g1gku3GU@google.com>
In-Reply-To: <aCsz_wF7g1gku3GU@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 19 May 2025 11:29:47 -0400
X-Gm-Features: AX0GCFsM8QgcC3jY-eb-hlQUgXu5GT_l4kCZow784OctLf01TP57u4_QRZ8uz5E
Message-ID: <CADrL8HXSde+EeLD2UsDNkxAxdmKomEA1XqdDuF4iFaksiZUHLw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: x86/mmu: Defer allocation of shadow MMU's
 hashed page list
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 9:37=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Sat, May 17, 2025, Paolo Bonzini wrote:
> > On 5/16/25 23:54, Sean Christopherson wrote:
> > > +   /*
> > > +    * Write mmu_page_hash exactly once as there may be concurrent re=
aders,
> > > +    * e.g. to check for shadowed PTEs in mmu_try_to_unsync_pages(). =
 Note,
> > > +    * mmu_lock must be held for write to add (or remove) shadow page=
s, and
> > > +    * so readers are guaranteed to see an empty list for their curre=
nt
> > > +    * mmu_lock critical section.
> > > +    */
> > > +   WRITE_ONCE(kvm->arch.mmu_page_hash, h);
> >
> > Use smp_store_release here (unlike READ_ONCE(), it's technically incorr=
ect
> > to use WRITE_ONCE() here!),
>
> Can you elaborate why?  Due to my x86-centric life, my memory ordering kn=
owledge
> is woefully inadequate.

The compiler must be prohibited from reordering stores preceding this
WRITE_ONCE() to after it.

In reality, the only stores that matter will be from within
kvcalloc(), and the important bits of it will not be inlined, so it's
unlikely that the compiler would actually do such reordering. But it's
nonetheless allowed. :) barrier() is precisely what is needed to
prohibit this; smp_store_release() on x86 is merely barrier() +
WRITE_ONCE().

Semantically, smp_store_release() is what you mean to write, as Paolo
said. We're not really *only* preventing torn accesses, we also need
to ensure that any threads that read kvm->arch.mmu_page_hash can
actually use that result (i.e., that all the stores from the
kvcalloc() are visible). This sounds a little bit weird for x86 code,
but compiler reordering is still a possibility.

And I also agree with what Paolo said about smp_load_acquire(). :)

Thanks Paolo. Please correct me if I'm wrong above.

> > with a remark that it pairs with kvm_get_mmu_page_hash().  That's both =
more
> > accurate and leads to a better comment than "write exactly once".
>
