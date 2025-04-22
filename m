Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352F26D4C3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358987; cv=none; b=KlBaMYQRi8NJZLulWwSWTr+J3VdBrnsI1PL0sP+tpRBO7rGsfZFW+7MNX70Ib/QWy4SuFdkYiOBnYM/8GLaRFi8dfLwx9aZ0xKBKsxJxKsuhHV/g+1oug+RyV1M/noN+XhNlL9/zKamroeNadcjeDR+iWoHzu6D+S7SNQYlz5Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358987; c=relaxed/simple;
	bh=PSveMKmbKopaLafFWPkHXgelq8Ze54eOl2JeyhQIcN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RoPYIbo5o8wcheM62W6za+vz54nIP4npMYDDc7ntHMv6xYw4ayjWCww2YL4UJpBZo+umpEFygjBmnCnqau8ZZwpLMFFE9LLPE3xkMamZbIlGnjSBDIBkmeBYJrMikFhmkVDu5zlNH9cjlFFFuw/tKdBWl0BeElHvJ3q3oa7/6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f2R/zFu2; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f2R/zFu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745358977; x=1745618177;
	bh=a0907KZjEiONY1HJ3I1Ta5IA8lDb/VDC/Rn3TFRG7mU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=f2R/zFu2NQrxPnXaejAkzAzrjcIZoCzXm7inz9/jGDZYDhffsRb9DbxE+eP6/jEhG
	 U4B5TS+3KEuMdCLn857yRp8L+X5SQQ++PSophicUcD3HL5NRfc7If9f8p90OxfjIwW
	 22yhG91gS7ZP+4NWJL2neSrwsqI66/LzkJtchplaWtflqkuz+rP7HdpLmsUDt3aNaq
	 yRbxmtmVgdw2b6dj8fj5b/kr+r11NI4F/FJqDioRVb3iSGuxTtpUP9I9aMDbBVfj1t
	 0TfUj+YBEOa4n/ivFWESPllkXZIv2+rwA9U3Cy5VZgKVPAxcrKnEYOU+F2xPZinfZQ
	 WYPE62uyceUCA==
Date: Tue, 22 Apr 2025 21:56:11 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] rust: pin-init: allow `pub` fields in `derive(Zeroable)`
Message-ID: <D9DI48C2NC3E.1NX1YBNTYAZ7L@proton.me>
In-Reply-To: <68080615.c80a0220.29b7e9.5b75@mx.google.com>
References: <20250421221728.528089-1-benno.lossin@proton.me> <20250421221728.528089-7-benno.lossin@proton.me> <aAchUjDJsukcCgKM@Mac.home> <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me> <aAekPSsKnQWJSBhQ@Mac.home> <D9D8YDFLD98E.D8DZEIIW4EN5@proton.me> <68080615.c80a0220.29b7e9.5b75@mx.google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5ba363816758db3c18a41606b5622302309df0e8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 22, 2025 at 11:11 PM CEST, Boqun Feng wrote:
> On Tue, Apr 22, 2025 at 02:45:22PM +0000, Benno Lossin wrote:
>> On Tue Apr 22, 2025 at 4:14 PM CEST, Boqun Feng wrote:
>> > On Tue, Apr 22, 2025 at 08:30:40AM +0000, Benno Lossin wrote:
>> >> On Tue Apr 22, 2025 at 6:55 AM CEST, Boqun Feng wrote:
>> >> > On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
>> >> >> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to th=
e
>> >> >> derive macro `Zeroable`.
>> >> >>=20
>> >> >> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e=
8311e52ca57273e7ed6d099144384971677a0ba
>> >> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> >> >
>> >> > Kindly request tests/examples for this patch and the following one
>> >> > (patch #7) ;-)
>> >>=20
>> >> If you send a patch, I'll take it :)
>> >>=20
>> >
>> > First, I'm happy to help improve pin-init, *if* I fully understand the
>> > changes and have the cycle ;-)
>> >
>> > However, here we are at the review process, so I need these examples t=
o
>> > close the gaps between the implementation and the usage to provide any
>> > meaningful review. There's no example/test in the commit log, the kern=
el
>> > code and (I've checked) the GitHub repo. Although I fully trust you, b=
ut
>> > there is no second source that could help me verify the changes easily=
.
>>=20
>> Maybe this is just a case of me being too familiar with the code, but
>> the change in this commit and #7 are very trivial. I'm not too sure what
>> I should use as an example because of this. I could do something like:
>>=20
>>     #[derive(Zeroable)]
>>     pub struct Foo {
>>         pub a: usize,
>>         b: u64,
>>     }
>>=20
>>     #[derive(Zeroable)]
>>     pub union Bar {
>>         pub a: u64,
>>         pub b: i64,
>>     }
>>=20
>> But I don't see a lot of value in adding those either as doc-tests or as
>> examples. Rust users normally expect that derive macros can handle any
>
> Since there is no user using them so far, I think these examples can
> serve as regression tests, that is, if someone accidentally breaks
> something to make them not working, we will immediately know.

That's fair.

>> kind of visibility for fields (there are exceptions of course, but they
>> don't apply to `Zeroable`).
>>=20
>> The union case is a bit different in that not all derive macros support
>> them, so I agree that the docs should reflect that better. I can add a
>> patch when I find the time, as I'm stretched pretty thin (hence I
>> suggested you submit a patch :)
>>=20
>
> Maybe you can open issues and see if others could help?

Done: https://github.com/Rust-for-Linux/pin-init/issues/47

>> > In this case, it may be special, because you're in fact syncing an
>> > external repo with the kernel part, i.e. the development is done, so i=
f
>> > we trust the external repo and of course, if no obvious error is
>> > founded during review (from the people who can review), we should merg=
e
>> > it in. If that's the case, this patchset is more of an "FYI" instead o=
f
>> > a development process IMO. Is this the case here?
>>=20
>> I'm not 100% sure on the workflow for pin-init. Ideally all changes made
>> to the pin-init repo can be ported 1:1 into the kernel. There are of
>> course smaller things such as commit references in commit messages that
>> need to be adjusted. But aside from such smaller administrative things,
>> the idea with the sync was to only have one singular version. If you
>
> I think this is fine and matches my previous understanding. I just
> wanted to be clear that normally if an example/test is requested for a
> patch from a reviewer, the usual response is not "hey, why don't you
> contribute one?" Of course the request has to been reasonble. In other
> words, we are doing a special workflow here.

Maybe I should have also initially stated that I'm a bit short on time.
For the visibility thing, it felt to me a bit like can you please add an
example for the function `fn add(a: u8, b: u8) -> u8 { a + b }`. ie too
trivial. I'll add more tests when I have time :)

---
Cheers,
Benno

