Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128C2690F0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396842; cv=none; b=Th40Tm16kRHy42kUn1rpkTONOinalgxGDmb0+ADiWWFLxW8LsnfuQI+YXzRF8jfXYd1Oh3aomSX57fX77JJOyrWQ+5KMzimyghpy9pn0UWbKzW9xYQiZs3R5sIIjyktuBHg0tZKjGC9xmD/B0BKDptLo/MZQIL+jO6V8qzf0mUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396842; c=relaxed/simple;
	bh=rX0+J7BmciO66CwTZws6P9nzek58KCk86XaVC/SFc2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2ckCAMIaIwndqVtFtaBVFYIS0rrDvjgC5sNGUvvoU7FDuax7PhfhoYyONFCYIT3jiULGhKmuNL55lytPMM+FY9+G3Zwn8LaC5TtlHmfbKze7DT3rEThrOEaRwHlmb6RSAhUtmyIrvZ4xb03cmDFLYVhNwnVT6g0oTlbbGZzlMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Yek4zvc2; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Yek4zvc2"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d59c8f0979so10440065ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744396839; x=1745001639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwKbo/ILjWgi++92O9Gpt2wNYU/D5B16c7f5jk0t3ec=;
        b=Yek4zvc2m0TCBIoZ3ycKYfikiAphq7CQhmJTJVR9xy39btgUT61ux6ulvr6Esf95Pi
         ttYPNuWo/N19vBZ+xPvWZzFbBQR7zOLE1r6LMZO6SmQJ4gMbIOec6UPHRcGOoHODp3RH
         3jndY8kuh3TmSITsgDGmCgHnFplc1fKCrLYon74Oa3tov3xvjU+cB/qAlIQIe5B9aQkp
         9/Q+ONAyJGArpnicRsmmwHAduz1QCrUP5jOir28U7S37YUJ39yxiXEKyvPK6TeZXz5yh
         MF4ABQDKhjUxzKgrDMf8h5bXMrMKJJ/Ig6RSGflzuHmImXH0EP3V6CUXfr03dNJQjgzO
         U61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396839; x=1745001639;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwKbo/ILjWgi++92O9Gpt2wNYU/D5B16c7f5jk0t3ec=;
        b=j0ffHFj/wxu7kRi/7t7mkQxhXz6lxhzx9DJceGy70SO0gvyEMBCyZgCZQRZ/mHr5nY
         wceuM17scrTjQtKveC5MjlCGxhEclz53dO4lyFcmIUh1KQbQc/inPtIOt7wpt9CQGZoE
         pa9vcdz07hyNxeHE1g2zxKHKZopVmKTzkzVfIoUigKo0KsP9fpm+MWQcrcBQMYUvgp8n
         tS0tTUINXLAzPV6dhAwvnUdacbIIqKSDgh1n5+bhqs9P2zQwQfDSUumxSqykI7TLjZwm
         h44QKnkD35adFVkhkWp+GIG0gFCr4dUsyciy07ugmYvW8KweXaCs4xai2HCRqmjU+q+l
         6wng==
X-Forwarded-Encrypted: i=1; AJvYcCX1OrOiT+2fiNxzR2O4xm+Ajnrhsip3+DZUqNeI7lPQ6RfAKkTM/kwIiIoVN3WnnQCGi4XfNqM2Uz8Ek18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8ECy47u8PdJ48CWyKc65JGIINHno5nfZ4KbwAx9QmvWhOAFa
	cf3Yqbbqrvg+JOaxn+NLHa2QA37f9LRShElIkvmtqnlwfqwUIjwjsqz2U55pHLo=
X-Gm-Gg: ASbGncsY3pC1IZgNaSo04Z76/ikFpFDW1+AH2S1LIVnV8xIF6ZB4t9DPj8Wz8G1/8Y/
	yZ35YlO0gxzlymkUzKhRuyNHJYv7itTyAB1Uvpu/g0CJ6sye/KnUajkSHCrQfoeC9by3jj5gPpp
	NadeVIjF0Lk+DOIAJ3w1aYgqw0+BfEhkeSguBd4BfTbytH5oknT6PXz03ZGvjEwkkMUvQ7c+inm
	KOX23nB/hq2fCBO9n/9LFVoZOU49F3QF/7myqtG2rCF3Ihf+6zJ7uqDJHZe4uLTGnX1R8XpLmi1
	OY2CecviqRKqur2cZwnSb8yFTaDMyEC5cLfk+A==
X-Google-Smtp-Source: AGHT+IHHx2FuLcfpiqZEhV0h2YcX8Y5A+GiQtHlGAIQleui4k5vNjuZS9xP7B9uTqkuZj09S4EcZmw==
X-Received: by 2002:a92:1304:0:b0:3d3:d08d:d526 with SMTP id e9e14a558f8ab-3d7e4d0c549mr66318445ab.11.1744396838982;
        Fri, 11 Apr 2025 11:40:38 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d3b945sm1327945173.69.2025.04.11.11.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 11:40:38 -0700 (PDT)
Message-ID: <f46e6057-704e-4dc8-8443-37006ca2ae74@kernel.dk>
Date: Fri, 11 Apr 2025 12:40:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ublk: skip blk_mq_tag_to_rq() bounds check
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Christoph Hellwig <hch@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250409024955.3626275-1-csander@purestorage.com>
 <Z_eOX-8QHxsq21Rz@infradead.org>
 <a76ac487-564e-4b6e-89fb-9c848a398c43@kernel.dk>
 <CADUfDZruQch9Nd9dQ2tNzFUFMPmqTrVvKK_uHrwEQ1+4oL6YZw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CADUfDZruQch9Nd9dQ2tNzFUFMPmqTrVvKK_uHrwEQ1+4oL6YZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 12:36 PM, Caleb Sander Mateos wrote:
> On Thu, Apr 10, 2025 at 6:13?AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 4/10/25 3:24 AM, Christoph Hellwig wrote:
>>> On Tue, Apr 08, 2025 at 08:49:54PM -0600, Caleb Sander Mateos wrote:
>>>> The ublk driver calls blk_mq_tag_to_rq() in several places.
>>>> blk_mq_tag_to_rq() tolerates an invalid tag for the tagset, checking it
>>>> against the number of tags and returning NULL if it is out of bounds.
>>>> But all the calls from the ublk driver have already verified the tag
>>>> against the ublk queue's queue depth. In ublk_commit_completion(),
>>>> ublk_handle_need_get_data(), and case UBLK_IO_COMMIT_AND_FETCH_REQ, the
>>>> tag has already been checked in __ublk_ch_uring_cmd(). In
>>>> ublk_abort_queue(), the loop bounds the tag by the queue depth. In
>>>> __ublk_check_and_get_req(), the tag has already been checked in
>>>> __ublk_ch_uring_cmd(), in the case of ublk_register_io_buf(), or in
>>>> ublk_check_and_get_req().
>>>>
>>>> So just index the tagset's rqs array directly in the ublk driver.
>>>> Convert the tags to unsigned, as blk_mq_tag_to_rq() does.
>>>
>>> Poking directly into block layer internals feels like a really bad
>>> idea.  If this is important enough we'll need a non-checking helper
>>> in the core code, but as with all these kinds of micro-optimizations
>>> it better have a really good justification.
>>
>> FWIW, I agree, and I also have a hard time imagining this making much of
>> a measurable difference. Caleb, was this based "well this seems
>> pointless" or was it something you noticed in profiling/testing?
> 
> That's true, the nr_tags check doesn't show up super prominently in a
> CPU profile. The atomic reference counting in
> __ublk_check_and_get_req() or ublk_commit_completion() is
> significantly more expensive. Still, it seems like unnecessary work.

Matching atomics on either side is always going to be miserable, and I'd
wager a much bigger issue than the minor thing that this patch is trying
to address...

> nr_tags is in a different cache line from rqs, so there is the
> potential for a cache miss. And the prefetch() is another unnecessary
> cache miss in the cases where ublk doesn't access any of struct
> request's fields.
> I am happy to add a "blk_mq_tag_to_rq_unchecked()" helper to avoid
> accessing the blk-mq internals.

Or maybe go the route that Ming suggested? But if you go the other
route, I'd just add a __blk_mq_tag_to_rq() and have blk_mq_tag_to_rq()
call that with the validation happening before.

-- 
Jens Axboe
