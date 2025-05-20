Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2852798F1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737031; cv=none; b=THNMFY24RKSGJvCe/A8WJ0x4cbbX51aHqJbqLriPPyyx6Jz2Ya6aUyzJVHtsk39rlJwvXuArh4Rru813dKb7wULFg3LIfv2MXWzH8K9qrRPCYyeDMnIuVs+PjpbHjiKR5HZ15VDIpCWDOuavi/eO4DjkBgGtdbbYSduRf2cfUbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737031; c=relaxed/simple;
	bh=AKNcJVWLbGXgHWPW9BjB75Z7YxhLtUOLkLH3h58M5I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdnTbP5lBi/+/mLtIbMxXGZFM0/hz5bg0Ll8QM7GW2h2jw5auSyeGiiG4cXieDsxJhVJVuPe1boQqBAMJlvqqLGWrxuOFPfzj2bHjG8xuRDj2OXJaatutxvnoBN5x1TdQLiyYdx3injlQqd69J8uBQ3tLqdxkFo6ciHR5daLdDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EEya9UBO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EEya9UBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747737029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IyqZDF6nTsKA5ptYOVkepI7N/Zyz69GWHnyAHJHWDW8=;
	b=EEya9UBOFdccTmdRaWIWtWoBz3x5EW5hJsf1Da6nmFWx2EhE4lanvgVl3GwlaYG2SR2VjK
	t8HYkC49LtJg1JZ1EhfwZHVJPpLW9yNlqzwByZpNuVfHUccgxAiMdyQMdXVQFwHdTXQbVM
	ZwRfzRE2WZmgAXsHsBkk9YTboYVsQyo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-UXzPCJVbP92OBdYBh8szPw-1; Tue, 20 May 2025 06:30:27 -0400
X-MC-Unique: UXzPCJVbP92OBdYBh8szPw-1
X-Mimecast-MFC-AGG-ID: UXzPCJVbP92OBdYBh8szPw_1747737026
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a364394fa8so1671732f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737026; x=1748341826;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IyqZDF6nTsKA5ptYOVkepI7N/Zyz69GWHnyAHJHWDW8=;
        b=a2RJmKd1d3w9gBrIKzT6V1EwQByhUju/HlfmBBAjcX5iykDzNH2WAQns57fYnroQhI
         1pGqu5zQoXJj1Hsi7K6FjAW4wzD3+LSqy7EbBDx4wPC0Z8gQxYQtOkLc7jZ6e202QnDS
         7oWTrA1jBRqXRWjjtZ8GvodX3sDapsdpA4Cn9HKRSa0q2pAxHGu59sfxt9mUYK/b6RPt
         emYj5HoqhXH4JbtbyQnVoVlGJx2XeTivpsT0AziCAw5YJOr+Po45kE9JaIM511Zewjdi
         k7ZRjRu5JNwNUZHAprCm0NkUUGOGAgS3uFauOQycrAZ55Bo+yx5Xb3XnzVzBBsiXl+tJ
         3w4Q==
X-Forwarded-Encrypted: i=1; AJvYcCULocsBabWvkLIMmHG8Z3D0zV51EPMcVr+04wYvy2xeT1NN/gzlmt9bCwWL9+mjVN0HNAVmKdvRCu3DYtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcJtxgoG1VEskrKX5VRKHnPUeYRv20m9Y4by7eccFQvsphC1ap
	Zi/g9ygBLuX9tqw4OudftUvH6jfigLaQ6VGN+mVe2adE7iJDOoAaZwGOfjiQWlzcsr5gi/9cUsJ
	53fa00voKYEEuXyrHSJbdBXClNyVxfRsSafc8wDPhElE71k/p3YXUQatj2yYTvc6m+w==
X-Gm-Gg: ASbGncuJjKl9CNsCfBMwE0BY87vodmsuCJb4sXKDAl/QbRv3Ta7ODcCQuiUTPDi+4Pi
	t90zYkv96Ja8xb0aKp5SnWTOqjcU2cQgzrd+a9bE0Jnj8ajvUXoCV5XJeIdLw8SMc2hL+YixbjB
	GQRH29P2ekt/0sQvay+PYF6YpSCzIyjdVO4il5hbFuIWOFquJcmMkxFNmoMNtbEPlPCkRvetVYQ
	e7jmIiYihVsNxVMu9FKi44rULc5+NcCil4cqd4mheNjEi6b0W6T1Sb4EhpvwRTAAlJh7lsO1t7S
	YjrTmStEJPCjzFbhfR+Yl4XnoNxrb+AYL6zV/RQYDRBHMDSxWN2p32NqXLcXIDvLYsPVCieWuW5
	oD8H4SoqkFLrhdYA+355wwr5XAog4xYtsSdT9Cng=
X-Received: by 2002:a05:6000:1881:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-3a35fead108mr14152705f8f.29.1747737026540;
        Tue, 20 May 2025 03:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoaw0m714635En0zqDIhccEWnaF7oScgqO/CS2yGTyppvcyz0MOxrqhsvQmQEsW4QqhBt2Ig==
X-Received: by 2002:a05:6000:1881:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-3a35fead108mr14152674f8f.29.1747737026139;
        Tue, 20 May 2025 03:30:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1dfsm16243981f8f.18.2025.05.20.03.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 03:30:25 -0700 (PDT)
Message-ID: <becb11bd-e10c-4f59-9ff1-1f7acd2e1ee0@redhat.com>
Date: Tue, 20 May 2025 12:30:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] mm: madvise: refactor madvise_populate()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <96503fba082709bc4894ba4134f9fac1d179ba93.1747686021.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <96503fba082709bc4894ba4134f9fac1d179ba93.1747686021.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 22:52, Lorenzo Stoakes wrote:
> Use a for-loop rather than a while with the update of the start argument at
> the end of the while-loop.
> 
> This is in preparation for a subsequent commit which modifies this
> function, we therefore separate the refactoring from the actual change
> cleanly by separating the two.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   mm/madvise.c | 39 ++++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8433ac9b27e0..63cc69daa4c7 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -967,32 +967,33 @@ static long madvise_populate(struct mm_struct *mm, unsigned long start,
>   	int locked = 1;
>   	long pages;
>   
> -	while (start < end) {
> +	for (; start < end; start += pages * PAGE_SIZE) {
>   		/* Populate (prefault) page tables readable/writable. */
>   		pages = faultin_page_range(mm, start, end, write, &locked);
>   		if (!locked) {
>   			mmap_read_lock(mm);
>   			locked = 1;
>   		}
> -		if (pages < 0) {
> -			switch (pages) {
> -			case -EINTR:
> -				return -EINTR;
> -			case -EINVAL: /* Incompatible mappings / permissions. */
> -				return -EINVAL;
> -			case -EHWPOISON:
> -				return -EHWPOISON;
> -			case -EFAULT: /* VM_FAULT_SIGBUS or VM_FAULT_SIGSEGV */
> -				return -EFAULT;
> -			default:
> -				pr_warn_once("%s: unhandled return value: %ld\n",
> -					     __func__, pages);
> -				fallthrough;
> -			case -ENOMEM: /* No VMA or out of memory. */
> -				return -ENOMEM;
> -			}
> +
> +		if (pages >= 0)
> +			continue;
> +
> +		switch (pages) {
> +		case -EINTR:
> +			return -EINTR;
> +		case -EINVAL: /* Incompatible mappings / permissions. */
> +			return -EINVAL;
> +		case -EHWPOISON:
> +			return -EHWPOISON;
> +		case -EFAULT: /* VM_FAULT_SIGBUS or VM_FAULT_SIGSEGV */
> +			return -EFAULT;
> +		default:
> +			pr_warn_once("%s: unhandled return value: %ld\n",
> +				     __func__, pages);
> +			fallthrough;
> +		case -ENOMEM: /* No VMA or out of memory. */
> +			return -ENOMEM;

Can we limit it to what the patch description says? "Use a for-loop 
rather than a while", or will that be a problem for the follow-up patch?

-- 
Cheers,

David / dhildenb

