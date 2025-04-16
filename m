Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25175230985
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785908; cv=none; b=prmW5AvcLt93E57r4DTPTTUc0z9VLYDaTCbMgHq3RRcGI+N1xSrMV81Bkpct/fv86m9i5FzbbXbXCw1VezOjvRGYsT/jjjABHe0ZNaDaGwKcL0Gl6QPnWbD2//VCt6GxhWvcjQREh6tPpoz3i17QJ1mTmhJEf6lLsRIPt5gFqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785908; c=relaxed/simple;
	bh=WfzOLZUW8jGBu5YKDQaVhtqhXW2tRz23DmS9gS7hSBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4AKi/2OQnqF8nkbzk3+SqZt0wjd7wtSGPYj/7oQBOvDxAsgMycULh9mGkEZKgaNRbSBpTk/xmMiN2zzIgseT7rKTR3UhpLZSjV0BbMjVB6ilbeGAFa2lhbNFcKE4JXSS9v2iwDzrNgOLwbVaDY5qvB79WG7CuntMzY8OK/mUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Zcs2Q6WTgz4f3jYS
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:44:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 992ED1A0359
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:44:54 +0800 (CST)
Received: from [10.67.108.244] (unknown [10.67.108.244])
	by APP4 (Coremail) with SMTP id gCh0CgDHK2DlUf9nxFOHJg--.59961S3;
	Wed, 16 Apr 2025 14:44:53 +0800 (CST)
Message-ID: <a56803dd-0e38-4edc-b1a1-f850246f210b@huaweicloud.com>
Date: Wed, 16 Apr 2025 14:44:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Fix watchdog may detect false positive of
 softlockup
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: joel.granados@kernel.org, song@kernel.org, dianders@chromium.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
References: <20250416013922.2905051-1-luogengkun@huaweicloud.com>
 <20250415193100.562d55b34851e8c9058c5658@linux-foundation.org>
From: Luo Gengkun <luogengkun@huaweicloud.com>
In-Reply-To: <20250415193100.562d55b34851e8c9058c5658@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgDHK2DlUf9nxFOHJg--.59961S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1xGw15tw1UWry8Wr1UAwb_yoWrZw45pa
	ySyFyayw4Utr18XrW3Jas7XFy8W348Xr45ta4DGw1rC3Z0kr1rJr1SkF4rKa9rurZxJr1Y
	qFWYqrZ7JayUtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1aZX5UUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/


On 2025/4/16 10:31, Andrew Morton wrote:
> On Wed, 16 Apr 2025 01:39:22 +0000 Luo Gengkun <luogengkun@huaweicloud.com> wrote:
>
>> The watchdog may dectect false positive of softlockup because of stop
>> softlockup after update watchdog_thresh. The problem can be described as
>> follow:
>>
>>   # We asuume previous watchdog_thresh is 60, so the timer is coming every
>>   # 24s.
>> echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
>> |
>> +------>+ update watchdog_thresh (We are in kernel now)
>> 	|
>> 	|
>> 	+------>+ watchdog hrtimer (irq context: detect softlockup)
>> 		|
>> 		|
>> 	+-------+
>> 	|
>> 	|
>> 	+ softlockup_stop_all
>>
>> As showed above, there is a window between update watchdog_thresh and
>> softlockup_stop_all. During this window, if a timer is coming, a false
>> positive of softlockup will happen. To fix this problem, use a shadow
>> variable to store the new value and write back to watchdog_thresh after
>> softlockup_stop_all.
>>
> Changelog is a bit hard to follow.  I asked gemini.google.com to clean
> it up and it produced this:
>
> : The watchdog may detect a false positive softlockup due to stopping the
> : softlockup detection after updating `watchdog_thresh`.  The problem can
> : be described as follows:
> :
> : ```
> : # Assume the previous watchdog_thresh is 60, so the timer triggers every 24 seconds.
> : echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
> : |
> : +------>+ Update watchdog_thresh (Kernel space)
> : 	|
> : 	|
> : 	+------>+ Watchdog hrtimer (irq context: detect softlockup)
> : 		|
> : 		|
> : 	+-------+
> : 	|
> : 	|
> : 	+ softlockup_stop_all
> : ```
> :
> : As shown above, there is a window between updating `watchdog_thresh`
> : and `softlockup_stop_all`.  During this window, if a timer triggers, a
> : false positive softlockup can occur.  To fix this problem, a shadow
> : variable should be used to store the new value, and this value should
> : be written back to `watchdog_thresh` only after `softlockup_stop_all`
> : has completed.
>
> I don't know how accurate this is - please check&fix it and consider
> incorporating the result?
>
>> --- a/kernel/watchdog.c
>> +++ b/kernel/watchdog.c
>> @@ -47,6 +47,7 @@ int __read_mostly watchdog_user_enabled = 1;
>>   static int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
>>   static int __read_mostly watchdog_softlockup_user_enabled = 1;
>>   int __read_mostly watchdog_thresh = 10;
>> +static int __read_mostly watchdog_thresh_shadow;
>>   static int __read_mostly watchdog_hardlockup_available;
>>   
>>   struct cpumask watchdog_cpumask __read_mostly;
>> @@ -876,6 +877,7 @@ static void __lockup_detector_reconfigure(void)
>>   	watchdog_hardlockup_stop();
>>   
>>   	softlockup_stop_all();
>> +	watchdog_thresh = READ_ONCE(watchdog_thresh_shadow);
> I expect a reader of this code will wonder "what's all this
> watchdog_thresh_shadow stuff".  Can you please add a few small comments
> to explain why we're doing this?

The following testcase may help to understand this problem.
---------------------------------------------
echo RT_RUNTIME_SHARE > /sys/kernel/debug/sched/features
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
echo 0 > /sys/kernel/debug/sched/fair_server/cpu3/runtime
echo 60 > /proc/sys/kernel/watchdog_thresh
taskset -c 3 chrt -r 99 ./test &
echo 10 > /proc/sys/kernel/watchdog_thresh &
---------------------------------------------
This testcase first cancels the throttle rt task. Change the value of
watchdog_thresh to 60, and run a rt task on cpu3. The final command will
be blocked because the kworker:3, smp_call_on_cpu will put work on it,
cannot be selected by the scheduler due to the existence of real-time
threads. A softlockup will be detected on cpu3 after a while. The
reason is the watchdog_thresh is changed to 10, but the watchdog_timer_fn
still runs every 24 seconds, because the kworker:3
has not chance to stop previous hrtimer on cpu3.

The above case indicates that updating watchdog_thresh before doing
softlockup_stop_all is insecure, although there is not rt task on cpu3,
once the timer irq arrives, a false positive of softlockup is reported.

What this patch does, is first update the new thresh to
watchdog_thresh_shadow, which acts like a temporary variable, and write
back to watchdog_thresh after softlockup_stop_all is finished. By this way,
no more false positive case will be reported.

>

