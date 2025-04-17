Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A0217F36;
	Thu, 17 Apr 2025 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874575; cv=none; b=J+E2i6VnWKfTuWiOarBObLB/rn32Hex5UqhoLD3RftwMjyeyb3xVlwyqZVvVWtx0VP2WJ74ef0VrFaQeNpFC0IjcQhuJCguAHwiDGVLKO7oumT5H8SO4iGtQSgTtuiDWgT6n5BUe6lU+ldjYVH7TmZwHVzW8v3KKqtJ4+KRWm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874575; c=relaxed/simple;
	bh=Icm1Q/omv7sI1TZB8AuErbOKaaYlIRqQXQFkerJZWsY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecVm5xSenabeHpQVtLbfTPfKEl5G68SOgocKGHu/R0AHmWxUxV0tyVxO+ahMjl1tNTLpzRgJo00c9QBmVoZAW79KIUCDyIX8Dw3sJXNbdzu1hEvF8PhOqaqwJnOcZAR7YGc00oO+dNIbBmsA3gPZaMLiF0DolZcKQpGHPFF6G5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GyCobIhu; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GyCobIhu"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZdTr36YZ2z9sny;
	Thu, 17 Apr 2025 09:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744874563; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Icm1Q/omv7sI1TZB8AuErbOKaaYlIRqQXQFkerJZWsY=;
	b=GyCobIhuKB7LCnXJEhw+MhBLztlAJb7i6P9QYi4Y9lJBzLe297YxQb4u9dCOzzxxOSoJ1k
	q+5eNzS5YEj6+bvysd6ZjtU9uN5Z/H89cw1z+fAQJg8LdhVW7NeVSMKdrEvY0OrbCeAnvr
	5Ov/Af4E85NITU7T9QBj1bPI5drnyDfbgTcnYdO0ILQsQMFSjxQjsgmewdzyClYwl0/yO+
	dA74hADEOyOUbUb8dKPrO6hDIpcT78zhdds2BRVeORXpV1pco94WzpyYXFlF1ZwtiKrA3q
	s6AIM6DqzDDUqAi/COLDzevpeNYHFTVsLrr7t/OdKgpqaw9tLuVK90hagbTF3Q==
Message-ID: <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tejun Heo <tj@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:22:40 +0200
In-Reply-To: <aAALmSjLyWqrcQ45@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
	 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
	 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
	 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
	 <aAALmSjLyWqrcQ45@slm.duckdns.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 3218d200813b166295e
X-MBO-RS-META: fzqsgiezkr1gbya8r381es4aho6jiypf

On Wed, 2025-04-16 at 09:57 -1000, Tejun Heo wrote:
> Hello, Alice.
>=20
> On Wed, Apr 16, 2025 at 09:41:21PM +0200, Alice Ryhl wrote:
> ...
> > I thought about implementation approaches. The first thought that
> > sprang to mind is add a list of all delayed work items, but now I
> > think we can do better. We can have an atomic counter tracking the
> > number of delayed work items, and have destroy_workqueue() do this:
> >=20
> > retry:
> > drain_workqueue(wq);
> > if (has_delayed_work_items(wq)) {
> > =C2=A0=C2=A0=C2=A0 wait_for_delayed_to_be_scheduled(wq);
> > =C2=A0=C2=A0=C2=A0 goto retry;
> > }
> >=20
> > where wait_for_delayed_to_be_scheduled() either waits for the
> > counter
> > to hit zero, or waits for at least waits for one of them to be
> > scheduled. For example, maybe wait_for_delayed_to_be_scheduled()
> > could
> > add a dummy work item *without* waking up the worker threads, and
> > then
> > wait for that work item to get executed, which would effectively
> > mean
> > that it sleeps until something else wakes up a worker.
>=20
> I suppose that can work too but the delays can be pretty long, so
> while
> correct, I'm not sure it'd be very pleasant to use. If we per-cpu
> lists, I
> don't think the overhead would be all that noticeable, so may as well
> do
> that?

I assume you, ultimately, mean that the list of delayed_work's would be
accessible through workqueue_struct, correct?

And then destroy_workqueue() could loop over all of them with
cancel_delayed_work_sync()?

I think that would be the cleanest possible solution.

P.

>=20
> Thanks.
>=20

