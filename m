Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265B2D63F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631993; cv=none; b=hMiuPmiFQWPNEAB2WCpzqZrKf/bNuzQiZ2GspEOlyy2irDU2V9XxgFea+pzQHYmVdxcqDrdMQSgrH+tOo161o4WXJZYr4T6e8AUzZ5xYGT9M/UftFgsDYoSRrmoLZv2HqnsqllH6WjqhmyGrZX2zsdskhNGX7LMzEze5bH0/ghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631993; c=relaxed/simple;
	bh=s20jUvcI8VlE2/zdajtOD4ilO9mGnWU+hSAsR0lxeGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUozmBrYTEdp5vl0BYyQQvocmUUjNbDH1VTcyyCY+uCksvEAaVf9q1q1+F0yaG5PbhYGpsSL5NLcFfof3YohFDTUYdAzVlIzAJmetssOjBzSPGD/sZcBb0a34YeCqzcQOAND7WAjlry9NTMErVC/vnpKxHcBqRDAPjFTlJD7aKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHjLXxAJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHjLXxAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751631990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LwrtP2ohqgww8L0pkCnMNZNw56s3R4h9U7S/03uZr+U=;
	b=OHjLXxAJUimfEaQOC8HQj8O5J8uv5kJBzu52HOwGjQz0GVfE8qWNCD+D59qaLXEDGsOQ3R
	L/jGtwP2qi4hOz59GgR3iYzO3zPkKXM7lEaRAR5c589qQjx+/u3ifJda45DcFzMKbXkfBa
	hjXm3VOWA0vzKy+Qn2R8RF15w6RM4qA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-tB9sv4N3NCyIMSQqHBO0-w-1; Fri, 04 Jul 2025 08:26:27 -0400
X-MC-Unique: tB9sv4N3NCyIMSQqHBO0-w-1
X-Mimecast-MFC-AGG-ID: tB9sv4N3NCyIMSQqHBO0-w_1751631986
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so453687f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631986; x=1752236786;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LwrtP2ohqgww8L0pkCnMNZNw56s3R4h9U7S/03uZr+U=;
        b=IJVinjzdk3QrkWYfob2KWznQdv9u/GIzwgiStIFYPKxKFYjbJnOQr6I1W/uHmvzj2u
         y/hDTVMxPN4+trFSC5VUtHADGV9ZAI9Y/5gqFCs8xHqvSFY/c4sAi6TOSbz0mjzTnJf6
         tfIkvXGXdnCNhBIcoEq5vOVSlWER0fB//FC/gSq3fScA0FaNs4Pilu80sg/n16QPm87K
         RNSJV4EGg0EHvbkgdN0qFYiWxP0yxwu8K5SHxgd8hrf3WEmsgvQDTmYX4QJQ/X+Ws2zS
         TrZ1YvwCig7u3M47Fqlkm/f2RvZvLB05NztWo1wHQR0u14Xyt78PAVMU8wD/jxgf46EC
         uNQw==
X-Forwarded-Encrypted: i=1; AJvYcCXIS/R28MO4i0CjziWIwklCJH3wtwhsA9hjELKGkeTRvLHDqcjX/18HsGsHIwEwSsE1MH7IFeBDUWq3TrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXyqpNX69ila4p//Lb1JVfHS37/5008Zj5aAHi8uUr2bCjb4r
	ScDSE7c/AgDJZMfayatviKawjOGV2wm3G9MifQzjJ1KyHIysrTseGz0tmaD6OJR2hxtINaueyF6
	XcBlAodOcb1cnTUWHFmxzXZHokYCfaYG0tK/+BVzVc1xEZGv3NP8K6kawrlbtJC8cmg==
X-Gm-Gg: ASbGncv7LFmqJFngVx5W71b5cAEvHxlYGqtDyBaCIoC6hVvhOpuPOinEXof/iqweE6k
	P/WFTT3e4FI+zJtyb4G8419GK9mIxNSiCbir6an6vJ3HoCkbmTS4nyLmvVvEP+G+PU4HQcyB5Qw
	oduiwDCgfci68uXitx4NDuhdCMscEzljJqjwMwh0XXHRF3B6q4pUacW8ulgbR5sqTs3U+MW5Ijr
	Ew/zfjl4uVLTsJhCzu5+lfGL3ILOJBQ2t2DwD0CL9zkZWjudan+oSJyeDHq+vF92r9fGCoD4OzT
	nUkGZ9r+H1usKng6tsBNCTJMMOrsDpw9gxU2f2GIGuMYDrlUcFtbn9nMEceYA6ZJtr/jJ42odgH
	bkwCMWxauXOo6Aw9uAEiR8eHuRyEuG4ApX6C3TWc1ZsGKk+U=
X-Received: by 2002:a05:6000:2210:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3b4964f7100mr1994279f8f.41.1751631985607;
        Fri, 04 Jul 2025 05:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGif9mwF2i7UqA82Ew77czIh0FcIerZ/4mVS/jiEFbY6IbIQ2Gu3YRNQOoDcjdhckmR2R0taQ==
X-Received: by 2002:a05:6000:2210:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3b4964f7100mr1994253f8f.41.1751631985050;
        Fri, 04 Jul 2025 05:26:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97732sm2419638f8f.59.2025.07.04.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:26:24 -0700 (PDT)
Message-ID: <2e7855c7-0531-4e9c-a6ac-c413550e78af@redhat.com>
Date: Fri, 4 Jul 2025 14:26:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: pagemap_scan ioctl: add PFN ZERO test
 cases
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702142052.45116-1-usama.anjum@collabora.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250702142052.45116-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 16:20, Muhammad Usama Anjum wrote:
> Add test cases to test the correctness of PFN ZERO flag of pagemap_scan
> ioctl. Test with normal pages backed memory and huge pages backed
> memory.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> The bug has been fixed [1].
> 
> [1] https://lore.kernel.org/all/20250617143532.2375383-1-david@redhat.com
> Changes since v1:
> - Skip if madvise() fails
> - Skip test if use_zero_page isn't set to 1
> - Keep on using memalign()+free() to allocate huge pages
> ---
>   tools/testing/selftests/mm/pagemap_ioctl.c | 86 +++++++++++++++++++++-
>   1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index 57b4bba2b45f3..976ab357f4651 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1,4 +1,5 @@
>   // SPDX-License-Identifier: GPL-2.0
> +
>   #define _GNU_SOURCE
>   #include <stdio.h>
>   #include <fcntl.h>
> @@ -1480,6 +1481,86 @@ static void transact_test(int page_size)
>   			      extra_thread_faults);
>   }
>   
> +bool is_use_zero_page_set(void)
> +{
> +	ssize_t bytes_read;
> +	char buffer[2];
> +	int fd;
> +
> +	fd = open("/sys/kernel/mm/transparent_hugepage/use_zero_page", O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> +	if (bytes_read <= 0) {
> +		close(fd);
> +		return 0;
> +	}
> +
> +	close(fd);
> +	if (atoi(buffer) != 1)
> +		return 0;
> +
> +	return 1;
> +}

You should probably factor out detect_huge_zeropage() from cow.c into 
vm_utils.c, and let it return the result.

> +
> +void zeropfn_tests(void)
> +{
> +	unsigned long long mem_size;
> +	struct page_region vec;
> +	int i, ret;
> +	char *mem;
> +
> +	/* Test with normal memory */
> +	mem_size = 10 * page_size;
> +	mem = mmap(NULL, mem_size, PROT_READ, MAP_PRIVATE | MAP_ANON, -1, 0);
> +	if (mem == MAP_FAILED)
> +		ksft_exit_fail_msg("error nomem\n");
> +
> +	/* Touch each page to ensure it's mapped */
> +	for (i = 0; i < mem_size; i += page_size)
> +		(void)((volatile char *)mem)[i];
> +
> +	ret = pagemap_ioctl(mem, mem_size, &vec, 1, 0,
> +			    (mem_size / page_size), PAGE_IS_PFNZERO, 0, 0, PAGE_IS_PFNZERO);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("error %d %d %s\n", ret, errno, strerror(errno));
> +
> +	ksft_test_result(ret == 1 && LEN(vec) == (mem_size / page_size),
> +			 "%s all pages must have PFNZERO set\n", __func__);
> +
> +	munmap(mem, mem_size);
> +
> +	/* Test with huge page if user_zero_page is set to 1 */
> +	if (!is_use_zero_page_set()) {
> +		ksft_test_result_skip("%s use_zero_page not supported or set to 1\n", __func__);
> +		return;
> +	}
> +
> +	mem_size = 10 * hpage_size;
> +	mem = memalign(hpage_size, mem_size);
> +	if (!mem)
> +		ksft_exit_fail_msg("error nomem\n");

Didn't we discuss using mmap() instead?

See run_with_huge_zeropage() in cow.c on how to do the alignemnt 
yourself easily.


-- 
Cheers,

David / dhildenb

