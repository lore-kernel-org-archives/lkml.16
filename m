Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA9545038;
	Thu, 19 Jun 2025 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337842; cv=none; b=OHJuy8CvymP1jEauZr5Zc6YKZL1y54GmveYnEXBLIqgZpuStF4QG4wJSPgSSPKp/PRLYi1UM1D76FwAfEQUJRFGjCribLaJ2p/FYM7IfKb5CNhrG0BlK3jSzQVUsOg2t8RigxoQGC8cD1xMQGuqu7vZDpQi3KAR91f9JiRXL2YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337842; c=relaxed/simple;
	bh=d9e5HJ45tr/MyEWNHOgb5I6HGDjVGDJUtmF7txoigI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AwqbG5wEH2cTL5OXEoR+IWz6LtW3vwRBEvQvPAbof7zHbkYwG7d9Xu+9fCFOeI1WsWKYCjomGAm+XXHZMh/1vhAwmOPV45oxUz+JDX9VSg/u3VMgPs1E39+CJco9ankd3gM0kZQMoGB/Idu/kZh1ZO+OXLodQhyDrNmdDD+B/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuAyVOJr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuAyVOJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5ECC4CEEA;
	Thu, 19 Jun 2025 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337841;
	bh=d9e5HJ45tr/MyEWNHOgb5I6HGDjVGDJUtmF7txoigI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DuAyVOJrGQGV11NldPvoe/547B0ypS3eGxON4wu2u9gNuHg7VJsT17LIUY/dRylOo
	 vFDJ1hD9eHIqiQNN2M5lnqCymi84iKlV3R84RVArLKYgJP3Y4DCVhFWAY2SPBMKeXR
	 6r91rAO4JByhSfcM7Zyu7tbO0yHRZ/vumw7A73GwgyCEu+H4iyJ22tv7tYsSzyZsi/
	 8U2Z8CUHoywLCc7thtEj/KWFPF14/+pcmhEmQCWPYqQt/cCtRDNc60yFHH3PEC4Eyz
	 QupBAJRp6qlCmSIbZVAjSCtHmH6xxvD1XOVqNYcCxy2NB1Xl235ipxBAfwTrc1AA95
	 8mYcE9BO//Srw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <boqun.feng@gmail.com>,  <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,
  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
In-Reply-To: <20250619.203319.1745503493999032815.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Thu, 19 Jun 2025 20:33:19 +0900")
References: <lliFJqf-6WmrKCArjCpOguz4jsHNtiF9GU0X4Ip5bE8NseTdlyKNH_7Bp_CyxNBD5ZR-Jbz0teNRS4UgV_7Z3g==@protonmail.internalid>
	<20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
	<87cyb084df.fsf@kernel.org>
	<HtpBC6KWSM5Y-x_Vzv2SvzKId8EC0R3fX9HB88gZQnIvy43YqYFDqAkXPUc1IQos2CoYljFnsJJDcGm-vep0TQ==@protonmail.internalid>
	<20250619.203319.1745503493999032815.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 14:57:12 +0200
Message-ID: <8734bv7utz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Thu, 19 Jun 2025 11:31:08 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>
>>> On Wed, 18 Jun 2025 21:13:07 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>>>
>>>>> On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>>>>>> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>>>>>> > Prevent downstream crates or drivers from implementing `ClockSourc=
e`
>>>>>> > for arbitrary types, which could otherwise leads to unsupported
>>>>>> > behavior.
>>>>>> >
>>>>>>
>>>>>> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, =
as
>>>>>> long as the ktime_get() can return a value in [0, i64::MAX). Also th=
is
>>>>>> means ClockSource should be an `unsafe` trait, because the correct
>>>>>> implementaion relies on ktime_get() returns the correct value. This =
is
>>>>>> needed even if you sealed ClockSource trait.
>>>>>>
>>>>>> Could you drop this and fix that the ClockSource trait instead? Than=
ks!
>>>>>>
>>>>>
>>>>> For example:
>>>>>
>>>>>     /// Trait for clock sources.
>>>>>     ///
>>>>>     /// ...
>>>>>     /// # Safety
>>>>>     ///
>>>>>     /// Implementers must ensure `ktime_get()` return a value in [0,
>>>>>     //  KTIME_MAX (i.e. i64::MAX)).
>>>>>     pub unsafe trait ClockSource {
>>>>>         ...
>>>>>     }
>>>>
>>>> Nice catch, it definitely needs to be unsafe. We should also require
>>>> correlation between ID and the value fetched by `ktime_get`.
>>>
>>> What's ID?
>>
>>
>>   pub trait ClockSource {
>>       /// The kernel clock ID associated with this clock source.
>>       ///
>>       /// This constant corresponds to the C side `clockid_t` value.
>>       const ID: bindings::clockid_t;
>>
>> The constant used to identify the clock source when calling into C APIs.
>
> Ah, I see. Sorry to ask another question, but can we require
> correlation between ID and the value fetched by `ktime_get`?

Yes, I think we should. As in, `ClockSource::ktime_get` must return the
time associated with the clock specified by `ClockSource::ID`.

>The value
> fetched by ktime_get is opaque, isn't it?

It is, but the implementation must still fetch the correct counter, right?
Not sure if it could lead to UB if it did not though =F0=9F=A4=B7


Best regards,
Andreas Hindborg



