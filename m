Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B1A9017736;
	Fri, 25 Apr 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745549989; cv=none; b=LyPmNso9BP9oXgdKFpGqQrbbBvS7zJvqZe5oLJI5MzkT9rqqM2zx430TsH6MMMuo1Q9i0Hfi6pGnnymI/Inp/DGEr1bZCiixqPgCwISn7xb4mWcWkDfArIPoywsKkl/qSF7XmUCJaLefdVGLcadi5k652Ddq0XFhw0ZjcFHz3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745549989; c=relaxed/simple;
	bh=1noSq6+jV4vpoXsxBAPhm5+YkmZNnuvS+RNNNsXt2fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=Q/EtM9EhGIgz6QG0IhQisDFoKHMgKdBXoYzwEJ2GwElypQB23M/AOk5ZtWANBv7o/HjDIhnm0ldJJRNri5mpGKBQW23L6kIHpbYbw1NCKstGX7hT82tKj8Z/fnWlmNV7KPibIm+MPFKhg5E/XbKZwJRSyLWhSo/fon25zZiN1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id D9FA4601717E1;
	Fri, 25 Apr 2025 10:59:35 +0800 (CST)
Message-ID: <8f562746-15f3-4cb5-8f18-e916e8ae4718@nfschina.com>
Date: Fri, 25 Apr 2025 10:59:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to
 guard()
To: John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <CANDhNCq0yOXRF+6_JaMYo98o5uKP_af+UXJcJmzuFvX63RdTaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/4/25 07:59, John Stultz wrote:
> On Thu, Apr 24, 2025 at 7:48 AM Su Hui <suhui@nfschina.com> wrote:
>> There are two code styles for the lock in alarmtimer, guard() and
>> spin_{lock,unlock}_irqsave(). Switch all these to guard() to make code
>> neater.
>>
> Thanks for sending this out! A few comments below.
>
>> diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
>> index e5450a77ada9..920a3544d0cd 100644
>> --- a/kernel/time/alarmtimer.c
>> +++ b/kernel/time/alarmtimer.c
>> @@ -70,12 +70,10 @@ static DEFINE_SPINLOCK(rtcdev_lock);
>>    */
>>   struct rtc_device *alarmtimer_get_rtcdev(void)
>>   {
>> -       unsigned long flags;
>>          struct rtc_device *ret;
>>
>> -       spin_lock_irqsave(&rtcdev_lock, flags);
>> -       ret = rtcdev;
>> -       spin_unlock_irqrestore(&rtcdev_lock, flags);
>> +       scoped_guard(spinlock_irqsave, &rtcdev_lock)
>> +               ret = rtcdev;
>>
>>          return ret;
> This seems like it could be simplified further to just:
> {
>      guard(spinlock_irqsave, &rtcdev_lock);
>      return rtcdev;
> }
>
> No?
Yes, it's better. I can update this in v2.
>> -       spin_lock_irqsave(&freezer_delta_lock, flags);
>> -       min = freezer_delta;
>> -       expires = freezer_expires;
>> -       type = freezer_alarmtype;
>> -       freezer_delta = 0;
>> -       spin_unlock_irqrestore(&freezer_delta_lock, flags);
>> +       scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
>> +               min = freezer_delta;
>> +               expires = freezer_expires;
>> +               type = freezer_alarmtype;
>> +               freezer_delta = 0;
>> +       }
> I'm not necessarily opposed, but I'm not sure we're gaining much here.
I can remove this in v2.
>
>> @@ -352,13 +347,13 @@ EXPORT_SYMBOL_GPL(alarm_init);
>>   void alarm_start(struct alarm *alarm, ktime_t start)
>>   {
>>          struct alarm_base *base = &alarm_bases[alarm->type];
>> -       unsigned long flags;
>>
>> -       spin_lock_irqsave(&base->lock, flags);
>> -       alarm->node.expires = start;
>> -       alarmtimer_enqueue(base, alarm);
>> -       hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_ABS);
>> -       spin_unlock_irqrestore(&base->lock, flags);
>> +       scoped_guard(spinlock_irqsave, &base->lock) {
>> +               alarm->node.expires = start;
>> +               alarmtimer_enqueue(base, alarm);
>> +               hrtimer_start(&alarm->timer, alarm->node.expires,
>> +                             HRTIMER_MODE_ABS);
>> +       }
> Similarly, this just seems more like churn, than making the code
> particularly more clear.
I can remove this in v2 too.
> Overall, there's a few nice cleanups in this one, but there's also
> some that I'd probably leave be. I personally don't see
> straightforward explicit lock/unlocks as an anti-patern, but the guard
> logic definitely helps cleanup some of the uglier goto unlock
> patterns, which is a nice benefit.  One argument I can see for pushing
> to switch even the simple lock/unlock usage, is that having both
> models used makes the code less consistent, and adds mental load to
> the reader, but there's a lot of complex locking that can't be done
> easily with guard() so I don't know if we will ever be able to excise
> all the explicit lock/unlock calls, and the extra indentation for
> those scoped_guard sections can cause readability problems on its own
> as well.
Understand, thanks for your suggestions!
I will send a v2 patch to update these points later if there is no more 
other
suggestion.

Su Hui

