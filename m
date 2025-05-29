Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55408229B1A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515440; cv=none; b=KsFPSuapTA+1y2rUYv9F92Gh4Is8oA8Q9w1DJUvlRE9RvUaKPWTdTgxM+ISH16ukrDHCl8NFUprkLCgxbI/Waboqu1JX+9Yzw42ajZ2tF+CkMkvcYIPWo+G/YaXKbSmyGsYZ0eCPbhjOlE3h6YISkB2YMBJ+K6ucgGNnesn5LDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515440; c=relaxed/simple;
	bh=d70cOs+yRjLV9v1g4IMElU9hP9dP3kaHVrgHH82h00Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfkAPqD92tFdqdb5N44tWMtHEdfmpB7GeLLzLcEnBbpeHKvVQV/k5L0mBLunwF29TyPN5/jo7fD2bk+sMzz8vfDcotbx2gEQTL3O8mFs7q9nUmHv/rW+mJqazBv4YtUX714qRcZzANGnqjwna0CXEEkdMDLlmoldeZIQGPRMUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fY7021ds; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fY7021ds"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86a52889f45so20388939f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748515436; x=1749120236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBKHhBlBfRf8OS9bGTTn4Xut5Q4UhzCrCrJUCDJ3k2w=;
        b=fY7021dsgTqxeleVgj7g2RpOf1gM8Tqdl9b6YDc7pJaju4nCxudcuB1D0Kel+EqOlS
         34GxCvoywEJshq57MHAGu3/4yg1BPuJiRixwwYk6FFluDLFJ6VvqdvdYcmF+5ty/a1C1
         5J2JeGHzEvekuovBN1lHA8UxFiHk/nG2/GdNQSbKDIE3tOZ6wnXsMfh0SgEHAuN4yzVH
         7suGD0fvnhcFpHX+/z6v+Cc0zJNZyHGCaNqPPGJvIuu65ONo6Gzr3nbN0HV5s5kAbFOf
         3CfHXdsZGhF2h4GJAGspiL+KKDgQmTy7l31D+0EOnFTQ1OosIGJnKmTKQllZIvb1sivI
         U+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515436; x=1749120236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBKHhBlBfRf8OS9bGTTn4Xut5Q4UhzCrCrJUCDJ3k2w=;
        b=pKUnf8tzFOT0R4blmkxupEmzoriuQMnrG1u3wKtIo5+qlvnIXdWPZysfVm4w+QG5ul
         PY5o9/RVf73KUsk6qfQITV4e7X4dGdyMLwP0BlTTNOpCPDmUnrFaCnQw56qFd0ehIsga
         mKETHnxEOMAeGPoW5/cmVd9NaliSkD9Di3aQYSXdZ5anDa3SjHWR6/nkS6dEI07V784w
         hrgDwzi5355/vmwuhRffElTPa1vwuZ2DIlyMfRQt4ZTlTFJzqC9l7e56YuhIY71Z5BZ1
         P+k5ZzQXBIcPM7g2V90gJdFG11zbYRjylsPVeAkKn4wVIMnmzTJIDosWXmPPxz+0XDyR
         o0KA==
X-Forwarded-Encrypted: i=1; AJvYcCVf8HAOpstIQ/i2HewiZRlHwHhlKhIB6GwzkUSQTuvwBggRxSmQOO9FazVrIkZtIrTX+n+6UhzCWhLjGc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HXegCcDXlRE1PnoMADUaXg6EeqYM4fhbMpdywQgktv0F2TkQ
	oq0XcCPDDRS8BIjHd6nExXOTOH3jeQoWMimeoVUoV/SDCHjqGmoT55CjEEQuzDdAeMs=
X-Gm-Gg: ASbGncuj6AwwF6xxnFBwl7ghPtPWZF+PEX8Ldg0Rqigyo7uN7lcHmKchRkNQSEzaMpF
	6jdK8maoMUwZoR1rstV/mqji83ZsUyYrQIhsU50XLHdhJ4I4l4qqM50KkihSdZMzn3N5CXoLe8/
	925ltCkz4eSlQYOJHMP4IX8nIqSzVaWzpziRn4blVLEX9YCGwO+/OlAFPM0SgO3jmzGJAV5GOQk
	KGHjYPjlwXfclHuXtwqcP4uJDUY9NS1/9X+L+x4BwiSOXSeqkiGTVDb5PYYRl0j2GJhVHtlnQkh
	DArpsom4itP8EkGmnFOOusQ1OzLfOSm4LnzSQUqoVGBZ1nq2VAFYCtvoK9M=
X-Google-Smtp-Source: AGHT+IHGVGn+63JWl0t2CYty2GIDIfHTGjGGUyr3yYuuyCx1E71eWmROwfUZXoYGh7QKeqcJ+9RtFw==
X-Received: by 2002:a05:6e02:2289:b0:3dc:8a5f:7cc1 with SMTP id e9e14a558f8ab-3dd943d0d04mr17643405ab.3.1748515436218;
        Thu, 29 May 2025 03:43:56 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd4bb1e4sm608197173.43.2025.05.29.03.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:43:55 -0700 (PDT)
Message-ID: <cd3307c0-4af5-4477-9258-2eec57c7003d@kernel.dk>
Date: Thu, 29 May 2025 04:43:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix vmstat after removing NR_BOUNCE
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hongyu Ning <hongyu.ning@linux.intel.com>,
 stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Hannes Reinecke <hare@suse.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/25 4:38 AM, Kirill A. Shutemov wrote:
> Hongyu noticed that the nr_unaccepted counter kept growing even in the
> absence of unaccepted memory on the machine.
> 
> This happens due to a commit that removed NR_BOUNCE: it removed the
> counter from the enum zone_stat_item, but left it in the vmstat_text
> array.
> 
> As a result, all counters below nr_bounce in /proc/vmstat are
> shifted by one line, causing the numa_hit counter to be labeled as
> nr_unaccepted.
> 
> To fix this issue, remove nr_bounce from the vmstat_text array.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

> Cc: stable@vger.kernel.org

No need for a stable tag, the patch went into the 6.16 merge window.

-- 
Jens Axboe

