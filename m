Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8F1F874F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540369; cv=none; b=anzOfkFrTGYP1uHQOQwwnaf6sdK5lPI9lzloSsXTRGESO+r1v2z3biyE7CAvQ/EPVyVafnFweu5gTVMditDWoLilBjwZB3vZL56plUPxVVreC6r7GCS/c+F+4Lkoco9h17VKMqsd7T4XuS+iLW2uyOVo0nAJEKEKW178sB8YkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540369; c=relaxed/simple;
	bh=qAQmpXa7ID5KZypB9crWnfvGj8xLJhiVhcDIpgBWJx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENryqjnG5ATRYV3x1rzjLN9JkOEttrjVVG5f+sMISuX3qMgiU2xnb8omU4k0F5sk3Q0CA8hS9xUD2fAWUHzxvf4IEOO4iBf/+uJBoU1GnczVPiHzwon+nFK158zSHsOE4ydDxI++o/cWdEZzI6XErlTS+YwAJlTcLXIhzD+B4lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1ihQrvg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1ihQrvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749540366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xiAped60M2xbB9Ds3ypGGB21HDmKyveMU93vjR1lu6k=;
	b=f1ihQrvgjxFBHE1OnZ6w9Xp3PpAqxotTGoQ4jhbWHiPRQ0Dm7Dpz+524Y1lc4Jupe0LHvj
	Em8iIXIZniSN7KmXR3G3Q+f61Kim3I5gcyPI6gxlkjAVJjVkYLq1NlYWcfEof3Y14ykFEe
	ZQdWEcMyj3TcOdfb+oOQp5Dh8YB8AgY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-sRhCm8qjMNG5oqrXdqKMtA-1; Tue, 10 Jun 2025 03:26:05 -0400
X-MC-Unique: sRhCm8qjMNG5oqrXdqKMtA-1
X-Mimecast-MFC-AGG-ID: sRhCm8qjMNG5oqrXdqKMtA_1749540364
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso2987079f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540364; x=1750145164;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xiAped60M2xbB9Ds3ypGGB21HDmKyveMU93vjR1lu6k=;
        b=o6Ac+6mXN6BDpF1ttPc6nSsNHagzv9on+hjrdumNg5TW3cNo2JHtWQrSgqvMonqOwv
         wZmi0jh/z8Q98M+utBhRsO6lsYiU8Yi3Esnf8y7BYdQHK2YrywVE+kSVHJwasBuU+ID1
         K/5hHyZWfdT49WIX1JuUif5svVVUEVOLzqNxQ+dOugFr7+xv101P58Ql7q2rRbVzoz6J
         2nJ/0LMty2mFYwf4CSDn4NugrgdOGtdCnT22413D5B/68g1kJGF5Kss1hTaSO/v7Ky3V
         0mSIjWFvutPGrHC9lFhnAqw3gpcMIn91p8Nl+yeCF/NDxp6xQ3Wb0cpSYgwR/MCyhpuw
         h8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWuSMAgrzvuqrcATsuWJn4aj9+IE5pw1w0Omuj7Y3UWUsSpyjUQoxFqwBo0+v834WtxTTxAmQKuEPc+3FE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hxX79VfI234ojHISoWeIP2eqC0gVJTEQuCGbx1ETazSGo4+m
	H0htaD1l+mAYPz2Q7L5fbtFfISfCOrhE3XiE6CwF/CUgooCGEPtf6H2J2k1CnZZRM0eutojmzbK
	bz4phVEfe1u2MtJ7jrJZG2PlRg2XF7GsgZM8epQkptWm79dC9UnAnIWB7jdYZm5eYYQ==
X-Gm-Gg: ASbGncvepYiscuKNdiHFCcDbsHmAMEkNx91ZgTu43Pneyq+B/q1CnOEj01IUoaDWu8/
	eeBs7n99dfaY8zIx/OnYyygBiRo2d8FhgdgYrRknfZe74f2tg/LsVUGvTQKq5aSO5WVcxIl/c1N
	9T1n2TCPRMxBu7Nhx6lqQbIeUuI2K/keAd8BnH/GZQiuQ0utdBKPNnaevUHsH6NfwAwmwZgujTT
	yJ8GeDW+hnlZhRwja13fugCAmcvb3xYxZ07VyDifR9d8m4ya0Y39YLD6Xl/pHVGaQtzfB1+hs4j
	lpzEqsIrYgVJdYN//j8klM/aC3iToPoFZ5JwvTE3XRbiRkm5YHDUrZ8=
X-Received: by 2002:a05:6000:2909:b0:3a4:c713:7d8 with SMTP id ffacd0b85a97d-3a53188d936mr11898025f8f.16.1749540364055;
        Tue, 10 Jun 2025 00:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGPrGcSB1/kH23tXQfTNaDTb9v4VAmSWZs9ZoyqIAu4kBrqCqQpO83zPHsUYOqTjovGhmHyA==
X-Received: by 2002:a05:6000:2909:b0:3a4:c713:7d8 with SMTP id ffacd0b85a97d-3a53188d936mr11898001f8f.16.1749540363630;
        Tue, 10 Jun 2025 00:26:03 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c66a1sm128378465e9.27.2025.06.10.00.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:26:02 -0700 (PDT)
Message-ID: <b1c61317-a17d-4ca0-88d4-d22e6b536de6@redhat.com>
Date: Tue, 10 Jun 2025 09:26:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] userfaultfd: remove (VM_)BUG_ON()s
To: Tal Zussman <tz2294@columbia.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-2-339dafe9a2fe@columbia.edu>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250607-uffd-fixes-v2-2-339dafe9a2fe@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.25 08:40, Tal Zussman wrote:
> BUG_ON() is deprecated [1]. Convert all the BUG_ON()s and VM_BUG_ON()s
> to use VM_WARN_ON_ONCE().
> 
> While at it, also convert the WARN_ON_ONCE()s in move_pages() to use
> VM_WARN_ON_ONCE(), as the relevant conditions are already checked in
> validate_range() in move_pages()'s caller.
> 
> [1] https://www.kernel.org/doc/html/v6.15/process/coding-style.html#use-warn-rather-than-bug
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---


[...]

>   	if (ctx->features & UFFD_FEATURE_SIGBUS)
>   		goto out;
> @@ -411,12 +411,11 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>   		 * to be sure not to return SIGBUS erroneously on
>   		 * nowait invocations.
>   		 */
> -		BUG_ON(vmf->flags & FAULT_FLAG_RETRY_NOWAIT);
> +		VM_WARN_ON_ONCE(vmf->flags & FAULT_FLAG_RETRY_NOWAIT);
>   #ifdef CONFIG_DEBUG_VM
>   		if (printk_ratelimit()) {
> -			printk(KERN_WARNING
> -			       "FAULT_FLAG_ALLOW_RETRY missing %x\n",
> -			       vmf->flags);
> +			pr_warn("FAULT_FLAG_ALLOW_RETRY missing %x\n",
> +				vmf->flags);

You didn't cover that in the patch description.

I do wonder if we really still want the dump_stack() here and could 
simplify to

	pr_warn_ratelimited().

But I recall that the stack was helpful at least once for me (well, I 
was able to reproduce and could have figured it out differently.).

[...]

>   	err = uffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_vma);
>   	if (err)
> @@ -1867,9 +1865,9 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
>   	up_read(&ctx->map_changing_lock);
>   	uffd_move_unlock(dst_vma, src_vma);
>   out:
> -	VM_WARN_ON(moved < 0);
> -	VM_WARN_ON(err > 0);
> -	VM_WARN_ON(!moved && !err);
> +	VM_WARN_ON_ONCE(moved < 0);
> +	VM_WARN_ON_ONCE(err > 0);
> +	VM_WARN_ON_ONCE(!moved && !err);
>   	return moved ? moved : err;


Here you convert VM_WARN_ON to VM_WARN_ON_ONCE without stating it in the 
description (including the why).

> @@ -1956,9 +1954,9 @@ int userfaultfd_register_range(struct userfaultfd_ctx *ctx,
>   	for_each_vma_range(vmi, vma, end) {
>   		cond_resched();
>   
> -		BUG_ON(!vma_can_userfault(vma, vm_flags, wp_async));
> -		BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
> -		       vma->vm_userfaultfd_ctx.ctx != ctx);
> +		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vm_flags, wp_async));
> +		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx &&
> +				vma->vm_userfaultfd_ctx.ctx != ctx);
>   		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));

Which raises the question, why this here should still be a WARN

-- 
Cheers,

David / dhildenb

