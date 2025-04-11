Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1C29614B;
	Fri, 11 Apr 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374914; cv=none; b=s5n8heJkwUczFAg37QnPuze4HnFFzj2wi1PvmiobILzlKPN+cvwmUU+f1fZe2N2bJ8SqqxOFdZc/5eHI4HxA7LR09IUdGPjlb/Yj179DSGrqRje1Vu0Wb3GnVMlodZvCvKr4oCZEz/2fKQmBPfxSaa/iTJKp9KRXEfzXPC6I23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374914; c=relaxed/simple;
	bh=gF3gJ6Zvq8UKwmFFjWUB19pk+kXbs7ip5tQjbxlU6Cc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tR5sgCxpZvpKJbqOfrnT194jPTfzSqBnasxSs7dXytoMTfRwrthtKcKb9wMWfF/qtGBwZuSauNgkxD/clmJCVgmNW9hE1R/GZAC09Ioppoed9Z8C2aTjVWJUYzFuORL2LaK3mtrei/xayYaxD71FMPQ18x1dxWmZTJEpwjyfeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aBmbhb21; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aBmbhb21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744374903; x=1744634103;
	bh=cmgVwOEjZf4JmCFjbyB17nfu/o6LDPCgCYrr0HLW5A8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aBmbhb212b9sPr1UhEuWRSXZiSwhnrQ7rrcaINWSKjFfZSxZrP9pLLS6KmjF20iUO
	 GutPRn9ARIAcELSLDfZIDvN0vjpd2KAvB3cTioc6qaVJhaVMdahs9AYRHgMZr9a1dO
	 iN65zIYMvZg3MDgDS37MrIU5hrigsaI+n3LZG7IzzxvO0thi5QpMBLJozE4YPaVcCD
	 s1IJF259wCeVWEXcWgvUTefyOaKf/xQ13kr46jrA+eKnHRgM3f0IOcfve8yTcvdTW7
	 iSOqugjKa5KkT+pt9hu18yqXW1pkEwDnwLrTNtuQsXcLOZcBszKppl5+HRNlBLXPZS
	 UzWxncq60fO0Q==
Date: Fri, 11 Apr 2025 12:34:59 +0000
To: Tamir Duberstein <tamird@gmail.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
Message-ID: <D93TAL6PHO34.2WCMTNVGUY522@proton.me>
In-Reply-To: <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com> <Z_jakOS8mciIpxy0@google.com> <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a29f178e3cb499a933d5db8f6999c5a7065dab87
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 11, 2025 at 2:25 PM CEST, Tamir Duberstein wrote:
> On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
>> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
>> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>> >  #[macro_export]
>> >  macro_rules! container_of {
>> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
>> > -        let ptr =3D $ptr as *const _ as *const u8;
>> >          let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
>> > -        ptr.sub(offset) as *const $type
>> > +        $ptr.byte_sub(offset).cast::<$type>()
>> >      }}
>> >  }
>>
>> This implementation does not check the type of `ptr`. Would we not want
>> it to have the type of the field?
>
> I might be missing it but ISTM that the current implementation doesn't
> check that either.
>
> It's not obvious to me how you'd implement such a check; given `$ptr`
> and `$f`, how do you get your hands on the type of `$ptr->$($f)*`?

I don't think it's possible with current rust, but maybe with field
projection (:

    ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
        // do not run this code, only use it for type-checking:
        let _ =3D || {
            let mut ptr =3D $ptr;
            ptr =3D $ptr.cast::<<field_of!($t, $($f)*) as Field>::Type>();
        };
        let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
        $ptr.byte_sub(offset).cast::<$type>()
    }}

---
Cheers,
Benno

