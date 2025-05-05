Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E324A066;
	Mon,  5 May 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447463; cv=none; b=deDPCE7smBmwPl+4xLms+tTy51h/yR+SraXw0QYLMZH3r/ZiMNZ4aKk+uf47Y5iBqhG/goBkbxdypfaq6gQVcXsBhzV441op2IMJhyFUpVH5rmO9tlKCD72qIKwBd3lpULXeWGndeORbkkIOemUr12LMUcKCbssj8lg01SCxY2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447463; c=relaxed/simple;
	bh=+c9qtL1XLrdv0KjM1c64k7CAIhE9e6+G1EbaLs6rza0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ov6GeatfUvlne/abBcgKwvstZfnNb65gppRlmKEU2vq92vvyTD/JdYylXxw6k6JV3JXM24a1RlmM2trquvMSmn2YXwbeYAySoXKdpHapJqkMiITzkcwPahRZO2IJ/+rXEyICZzUCPDC87dZ8MYkdqU5x9VRH4AG7iH7PXg+rDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPQrW9iO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPQrW9iO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D32DC4CEE9;
	Mon,  5 May 2025 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746447460;
	bh=+c9qtL1XLrdv0KjM1c64k7CAIhE9e6+G1EbaLs6rza0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lPQrW9iO5alAJxK83Y8+fEo/xiQA+Q+teKxHd3UG23liLxPqpJvSwszf5B9S/hTQS
	 yslfVuH1Rrb/mZ/2OIuL/NOrCFYwPf+DF3Dn1a6q7EYErzs6GMXjKZ786F7GWq6UPd
	 VGHA1nN63UgjGIqXe4iHpUiY2EYCbUbaPJcYjS5bbPXynyvbWFEQx6I/2IUvV+zwRC
	 FR9YAYf1xRxDH4TNH4xkGR/JqE72i/PHcyrrPcHjm6fByDWyb/QrUwiQAv8JKZCUsz
	 Zo9hAxspt4yNmFepQHoMWN3ZbLqWi0cRWtTRWHxUJeWrLMjYSHF0aemu1WWFnJpDcq
	 U3+CVYCrAMRfQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <a.hindborg@samsung.com>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,
  <chrisi.schrefl@gmail.com>,  <arnd@arndb.de>,  <linux@armlinux.org.uk>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
In-Reply-To: <20250505.201004.457132112950898883.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Mon, 05 May 2025 20:10:04 +0900")
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
	<8734djxrm0.fsf@kernel.org>
	<Wa3bx4DMYJMjJ594BFBTdQoD4WJzqhDRxMPUQfyH68XpKhZQ--5WEB8bTYEQuDm-pB1hl_PHqsm5wuv29WuIyg==@protonmail.internalid>
	<20250505.201004.457132112950898883.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 05 May 2025 13:51:56 +0200
Message-ID: <87tt5zwa03.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Mon, 05 May 2025 12:46:15 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
>>
>>> Avoid 64-bit integer division that 32-bit architectures don't
>>> implement generally. This uses ktime_to_ms() and ktime_to_us()
>>> instead.
>>>
>>> The timer abstraction needs i64 / u32 division so C's div_s64() can be
>>> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
>>> for this timer abstraction problem. On some architectures, there is
>>> room to optimize the implementation of them, but such optimization can
>>> be done if and when it becomes necessary.
>>>
>>> One downside of calling the C's functions is that the as_micros/millis
>>> methods can no longer be const fn. We stick with the simpler approach
>>> unless there's a compelling need for a const fn.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>>
>> Please consult recent MAINTAINERS file when you send patches. If you
>> intend for me to see a patch, please use my registered email address.
>
> Sorry, I did follow that for the last two patchsets (generalizing
> Instant and hrtimer), but somehow I messed up with this one.
>
> Should I resend v2 of this fix to the correct email address?
>
> https://lore.kernel.org/lkml/20250502004524.230553-1-fujita.tomonori@gmail.com/

No I got it from list, so it's fine for this one. But please stop CC'ing
the the Samsung address.


Best regards,
Andreas Hindborg



