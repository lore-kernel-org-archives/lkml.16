Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BB2C08C1;
	Mon,  7 Jul 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895917; cv=none; b=qdmkwDseYcEmGOIMBmJMgOfTLIbukaW4nXjud+jQCblR95ZlF3wVHfqaiEl3v5FLC7A/etJ2gAiyxdTLGgIFRz5nDxsCaRqTm5HR8BL0LVZa516VX9Mw1gV3MqGnPtFKN8WO1PfOaH+AzpFync+G9RldjJMV2Xr8ebGnIhr9pTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895917; c=relaxed/simple;
	bh=9YH64J8df+mV7SsYcJMl4LWc54kpzxJDKJgWscfJCY4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6hvGmvqmgnLK/9c5RYWhp1GiyDd6xPO0N0G40DdSFy5YV3lKd0DFz8KSUlMfaqkekAoT59B5s8rMBGkGvO2lYl58DIfPoseKzcj7T6Hu7Uqfl+xmvIWRHwuL/jUd5PK4/bw8UvxiAgjrfICYw+lOr4sZbQoHJRqWQQ0J6HBwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Q76cGeZs; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Q76cGeZs"
Received: from mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:8a4:0:640:a4f2:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id DC9A860C0B;
	Mon,  7 Jul 2025 16:39:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id EdgS1NTLsKo0-D3lddOQH;
	Mon, 07 Jul 2025 16:39:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1751895559;
	bh=ymQK026zKhq52+ZEOyApVIOybNr3zS2/dj01HDCd98E=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Q76cGeZsH2it4GI2mq/kv9uN907QH7KjfZw8gfijY7v0CIQEgJb9Xu97/YVVOl1Fb
	 vOyuKsKzojHrx+no6KJ5UHKRsP5B+BxUcArqJZSVWY2FYbVxDhqRYQyjm/qaO9R/eV
	 2BpXoiT8DTshfOzT1cLm9bvEG0nunHR/LXby255o=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 7 Jul 2025 16:39:13 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250707163913.5ffc046d@nimda.home>
In-Reply-To: <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
References: <20250621184454.8354-1-work@onurozkan.dev>
	<20250621184454.8354-3-work@onurozkan.dev>
	<DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
	<aFlQ7K_mYYbrG8Cl@Mac.home>
	<DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
	<aFlpFQ4ivKw81d-y@Mac.home>
	<DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 17:14:37 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> > We also need to take into consideration that the user want to drop
> > any lock in the sequence? E.g. the user acquires a, b and c, and
> > then drop b, and then acquires d. Which I think is possible for
> > ww_mutex.
> 
> Hmm what about adding this to the above idea?:
> 
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) ->
> WwActiveCtx<'a, L2>; }
> 
> Then you can do:
> 
>     let (a, c, d) = ctx.begin()
>         .lock(a)
>         .lock(b)
>         .lock(c)
>         .custom(|(a, _, c)| (a, c))
>         .lock(d)
>         .finish();


Instead of `begin` and `custom`, why not something like this:

	let (a, c, d) = ctx.init()
	    .lock(a)
            .lock(b)
            .lock(c)
            .unlock(b)
            .lock(d)
            .finish();

Instead of `begin`, `init` would be better naming to imply `fini` on the
C side, and `unlock` instead of `custom` would make the intent clearer
when dropping locks mid chain.

I guess `lock()` is going to use the slow path since it's infallible? It
might be good to provide a `try_lock` that returns -DEADLOCK
immediately without blocking when it can't acquire the lock.

Regards,
Onur
