Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59442144D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885417; cv=none; b=bVtAMyRqCQ0p8uRPlG5QRrmhdnkUJ6KFHWygTc5TBUPx9trYjtlvyQ+sg2l+b+Krhh4OrHFZt6JVsxYZgi3SHzhQAsTKU4LTQC7E1U2EsnX5eWW0L7haiWodyqHFMpNUTOxKlNtffZM8uY5LraMVEQz07P/3iddfvWWcuvtrjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885417; c=relaxed/simple;
	bh=BnQx50AH6rMnlk4Zumxg80G0FqgV77WHTuUK/obJsn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVVzhZIS/f9KgR2Q0YIOFuEstQYQnTDt3RUqG8MRUMrI1YUfwQZplOSjOhifd5CFYe9z76vTVVkt2OAA5mXSIZczIMSTBoTIJSdBVrXcdM0kGE6FSnj3kIa+9V7+IZcTFIF6hxscYZuotye0jsxtbEx+RKVBLLn9XroDEebQ0WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/5JjhA0; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/5JjhA0"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d21f21baf7so33753685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750885415; x=1751490215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuTntz9BFf5ebn4Es7zVDFmervtvOhJ6FRn+jJiUsIQ=;
        b=I/5JjhA0Tzg06mPe7P11MxC1xlDz+K58Yz992Ed9Pf/1iy0O8wnDF9CYltLKp0zv/g
         hRfyr6numWGX5DiLpdZaTLVwM45S4y9KbqrujeVAMQIqmrtJDdhjlBsmrdwiFTCZ435n
         SPRnM6JzY3oPNu0k3KpyCAg6vOxFvk/hsqEzDCRD8VyNStMothVVqKtV/fUPfPjRsC9m
         /kIJlw/VM9qY2rOvE5qkd75QYuD8lig3VjMua5WsccfpJdanPUFBCjsFBj2PBVt7OrFZ
         YsSdN/BIR34wUVVTOk78yDZMvMW9EfMtw1j690gwTLiVwa6InRLCteOB/MnTeAWYUUXd
         24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885415; x=1751490215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuTntz9BFf5ebn4Es7zVDFmervtvOhJ6FRn+jJiUsIQ=;
        b=rjsVZq/nMA/qUdjlIq7S0x2/6iRdfb0P8UFZvJ6LkSCASSkVrf0t4zKs/+6fFB7IRC
         6K7hlYfqw0wShqG1nk+36ixessnc0yq7uwDOdIJEEW/KatW6oWESZON4teqSWEjdUjrv
         FRv0W12oJU3z4mzD1bA3ly6wcPj8tcZJl1WmDy79N6o4/84/isXT0PKOWBGniw76Xi/V
         HUcn9CV0BCaI+tsmsk9Mri5QkCp7ZOknM760+scgRzTTwqHyoa77TD891qN4fWuMNH/o
         dGNX267hxWlc5dBks1QGe8xepUz2Hb3y88aON+N3G9Gik+n6lBmRpghCy7rvMbLXAeCR
         iIBg==
X-Forwarded-Encrypted: i=1; AJvYcCUM3yyG5C78e8UsQzKQld4nfgTuLQIqn0zwLlncvKeqYz4sw5wq1mtAojBbCOCOUo6M9K1z0rFW+0xXeE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BM6snv8gfHylEFoLkEetOzL/2ppFHBagS71GXkflxpBCtr96
	uHFwrrmFXcw3njNVHsnH3yquWZkbvhgSeYjibIutRz2/ETp6WY36CIp840SdrCYasKjx0/Csive
	cMLaXHZWvW1fXhAF7FkcFjR6xnxTsHbw=
X-Gm-Gg: ASbGncu2F4L51qWsFQKbQPzbqDoJ5S5CLJxyEcn0Wjb7wTqajxwJPv3+voTy/MPjl8B
	+fIEhIZwT0hUIfgou7SIutxQ9nhR+FdbkZTNBgouaKGNsku/izqox9e5CfPSiHALmS079oc57Qz
	Cunt1a4wU3A8ZSZ5MX1zkwggjAp2BoqUkalcSnZkFpc4o=
X-Google-Smtp-Source: AGHT+IGkZzN4RHAItzfVLBrQRGdxtXN6wVwXiT3SzYF5su+kRDMMqhI/uAjSaA5p+2yU3Clxr1zSjUyiiTMDtJ2mex0=
X-Received: by 2002:a05:620a:2b93:b0:7c5:4adb:782a with SMTP id
 af79cd13be357-7d4296921f8mr635368985a.9.1750885414506; Wed, 25 Jun 2025
 14:03:34 -0700 (PDT)
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
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com> <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com> <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
In-Reply-To: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 26 Jun 2025 09:03:23 +1200
X-Gm-Features: Ac12FXzQ50B3QUTM3cNo6E1eE61G-cA_2po-kY1vzGFbEMDCEnj9ZU8KpCPcWfA
Message-ID: <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
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

On Thu, Jun 26, 2025 at 12:25=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 14:20, Lance Yang wrote:
[...]
> > Hmm... I have a question about the reference counting here ...
> >
> >               if (vma->vm_flags & VM_LOCKED)
> >                       mlock_drain_local();
> >               folio_put(folio);
> >               /* We have already batched the entire folio */
> >
> > Does anyone else still hold a reference to this folio after folio_put()=
?
>
> The caller of the unmap operation should better hold a reference :)
>
> Also, I am not sure why we don't perform a
>
> folio_put_refs(folio, nr_pages);

Because we've already called folio_ref_sub(folio, nr_pages - 1);
Looking back, it=E2=80=99s kind of ugly, huh.

discard:
                if (unlikely(folio_test_hugetlb(folio))) {
                        hugetlb_remove_rmap(folio);
                } else {
                        folio_remove_rmap_ptes(folio, subpage, nr_pages, vm=
a);
                        folio_ref_sub(folio, nr_pages - 1);
                }

I assume Lance will send a patch? If so, remember to remove this
when switching to folio_put_refs(folio, nr_pages);

Thanks
Barry
