Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2826B09A;
	Wed, 25 Jun 2025 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840116; cv=none; b=PwFcSLLFt9ofLwkwDnIuTI5WT6Sza+n+aS4T9lUC7cYwW1m8enlG+RxiHXIj3Cw7gHk12rjaXtZQANBEVLlLcVBNRBEsSoeqKgWLJxqOwXFvbF3Oa8URF9MllpyvFvZL6fhuZrjQIaGhRwIiSpXxpF0E3s5olArTo10abfQM/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840116; c=relaxed/simple;
	bh=TtBt5TwSr+p7YUqM2K1R6bsCYo3XrloA/UddjgCMi9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a2iTF6ZGriDUbgrc0b4E372nAyW0PJAIFcfePiDdO7L9wd2WqaXHGR+9uCJmkOp+b3zmUjZjJzOPUuMDF3UwFCUNxXyZxbSh0KmkChSLDaoL05TRjl3xlEholfXsGhzMQ8JOxFHX/yMp5JUIq6eS1sFb3hd8rKVDTHQfvAEZx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lfhd0Wbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lfhd0Wbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FA4C4CEEE;
	Wed, 25 Jun 2025 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750840115;
	bh=TtBt5TwSr+p7YUqM2K1R6bsCYo3XrloA/UddjgCMi9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lfhd0WbuD/TFVsMAbc0DsjImj/8NDXv1o+5+GXoyrnoz2nn/Bfuc9IvPG4ZyEV50M
	 JZJ4C/WOAmrcrZIkyF1bCjQjLfUgWtGXfUufMY0AHwL0CQx7xXcxKWlZUFoZMZDIrJ
	 u/CqI/zrmP85C1en2UJflvXYIfnOdW1WI7fR1kIavILQoGJv1ih6ECPN+o9XPI1/SH
	 7RCgPeSNTOKJUzATPMRfTacYs+ri0eVDciHKMoHJ30dBQ+mJoTSlVWPcySI6Zs6kYE
	 BUX1b9qxz9rpFupYuGVUjr9a0LqTK0siEYNvkq/213XL15sl/mcE6eUyNFv+W76r82
	 XXLEO9puJsNgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 24 Jun 2025 23:13:49 +0200")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<175015666837.277659.5038961663728008472.b4-ty@kernel.org>
	<CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
	<87plet4cjq.fsf@kernel.org>
	<_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
	<CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
	<HKvBY342fvKw91FLfL7ys_-l0-HkXpWd7dkWEHQnpHKO1zDCAwJJKlrKTu1g4JMg8xXsFCml7Hp82k1DOF1Nzg==@protonmail.internalid>
	<CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 10:28:07 +0200
Message-ID: <871pr82pk8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, 24 Jun 2025 at 15:11, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> None of the options are the right choice.
>
> That is fine (it is also what I have been arguing in the other thread
> and in previous times), but that does not imply `into_*` is not a bad
> choice if we really want to follow upstream.
>
>> Cost and ownership _do_ line
>> up for `into_*` in this case.
>
> No, ownership definitely doesn't line up: `Delta` is not `Copy` and
> there is no conceptual ownership transfer. While it says "owned ->
> owned", not being `Copy` is quite important here: the guidelines
> clarify in an example for a `Copy` type that if the input is not
> consumed then it should not be `into_*`.

OK, that makes sense. And you are right, `T: Copy` does not line up, I
must have read too fast.

>
> Sure, "Variable" cost means anything could go there, but that doesn't
> tell us much, i.e. if it was completely free, we could just as well
> pick `as_`, which would actually provide some information since you
> know it needs to be cheap.
>
> So the whole argument for `into_*` is... "it says 'Variable' cost so
> it lines up"?

You are right, there is no argument outside of "variable cost", thanks
for clarifying.

> Now, what I argued is that we may just as well define our own rules,
> since that table is confusing and doesn't cover all cases. If we do
> that, then you could propose things like "all owned->owned methods are
> `into_*`", which I think is what you are essentially implying here.

I would actually prefer that the rust-lang guidelines were clarified so
that we could just defer to those.

>
>> I do not think that is settled.
>
> If you think so, then the patch shouldn't be applied.

I understand.


Best regards,
Andreas Hindborg



