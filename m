Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9CD367
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746127667; cv=none; b=GYgxaynfhXVP4KsnhIU/hulhFE3DQI7STIHMYYRz+3kIXwqY7H8on+blr24MFoNIRgbCYLWyFS3LQF6GZd+5QaBvSCWIbfXHiqpbDii3ivw29gMk7ySVKlVRyHjHvAy5g6U3gGoor86TA7DaL9ClwsxfkzkfrTYJiU5kmnZeOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746127667; c=relaxed/simple;
	bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VT7BI8wg/+cB6zP7kPHYAhBGPmUSHH6FkCYJN/b58zgv5QRjUmIyMwpctcco+rplevEk8lLwLx66TRb1AHd56ZYhJFaYCAnTcH68P72RUYcqVRGPGnWi+2wapTaRi5fsvpj85k7+O+9dQ0u4ux5AaVylWrCcvd1d04U5eAPDHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNGfjf8/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNGfjf8/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48b7747f881so56891cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746127664; x=1746732464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=;
        b=WNGfjf8/ksPZ1RrUJ1mvQNfGsvMVthFwDCh3mICL0/HxpR7Yyvw67wWnax3IbwTImW
         1tCLJ9l+yl479aUMDFx1iMSIfmqv54Obd/OBIZVq+lkvWzQWmPouBlpVqT7xHk7zGTlP
         F3rgVJmpKU2hFqPHjvwngfVI00T5M8301GHxh67kgQTusjxZCMJYm7zM2cWFvFULO0Rd
         EA49YlYGaorbtDaKuoZ85DmmxVQrKj/9xN2GlG/IsAK3TXvoqdmoZ2fF4eUyqR+XF546
         AVH0mZS8h7c6l6Wk/SybQppQe11UZzEMX20gyafMSml9ORo18oWCZJjL0OZPhtEN8J5Z
         GpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127664; x=1746732464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=;
        b=wOPpSOzu9e8ibdcR8YWGttOyy4cFnGMLC8OJiAQClKsLE3wcp9UM2WJ5RWEf7KAZWC
         Tlb99EFhWx2DBKqyvkNVqqCYoaPSBLUOUgu297BY54YL4pN+U6H5h1e4/wr+qwftbTaR
         HoaZ3JX0j7v8iyvTbQ2AR2KClbryrTI9DU9EpKTzrZcwhsRqKZNp4HRqf3shw5W3w3Zd
         8CI2vFhPvgZVRLAr6ZkufKkUl0NW71EmfG9gzxXH+FbXs35rFuSJ9fwqf0vC31BTx+hj
         kFFgEaK7AAsSPpJolUxnEUrXbhLk1UAELeBzyNvlf2JNHduHkRxbjKtH4ElvWGDPXHqg
         kyOw==
X-Forwarded-Encrypted: i=1; AJvYcCWUpWJ+AeW+QJpPFSlPR9STHPEF/DmhpfD74eEWyl4ThN32Q8HDX7l75mCTLHE7ONsNRk/x9qnG82ZfWr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcH2RUM6jT0I1iCexRWhAyI3oKnaI7McHWof2t1BSntuXD4Uyw
	1P9sC2sk+vssiTcJs0ZqB9mbYXdEb/Hkr0hhINx3lbCRVljE7TxuPl0mRhW6KPDrD9/9rChAupz
	FQx9di/bmtKkg8L4rwX7CETVrbGDdVgQv/Q0T
X-Gm-Gg: ASbGnctfnczVcfxsbKBXYiSp+ZHmvIr+JwTeLEr4bVmxwAaSKqwXB4YvLyVji8jouiW
	46FEq2QVwMwkjgj6m9t2Xu0fitbSQCDPGCgRKcjGenY+ho97JWDzfu/sU2vpL0BCcL9UdGYYKa1
	9Q/l4+HfzkfNgT9BgYxYZ98Y4Jo6xa94DdEaWbrpF2tAVlqk9+HAkE+9m3
X-Google-Smtp-Source: AGHT+IGEYvRnZ220N49P6WowIdeV7ZMLCe1Ohy+RRvGTUY8QE/Mjht3NMEOKTlyUkZYJGE+AY5DQq5bo+Xh81NMJc/8=
X-Received: by 2002:a05:622a:1a0d:b0:477:2c12:9253 with SMTP id
 d75a77b69052e-48aea4670b3mr5562161cf.16.1746127664234; Thu, 01 May 2025
 12:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 12:27:31 -0700
X-Gm-Features: ATxdqUHbSRMwrhBZUMF2ojlrG-8kcb7B4aDa27SXz78tq394QFyw_svY2uWGfzU
Message-ID: <CAJDx_riW0B6wQb0U3EG5oEevorUaq0AH20zcJJBgq4yjFTTxvw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>
> Sure, but why would any architecture *NOT* want to set this?

You are right, not all the architectures support large page sizes and don't=
 have
the CMA alignment issues that arm64 with 16k and 64k page sizes have.
This change only affects arm64 architectures.

> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

This change will only affect arm64 architectures. By default,
ARCH_FORCE_PAGE_BLOCK_ORDER
will have the same value that ARCH_FORCE_MAX_ORDER (This is the current
behaviour). If the kernel is configured with large page sizes for
arm64, the user
can decide to change the pageblock_order or leave the default. It is
an opt-in feature
for arm64.

Thanks
Juan
