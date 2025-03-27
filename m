Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C41DE2BC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743110870; cv=none; b=i93M1gi/nueZ3ZUrJnQLIuI7iRNAtTHW73C4p0DhbnwmmqdvbirCbWSBPzGfwAYYMCrrW9Ky2PpwBuecVCBTI+m9LAjDEtBAqacGjmTzS3Flh1uwDTzDoge0cj9wZCttJh0QR5REvaS8qy7T8EcqfbRNsi1POoqy2qMzEFAiOJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743110870; c=relaxed/simple;
	bh=tnsdbaKCgetTErXMm3oqyN3Aq/YOXGzETEQbowLhonk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKS+ROfMZz1ZcKrtJM9gmh3UGWXhPw1A6dDRfbc+mg3Mk8zz3lKLPXdW2UbepB4uWuDC8SwPDOGAmBkF05MCbWd+NuwZAsDKlOqoEWOg4ZtpGcV/F0xZA5Z6WBFBJyKatOGYjAyWrEX+Y7q45iWmFQjGKhNSyDid4hE0p3c94Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5h1A1q9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5h1A1q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D8DC4CEEB;
	Thu, 27 Mar 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743110870;
	bh=tnsdbaKCgetTErXMm3oqyN3Aq/YOXGzETEQbowLhonk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5h1A1q9jMEM4yiQ0LMvraHK7abyGUyR5vHDjdbSdSZBp4x7ijvW9Vgyn585aISM3
	 bXE9kJPW+MEB75rXDYumesm1RqlRPo5u58dEpD9jsbKtZPPB5qWfSRm/1OtRoaV5ju
	 bo6kkCAdzq9m9xr5sqcHj0RKV6cIN1WVGh+CMhW3rWU/LfgOMTd6T+jp3ruRL05lhB
	 Jimr7X2x2l9jq3OpjvfeGnc7Pf9C28dCkl7zrRk58Z10lteMtTTto8n1HS0JDpn7+P
	 mylOFhAK8euUxEZ0c3YAWQQrnMyWSXEKYQemOPq5CGLWl+S5b5vP+CF0DjFK+0A8m7
	 VgJ/PSh3PudhQ==
Date: Thu, 27 Mar 2025 22:27:46 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Fernando Fernandez Mancera <ffmancera@riseup.net>, x86@kernel.org,
	linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
	mhkelley@outlook.com
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off the
 PIT
Message-ID: <Z-XC0u7o-XSAUpYw@gmail.com>
References: <20250327152258.3097-1-ffmancera@riseup.net>
 <87ecyixuna.ffs@tglx>
 <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net>
 <878qoqxjew.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qoqxjew.ffs@tglx>


* Thomas Gleixner <tglx@linutronix.de> wrote:

> On Thu, Mar 27 2025 at 20:54, Fernando Fernandez Mancera wrote:
> > On 3/27/25 6:15 PM, Thomas Gleixner wrote:
> > I followed Ingo's suggestions on V1 [1]. It made sense to me, if the 
> > problem was the one described on the commit message. So, is there 
> > consensus about this being a false positive? If so, I will send a new 
> > patch just suppressing the warning as suggested below.
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
>     - assumed that the author of the offending commit made
>       any assumptions at all (pun intended) -
> 
> that invoking clockevent_i8253_disable() with interrupts enabled at this
> point in the boot process is harmless, is completely correct.
> 
> Therefore I really prefer to have this described as:
> 
>   x86/i8253: Invoke clockevent_i8253_disable() with interrupts disabled
> 
> with a proper explanation that the current code makes lockdep
> (rightfully) complain, but that it has no actual deadlock potential in
> the current state of the code.
> 
> That means the code change serves two purposes:
> 
>    1) Prevent lockdep from detecting a false positive
> 
>    2) Future proving the code
> 
> #1 is a matter of fact with the current code
>  
> #2 is valuable despite the fact that PIT is a legacy, which won't
>    suddenly roar its ugly head in unexpected ways.
> 
> I know that's word smithing, but I'm observing a increasing tendency of
> "fixing" problems based on tooling output without any further analysis.
> 
> I'm absolutely not blaming you for that and your patch is fine, except
> for the technical details I pointed out and the change log related
> issues.
> 
> Though I really want people to sit down and think about the factual
> impact of a tool based problem observation. Tools are good in detecting
> problems, but they are patently bad in properly analysing them. And no,
> AI is not going to fix that anytime soon, quite the contrary.
> 
> Taking the tools output at face value leads exactly to what triggered my
> response:
> 
>   "fix possible deadlock when turning off the PIT"
> 
> which is misleading at best as I explained before.
> 
> Wording matters, but maybe that's just me...

I fully agree with all of your suggestions.

I suggested a save/restore cycle primarily because I wasn't 100% 
certain that IRQs were always enabled in that call chain, and a 
superfluous save is better than an unintended IRQ-enable. So it was a 
chicken-bit. :-/

Your title suggestion is also much better, it makes it clear that this 
is not a potential deadlock.

Wording matters.

Thanks,

	Ingo
