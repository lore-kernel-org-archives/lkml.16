Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164411F8BDF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038294; cv=none; b=KaYmLHFj3B4JBIbkCEfw8Raum7je0UFe6GUarKmRAq9G2HDBZjEH6QBT7uNBb39oxhXMmnABup/5PPtceOOhAazrTeQh5CmgXw3C6LSYtaX89LxgXs5TImZmJ1RqTR0ODHhSDPJYtLuHf1lBWYu6YZCXaZe+TMAt+t2c3t3k8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038294; c=relaxed/simple;
	bh=qtd8eJm0kj1uRbmZJldLWMWtv34L+mx4rknM+vjQCJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYnoi+jMXH1gqVhQOxw+mc7eRFwmqzBqzTvRPuscyZAkE3fhJk6oN/BbJMNU/bTr0g5ZjZmEjPvUnAlV5mYVcF0zVM9nwROOBJWitzLnmBY2c8NSnA/z0nQAxstm1KEKNa4TkvQR6UVtF7HzejThXAgXWJHwT/d2J6Yp/7ohYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3b9y7O8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3b9y7O8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744038291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4pI+0M75xO3MrNBc+acv21YxAgUvB92AQFOacEzIcxQ=;
	b=V3b9y7O8mRhwnhBLGuWerq8RDpJeoZncEhat1G9m4zZRmO5K9qUvOt4xkomPgF1hyWShgp
	v8Ylrj8WBE7QbGDk5wqpzwFwHOdpOqK1mlQaFOszk9+RYzahf+xEE6mAlVTcNm3zQnBM4k
	+cVEkc3vM3rGn+2ESXXNP7ZhujX+VSM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-HfGe_zBkPk-hXgjnaxPtkA-1; Mon, 07 Apr 2025 11:04:50 -0400
X-MC-Unique: HfGe_zBkPk-hXgjnaxPtkA-1
X-Mimecast-MFC-AGG-ID: HfGe_zBkPk-hXgjnaxPtkA_1744038288
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5498ec88462so2060533e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038288; x=1744643088;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4pI+0M75xO3MrNBc+acv21YxAgUvB92AQFOacEzIcxQ=;
        b=edQUFVDCPnHFobg837+7+mq7p8GOA9fP8vy/Gz7OFut0l3gtDABnFRFKARA30VmH+h
         emEx7h4PwGN/1Hq0WvOKb07P/z2XdHWn1JF1TLRI2mvsaxyz6f00BLegBwHzHUYLXf/V
         eNCgWNIF5g8xHpisJeLgbtfZI/lDcuaUH63xh7vgGKrMEiUkweA949UwFuCRFpvNBGhe
         NODAjqJgoFiGeBUq9NVb30rBP6HRu2pDSU6nNVNypL6SB/D5r519MNtoElPOlTH06Cs2
         CY3/ZblznRqSsKk69HQ+0pDdym6uw1hCl7sxbOMwYXUAb6LB/io5gy04ixIoMJhySl8T
         2G0A==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+8wdHm+BXahKpiv0KrmZ8IXzC+MttzO6C9b/OscnJsOFTpdmNYi/O6tkV3MKY1YLSBOVSxmGUDxsOXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSpp2KYqcv4aQVlKKoGT5Ts9Ob41Afen4hcjD0Aacuy++23XLS
	zzE3lsA8+Si6AGC7PkMKxyZQ3aPr5OhdWJoeZZKmOqUdMNf1KmD1YQEx/Fte7KIql9e48vqrB94
	bki0tVMwE1a02JmO5h3BlGvwFb3P+vBRXddQmmusadSS+/qCvDqky7N8LxqWdvg==
X-Gm-Gg: ASbGncsu0EcUztTLAZ9WkoOzwC3I7AMT5m/2SchrooDVMzhkVWscP0gZwOxqLfWiilE
	hX2u3SVsxZ5qqkooBXUP0QPH7rRMgXYLVIskBkWjlyDSKoQhJkME8WV8P0t2qRfVWxsy8saZ4aA
	PzYxUMWMS0F1zOEvY6KxPDcpHDUTKd48C9wk3TkluKpaP9bu3H9dnCVRijpDaP2vsaIKgAtL3ZO
	BJRGMml8SN+wit223kHGQbHD31+g35uypZiJRQ2GgUMCFJ4qBepxFc/JrWsRokknAX58W8q20aF
	FXGKN9s/11ZQOaUFI8qJ+2C6O0lq9zHCooPs7JLfkwzf6f25YNUNrVfPRsDX0BxqRoh/PyqJqER
	xuCalX5iPY5fUZhCu6uJWxR4GBTBKfINB2yh1x/XbrOM=
X-Received: by 2002:a05:6512:68c:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2338b38cmr3425127e87.52.1744038286315;
        Mon, 07 Apr 2025 08:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT43rq9hlptiHvp0tySM9Lx1pw1Wq5za64lIJaQaGWA9GKcGUfUwUJ8pQBgrNquv3+5zedZg==
X-Received: by 2002:a05:6512:68c:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2338b38cmr3425031e87.52.1744038285106;
        Mon, 07 Apr 2025 08:04:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c738:3c00:8b01:4fd9:b833:e1e9? (p200300cbc7383c008b014fd9b833e1e9.dip0.t-ipconnect.de. [2003:cb:c738:3c00:8b01:4fd9:b833:e1e9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1efesm1311513e87.78.2025.04.07.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:04:44 -0700 (PDT)
Message-ID: <61e36a73-2c8c-4897-9ba5-3b2d59f57b5d@redhat.com>
Date: Mon, 7 Apr 2025 17:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: mincore: fix tmpfs mincore test failure
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.25 13:31, Baolin Wang wrote:
> When running mincore test cases, I encountered the following failures:
> 
> "
> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
> check_tmpfs_mmap: Test terminated by assertion
>            FAIL  global.check_tmpfs_mmap
> not ok 5 global.check_tmpfs_mmap
> FAILED: 4 / 5 tests passed
> "
> 
> The reason for the test case failure is that my system automatically enabled
> tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
> cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
> allocate small folios, which leads to assertion failures when verifying readahead
> pages.
> 
> As discussed with David, there's no reason to continue checking the readahead
> logic for tmpfs. Drop it to fix this issue.
> 

BTW, should we add a Fixes: ? Could only be tmpfs support that changed 
the behavior but didn't fixup the test case.

> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>   - Drop the readahead logic check, per David.
> ---
>   .../testing/selftests/mincore/mincore_selftest.c | 16 ++--------------
>   1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
> index e949a43a6145..0fd4b00bd345 100644
> --- a/tools/testing/selftests/mincore/mincore_selftest.c
> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
> @@ -286,8 +286,7 @@ TEST(check_file_mmap)
>   
>   /*
>    * Test mincore() behavior on a page backed by a tmpfs file.  This test
> - * performs the same steps as the previous one. However, we don't expect
> - * any readahead in this case.
> + * performs the same steps as the previous one.
>    */
>   TEST(check_tmpfs_mmap)
>   {
> @@ -298,7 +297,6 @@ TEST(check_tmpfs_mmap)
>   	int page_size;
>   	int fd;
>   	int i;
> -	int ra_pages = 0;
>   
>   	page_size = sysconf(_SC_PAGESIZE);
>   	vec_size = FILE_SIZE / page_size;
> @@ -341,8 +339,7 @@ TEST(check_tmpfs_mmap)
>   	}
>   
>   	/*
> -	 * Touch a page in the middle of the mapping. We expect only
> -	 * that page to be fetched into memory.
> +	 * Touch a page in the middle of the mapping.
>   	 */
>   	addr[FILE_SIZE / 2] = 1;
>   	retval = mincore(addr, FILE_SIZE, vec);
> @@ -351,15 +348,6 @@ TEST(check_tmpfs_mmap)
>   		TH_LOG("Page not found in memory after use");
>   	}
>   
> -	i = FILE_SIZE / 2 / page_size + 1;
> -	while (i < vec_size && vec[i]) {
> -		ra_pages++;
> -		i++;
> -	}
> -	ASSERT_EQ(ra_pages, 0) {
> -		TH_LOG("Read-ahead pages found in memory");
> -	}
> -
>   	munmap(addr, FILE_SIZE);
>   	close(fd);
>   	free(vec);

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

