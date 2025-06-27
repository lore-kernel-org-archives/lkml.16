Received: from mail.cybernetics.com (mail.cybernetics.com [72.215.153.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FED2F1FCB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.215.153.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058435; cv=none; b=VmqPi1ajfFrlTQqTe4yluHGBYYfgZsCNK4VZElr78GDbcjRtDxNhO4tV7iK8qopi10vM95HJsj8T2wVfQWoUV3yFTWlCTsIsOCY0fI4ICy4lVRtJCsu1ecDVsR515DAFqz7u3bTFmTWJLbF6g8JJnN54/L2Y0cJzYfKN7pLkLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058435; c=relaxed/simple;
	bh=az9UDJ/gRYrH+H+VpLKHbbgzpUpzTZdg3XC6oevglL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltrdV0SYoPXYu8FqVHq5Nqg3NP9anDIEN0sNO24T+9Zfi55URJ3rgMggjzj5ra3Q6FTxv6jy1yqXPqfUWlLkz9ovhXoQDNa0PtamO9xoYHV4+0eHb/R6w4XcoNap/fquhl5wf3rYW9srrpAmKq/g3+lHJCIvbqtunuPH70trpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cybernetics.com; spf=pass smtp.mailfrom=cybernetics.com; dkim=pass (1024-bit key) header.d=cybernetics.com header.i=@cybernetics.com header.b=oG7GbBEH; arc=none smtp.client-ip=72.215.153.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cybernetics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cybernetics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cybernetics.com header.i=@cybernetics.com header.b="oG7GbBEH"
X-ASG-Debug-ID: 1751057502-1cf43938a63f6730002-xx1T2L
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id VjFT7On7ZH7HhrXb; Fri, 27 Jun 2025 16:52:04 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=uG6C9McWhgD8jz/jDL4hhtu4xyNYWs1GeWI7Pl4Qt4c=;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Content-Language:Subject:MIME-Version:Date:Message-ID; b=oG7GbBEHdx1h2HpMBb2N
	H8URICpKkEoGa2EEmk7VELHZPp/EDwEWeojhZFYKThVik0TNC3aOxpqiJliFTeOaxdB5IWcHMxO88
	6ztkDyvTy7DxqiLma2yIszQsRGDa/NFgyca+/xzJP4AD5KXVsjfndn5mhQQ2sCHCSJMXIUwves=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate SPEC SMTP 8.0.5)
  with ESMTPS id 14072462; Fri, 27 Jun 2025 16:52:00 -0400
Message-ID: <7a5eeed1-fb97-48d8-9297-d6f7370c5b15@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Fri, 27 Jun 2025 16:52:00 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel: make TIF_NOTIFY_SIGNAL and core dumps co-exist
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH] kernel: make TIF_NOTIFY_SIGNAL and core dumps co-exist
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Olivier Langlois <olivier@trillion01.com>
References: <76d3418c-e9ba-4392-858a-5da8028e3526@kernel.dk>
 <CAHk-=wgBMNC1ePTgqM6f0iBH94KE5_oHQYD2sqCbjev0KaZ6Kw@mail.gmail.com>
 <7fb2d8a6-951c-092c-ccaa-15522ae2ed01@kernel.dk>
 <6d8b3c24-12d1-043f-aec8-cfdc5b2e2786@cybernetics.com>
 <874k3qxc3i.fsf@email.froward.int.ebiederm.org>
From: Tony Battersby <tonyb@cybernetics.com>
In-Reply-To: <874k3qxc3i.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1751057524
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 5072
X-Barracuda-BRTS-Status: 1

On 3/22/22 11:04, Eric W. Biederman wrote:
> Tony Battersby <tonyb@cybernetics.com> writes:
>
>> On 8/19/21 10:59, Jens Axboe wrote:
>>> On 8/18/21 8:57 PM, Linus Torvalds wrote:
>>>> On Tue, Aug 17, 2021 at 8:06 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>> task_work being added with notify == TWA_SIGNAL will utilize
>>>>> TIF_NOTIFY_SIGNAL for signaling the targeted task that work is available.
>>>>> If this happens while a task is going through a core dump, it'll
>>>>> potentially disturb and truncate the dump as a signal interruption.
>>>> This patch seems (a) buggy and (b) hacky.
>>>>
>>>>> --- a/kernel/task_work.c
>>>>> +++ b/kernel/task_work.c
>>>>> @@ -41,6 +41,12 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>>>>>                 head = READ_ONCE(task->task_works);
>>>>>                 if (unlikely(head == &work_exited))
>>>>>                         return -ESRCH;
>>>>> +               /*
>>>>> +                * TIF_NOTIFY_SIGNAL notifications will interfere with
>>>>> +                * a core dump in progress, reject them.
>>>>> +                */
>>>>> +               if (notify == TWA_SIGNAL && (task->flags & PF_SIGNALED))
>>>>> +                       return -ESRCH;
>>>> This basically seems to check task->flags with no serialization.
>>>>
>>>> I'm sure it works 99.9% of the time in practice, since you'd be really
>>>> unlucky to hit any races, but I really don't see what the
>>>> serialization logic is.
>>>>
>>>> Also, the main user that actually triggered the problem already has
>>>>
>>>>         if (unlikely(tsk->flags & PF_EXITING))
>>>>                 goto fail;
>>>>
>>>> just above the call to task_work_add(), so this all seems very hacky indeed.
>>>>
>>>> Of course, I don't see what the serialization for _that_ one is either.
>>>>
>>>> Pls explain. You can't just randomly add tests for random flags that
>>>> get modified by other random code.
>>> You're absolutely right. On the io_uring side, in the current tree,
>>> there's only one check where current != task being checked - and that's
>>> in the poll rewait arming. That one should likely just go away. It may
>>> be fine as it is, as it just pertains to ring exit cancelations. We want
>>> to ensure that we don't rearm poll requests if the process is canceling
>>> and going away. I'll take a closer look at that one.
>>>
>>> For this particular patch, I agree it's racy. I'll see if I can come up
>>> with something better...
>>>
>> Continuing this thread from August 2021:
>>
>> I previously tested a version of Jens' patch backported to 5.10 and it
>> fixed my problem.  Now I am trying to upgrade kernels, and 5.17 still
>> has the same problem - coredumps from an io_uring program to a pipe are
>> truncated.  Jens' patch applied to 5.17 again fixes the problem.  Has
>> there been any progress with fixing the problem upstream?
>>
>> Reference:
>>
>> https://lore.kernel.org/all/8af373ec-9609-35a4-f185-f9bdc63d39b7@cybernetics.com/
>> https://lore.kernel.org/all/76d3418c-e9ba-4392-858a-5da8028e3526@kernel.dk/
> I am still slowly working on this.  (I was unfortunately preempted by
> some painful to track down and fix regressions elsewhere).
>
> When I was doubly checking to be certain I understood the problem the
> case you describe is one of the easy cases that needs to be handled.
>
> There is at least one more difficult interaction that is not solved by
> squelching task_work_add after PF_SIGNALED is set, and I am not 100%
> convinced that it is even correct to squelch task_work_add at that point
> in the code.
>
> The progress I have made to date that I am sending to Linus for v5.18 is
> the removal of tracehook.h which makes the code much more
> understandable.
>
> I think I have a general solution that I am planning to post after
> v5.18-rc1 that I have not tested yet on the cases that I know about,
> but I expect it will work.
>
> So I think that puts a good general fix 2-3 weeks out.
>
> This is quite possibly a case where perfection is getting in the way of
> the good, but I honestly can't judge anything except a fix that cleans
> up everything and is complete.  There are too many weird and subtle
> interactions that I don't understand.
>
> So I am going to continue concentrating on a good general solution so
> that the code is readable and makes sense.
>
> Eric
>
Again continuing this thread from March 2022:

This problem has never been fixed; it is still present in 6.16-rc3.  To
recap: core dumps from a program using io_uring get truncated,
especially if the core is piped to a program.  I have a forward-port of
Jen's patch that fixes it, but apparently that patch did not pass muster
with Linus back in 2021.  Any chance of getting this fixed properly
upstream?

Reference:

https://lore.kernel.org/all/8af373ec-9609-35a4-f185-f9bdc63d39b7@cybernetics.com/
https://lore.kernel.org/all/76d3418c-e9ba-4392-858a-5da8028e3526@kernel.dk/

Tony Battersby
Cybernetics

