Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA74238C19
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687156; cv=none; b=MCEq9pvMGlCHSKecJYFYeALFUIgHqva/1YfvBfG8mMlr8/W+1x6fFNyuDX5Bpk8aHn6AaVC4jyYton8coMAY3MU3V+S8wrYQGWMk+wrFoumuQH8lcqnZJ9c7LEdg9lD3LAQ6vduH2ENB6GVCBoTtMJhMm2wzXxb0xD+STrxiIzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687156; c=relaxed/simple;
	bh=DyBYTdULWpfT7foG38GbYCMdr0fx8Ho89YJWLtd0Pbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANhkdAEKd5WpPEjB2+M/+S7xTvGkZsav1lXQwTp1K7r9EEPzMlyC+XMjyR3UBCJR9cBEAb7gnfjcCjGH5tM6bw/rcre/TLDrdEg0a62ssoi+Qaqe6UfLPzIXJAY6IIaJstTIeoa8c9dGvd0LKHQ4Er8fXVDPG9RBjSCcf93nL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ts3jAoBP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ts3jAoBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750687153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n3nJlXp8XSkNC3SS0KFZqg2Qyox2BaZsvzTlwXDSVTE=;
	b=Ts3jAoBPzsRYqQSF1JTyWcpHDXYi3nu+GKCbm3iY58SktVmwWqLyxyVh7Kb55GeAqLsDXw
	YFYhRqzFPVja/whBB60Ys/4tBGfj3/bAZaoUja4eWn8i1UA/2KeYjKMsS1iq1P1m+eCw5g
	xmPETmWk/idTUJOu5f3JbUt5cIoVm9Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-7WzLK6xwNjKu12BSxAxiAg-1; Mon, 23 Jun 2025 09:59:11 -0400
X-MC-Unique: 7WzLK6xwNjKu12BSxAxiAg-1
X-Mimecast-MFC-AGG-ID: 7WzLK6xwNjKu12BSxAxiAg_1750687150
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so20198865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687150; x=1751291950;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3nJlXp8XSkNC3SS0KFZqg2Qyox2BaZsvzTlwXDSVTE=;
        b=HQl9zB5IMK3dn6m2vv1WZlLOdOiUozNxwnE8sTwf7DSnfR181FjeOUP79l8IYvX758
         05zCfewAa2eSvxBl7QVjy/OjRFVtvD1yQqwWZo15gsG6hdSxiZtpE774wD/oWAu/fI8M
         HuBUJwsb/UwGSKMx6TXjOjm4M+vBS33Xkldudk2fb3Y3WsNrPQyYeTAZ//Vrij0v3r4/
         fQaW+DTjXGuqiBs/M3N/k5T/nLgQ6aC2ypEZBBslA8YCfYmJ53j94erWHu5d1f1D7Rut
         /gcHekTfUVhDXrLhMix0LCmWlm+pGkrHq7X11GcNGHHc6n2Q5pQL3l3FG1L0vuJdbaZL
         OwCA==
X-Forwarded-Encrypted: i=1; AJvYcCVwU18/lquyt86xkWDR4UVgwHn6QPDGFbwwXn10EX4dQySx9N/ZREAV+iqwG1mse0sWLKV7/LgGR8sdh8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIh49NgtoSMC7enpXxt5cBaVw75PHtzAldduzWQiDUXug4+G2B
	PHFcQ9uniBM2XpgmWDUmJVsKcJuoDHpCZeqOCHl7LMT0+sKyjIUjkfZDkoVPQI1PLwY5ZuiroXG
	We8asjuIfIRakKUWUAVYWKlMoDLkDeLdbEQKDwUVjHF/nZBDrd2pwkIkFzhAD2z765w==
X-Gm-Gg: ASbGncujaBJVRy2J5hGzjcLTi7/8WbPCC0Ari7qGco/GJaD3F9genCnNERp/QGXidJj
	LBrIJzHpQOKqQKGfMOqQs0oJUujb+72a5+bcXzLReKyFAcEO3hm3YJd9xfTOHYNUP6YbuVDI2x+
	V3EdRDN6+qQ2ntapWSZycXSkyEoH6WXAaA4f9FP90jeV6vNFCsQ3WtoMv0tUTNhcKwJ9N9k19j2
	XNRjK+6YqZXI1jNUJ5Zu+HkkxN5mkAGI6hjxCqztINkW/OhHYCY8xG/1nlfFov5GBirGpMk+omG
	nFBFtjqi/+G+cMEica7a1hB644mku4mv7Yi090ylKsz5u8SgWtA0ipo0T/zJX5LOD5JoMJIxy9u
	iYnAgUKegHx3SvAMtxFt+87jCgqBMMMZgpxFk/MMoPigaTRwYlw==
X-Received: by 2002:a05:600c:6995:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-453658ba6c1mr110051805e9.16.1750687150176;
        Mon, 23 Jun 2025 06:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYwmqyk9qjcCNvAflyHGJJPTRvV5EQfE+1i4LP9db+bH5Vu5FrYtS0KvehWaKGoSfq9bNwQQ==
X-Received: by 2002:a05:600c:6995:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-453658ba6c1mr110051625e9.16.1750687149723;
        Mon, 23 Jun 2025 06:59:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm144353265e9.6.2025.06.23.06.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:59:08 -0700 (PDT)
Message-ID: <924f82b1-0eb7-47e0-b7d4-5dd314df18a0@redhat.com>
Date: Mon, 23 Jun 2025 15:59:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <52bc87c7dbd362d4d2b7780e66c1536fe99454a0.1750666536.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <52bc87c7dbd362d4d2b7780e66c1536fe99454a0.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.06.25 10:28, Baolin Wang wrote:
> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. And the MADV_COLLAPSE is an
> example of such a case.
> 
> The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
> means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
> will still attempt to collapse into a shmem THP. This violates the rule we have
> agreed upon: never means never.
> 
> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> 
> To fix the MADV_COLLAPSE issue for shmem, then the current strategy should be:
> 
> For shmem, if none of always, madvise, within_size, and inherit have enabled
> PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.

I assume we could rephrase that to "For shmem, if "shmem_enabled" is set 
to either "none" or "deny", then MADV_COLLAPSE will be prohibited from 
collapsing."

Or am I missing a case?

[...]

> @@ -672,7 +672,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
>   
>   		fallthrough;
>   	case SHMEM_HUGE_ADVISE:
> -		if (vm_flags & VM_HUGEPAGE)
> +		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>   			return maybe_pmd_order;
>   		fallthrough;
>   	default:
> @@ -1806,7 +1806,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	/* Allow mTHP that will be fully within i_size. */
>   	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>   
> -	if (vm_flags & VM_HUGEPAGE)
> +	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
>   		mask |= READ_ONCE(huge_shmem_orders_madvise);
>   
>   	if (global_orders > 0)
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 85bfff53dba6..9517ed99c382 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -502,7 +502,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>   	printf("%s...", msg);
>   
>   	settings.thp_enabled = THP_ALWAYS;
> -	settings.shmem_enabled = SHMEM_NEVER;
> +	settings.shmem_enabled = SHMEM_ALWAYS;
>   	thp_push_settings(&settings);

Same question as for the other case.

-- 
Cheers,

David / dhildenb

