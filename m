Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6520B1E8;
	Mon,  3 Feb 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595439; cv=none; b=uXEKgLggNfgGQJUq9izUCKwP7r+4OcjU2x43I6MWJ//oPtHgp0LxgKngEVH4kp5P9SXaTJOv4sSFi4FGH80+LH9XTnZMxILN892wyrnR+QkI7U3196VnNcy1MSx7qZHzWGplFWcCL9Sj34yoru+RsaY1FlmgROSTS0+Dk8TA8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595439; c=relaxed/simple;
	bh=V9Up4tsXcu6GCvs5ZMA3XHIa1KmyWgU3IlPFeW/6bzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QRkAv133J8sxUVFvZw1640opbYnItBrH8m8iqKRPCBsNPv4jK+TxURPqRwgVj0XBzdNQx43ikbGzUX7I2hSpy6YDKHmYLHc6k64MuAxZEDIMXxKYo0eb5an+SmbcLqgSPHUV/JtwNMW9m2m6LaCLuqkYgPCVnAnt/nJx4H14JC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNn6JEGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNn6JEGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3E9C4CEE5;
	Mon,  3 Feb 2025 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595438;
	bh=V9Up4tsXcu6GCvs5ZMA3XHIa1KmyWgU3IlPFeW/6bzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mNn6JEGYImFNB1IH5FlOA9HdSrnKfhTsN/A22sO9caDPz4S2hB86dHtcbZ0ql11uE
	 Iw0BnOQejX0rLbwNgyrVbCIfv6+8HvyTvd+cUeX8bUujweVfkCRcrwa3ahXb5qecei
	 YwVvMotu7ZTfbffEz/gRV9PLvXoMFHUWs9boV41QQ8mAuGDF6eXEKcDYIZy2o32gXb
	 fVlH94Y7/1FDmbQfh9RTrx7MqhnruEcJolJ0wzOcMj4rD8/pSafYCN3IcvIigHnlDb
	 7V6Nck0gjWp4yiSSW2LyLJHk7C916GIkLs2eKscN78/f8E4jq4HgGorze0R3m0/fMo
	 iq6AVQ6oYuqTw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  "Lyude Paul" <lyude@redhat.com>,
  "Guangbo Cui" <2407018371@qq.com>,  "Dirk Behme" <dirk.behme@gmail.com>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/14] rust: hrtimer: introduce hrtimer support
In-Reply-To: <CAH5fLgg=Ub8gA4c+RDATVkcPcWSe+61Agyi5zje5uEeaOA4Rcw@mail.gmail.com>
 (Alice
	Ryhl's message of "Tue, 21 Jan 2025 14:33:08 +0100")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
	<YZxHBM_bz_CFCkCMTiQkSY-dbftsw5GgJprOMTQ72MYxkvbFvcWzKbdFoP1mQfAHJTs14ixppeTjkmJ0C3VhaQ==@protonmail.internalid>
	<CAH5fLgg=Ub8gA4c+RDATVkcPcWSe+61Agyi5zje5uEeaOA4Rcw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Feb 2025 12:41:02 +0100
Message-ID: <8734gvl0hd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, Jan 10, 2025 at 9:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> This patch adds support for intrusive use of the hrtimer system. For now,
>> only one timer can be embedded in a Rust struct.
>>
>> The hrtimer Rust API is based on the intrusive style pattern introduced =
by
>> the Rust workqueue API.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> +/// A timer backed by a C `struct hrtimer`.
>> +///
>> +/// # Invariants
>> +///
>> +/// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>> +#[pin_data]
>> +#[repr(C)]
>> +pub struct HrTimer<U> {
>
> nit: We usually use repr(transparent) instead.

`HrTimer` will have an additional field later in the series, and
`transparent` will not work.

>
>> +    #[pin]
>> +    timer: Opaque<bindings::hrtimer>,
>> +    _t: PhantomData<U>,
>> +}
>> +
>> +// SAFETY: A `HrTimer` can be moved to other threads and used/dropped f=
rom there.
>> +unsafe impl<U> Send for HrTimer<U> {}
>> +
>> +// SAFETY: Timer operations are locked on C side, so it is safe to oper=
ate on a
>> +// timer from multiple threads
>> +unsafe impl<U> Sync for HrTimer<U> {}
>> +
>> +impl<T> HrTimer<T> {
>
> You are inconsistent with whether the generic parameter is called T or U.

Will fix.


Best regards,
Andreas Hindborg



