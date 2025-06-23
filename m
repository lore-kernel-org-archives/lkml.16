Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB899246BCF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705866; cv=none; b=MP+UIOF/xNFzgkYyT+2aa1WsVl6EBwzT29+RFZIQrEH2QYxjL2qD++GOokL3n2k5ttqMF0afKdCDkj3rO/My6xS6yuY6VFS53Y/5UaAluAxdin0dgaBdC8N4KKrnSvBNDfJY4o7PAtKQN3nGPLPVWwZ9DxPRe1mIyyF1AbhA2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705866; c=relaxed/simple;
	bh=FnwEMjoH/B5fSHq8g0xbQl+3hwzrIE2FIRhlGQaXCYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WumHdPX11a6zx2DH0cDkWHQH5uOM7nVw8q9ZatWuMJJEpBoKakqJuH9bi2MklAtikhwqOcc6UPPU5IOniawXTT1RlauvWL+lwp7ye4fUQrrzgL+byGMhbwxPT43ZquA13eVnjeznjAPB9O4jCIN0JvZ0MactG/QYLHobOLxIPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bP2UoJnw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bP2UoJnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750705859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EkCPga5/TapIbxLySEkQMLdlOYU3/68AZVl+2XQoNiQ=;
	b=bP2UoJnwHgIRRcZUYPmJzoBywx6Qpm/RIfwzCLA8bIGziqt8JT7VYeLEcgfHU/iz64YKjg
	Lvb35wvT+xCByhgOcGnMhQkmm4uJ4P4zev3MCTeK1ar86G8oqWLHMzg6yjZXzD39lREKj/
	EPyBJeGCEuJmCAV81mG4qNLdks+X/UM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-8TXKaiwTOg6bUc8nSuNSjg-1; Mon, 23 Jun 2025 15:10:58 -0400
X-MC-Unique: 8TXKaiwTOg6bUc8nSuNSjg-1
X-Mimecast-MFC-AGG-ID: 8TXKaiwTOg6bUc8nSuNSjg_1750705857
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2525247f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705857; x=1751310657;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EkCPga5/TapIbxLySEkQMLdlOYU3/68AZVl+2XQoNiQ=;
        b=hBWaxoG2Ezy81cXOrFtON5DwGvF546JtReuxYVUTcvazgw1EBGbk5wFjRIE7jiFV5n
         Hx9C4gibgRuQQH0Q7GqmuDAByVe2sVhs3p0YG8c69rHLZBTateR2lHWWEg0OHCfY6K9i
         J10BNBFCZbc6pUhrzntA+WmzwXWtO05jUDKvPUmZ0aFg2mCYbrTVE4FfUlB/sgKpYvzF
         O67HUzVzvAF45EwzVljgxy0/WVm3Bpa3CSsALPZh+dgY+zzavbr2ogPDBa+oL+7hWFEE
         oUFpU2Sw9uaoR7/v65FFb6g7NcWu2H9ynIVW/hFnsby2D+KudAeH0kFs0YajEHY78MVl
         qoSA==
X-Forwarded-Encrypted: i=1; AJvYcCXYWaKYsZMx/moOmYUeI5DiBlSSXixiWLICKhoCN1sEWBGqmdFFDiOaKNTOaE849E6w4uFGiwWcBj62rII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkctVsZA4iFipAYE/I6A//FJNz5dyc0Uvbx8VXzbX2uVn39LS
	O56QpeTtAbX2CG267EqrlozD2xa1xEQy9MZM/Ij8tyn6iumIQ+wLHnMbuZEUq+xSQDlhqD23waO
	AeSCZGNZmG1tARTZr75P6bNosuf9IyEb3dF/oKDBIWSe0QQD2jMkmXACzkAzakSYcmA==
X-Gm-Gg: ASbGnctI5K9ndQeyClMQf7yEw6UcUvhytuKEp50/O/Mivvv+K7Lp+YYmevDmZSsTDDO
	AZgl1T7E6eAmAeTfqZfb+ZbmiKctw2tpSMyRRreiqTM+Zchh3ngNvoutpzFMI+QXPz41CegrEzA
	1iz5c21o9x0NoYXI9JjA77cjNe4q1q82bWteOblLF5fhV0z0LLpmDGSLMIYxkdxaqLNQfj0H9Ts
	O8ETuOE9kOOhwwk/cXEQ9XRGzFYQz41PFaSaYuBypMM86+fT52tvKvjb6zwZ0VJnLB+h/PjL3hg
	ICqksjqo/38JJF5zVssqtHVctVW6yBxCekTj2zidrKbiDvRlxoCYlRXltOlUKrcAGh7UfcDs09u
	KqdjpWUgh2Og8oWimg8Gjw9aTgZWAEPubHW6rp19W3Z1iRiSwVg==
X-Received: by 2002:a05:6000:400a:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a6d12e826bmr11610828f8f.46.1750705856682;
        Mon, 23 Jun 2025 12:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFPmuk1i7Yng45pkzrJpObYOYnIk4IOsdaeo0NKamf/9tdOuIgBToSFd5SDYluP8KKRNQwHQ==
X-Received: by 2002:a05:6000:400a:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a6d12e826bmr11610815f8f.46.1750705856263;
        Mon, 23 Jun 2025 12:10:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c3f7sm10304885f8f.63.2025.06.23.12.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:10:55 -0700 (PDT)
Message-ID: <9bd91df8-e548-4ecc-bd30-f1ab611ecf4c@redhat.com>
Date: Mon, 23 Jun 2025 21:10:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] mm/debug_vm_pgtable: Use a swp_entry_t input
 value for swap tests
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
 <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250623184321.927418-2-gerald.schaefer@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 20:43, Gerald Schaefer wrote:
> The various __pte/pmd_to_swp_entry and __swp_entry_to_pte/pmd helper
> functions are expected to operate on swapped PTE/PMD entries, not on
> present and mapped entries.
> 
> Reflect this in the swap tests by using a swp_entry_t as input value,
> similar to how it is already done in pte_swap_exclusive_tests().
> Move the swap entry creation to init_args() and store it in args, so
> it can also be used in other functions.
> 
> The pte/pmd_swap_tests() are also changed to compare entries instead of
> pfn values, because pte/pmd_pfn() helpers are not expected to operate on
> swapped entries. E.g. on s390, pmd_pfn() needs different shifts for leaf
> (large) and non-leaf PMDs.
> 
> Also update documentation, to reflect that the helpers operate on
> swapped and not mapped entries, and use correct names, i.e.
> __swp_to_pte/pmd_entry -> __swp_entry_to_pte/pmd.
> 
> For consistency, also change pte/pmd_swap_soft_dirty_tests() to use
> args->swp_entry instead of a present and mapped PTE/PMD.
> 
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>   Documentation/mm/arch_pgtable_helpers.rst |  8 ++--
>   mm/debug_vm_pgtable.c                     | 55 ++++++++++++++---------
>   2 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/mm/arch_pgtable_helpers.rst b/Documentation/mm/arch_pgtable_helpers.rst
> index af245161d8e7..e2ac76202a85 100644
> --- a/Documentation/mm/arch_pgtable_helpers.rst
> +++ b/Documentation/mm/arch_pgtable_helpers.rst
> @@ -242,13 +242,13 @@ SWAP Page Table Helpers
>   ========================
>   
>   +---------------------------+--------------------------------------------------+
> -| __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE |
> +| __pte_to_swp_entry        | Creates a swap entry (arch) from a swapped PTE   |

Maybe something like:

"from a swap (!none && !present) PTE"

or short

"swap PTE".

"swapped" might be misleading.

Same for the other cases below.

>   +---------------------------+--------------------------------------------------+
> -| __swp_to_pte_entry        | Creates a mapped PTE from a swapped entry (arch) |
> +| __swp_entry_to_pte        | Creates a swapped PTE from a swap entry (arch)   |
>   +---------------------------+--------------------------------------------------+
> -| __pmd_to_swp_entry        | Creates a swapped entry (arch) from a mapped PMD |
> +| __pmd_to_swp_entry        | Creates a swap entry (arch) from a swapped PMD   |
>   +---------------------------+--------------------------------------------------+
> -| __swp_to_pmd_entry        | Creates a mapped PMD from a swapped entry (arch) |
> +| __swp_entry_to_pmd        | Creates a swapped PMD from a swap entry (arch)   |
>   +---------------------------+--------------------------------------------------+
>   | is_migration_entry        | Tests a migration (read or write) swapped entry  |
>   +-------------------------------+----------------------------------------------+
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 7731b238b534..3b0f83ed6c2e 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -73,6 +73,8 @@ struct pgtable_debug_args {
>   	unsigned long		fixed_pud_pfn;
>   	unsigned long		fixed_pmd_pfn;
>   	unsigned long		fixed_pte_pfn;
> +
> +	swp_entry_t		swp_entry;
>   };
>   

Nothing else jumped at me, so LGTM.

-- 
Cheers,

David / dhildenb

