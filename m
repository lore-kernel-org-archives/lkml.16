Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8DB154430
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816042; cv=none; b=Gst3KK1HrAQcSdLuWbWlqoi4f3WBzadR9W9V93M2Ei3O3SRx/Cf0omqftzdGXfNLiQkOa2Vgoq2SLVRACNsI/ZNlHK9w2JxglCeyL3RFhp2SxXt5PB4lHVTl+EW1nDwHNCFmIUzDkhcIgtHTvA7IiZ8DnqqelURnmf2PenNjx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816042; c=relaxed/simple;
	bh=xydEv1bJS8nBM6VoPoPvUsURJKyB/Zca26umfk5kWjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdqCYXMPbH6Ec096CMJ5QIDn+Ki4k2bGIkh61OFtavKJXXYFevcltgd/Z5aibmntRPELBdnRrP4xKxPnJAElU/xD1CW2LqyjrK6P0HtzRdoxY7pSoGEcG3PRvoBnVaaIAhAgFd+vvKwIfeEKts2KPk6HPNdLtt3e0mVUwaUIm+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=luvrRmTW; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="luvrRmTW"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so52318865ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744816038; x=1745420838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSiz4ta79sjKF4kdwzdjhicKXhB4rJNdion/ll08cgM=;
        b=luvrRmTW1ax0ITztpQatJNCGdU8WMDFJkKEIQPpXA5kWbTyOtMA6lX1Obb3BacsCbm
         Tlkj+co6su9D3PWSiKvzkdIIrbPtCoVlEqM7N2X26nbr1RgvM3/OhTT/NpyIavuPZL2k
         /DSaeVYc8NDx9HcwSFCYoiYDMkWBkRbUtTL+z5RJvzDWrJJ9qJA5JskvkJ9WG2PtIdj+
         4BEzXeBOSsbU+zdHoYBLWSX59W3qMesue4hjOX9yjjgjs+4awHdAxNgXOXR2bdvDUuAr
         1vem8v1HCqVKT0pO0AQD6k3qQGQ9q9zdYXwnmFaL4jwJ8a7ULmJ7kqkx5lXKZ4CZ3qB8
         3vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816038; x=1745420838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSiz4ta79sjKF4kdwzdjhicKXhB4rJNdion/ll08cgM=;
        b=pi3PuyMvutSh8DL9U0mUVv1foMuwSWtv90dX9ww2yF48rdE3Vy92xf61koqP/eVLh6
         hX7yPASxKdkuitKqi8JRxLohwSs/yvRNr37kEwXWe8rJYZstRxO/ceugzuCMBHUfR16c
         8ZCuw10KuRp1TUqmdl+PRqMHf6WsZGyjNBzu7EdTzKSg6HdPMIuF5ak1XBOPnSw/ozHF
         lCLRZgzsLj9pDQZ62lpjsXcPuENeH/38fAaLH2Ql0gREEuGv4QPLH5YhGHn0joAvUhvA
         vtyHgn0kJYirru+gjmSztKMqFWSIJl/gnp9S9jIx7a7AfmLLa+fdIjYQRjgkzqCZZgFu
         H63g==
X-Forwarded-Encrypted: i=1; AJvYcCUeN5wKve+UbKJVrx2tRAouZhN2h9z7C7HEePBPaXY4HqsvWcLmgTRG3ZStjrUB780/Kge2hpPyPWiMPaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGseCiwkI+tlOJFy8YMEJB4hX/VwYmPyRavt8COZS0ngILdn8A
	zCr8EoWed9ZLz/BUa+6P/vR9cCKs5WZwtIWIbn8X1LS2QkFCS5u8xgUmwkPzJlU=
X-Gm-Gg: ASbGncuqP4N5kkPkwjUNxgl7asdj5IN5srX6XnGZc4Ac7cPcykADwDqP3Ps/jB16OOU
	UG9ljT1MjVcZrQiUra9rPU2+H40C3/gUNYhOjhu6tIKJPnRyfdtqtSQGAP9D9hSJOrIp6uZ0wWP
	eucKeZTPR9D9BQ5JegzAy7zRaHl7cIfinnPB//1SLmCGoPuL2dBi+xP0r4yCDsAdnZ3I89VQT6O
	mzh6j4ADU8X1e7289BGksdab6yEvh85vIOxusFiNyVB72mYsoKAv3aSpTDoNSBcEtKkdjnzsxKs
	zOQSv8/ATm5q9+YBEzYvx+iasuMbEWhWNHGHQlrX7BKva94=
X-Google-Smtp-Source: AGHT+IEiQF0hJJBv4FKHVHSG0TYD0Ys3nz+ZNjCcYIevxZBop88KC6KOO3PSA/ty3Te7NQIFJkQtZw==
X-Received: by 2002:a05:6e02:216b:b0:3d6:d162:be54 with SMTP id e9e14a558f8ab-3d815b5e1dfmr19479345ab.14.1744816038264;
        Wed, 16 Apr 2025 08:07:18 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e01512sm3601391173.102.2025.04.16.08.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:07:17 -0700 (PDT)
Message-ID: <37c982b5-92e1-4253-b8ac-d446a9a7d932@kernel.dk>
Date: Wed, 16 Apr 2025 09:07:17 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
To: Pavel Begunkov <asml.silence@gmail.com>,
 Nitesh Shetty <nj.shetty@samsung.com>
Cc: gost.dev@samsung.com, nitheshshetty@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250416055250epcas5p25fa8223a1bfeea5583ad8ba88c881a05@epcas5p2.samsung.com>
 <20250416054413.10431-1-nj.shetty@samsung.com>
 <98f08b07-c8de-4489-9686-241c0aab6acc@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <98f08b07-c8de-4489-9686-241c0aab6acc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 9:03 AM, Pavel Begunkov wrote:
> On 4/16/25 06:44, Nitesh Shetty wrote:
>> Sending exact nr_segs, avoids bio split check and processing in
>> block layer, which takes around 5%[1] of overall CPU utilization.
>>
>> In our setup, we see overall improvement of IOPS from 7.15M to 7.65M [2]
>> and 5% less CPU utilization.
>>
>> [1]
>>       3.52%  io_uring         [kernel.kallsyms]     [k] bio_split_rw_at
>>       1.42%  io_uring         [kernel.kallsyms]     [k] bio_split_rw
>>       0.62%  io_uring         [kernel.kallsyms]     [k] bio_submit_split
>>
>> [2]
>> sudo taskset -c 0,1 ./t/io_uring -b512 -d128 -c32 -s32 -p1 -F1 -B1 -n2
>> -r4 /dev/nvme0n1 /dev/nvme1n1
>>
>> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
>> ---
>>   io_uring/rsrc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index b36c8825550e..6fd3a4a85a9c 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -1096,6 +1096,9 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>               iter->iov_offset = offset & ((1UL << imu->folio_shift) - 1);
>>           }
>>       }
>> +    iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
>> +        iter->count + ((1UL << imu->folio_shift) - 1)) /
>> +        (1UL << imu->folio_shift);
> 
> That's not going to work with ->is_kbuf as the segments are not uniform in
> size.

Oops yes good point.

> And can we make it saner? Split it into several statements, add variables
> for folio size and so, or maybe just use ALIGN. If moved above, you
> probably don't even need to recalc
> 
> iter->bvec->bv_offset + iter->iov_offset

Agree, was trying to do that with the shift at least, but seems like
there is indeed room for further improvements here in terms of
readability.

-- 
Jens Axboe
