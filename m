Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957B27CB2E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509591; cv=none; b=ZFBP2V+pwym0bo2ALVMmvM2JwtemqFO95V0QEDm5UdSxgK/cHbW4hMW+9mTz/M2Q4WJQt26SmjQQt+pHf2r/PdVyCNLFCHUWv8iR+FrJjgjiukDqO6q+fNZZDZ52rDqRj/aYJxFIdUp7jY/UF1zgLKRVhE1hmHyUwxBHRXNfhaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509591; c=relaxed/simple;
	bh=Npd4CEUSHWiyD7Rn49Kalheltjs40CgC+ItRiA11fEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpIQpxUBI08cmG/38bw8F1zNxClpCKCK010NVGUqP68l4ZQRawK+dxj44rHOOZl0ZLYg2Mzjq0JpN0HWwU5oahycq6vSnZq0Tzr6kjZVENTm/KzrBpSwUBPRy60zlga4Wyx0PDtoKFTc1H3aIDXGJhc+rN8AhzMJuHJPgKKmX4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=SbLCOxNr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="SbLCOxNr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so164370a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745509589; x=1746114389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7ZGm3rblj2kgAcpsN0EQih8yO5JOg9TsIGPUfiFTgs=;
        b=SbLCOxNrm9dAzN+KVHUeaphd0A5I4MkBvKbhZzq5Wpz524f6Vssu4dF4zbRZlS+5/6
         Fogwgs+J6b6rF6yG2dXGTjQa/F02Evp1S9gt6xm6dmjy3d1PLnBhUvV1qIRGk1NSmm0K
         DpXh8RShyyc1B/dMSPR5TxsyJoOCnkLL1J2ftW0yN+e2EqXtoeQd+Zg4yldRSeBGD9//
         LBcfY4f5d+KWQOknBYAYLd0mKFAhnussFrI9FXo2lP7wVjxD6/MrGONAbKp/Fr12EJSq
         7uC+xM8lhGuJp4oiACmyHU/MrWndGu6Yhw/qDHilRAND25d4j/9qGv4xVk1drU8+N5Sd
         PFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509589; x=1746114389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7ZGm3rblj2kgAcpsN0EQih8yO5JOg9TsIGPUfiFTgs=;
        b=Hq3eDOVWQqiiX9T8BXMhfntNJvGn0rAWWVAqXrr19ixHmcWNKTC+IIIU7PFuAg608v
         mVBeZsX3mi2ixlXexljxKavAnsPl81MWX9JKQYTpwiOyce0K3GTFKZgGEX4aDZ/JBh6q
         xpJ0W5A4w05DCT6kaVvDJtmdYbwlkoy6IHUPMmHqfqRdQnWJEgbGvSvXxTLQpllzu0No
         h+1bUCiFfYZtY1DaDDLm/jht0SLY7tuSV9qhqmEig5OTaEapjULcypS4odqNLYgbrMDQ
         EmEfFJ61Rw369ljDSl/LnjfF5kxyajweOtqxDAKS1rqB3hHG0JAYBOiwEPA+UPweBTsX
         hIVA==
X-Forwarded-Encrypted: i=1; AJvYcCUTexPcXx6uXy8wZCrhHZTj6WwL9ynuTBpKYm2WUb6Ou619NRkqCSJvFIFK/jZ218+Vtdnu8dR+QgLM6OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ewtxNqIr9EOFN+TcNMBU5JQHOI/tlCf6KdPC2U/TYttsBlC7
	jZ0603ZgoWwxxuq7gC3/us5/GAds5+wsGL6Vb7mjVk64nDyHA8PDUyuZgm5iP/4wk2dkr0uF+9/
	Wl6O4LP4+l8vYg8l7fcqUcye1MsKcJxy7s8pJ/Q==
X-Gm-Gg: ASbGncsBohll3FnOCcvavpuSydj7/2JAImVjdRmoqyNesP/qauljJv0QRF9P8YwVQC7
	Xubo1/s+FO3mUmIBCikdSK7os8dJOp3JsTwSpATQGDaBroFR412mbc8BTDIpM+vK5WKoy+CZLag
	CwskaY8p9Q7SGqRkEVHlWH
X-Google-Smtp-Source: AGHT+IHNf2GMNeqL16Klsm77Qm5cAQu6Mvza6m/E48PAkzIQkLWGytFSKzo4VUqKfp8jikfzSzd9uZhcyM0JdWSseY0=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-309ed24cc88mr1987895a91.1.1745509589025; Thu, 24 Apr 2025
 08:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422220952.2111584-1-csander@purestorage.com>
 <20250422220952.2111584-4-csander@purestorage.com> <20250424141249.GA18970@lst.de>
 <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <aApbYhyeYcCifoYI@kbusch-mbp.dhcp.thefacebook.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 24 Apr 2025 08:46:16 -0700
X-Gm-Features: ATxdqUHCi4C_REHlKrLnX5wREYYxsmbvpIQODsvqs0AotMM04vU2aN13a--TT-4
Message-ID: <CADUfDZqA0v-i1=TSkW6HkUNdN-_954Kq0hJS4H4cgbPb5o9EgA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	Andrew Morton <akpm@linux-foundation.org>, Kanchan Joshi <joshi.k@samsung.com>, 
	linux-nvme@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:40=E2=80=AFAM Keith Busch <kbusch@kernel.org> wro=
te:
>
> On Thu, Apr 24, 2025 at 04:12:49PM +0200, Christoph Hellwig wrote:
> > On Tue, Apr 22, 2025 at 04:09:52PM -0600, Caleb Sander Mateos wrote:
> > > NVMe commands with more than 4 KB of data allocate PRP list pages fro=
m
> > > the per-nvme_device dma_pool prp_page_pool or prp_small_pool.
> >
> > That's not actually true.  We can transfer all of the MDTS without a
> > single pool allocation when using SGLs.
>
> Let's just change it to say discontiguous data, then.
>
> Though even wtih PRP's, you could transfer up to 8k without allocating a
> list, if its address is 4k aligned.

Right, it depends on the alignment of the data pages. Christoph is
correct that commands using SGLs don't need to allocate PRP list
pages, however not all NVMe controllers support SGLs for data
transfers.

>
> > > Each call
> > > to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlo=
ck.
> > > These device-global spinlocks are a significant source of contention
> > > when many CPUs are submitting to the same NVMe devices. On a workload
> > > issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA no=
des
> > > to 23 NVMe devices, we observed 2.4% of CPU time spent in
> > > _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
> > >
> > > Ideally, the dma_pools would be per-hctx to minimize
> > > contention. But that could impose considerable resource costs in a
> > > system with many NVMe devices and CPUs.
> >
> > Should we try to simply do a slab allocation first and only allocate
> > from the dmapool when that fails?  That should give you all the
> > scalability from the slab allocator without very little downsides.
>
> The dmapool allocates dma coherent memory, and it's mapped for the
> remainder of lifetime of the pool. Allocating slab memory and dma
> mapping per-io would be pretty costly in comparison, I think.

I'm not very familiar with the DMA subsystem, but this was my impression to=
o.

Thanks,
Caleb
