Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A61A76AE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872354; cv=none; b=hlyZW6ELKqr2JVhmAj48iiBrtbLA8B5hjunVSLMCRVH00dLZKshQ1KT5JWHFrTM9g1Vqy1YrfSPjxKbck8mkB18wColCXwndBGdc9VZ5uu7RVlEXpc+M9FisCgzMp1a4mBBR/HUsvxcVKDaaGUbSy/i32PZyTlnoMN+ruJ6fDhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872354; c=relaxed/simple;
	bh=dM7MLV2gI/+dPNQXfCS0lXTehUCFYVKLqH8DZHU7ZoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TitiJHz5b0HLNaNsbt8o2IihSg1O9QSWFFmy0rFCxhGBaAVjBZb8HXehvXcXR/4zETyTUa9k1gSjpfp4VpvOAJf+EnjCQD/FMwycx+VxJdP5LOvWUEMhQ4XZ8x34P1TDjpAYxnOIcVH9JRaG5CxPv85I2XU7Up3l3pZw9P1cUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Hz+sIJkl; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Hz+sIJkl"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844d555491eso42383239f.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738872350; x=1739477150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1lmr59Z9QlQ3iR2W2pz1jGXUKINx5lIWoNxYQ31IJc=;
        b=Hz+sIJklmkJ97bVqU8BrwOPmzeZNjj3jhOej63PzGUkkhGasaZDsYtlWWQTrqniAHg
         Ov0tgKkwy6pR9fF6ADDYDCnGiRc7Iu5Xis3eV22xTBtkxwNuV3XNgGRINZOxrx2GzdBa
         86/wP6e+tkW81L3QD/Ug41kKLsBLUUzLCXy/X/Lfq79y6yPIbziJYNr+lHth0JZ8iyLq
         Mj82bmntCZDcUn9MyXuyeqY45lljKoUnaLyTltq0+3ABQU9upz2EmXJBHKgKGW/ljpFB
         YxxOio8UirH7JTRIqvc5JvxK89VWYMZcmyozyw/1vZNOj4bYRAZjlRWtQfNI8pe/KSDZ
         pSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872350; x=1739477150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1lmr59Z9QlQ3iR2W2pz1jGXUKINx5lIWoNxYQ31IJc=;
        b=nhYJa13wrW+4csb51PR86LADPzWeLEYzmpl+qTr1jog4Xpo8OjAYJjXtKOmFUVV/y4
         YspQT4JhuKdxdvKNywaCy1VBeb5bThePZcWebxkh47c2J2Qc4eVay+t+BsybfLWrJktk
         LwCyNQsLE4Ok1yp4b5us361wNio8TKOlL6Se5SL3gn2IABQULBkWFtydjXmYxTMgfA4j
         vp1ICbSbhayhH1Ubx6NU1eLx1LRqK1bnENtqkRzZ4tBfYrEG22gG6DJ/K8mxGIiQTecZ
         uQkvoqoZ90ptYimI7fomYWl0ttJz1J+OmAqmgUE8U+aPGtvBqp0CZmWbaR9tZ8RN6Dxt
         tOOg==
X-Forwarded-Encrypted: i=1; AJvYcCWLC4XDytcXi90chLg7gXXjQQRaq4vzubgRsWUZNwGW7yID1+dqMfD2gpm8N4YOieZmpdakdUr9aRvRTJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcvGRPOXCmB8kni9xO/PoYJ9Wwf9c81hbJpo/mfmDMqvqUwH5i
	25DSdWPz1x3HfH8PQlWHkPujExDFYS/8sSXOtjhk6sSrpBRzFMhk1X3/wwu/SHg=
X-Gm-Gg: ASbGnct/7TCQwbWjSOl5M+6w9tTPB0mRtxLzwEmcw7ye6L5OA+Gsa6aU/TWBz/unA8+
	oa0okDXfBzw2grGuzyglFdi9X+oZCW2dhDowRw2g/oQ7Eshi/Zakr6OR4/e1zlbPMxIdxEduJ8G
	zAkaQdF250WoMFLWKDXgFaBhf12CzMhtdabGfwecvpZ6HNQIzk6ZxqHJmttLm8+x49I/kiyD8bH
	OTv8afq3uogR5g5KDUTo5YpBwB22hRoVoB3evO2tVGdLiyU88D9L8Pblr5ZYOn+y60bnmvFp9IL
	wjqwuoCEblI=
X-Google-Smtp-Source: AGHT+IEWLHbrkOOPQwD4+K7Ie0wMF3tLfK8TEgcDdOJkeqEwr2HjcYFRB4UKqK9qWHCHRes2CYwfbw==
X-Received: by 2002:a05:6e02:1c8e:b0:3d0:26d5:5504 with SMTP id e9e14a558f8ab-3d13dd25356mr3008955ab.7.1738872350120;
        Thu, 06 Feb 2025 12:05:50 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4eccfa034afsm398491173.67.2025.02.06.12.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:05:49 -0800 (PST)
Message-ID: <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk>
Date: Thu, 6 Feb 2025 13:05:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] io_uring: Use helper function
 hrtimer_update_function()
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk> <87y0yjm4hi.ffs@tglx>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87y0yjm4hi.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/25 9:18 AM, Thomas Gleixner wrote:
> On Wed, Feb 05 2025 at 11:45, Jens Axboe wrote:
>> On 2/5/25 3:55 AM, Nam Cao wrote:
>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>> index ceacf6230e34..936f8b4106cf 100644
>>> --- a/io_uring/io_uring.c
>>> +++ b/io_uring/io_uring.c
>>> @@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
>>>  			goto out_wake;
>>>  	}
>>>  
>>> -	iowq->t.function = io_cqring_timer_wakeup;
>>> +	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
>>>  	hrtimer_set_expires(timer, iowq->timeout);
>>>  	return HRTIMER_RESTART;
>>>  out_wake:
>>
>> The timer is known expired here, it's inside the callback. Is this
>> really necessary or useful?
> 
> It's not strictly required here, but in the end this allows to make the
> .function member private, which prevents stupid code fiddling with it
> without proper sanity checks in the debug case.

While that makes sense, this is also a potentially hot path for min
timeout usage, which with small timeouts for batch/latency reasons
can be run tens of thousand times per second. Adding a lock and IRQ
dance would be counter productive.

How about we just add a comment on why this is fine, rather than
slow down a case that's perfectly fine by wrapping it in something
much more expensive than a simple memory write? Or perhaps have
a basic helper to set it that doesn't do the unnecessary irq lock
guard? That would still allow you to make .function private.

-- 
Jens Axboe

