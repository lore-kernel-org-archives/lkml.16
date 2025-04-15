Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C71A0BCF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744750640; cv=none; b=cZb783kDWaphkY4NVp+xR0sz8UCdvDeVKA8ehpJvQKMh7aME7IUeP3pyE0CbJ6FSL+7IIbqtZ92ouZc21FzKTTQkzhquoLk/fp+vBEQxt10peEJos3aaGGSoIz/x9lr1uWVUOSzu4JyYYronrASCb4H4HkvV9rHX49jsN6LUKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744750640; c=relaxed/simple;
	bh=Rigphh5nMgvo+Y6TLM+7fpUEnpEJucdeei2X7fHzbEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOWofIFc4kDy6EezaxS+Yy40bN9zK+wLqv3PusP4yojvCe+WTYznvWMI9h4hUfZTNVXJ2b/J9wH4/rYS/zfJgb2+PHontiu4SeI2aYWzXtJflS4YoWfb3PtEivsGtbKZnXNukKujAabGdm2ya4kjyPIUaRnUwkkjd7gIUnbQTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhAXugaI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhAXugaI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe808908so21155e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744750636; x=1745355436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
        b=NhAXugaIiJJsKoWldWRgPmsLN3idWggw92w4W7Z6+kMVAq+6ZChlLmT3rUvJGZe4fD
         BJYDJK80FLViVzwFykawFgSzjIqoDPVGnlBXuYr5a4Rl+TNZt6FpCcTPks+syMVlEPrG
         50hwxkplSNLeRMfaECMc+CpaK3z+9Lc6Xtp2Xz82lHnQPY/gKb2VkZyOXJBDvNvoQ2XB
         2KlKCinBa3S795I4fgvZskdqUqa2mef9TEJ8XxE5s2Yv3kDd5huln7MU1H40JhGYu7m8
         UfNSmsimvx3AvGsHoPGi2iaf3uXBJePOzTRZxj6z2uNRsfgs1O8OF7lK96eEISkqnG1D
         NRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750636; x=1745355436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
        b=f3S0IZrQLg2jCLYGTK5ta4yCcdZ0FdXaKe5Q0dGyIXcKrQZvux6mdgIcXhVazUgOYr
         JHMKqVe/gqZmgHYH2baHlz2qeGy8Qfs/88GI3zOUUfTq7hmfZrvxqEubxP2qF2uz1Zk0
         h1HV0qoZrFHXum3kcHb0UTJiLobj5BUXmyIZQ8Jn5z3I/Re55DZuIS2GUXTsHmZ7wvE+
         b90MGYOe9XsfmRQ8dWqn3ON6yHkbVaJOm3+J/f5PuCjwyJnMnMfCMRETWSo7KTDPoTlx
         Drx0B0dpo/vDZip7NY8gst9AIPjEobZrz9Wcsa6W40yfzv5/riu2FHj6E5b73RY79OfE
         oKAA==
X-Forwarded-Encrypted: i=1; AJvYcCWW/PkP6w7bFrrZkARDyqb1NqsBrn8E05x8QMZmwi5gGXypJSXnP30iorGtABaGJ+Rf67KM5JkuOu08w4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfBHoX2klkgrq1yb2u9CfJc+wEPAljDYDbRHcfMXlExtOjohN
	ckEdDoJ2dA30dgTqee0rzXMFUYc0b54s7anl93Oi5nS5xXMzaM1WNhBKyBZc2ps0ax2IYJs8uc0
	8epc2RQw5eYefKLjoDXvOluV1+DYcVPY/mtXx
X-Gm-Gg: ASbGncvDYZysKXS5+jdmjXFlE3nvD4pPAry+njoDacV+yEiuq9NZ8+Adzpw4qSiDCL+
	SvFkl/BLS8FwGI5rBcpFVf+7Rusj0eArhUr93GS/KDDVYw7zPXPfnKLrmTm+bO9owY974nZtZ4Y
	8K4Tr9MVgbZ8hdx9WYWku+f35IjaQV3nXOvzDKlYw2CwibO8414PYe
X-Google-Smtp-Source: AGHT+IGXD1VxTGyGvWZV4CehXI+QLZxEMIErZViq4RxE7yiw+R8JJCPy5nW28NNv/NwEDI4yCJEpKavgYMSn7I/9ZYo=
X-Received: by 2002:a05:600c:12c8:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-4405a159a48mr207845e9.2.1744750635333; Tue, 15 Apr 2025
 13:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Apr 2025 13:57:03 -0700
X-Gm-Features: ATxdqUEYkJHID5PFTCgbNHb3ti1GO56rHU_cmcbEsJdS2z-qA1eNXNoty6ETrDs
Message-ID: <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

I think "dma-buf: system_heap:" would be better for the subject since
this is specific to the system heap.

Would you mind cleaning up the extra space on line 321 too?
@@ -318,7 +318,7 @@ static struct page
*alloc_largest_available(unsigned long size,
        int i;

        for (i =3D 0; i < NUM_ORDERS; i++) {
-               if (size <  (PAGE_SIZE << orders[i]))
+               if (size < (PAGE_SIZE << orders[i]))

With that,
Reviewed-by: T.J. Mercier <tjmercier@google.com>

Fixes: d963ab0f15fb ("dma-buf: system_heap: Allocate higher order
pages if available") is also probably a good idea.

> ---
>  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 26d5dc89ea16..54674c02dcb4 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_O=
RDER_GFP, LOW_ORDER_GFP};
>   * to match with the sizes often found in IOMMUs. Using order 4 pages in=
stead
>   * of order 0 pages can significantly improve the performance of many IO=
MMUs
>   * by reducing TLB pressure and time spent updating page tables.
> + *
> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The p=
ossible
> + * page sizes for ARM devices could be 4K, 16K and 64K.
>   */
> -static const unsigned int orders[] =3D {8, 4, 0};
> +#define ORDER_1M (20 - PAGE_SHIFT)
> +#define ORDER_64K (16 - PAGE_SHIFT)
> +#define ORDER_FOR_PAGE_SIZE (0)
> +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR_P=
AGE_SIZE};
> +
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static struct sg_table *dup_sg_table(struct sg_table *table)
> --
> 2.49.0.604.gff1f9ca942-goog
>
