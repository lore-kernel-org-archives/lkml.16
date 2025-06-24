Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33237221F17;
	Tue, 24 Jun 2025 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763656; cv=none; b=KUT4ZfH3U5+Ueh9zzad0IVuH8vpZUzFZ9CPnnRwCAdm0hpVQOIlmyH/eAV5WOUvaAHXzoLAnMrTkmACllxikBBqcJTI4/p68sN9QI1o+3yMfP5lqBHYGGw/HKZoVPvDaCZsgDIGRxHKzCRK+SpoMk2ZqnPUaozib2M2EtCMMdIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763656; c=relaxed/simple;
	bh=Us7Q1PFZzaMBawMok6kpzJbe2Glw5foEeT6W19FayVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hhofjdoObRbc8jDcT3GqJz6fEVz6FXHS/ei6QC26GbDmBWrZ6oVG16jLmb2EPHd5h332vPsKr9oAfZ3uQPTZwEm8m14X82cZAVWUErQ4pDeA2YGxOvcbtElhzpx45KcU5iA1pES6Z5b4RXMCOrK3QYoUIH/z+XPssUfaIhbHLzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXoKQpDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXoKQpDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363A1C4CEEE;
	Tue, 24 Jun 2025 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750763654;
	bh=Us7Q1PFZzaMBawMok6kpzJbe2Glw5foEeT6W19FayVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fXoKQpDrEY6m6qKm3fCmp+HwRy5F0dgMYA+u5GTCsLJVBhljgr3kFarHv7NooRCsU
	 dmJ5lSMvd/xrHz8UDapUpPqrxIE0U+Df1RDQxbFcwvopL+lBo/to6IxEHbkna3v3Ln
	 Ul0D/YRJXEhhdglDoRO4DRWoKgqrWXGx8JLH0l8mlADpXbnXbRLzYXrPfKoQjZKKRm
	 tBbX8HVp9u3/w39v7leEK4db6Y9CLy/xS/A8CPpawqQczmMRAnqxM+9m2c+nWMBbWU
	 2IpqDb7horrpODjDDUv8d/6Eql1tL27U8RJizLmSeQ1zbYy30fKNZabV6qxP1SrI2D
	 b0DZcGzMRWLsw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: alex.gaynor@gmail.com,  ojeda@kernel.org,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>,  aliceryhl@google.com,
  anna-maria@linutronix.de,  bjorn3_gh@protonmail.com,
  boqun.feng@gmail.com,  dakr@kernel.org,  frederic@kernel.org,
  gary@garyguo.net,  jstultz@google.com,  linux-kernel@vger.kernel.org,
  lossin@kernel.org,  lyude@redhat.com,  rust-for-linux@vger.kernel.org,
  sboyd@kernel.org,  tglx@linutronix.de,  tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 24 Jun 2025 13:08:17 +0200")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<175015666837.277659.5038961663728008472.b4-ty@kernel.org>
	<CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 13:14:01 +0200
Message-ID: <87plet4cjq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jun 17, 2025 at 12:39=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> [1/5] rust: time: Rename Delta's methods from as_* to into_*
>>       commit: 2ed94606a0fea693e250e5b8fda11ff8fc240d37
>
> Do we want this given the (~ongoing) discussion at
>
>     https://lore.kernel.org/rust-for-linux/20250617144155.3903431-2-fujit=
a.tomonori@gmail.com/
>
> ?
>

My plan is to merge it and go with `into_*`. There are pros and cons for
both `to_*` and `into_*`. If someone has objections, they can send a new
patch with rationale and we can revisit. Sounds OK?


Best regards,
Andreas Hindborg



