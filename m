Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F042C3242;
	Tue,  3 Jun 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968249; cv=none; b=RNTX61cucnaITNHBDma6VmX/QINM3kAfxHZX6SzG4o06H90w+QHaIPYX2hIaT0W8FlSVZQ6UGamWt7oesF7Pm/4AKYLntHdmAksEdzjOMC6jU+Puha142DOrXGdX69jA6imq/x5wOkoxtXD4digGA2S2RJFDN+uRgK80K2ZxLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968249; c=relaxed/simple;
	bh=PCgIhnSep9ViZT7n3gtixMlm7RcFhoDpPDAgoGLiszQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g7L5efHDNmzHtZu3xonb1qxrocVrRGvdwc8AquxJY7gAq5pWK6Y1nUC/La32iAS6MmIwU2hEqigraYPo9bgT0tre8rFme+rXVNQAi+Rg/jaJ8F6RaUSFCjtNzWAO1+2qUblzzTgELYoaM4sfK48cJR0/U4xamdWqQ1xXChAvsAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HreULZbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HreULZbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63145C4CEED;
	Tue,  3 Jun 2025 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748968249;
	bh=PCgIhnSep9ViZT7n3gtixMlm7RcFhoDpPDAgoGLiszQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HreULZbPDfk3TBXQbL9/w0OT9KKCHdpBsD1+hbkstbIXJ8yqeztuc2qkGtaWR+E99
	 S0psa+J+rn83V7jYKY76qWCFXJufchwkdym/osvV3HlGdnqkuyk6SJAVJVoTj+6iI+
	 v0Xn27Ifw49fGZYGiTwiEaLwK20S1tNoMcqvLNpVUBVhvv9FCNUznthxe2QSQHDy5M
	 0VioQPWqAW4IgsIT1CDw4qO7xCABZJKX8W2V4/yzUPEZUaWqb1a09m7pPcjRa785sH
	 Cd+cvFSTjBqV+pKCoT9xCxedI8+GKrlPUdu6PDCUd+30ADBIV1vjx9VT3Cj3Axv1nL
	 Y9iH/d4HxhP+Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
In-Reply-To: <20250603.230815.1426696742567640092.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 03 Jun 2025 23:08:15 +0900")
References: <HhGhHOv9fvWu0G7TihU0V5UMif0USODr5QagKogYlf-zE9P6uyPWYdEckCaFi747sl_vkLi5XDB_O9BFcwsjow==@protonmail.internalid>
	<20250504045959.238068-5-fujita.tomonori@gmail.com>
	<877c1u71uh.fsf@kernel.org>
	<GyIbRv_q5Qad7r6Z5oZhc5eB09uakUEWAT1aOts9fPiSSLHVLVqImq47rRPN20rQ0-rh-rtcx3-IiwtuEAirIA==@protonmail.internalid>
	<20250603.230815.1426696742567640092.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 03 Jun 2025 18:30:27 +0200
Message-ID: <87wm9s4wkc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Mon, 02 Jun 2025 14:41:10 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>> @@ -579,12 +604,16 @@ macro_rules! impl_has_hr_timer {
>>>          impl$({$($generics:tt)*})?
>>>              HasHrTimer<$timer_type:ty>
>>>              for $self:ty
>>> -        { self.$field:ident }
>>> +        {
>>> +            mode = $mode:ty,
>>> +            self.$field:ident
>>
>> How about:
>>
>>   mode = $mode:ty,
>>   field = self.$field:ident
>
> Works fo me.
>
>> So that there is some sort of red line when calling this. We could also
>> consider adopting another syntax for association:
>>
>>   mode: $mode:ty,
>>   field: self.$field:ident
>
> Looks fine too.
>
>> or something else like `<-` or `->` ?
>
> I personally prefer one of the two options above, but I'm also ok with
> `<-` or `->`.

OK, let's go with struct initializer syntax then (:). We can always
change it later if someone has a different opinion.


Best regards,
Andreas Hindborg



