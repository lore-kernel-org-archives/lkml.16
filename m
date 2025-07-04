Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888491F463C;
	Fri,  4 Jul 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613641; cv=none; b=dqyHCqM+lQTIubBcy+jGoZm1qk4ygGgqAxIs1ScKFQl1j9lpcQaauIcJ9l43AU7EXZdtDlP1KkpmMWS9RYqwXMhXCaMlNZ9CWyqIy8AvYQIlEZtAU9GI9qz7dcNy52bk+jBcbqPz6kljfSMX67c47dnR+FNaI8zl1lOrASzqIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613641; c=relaxed/simple;
	bh=6GsPaRiKgeYVnDnqBL+zKJ43kvtFQgCU07RdluLCgVI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T4NVbsk2+EASgXikx19iXejpofSv5axF+8M4em9JYdFtWClyBwDaYouDVtrAoIW0XBigPfHxhDxmiDcwmAIbq9Qtu5L6jykc9+e7W/0KUtg0vLBjVvwaaF9RZnwZo0Ep8zHZmoVq/ZY32yhjGuddaPWRAr+MBJ/xciWJk50y0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXJAa5/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXJAa5/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC18C4CEE3;
	Fri,  4 Jul 2025 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751613641;
	bh=6GsPaRiKgeYVnDnqBL+zKJ43kvtFQgCU07RdluLCgVI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tXJAa5/P7SIMT/vVcFuovMsjkccf90PZrOyABdWwryeLd9sC7irxvVzG2R/ZMHF81
	 tBJOuqUs/v9/VoEOXFENGUO+Ve/8TTWNm1eIufhcGbPGQ/69apGtc9I1V6ZNGkTBPY
	 BUCsnYyiTB5IGjeHErhCwAfwdFXqZcYJfPetXh2s8Va3U+1IAYfARQH1Rq66wJC5tT
	 gKmigVtzugRSnYrOKMlm2uS7eik7ULbT8u14SWNpD5k3R/dntn5HD9P93a3Ixonkhw
	 hVIhKp5HuPhHS14902KJr76mmgh4YEFUL+KF7z31bjdsftrXuxCnBbnuqgDpsafPro
	 EO+8Zoet8uH6Q==
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
In-Reply-To: <20250626.091248.526065656918619245.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Thu, 26 Jun 2025 09:12:48 +0900")
References: <94kOZwdYnRPRMO6SAHAvEFEygT4dU-njfBxTMC6BiPQ-u49pyL5hLgbLQBGOct1ruxVJPtYGJ0Dq0Ns2mh-sMQ==@protonmail.internalid>
	<20250625.082020.1714542193051382332.fujita.tomonori@gmail.com>
	<877c102pxs.fsf@kernel.org>
	<ZFASmKV5PIQgMyCMtprnQhN2MklF9_-3RwUFGLemFqvv23Cm3vyKh-spm0PhKWFjc8vixGNYrAlz93Dw_ruczw==@protonmail.internalid>
	<20250626.091248.526065656918619245.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 09:20:29 +0200
Message-ID: <87h5zstoaq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Wed, 25 Jun 2025 10:19:59 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>
>>> On Tue, 24 Jun 2025 21:03:24 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>>>
>>>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>>>
>>>>>> On Tue, 24 Jun 2025 15:11:31 +0200
>>>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>>>
>>>>>>>> and already introduces pain for
>>>>>>>> others (and likely even more pain when we need to rename it back n=
ext
>>>>>>>> cycle), it doesn't look like a good idea to keep it.
>>>>>>>
>>>>>>> Ok, I'll drop it.
>>>>>>
>>>>>> Do you want me to send the updated hrtimer conversion patchset
>>>>>> (using as_* names)?
>>>>>
>>>>> No, I am just about finished fixing up the rest. You can check if it =
is
>>>>> OK when I push.
>>>>
>>>> I pushed it, please check.
>>>
>>> Thanks!
>>>
>>> The commit d9fc00dc7354 ("rust: time: Add HrTimerExpires trait") adds
>>> to Instant structure:
>>>
>>> +    #[inline]
>>> +    pub(crate) fn as_nanos(&self) -> i64 {
>>> +        self.inner
>>> +    }
>>>
>>> Would it be better to take self instead of &self?
>>>
>>> pub(crate) fn as_nanos(self) -> i64 {
>>>
>>> Because the as_nanos method on the Delta struct takes self, wouldn=E2=
=80=99t it
>>> be better to keep it consistent? I think that my original patch adds
>>> into_nanos() that takes self.
>>>
>>> This commit also adds HrTimerExpire strait, which as_nanos() method
>>> takes &self:
>>>
>>> +/// Time representations that can be used as expiration values in [`Hr=
Timer`].
>>> +pub trait HrTimerExpires {
>>> +    /// Converts the expiration time into a nanosecond representation.
>>> +    ///
>>> +    /// This value corresponds to a raw ktime_t value, suitable for pa=
ssing to kernel
>>> +    /// timer functions. The interpretation (absolute vs relative) dep=
ends on the
>>> +    /// associated [HrTimerMode] in use.
>>> +    fn as_nanos(&self) -> i64;
>>> +}
>>>
>>> That's because as I reported, Clippy warns if as_* take self.
>>>
>>> As Alice pointed out, Clippy doesn't warn if a type implements
>>> Copy. So we can add Copy to HrTimerExpires trait, then Clippy doesn't
>>> warn about as_nanos method that takes self:
>>>
>>> +/// Time representations that can be used as expiration values in [`Hr=
Timer`].
>>> +pub trait HrTimerExpires: Copy {
>>> +    /// Converts the expiration time into a nanosecond representation.
>>> +    ///
>>> +    /// This value corresponds to a raw ktime_t value, suitable for pa=
ssing to kernel
>>> +    /// timer functions. The interpretation (absolute vs relative) dep=
ends on the
>>> +    /// associated [HrTimerMode] in use.
>>> +    fn as_nanos(self) -> i64;
>>> +}
>>>
>>> I'm fine with either (taking &self or Adding Copy).
>>
>> Let's wait for the whole naming discussion to resolve before we do
>> anything. I am honestly a bit confused as to what is the most idiomatic
>> resolution here.
>>
>> I think taking `&self` vs `self` makes not difference in codegen if we
>> mark the function `#[inline(always)]`.
>
> I believe we've reached a consensus on the discussion about `&self` vs
> `self`.

But not on the function name, right?

>
> Miguel summarized nicely:
>
> https://lore.kernel.org/lkml/CANiq72nd6m3eOxF+6kscXuVu7uLim4KgpONupgTsMcA=
F9TNhYQ@mail.gmail.com/
>
>>> Yes, I would prefer taking by value. I think Alice mentioned earlier in
>>> this thread that the compiler will be smart about this and just pass the
>>> value. But it still feels wrong to me.
>>
>> If inlined/private, yes; but not always.
>>
>> So for small ("free") functions like this, it should generally not
>> matter, since they should be inlined whether by manual marking or by
>> the compiler.
>
>> But, in general, it is not the same, and you can see cases where the
>> compiler will still pass a pointer, and thus dereferences and writes
>> to memory to take an address to pass it.
>>
>> Which means that, outside small things like `as_*`, one should still
>> probably take by value. Which creates an inconsistency.
>
>
> I think that another consensus from this discussion is that the table
> in the API naming guidelines doesn't cover this particular case.
> Therefore, it makes sense to keep the current function name and move
> forward.
>
> Delta already provides `fn as_nanos(self)` (and drm uses in
> linux-next, as you know) so I believe that Instant should use the same
> interface.
>
>
> That table needs improvement, but reaching consensus will likely take
> time, it makes sense to address it independently.

I am still uncertain what guidelines to follow inside the kernel. Last
time I applied a patch in this situation, I had to remove it again. I
would rather not have to do that.

Perhaps the best way forward is if you send the patch with the naming
and argument type you think is best, and then we continue the discussion
on that patch?


Best regards,
Andreas Hindborg


