Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF4185B61
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733230; cv=none; b=SwMqCgwv2+7PIU2drc4J34NlOJ6YFUU91vWo5BNVjKZrm8RAsHURbh95afpQ3G8CxDil2yZvrDzRRWfZLNi4+0fdZOtkwkY8d0inq55zcdihYLD7Fh5MpmerEQjQLN1u5ilGsn+QaMS55+5v9GLcmuL16+Z5k3lCHcxUcg07qnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733230; c=relaxed/simple;
	bh=QiTjri0aOoQ3lH4SOuywEnbXxOS4s4oN3a7N7AfILcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNq7G2kqwiP6tlh4bVJOcCR29pk4BdUytD2zM/e4HynOzteAyO6fDg0UcMb+GegZaehjBK1Y5fkm9gNuYB2pKjS6/J+5i3lmGfzQa3fdB1HkTcHg/0XVLyhjK0aR814rgat943dQahxsDunj1pnSyp6AxU541EPqmZB25V1wWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMtKiV+e; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMtKiV+e"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5ac8fae12so370011cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749733227; x=1750338027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpY2v3xOolJqhxPlW7zwEpoGRpHezlEDNj9BdzLrQ3s=;
        b=pMtKiV+eZaRQ5szPLZduVesWRr7A6wc6QhRnEEGLFDNcxYpzirkGjLCLL9kOeRXMvs
         iobv7Ja2+3JmCuWHU41CjHv3W+oDnjf1BJCmsETGwCrVjjnC83mk9RkCscmw0sU2FCAx
         pu76Tyi/hqRxvp2qv7t5BENjnNXZiAs4Agt5NvE3Wf0C/7kJ2pz1A8qsGPpaQa3sn0lm
         e1PSfiEEFc6ijmE3aM/KgakYzMp1H64JYnRhknqBDmNzUl4vdtg4i0Wde7GeUFj/EPMN
         Bxm0M94nB8NrJobWOte+/AZexenNPfsWQYFQKbPOz9zTfjjPLYVWarWHGSgoNrdcYscE
         W2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733227; x=1750338027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpY2v3xOolJqhxPlW7zwEpoGRpHezlEDNj9BdzLrQ3s=;
        b=N9qh6+KtRXbTyx3OdJF5kZCPAsyA8MyEuUJUpTmHBj2WGPM3/A2XfPooObF8w3OJdH
         x6h8P8Zy8GCiCXHu+/4dFLcDHeqJ7rvql9qj+Va1C0p+K1jgO0D++Z9H1ngt+2GX+Gh8
         b03cuBXnynrJBdO8pNSbNu5Ks0KTo+FsSyVg4LRnscrPycuJyV6ZfMAFBAiwlnBjGcYU
         PWfuEFMGi3SDtxpq89k9HykEvuZu4YY9I9ghsOY6bavL0g4gOE5Vlowxx+NOJr61Ff95
         0zCYVrh3yAKY/VGIsuhDsSU9+JVM+stCivtdCuD2KuDQ9Ji+9MnfmJA1/wOrHl5eV/fh
         XJpg==
X-Forwarded-Encrypted: i=1; AJvYcCVOHwIbC4kO5joh4naCQuRSLCJJiCM9qcbaG7aBL4/IX3rhHeSLgQvGjlJUWQm52YYlKAsackwqasZe31w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FG+bQ7sQzUBnQXOQdStRtAz4bgUHT/8tXb32eRdmzIrHy+96
	eSS9CEBK/Ju8F2S+dqs1BPJOImrxxLhQVVBgRmv2FGJ6AU1gZaqF5WWwRPtdRFBRMS6x4FoNZz7
	vV6yQ5wV0xLZ+qvik+fyI/7fSnLISaNwBQQJgburP
X-Gm-Gg: ASbGnctVe4LWXz0uMQgAju5YZbYnCLyH+cDXQBxDJ+kDo4aCtQRlbqAdkHV3+KGSAkh
	q08KQUhQ0JcezYcByjjQ3fFmhbi5Cj3Z6WJqKAMe7ZHo7FXNu4BOJMn0KVVgYMkfN184KblCnhE
	vQPDTSdhCFmJx2SZfCIeUysoqKV2zPlwz+zJ20KlowitU7
X-Google-Smtp-Source: AGHT+IGY4oL+n5OsidgL3QIHNPw7v8k8ZYlSLDyq/Gl3cy0pYqbV0yAIPWuxZE2BO0OqpqN1fWJKcjJOupyMB2kYRJA=
X-Received: by 2002:ac8:5d53:0:b0:4a6:fda0:748f with SMTP id
 d75a77b69052e-4a7262407a6mr2896471cf.7.1749733225837; Thu, 12 Jun 2025
 06:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610215516.1513296-1-visitorckw@gmail.com> <20250610215516.1513296-2-visitorckw@gmail.com>
In-Reply-To: <20250610215516.1513296-2-visitorckw@gmail.com>
From: Robert Pang <robertpang@google.com>
Date: Thu, 12 Jun 2025 22:00:14 +0900
X-Gm-Features: AX0GCFterX1Lih1AEFUT5YaLY4MozeJlnsq7BnWO39Y8Pg7nAWkI31Ftwg0dKvY
Message-ID: <CAJhEC05pmnTd9mROTazKMFzSO+CcpY8au57oypCiXGaqhpA_2Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] lib min_heap: Add equal-elements-aware sift_down variant
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: corbet@lwn.net, colyli@kernel.org, kent.overstreet@linux.dev, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-bcache@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuan-Wei

Thanks for this patch series to address the bcache latency regression.
I tested it but results show regression still remains. Upon review of
the patch changes, I notice that the min_heap_sift_down_eqaware_inline
#define macro in this patch may have been mapped incorrectly:

+#define min_heap_sift_down_eqaware_inline(_heap, _pos, _func, _args)   \
+       __min_heap_sift_down_inline(container_of(&(_heap)->nr,
min_heap_char, nr), _pos,        \
+                                   __minheap_obj_size(_heap), _func, _args=
)

I changed it to map to its "eqaware" counterpart like this and the
regression does not happen again.

+#define min_heap_sift_down_eqaware_inline(_heap, _pos, _func, _args)   \
+       __min_heap_sift_down_eqaware_inline(container_of(&(_heap)->nr,
min_heap_char, nr), _pos,        \
+                                   __minheap_obj_size(_heap), _func, _args=
)

Do you think this correction is appropriate?

Best regards
Robert Pang

On Wed, Jun 11, 2025 at 6:55=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> The existing min_heap_sift_down() uses the bottom-up heapify variant,
> which reduces the number of comparisons from ~2 * log2(n) to
> ~1 * log2(n) when all elements are distinct. However, in workloads
> where the heap contains many equal elements, this bottom-up variant
> can degenerate and perform up to 2 * log2(n) comparisons, while the
> traditional top-down variant needs only O(1) comparisons in such cases.
>
> To address this, introduce min_heap_sift_down_eqaware(), a top-down
> heapify variant optimized for scenarios with many equal elements. This
> variant avoids unnecessary comparisons and swaps when elements are
> already equal or in the correct position.
>
> Cc: stable@vger.kernel.org # 6.11+
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/min_heap.h | 51 ++++++++++++++++++++++++++++++++++++++++
>  lib/min_heap.c           |  7 ++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/include/linux/min_heap.h b/include/linux/min_heap.h
> index 79ddc0adbf2b..b0d603fe5379 100644
> --- a/include/linux/min_heap.h
> +++ b/include/linux/min_heap.h
> @@ -292,6 +292,52 @@ void __min_heap_sift_down_inline(min_heap_char *heap=
, size_t pos, size_t elem_si
>         __min_heap_sift_down_inline(container_of(&(_heap)->nr, min_heap_c=
har, nr), _pos,        \
>                                     __minheap_obj_size(_heap), _func, _ar=
gs)
>
> +/*
> + * Sift the element at pos down the heap.
> + *
> + * Variants of heap functions using an equal-elements-aware sift_down.
> + * These may perform better when the heap contains many equal elements.
> + */
> +static __always_inline
> +void __min_heap_sift_down_eqaware_inline(min_heap_char * heap, size_t po=
s, size_t elem_size,
> +                                        const struct min_heap_callbacks =
*func, void *args)
> +{
> +       void *data =3D heap->data;
> +       void (*swp)(void *lhs, void *rhs, void *args) =3D func->swp;
> +       /* pre-scale counters for performance */
> +       size_t a =3D pos * elem_size;
> +       size_t b, c, smallest;
> +       size_t n =3D heap->nr * elem_size;
> +
> +       if (!swp)
> +               swp =3D select_swap_func(data, elem_size);
> +
> +       for (;;) {
> +               b =3D 2 * a + elem_size;
> +               c =3D b + elem_size;
> +               smallest =3D a;
> +
> +               if (b >=3D n)
> +                       break;
> +
> +               if (func->less(data + b, data + smallest, args))
> +                       smallest =3D b;
> +
> +               if (c < n && func->less(data + c, data + smallest, args))
> +                       smallest =3D c;
> +
> +               if (smallest =3D=3D a)
> +                       break;
> +
> +               do_swap(data + a, data + smallest, elem_size, swp, args);
> +               a =3D smallest;
> +       }
> +}
> +
> +#define min_heap_sift_down_eqaware_inline(_heap, _pos, _func, _args)   \
> +       __min_heap_sift_down_inline(container_of(&(_heap)->nr, min_heap_c=
har, nr), _pos,        \
> +                                   __minheap_obj_size(_heap), _func, _ar=
gs)
> +
>  /* Sift up ith element from the heap, O(log2(nr)). */
>  static __always_inline
>  void __min_heap_sift_up_inline(min_heap_char *heap, size_t elem_size, si=
ze_t idx,
> @@ -433,6 +479,8 @@ void *__min_heap_peek(struct min_heap_char *heap);
>  bool __min_heap_full(min_heap_char *heap);
>  void __min_heap_sift_down(min_heap_char *heap, size_t pos, size_t elem_s=
ize,
>                           const struct min_heap_callbacks *func, void *ar=
gs);
> +void __min_heap_sift_down_eqaware(min_heap_char *heap, size_t pos, size_=
t elem_size,
> +                                 const struct min_heap_callbacks *func, =
void *args);
>  void __min_heap_sift_up(min_heap_char *heap, size_t elem_size, size_t id=
x,
>                         const struct min_heap_callbacks *func, void *args=
);
>  void __min_heapify_all(min_heap_char *heap, size_t elem_size,
> @@ -455,6 +503,9 @@ bool __min_heap_del(min_heap_char *heap, size_t elem_=
size, size_t idx,
>  #define min_heap_sift_down(_heap, _pos, _func, _args)  \
>         __min_heap_sift_down(container_of(&(_heap)->nr, min_heap_char, nr=
), _pos,       \
>                              __minheap_obj_size(_heap), _func, _args)
> +#define min_heap_sift_down_eqaware(_heap, _pos, _func, _args)  \
> +       __min_heap_sift_down_eqaware(container_of(&(_heap)->nr, min_heap_=
char, nr), _pos,       \
> +                            __minheap_obj_size(_heap), _func, _args)
>  #define min_heap_sift_up(_heap, _idx, _func, _args)    \
>         __min_heap_sift_up(container_of(&(_heap)->nr, min_heap_char, nr),=
       \
>                            __minheap_obj_size(_heap), _idx, _func, _args)
> diff --git a/lib/min_heap.c b/lib/min_heap.c
> index 96f01a4c5fb6..2225f40d0d7a 100644
> --- a/lib/min_heap.c
> +++ b/lib/min_heap.c
> @@ -27,6 +27,13 @@ void __min_heap_sift_down(min_heap_char *heap, size_t =
pos, size_t elem_size,
>  }
>  EXPORT_SYMBOL(__min_heap_sift_down);
>
> +void __min_heap_sift_down_eqaware(min_heap_char *heap, size_t pos, size_=
t elem_size,
> +                                 const struct min_heap_callbacks *func, =
void *args)
> +{
> +       __min_heap_sift_down_eqaware_inline(heap, pos, elem_size, func, a=
rgs);
> +}
> +EXPORT_SYMBOL(__min_heap_sift_down_eqaware);
> +
>  void __min_heap_sift_up(min_heap_char *heap, size_t elem_size, size_t id=
x,
>                         const struct min_heap_callbacks *func, void *args=
)
>  {
> --
> 2.34.1
>
