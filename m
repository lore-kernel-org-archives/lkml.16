Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69B33FD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833713; cv=none; b=Css0uprvHQgjUExumv/t4x0J7WMUYxk+YuQ3t/DhJb7kdu4AoFdZwtQ33TrcJdY5t99Gv6P9s+yvVkfwfx0eTUp4iZ/tnTyUpbLNmSm+bVtEJ70yybY6jI4qNK3ILtzLAimU3Hbp9EFRcoDbRrsRocKFyjKtD1eOatIqSOY2nSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833713; c=relaxed/simple;
	bh=rFDjUwNZy/0tHJwORZ2KTo+nGRXXyrMB9U7pNZUu5h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FI7DedR1gwfbvMW+OR39fRt95eZVGQMslgfXmQ4b7E8POT8cBwDrQ4y9wJYdBmh0sGPWjeZjRuvOzfgUZuK8o2YcfwwqagxtxrXAKm8mwx1qr/9QmpaLCsgar5kff+ZtS8/ReglbasxdK3bEZZy42zVpVNFZK7GcqbL7YMBnRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=OXsnUBuh; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="OXsnUBuh"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b5e49615aso2182739f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744833709; x=1745438509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9CX3O2Ld6+1i6wlJXOkLkxs/SwIku7oh1b53HECV1E=;
        b=OXsnUBuhVcxKt3JUmub1W/U+BAbfh/SsM8gZeB5Xf2Tn1Trg2KJ99qEhorgzo4XrBP
         KGmC/SckIJaeUjjQaPPxyMAkKLaUXuM8RYmFHWy3RzPx0nKs7vSe0YOMv/vYhPYfL8Ny
         4y9WbieW0UW1KGNdE3WJ2dqU2ZW6sU2lzZtTJc8yLisjKD22BVujWJuFAkhzbt8bSxoh
         wK82RLIWHepY4I3NomaPiFXjsQylBjHbncoENNG7o+T4rZ/wNyMm2N5Wd0lDd6rFy7CE
         H3dUTmaH04uAIfd2xuXqk8NLz8n/19cfuW5g5TSIwl6vVecxgFHdh3mlLO3N6lUconyA
         hHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744833709; x=1745438509;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9CX3O2Ld6+1i6wlJXOkLkxs/SwIku7oh1b53HECV1E=;
        b=OZYLK9xxVqjHWs9j+QlCTyWirf7uIWsQEYfS7+2QztZ2z8gBg3HnaGTRPid4UKYx/E
         GKX18GlzhHNZVBf/1n+6dH1sYq3wUDn655O95+6nv7TEPdsxU++tWeSVqZHZUG+9pbRo
         nR/faPz5mJmmcnWeChOcSL/+kZ73p4GUFz1ZHGVFsW8X+vERxNZuG+zREqeLQyI2mF43
         orLQQZgwqza9hqaQuwpx5S58P5kJIeIxa54Dbh69W/dd8H88zY3/2uzRYFQFL3CKFUf9
         dG5qjpzR0YJMG8fZG/M5Q1I3wphISAxqfKbMN5Fuj3RE/24f2wJ5RRXUaT6dENwb3H9B
         B64Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTPUmghjWXJ6a1n/QfSRYM7mKlcLaLMRDfD73qyM/HxR/1g3kLRdn82M3k6ePAOH2PLtl8XhMUSX6jhTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZS2tnegJF8q0ujIQCXr9dwvAfY1+0/vduFoCc4Z/48fkPcm7G
	hZ52zzOlMsD7AZSPHIlMwWHPkfuorVlihpzx1mwkpPxQ9Q9pZzX/4fSxAy6m258=
X-Gm-Gg: ASbGncvC6G5gVOQFB42332OS7jQQYhyhTq7iCnt84EsAtinH37uUUWxZ26Y7h3+ohNz
	ZgZq0G4MINvOhk0JTfXLg1cl2i+tbFJ+SHAkkd9/Lpe+ME5naGEdBvXHuKT60y3k3BjgDi/f5zO
	+VpJtW8TMyQutGxCwMNfe7nijOq5eTi4X2eEihXF/50pgxzgXadu5vLvcco0bFkHz22wskeeG7g
	slnJ59vPpn0Rh2Iw0d7X45Fop0W8FKVswUiqdjPfoXeEGD9198N/llJJYCgH0xTdSrOxlVTLxT4
	Ug6DYf2IRlTlLWfKkCkOVugw+htAB+A0n74u
X-Google-Smtp-Source: AGHT+IEdcdvkE/9Ugh/JicvB5T0eXnJR6x1vsGt3rzT593K+QpUSGn2agISksX8oNok35ovQMnhcWQ==
X-Received: by 2002:a05:6602:4889:b0:861:88d1:bfac with SMTP id ca18e2360f4ac-861c4f6dcc8mr340927239f.2.1744833709505;
        Wed, 16 Apr 2025 13:01:49 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8386sm3794024173.7.2025.04.16.13.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 13:01:48 -0700 (PDT)
Message-ID: <c9838a68-7443-40d8-a1b7-492a12e6f9dc@kernel.dk>
Date: Wed, 16 Apr 2025 14:01:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
To: Nitesh Shetty <nitheshshetty@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, gost.dev@samsung.com,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250416055250epcas5p25fa8223a1bfeea5583ad8ba88c881a05@epcas5p2.samsung.com>
 <20250416054413.10431-1-nj.shetty@samsung.com>
 <98f08b07-c8de-4489-9686-241c0aab6acc@gmail.com>
 <37c982b5-92e1-4253-b8ac-d446a9a7d932@kernel.dk>
 <40a0bbd6-10c7-45bd-9129-51c1ea99a063@kernel.dk>
 <CAOSviJ3MNDOYJzJFjQDCjc04pGsktQ5vjQvDotqYoRwC2Wf=HQ@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CAOSviJ3MNDOYJzJFjQDCjc04pGsktQ5vjQvDotqYoRwC2Wf=HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 1:57 PM, Nitesh Shetty wrote:
> On Wed, Apr 16, 2025 at 11:55?PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 4/16/25 9:07 AM, Jens Axboe wrote:
>>> On 4/16/25 9:03 AM, Pavel Begunkov wrote:
>>>> On 4/16/25 06:44, Nitesh Shetty wrote:
>>>>> Sending exact nr_segs, avoids bio split check and processing in
>>>>> block layer, which takes around 5%[1] of overall CPU utilization.
>>>>>
>>>>> In our setup, we see overall improvement of IOPS from 7.15M to 7.65M [2]
>>>>> and 5% less CPU utilization.
>>>>>
>>>>> [1]
>>>>>       3.52%  io_uring         [kernel.kallsyms]     [k] bio_split_rw_at
>>>>>       1.42%  io_uring         [kernel.kallsyms]     [k] bio_split_rw
>>>>>       0.62%  io_uring         [kernel.kallsyms]     [k] bio_submit_split
>>>>>
>>>>> [2]
>>>>> sudo taskset -c 0,1 ./t/io_uring -b512 -d128 -c32 -s32 -p1 -F1 -B1 -n2
>>>>> -r4 /dev/nvme0n1 /dev/nvme1n1
>>>>>
>>>>> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
>>>>> ---
>>>>>   io_uring/rsrc.c | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>>>>> index b36c8825550e..6fd3a4a85a9c 100644
>>>>> --- a/io_uring/rsrc.c
>>>>> +++ b/io_uring/rsrc.c
>>>>> @@ -1096,6 +1096,9 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>>>>               iter->iov_offset = offset & ((1UL << imu->folio_shift) - 1);
>>>>>           }
>>>>>       }
>>>>> +    iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
>>>>> +        iter->count + ((1UL << imu->folio_shift) - 1)) /
>>>>> +        (1UL << imu->folio_shift);
>>>>
>>>> That's not going to work with ->is_kbuf as the segments are not uniform in
>>>> size.
>>>
>>> Oops yes good point.
>>
>> How about something like this? Trims superflous end segments, if they
>> exist. The 'offset' section already trimmed the front parts. For
>> !is_kbuf that should be simple math, like in Nitesh's patch. For
>> is_kbuf, iterate them.
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index bef66e733a77..e482ea1e22a9 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -1036,6 +1036,7 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>                            struct io_mapped_ubuf *imu,
>>                            u64 buf_addr, size_t len)
>>  {
>> +       const struct bio_vec *bvec;
>>         unsigned int folio_shift;
>>         size_t offset;
>>         int ret;
>> @@ -1052,9 +1053,10 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>          * Might not be a start of buffer, set size appropriately
>>          * and advance us to the beginning.
>>          */
>> +       bvec = imu->bvec;
>>         offset = buf_addr - imu->ubuf;
>>         folio_shift = imu->folio_shift;
>> -       iov_iter_bvec(iter, ddir, imu->bvec, imu->nr_bvecs, offset + len);
>> +       iov_iter_bvec(iter, ddir, bvec, imu->nr_bvecs, offset + len);
>>
>>         if (offset) {
>>                 /*
>> @@ -1073,7 +1075,6 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>                  * since we can just skip the first segment, which may not
>>                  * be folio_size aligned.
>>                  */
>> -               const struct bio_vec *bvec = imu->bvec;
>>
>>                 /*
>>                  * Kernel buffer bvecs, on the other hand, don't necessarily
>> @@ -1099,6 +1100,27 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>                 }
>>         }
>>
>> +       /*
>> +        * Offset trimmed front segments too, if any, now trim the tail.
>> +        * For is_kbuf we'll iterate them as they may be different sizes,
>> +        * otherwise we can just do straight up math.
>> +        */
>> +       if (len + offset < imu->len) {
>> +               bvec = iter->bvec;
>> +               if (imu->is_kbuf) {
>> +                       while (len > bvec->bv_len) {
>> +                               len -= bvec->bv_len;
>> +                               bvec++;
>> +                       }
>> +                       iter->nr_segs = bvec - iter->bvec;
>> +               } else {
>> +                       size_t vec_len;
>> +
>> +                       vec_len = bvec->bv_offset + iter->iov_offset +
>> +                                       iter->count + ((1UL << folio_shift) - 1);
>> +                       iter->nr_segs = vec_len >> folio_shift;
>> +               }
>> +       }
>>         return 0;
>>  }
> This might not be needed for is_kbuf , as they already update nr_seg
> inside iov_iter_advance.

How so? If 'offset' is true, then yes it'd skip the front, but it
doesn't skip the end part. And if 'offset' is 0, then no advancing is
done in the first place - which does make sense, as it's just advancing
from the front.

> How about changing something like this ?

You can't hide this in the if (offset) section...

-- 
Jens Axboe
