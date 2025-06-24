Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA11D52B;
	Tue, 24 Jun 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770705; cv=none; b=bKbgvGLtGRsD5C5zz4XVlm155DCLvlwiphWUKJnp8f91WCGOw4HslZw3NQoJ91yxVrgF5JSUeMOg/nF5URdXsvJpO37X1geiOad1wF0pc5gOmQbZVjCvv6m4iDkFL62igs+22xHoniwLMBkpvbIeTYdPDLHAYkcJVXwSSxqJ7RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770705; c=relaxed/simple;
	bh=rUp2fOKDJpDMtZn0YoSRwQK719FbzE6U72RDWbHVv/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gjSrIA8kG9Z6TRkXkHrnmpC8oBYB4OA9VeYE9vFaDnil41TI5cxS1dAWSynW2Jj9OMkXuSMA5mZPDg6bK5kEWaX2MOe0ilUTUIzojWfKO5UFY+7X7h+xXptJ/nDtFGmgi6VZyKdEfsD0BwyZfU/oh3H1UQiY3DG+oDfvG4LGanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqcu0/Ey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqcu0/Ey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4370BC4CEE3;
	Tue, 24 Jun 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750770705;
	bh=rUp2fOKDJpDMtZn0YoSRwQK719FbzE6U72RDWbHVv/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vqcu0/EyR0eCgSMNxiRCZzQ3W4IKKKrGcNYuYmrnMuwVW78rQMg5YFOSEQOnAHbCM
	 yE9SmB8n+X2b0GZA++16RWTAVArP/Sw9RrZZPi4mUMzaXfayEzQ7PhKPb77qO4vfat
	 lHQT6/aoCE6pFThSkPUFiQ+MyXG2HfU37JnpESBa4gQ8E0es+xnHQou4rWAQDWUrjk
	 12WpAvvpuJCbGij8xvDadOwF75s9rg3x0qNNXni0eTze3gv/6AWmhkqDsul6teGmSu
	 2r4Vfw3zK2mscOO4WfOw2j6EUT82jJv3JFdEbAXR44766vhdDvdTLElz+KLC1mf0RY
	 oGrqS2XUAynaQ==
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
In-Reply-To: <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 24 Jun 2025 14:24:54 +0200")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<175015666837.277659.5038961663728008472.b4-ty@kernel.org>
	<CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
	<87plet4cjq.fsf@kernel.org>
	<_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
	<CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 15:11:31 +0200
Message-ID: <87wm912sjg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jun 24, 2025 at 1:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> My plan is to merge it and go with `into_*`. There are pros and cons for
>> both `to_*` and `into_*`. If someone has objections, they can send a new
>> patch with rationale and we can revisit. Sounds OK?
>
> I would just drop (or revert) the patch. The issue was under
> discussion, and anyway it seems clear that `into_*` is not the right
> choice from both the cost and ownership perspectives that we were
> discussing in the other thread.

None of the options are the right choice. Cost and ownership _do_ line
up for `into_*` in this case. The mismatch is `into_*` is reserved for
`T: !Copy`.

>
> If this were not a rename and didn't had conflicts, then it wouldn't
> be a big deal. But given it is wrong

I do not think that is settled.

> and already introduces pain for
> others (and likely even more pain when we need to rename it back next
> cycle), it doesn't look like a good idea to keep it.

Ok, I'll drop it.


Best regards,
Andreas Hindborg


