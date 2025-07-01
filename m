Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966425A33A;
	Tue,  1 Jul 2025 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367026; cv=none; b=R8Rf3jMLqj/PCkivslikMHUAZ9MNqb3AofID8ZZ5fI06HXG1Qab247diyVWhvIH9jVFKhZkSbT6hHpWTnYa7e1sNS9RCFS7Hhat156OTTyGR+8U4hkkfEihnHP+61zj7pLne7hZMgLp071wcyIpOLfA2Er5oR556NTb0bfLfEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367026; c=relaxed/simple;
	bh=vB2ciRLGq2buT1g4Abr9vSFpfnkL7pCjDw8BJb6OhgI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHflLeJBm26LRrJV1kiYzLAdb35SjhF57BDgqdLLISub/VgMOZNQJZp8lkqaW53WDsje9e2NbiuvWpZeIFb6fw1tLLB31bdrqym6gRdaSESrXmpuwSGmNS/3Yikdeas5WSeyyBqNNC0ULo/fLOTAhfBkFfPgjOGnKI5qA2bPaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfgZEFId; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfgZEFId"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553d771435fso4655559e87.3;
        Tue, 01 Jul 2025 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751367023; x=1751971823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6nCukVMyBo3RqFnHOfcz0HJrttovy5ZOtQsinnvZ25E=;
        b=TfgZEFIdkuWKKefjLCe7//mH2nIyLc5rEnwlNyRK4HqS/6YadGTQH94MUdLNUTam3s
         vNnclzbalTFRrVNpwFRotjXmAfkK+8Do7o5OlKY7adoYwQCVb11kLQHj4n0Lq7YjYS7C
         dpcqrRWUCf4Ea5bkB5HHDgmqSp5XIkc9oGNAaXbP08tY49ApWo6jpCyhVxaCRZKNKmI+
         UirP0TJvXx6hQuiGGayxflP81NGa+JzPWwB+d+8Da2TBd6IjZRpuF79nWStsYmXCwoDX
         e1/0YBkVCv+BIje7LZwjT5tbCh0jMd5lMlkLm884OiYnXrnbSwexhCB5UI6DwN1bg6JZ
         dRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367023; x=1751971823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nCukVMyBo3RqFnHOfcz0HJrttovy5ZOtQsinnvZ25E=;
        b=AtMihS+IZVeP64/fsLCzjB3R0s8xsxbjAasjqmr0pQq9DUEZAn5Q/b4wM+jVeu0g6m
         aUXAZzVa4PHNjRMA4IEHk6p75sBFlE/9bQq/7J27gvYTiSxDtCyGw7MSFdsssw8w4D1U
         A8vczCTfVzX1mrJCZMt4bVuSaCR9ZP8gGQiq1PgxiTCxp9r/4bKtzFFIsu7jgq/4IQhT
         X3z25MTJ+rXAkf5Ln+UzzTmjl3EE8+NkHvp5GK4s4IF7RNaAxInH+JBM16OnxbsWNaPw
         dNh9HmqP66MrI/RHFQ+7rm8Pr/VALKAVbgYT+P0I6bCc3zWCivB2zeIskp+WpgEIvgA0
         bLJw==
X-Forwarded-Encrypted: i=1; AJvYcCU+D1MjLBVhIdiHi+utlm+zJFODhxRhUCUS5xU2MLymWjvcU52caBKzLVn0f3Zm69DZe2+8qH/DDvngeCw=@vger.kernel.org, AJvYcCUWtA3/S7YeGeRSs24P589xQigZaRy196aeTT/+NFpqLP9L2oAK4j/A/rVpciqR6RQPtMROeVZr/eeaEcCIYTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAj5wIOVj6cFY6EP51ZPPJD7T4BbOrPTctRnm031taVKfcD8n
	VT9ke5UAd2tN3Kkuv92ZctyMNkcJqZGh/eNIWLeHe2qOE2FwSfkYUKfkhLiNpw==
X-Gm-Gg: ASbGncslGZwakzp3W9oFA0lkcdKtED/lZ9qzmF5FWHEv8LInQHrIeSdeHDAt2OhCKRa
	BZKnhVs4OYAv9ySeTlc/gHZTBwpHp81pen0ylvMACz1R5+4bqBq8fBUtmI1UEH8psEF+GT/tF9T
	Mh+2HxDIbvjECOW0R+tWZldzk6bfP1zIGhzwXLTPKUF5GbcozifpLtb8Zulyx6bsFEnKyMzx/sl
	a/YrrB4Ui+5glTJZ824nIMN0q85ROYtacgMGC3goMsmPEtHArj6RAEPuLPVGnC7o7aO3FZcWgL5
	Whp5bWlj6y8VznoJhNzd/PvKDvPRiIkTSp/e6r80y8XM3Tx+/ZmhvMB5RVkJl72uzAGAtfD/SxH
	F2MpRuqY8LgU=
X-Google-Smtp-Source: AGHT+IElki988gDWr2y8ghmyNq4FVP1tCS8rW7LXaS5acajXsEXL5t8ekDHYSztkNjljjTDBGKI6rw==
X-Received: by 2002:a05:6512:ac5:b0:553:2c92:fdcb with SMTP id 2adb3069b0e04-5550b8699f2mr6857763e87.3.1751367022393;
        Tue, 01 Jul 2025 03:50:22 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d9e35sm1767155e87.216.2025.07.01.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:50:21 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 1 Jul 2025 12:50:19 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v9 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aGO9a06HutqljjNS@pc636>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221615.3325221-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630221615.3325221-1-vitaly.wool@konsulko.se>

On Tue, Jul 01, 2025 at 12:16:15AM +0200, Vitaly Wool wrote:
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
>  mm/vmalloc.c            | 19 +++++++++++++++----
>  2 files changed, 24 insertions(+), 7 deletions(-)
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
> index 6dbcdceecae1..776c68f84ce2 100644
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
> @@ -4135,6 +4139,11 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  		if (WARN(alloced_size < old_size,
>  			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>  			return NULL;
> +		if (WARN(!IS_ALIGNED((unsigned long)p, align),
> +			 "will not reallocate with a bigger alignment (0x%lx)\n", align))
> +			return NULL;
> +		if (nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)))
> +			goto need_realloc;
>
By this goto change, you bypass the two important checks below. For
example if you shrink the allocated size, you do not need to perform
any allocations. Instead the patch goes and allocates a new area.

You just need to remove:

-		if (nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)))
-			goto need_realloc;

to make it working.

--
Uladzislau Rezki
