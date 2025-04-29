Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9D46F3A8F7;
	Tue, 29 Apr 2025 01:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889132; cv=none; b=SP7C/0SDP7ax8RAtD5v2l4qpVYDv3RHmnE0SWCIYIAWwIEseGG9CtiMy0BsTh34vXQ1L6zGTdak4F3zB70xcbepEJEoNXMQI3BSPLLjj1Ogs5EFf9k+ygDhj8KZNOG4WXJWTdQ2hRW5Ap0wXUJ9voOEW6xwi9TDwwnvEoGJkmLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889132; c=relaxed/simple;
	bh=Q9b4sVwlvE/+7dP6V75FB09hLjeV79VYot7riEhWDWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=AeIra+kO79BWTDvvCnf/hPhDS02v+ioRSQdTS/yyCrKItP5C6rgkt5Jz8VUlT8Xso0XaP5/LUpQXlP+sS0rJRHQpXaDYd3uhk+DPV+BbvSHiELRZ0wRucWoSh5WAVg46AhDZUEowYZ1Bbz2lUPaTiSc2noPHrw2ToZkrCVk0q2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 76BC6601091EE;
	Tue, 29 Apr 2025 09:12:03 +0800 (CST)
Message-ID: <6de4bef3-35e7-474f-8232-d951f7732aa0@nfschina.com>
Date: Tue, 29 Apr 2025 09:12:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] alarmtimer: remove dead return value in
 clock2alarm()
Content-Language: en-US
To: John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <CANDhNCpBpwVd2vHf8PVxxcyaxEZqof92tgF3QxYXp3c+WAwLDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/4/29 07:03, John Stultz wrote:
> On Sun, Apr 27, 2025 at 4:35 AM Su Hui <suhui@nfschina.com> wrote:
>> 'clockid' only can be ALARM_REALTIME and ALARM_BOOTTIME. It's impossible
>> to return -1 and callers never check the value of -1.
>>
>> Only alarm_clock_get_timespec(), alarm_clock_get_ktime(),
>> alarm_timer_create() and alarm_timer_nsleep() call clock2alarm(). These
>> callers using clockid_to_kclock() to get 'struct k_clock', this ensures
>> clock2alarm() never returns -1.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>> v2:
>>   - No Change.
>>   kernel/time/alarmtimer.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
>> index 0ddccdff119a..e5450a77ada9 100644
>> --- a/kernel/time/alarmtimer.c
>> +++ b/kernel/time/alarmtimer.c
>> @@ -515,9 +515,9 @@ static enum alarmtimer_type clock2alarm(clockid_t clockid)
>>   {
>>          if (clockid == CLOCK_REALTIME_ALARM)
>>                  return ALARM_REALTIME;
>> -       if (clockid == CLOCK_BOOTTIME_ALARM)
>> -               return ALARM_BOOTTIME;
>> -       return -1;
>> +
>> +       /* CLOCK_BOOTTIME_ALARM case */
>> +       return ALARM_BOOTTIME;
> So, I think your change is a good one, as the error case of -1 is never checked.
> But it might be worth adding a WARN_ON_ONCE() if the clockid isn't
> CLOCK_REALTIME_ALARM or CLOCK_BOOTTIME_ALARM, just so there aren't any
> surprises if someone misuses the function.
Yes, it's better to add WARN_ON_ONCE().
Will update in v3 patch. Thanks for your suggestion.

Su Hui

