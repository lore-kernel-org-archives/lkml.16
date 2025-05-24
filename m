Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73D433A5
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123256; cv=none; b=VtfCVOfRNi1N02IpZ9c1b7U0zQ65WWBSX/XE+tc8DyBDMdUec54eFFcNBfCAW91Egiv1vxgYEvT39YjpwQTQJE/FUnTYG2OeJGEYhqQP5W7fB8IDZwoO2XdpZgqigs3SbW4wpsefNGQKwAgVFpoe2oEXKCK2/mGJKBdqX25Y9RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123256; c=relaxed/simple;
	bh=8JUspvMZcXlNckWH0YhsZVwb/dVg9glawrO65AdMX+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTOzasq4Ple3NdhovTYB6CzOeqq0OF+qwXyzelaJjYuItBqB7jl29r0pkOKoaxwcF6BKePWH1UFRMQIAd/kLd7LMV0OSAIJ23t5UZsi0IIeiXpc39xYqbwJ85c7nrIv+OBhfhBMoEW+NGWdTC0erjL69Bw+KLgGHaQMfS/aYsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkInsuGF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkInsuGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748123253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dM59MTVE6zWH5ynZWQtAqKs0tQQzzUFXrHhL1ezegZQ=;
	b=AkInsuGFh6jLo0rctBCwE6tRBzzuaC6jeyWT1ig3/GOZv0ZgrMw3/H6kLywhW0jMdtgnO5
	oHkheJ0CAr4qor7fq2CEH9wRgfVuHHKBXGxCFB53xpAli5IQikLOz1gJoR2fSD+MYwJMa3
	0Od9w6tBpySHoAfR+mfnE+4yW4VpbNg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-MCUrAkiFNYe8VKto8OV-Cg-1; Sat, 24 May 2025 17:47:31 -0400
X-MC-Unique: MCUrAkiFNYe8VKto8OV-Cg-1
X-Mimecast-MFC-AGG-ID: MCUrAkiFNYe8VKto8OV-Cg_1748123251
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso6927335e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 14:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748123251; x=1748728051;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dM59MTVE6zWH5ynZWQtAqKs0tQQzzUFXrHhL1ezegZQ=;
        b=P2p1f657gn1xW6q9e20qHI+EcMhndhpA1U3kNOH7kS7wdGJvnseohDl+8d4WDQ7Pe7
         +gqONVR1SJrGRPsxlpJ6IaONRe2hXwKIk1h4Tqw1JbRbW70m8v9aN5F/ui51odugZrao
         4gTJ3MG0AXAKQd/ASHNVoTksds674ptx+jKxgzwCIky3mRRrtYto5+Umhj0goG78upzz
         XY9WZG8JNqSUkyLWWxeZtE86xu8J+Afd0FxNCYOr0YFenTOxvBvQktmTcL7O6vsMogPF
         f5dLsES0qgw2W5kdnIXwRiGNyCNhh9FA5IsHUbrHi+BvxBgGqdgnRxylzEIKRCpFJF36
         lGsA==
X-Forwarded-Encrypted: i=1; AJvYcCVU2ZIBYISMr416ojdeZqVmN2ku3fuiDnCZ3sRW05zdVdTD9IWmTPQrHKLpPRLqmbNAwFp7wmiskEFln4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBwV5yc4/3LE5gS698zeR3mN5lIXrE5krp41Y+U9kVeYJC5ms
	SIWR2h2XqlfsXIbgqtXKy96doFofGMUU8KdT6sEgUX4DVyKNShx2rfM5p/nnbbtrN2gJP8VyjOW
	zyUX4yrQ1lswfjPxvbbIkp708ArAGwxZlsgU+B1GzcHaJgnVBKKkAzAayqatllNj80w==
X-Gm-Gg: ASbGncs4MxDOQCGcnwIHo+TzPpC8mUwfLcJQB5r18N+rdKpvkndgFj++AYlj/we9kx+
	iK/lle1uUNtLit237tOAF8qSMFXxpEzCWmyK4yeRj6/9vOOKXDJRqtPLqq1lTnziKhrA9FKlqro
	58619Ir6wFCRapf9pmP2YvPYT6k7KYPGYJPakSIb0E/zYAan6/woHaXmPwqHMmT6AKNIrQGCqqV
	LSdl6s0+hIiXOt+6cFTB+0XkWRcbQR3Yqlr/XAXsNOh5/TrQOTN917ZJMRLYDu6CmiFi3DU3vmX
	HzK9U8aLAJ8tM2JYRmctpeaoqqnO19PTA+tbsJpYCJyCDjDCpxBTukBhQsimAPbz8RnNIAmCvEM
	kgPKznrJykYrbhAKSPpE9Cmzw3jA9RMS1K/R2b+A=
X-Received: by 2002:a05:600c:4e0c:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-44c917f3ea8mr40407765e9.2.1748123250726;
        Sat, 24 May 2025 14:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhz3ABReRg1KZhbwumFG4ihzFiAYNx8s5STm/vsx0UnxfxLXgm24q3SvEs+CVpeu6UeIy5kw==
X-Received: by 2002:a05:600c:4e0c:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-44c917f3ea8mr40407655e9.2.1748123250374;
        Sat, 24 May 2025 14:47:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:b600:7d6d:5e38:70ec:12c6? (p200300d82f38b6007d6d5e3870ec12c6.dip0.t-ipconnect.de. [2003:d8:2f38:b600:7d6d:5e38:70ec:12c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4aa2sm193477975e9.21.2025.05.24.14.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 14:47:29 -0700 (PDT)
Message-ID: <d1e9bfec-fdd1-4512-a115-6109d99cbb8a@redhat.com>
Date: Sat, 24 May 2025 23:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] mm/khugepaged: clean up refcount check using
 folio_expected_ref_count()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, fengwei.yin@intel.com,
 bharata@amd.com
References: <20250523091432.17588-1-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250523091432.17588-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.25 11:14, Shivank Garg wrote:
> Use folio_expected_ref_count() instead of open-coded logic in
> is_refcount_suitable(). This avoids code duplication and improves
> clarity.
> 
> Drop is_refcount_suitable() as it is no longer needed.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Likely we should revert the patches, so we can have the fix in first.

So in this patch here, we would only convert the remaining 2 instances.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

