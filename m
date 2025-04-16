Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0871A2658
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840326; cv=none; b=KAq4tINyM5TCj5NA5V8PNPd8Eoe2ql0Y8Twk/ILTpKa5wNARN2PmWyrtN/HILhaM5Fae+SR47tzIL8qbixhsT9gNljwR1BJHsO50otUA0Z4gF9vzTW87tiSOrhNmesHXgrAbXpdPpDqHhWKjH52cQum1Q2VcFkPCQAU1eaTd1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840326; c=relaxed/simple;
	bh=MJWoXU0g9QnCgNy25yiiQ9RniwDR4fpaHLBO3A30L5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2jTx1lwbmoJVuO5TgxOzOXcxKm5CUIIdG7YH2GZcIM34HaNVBK9MWlE+c1fGjJlG9SCYlNpqV8E8v9PYW1/R2lRrubWv+JQXACQlIjK/lf0rXt/Gi+uUReKObUiwSUXZ8BIOyBXH97jWFi5tHsaC0Owfpogwx8zIwhuCO1j04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4pObPaf; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4pObPaf"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47681dba807so32261cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744840322; x=1745445122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
        b=y4pObPafrIr5dXNC2Rid+Wr1NPQmu6PqKM7131ddx3AHwyfcU56ocBRp8CN+QR6q+x
         4MZZxBW5txAgS2J74oOcPwt3zL1NrwKd7W/Yd64J/AQFnsg86H65a+x3yLjwdDV4uPag
         +W+WK/MQi2tvaZAaFTQiPAOqbUOZWbaGTO4bdEKPF51VcfzbV7FtU0oiptyyVT3LR1A9
         Nw5ELL7WZ9TtVNaKMnxQS/s1GVCRrBCIWwsKRmQYDmE9HCwThNRi/DcPc1n+4O6tEzGh
         lR1IcEmeZcqn/NT7nPIDaS76SlDmn6ULgDCY/xtKJS8P32iOCDTs2G0kVVLx57HFZKqO
         nG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840322; x=1745445122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
        b=jmA+qprr1/8DR0EtGIGvYK3YfM3Bm9CZrdGe15Znc7C1WhU8A+qlxbpXT/AeC2rX7l
         f70P0gUvVpcO4qTTpwBq66KaFwX+byaFi0HtTSbM4O2TOMcUBHvzTOW365zhw6yMcRug
         W59CT1eGJL8e8OVqjx8jw4xZFbmvpMOqfYl0472e8QbBTyXO4ospAvNgoyXHYILx/lh9
         cF1El4dRZcTVyL2YisgxMfTxJRXyevd6R5r4e3RT4yTtbeVW5GbYN5bkHnPLIp5pZjeN
         zj3h6y4XNjUUcf2qOihl5P5dNwvPKZ1Ei1MfsCy8V2WuTRrYEkXzL6IixkyuFamwHSaL
         5ZIw==
X-Forwarded-Encrypted: i=1; AJvYcCXgw7hVCtt2UeDpqJamYemtOXe+eh7x7FjCw2CmXKxMqwgatLa3k5tGEdCQsn/cYgYJklNW4yHiGygvF+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4y/l0u2eCjvuQqBZ7NCYAXptd/8ssOtrSBah/4K7rlOhQ5qEm
	RgA+U37Sb3KcRsxkXryknKX/pDTBSkXG1bEbJr4jrHvgSiRe18mo3H/633TERcfDx6JIQh1ym+s
	hfpSQpG0ScDaEV8vPetNnIVHkA30pXD1wicAZ
X-Gm-Gg: ASbGncv+50BluUVxTNoFAGiEI5vMo+QN196r0n9USmCe3ct3wPXGif16rfKE/dK8bEw
	ceQWi0fHjUxHAUBb0PrwYsItiv8BrSgtW6su9OgM71b4vOruZ7WbWZL2vyIhF9fWzf6MIN2sQ8Z
	KTBcGlkyGp29N0a8Zr+MHHqmpVtb/nO1M8LEMO49h7d98Q6+KNLfiG
X-Google-Smtp-Source: AGHT+IHUQzspiUQJB+h7jm1wn/s441E3wihWsN9WRc0OUtNm8hJrE+FZspPEgeONpMrV/FAEudR5KbsUS/x37qcmMAY=
X-Received: by 2002:a05:622a:1889:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47ade69b055mr1113711cf.26.1744840322252; Wed, 16 Apr 2025
 14:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com> <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
In-Reply-To: <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
From: Juan Yescas <jyescas@google.com>
Date: Wed, 16 Apr 2025 14:51:50 -0700
X-Gm-Features: ATxdqUE4qcI7Wp5CpFV-fRsQMsGVa_XUUphYkpYa0zt1M4zmiCfXplv8_xdchy8
Message-ID: <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, baohua@kernel.org, 
	dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 15.04.25 um 19:19 schrieb Juan Yescas:
> > This change sets the allocation orders for the different page sizes
> > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> > for large page sizes were calculated incorrectly, this caused system
> > heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> >
> > This change was tested on 4k/16k page size kernels.
> >
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..54674c02dcb4 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH=
_ORDER_GFP, LOW_ORDER_GFP};
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> >   * of order 0 pages can significantly improve the performance of many =
IOMMUs
> >   * by reducing TLB pressure and time spent updating page tables.
> > + *
> > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The=
 possible
> > + * page sizes for ARM devices could be 4K, 16K and 64K.
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +#define ORDER_1M (20 - PAGE_SHIFT)
> > +#define ORDER_64K (16 - PAGE_SHIFT)
> > +#define ORDER_FOR_PAGE_SIZE (0)
> > +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR=
_PAGE_SIZE};
> > +#
>
> Good catch, but I think the defines are just overkill.
>
> What you should do instead is to subtract page shift when using the array=
.
>

There are several occurrences of orders in the file and I think it is
better to do the calculations up front in the array. Would you be ok
if we get rid of the defines as per your suggestion and make the
calculations during the definition of the array. Something like this:

static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0=
};

> Apart from that using 1M, 64K and then falling back to 4K just sounds ran=
dom to me. We have especially pushed back on 64K more than once because it =
is actually not beneficial in almost all cases.
>

In the hardware where the driver is used, the 64K is beneficial for:

Arm SMMUv3 (4KB granule size):
           64KB (contiguous bit groups 16 4KB pages)

SysMMU benefits from 64KB (=E2=80=9Clarge=E2=80=9D page) on 4k/16k page siz=
es.

> I suggest to fix the code in system_heap_allocate to not over allocate in=
stead and just try the available orders like TTM does. This has proven to b=
e working architecture independent.
>

Do you mean to have an implementation similar to __ttm_pool_alloc()?

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/ttm/ttm_pool.c?h=3Dv6.15-rc2#n728

If that is the case, we can try the change, run some benchmarks and
submit the patch if we see positive results.

Thanks
Juan

> Regards,
> Christian.
>
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
>
