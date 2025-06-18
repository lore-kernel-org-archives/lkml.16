Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98FC217659;
	Wed, 18 Jun 2025 19:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274978; cv=none; b=Kmu028/8SEyv0HfSPhBaVIH7VAhjbxmnHtIEhQmKPKB6d+okpR1T6wZxHjvkPalJoRuVGN1XRNZUz9z90rW8sHx+x8r3KSibxK/NRkZTPcnByG3/S3r6t8+f7nFFdcE0aJIQkRukpUPnRqvbIo6A4DeH8YAxJ4nYE3+7ufKhxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274978; c=relaxed/simple;
	bh=fYjHud3n0yKw1imgEHSxUMwy3Wo10DwwprcVwhcaP4k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nDCnf/YEDN1hHjdkhkVzw2gkz2pT/jOJux5QCcMoWWSZZZoDPO8O7mSRFN+nSX/8aSxQU4dU6sOAVDgyvDuw0fHLThxSjIUBQ/SA4paAEhNqYgOeFzP1q8BXMu/S/gZ6nuvU924hEC0adKI6KDjd5/IZhbmaT/w4IVYQZ6f6Vmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtRrYk3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtRrYk3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F30C4CEED;
	Wed, 18 Jun 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750274978;
	bh=fYjHud3n0yKw1imgEHSxUMwy3Wo10DwwprcVwhcaP4k=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CtRrYk3tG0im5Qm9z5QclD2/1qu9A0U9Xr08hMNtmFu+7/JXdzO0TbANfjEK4OkDV
	 UF6FlIJOzmx46tb5PUY5c+evzs1pvsg5ye6Vz+zzE9M9IJrgX2nbkd1wktsgU+Vphx
	 f3Czkz67yuUgCRkj19GEfe2yCRpZrxCVB7TwNLErb+BhU3HqRdUdBzYSJNuQG+Owrs
	 4bbD3i563ttMkk6n3IXowHdSACtRKdcD63qir2QaC3bIPshBGZXF2pFD0YkloiyZME
	 0tppwmpHanxhKnKJH/2jw5xLd3PY6UQvDisclz66hzjClLmq2/Xpf+MOh68IEBekjc
	 N4WUY3IlBc9OQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 21:29:33 +0200
Message-Id: <DAPWP2IC7HZ1.F1GYTSUGD8WN@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~lkcamp/patches@lists.sr.ht>,
 <richard120310@gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Christian"
 <christiansantoslima21@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
 <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
 <CANiq72=s6Ugqrf5Ot6fJOMyCug2XyvKpjFCzya_Mr5iBkpitLA@mail.gmail.com>
 <CABm2a9e+XJsess6XY5ukz8vav30ADcmBrufmek+Bd-TNJpR2aQ@mail.gmail.com>
 <CANiq72kY=sSnhzYPRo3Zuj-7RjULMpRfCBYfoDDCpCHttX-3-A@mail.gmail.com>
In-Reply-To: <CANiq72kY=sSnhzYPRo3Zuj-7RjULMpRfCBYfoDDCpCHttX-3-A@mail.gmail.com>

On Mon Jun 16, 2025 at 11:23 PM CEST, Miguel Ojeda wrote:
> On Mon, Jun 16, 2025 at 11:11=E2=80=AFPM Christian
> <christiansantoslima21@gmail.com> wrote:
>>
>> I mean, using something like `use core::mem;` globally since we use a
>> lot of core stuff and so, it would make the code less verbose just
>> importing size_of, align_of and etc.
>
> Do you mean adding some more `core` bits to the `kernel` prelude?
> Yeah, we are always considering which ones to add -- if you want to
> propose particular ones, then it can be discussed of course. Perhaps
> in Zulip?
>
> However, since these are macros, unless we get a proper custom prelude
> feature in the compiler (which we requested a long time ago), we
> probably want to still to refer to everything in full, even if it is
> in the `kernel` prelude.

Yes, the prelude won't have precedence over locally defined items. So if
someone does

    mod core {}

    your_macro_that_uses_core!(); // <-- will error with `core::mem` not ex=
isting



However in this particular case it seems like that the macro
`impl_frombytes` is a local to this file. In that case it might be fine
to rely on imports from the scope.

---
Cheers,
Benno
