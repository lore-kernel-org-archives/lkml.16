Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A281BD9D3;
	Mon, 19 May 2025 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679003; cv=none; b=is4MNW7Ovd+dRAi5TvJOPV+PAzeGoVHGwq//f8yPPTxyqkKZAcwkzzMdovPqRR+e8o8+8kTQbRlhx6agXR7VdSr1KQWTwHzgaR2ESKYobQdTdZSQ4khRmPgXMh2e3BeWFYU60pdXe90DNVSPLOkLaGgVXNiWpV5njKjNin51ZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679003; c=relaxed/simple;
	bh=dEXy2yTI8nasSYtzkRQHmZh3RwRRXlKuSaR5czGrEXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tMJfPo2OyKbR2bcKU4+DiYXu8APx5sMVrCOx/NunCPRSO1MJg9n4RIe4QxJH4jrilrlIJ0XVXnUGRtgcvUBxOBqZwZe/0TX9+lvDE/J18L+wLXCeriM5WeWuXYHSlJXyJfBNVq5L/UeDDQ9uvRM/shnoghdwaKrLZfNuYA6u01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUWQ+a9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUWQ+a9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F9BC4CEFB;
	Mon, 19 May 2025 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747679002;
	bh=dEXy2yTI8nasSYtzkRQHmZh3RwRRXlKuSaR5czGrEXo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IUWQ+a9wbQ3F+MuyPnVD/w8trWFonpggIlcEIYThEfOabCAJWWu+6wIU6FnRKswpC
	 QtTE4/61ZJlq1xSxWGWFm81OafsCiOk2t8l2OWDBaYrU+zgBA6wDrvH3Sens+7s0X9
	 Tmu995CVfj91zWb1CHs7n0qsmq5IjY/9GADbcqFwVqjLUfhv6bpf0gHBDyAoaQu1xY
	 G61sgZ9xSXW4V+yrD79ylcPSyAcznWnTlDGIS0GrwSypdzuJ8qawGZf/gL6cp1uKd7
	 19PEuB1YbfcRH/knAiHlIRXxWUzFfbC4inXf+tUoQQGP6roOP2FWNIOet6Kt+iFMhP
	 a1uYmoO6yChNA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 20:23:17 +0200
Message-Id: <DA0CHZGFZ860.3RVJ9Z1RRBI16@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "Kartik Prajapati" <kartikprajapati987@gmail.com>, "Aliet Exposito Garcia"
 <aliet.exposito@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250519124304.79237-1-lossin@kernel.org>
 <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
 <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
In-Reply-To: <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>

On Mon May 19, 2025 at 8:08 PM CEST, Miguel Ojeda wrote:
> On Mon, May 19, 2025 at 7:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
>>
>> I don't mind making a custom enum, but I do use this in Rust Binder.
>
> Yeah, Wedson added the type back then for Binder and kasync from a
> quick look -- in those times, I see it in a few places only, e.g. in
> `get_work_or_register`. Do you have many nowadays?
>
> i.e. I don't want to add extra work for upstreaming Rust Binder, so if
> that would make it harder downstream, we can live with it for the
> moment.

I can also take a look and make a patch that uses a custom enum instead
if you don't want to do that, Alice.

Another option would be to deprecate it. Do I remember correctly that
Linus doesn't like that? If yes, then that maybe isn't a good idea...

> We may want to add a line in the docs to ask the potential user to
> consider whether a custom enum would be better nevertheless.

Yeah that too.

---
Cheers,
Benno
