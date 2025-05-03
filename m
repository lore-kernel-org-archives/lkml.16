Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56C1BC3C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746242673; cv=none; b=ADPnfSKkPXe5mXiNoR2FQSGxsAqqELROIrQgFl1DyD3tCHbb7wLTNR3gHKiZp/CkpjisWBF4Uc6AZtJRMdiLadQEjHe9/SOp3Mykdzh/WJVyRgA+z2OiiWfH2/USXp5sMVOT8dTATJ1nlERg9Yd40FN4noGtvrzPUlgH4yfZpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746242673; c=relaxed/simple;
	bh=yu/6Tg8ZTq+DttRgp7CeLbDw8imhFFEHXPhv+8viRAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scHWjXHh++M9GHQl0QoBH7F3uMVGt91gRkI3No0GiU+z+Q0s4IEbwP40h6Tglp246d6fKwYvqE9ydgX0gq0jUZ9AdbVurunqriw4pkSh7LFBzzD28jApctSQ8w3QhvfhiAvpEbBMsAzBn/880iuxmE8zTiQU1zzBhWGuOoEs0ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=jVUbotxL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="jVUbotxL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2369057b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1746242670; x=1746847470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01S3EXrUvAFlfKl+vJu+6SWulW0bTDiNVSLWcw/lkYE=;
        b=jVUbotxLQ1dYYHuno/x4fTS2wePS9KHd7cLAiG4zWi8KtjFWyK83h4oHG62QqY1Ab1
         /Fdz87VC5CqmBRBo+LejCx7kH7PDiwPgmcwyc5TUqriy79hRwK6zXrH6y5x9Q3pN5AYf
         tkhOGMdQMLH4FZsa7Lv6sfp8NYrFEJfdN0ORGbt9UgBfFaFC6sqZY/ZgPpUhgRgLxlUS
         06pbLiTa81oV47swLcPKxMd7xgupHAQcyPLa3jqJzMe4dd1jTqKzHXwPUjvR5x0swMHn
         0LXaIWMrJ+/4wbjQY0E2zamKBKxa8Tq+Do8bnurZxCu/RfAIykR1u2rh07iXN+PvWPb2
         cDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746242670; x=1746847470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=01S3EXrUvAFlfKl+vJu+6SWulW0bTDiNVSLWcw/lkYE=;
        b=dnGqTzKQSLSaUeROPSoQOaSil82TQGQB6SuC4Z9EFRXXU6hSwnI1/CopPEllDr1CKl
         dHN+HZ92/WNXZq7YvnV26ZONMR2MD2hYfPZ4UsVASztvNOyZfllEbo0u7IMq+QMWtnBW
         MoslAyPhZaxAMQG2ibQfObnPOB9vpOzgRvSM3yWVvAUeOENQrlgdn41na4DQtWGV2Qac
         bkJw/UX6x4Kndm0ys+NUp4MXIJDKfWQH6wTsuL/vU9dIogch/1czVYLnrZ3PUPmfHOf2
         fjq4rp1oWBpcx6CHHxKmVJ75gYh9c0aazHwQ6kH13UfJ/sUMnshoyVBQxofivd0Yw0e3
         B/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUij96hrpI6yE38CToqa3vO2/sfP38W/MDqAqBmGXPIt+RLeqKcD91pypVCXftGc4jNJs0VKDYLHukh/Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwkT8fFT4noVR8UIAChlRVM/6FzoFnIVH3fnIaN4xfW1G0tp2
	kEkI2AL5VJU1BFGbNVwtqufCf1P0y8MkfNKbcGL86Ftj1I1y+wIJMcPYTGsvgEk=
X-Gm-Gg: ASbGncs2w5WnqRSVhG/p0+moUFPvXrowuSqOwTXskSUHSssk3O7qhdmcBRSy4iXpKTe
	WdeLs+HdJxl7ZWSkg0kkCScFFfVGAFxTWeRyXjdBp1iNXGrmaJNs3M7yXYACMCAJl8YOXQbO3Dz
	j+6IvODaxXHsrs+MPH6v9nICXaNSljTD45kTYNhNhfpK72WSr5QTshtJ2LA9cTjd2/K1gfywp8C
	wDqp0JR4zwQZ8qeIH1UXasd9WacQXQvJfEv5VsOocYADfPoIgLLB/lJYikGc+1qlynAH32SGqyW
	7bxJLEPsqB0gKZLE2xBVW3xbmR9IZf/W9E5TdyOPU4iI4Pk=
X-Google-Smtp-Source: AGHT+IGKyyY6b5IkmssEe4hWWkvxqqRx2LJ7Sz66T8MoGjg3QVXwsluSYcL6JIqsHdUYbBH02YKfRQ==
X-Received: by 2002:a05:6a20:c90a:b0:201:2834:6c62 with SMTP id adf61e73a8af0-20cdef3e7d8mr8316564637.25.1746242670102;
        Fri, 02 May 2025 20:24:30 -0700 (PDT)
Received: from [192.168.1.21] ([97.126.136.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a397sm2414292b3a.28.2025.05.02.20.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 20:24:29 -0700 (PDT)
Message-ID: <12ecd375-441d-440d-bb63-d83651cbb049@davidwei.uk>
Date: Fri, 2 May 2025 20:24:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] selftests: iou-zcrx: Clean up build warnings
 for error format
To: Haiyue Wang <haiyuewa@163.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Simon Horman <horms@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250502175136.1122-1-haiyuewa@163.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20250502175136.1122-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/25 10:50, Haiyue Wang wrote:
> Clean up two build warnings:
> 
> [1]
> 
> iou-zcrx.c: In function ‘process_recvzc’:
> iou-zcrx.c:263:37: warning: too many arguments for format [-Wformat-extra-args]
>    263 |                         error(1, 0, "payload mismatch at ", i);
>        |                                     ^~~~~~~~~~~~~~~~~~~~~~
> 
> [2] Use "%zd" for ssize_t type as better
> 
> iou-zcrx.c: In function ‘run_client’:
> iou-zcrx.c:357:47: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has type ‘ssize_t’ {aka ‘long int’} [-Wformat=]
>    357 |                         error(1, 0, "send(): %d", sent);
>        |                                              ~^   ~~~~
>        |                                               |   |
>        |                                               int ssize_t {aka long int}
>        |                                              %ld
> 
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>

> ---
> v2:
>    - Dont't wrap the build warning message to make scripts/checkpatch.pl happy,
>      keep it as for readability.
>    - Change the format for ssize_t from "%ld" to "%zd" as Simon suggested.
>    - Change the target to net-next tree.
> v1: https://lore.kernel.org/netdev/20250502042240.17371-1-haiyuewa@163.com/

Thanks for the cleanups. But next time please note that there is a 24h
cooldown on respins in netdev.

Reviewed-by: David Wei <dw@davidwei.uk>
