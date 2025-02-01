Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311F21C3BEE
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738424328; cv=none; b=B+tF598WBK2QctQL7PxX8UAVDKiBIjY2Gu9QaUs+p+OhG/zuL+z0GMQ2DLl+xXLoa/f3YWMU5LeprimQ6ccFJ0x0i4dAtv7D8u8bmWtwUx1HEtOvojyG+uQwZ9B2JFgI7c+Euqw8llHtwPBiwKIaYTESuzhShc36N4MPUeatGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738424328; c=relaxed/simple;
	bh=T3UX4pDwFWwTzgKYV6IhqbmgRXz2grhQM2xawuLAF+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf5EX0QANpspEq5G8gHcyoIt1lCFK50cSzhhHILCO663jL73bURQytL243EGktH12SUzOXqW/6fC1X795lfJGzpBKCaH4taBztstJNMOlJrjMyhr9NJt6AP4Xh4aGiAdc2H1H/J2JIkigmnxKb7aNPUslkbStGs0EBcrzCCV0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=xgNGAxWs; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="xgNGAxWs"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844ce213af6so81319639f.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738424324; x=1739029124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sK19sGcb61Rq3NH5lzGx01VpDfttDHo//maIlQCUBJ8=;
        b=xgNGAxWs0dL0AFOiFvvsW8UDPMame7st3NJMkAqc8DYthClQvu2NG/HP1jHOqptcYE
         5loMVVCxHheX70RpdQrhpmKKw2Fqadw+tTp5VgTSD4tcX26FqmACJvWchaCBHySDV2ZN
         gfTIGtWRyEjMVWHau6w5iAqn3ASmkg+1Av7asfjFd1sghn6BeTE79lNrDgkE7vi/FhDM
         mAQ9O3hphEzXFaM+iJ3B8IVRGkUi2//PHfr+73ZB701ckQK/anUxSRh1GdnG/qBPTBi0
         Usb1yNxApWLS0NgKMp5Ushm3tbg+tLnoe+3E1nnlXkd2K/Dz2jEFqeohNzW64IIzE8qX
         5aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738424324; x=1739029124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sK19sGcb61Rq3NH5lzGx01VpDfttDHo//maIlQCUBJ8=;
        b=jFEVOaNDlbAO9BInUa7v338eThSWqsbjgcZiPRCafWUfhD+dDcp51znfs3b/1WYZfe
         McuBkZERPMxLEq1Q5dFg4/o8N1gVPRh4Fc1gG0D/vd6EkXyv+o1zxy2okJZDgF9jWpTk
         +ygvWRFHimOmiWT3vox8HsxMQSFh4oL8ZHlJ2Npi60Zg1xelOOrh1/FUeZ3iecbSHYPS
         2JrDYI59nXIfo5B2YppJQ7y/r4LUQz3VfyqPo/6l8fO1+R65mqo/nTG2T09ZOuPQQPTI
         0lAsNrqdaF2vDNZdIOrtmFhORXl+UUrDlZoQS/rZm/5fKfPsa3/Aop0fIZTYmiUFpwSc
         /kRg==
X-Forwarded-Encrypted: i=1; AJvYcCUsCqGhJAGTkBYeROXFnGhyc9DojT4w8FM0JSfmwuxrm1uYYk85YIhBdhTx2IhIMN2GBKI+LpYCMp5s5AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0cRjIm7wSPwmGYvU2WiD2wVLL+375bOxnSJTzKwE/xI/UC4E
	CNPWdOFeRd76WFiVjLrV49z9rRzN+jjXBgsTaXNw8LLSzt4binJc6fA1+F/Ew9K4FMcpJIZic2f
	V
X-Gm-Gg: ASbGncvnEbXEY6LxECQooNUDSkXHZmE7+ZK4xw9Q+fZhuA5DQBSvNHANCyLFV+qvjUn
	cnCzhw5R4TuQonWUihr55J/x4MgIFY9tcUnRN2+2EL2PpMn58xyoZuwsvs24P2a/2eQ0hGwTy0T
	xjylZXS2XtGcGEXSL2tzLN6Mu42EPhs+wr+rDkmgb9dZAzLQOJS2so+jxUk6fKv4HzfZdBoO70+
	bsS5O6blP0a3zxEDh5xZv58HFlLblcs0Po6gFkYd9Ng9UURe3RHajIXjfNvVDsPM6bSJOEHkAxV
	dcollDV8+ysN
X-Google-Smtp-Source: AGHT+IHHxywtrROfFyXITU+1sqWmIGLfAgdKi8CY5Q4qEEsfN5PaFnwCiujdXUybGoWxyWGqiHuFmg==
X-Received: by 2002:a05:6602:6d02:b0:832:480d:6fe1 with SMTP id ca18e2360f4ac-854006e200bmr1391491639f.0.1738424324228;
        Sat, 01 Feb 2025 07:38:44 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a1619d8esm147577839f.28.2025.02.01.07.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:38:43 -0800 (PST)
Message-ID: <7c33ba12-2ec4-4692-b388-58950d42a0a2@kernel.dk>
Date: Sat, 1 Feb 2025 08:38:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Various io_uring micro-optimizations (reducing lock
 contention)
To: Max Kellermann <max.kellermann@ionos.com>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <7f046e6e-bb9d-4e72-9683-2cdfeabf51bc@kernel.dk>
 <CAKPOu+90YT8KSbadN8jsag+3OnwPKWUDABv+RUFdBgj73yzgWQ@mail.gmail.com>
 <f76158fc-7dc2-4701-9a61-246656aa4a61@kernel.dk>
 <CAKPOu+-GgXRj-O9K1vdGezTUGZS64w5vpkZg2MM-96vmwqGEnA@mail.gmail.com>
 <daaed11f-02c4-4580-9594-fcaef35a35fd@kernel.dk>
 <a6fa1317-f1bf-4179-9da4-a77f86b7523f@kernel.dk>
 <CAKPOu+8Xi3oBz3zwr1bJx+LN=6cZN5eiBsrvRLZ_vOMJuOpZ9Q@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAKPOu+8Xi3oBz3zwr1bJx+LN=6cZN5eiBsrvRLZ_vOMJuOpZ9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/1/25 8:30 AM, Max Kellermann wrote:
> On Sat, Feb 1, 2025 at 4:26 PM Jens Axboe <axboe@kernel.dk> wrote:
>>> Not a huge fan of adding more epoll logic to io_uring, but you are right
>>> this case may indeed make sense as it allows you to integrate better
>>> that way in existing event loops. I'll take a look.
>>
>> Here's a series doing that:
>>
>> https://git.kernel.dk/cgit/linux/log/?h=io_uring-epoll-wait
>>
>> Could actually work pretty well - the last patch adds multishot support
>> as well, which means we can avoid the write lock dance for repeated
>> triggers of this epoll event. That should actually end up being more
>> efficient than regular epoll_wait(2).
> 
> Nice, thanks Jens! I will integrate this in our I/O event loop and
> test it next week. This will eliminate the io_uring poll wakeup
> overhead completely.

That'd be great, let us know how it goes!

-- 
Jens Axboe

