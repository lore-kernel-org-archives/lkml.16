Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495A27FD51;
	Fri,  4 Jul 2025 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614108; cv=none; b=KWD8kKrfF7KkHaPjDlcFa87Pp0gVbu3NTmubb/w5+5h123hWp4zmsBupI5b+H6hNvE2VgE2f03KBrAhSu60poUT3I8IK4Ih8vQetOxpdoQ5u4uwYM6HU5APcfdq7eyvCoMJkAOrbfDP5g2xsIv79nw/LWXPrYv22EImGDzUb+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614108; c=relaxed/simple;
	bh=6n2PP2ZTzA/18ZM9VFBi3CenEPC3w/cFzHPouHpkZ6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZsJ0dQ69lDNbsIKg+ijqsfiKXfB67dyjORiSBKJYg5XV0vDmR2U+K7BBNAXQpuEHwy6JF2Y6rRGCUmhIHUJlhFFtsdsPwKu+L+vx0JDspJLa5TzaioWfWm4jhCPO5JAm5rNOPh0NEEACf2waxudtXs/+hDCJZ5TwD2dYIAN4cH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLtQdvhB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLtQdvhB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D41EC4CEE3;
	Fri,  4 Jul 2025 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751614107;
	bh=6n2PP2ZTzA/18ZM9VFBi3CenEPC3w/cFzHPouHpkZ6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uLtQdvhBa4dSklEu4ZemUybDjklMSlAq7Ga67ZmlGnmLzg7K8zYKPKlme2aF8QcH7
	 wvsY2aAUKAto7dtaO4EpDLR7L+iFK6s81BDf2C8kROL4iu3ryvQ/94ynLBxc4xBeiK
	 oWZg1ukaYUOczbbOlLBZcG+bwGd05N5Q5g8c1BlpBw/44JpIXNfDcsvAEwf457trds
	 qJphFmhRN2LZMZwDBbO6nT03/4A2g1RxFsXsYa7/p9FfslC1yQWi1uh/lapOxRZ+TZ
	 tToflbqikoSS/HWwkUkvBljBsxuIHc4DPqzKjQZTy0JTc3gCyOCm5E1R56qIV2gCZe
	 5CvLkVDPhIT7w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <miguel.ojeda.sandonis@gmail.com>,  <alex.gaynor@gmail.com>,
  <ojeda@kernel.org>,  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
In-Reply-To: <20250704.093618.1554080777023438310.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Fri, 04 Jul 2025 09:36:18 +0900")
References: <20250701001809.496389-1-fujita.tomonori@gmail.com>
	<874ivvvvjw.fsf@kernel.org>
	<CANiq72ntFkvN983N3x=AKMd6fW2yXb8d0LB1LT3c20oYmPCiGg@mail.gmail.com>
	<RnAWsCMnf4ZwlMnwtZY9XC95vcJ6S0QUiRGwx_H7juiXpbSze8NUfbrPDSkLdd_CZxXuxs2jykc_ZDes95SV5A==@protonmail.internalid>
	<20250704.093618.1554080777023438310.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 09:28:16 +0200
Message-ID: <87bjq0tnxr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Wed, 2 Jul 2025 14:22:48 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Wed, Jul 2, 2025 at 10:36=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>>
>>> I think this kind of test would be better suited for the new `#[test]`
>>> macro. Would you agree?
>>
>> I don't mind seeing the edge cases, since the behavior is mentioned in
>> the docs, just like sometimes we show e.g. the `Err`/`None` cases in
>> other functions etc., and it may help to further highlight that this
>> can actually return possibly unexpected values.
>>
>> It is also what the standard library does, at least in some similar case=
s, e.g.
>>
>>     https://doc.rust-lang.org/std/primitive.i64.html#method.saturating_a=
dd
>>
>> Maybe instead we can help making it a bit more readable, e.g. avoiding
>> the intermediate variable to have a single line plus using a `# use
>> Delta` to further reduce the line length?
>>
>> Also adding a newline between the "normal" case and the saturation
>> cases would probably help too.
>
> I've updated from_micros() based on the above suggestion - looks
> better to me. What do you think?
>
> /// # Examples
> ///
> /// ```
> /// use kernel::time::Delta;
> ///
> /// assert_eq!(Delta::from_micros(5).as_nanos(), 5_000);
> /// assert_eq!(Delta::from_micros(9_223_372_036_854_775).as_nanos(), 9_22=
3_372_036_854_775_000);
> /// assert_eq!(Delta::from_micros(-9_223_372_036_854_775).as_nanos(), -9_=
223_372_036_854_775_000);
> ///
> /// assert_eq!(Delta::from_micros(9_223_372_036_854_776).as_nanos(), i64:=
:MAX);
> /// assert_eq!(Delta::from_micros(-9_223_372_036_854_776).as_nanos(), i64=
::MIN);
> /// ```
> #[inline]
> pub const fn from_micros(micros: i64) -> Self {
>     Self {
>         nanos: micros.saturating_mul(NSEC_PER_USEC),
>     }
> }

From my point of view, I would like to see

  assert_eq!(Delta::from_micros(9_223_372_036_854_775).as_nanos(), 9_223_37=
2_036_854_775_000);
  assert_eq!(Delta::from_micros(-9_223_372_036_854_775).as_nanos(), -9_223_=
372_036_854_775_000);

  assert_eq!(Delta::from_micros(9_223_372_036_854_776).as_nanos(), i64::MAX=
);
  assert_eq!(Delta::from_micros(-9_223_372_036_854_776).as_nanos(), i64::MI=
N);

moved to a `#[test]` block. They do not provide value for me when
reading the docs. I don't know what the very large constants are and
what I am supposed to learn from those asserts. Maybe if the constants
had a name, or were expressed relative to another constant?

I think this one:

  /// assert_eq!(Delta::from_micros(5).as_nanos(), 5_000);

is fine in the documentation block.


Best regards,
Andreas Hindborg


