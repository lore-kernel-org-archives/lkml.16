Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46120408A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814589; cv=none; b=GOY1KJRnB3MG82OVx6hvpDL6M8Q0esJGmYM6VLAuj4fXK4u8lwJbamG0IAEJdpkbNqD4Q1816PJLUZb0LRFf9ldH277t+VPEr9VIWmKd7GiWFZZLzH//5OITId6BaUtcwQE51GdFYpHKS8lc8ER/8T4XCkcsEZH3uOu0CKFrGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814589; c=relaxed/simple;
	bh=E6t2wqmmdFRlHcAciWfp+a0sirqkJIVlwFk9TXz9k3g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NJCiwwa4C7rh6nrpWZYDZnHJSo1aWM/cj2rkycBkx+G+iBDVO8ZbaXXA6M2duGahCiVW1IhbwmPM1AXkrv+HbyrXLga3b+mKy30YkKG+t0JyRyQYH3o897HSfByEqZzRf7iaW+QKYEq8VYQPcCvGjVGsUamC0UAbfbSz0bem4LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=A/K4V5qM; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="A/K4V5qM"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d6e11cd7e2so50497425ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744814585; x=1745419385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMm6d3jVPnnWoSD2RLZiFQFOhLAPPJVL4Xw7hd2A1OM=;
        b=A/K4V5qMmW+xxpaRBowCwpan6aJGSx5InlIjAqVRfgX/HHna+i7IO8W5S9b8IHepPl
         sbP5DTLNocxPCp74AoehJuLP9fZPVxMfIJSoNUxH/0egS4mkC04euoDlkFd2DyYR7Qda
         8RliMNPS/7umdk2C1AMuFtlj+YWsY4ePjUWYjkmFWFfrBXRDyc54gTF1t5Nfr40YzfDJ
         VcuMcgqIhtX5Y40nN/11Z5hxqAbfPkRSLIMgrb1POzvs9i94pzPcfHE1kLiiVN7PLPB5
         7t6pErgQY4VXo7DDT48amLLU7pHUQw32NeCaXs10kXEwJuk/mzIHrqX2AdgIV2o7pX2o
         m50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814585; x=1745419385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMm6d3jVPnnWoSD2RLZiFQFOhLAPPJVL4Xw7hd2A1OM=;
        b=WMNnpWuQtcxXiY3oBSP+V0g02RD8MtGa91j9hzrShaVy3DJLLXVHAPwwiBookd9T6K
         iBieiRjSWxFvzd7EKfWazMLCIQSBnXHhxx+eusQHJ4RhPAq+D5+/YZrkL/MrYcgz2LIK
         gY4tCDtOooINUugF8r7IJa/Dxz7N6u2QYVBhoyINfbW1a0eLdmgIK75zMWsUSlFYfh01
         fOyM/hxcHbp0QWUT7xC1lddv8J9BvDFf0iVCnf8iaIKetl8ub8FHzbRIAXqCf9xkZl/g
         YKkKdElDdGsDmUiO6xj9SPhSztf2rYt2D2HBIM8h5VWmtzMgy4TTKwWfiWrfasL6Ny+T
         GivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVXkdGtXMO+IeMPVv0QtAfMLZi6u0wOuWOKmPvMgkgMhL0TTyz0QejS4DVLn6PHKubcBMe7tW9tn2Yrvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySgECgbkH0EjU1it5bbtX7qkcLj9Mk25U0zFdc3YgbJtGaGlrl
	KINZOmz8DCUKQcqwUDl0m6petE+t3a292IXVJ/Q+2PO2toF6XFqnmLdY+rzeYlQ=
X-Gm-Gg: ASbGncuIMkVpQHcf8G9iwE4+lpogkEltP21Lwn8QtO3tmeHmFsoGOKJOlMW9jZUSWr1
	xNJuSLJ4OoXlcapKf0gvIVZwQLZI3cCc6YmYzvRDrVkeOasoLIw3spir2gH7EN18RA5db4bI4QB
	CTp69aO8bPxBhGUIVJD80WQWN12b0sg4LW0Ga01yEk/0AO2vX8YewYys8rY9BEJ+u/jctbx8NOx
	/DVPemYzjIDDAYsQ4F3O5xh4Yz0NGR+pd37yOLeID2DT7uU3cNbfoDGC/QqD9ohbcI1CG+Yok9J
	SqH6aS67Ul+h3cooFO6pzqgbxZweiakdyH6vKIWAUuyIgpY=
X-Google-Smtp-Source: AGHT+IGlvN7JP53zjNxCtaMyuGDYZA5EaC4ATTfHMLn7dUs7YCas0nBrZh0gvhk83EKFLBCxa+WxPQ==
X-Received: by 2002:a05:6e02:1d84:b0:3d5:eb14:9c85 with SMTP id e9e14a558f8ab-3d815b10ce6mr17959305ab.6.1744814584887;
        Wed, 16 Apr 2025 07:43:04 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba854f8sm38539175ab.21.2025.04.16.07.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:43:04 -0700 (PDT)
Message-ID: <ee2850a5-6269-48c3-a843-4d87c9e107f8@kernel.dk>
Date: Wed, 16 Apr 2025 08:43:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
From: Jens Axboe <axboe@kernel.dk>
To: Nitesh Shetty <nj.shetty@samsung.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: gost.dev@samsung.com, nitheshshetty@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20250416055250epcas5p25fa8223a1bfeea5583ad8ba88c881a05@epcas5p2.samsung.com>
 <20250416054413.10431-1-nj.shetty@samsung.com>
 <4ed32b40-47ee-43f8-b3e3-88fdc6ca60fa@kernel.dk>
Content-Language: en-US
In-Reply-To: <4ed32b40-47ee-43f8-b3e3-88fdc6ca60fa@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 8:19 AM, Jens Axboe wrote:
> On 4/15/25 11:44 PM, Nitesh Shetty wrote:
>> Sending exact nr_segs, avoids bio split check and processing in
>> block layer, which takes around 5%[1] of overall CPU utilization.
>>
>> In our setup, we see overall improvement of IOPS from 7.15M to 7.65M [2]
>> and 5% less CPU utilization.
>>
>> [1]
>>      3.52%  io_uring         [kernel.kallsyms]     [k] bio_split_rw_at
>>      1.42%  io_uring         [kernel.kallsyms]     [k] bio_split_rw
>>      0.62%  io_uring         [kernel.kallsyms]     [k] bio_submit_split
>>
>> [2]
>> sudo taskset -c 0,1 ./t/io_uring -b512 -d128 -c32 -s32 -p1 -F1 -B1 -n2
>> -r4 /dev/nvme0n1 /dev/nvme1n1
> 
> This must be a regression, do you know which block/io_uring side commit
> caused the splits to be done for fixed buffers?
> 
>> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
>> ---
>>  io_uring/rsrc.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index b36c8825550e..6fd3a4a85a9c 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -1096,6 +1096,9 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>  			iter->iov_offset = offset & ((1UL << imu->folio_shift) - 1);
>>  		}
>>  	}
>> +	iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
>> +		iter->count + ((1UL << imu->folio_shift) - 1)) /
>> +		(1UL << imu->folio_shift);
> 
> 	iter->nr_segs = (iter->bvec->bv_offset + iter->iov_offset +
> 		iter->count + ((1UL << imu->folio_shift) - 1)) >> imu->folio_shift;
> 
> to avoid a division, seems worthwhile?

And we should be able to drop the ->nr_segs assignment in the above
section as well with this change.

Tested on a box here, previously:

IOPS=99.19M, BW=48.43GiB/s, IOS/call=32/31
IOPS=99.48M, BW=48.57GiB/s, IOS/call=32/32
IOPS=99.43M, BW=48.55GiB/s, IOS/call=32/32
IOPS=99.48M, BW=48.57GiB/s, IOS/call=31/31
IOPS=99.49M, BW=48.58GiB/s, IOS/call=32/32

and with the fix:

IOPS=103.28M, BW=50.43GiB/s, IOS/call=32/31
IOPS=103.18M, BW=50.38GiB/s, IOS/call=32/32
IOPS=103.22M, BW=50.40GiB/s, IOS/call=32/31
IOPS=103.18M, BW=50.38GiB/s, IOS/call=31/32
IOPS=103.19M, BW=50.38GiB/s, IOS/call=31/32
IOPS=103.12M, BW=50.35GiB/s, IOS/call=32/31

and I do indeed see the same ~4% time wasted on splits.

-- 
Jens Axboe
