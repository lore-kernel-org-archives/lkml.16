Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C520C476;
	Wed, 25 Jun 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839616; cv=none; b=AIwOY5ipbmVPILZFVpHunt1XPmrqal+/cdWnMFpb2KEgAkI746KBUeL4RgYJRBlcIt1hY6N6wGonTQsZ0SSk12Q07hQN/eOZ+3dHl5xuVDNrMGa4JUqc6czBk4X7Cj4vBLvziZbML01H/2nTgLv8HLwtbtNfhL8+qtGWNjoDkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839616; c=relaxed/simple;
	bh=WiO9wbmuRQglMGnSxCbiT39mRV8LV+F/4Gsxiq7r8WM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLQUaJTylbTGpH0H8brJsnVrs8FYQujNIj2CeX0ny9pe6e68i1fQnFs9NxtQEmTKtxxEts1fuMHJYF5p/3+qkTgTpn4+kr4V3ECXRFf/yHXZJeic0t+mBvewI5f5I1UZT3YobsEeQ7yBFEByyIwHrDyBmk/UtvrZ8PgkNUmv2qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSYTdI3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSYTdI3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1C7C4CEEA;
	Wed, 25 Jun 2025 08:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750839615;
	bh=WiO9wbmuRQglMGnSxCbiT39mRV8LV+F/4Gsxiq7r8WM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cSYTdI3V7H8B8kb7Z4Nc4BFyazrjKxLMBrsX760chgziT2jYW3vWvjlJMICyaJOKK
	 RXlA7ULrcbYnBM/WglkvCU1vMU+yr/0Nz6Kn/jKHjOi3AQhhLMoUhFb2Sz8muSDl56
	 6nJBSOgW5p5vmvJoI1BfKnn0ndWl7OS0+OfiFMfhEn2h9XLsQIaDrfozefYf6Hk+tH
	 LElOsOEuKgHaxtQOfABqo/7/xxM6MHx75npkqwEc4XyaFLU9OiPsqrHNsJ1+ANGmrL
	 rN8Flbt7UopDIpAOvgdRgjG5beJu27U8O6ZxvuEr8N8B+1BF2Yg3Fl353nnKEsUSfj
	 phJNxK6Gy5XGg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <miguel.ojeda.sandonis@gmail.com>,  <alex.gaynor@gmail.com>,
  <ojeda@kernel.org>,  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <20250625.082020.1714542193051382332.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Wed, 25 Jun 2025 08:20:20 +0900")
References: <20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
	<87o6ud2fbx.fsf@kernel.org> <87cyat2c8z.fsf@kernel.org>
	<94kOZwdYnRPRMO6SAHAvEFEygT4dU-njfBxTMC6BiPQ-u49pyL5hLgbLQBGOct1ruxVJPtYGJ0Dq0Ns2mh-sMQ==@protonmail.internalid>
	<20250625.082020.1714542193051382332.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 10:19:59 +0200
Message-ID: <877c102pxs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Tue, 24 Jun 2025 21:03:24 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>
>>>> On Tue, 24 Jun 2025 15:11:31 +0200
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>>> and already introduces pain for
>>>>>> others (and likely even more pain when we need to rename it back next
>>>>>> cycle), it doesn't look like a good idea to keep it.
>>>>>
>>>>> Ok, I'll drop it.
>>>>
>>>> Do you want me to send the updated hrtimer conversion patchset
>>>> (using as_* names)?
>>>
>>> No, I am just about finished fixing up the rest. You can check if it is
>>> OK when I push.
>>
>> I pushed it, please check.
>
> Thanks!
>
> The commit d9fc00dc7354 ("rust: time: Add HrTimerExpires trait") adds
> to Instant structure:
>
> +    #[inline]
> +    pub(crate) fn as_nanos(&self) -> i64 {
> +        self.inner
> +    }
>
> Would it be better to take self instead of &self?
>
> pub(crate) fn as_nanos(self) -> i64 {
>
> Because the as_nanos method on the Delta struct takes self, wouldn=E2=80=
=99t it
> be better to keep it consistent? I think that my original patch adds
> into_nanos() that takes self.
>
> This commit also adds HrTimerExpire strait, which as_nanos() method
> takes &self:
>
> +/// Time representations that can be used as expiration values in [`HrTi=
mer`].
> +pub trait HrTimerExpires {
> +    /// Converts the expiration time into a nanosecond representation.
> +    ///
> +    /// This value corresponds to a raw ktime_t value, suitable for pass=
ing to kernel
> +    /// timer functions. The interpretation (absolute vs relative) depen=
ds on the
> +    /// associated [HrTimerMode] in use.
> +    fn as_nanos(&self) -> i64;
> +}
>
> That's because as I reported, Clippy warns if as_* take self.
>
> As Alice pointed out, Clippy doesn't warn if a type implements
> Copy. So we can add Copy to HrTimerExpires trait, then Clippy doesn't
> warn about as_nanos method that takes self:
>
> +/// Time representations that can be used as expiration values in [`HrTi=
mer`].
> +pub trait HrTimerExpires: Copy {
> +    /// Converts the expiration time into a nanosecond representation.
> +    ///
> +    /// This value corresponds to a raw ktime_t value, suitable for pass=
ing to kernel
> +    /// timer functions. The interpretation (absolute vs relative) depen=
ds on the
> +    /// associated [HrTimerMode] in use.
> +    fn as_nanos(self) -> i64;
> +}
>
> I'm fine with either (taking &self or Adding Copy).

Let's wait for the whole naming discussion to resolve before we do
anything. I am honestly a bit confused as to what is the most idiomatic
resolution here.

I think taking `&self` vs `self` makes not difference in codegen if we
mark the function `#[inline(always)]`.


Best regards,
Andreas Hindborg



