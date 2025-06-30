Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5912AF1B;
	Mon, 30 Jun 2025 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279459; cv=none; b=s40+QPiS6LKtkQ7RbprnZSl+CoaGz29QTVV6q+EtLlk4LUAVhEq4i93stot//nXSj6eD8WPcoBCpIMK/YfC72OhEkyc1lWB2ss0Hp0RTuvGKRaIq5CIlMSE9SjNS5xvQB2xbj/chfhrPEW25Bw0EjJWLsfJ7esGEMpAR81oDDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279459; c=relaxed/simple;
	bh=rzqf8KMfkh7J6fnUaHKXupiWofR6LjqFm240toyhNGI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8fMuuU7tbx1K3YbAQT4daVJx23wqwmaD/8LZ2hsuj5JaF8U/Fkb3WI2SpnXxEtYNxTPep0NlLEA2geRhA3gYuk5xYUiBeoJ79Me3rYGFOj7juafNeUZNczQk1BbvZfuaJYTZFKUpFbCVLA0cKJjw8rZNPfjtcSDp4+CM6T//Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8dsbeoV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8dsbeoV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-555024588b1so2204969e87.1;
        Mon, 30 Jun 2025 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751279455; x=1751884255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8e/7v2ltNn1nX9ioUgVxorlkzFe2GpNMHMiKKK8K6ls=;
        b=G8dsbeoV+V23kG3rZj+HIuRKarlKyFKQaNX6fBJvg90Xbxe+cLV1YQlJ1wU81h8uCe
         Jtj+QF8V0VEnHWkgIzL4h/Y9SVPmG4IM6AixQoWEIlhJUWG5RskGHndQmn8BoFBG9YjD
         ZgPyGKSkGh/yp8buV08p9fHMiyV7currBXu07+empKlqtmngCYLxbthDOYxDyHqdbAxR
         WdvVffMxV5ICKl3CO0AuwLZax2mocwENakVQB8ftCPELXtRNkeTHlE7K0X/kMZFgfJTH
         eIfwsR0q/UNjrxU2mqMlFSXDwnt2W+8eKKIOf++kFSnxE/ZdvKkZCDTAgVryKwaf8t4e
         Dc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279455; x=1751884255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e/7v2ltNn1nX9ioUgVxorlkzFe2GpNMHMiKKK8K6ls=;
        b=OdHHmZ+y2n8fLdknpJxrvSGHzLFBW1jETLnV9uIrAoXhwSyhjkIiVFAiW00MfBm1ll
         NNE1iV8qAcgUieCWba83zvrwNHtkbZxXgWRAzk6B2MzQQy8PFtf47wnbQervXoGgH5um
         wPyPHQQaIHEfWz0h3e9XTXEe/VqFzm52G42bt/rGedhgsxnG3Rthd9BOOs6PVDmv/bxP
         qNoQxaPRBF9IHNjoSRfoMHjRYpzPffVRcs4ivCXtx4ntgCqg8v7FAz3WFQW1MgN7AHBj
         x8qLqljHkzl1gbyr/40ol7p7uSd//mbfoWDrr8QVQc/wXONfLII9qP0jj7fk7fh5FmsN
         Jq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrm7xMQ4MW0w5W0eb6r64M1AnW32NfzAP3Vrgnw1721hte8uOMPK13NSUWVCSyKK7WJMUZicvM0U7lY7eGxDE=@vger.kernel.org, AJvYcCX8BzOx3jALWFLcefjvpAGJDPgidWGiEDVTpHUmwuiayDkn5oaVDlWAZ6kn2ayZENeIKx5HTvLN7cByzh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbkINqGtnphVs4ksRHI2lS77f7ZMyw5VnWjHnVcQisbwphqnge
	xeEg2G1ZJNYaG+njqxsbM54c8SQStmCSRlwNE+44CU7l+eVsAji8z/Fh
X-Gm-Gg: ASbGncv+2hXG/BewB16luQBXrd0kJ69ZtB0qdMQhCFv5R/NTGWkiDYFyww57lAYfLZj
	+iLLRnIL67YuCkn+KvTvIiAXJYX35/2vM9ZqdVauz/s0mGEspxqVgcFN92ejJs1kK0INOt1UoHE
	bTQOLN+oVqC+XJxmfIAvGRMW9RvYZwZygpw3yFVeHFRtMkqxNtO+lqGlEkMEDxElcjlX9SvRGtU
	VoWRwAYHhVECY5/F5lWwj86W4pUiDCueCNGzl4JuIjvRYbQycsx6IWUX9deJfQsy4jesn4B/A6z
	NeWo2VMd4QxixSRfwUTbNsu+YB7Jm8JNlg9UQbttt20LREzWmcyoxpZ6HTqQa0HOgsSpGmB646n
	SG6jD6pOZE6Q=
X-Google-Smtp-Source: AGHT+IEF2nOl072KkJX5VOycpUDoH66uDeT/lt1cf4dthiOO6DxJCwj1jJ46PgB8pAi9UlOEqIa06g==
X-Received: by 2002:a05:6512:318f:b0:553:510d:f46b with SMTP id 2adb3069b0e04-5550b8b0549mr4515221e87.32.1751279455093;
        Mon, 30 Jun 2025 03:30:55 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d130sm1397220e87.54.2025.06.30.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:30:54 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 30 Jun 2025 12:30:52 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aGJnXLl_OLqwjAUt@pc636>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
 <20250628102537.2542789-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628102537.2542789-1-vitaly.wool@konsulko.se>

On Sat, Jun 28, 2025 at 12:25:37PM +0200, Vitaly Wool wrote:
> Reimplement vrealloc() to be able to set node and alignment should
> a user need to do so. Rename the function to vrealloc_node_align()
> to better match what it actually does now and introduce macros for
> vrealloc() and friends for backward compatibility.
> 
> With that change we also provide the ability for the Rust part of
> the kernel to set node and aligmnent in its allocations.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  include/linux/vmalloc.h | 12 +++++++++---
>  mm/vmalloc.c            | 20 ++++++++++++++++----
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index fdc9aeb74a44..68791f7cb3ba 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
>  extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
>  #define vcalloc(...)		alloc_hooks(vcalloc_noprof(__VA_ARGS__))
>  
> -void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> -		__realloc_size(2);
> -#define vrealloc(...)		alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> +void *__must_check vrealloc_node_align_noprof(const void *p, size_t size,
> +		unsigned long align, gfp_t flags, int nid) __realloc_size(2);
> +#define vrealloc_node_noprof(_p, _s, _f, _nid)	\
> +	vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
> +#define vrealloc_noprof(_p, _s, _f)		\
> +	vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
> +#define vrealloc_node_align(...)		alloc_hooks(vrealloc_node_align_noprof(__VA_ARGS__))
> +#define vrealloc_node(...)			alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
> +#define vrealloc(...)				alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>  
>  extern void vfree(const void *addr);
>  extern void vfree_atomic(const void *addr);
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6dbcdceecae1..d633ac0ff977 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4089,12 +4089,15 @@ void *vzalloc_node_noprof(unsigned long size, int node)
>  EXPORT_SYMBOL(vzalloc_node_noprof);
>  
>  /**
> - * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
> + * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
> + * remain unchanged
>   * @p: object to reallocate memory for
>   * @size: the size to reallocate
> + * @align: requested alignment
>   * @flags: the flags for the page level allocator
> + * @nid: node id
>   *
> - * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
> + * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If @size is 0 and
>   * @p is not a %NULL pointer, the object pointed to is freed.
>   *
>   * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
> @@ -4111,7 +4114,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>   * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
>   *         failure
>   */
> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> +				 gfp_t flags, int nid)
>  {
>  	struct vm_struct *vm = NULL;
>  	size_t alloced_size = 0;
> @@ -4135,6 +4139,13 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  		if (WARN(alloced_size < old_size,
>  			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>  			return NULL;
> +		if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)),
> +			 "vrealloc() has mismatched nids\n"))
> +			return NULL;
> +		if (WARN((uintptr_t)p & (align - 1),
> +			 "will not reallocate with a bigger alignment (0x%lx)\n",
> +			 align))
> +			return NULL;
>
IMO, IS_ALIGNED() should be used instead. We have already a macro for this
purpose, i.e. the idea is just to check that "p" is aligned with "align"
request.

Can you replace the (uintptr_t) casting to (ulong) or (unsigned long)
this is how we mostly cast in vmalloc code?

WARN() probably is worth to replace. Use WARN_ON_ONCE() to prevent
flooding.

--
Uladzislau Rezki
