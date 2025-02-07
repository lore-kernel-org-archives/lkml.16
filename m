Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C023C8D9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950372; cv=none; b=CUDqrQTAfq+yqagi6Bj8nq8mxQbouTv2+U1dasD2yJJ5fQmusSUiDmo6cBldmmj85jX7nXfCu4bknZcGbLwc2aE7CC1VSInBF7g+3oWbYKA6HAvCvjJfAcSnn9P5MD778uR4rEWOyBIE/g6jTy+7tazylmJDMapy8PaliS6XNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950372; c=relaxed/simple;
	bh=zkUGxXfGZ4wMz7t2AFcURTYhsFrCzN2xkHW9NPoczA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WnpXcIH9/8IPTdybVBHFY7AFDlWqBZ08UYokI+a5Q6SxKsirGN5peha210405/D08K40TCLciHnJGvHC+R9tMvdl/zWH74spG6a6QGgfgFGrYv66NGiNnCiGpGL95kZO3ySG04sD20yIfirs0o8ALRauujXGSvbErBQKvKyLrSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iCUr0mAI; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iCUr0mAI"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844e6d1283aso98428739f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738950370; x=1739555170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zMBSc0dza2wEfppuP7pUHZ7jjAYK3TyCJJqKIWvgnI=;
        b=iCUr0mAItybcS7zivsuNng9FGNk4LOZMwfAVSDjlPgAkcAQWNgn1b3IXvKDwNwprlb
         lVe+R+rHTdRc2wKS+s3pMfw5sqHhDIxXctjyN0uCO7cBYdN0Ir3WWgXYUGOVms6iHfm/
         iFTQiWZr8IPstTE4RFDRzDrAGS1S0pxjBT6ZwdT3e4DL3pB0yGE9BPvkQzm/8vSB01KN
         Arzxln2cyaJYhiks+L20DR6b45GkNhVF+epyQ7upY/8tJ9ZnuXdA3yTrifNa1AbLiYvJ
         3g1Sw9JvJMZdQ7dO2Xp5oeRDm/uvXO73dcvMlH0XJoIitjXXtbuJSlesgnQadll1xBw0
         DiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950370; x=1739555170;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zMBSc0dza2wEfppuP7pUHZ7jjAYK3TyCJJqKIWvgnI=;
        b=t4Kk/9w5Psbyum29bU9+c2vXUWmIxbkJQjoqcWwRJS/k5TFJsuIaEVKl1PvXd/SN+A
         Pv/x4WvoxosZ9yI2OyCo6Lv1rEfQwyXLd/sQf6N1ZpqZpkm1Ao0rWbCpDj1/AqNO52IS
         mhfIhj7eiVMTW9u/kfFu4CmKNROS/3sHjKnRyajSgFMmELBkTKRh0EPR253Z/D37qKqx
         bti4lHgbucjk9bbR3igUqTUn5MCcMLZ98wkJEYL1TaVO2sLefy8javxIbjSj5nyxWnsq
         MH/jdohWnQ0jOjSIz5hGynkxQZwogeeSJpG1yA4XjdEWKMHaNJ1OfPi7ppq/Hu9zm9+7
         /MMg==
X-Forwarded-Encrypted: i=1; AJvYcCUkxXZ6WAoAl9xtg4guGr+O8srX1tlTGdd9pEVjQJ/SZXP+dS6UQOvhLVagH+aghLCHauvLBCpcJTZfHXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQPV8+4P5jwhOdAwekmZ+KxmqscKAQjTnAzARhF86+7vqyZXI
	i4yw1opUDsLBcxRE3D6KTvMmasapCuaMB5im8B40P6SFlW5oFN520TkhN5bzYHI=
X-Gm-Gg: ASbGncvJQRtnuUHTx4ZGs4D+DD963MgrKdBtnIjIE9sDwcM8b9rOTDeFx239MuwL69v
	vzalZOby6Ze3vXP1UJ0UW/iVw6PT3AuLcTXwEuDPzzvo7sdm3yi/gp3MdQZBTnr+xpwmjCxjgrN
	3O4UeqHYldE/3Spo1nk3rHjjhXabHIi2lrgJ5ivHd5pna/Q4bqsbfWNgcCOxG74Gq6jodKl580Q
	z4r5SLLSJpHoZwekPDvzyKRgCqWTYSs1GOwq+51w/Ds6ZfDJZMgpVtGzRiAYucONj3Tt1mr62l2
	EaFXm4CvHHo=
X-Google-Smtp-Source: AGHT+IH9SW/pdV7h8DM8hhMdlVo7eAi+ZpulgGkYCwExK/ruoerrE45EI0PzuAnOZl9Ur3dBColvag==
X-Received: by 2002:a92:c243:0:b0:3d0:353a:c97e with SMTP id e9e14a558f8ab-3d13e2e3680mr28768365ab.10.1738950369861;
        Fri, 07 Feb 2025 09:46:09 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e9a3fd5sm8288925ab.67.2025.02.07.09.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:46:09 -0800 (PST)
Message-ID: <ad55978e-4356-494e-8cda-9e6487344768@kernel.dk>
Date: Fri, 7 Feb 2025 10:46:08 -0700
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
 <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk> <87h656n3r6.ffs@tglx>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <87h656n3r6.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/25 2:48 PM, Thomas Gleixner wrote:
> On Thu, Feb 06 2025 at 13:05, Jens Axboe wrote:
>> On 2/6/25 9:18 AM, Thomas Gleixner wrote:
>>> On Wed, Feb 05 2025 at 11:45, Jens Axboe wrote:
>>>> On 2/5/25 3:55 AM, Nam Cao wrote:
>>>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>>>> index ceacf6230e34..936f8b4106cf 100644
>>>>> --- a/io_uring/io_uring.c
>>>>> +++ b/io_uring/io_uring.c
>>>>> @@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
>>>>>  			goto out_wake;
>>>>>  	}
>>>>>  
>>>>> -	iowq->t.function = io_cqring_timer_wakeup;
>>>>> +	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
>>>>>  	hrtimer_set_expires(timer, iowq->timeout);
>>>>>  	return HRTIMER_RESTART;
>>>>>  out_wake:
>>>>
>>>> The timer is known expired here, it's inside the callback. Is this
>>>> really necessary or useful?
>>>
>>> It's not strictly required here, but in the end this allows to make the
>>> .function member private, which prevents stupid code fiddling with it
>>> without proper sanity checks in the debug case.
>>
>> While that makes sense, this is also a potentially hot path for min
>> timeout usage, which with small timeouts for batch/latency reasons
>> can be run tens of thousand times per second. Adding a lock and IRQ
>> dance would be counter productive.
> 
> I fundamentally hate the fact that C does not enforce encapsulation in
> the first place. :)
> 
>> How about we just add a comment on why this is fine, rather than
> 
> Comments are the worst of a solution as you know.

Sure I don't disagree - this is just my way of attempting to be nice and
suggest alternatives, as I don't like this patch.

>> slow down a case that's perfectly fine by wrapping it in something
>> much more expensive than a simple memory write? Or perhaps have
>> a basic helper to set it that doesn't do the unnecessary irq lock
>> guard? That would still allow you to make .function private.
> 
> The right solution is to add a hotpath helper, which falls back to the
> more expensive variant with some anyway expensive debug option, or make
> the expensive part of hrtimer_update_function() depend on that debug
> option in the first place and otherwise fall back to a simple store.
> 
> The latter is the right thing to do. Let me fix that up in mainline.

Yep exactly, this is the way. Thanks!

-- 
Jens Axboe
