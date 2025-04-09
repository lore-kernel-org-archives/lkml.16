Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAF193062;
	Wed,  9 Apr 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184994; cv=none; b=Gvng/yRzpXijOg3UKQ5Fg7BF0KJSbqmwyQ2nJHQl1RHvccVOa9ri7R+sTg2UUc/MVtScvZbhm83ClVX8tzsXTtXhJYgGqOwqlzfhFdAE5/hN3+XGGXLQ9pqOTpxD/7+L1dTsCkYOXr+ZTl/Kp8RaUajjM5AxNpRvWNiWz9NIEzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184994; c=relaxed/simple;
	bh=e39jX18F+yRudrjwHDrwohALMBF6CNPKa8yNt+usdRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EzBQHPP37mUTsANFFQxZ9FhaAJaZA2OiUyFxKidD68GDPIXrywqtWupqqUvmmeBuztd3p8kQpxOzQbddyXqs5TKs4O/9ZASa7d568qNRjeQ5e+LCVSg98lgiEYwIC+HuOoKJ/bKNWnq5UHC8kNO9g4HdeOHYi8px4B9B/SlHfOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUkVqy0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUkVqy0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BB1C4CEE3;
	Wed,  9 Apr 2025 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744184993;
	bh=e39jX18F+yRudrjwHDrwohALMBF6CNPKa8yNt+usdRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BUkVqy0mCr78KM+tQ741crVUGsUrKWQ5qKnPSdCJNO1TCK64j8tbim4gtq17dkjQ+
	 hKpmiW0Z06gT1YO6Bv04f6dQ5nJE0fNc6863AbXuL3XE8EJV3S3EX3F3bUNcTEHG7y
	 DXYGsU7jajHCh2ZmG9UFw8jXPidAd47UK3RQpIzQK58+1vXe48d+u/mR2wdR/CFQlV
	 P085PuPiyEp/DKu4CBTCr8xhChcU5rhRGBuvXAB0Gje1irZMeNnLooUD8AWMGFg+Ut
	 SONaeKZxvUqIi8e6G23afRVqrc+J2LYhz8h2yOOBFF6lkwsMyiFYHvAy2O6wTX/ejg
	 89CnuAGjqx8xg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 2/6] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <0baafb97ec786c01c1d44270dd211537105922b6.camel@redhat.com>
	(Lyude Paul's message of "Tue, 08 Apr 2025 17:55:54 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<AVQT2wHP9t48ZH5r3ywLh-pwv0IGUraoDxWO8KXcxL_y3mE-0YmWlQjLMvP6JBYxG3_1SYJL4Fxp1jc788HniA==@protonmail.internalid>
	<20250402214109.653341-3-lyude@redhat.com> <87v7rej2n5.fsf@kernel.org>
	<ofkrywngVbnZefTyPMlUmu-wcbxEbFB0MAOMAgFOsTMwFjfpEYJqQAFBP14MabYmHMaDBWkB1rBgSxGCJOyy_A==@protonmail.internalid>
	<0baafb97ec786c01c1d44270dd211537105922b6.camel@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 09:49:38 +0200
Message-ID: <87lds993l9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> On Tue, 2025-04-08 at 13:47 +0200, Andreas Hindborg wrote:
>> "Lyude Paul" <lyude@redhat.com> writes:
>>
>> > With Linux's hrtimer API, certain functions require we either acquire
>> > proper locking to call specific methods - or that we call said methods from
>> > the context of the timer callback. hrtimer_forward() is one of these
>> > functions, so we start by adding a new HrTimerCallbackContext type which
>> > provides a way of calling these methods that is inaccessible outside of
>> > hrtimer callbacks.
>>
>> Based on tglx comment, we should be able to call this function if the
>> timer is stopped and we have a unique ownership of the timer. Do you
>> want to add that? If not, could you add a note about this somewhere?
>
>
> Happy to! So, I think if we were to add a function for this I assume we would
> want something like this?
>
> fn forward(&mut self, now: Instant, interval: Duration) -> u64 {
>     self.cancel();
>     /* Do actual forward stuff here */
> }
>
> Of course with some documentation pointing out that this function will stop
> the timer if required.

Yes, something like that. My first thought was to check if the timer was
running and return `Err` if that is the case. But it might be more
simple to just call `cancel`. What do you think?


Best regards,
Andreas Hindborg


