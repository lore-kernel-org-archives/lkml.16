Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872F1A0730
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813179; cv=none; b=RW0w01Kyi2puqsjBqDVTKh50BEkkBhNEZVh23UOEFakxXH8sKNvtFuWkamJtxM6otSNV/iXNyPsxEnOgwYCuzO2YHoqjTvV5w6gZnthpJi9iOkk0TyA20nDtvaELjaXS3kJEyjAJXoivOggqlrgUmyUu3rjre6zDb0gnLUMa6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813179; c=relaxed/simple;
	bh=Kn8GewQMCt837Ur72dVjEJ2agTaNH8ObgZooVxRffzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0J6yq6WFHQSzpo0bKDhRFv/IdiOhgDJP7l61INZOZ+pCzs2+0NlvkXnpNW6v6FtVQOF4pH4yNooMfzuhJS3GNP0Nzed2MOQlR6E5DQDlTK0XdNQ2r3eRJcIGEle0uw9uC8JYNUvei6B+y3Z6K5CAonvwP0kZWKPV5s1afPLHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kOERifFJ; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kOERifFJ"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so22418655ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744813174; x=1745417974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfAIOkjpjHNO0hyMEWOpAcY/kPLoFg/oJV0w72D5OhM=;
        b=kOERifFJh8ziaJ++/8whrC2ge3CsitIgzvRSCjp93VBt6W0Ju5GqEQALNzu/LSys29
         RSlriFQHx/MC1hobARzUQxI/GBg7l/7g2F1rjUP95LGoS7xhnO/VJiy4vIfbTEE22KHY
         DGdHEjEHPROc1s3zPq81K/Xrs8XfOHKtUvVHAeifhg9ZUFFfFuc5LfEOhQni6f1inube
         PaDLvHoM6s4iyvT9qwcJO2mnV7Xx6hzIKlLOoCuHYPjXEvMgtO9fOsNtYfi0uhx5YjrE
         uRD3jrEXwiUoOFTTVfqcc5MZpfsRGx0H3tiVqtpC+WqB+ZY3qisnI/Kbhi5R7DWXCgVS
         sIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813174; x=1745417974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfAIOkjpjHNO0hyMEWOpAcY/kPLoFg/oJV0w72D5OhM=;
        b=SHVkHieS+UdANmf/Ria4BrABJYzT+hbCRdd3dOBI7ROq0ExwHrCCEE72bi+WrZqKvz
         OWZh/p0Fj7mcuj3Xt6vAF3jf4/GloVW+cVDPHAInwXhegR1I4LrivnFUlVpGOwI+xebs
         lHt7Wu96G0/gyJSd5jNBL4R5qeOHITXDe3tBJegq+BwF3j0wkFYEfr94ybx6Ct7Oi1w8
         QNaCt8ed0xiHZMbjT8L4lIMqnGn0UJXho2pH4OSikWibKCzW3iUXrB5iLedQ1aqOus+Q
         obCoAgkERZknBWKck513Anl3ThbnE0XkotM5a7vYmOqJpZj2MPMyULxDEdlaBnhXY5YP
         55dA==
X-Forwarded-Encrypted: i=1; AJvYcCUng1d4tdwEPcxLrO4Onakq4AsWyOwMjt1Pzwg1HItwk7sWEpdVSNUFvebob1MFgSbegmeHk+iU9pIdmFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn/y7+1VpqZeCpy4UUK9XhXcp5gCbZRgH9ndpAfCMdpXYVN+NL
	gCK64bcXIscjGNknYBLv626Wbs+mhYPn+1b5dClUc636FoAC6HLZ2c73ZWKLEpA=
X-Gm-Gg: ASbGncs62l104nNl7Yj8GNNqoPdZdWVhJ3nx+1StQB5v9I8b99nlUloS9SXiGbJf7cu
	7Oz4nG2EVpshXomzexQShmW5P2mRjVGApVjFPiH0agGZLemSd7ppiPceIjI/u0QF7TVLjDipkJI
	LKHF1BWh8uKZ5xmTsL6s+vys9WMAkurGkIEwhM81Wud2z1Qs227ZTLueaF7RebUkO4nZBlUTYTt
	7W2LCyZPgT2dPqilX7qhnTZbsW4xE2KpbzhfVvJSsWbrea8nPDXXbRFAuJta3hosAZ4JY8HXbte
	+S5RUCOY8VWOpz8PNIAhN7EYRGHqmsm4obIO
X-Google-Smtp-Source: AGHT+IGBCs0Me+0RwnGVpKzHyE47gG1pmgiY5tpO5HWyRZrDQVdE05b859sEUsSWFeKLZBWcIkayEA==
X-Received: by 2002:a05:6e02:1487:b0:3d6:d162:be12 with SMTP id e9e14a558f8ab-3d815b6a8bbmr20961975ab.21.1744813174354;
        Wed, 16 Apr 2025 07:19:34 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e6ed19sm3647778173.133.2025.04.16.07.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:19:33 -0700 (PDT)
Message-ID: <4ed32b40-47ee-43f8-b3e3-88fdc6ca60fa@kernel.dk>
Date: Wed, 16 Apr 2025 08:19:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
To: Nitesh Shetty <nj.shetty@samsung.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: gost.dev@samsung.com, nitheshshetty@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250416055250epcas5p25fa8223a1bfeea5583ad8ba88c881a05@epcas5p2.samsung.com>
 <20250416054413.10431-1-nj.shetty@samsung.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250416054413.10431-1-nj.shetty@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 11:44 PM, Nitesh Shetty wrote:
> Sending exact nr_segs, avoids bio split check and processing in
> block layer, which takes around 5%[1] of overall CPU utilization.
> 
> In our setup, we see overall improvement of IOPS from 7.15M to 7.65M [2]
> and 5% less CPU utilization.
> 
> [1]
>      3.52%  io_uring         [kernel.kallsyms]     [k] bio_split_rw_at
>      1.42%  io_uring         [kernel.kallsyms]     [k] bio_split_rw
>      0.62%  io_uring         [kernel.kallsyms]     [k] bio_submit_split
> 
> [2]
> sudo taskset -c 0,1 ./t/io_uring -b512 -d128 -c32 -s32 -p1 -F1 -B1 -n2
> -r4 /dev/nvme0n1 /dev/nvme1n1

This must be a regression, do you know which block/io_uring side commit
caused the splits to be done for fixed buffers?

> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> ---
>  io_uring/rsrc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index b36c8825550e..6fd3a4a85a9c 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -1096,6 +1096,9 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>  			iter->iov_offset = offset & ((1UL << imu->folio_shift) - 1);
>  		}
>  	}
> +	iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
> +		iter->count + ((1UL << imu->folio_shift) - 1)) /
> +		(1UL << imu->folio_shift);

	iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
		iter->count + ((1UL << imu->folio_shift) - 1)) >> imu->folio_shift;

to avoid a division, seems worthwhile?

-- 
Jens Axboe
