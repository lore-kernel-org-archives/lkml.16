Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD12343AF
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189455; cv=none; b=be1d3+Q3sO9JoXhmOipxlFOuKwbcDDTezWdiWc4qAzCpprIqUK+PH/k+IK8RhnBXLfuOtJAF2Y3ILt+8X3EGZdqkFF2+9cL5f4JR3QNpRzrKUl42+dJkpiXx++MtoUFjLwcAADcFbfgs8zB4v9mL/+T1e6Z76/LbKLfnhmVoyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189455; c=relaxed/simple;
	bh=i9qafAyvt4Sqrxt9qfuo2++lLzaRzoiUtvRXlje/Nyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6PDovBzyluxyW+lbr6Ee7/oV/03fF6od/TFocO+qqmC1NmE/Dc3toIZHv1xt1ozoYtAM/ReabdMSoCz1gXsgXexualv7spjvbi8DwytKuI4m/PX4fEw4r/JENEM00Nl/XcwADU5xDJ/EH+eldf18YM7cxT+/M7Od4Cklk4L27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JcCTrYCJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JcCTrYCJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1367643f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746189451; x=1746794251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+LD7uFVP1leLiXU44C+zD7gJP6t/daHyVJD0W+bQs4=;
        b=JcCTrYCJRcUTLKDTZM2kyE6yrqNX666v/kKkrOWmeLuTHTMovJkpx1WSUfFcKOMMVA
         12hhXXcbTxKIZa2w/37x7uXPHj+PCxhq2WXjnVTL7bMACPvE4O9G7BSgm2ubMGWU3zPG
         VaSssGG6qdXpAyGROzA6Op0GpQV8B6QgWxunlueke35YUEO10+RqrE+khx2aQAnFsfmX
         7JVgR2im9yYXtiWEvrYiYhwz4HTcDumgvzyTZRrU1JFRQKDZUIlL6CJupFgx9lg4/jcL
         aGraqdMByjbSiLdjTJnDaxSE6Hx1f7LLf1Nz6kYCbZ6WZu1tHEHfm49B9E0aVjc+qu8y
         LyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189451; x=1746794251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+LD7uFVP1leLiXU44C+zD7gJP6t/daHyVJD0W+bQs4=;
        b=vWatH9+qnwudaxdFdblyL/onyBbBkXmQ3KnYaDJ5MY8OWT5+1A5d8LUOEb46O7Nxts
         10+y4npz28U6RBdHYs+F815b3FnoVRXoFx+VKNqLYM24VH1Nqu+vam7Am8BvKmTc8GjY
         CbtUftIdJyjAT8ynmFdyLNg6jFSktJacGfJzpiyWvZIOSMvo2tW4cPoAE4BWGz7sYKrb
         3ymDUhRXewO53+pH92uDNEWbUeaMUexN+BCBAKvFmmg8V9docl83rILd2fuRvzDa81AX
         smxczoHFwp2Cw+opscHCTZvaWAtFUMDVcYLHVphAeMoOjUgqTZvKrTl/QviGocfePfvb
         rv0w==
X-Forwarded-Encrypted: i=1; AJvYcCUR/86TVhc0pKpqM0AOSBqv0HFOUSeCBXHX05jSJarWWWeNVQCD/ul6T0Dt9w+1WbIKJIWwKqcw6+ryRgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFOHHRHpsb7buqgJDTkM3e64lyixny/A7bpx9XJkDXvcFAtp4
	+zIjM9FX/Dju8DQebBycGtd/JlICZO6FsGGBF4/2hvk5AYVoZFhyo1jwwedreoK+3eMy3STIhWo
	KASlAznOICVtZ9nTiBLE6CUKxuqet8b3VH7pE
X-Gm-Gg: ASbGncsluz0kc+JWug5HXBWQe/KzEBgM2TrPrd9uwsdvTdMW1gtvOrtCE183wEwbBLJ
	xgHRmcp2Q9T0algLCXVh7t/bJI4XG0iZhKVDc5VCNEkW1iVxPR1bMeE5zayN1SlO7gU6fcMvTup
	Qb2mU7XKX4BToz6KIpJjEA2fv6MgZiHZ8wz6vIoUZD8G//dN5GRSAM
X-Google-Smtp-Source: AGHT+IGPyMbs/4uv+xTOcLOHcJXPcSy0mP9URN/0D+0p2zNyPN27jpO0nnO9tXJRxDAaEoX12v69dBZuX5X5K2lpJgI=
X-Received: by 2002:a05:6000:186b:b0:3a0:90bf:b9b with SMTP id
 ffacd0b85a97d-3a099ad40dcmr1830545f8f.8.1746189451420; Fri, 02 May 2025
 05:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
 <y-zNJ4bc_qB45bZdnhojbouRbKGZCnzfvM4um6WShQHCTrvN6WikMId_DeZsZz2iSiSQwfNZ13cabCinPpDDlA==@protonmail.internalid>
 <aBS0ZP9tFnujvodq@google.com> <87plgrxkg4.fsf@kernel.org>
In-Reply-To: <87plgrxkg4.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 May 2025 14:37:19 +0200
X-Gm-Features: ATxdqUHyw9AleEOVnpS-XOSafxmeCRy9bKz9vYtTiEE1KChzGVzZPTpoAk5KAK4
Message-ID: <CAH5fLgj3j2BEyOmVw+T_988e_h1TYRmYVuEDYaL-baRu_mQq4g@mail.gmail.com>
Subject: Re: [PATCH] rust: elaborate safety requirements for `AlwaysReferenceCounted`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Fri, May 02, 2025 at 01:53:57PM +0200, Andreas Hindborg wrote:
> >> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
> >> implementer from being directly initialized by users.
> >>
> >> It is a violation of the safety requirements of `AlwaysReferenceCounte=
d` if
> >> its implementers can be initialized on the stack by users. Although th=
is
> >> follows from the safety requirements, it is not immediately obvious.
> >>
> >> The following example demonstrates the issue. Note that the safety
> >> requirements for implementing `AlwaysRefCounted` and for calling
> >> `ARef::from_raw` are satisfied.
> >>
> >>   struct Empty {}
> >>
> >>   unsafe impl AlwaysRefCounted for Empty {
> >>       fn inc_ref(&self) {}
> >>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
> >>   }
> >>
> >>   fn unsound() -> ARef<Empty> {
> >>       use core::ptr::NonNull;
> >>       use kernel::types::{ARef, RefCounted};
> >>
> >>       let mut data =3D Empty {};
> >>       let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
> >>       let aref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
> >>
> >>       aref
> >>   }
> >
> > I don't think it's entirely impossible to write an AlwaysRefCounted
> > value that can be on the stack. The type just needs a lifetime
> > parameter. For example, this API is not unsound:
> >
> > struct MyDataStorage {
> >     // ...
> > }
> >
> > impl MyDataStorage {
> >     fn as_aref(&self) -> ARef<MyData<'_>> {
> >         unsafe { ARef::from_raw(ptr::from_ref(self).cast()) }
> >     }
> > }
> >
> > #[repr(transparent)]
> > struct MyData<'s> {
> >     storage: MyDataStorage,
> >     _lifetime: PhantomData<&'s MyDataStorage>,
> > }
> >
> > unsafe impl AlwaysRefCounted for MyData<'_> {
> >     fn inc_ref(&self) {}
> >     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> > }
> >
> > impl Deref for MyData<'_> {
> >     type Target =3D MyDataStorage;
> >     fn deref(&self) -> &MyDataStorage {
> >         &self.storage
> >     }
> > }
>
> Right. I would rephrase then:
>
> It is a violation of the safety requirements of `AlwaysReferenceCounted`
> if its implementers can be initialized on the stack by users and an
> `ARef` referencing the object can outlive the object. Although this follo=
ws from
> the safety requirements, it is not immediately obvious.
>
> and
>
> +/// Note: This means that implementers must prevent users from directly
> +/// initializing the implementer when the implementer is `'static`. Othe=
rwise users could
> +/// initialize the implementer on
> +/// the stack, which would violate the safety requirements.
>
> What do you think?

Hmm. Perhaps we should say that you can never own it "by value". There
must always be pointer indirection.

Alice
