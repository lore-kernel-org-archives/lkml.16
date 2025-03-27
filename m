Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29438462
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111379; cv=none; b=B/0D6V26gZ5bKmJIlRmc6tzXklzP/ozk2Wo3HDUtIIGtDBwC6dWWEaWXc2rT0wGVgfrv7FnEnCjLnsxoD7aNPsW5MXpc7IV6cgySQF99lvsEaX6FjSsGWPN07BtwEpqhLyHr+kXiHfXJ6kHDUzh7TzbNepeGh7IW7fuRo9QYyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111379; c=relaxed/simple;
	bh=VvaSZ6oz7OgT5erU3dvvAlsjxbRDxfhF3mCS5Izc+lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlYEWwlW42xRBNF1LtDVt4vitdeq4lTjtNeb1kvEioQlMSf40HgW1sIZryhvvHsUpmJLXetjMZe2lpTfS9n2aniJ6JhjTb7WgcNgCTgdRmvn9U6Ol5sQO6/WT5G1B84HAU6Hd4RdLiyLB3SKk7vHWvF0sRM1FaeQa+FoVRYo1KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=on2bK7vL; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="on2bK7vL"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4ZNxmV25QMz9wm0;
	Thu, 27 Mar 2025 21:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1743111370; bh=VvaSZ6oz7OgT5erU3dvvAlsjxbRDxfhF3mCS5Izc+lA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=on2bK7vLkGMfhJbqQdSiSygk36SV6YGR60aAiMM3cfBS3ZufFRj21Uhuiac7JamTT
	 YMIa7aUbRpCrgyH/g3CzoHFAs5hTNMKH8EvPIXqefe5akFiJI5zz5RJI28gQlHZ4z3
	 bq38eyimm5IUosDOHd5aaOl8Cd56jUID3tIFnW1w=
X-Riseup-User-ID: 58837638CCEF35F27D7AD19EF7CCB5A34D0AFC537E57C70B3ECE883DD389D17A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4ZNxmR6cBdzFvwk;
	Thu, 27 Mar 2025 21:36:07 +0000 (UTC)
Message-ID: <742283a6-221f-4d87-ac18-90133c6df735@riseup.net>
Date: Thu, 27 Mar 2025 22:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off the
 PIT
To: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org
References: <20250327152258.3097-1-ffmancera@riseup.net> <87ecyixuna.ffs@tglx>
 <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net> <878qoqxjew.ffs@tglx>
Content-Language: en-US
From: "Fernando F. Mancera" <ffmancera@riseup.net>
In-Reply-To: <878qoqxjew.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/03/2025 22:17, Thomas Gleixner wrote:
> On Thu, Mar 27 2025 at 20:54, Fernando Fernandez Mancera wrote:
>> On 3/27/25 6:15 PM, Thomas Gleixner wrote:
>> I followed Ingo's suggestions on V1 [1]. It made sense to me, if the
>> problem was the one described on the commit message. So, is there
>> consensus about this being a false positive? If so, I will send a new
>> patch just suppressing the warning as suggested below.
> 
> I personally don't care whether there is consensus simply because it's a
> matter of fact, that at the point where pit_timer_init() is invoked there
> can't be concurrency on the lock by any means. Therefore it _is_ a false
> positive.
> 
> Ingo is right that pit_timer_init() should disable interrupts before
> invoking clockevent_i8253_disable() and not inflicting the irqsave() on
> the callback function.
> 
> But it should do so for the sake of consistency and correctness and not
> to "fix" a impossible deadlock or an magically assumed invalid assumption.
> 
> The assumption,
> 
>      - assumed that the author of the offending commit made
>        any assumptions at all (pun intended) -
> 
> that invoking clockevent_i8253_disable() with interrupts enabled at this
> point in the boot process is harmless, is completely correct.
> 
> Therefore I really prefer to have this described as:
> 
>    x86/i8253: Invoke clockevent_i8253_disable() with interrupts disabled
> 
> with a proper explanation that the current code makes lockdep
> (rightfully) complain, but that it has no actual deadlock potential in
> the current state of the code.
> 
> That means the code change serves two purposes:
> 
>     1) Prevent lockdep from detecting a false positive
> 
>     2) Future proving the code
> 
> #1 is a matter of fact with the current code
>   
> #2 is valuable despite the fact that PIT is a legacy, which won't
>     suddenly roar its ugly head in unexpected ways.
> 
> I know that's word smithing, but I'm observing a increasing tendency of
> "fixing" problems based on tooling output without any further analysis.
> 
> I'm absolutely not blaming you for that and your patch is fine, except
> for the technical details I pointed out and the change log related
> issues.
> 

Thanks for taking the time to write this extensive reply. I agree on the 
arguments provided here.

> Though I really want people to sit down and think about the factual
> impact of a tool based problem observation. Tools are good in detecting
> problems, but they are patently bad in properly analysing them. And no,
> AI is not going to fix that anytime soon, quite the contrary.
> 

I agree on this statement. I just wanted to remark I didn't know that 
during the pit_timer_init() call can't be concurrency on the lock at 
all. I do know now, tho. Thanks for explaining.

I will provide a new patch with your suggestion to use scoped_guardian() 
and wording the commit message and description properly.

Thanks,
ffmancera.

> Taking the tools output at face value leads exactly to what triggered my
> response:
> 
>    "fix possible deadlock when turning off the PIT"
> 
> which is misleading at best as I explained before.
> 
> Wording matters, but maybe that's just me...
> 
> Thanks,
> 
>          tglx

