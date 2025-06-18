Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0221624FE;
	Wed, 18 Jun 2025 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274005; cv=none; b=M+rqnbuCQlVJ8112JH8jooDBrDyvMGvuAx0Gp0JuvQCQtf8ieyGQescJ37af+DU4QsyX+2zN6HpgjOnezL/4D9oSdL7TDSz9ig2kCyvZzHDapMur/6NmlnWXL7lNCD400w/GWirQ1B88ukHKSeCXz4t1EsukhZVaLa7lSm6w8lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274005; c=relaxed/simple;
	bh=1KuC67Si5OZY9eok+6PD3Us52FjaM5Tmcx6laLxuqZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yceo+nv3yyjGhUf5+2cXYmWWuta6qCZg8zGE1wMzE+E6BnosebqyXE/9Uvoa56wD0Ph/SauHQDJi3+MhJaEwACmCCKOP7lrQT5NcqADbTRstWVSJQHSnY2dbicoqJN8hblTiwIjo8LYlHFoKyC4rHGcEVxud3C1E187JVRrUZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AC6xVQoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AC6xVQoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1EBC4CEE7;
	Wed, 18 Jun 2025 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750274005;
	bh=1KuC67Si5OZY9eok+6PD3Us52FjaM5Tmcx6laLxuqZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AC6xVQoTvoCEL86ei0aUY1fb7EB35wweKCF70YT1TVOu16K2RgTzsIOUJ+C6CIElN
	 vor3dIMBJJOREeKDjansurCJAAJOLOWfGvFv0uI7vWKhKLTfzy/TAFkR74lbeLo5hX
	 ZoU9bPmgBBrgez8i18u1hljH7uXedw5wrWrLADQcFmWHAE0yIvOHNCGQRon17Wyzob
	 q/1D/t+YEReiZ0K5S5CdUEgIyFeVP+O680xQc1T1lBsSfNqtlsZX+eRbf9y6zDLvKu
	 AyWh5ZT8oy5/FNbhoondIWMoLw4lAUD7+IvDKGUIfXS4nbttTZOuDoDR11jGSrLp5U
	 LaPIodefR9XRQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,  <alex.gaynor@gmail.com>,
  <ojeda@kernel.org>,  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
In-Reply-To: <aFJINI8ImfxMnvrx@Mac.home> (Boqun Feng's message of "Tue, 17 Jun
	2025 22:01:40 -0700")
References: <20250617232053.3927525-1-fujita.tomonori@gmail.com>
	<aFIEAiDKnxsZQ8s4@tardis.local>
	<aFENRtYZixePYn0XFOGCbNOkSV9338iV4jWk8XJYKI0crpf4QniT_GyZCmFuqmsKs5Cl64z8qlIK6aVfdTBjbA==@protonmail.internalid>
	<aFJINI8ImfxMnvrx@Mac.home>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Jun 2025 21:13:07 +0200
Message-ID: <87tt4c983g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>> > Prevent downstream crates or drivers from implementing `ClockSource`
>> > for arbitrary types, which could otherwise leads to unsupported
>> > behavior.
>> >
>>
>> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>> means ClockSource should be an `unsafe` trait, because the correct
>> implementaion relies on ktime_get() returns the correct value. This is
>> needed even if you sealed ClockSource trait.
>>
>> Could you drop this and fix that the ClockSource trait instead? Thanks!
>>
>
> For example:
>
>     /// Trait for clock sources.
>     ///
>     /// ...
>     /// # Safety
>     ///
>     /// Implementers must ensure `ktime_get()` return a value in [0,
>     //  KTIME_MAX (i.e. i64::MAX)).
>     pub unsafe trait ClockSource {
>         ...
>     }

Nice catch, it definitely needs to be unsafe. We should also require
correlation between ID and the value fetched by `ktime_get`.

But I still think it is fine to seal the trait, why not?


Best regards,
Andreas Hindborg


