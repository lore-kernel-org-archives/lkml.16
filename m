Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF2210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688174; cv=none; b=imV0R05oS9R/O+z85OP97uIGZjf9I/dUFw+b0uZa17XGIToTjVem846ccaqc7JtnXudO+TPl0eQhEzrKPztMvQop3NVXbY3b63IZDU3y7hm10P8lH5M6OCIPcGYxehAugKENhsWaIvs6dKs5pv1bdqsAY6hXoCN9aDC0YclRQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688174; c=relaxed/simple;
	bh=vdd7yTGrSGgJQnwiFH3GX/Ya2oRFXhaHCoT0+pHHmFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaIIhvDLmeN94o+7uQrtN2RD7IxzNpjilg9K6RdPWcKbNIBoNWjvjjFD5mhMppxHQ2c7raBc1wsWWKHxImJfkQzKv4fG3IFWL0miQvcHdFkL7zXz7wEJvvw04aDq3ERSMv1z6d10CAGJEl54nQjUMi7Z+vjHe3p9YqDxzyGXr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ecXOxRMc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ecXOxRMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lRqdczoDWYZxO2i1hbydlrSlY7SaWvbdg5pK6g1JwTU=;
	b=ecXOxRMccT5ETOVjj9oXzn4umG1S7AnmXqrzlOY7QCcyvFf2lsgcsp+I5FAzp1GieqE/Ey
	+LG4ljPTK40DfKXziSlMpBhNvrypvgYTGZ1PwfMe8H/Xb5z9DzPVcknKllaCITpOUoeyeI
	JDvIPOtDW0nXl+rnCkNzGn5Ht+qko18=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-ROn1P_OONAmy2GrRL8LuBQ-1; Thu, 03 Apr 2025 09:49:30 -0400
X-MC-Unique: ROn1P_OONAmy2GrRL8LuBQ-1
X-Mimecast-MFC-AGG-ID: ROn1P_OONAmy2GrRL8LuBQ_1743688170
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso577401f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688169; x=1744292969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lRqdczoDWYZxO2i1hbydlrSlY7SaWvbdg5pK6g1JwTU=;
        b=P5mRO4gDWOPG7gKkgggta+E4eW+xxyf/F2vPAMM/t0SauC2qG2StQ+F+bFWco/cFH2
         F8A7OsA+P8EZ5HypPVwczLTt1mCeAHsET7jN011xK7g5necl6mKf4+vl3LtDqb7oPFwY
         Ut44OVLd8ySNXxZ1QBz1QWXQEKTpWCuN8kJDuw/WatOWjPJOHmraUJ65bRvjNPOIWuWa
         PEr+Hvfh1hrrWb6FRpdUJTt+JNZamViNfQYTKhSIZapIB9MMfzBB78S201Y6Y0ECjatL
         VX07Bche4YDYh+q5QefdTaFBmiHiI2+FBEfFN4f6lVEsKEnSKsJDOPySY63s/WwSUHDp
         j8UA==
X-Gm-Message-State: AOJu0Yze610m4N5j7KfL4Spm35uEFpTh2YDRKMRjDIKFN04RSnZyAk48
	PXLry6Ch81pZ38KvQ/M0lQyRogeoeLSMXunnAN8fu9SHFP0vwGkqzxTVWzyA8lYVhf4ZlWW6hA8
	bSsFfwHIhsi+fqkFguTzWRZOd/ef5JJZQ2uz4oUA+bdXRkCWjaAarkIUeTkE3aQ==
X-Gm-Gg: ASbGnctiS4qsjprraTwP8Ah87AlxY5p/XlAGMsvSGYxUIZaVo5BH9jHJZ9RYfpbMTkY
	m2T7Z4077pBeKjXOAApcRD+iuHH3qlC7iMFkfaeX7m3wJD1ON1dOn6G1So4IgsSVwse6TfZB3vN
	kCIpMB7vildCsOIMg9rJho9Whitv3rVI6licSZqg3qnhcSTWrCrGN+WDVbNWOaLYx2TSmaAG6B7
	TDHCBXkfMn8G469YGF2pYlqVAEEmMIyD1kxc6o8jvSexbVThrwz5Xm1TJTC7Z6+T+iN4GgfMrUf
	pB3olkQKU6AznswHH2yG82xrOVQSYPnYTURC7+8e3wHwrMFlK6C3sFofXMiVSp3mGXG6F4H5rJm
	KMUbSLNGjXUMe3SfjnF1Yfe4gwEE1Bc9sulGpRNbbXxQ=
X-Received: by 2002:a05:6000:2706:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39c1257d4fbmr12332864f8f.57.1743688169531;
        Thu, 03 Apr 2025 06:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF66xkcnMOU7ICCE3/YZPhs4roIfRz8ewz31zY+zYWAj+2qBSMMxsghtZB6Kj+6Q11d5seXPw==
X-Received: by 2002:a05:6000:2706:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39c1257d4fbmr12332842f8f.57.1743688169131;
        Thu, 03 Apr 2025 06:49:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4? (p200300cbc70a7b0054a7eb9663bcccf4.dip0.t-ipconnect.de. [2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6778sm1803857f8f.46.2025.04.03.06.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:49:28 -0700 (PDT)
Message-ID: <77b19486-28ca-47e1-b506-6de604f6ec0a@redhat.com>
Date: Thu, 3 Apr 2025 15:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update THP admin guide about non-tmpfs filesystem
 support
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 da.gomez@kernel.org, mcgrof@kernel.org, gost.dev@samsung.com,
 linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
References: <20250403103805.173761-1-kernel@pankajraghav.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250403103805.173761-1-kernel@pankajraghav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.04.25 12:38, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> THP support for non-tmpfs filesystem has been around for some time now.
> Update the admin guide to reflect it.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>   Documentation/admin-guide/mm/transhuge.rst | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index dff8d5985f0f..01b7ce90d693 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
>   that supports the automatic promotion and demotion of page sizes and
>   without the shortcomings of hugetlbfs.
>   
> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> -But in the future it can expand to other filesystems.
> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> +filesystems that support large folios.
>   
>   .. note::
>      in the examples below we presume that the basic page size is 4K and
> @@ -463,6 +463,10 @@ fields for each mapping. (Note that AnonHugePages only applies to traditional
>   PMD-sized THP for historical reasons and should have been called
>   AnonHugePmdMapped).
>   
> +The number of PMD-sized transparent huge pages currently used by
> +filesystem data (page cache) is available by reading the FileHugePages field
> +in ``/proc/meminfo``.
> +

These changed look good. Do we also want to talk about FilePmdMapped? 
(PMD-sized THPs in the page cache that are mapped in to user space using 
a PMD ?)

Do we have to distinguish it from below? (shmem also uses the page cache)

>   The number of file transparent huge pages mapped to userspace is available
>   by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
>   To identify what applications are mapping file transparent huge pages, it

Previously here, but: this reads rather odd. "file transparent huge 
pages". "PMD-sized THPs specific to shmem are tracked separately ..." ?

-- 
Cheers,

David / dhildenb

