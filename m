Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F4427F72E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540670; cv=none; b=U9CGXp3DJpp8ui+E9ORurbPXdhqbXYsDK5TjzMqlxqdVqc6SMQoL6M89VAJdws6AaiHHhvxyUCnesZr7zaoHPiZS6qPEDs0rGc98hScLJchRcNYtcnVaI9TM0hlc7YrdqYeibPeJIKckfShKETTQVU8vK8z405pZDNLbnffmq74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540670; c=relaxed/simple;
	bh=YQ7Kb7+BMSY2Ib4eMANeXnDmoCZmMmAXSNMXv5k3P+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFLebAME/iDtEMBjtuD0vr9zI9asUQ8td3fdEzEryVaBrvvkaiI9QhKZyRB1e4IayRN8cGzf15bEqrzdvLQ6icPZaJY2zldIZdIeOpMnHCWvN2Yf5pEb7LVFOs4Gl7aeiQYimsqbONuFj/usmygh/qFijPgPwgaHjYwZWhixCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=htsl4y9I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="htsl4y9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749540667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7ZBXyFKmfcUXWErjsR8heeSbZeDBwS7mLB3lw3nce2g=;
	b=htsl4y9IhOuedlBx+tqR9K5aqXXrELD/KIIJ0yvYcM9H7QPdrBPeeblu3BROU3OJ/qVAUC
	EU7A6Hdo94FymNEDw4GGhGeE6loTVkYWPMZw1XuRVxG+EKFIcBG2FfgoB4zWvw7hNlHW9s
	r5gOVEnL/wZms9hfkahxwHW/7Kgj0FE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-3CgQwxJDPSCa7TOH_9D7Ow-1; Tue, 10 Jun 2025 03:31:01 -0400
X-MC-Unique: 3CgQwxJDPSCa7TOH_9D7Ow-1
X-Mimecast-MFC-AGG-ID: 3CgQwxJDPSCa7TOH_9D7Ow_1749540660
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so34228565e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540660; x=1750145460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ZBXyFKmfcUXWErjsR8heeSbZeDBwS7mLB3lw3nce2g=;
        b=Zuyxa6zqJR2CizwoJzTpFy6luPHRLeragU9ChBPEp3UAyOmI6tnfSjVqoMN33arthc
         7hPDUO9wnUsO65nN+LjLwMERHUyscMRKcAEYCAXAbLQq20EcQTsNJz00ds5Cyy/Im9ZE
         JwRR85uKkNT6OkFeS3CplwdKyq9u1Vv1mhGNF/hve/WE0Akzc2QB5hjJBPga+arRubSJ
         Md0k/R0q0EuR+AGCwpBtrND6lKuyggjMcPSdPeI8E3hJmxhAmDL9HNAZjTpWDq+aoSbT
         AJVl90R1UleAVlJNCYFuo/Ea17LkXjo2uT1hYruInKZ3enlQSrJ2c/Vo6fMrty6hNmWN
         ZTzA==
X-Forwarded-Encrypted: i=1; AJvYcCX0IIMxWF3pxN12vhZ/4xSToBkAncDt/8JZb57vT/rbeylRyNS9MGrj1agjHn2nV5PJ1njFFzT1hBZkwvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5+GuGItPjQBOWHdDiTbBimqCatNbyUKbjMZTudSM/SVldgrxH
	2FKPGQL+1etidfHmb9djYQkKvximb5oklFC//9TDL+CxQlg5DLj5fe+dIqJ3rOyUY/WEFOB8s+4
	nVu0XhwrjXDq6NDxYq7OzJySLoXv1haXwjimfXBZJ7kY3gLIkdvgLg+3pVc5CWlBckQ==
X-Gm-Gg: ASbGncth/TAu1IpWbsmUAeo6CR2hjE7ScJv7B7YOJm0mzfS1TZ3TUI8OqyW8oQf5jQV
	IRBpLRjfStywv7fhI0QCV9CDYZv/WC2kfQRS701HcTn7G4ih+sqfc1Hs75mcAIi+xl4KXpV1/zm
	bNXuDV2HtkGz9P/BbPOhKEsZKvrYF2QIYnLSlNH6t6Kjo/O3c99gkYD4iBLhwC6sgmRuxzsn2PM
	yMlWqRgErp3Pqb+0nGsAnBOZ6hL8d62JjXez7dXOKjgiGYGBAOp01r59q28OmeknXbLN7M8I5Sz
	vl3g7+ZVPfVkKiWjhAonlybY5DpQFVEIMp2+6woOo86863T4p4G7wSs=
X-Received: by 2002:a05:600c:6096:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4531de7154amr13840745e9.17.1749540659663;
        Tue, 10 Jun 2025 00:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTfMc63QZqIEFt8LdLkDEk3vQa0QtdQ0XHTE5C5WIP70KxXWyw1mIXlUPj5tzP3JiMFhbuOQ==
X-Received: by 2002:a05:600c:6096:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4531de7154amr13840175e9.17.1749540659008;
        Tue, 10 Jun 2025 00:30:59 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370936esm132220275e9.20.2025.06.10.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:30:58 -0700 (PDT)
Message-ID: <cb6f4acf-1eca-4d61-aa70-5edaf89d9763@redhat.com>
Date: Tue, 10 Jun 2025 09:30:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: Tal Zussman <tz2294@columbia.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-3-339dafe9a2fe@columbia.edu>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250607-uffd-fixes-v2-3-339dafe9a2fe@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.25 08:40, Tal Zussman wrote:
> Currently, a VMA registered with a uffd can be unregistered through a
> different uffd associated with the same mm_struct.
> 
> The existing behavior is slightly broken and may incorrectly reject
> unregistering some VMAs due to the following check:
> 
> 	if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> 		goto out_unlock;
> 
> where wp_async is derived from ctx, not from cur. For example, a file-backed
> VMA registered with wp_async enabled and UFFD_WP mode cannot be unregistered
> through a uffd that does not have wp_async enabled.
> 
> Rather than fix this and maintain this odd behavior, make unregistration
> stricter by requiring VMAs to be unregistered through the same uffd they
> were registered with. Additionally, reorder the WARN() checks to avoid
> the aforementioned wp_async issue in the WARN()s.
> 
> This change slightly modifies the ABI. It should not be backported to
> -stable.

Probably add that the expectation is that nobody really depends on this 
behavior, and that no such cases are known.

> 
> While at it, correct the comment for the no userfaultfd case. This seems to
> be a copy-paste artifact from the analogous userfaultfd_register() check.
> 
> Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory externalization")

Fixes should come before anything else in a series (Andrew even prefers 
a separate series for fixes vs. follow-up cleanups).

> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>   fs/userfaultfd.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 80c95c712266..10e8037f5216 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -1466,6 +1466,16 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>   		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
>   				!!(cur->vm_flags & __VM_UFFD_FLAGS));
>   
> +		/*
> +		 * Check that this VMA isn't already owned by a different
> +		 * userfaultfd. This provides for more strict behavior by
> +		 * preventing a VMA registered with a userfaultfd from being
> +		 * unregistered through a different userfaultfd.
> +		 */

Probably we can shorted to:

/*
  * Prevent unregistering through another userfaultfd than used for
  * registering.
  */

?

> +		if (cur->vm_userfaultfd_ctx.ctx &&
> +		    cur->vm_userfaultfd_ctx.ctx != ctx)
> +			goto out_unlock;
> +
>   		/*
>   		 * Check not compatible vmas, not strictly required
>   		 * here as not compatible vmas cannot have an
> @@ -1489,15 +1499,14 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>   	for_each_vma_range(vmi, vma, end) {
>   		cond_resched();
>   
> -		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
> -
>   		/*
> -		 * Nothing to do: this vma is already registered into this
> -		 * userfaultfd and with the right tracking mode too.
> +		 * Nothing to do: this vma is not registered with userfaultfd.
>   		 */

Maybe

		/* VMA not registered with userfaultfd. */

The "skip" below is rather clear. :)

>   		if (!vma->vm_userfaultfd_ctx.ctx)
>   			goto skip;
>   
> +		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx != ctx);
> +		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
>   		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
>   
>   		if (vma->vm_start > start)
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

