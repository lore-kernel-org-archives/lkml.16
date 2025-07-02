Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DE23A994;
	Wed,  2 Jul 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445511; cv=none; b=TDVidu7rrf3CtwCt4WSODfTx2CBQAbxfUeUH4pf/U5+5NRNXXX/TH8TTFLvta0WB+aKFabnfTZ77Ur5YTlaOQS72EUu+z+xFW6nvHTgPXXDII4THrgW7GheHzq1czAUet67I1lSQgar/7b3+v/2xyIP2uzS3JFtaYAd3pdcKXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445511; c=relaxed/simple;
	bh=/BD6ftK2dVOrVX+f/NTVDY8jSsVIcRsoStomtlMlHxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dE+7oOhP89x6W0ara4Kx4UaKtflKw4gjVnKT7zhXKF0trLm9qSLNLGGB6UocrxS5A9OjVtQj1idUWXy5AM0KU+2r3U0MDoJqAL/MRV93BXOAsrVlUoe44NRzD9j7DysyGiCwAiBKzFZ8SJwXIesX6L89vDvWqmyFSLb5eQK9zqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MulSpAeo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MulSpAeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676C5C4CEEE;
	Wed,  2 Jul 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751445510;
	bh=/BD6ftK2dVOrVX+f/NTVDY8jSsVIcRsoStomtlMlHxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MulSpAeosrDskhirKu3/8QEEuXQeKVLGEUVgMRua0LiOyU4pJfWblcPgWw4tZz4N5
	 nIPmhSJQBQnxlN0eoO347rqcpL6WGzXLXQ0TgjAy3uUxT3vlgM3HWjdGu3OdlxREtU
	 XHC+p6ZNYgsMvpqV0EyR51nnIVFbOK+kAf8+hafA7/eN/2bVykGSVyRN2C3YDhEuyY
	 0GiK4ZWD38Ximb3a5WY/z8KNDfFhWwbFF58W3YW7MiXy9BXvrXroBbjJZAlZstpBHB
	 G6BkiuW0BPdLGHYgx3lk2PG0zwgtsksP9iVCXG2e+giwv9TzvojIgjJQNKoSuHhC2w
	 7YW+zH2HMn+3w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <aliceryhl@google.com>,  <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,
  <boqun.feng@gmail.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
In-Reply-To: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 01 Jul 2025 08:39:40 +0900")
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
	<CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
	<WFqBzZDwsggoxcPQzynlG5_2FqsVdmQlUKufvcDECQUsXJOPHCA4dzoAByNPpuPrAcBoeKoDSR9v3OkJxsYxNg==@protonmail.internalid>
	<20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 10:38:19 +0200
Message-ID: <87y0t7ugw4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Mon, 30 Jun 2025 15:33:31 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> On Mon, Jun 30, 2025 at 3:10=E2=80=AFPM FUJITA Tomonori
>> <fujita.tomonori@gmail.com> wrote:
>>>
>>> Mark the ClockSource trait as unsafe and document its safety
>>> requirements. Specifically, implementers must guarantee that their
>>> `ktime_get()` implementation returns a value in the inclusive range
>>> [0, KTIME_MAX].
>>>
>>> Update all existing implementations to use `unsafe impl` with
>>> corresponding safety comments.
>>>
>>> Note that there could be potential users of a customized clock source [=
1]
>>> so we don't seal the trait.
>>>
>>> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-arc=
hlinux/ [1]
>>> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> LGTM:
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks!
>
>> Though you're missing `` around [0; KTIME_MAX] in some places, which
>> may be worth adding.
>
> Andreas, would you like me to send v2 with the above changes?

I can add the ticks.


Best regards,
Andreas Hindborg


