Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65228253B46;
	Tue, 11 Feb 2025 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287805; cv=none; b=Bw6ir34L0uJurLezvbVg5aDinNiaoua7fVuuTx5H70NirNbVr5Um8csBWWxbIUbpQbRQDQHLawK9eySuE4dK2DoVtBhXBWfEP7cc5stGq8Hy9js+9wyW5uWR6E+JbeBhf1z52gwQO/Hgey+TpEUVKzHFIT+FqqG1s4wf0YrWMQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287805; c=relaxed/simple;
	bh=N6dPjasw4aI9h6GeXaT0rIKegaIzX5lNn8K+esb85f0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TLLwrMZRkTDA2tpPDoMc4KFZ27lWcPEYC6bM9ZAhQ4czB0ef6lc/UzcEUZenOidhckBdAwP41m2XXvLshx9P+uXcWwQoRm2nOmeKectlsY+VgrakehmI38JaFYkh34PKPxxGN91n5Vp054wwWBh1pW9jLXhyu8yfiFmlJgdURB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=d6LIUqW+; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="d6LIUqW+"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 2E8935ED3129;
	Tue, 11 Feb 2025 16:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739287796;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=N6dPjasw4aI9h6GeXaT0rIKegaIzX5lNn8K+esb85f0=;
	b=d6LIUqW+bVv3Fs/ScDF8k5KUJqJxHmSinB6OeVmZuvuULdHQVkTgLteZvGeeMDII
	4aaG24rSG4ULc9IwkGz6EBkLjkmjGbqAYoctt4pRg1Xgcx2qd+l1JCdvb9WQOKJf0gb
	wh1Y8rKmVKTlZwPbe8UEHseoeROztkd6TDEU78W0k8ergPD6rEUCpqZxFu4mODVQNWY
	dWKIo6uomb5CzrvULiBuYlr+g5lWb3BszICHw4hzqNIKr508LXAMIv9YPlcGadaRGPf
	hktr8McSpy6BPAsImhE5rxa+qXhJbNgwqzbQVSnsb3KPBbnt/qSLJyX9sxgYl5k8xT2
	OOx5X8yRJw==
Date: Tue, 11 Feb 2025 16:29:56 +0100 (CET)
From: jens.korinth@tuta.io
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <OIpcOXB--F-9@tuta.io>
In-Reply-To: <87zfish69f.fsf@kernel.org>
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io> <87zfish69f.fsf@kernel.org>
Subject: Re: [PATCH v4 0/3] rust: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi!

>=C2=A0Thanks for the patch! Do you plan on sending a new version?=C2=A0If =
not, do you mind if I send v5?

I think there is currently no consensus on how exactly it should be done (o=
r at least I was confused about that). If you=E2=80=99re actively using the=
 patch please go ahead! Active usage is always the best argument in such ca=
ses.

Jens
11 Feb 2025 at 16:05 by a.hindborg@kernel.org:

> Hi Jens,
>
> "Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org> wri=
tes:
>
>> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
>> functions, which print a message only once.
>>
>> Introduces a `OnceLite` abstraction similar to Rust's
>> [`std::sync::Once`](https://doc.rust-lang.org/std/sync/struct.Once.html)
>> but using the non-blocking mechanism from the kernel's `DO_ONCE_LITE`
>> macro, which is used to define the `do_once_lite` Rust macro.
>>
>> First use case are an implementation of `pr_*_once` message macros to
>> print a message only once.
>>
>
> Thanks for the patch! Do you plan on sending a new version? If not, do
> you mind if I send v5?
>
>
> Best regards,
> Andreas Hindborg
>
>

