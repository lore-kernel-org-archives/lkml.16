Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B22DCF52
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621914; cv=none; b=T0zO6CBKcdqUS95CrijNqG0MUHdU5wUoF/tqbXvRZ1HTai8+IvU64zspE73611K559H8X+DWA73PMVNHRo051vHhed1kL7dfmnXaQFjuQb/tFgtL3nNKMBx4xA5GyUxgAxW753WZ+YvK+YTkCv0snSwhH081937490PUAGHh7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621914; c=relaxed/simple;
	bh=KiJ0yYR6p+TnA97cU/vYFtrK2GKwC/W0+GGodIjAXkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFghwIkKlCGh6gnfapCsVwMu/1k3ogtYt6hVEkNAGERK8PWcM6U5Fmc4dyb3rZlduuowxyUMS/RY3k8Vkvi53PCAxyP8hih1EGvateGV09BFeT/hYwDSO9sRcwCH+fFyrmwWgqGd5rWDvBisjvxvpoKu+U91zFqR9tyyWSGY9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6HXXnLx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6HXXnLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751621911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aT0JIBDRF1z+DIp6/AYRtK9SgH4kEDMsVKEyC35mUUk=;
	b=c6HXXnLxG/U13Vp/URiQUxtiKFGLaDp0tcopEDFZ7h7CaPIrIJEl5y75/1lY+WRAzGZZW4
	mO55Ek2jt9TBI+wSnNx92cAV8SddUncXkKCNM31VdErF0YD816YjcRjAliLqINkpzE4S+P
	bxTNWfQscQTqeyKlK6QdMRUIwOe+JqU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-k5GMsyagM3GTnJhvj6YDTg-1; Fri, 04 Jul 2025 05:38:30 -0400
X-MC-Unique: k5GMsyagM3GTnJhvj6YDTg-1
X-Mimecast-MFC-AGG-ID: k5GMsyagM3GTnJhvj6YDTg_1751621909
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a58939191eso273115f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621909; x=1752226709;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aT0JIBDRF1z+DIp6/AYRtK9SgH4kEDMsVKEyC35mUUk=;
        b=p6EZ1tqyxq2hEhaXi3hGXMdf4KKn92kBYYuquqa7kwW4yIyx1JoznjhkbSVbfXiRRK
         bvq8FHXNYhMhXbmfp/1mvdyGvfapLKYj8A7YBDQxCl3EZMf8D/rF3fwnC9P/Q5YdsN31
         13Bb/K7+JnAafUsri1b9vZcBry58T4vUcchgAjr2ndN50TNLoRflVprIXHf8O8iSZ0dW
         MOiwwEANYu7kSoxUAyJ8AkdQqAQ7UiA1JBOasyFNWMU5WC3AvDAoLy2ndPCqpjUfey7f
         9BKYcyq3lwQgR/eCbRXT4W4l7CJnQAIRBDRnlq/MD1/OuJk54s7vRcX28mWw0S0mimZ7
         6ZsA==
X-Forwarded-Encrypted: i=1; AJvYcCUONVTidfyOlPNKihyeqp1kxBO13wdwAkJzwVO9bLCgLnXQ+3htFYVbP7efTgkicF8/7fyVhIQV5OdTxmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvd9veLPdMcuRZw71co7zflI9EnPZcdBQoB89sbMA+jj0C5Eax
	iESPNxY+sC4hdQl1GVn9jxUdExvWqzE3tO6tYDUz9TuDEoLFNly1bGmTZEcC6eI2J46SW6jql3C
	4RL2+oAXwSNfLU9LFpHWUFFkw9KCH6ZYHQy3AYKsCGwKO8DsysFT9xTxoylmxJpIf4Q==
X-Gm-Gg: ASbGncswEyVw+k6IWj776bil8HbiB8OT19hypO3DbHqQ4uqvrRhCn9sbAnOUCu9WrTA
	iVfrKzyKETwwmVNwc92PRmmDO3YlLniPSarwoimbQbvByaVYbOrQhRJUjGoRWJ2uFZjR1S4S+fP
	h4Y0QOBKNAMwvhSPNgaJNgGAyqCjo0FRkVnjHnYz8od3S1jd0qmvEiO44tglNBxxjVIjEEvD470
	tEYF4SyLr1olbCaiSJ6aNSRS3xrmzdxgB8KWQprxriYnaxeG3aQStrhbkbtsv1J3tZVmo8Z7vqI
	cKkVNKeyruOCjyn1C2BWGjKIY7xCPeSjnONS8DUxMb7AbX0JtY87K6n6RU9JkAptUZUB96vwNkT
	DK1WZaELvmOnszDaVhIHmp1940sCfMr3kMF1/ScO/8do4Xq8=
X-Received: by 2002:a05:6000:386:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3b4964ebe27mr1480963f8f.53.1751621908714;
        Fri, 04 Jul 2025 02:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/xHVznektoEHHRjwtY79SjVB3LBSeU8aj4YbE0vVKTDL/dwiDgGwtpTR4JuOlAFvL7DI7IQ==
X-Received: by 2002:a05:6000:386:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3b4964ebe27mr1480931f8f.53.1751621908285;
        Fri, 04 Jul 2025 02:38:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c9f9sm2039057f8f.93.2025.07.04.02.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:38:27 -0700 (PDT)
Message-ID: <e5076365-df51-481e-8a63-a9d6b5215afc@redhat.com>
Date: Fri, 4 Jul 2025 11:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.25 05:19, Baolin Wang wrote:
> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> tmpfs can also support large folio allocation (not just PMD-sized large
> folios).
> 
> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> we still establish mappings at the base page granularity, which is unreasonable.
> 
> We can map multiple consecutive pages of a tmpfs folios at once according to
> the size of the large folio. On one hand, this can reduce the overhead of page
> faults; on the other hand, it can leverage hardware architecture optimizations
> to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
> 
> Moreover, tmpfs mount will use the 'huge=' option to control large folio
> allocation explicitly. So it can be understood that the process's RSS statistics
> might increase, and I think this will not cause any obvious effects for users.
> 
> Performance test:
> I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
> sequentially via mmap(). I observed a significant performance improvement:
> 
> Before the patch:
> real	0m0.158s
> user	0m0.008s
> sys	0m0.150s
> 
> After the patch:
> real	0m0.021s
> user	0m0.004s
> sys	0m0.017s
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>   - Drop the unnecessary IS_ALIGNED() check, per David.
>   - Update the commit message, per David.
> ---
>   mm/memory.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b..9944380e947d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>   
>   	/*
>   	 * Using per-page fault to maintain the uffd semantics, and same
> -	 * approach also applies to non-anonymous-shmem faults to avoid
> +	 * approach also applies to non shmem/tmpfs faults to avoid
>   	 * inflating the RSS of the process.
>   	 */
> -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
>   	    unlikely(needs_fallback)) {
>   		nr_pages = 1;
>   	} else if (nr_pages > 1) {

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

