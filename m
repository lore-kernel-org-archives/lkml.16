Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960723498E;
	Thu, 26 Jun 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971224; cv=none; b=OxGQLoa4TgkdE8NKsbBBXS2Hr405LcqSuo10CFty3KQvTnt80kx1WP7NwbwqIzd/G45/7nI4bp3bNJJRGQT5dNGX8HpAyw/gVeXn+U9V8aN/elZzeYM/zTJhDRX7ouknshZ2gNcz+QG1GTud5TGTLk1WeiMuLxTfA/ML8d6pG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971224; c=relaxed/simple;
	bh=Ft275+6NguxVtKIelk/MGGPXOjF3bLvbZHtNBsEMxHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbJ1Xw12ZQq2ZcbrtWkVscIvjen81klOTUQ3VMUhwVcbIurIzZZurr3o57I28DwZpktOLjBQ/SKO9D062hn+RKux0KELcebV1+m1MPpy/2czw1iQhQ2rRUlPzMpOkwB5xQ1nw8dLVmnibWs0SQE3EBbEAA3Mj7cY2Q9FMdpZ/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJp9dMFv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJp9dMFv"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso15150291fa.1;
        Thu, 26 Jun 2025 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750971220; x=1751576020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHR0j6osj5JXjZAu8frswdQtAV7pwiXahW5jwmRCgMI=;
        b=iJp9dMFvV6PfvpIac4VGpAKdyFoa8LXMd/HiFTQwr47ya1EJHWDRPVpjpxxaU44E1q
         XH3e0ajOhimse50rOFKV3FZU2s8ZqWhzsUhogwoKBSSqNtMVGY6ePkZ2T2s0udqhkZ+r
         c+86ItNcoAa8Nwsh/nJlFtyNSsjixJ4z+nWJik9kixyXkpDbZqLoTnPBe1WxKxpQyjq/
         I03I8EWCujx26sGp8dOrosxDqQnjlRwS2dnO/DqXdAIXEfREYRs2iA351djOpFx8m4AK
         6kjv7GIjqloHvrJFBYAyykbR28zXz7DcUeyGfGOJ8TzfnnjK8Mpc7kAKrVZodeHFTS6F
         lF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750971220; x=1751576020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHR0j6osj5JXjZAu8frswdQtAV7pwiXahW5jwmRCgMI=;
        b=C22SIaIzYcrTqCy/7+khs1dMDpFMQ9vz0mXw4hEq1FQvTYl0jv4sQJu2ShO7WcoDQ3
         2HGMBgr28UtRjICDCBKrglN/xT1vd6LFHBF27MJAJjY0ffy8KPENXeavLBQi36C57+rA
         dcAxCBxCJ+tXwQ+qNOAun//FDEQu+L+EIqum9rDWQmZaP5gNQ3Fx1FWIEuSiLweZ0HEt
         5Ul/J004gna0/r/l3ZQBuUSdwvFZUerRrqF8Zfl2YlB27B182c3i+CvYlwd5BNvlbCqe
         u/0NBKHFDlj07DfePLZpKgVFDEVn0yvX6UvQ35n7NFaRL4nXDXx1eKQq0TZnC5T/jb4J
         Dc3A==
X-Forwarded-Encrypted: i=1; AJvYcCUtp5lxUqAvFbW6tWB9ZTihBVpoD5OtT2M6FgW+gAcfqLx/fk4YbZdDKjpWzXsEOuISkwcWZy/pSlM17BI0ifg=@vger.kernel.org, AJvYcCVhh4WkDnnuOl96h27Wm5eNJGe8ISaO1GyKTcMKqMN8JL0Ipyxk8UlAPx3uhjwD4adgDplLMX2/4ZpyJwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAs6pNkMcXVR5ysxgmLhe0vg0YYoREVUie6AIKSCsCCdqPpzi
	lO8LsSsmPIpiGP4Lk3ZzBACYToHSG14EqYEBNfan/jsyupnFxoS3L4xDcUsjL6sz0YoaOvjwoYh
	dw2rpxeqGNCWGnmTyCWlwo+Ya8DQWt5Q=
X-Gm-Gg: ASbGncv2+du/wuSbGEosZktm+mgKKuSROS867q4cEGR8Qsq0wDliHTygy+f1ntchbxB
	7WUCH+J/9UeHBhIsF9PmMLk+dHNmcu/SIGBOHBovqRVp7p1ugjZFiOnqX4ZMwueCS87dPkJc+Ln
	ES708Bh+J4TAb2IdIy95r+6IovqmiTrzyldSNfX9SPZAEH
X-Google-Smtp-Source: AGHT+IFAeiNVCuRuFxrOTBMGX/B06Ycb/XWjiNYp1OXtmPtAGsFpz5UnI23CDyMY2wmlK3gee5nSfzFKdZYV7oqhHzo=
X-Received: by 2002:a2e:ae11:0:b0:32a:8ae2:a8a7 with SMTP id
 38308e7fff4ca-32cdc4820a0mr1400421fa.8.1750971220105; Thu, 26 Jun 2025
 13:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se> <20250626083632.3596363-1-vitaly.wool@konsulko.se>
In-Reply-To: <20250626083632.3596363-1-vitaly.wool@konsulko.se>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 26 Jun 2025 13:53:03 -0700
X-Gm-Features: Ac12FXzCJObvxzPse24yMd5WH8K7cSo47qQtOjEJRK-wxx22oD_vk28dKv_9NQg
Message-ID: <CAJ-ks9mB8tAG+vE2RnN0+3-pqcQU_KkmZUHU++-uswpxLBp9Kg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mm/slub: allow to set node and align in k[v]realloc
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 1:39=E2=80=AFAM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
> Reimplement k[v]realloc() to be able to set node and alignment
> should a user need to do so. Rename the respective functions to
> k[v]realloc_node() to better match what they actually do now and
> introduce macros for k[v]realloc() for backward compatibility.
>
> With that change we also provide the ability for the Rust part of
> the kernel to set node and aligmnent in its K[v]xxx [re]allocations.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

Hi Vitaly, there is a typo in the subject line: it should be slab, not slub=
.

> ---
>  include/linux/slab.h | 12 ++++++++----
>  mm/slub.c            | 33 ++++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index d5a8ab98035c..119f100978c8 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -465,9 +465,11 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
> -void * __must_check krealloc_noprof(const void *objp, size_t new_size,
> -                                   gfp_t flags) __realloc_size(2);
> -#define krealloc(...)                          alloc_hooks(krealloc_nopr=
of(__VA_ARGS__))
> +void * __must_check krealloc_node_noprof(const void *objp, size_t new_si=
ze,
> +                                        gfp_t flags, int nid) __realloc_=
size(2);
> +#define krealloc_node(...)             alloc_hooks(krealloc_node_noprof(=
__VA_ARGS__))
> +#define krealloc_noprof(o, s, f)       krealloc_node_noprof(o, s, f, NUM=
A_NO_NODE)
> +#define krealloc(...)                  alloc_hooks(krealloc_noprof(__VA_=
ARGS__))
>
>  void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
> @@ -1073,8 +1075,10 @@ kvmalloc_array_node_noprof(size_t n, size_t size, =
gfp_t flags, int node)
>  #define kvcalloc_node(...)                     alloc_hooks(kvcalloc_node=
_noprof(__VA_ARGS__))
>  #define kvcalloc(...)                          alloc_hooks(kvcalloc_nopr=
of(__VA_ARGS__))
>
> -void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, int=
 nid)
>                 __realloc_size(2);
> +#define kvrealloc_node(...)                    alloc_hooks(kvrealloc_nod=
e_noprof(__VA_ARGS__))
> +#define kvrealloc_noprof(p, s, f)              kvrealloc_node_noprof(p, =
s, f, NUMA_NO_NODE)
>  #define kvrealloc(...)                         alloc_hooks(kvrealloc_nop=
rof(__VA_ARGS__))
>
>  extern void kvfree(const void *addr);
> diff --git a/mm/slub.c b/mm/slub.c
> index c4b64821e680..2d5150d075d5 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4845,7 +4845,7 @@ void kfree(const void *object)
>  EXPORT_SYMBOL(kfree);
>
>  static __always_inline __realloc_size(2) void *
> -__do_krealloc(const void *p, size_t new_size, gfp_t flags)
> +__do_krealloc(const void *p, size_t new_size, gfp_t flags, int nid)
>  {
>         void *ret;
>         size_t ks =3D 0;
> @@ -4859,6 +4859,15 @@ __do_krealloc(const void *p, size_t new_size, gfp_=
t flags)
>         if (!kasan_check_byte(p))
>                 return NULL;
>
> +       /*
> +        * it is possible to support reallocation with a different nid, b=
ut
> +        * it doesn't go well with the concept of krealloc(). Such
> +        * reallocation should be done explicitly instead.
> +        */
> +       if (WARN(nid !=3D NUMA_NO_NODE && nid !=3D page_to_nid(virt_to_pa=
ge(p)),
> +                               "krealloc() has mismatched nids\n"))
> +               return NULL;
> +
>         if (is_kfence_address(p)) {
>                 ks =3D orig_size =3D kfence_ksize(p);
>         } else {
> @@ -4903,7 +4912,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t=
 flags)
>         return (void *)p;
>
>  alloc_new:
> -       ret =3D kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO=
_NODE, _RET_IP_);
> +       ret =3D kmalloc_node_track_caller_noprof(new_size, flags, nid, _R=
ET_IP_);
>         if (ret && p) {
>                 /* Disable KASAN checks as the object's redzone is access=
ed. */
>                 kasan_disable_current();
> @@ -4919,6 +4928,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t=
 flags)
>   * @p: object to reallocate memory for.
>   * @new_size: how many bytes of memory are required.
>   * @flags: the type of memory to allocate.
> + * @nid: NUMA node or NUMA_NO_NODE
>   *
>   * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_s=
ize
>   * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
> @@ -4947,7 +4957,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t=
 flags)
>   *
>   * Return: pointer to the allocated memory or %NULL in case of error
>   */
> -void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
> +void *krealloc_node_noprof(const void *p, size_t new_size, gfp_t flags, =
int nid)
>  {
>         void *ret;
>
> @@ -4956,13 +4966,13 @@ void *krealloc_noprof(const void *p, size_t new_s=
ize, gfp_t flags)
>                 return ZERO_SIZE_PTR;
>         }
>
> -       ret =3D __do_krealloc(p, new_size, flags);
> +       ret =3D __do_krealloc(p, new_size, flags, nid);
>         if (ret && kasan_reset_tag(p) !=3D kasan_reset_tag(ret))
>                 kfree(p);
>
>         return ret;
>  }
> -EXPORT_SYMBOL(krealloc_noprof);
> +EXPORT_SYMBOL(krealloc_node_noprof);
>
>  static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
>  {
> @@ -5079,10 +5089,11 @@ void kvfree_sensitive(const void *addr, size_t le=
n)
>  EXPORT_SYMBOL(kvfree_sensitive);
>
>  /**
> - * kvrealloc - reallocate memory; contents remain unchanged
> + * kvrealloc_node - reallocate memory; contents remain unchanged
>   * @p: object to reallocate memory for
>   * @size: the size to reallocate
>   * @flags: the flags for the page level allocator
> + * @nid: NUMA node id
>   *
>   * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size=
 is 0
>   * and @p is not a %NULL pointer, the object pointed to is freed.
> @@ -5100,17 +5111,17 @@ EXPORT_SYMBOL(kvfree_sensitive);
>   *
>   * Return: pointer to the allocated memory or %NULL in case of error
>   */
> -void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, int=
 nid)
>  {
>         void *n;
>
>         if (is_vmalloc_addr(p))
> -               return vrealloc_noprof(p, size, flags);
> +               return vrealloc_node_noprof(p, size, 1, flags, nid);
>
> -       n =3D krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
> +       n =3D krealloc_node_noprof(p, size, kmalloc_gfp_adjust(flags, siz=
e), nid);
>         if (!n) {
>                 /* We failed to krealloc(), fall back to kvmalloc(). */
> -               n =3D kvmalloc_noprof(size, flags);
> +               n =3D kvmalloc_node_noprof(size, flags, nid);
>                 if (!n)
>                         return NULL;
>
> @@ -5126,7 +5137,7 @@ void *kvrealloc_noprof(const void *p, size_t size, =
gfp_t flags)
>
>         return n;
>  }
> -EXPORT_SYMBOL(kvrealloc_noprof);
> +EXPORT_SYMBOL(kvrealloc_node_noprof);
>
>  struct detached_freelist {
>         struct slab *slab;
> --
> 2.39.2
>
>
