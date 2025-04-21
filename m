Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C01A238A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253820; cv=none; b=B95tNvgJ/vVwgDbefKCgjd647FRZONPnYOIYBax5TI2ZL85qE56E9qRQErc3syUB33qsBU+7jjVSNe76/PYEoVLRJtuIn/A8XxD3lwBbrlVf4yzPLuBVEWt+12oKTV7wvW8YYwlyBaKCSRlBsDgE8+h6bWUSuzISPUf3E9E8FcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253820; c=relaxed/simple;
	bh=Tp+OttUZp+gUKi4R1zCGEIjl9/nqPFBFkZK2EJ5B+UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMExRoIqrioLooeKjWNzfuVffihy8qRX2CuYO1HNXFF0F2Z6mPnyJ1uCwNd/6AprMH3eEmsSFq9aNIDqRyZwnAO5tER+30w12zIAHowD7WGFMFmLpRHzwG8enmsP7fGAp93SF50lUAnAm2BhYlLe29zTIAwTiFnZvOKO//3Gw80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=LW5SKNKA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="LW5SKNKA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22409402574so9724745ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745253818; x=1745858618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R0E1mx7dvW4tnYJ3x18g2EC5VfC8B2tnZfDn7TqyVI=;
        b=LW5SKNKAvk2oC0hXlZmX6Kpepd/s8+viZxyKLu81Gx4L5eV9muM5wP8UwrpAVxmZOo
         vKbjpTuyZ7hRHNgPNYzj91S6/veP6cgLQMuu1h5Bj4aF2HALrOuTeeUw2PWxtF+IrNFy
         ef8DLPYmupa+8d0w0E4k1ls2J4u4Akaf828Vy0LusvCe9inpqeIwS2LzrBTAdYUtO1Gp
         2KUCEOsLvuoNxTHE6QhJHtvR/mOfo+g687KoTOXWxVg9sZ0cla1sUkB7JnQaQnKzLTlQ
         yidvenC7SSQu+72J52EYV8VTGvb3vEgVxjyHG5SJqA729ICJla6MXbv6UdIaNu6R6qJ0
         5Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253818; x=1745858618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R0E1mx7dvW4tnYJ3x18g2EC5VfC8B2tnZfDn7TqyVI=;
        b=th1SaR6ikRTo9CUsLsTsop1uRCyrEKNGVz2HaDfr1kjS3MroB8e8E0c+fU8NF2Ctwt
         8DTEPeMXa2ZtEYWpoYzv4GCSbkARyQbVwajNLfe4Y0qxQJVy6aPhzj7kIJWddTz0QFmF
         +49FVHM2/vD0z9ByOfzibGDHD7zW0oECGOHiVNa7Z893SLWoO269+3sdnA6sagFCcKYi
         HY8eQm4koXj1TDZenwDhhtQTCS+7RFpRDcbpEbu2Dv3nSL9X6N7g19TaUiKj3/O3guIE
         U0VqHJxUB6WqQXs1eQVbggwf7o4m6zms5pSyLWZ9tKSOfb2BE39Xb3nmVqMIakiHLWBm
         QSxw==
X-Forwarded-Encrypted: i=1; AJvYcCVejg3StkreZmtPxeDeHIGWZMVHZgHJ9K/sxEuLm/aHRJzeKG856g24+5LRVeV8m4hPz8LWAdqqDOTB4Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaoEjWu7wxNdPhhlDim+gt4+jt6GUiHntFD5VnN+oVborFzd1a
	cqDmbFSIJt6H3dU4qyWU1ZL8udL0dhTGn9V7fznrnhuOXzrH5HZgTtrXJmCugXVPdUyLwCjWiZD
	rEKS5qo5KnCZzNfkEqFM4iMN2LQEdV2FACdPA5w==
X-Gm-Gg: ASbGnctJlo1xfJlEaqt6W2HFxyg1N26LbZQKcVezRTXxVmThtoRfcmOHdpahXuulixV
	3Oq44FG0HSKdNzaSwzSNYfDIkaFvFyVXYBJiEdbsw7HN5A2h56gebUH3m67KTxg5v/x24VGnCCo
	aEQg4whqOq2M/UNRbiPBATVQ==
X-Google-Smtp-Source: AGHT+IGtj/moGGOjGJbBLeF1/Nifu2e9fYeEVC64jWQjeSA+dHu70c1OjZleQZlVG7RSN+5MniQNI0xE02c8J/rL5eg=
X-Received: by 2002:a17:903:247:b0:224:1005:7281 with SMTP id
 d9443c01a7336-22c53614f2amr67689965ad.7.1745253817657; Mon, 21 Apr 2025
 09:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421161725.1610286-1-csander@purestorage.com>
 <20250421161725.1610286-3-csander@purestorage.com> <aAZzd-9YjBP4IyNK@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <aAZzd-9YjBP4IyNK@kbusch-mbp.dhcp.thefacebook.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 21 Apr 2025 09:43:26 -0700
X-Gm-Features: ATxdqUE1AVehSId8RHFGCMYPJxs7qiDwVp4k6VrPCaISqm4a0TcetgZfF7dPx-k
Message-ID: <CADUfDZqeDeJBVG9AFzSfP9CCAisaUsUa6o=D6NWxQEqorLQ6sQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 9:34=E2=80=AFAM Keith Busch <kbusch@kernel.org> wro=
te:
>
> On Mon, Apr 21, 2025 at 10:17:25AM -0600, Caleb Sander Mateos wrote:
> > +static void nvme_release_prp_pools(struct nvme_dev *dev)
> > +{
> > +     struct nvme_prp_dma_pools *pools_end =3D dev->prp_pools + nr_node=
_ids;
> > +     struct nvme_prp_dma_pools *prp_pools;
> > +
> > +     for (prp_pools =3D dev->prp_pools; prp_pools < pools_end; prp_poo=
ls++) {
> > +             if (!prp_pools->small)
> > +                     continue;
> > +
> > +             dma_pool_destroy(prp_pools->large);
> > +             dma_pool_destroy(prp_pools->small);
> > +     }
> > +}
>
> A minor difference in style, I think indexing looks cleaner than
> incrementing pointers:

Sure, can do that instead.

>
> static void nvme_release_prp_pools(struct nvme_dev *dev)
> {
>         int i;
>
>         for (i =3D 0; i < nr_node_ids; i++) {
>                 dma_pool_destroy(dev->prp_pools[i].small);
>                 dma_pool_destroy(dev->prp_pools[i].large);
>         }
> }
>
> Note, dma_pool_destroy() already checks for NULL, so no need to check
> before calling it.

In that case, nvme_setup_prp_pools() would need to clear the large
dma_pool pointer in case of partial initialization (the large pool is
initialized successfully but the small pool fails). I can make that
switch if you'd prefer.

Best,
Caleb
