Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953328D831
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530176; cv=none; b=ZHxtnsE38e0qSEO/NFlxrV3nrz1MM8PFbNhQNqkQ9hECXzupzsRWQ7hGjRJdgNXdptmK7iOFwmfr190yN7GWm+tDOpJ6b1iEgd9tFB9fSmgyZPir1DgmBb9YmMpX3thtxr/QUKG6WlOeosg+BzOFO+CyZ5XVYExHP2kq5SO8cXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530176; c=relaxed/simple;
	bh=RCYlecWO1Vf4XjdIKwK234q4vUZra4l0ubOBY9Y6j9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnq/bnGb3iPcD9KnEOh7hxBAMm/lRnf5OFuQ1ER2nIBSSmsg3BeSQTfJg8DKudtGE69AEBv/azi4BARW5f7y/d2Iw8/+zd0AQdDEy9/koYl6wbCMxRmeBsU5A5Nhn6ZzIl/jWTCF0/yx17Rq++jBcBzbzaJQS+ZYJCYC5e/pHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POF986Jy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POF986Jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751530172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=91r/3x9tt3fIksMySN5s2d1GxAj3Ro+TfXuUIdNabks=;
	b=POF986Jy3liUOfX0SZU0OFF+eHsgW8oV8HYULpmG7UFFOd6a+P66zw1kpyW6ZvTUPKl6L+
	oYhBt953efDsrAgLy2N9gOeLBkDZHJCf2ECsfEPaoO0A2fKDTnmTo1DD9JTUilZLQfcGCD
	CmU5KxRw4EIK9Qa5vW+6p7kEgzuPfXI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-IPXr0vTsOiGZgejaDjwKnA-1; Thu, 03 Jul 2025 04:09:30 -0400
X-MC-Unique: IPXr0vTsOiGZgejaDjwKnA-1
X-Mimecast-MFC-AGG-ID: IPXr0vTsOiGZgejaDjwKnA_1751530170
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-60995aa5417so4503345a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530170; x=1752134970;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91r/3x9tt3fIksMySN5s2d1GxAj3Ro+TfXuUIdNabks=;
        b=vl5OTX/i3eo+NYRC4w0kH8BQU7GkLdi6nSOzccKIfHS7N5u4t0AjW/2T0m+1KKyuPc
         OWjmMFOFngPR8xTGC+GySMgvTcueXMmc1+aFN0c8oj4P1OEzSWP3Nrs3gsIpXLPC4PNf
         ixdpsMoMPqy44iUruviDLinvfTHfizwCoOGIAUL58GIYCsRlctbC36xLP0318JVm2vyr
         BIPPxc0zO6Q1/w26xt1nM2yXjEjx9Mo2YvNSHPwTKXxGysdO6SK2z2BZkzoR7qgHF7rm
         unchkzuW/yGbxMDRG0JraJ2921aNDHuzb7cbW94YqJVY7EHYQhXkBAdvySViwHNBcbx+
         Ia9A==
X-Forwarded-Encrypted: i=1; AJvYcCXUdhEtDR61V7vG6dE3newrC7Go3cabn7IcvNM/7YxAKl12P8JI83Hjqh9inBFB8PzrR3JnRUrZzHoLNGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/K7M+0nbw9zdt9N3pQ1ixhcoTA86OZyQbII3zdQsGigL+oTxr
	rkZfIWippBVKaEEJnuChCSHucdXUyi59V5/agrYRo0YVs0LRMshmXgMuwEp84L7L6OEl8AXAWTX
	Z0hkD+Oerq4pdAnjIZzs4oVJVIrIOQHUk1WltywVvUnWFJ5QtZLc/6hpgPFLwRiU4Pg==
X-Gm-Gg: ASbGncuRHu4/UFD4U2aXa0FhlDIexX05WwzwfsLdNFaOrh/PaZciUNWCRy/yeaqtTOr
	2uODquS4aO26V+Biop79N8FLNeQcLql9EUpyNvYgdwek0KqCouecEAxHs24x7dPBmT8nVOXZ0XL
	DzOviHZugsQGCFFPzo4KxGqXBXtlda4vqsGnPoOqUtQPoEpOFFMpSkvMqS6EZLu5OYdQ5E0/R1h
	ooZaJvZNk2XQUA7jM1Qpx/D6WmJNZS7C+HKKBwv1Xt3TAO+xYdjFwG5kYEL0lBuK01Rn0xwgBZ6
	lqRCZEYiGZyNa6vUSqOBBAv9VeL7rudly0DIZibT0JbC
X-Received: by 2002:a05:6402:1a25:b0:608:48b0:5e88 with SMTP id 4fb4d7f45d1cf-60e52d02007mr4790217a12.18.1751530169750;
        Thu, 03 Jul 2025 01:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwwYrLBL75YQSmLSsn0OSP4btMvQIbfUM85Dyw9bsSeQ5BSmfaGhxRqB2nk6enLrnJmT4ssA==
X-Received: by 2002:a05:6402:1a25:b0:608:48b0:5e88 with SMTP id 4fb4d7f45d1cf-60e52d02007mr4790150a12.18.1751530168562;
        Thu, 03 Jul 2025 01:09:28 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319b155sm10343126a12.52.2025.07.03.01.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:09:28 -0700 (PDT)
Message-ID: <7efcc980-1be3-4f25-a216-33e1d6a23ef3@redhat.com>
Date: Thu, 3 Jul 2025 10:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] selftests/mm: Add support to test 4PB VA on PPC64
To: Aboorva Devarajan <aboorvad@linux.ibm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, shuah@kernel.org,
 pfalcato@suse.de, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, donettom@linux.ibm.com, ritesh.list@gmail.com
References: <20250703060656.54345-1-aboorvad@linux.ibm.com>
 <20250703060656.54345-3-aboorvad@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250703060656.54345-3-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 08:06, Aboorva Devarajan wrote:
> From: Donet Tom <donettom@linux.ibm.com>
> 
> PowerPC64 supports a 4PB virtual address space, but this test was
> previously limited to 512TB. This patch extends the coverage up to
> the full 4PB VA range on PowerPC64.
> 
> Memory from 0 to 128TB is allocated without an address hint, while
> allocations from 128TB to 4PB use a hint address.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

Comment applies to all patches in this series:

See Documentation/process/submitting-patches.rst, in particular "Example 
of a patch submitted by a Co-developed-by: author::"

If you are a co-developer of any of these patches (and not simply resend 
them without touching them), you should have a

Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

above your Signed-off-by


> ---
>   tools/testing/selftests/mm/virtual_address_range.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/virtual_address_range.c b/tools/testing/selftests/mm/virtual_address_range.c
> index e24c36a39f22..619acf0b9239 100644
> --- a/tools/testing/selftests/mm/virtual_address_range.c
> +++ b/tools/testing/selftests/mm/virtual_address_range.c
> @@ -50,6 +50,7 @@
>   #define NR_CHUNKS_256TB   (NR_CHUNKS_128TB * 2UL)
>   #define NR_CHUNKS_384TB   (NR_CHUNKS_128TB * 3UL)
>   #define NR_CHUNKS_3840TB  (NR_CHUNKS_128TB * 30UL)
> +#define NR_CHUNKS_3968TB  (NR_CHUNKS_128TB * 31UL)
>   
>   #define ADDR_MARK_128TB  (1UL << 47) /* First address beyond 128TB */
>   #define ADDR_MARK_256TB  (1UL << 48) /* First address beyond 256TB */
> @@ -59,6 +60,11 @@
>   #define HIGH_ADDR_SHIFT 49
>   #define NR_CHUNKS_LOW   NR_CHUNKS_256TB
>   #define NR_CHUNKS_HIGH  NR_CHUNKS_3840TB
> +#elif defined(__PPC64__)
> +#define HIGH_ADDR_MARK  ADDR_MARK_128TB
> +#define HIGH_ADDR_SHIFT 48
> +#define NR_CHUNKS_LOW   NR_CHUNKS_128TB
> +#define NR_CHUNKS_HIGH  NR_CHUNKS_3968TB
>   #else
>   #define HIGH_ADDR_MARK  ADDR_MARK_128TB
>   #define HIGH_ADDR_SHIFT 48


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

