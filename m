Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD4225A23
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461944; cv=none; b=Q6r5w+jqzpgMlqGybEuCxGUD0UVP4A9+uNhzhn8P2OY0G+FE2L/VjQmH6X/hHk2o3tPgoQeHp1HPHvbBL27T+2c41B2zLEVoBhms4Mu6rIEDnGgSIE9BiTbMLcpaNCECsAYyCqvCOtUtW+AXSDQuRUqhGSTJOtnxID4FnNAmp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461944; c=relaxed/simple;
	bh=fAe1pSCwvG+JbEAUEWuBmKD5l7BHh4JT9DVEQ4MqRmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U77YnpImmmrcYeW8wxyD1w0JAS6twHyyfB6fEGm21ft7GS5K4m778lQT6ajJdMRdsae0iXqRgqk2cOC06V+aNiMqdXHAoTfnSsVNAWgx9UEE62UDPw0slG/SLsJKJHc5J4emZyj2cS+QAt2vJ12EhnzZu2MfllfR6WhgHE2ziK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyKwXgSi; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyKwXgSi"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso6993919a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751461943; x=1752066743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytoK/nx9JW3TYPkFJe7nDJOlWgDHzDyFKz2wtGj0glc=;
        b=nyKwXgSiteI4TcT1DcvHbUfHslaBo9bzSZTZmf5kraMdVSVAub4YhseC3yXZ+bax7e
         JU72tcMX3nwEaHIAEsjHRt21WdRa/jTADUXbrL3W83hIo1TACF0NL5nILar/Lw+Le7ke
         w4yz9NbuDDp7uSvvoEONXC8tRvOGo71NTKFP0rpPIyR7jqURK63uf9ELFFWAXQ6fE8WU
         hdfuSC4wphQerZO5hGruqRwZdtViKXcIsI5baM4V0JliNNVbq/Utw8PoWgxUqOMFWmU0
         XWWTr7+JGAJPu1BjScaXD4hSs4vdqMoMrpyJGBpJ5ldEi9Refplcp+H/Ch+A5FNzbB4l
         Uh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461943; x=1752066743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoK/nx9JW3TYPkFJe7nDJOlWgDHzDyFKz2wtGj0glc=;
        b=ah/4s2Qz1IG/ztXGC2PX6Q14wXFYEWCGTIwnIJBeEkQCe6TYfyF2z7goZZKj4ze76G
         bd1GH4PNrc3dkJayW48AUR7fOCo7dzjBhXDxgAFSInjDBHKoBwssItLOuNJZAxzEcA65
         E1PvL1DBQXytjnzDYLFcyUo9lX+KXJTDpPRfYBzBMTzStkaRrqSYy2XXcgaBRmdHFnZ7
         9Qy9Jd/0Y+zV3TdOQlwKxsEyf8+BkX8sZX/bvQisGJ1lrNV4rTVrJRVMrZJ/bRwQEa2J
         cqVbR6JHylmHsRQf74sxbyDSPEMiRAHMFtK0+NyYf3Gb7XV94g938MPdEQ9bbQ+dqbP6
         rubA==
X-Forwarded-Encrypted: i=1; AJvYcCVzVtsuyKDiOYL6OY26XieNQsie9y6VvmKk//cs3eBPBkssqNsi7q/2ZG3xtLgmjMnZQzXYImRk6jVReig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6JJ2zIOpnflKYHXhAFsjS2Eu/DVok6bqR+14uJvXkh4AFsHn
	9iRF+MJXmOI2F8i9LoCx2g/KzfoyFqGb2sOvwXzIwCMVVBmeGiUf6c1hYwWCZgFfhDd/5U87kmc
	dtlV6ASj3XlkrROleld6TRvnljolepjBcMdNRjMMw
X-Gm-Gg: ASbGncuJ74RqI7yuvoSYk+ZmEsQbpeLLn2eJ+EsBGz8PaXlWytvROLYhcJgvDKl6sf5
	vVmUhMVladWwv8sMTpKuMXppipOQ7GR4xr4ZQ1a4k+rAjgW356ABmNj0kTy+3BFyGUl6tdCxcji
	fZyVsBqZuJtPeaXnngZPhsv3cjkar7Gfwfmkpk7ZyJ9I0wFH5DeWc5Oj4khqOIJpixnSrPS28=
X-Google-Smtp-Source: AGHT+IFiERqUE3Rnrk3I3rryjB/sI1mDdOe7LfYtqgmx6pOYxn6SUXRHBeINY2kZ0sAPWB/L5qYNOyRsrBV247YTrkA=
X-Received: by 2002:a17:90b:570c:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-31a90bcadcfmr5412141a91.18.1751461942552; Wed, 02 Jul 2025
 06:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
 <CAH5fLgj_eKuo=E7HPgmd1bJNfidGUS37MM1QqRaQ_MJ2kTgCmg@mail.gmail.com> <1DFECD1D-9445-4D59-A727-37C527B5DFF5@collabora.com>
In-Reply-To: <1DFECD1D-9445-4D59-A727-37C527B5DFF5@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 15:12:08 +0200
X-Gm-Features: Ac12FXzwPJEj-QcLJVz3TrROG0dXHqdlvlhkJ4v6quqraoEz-bmVPqPGsJPe2yI
Message-ID: <CAH5fLgg1-K6x0wRO79mt4fGvJeNanr9Km75=1Z9G0gy-WbeU2g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] rust: regulator: add a bare minimum regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:03=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> > On 2 Jul 2025, at 07:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 7:11=E2=80=AFPM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> Add a bare minimum regulator abstraction to be used by Rust drivers.
> >> This abstraction adds a small subset of the regulator API, which is
> >> thought to be sufficient for the drivers we have now.
> >>
> >> Regulators provide the power needed by many hardware blocks and thus a=
re
> >> likely to be needed by a lot of drivers.
> >>
> >> It was tested on rk3588, where it was used to power up the "mali"
> >> regulator in order to power up the GPU.
> >>
> >> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> >
> > Overall looks reasonable to me.
> >
> >> +/// A trait that abstracts the ability to check if a [`Regulator`] is=
 enabled.
> >> +pub trait IsEnabled: RegulatorState {}
> >> +impl IsEnabled for Disabled {}
> >> +impl IsEnabled for Dynamic {}
> >
> > Naming-wise, it's a bit weird that IsEnabled applies to everything
> > *but* enabled. And also, the is_enabled() method should probably exist
> > for only Dynamic anyway?
>
> I think it's the other way around? Enabled doesn't need this impl precise=
ly
> because of the Enabled token. IOW:
>
> Regulator<Enabled>::is_enabled() doesn't make sense.
>
> >  And also, the is_enabled() method should probably exist for only Dynam=
ic anyway?
>
> Also no, because Regulator<Disabled> isn't necessarily disabled. It just =
was
> not enabled by us, but might have been enabled by somebody else in the sy=
stem.

Okay.

> >> +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
> >> +    fn drop(&mut self) {
> >> +        if core::any::TypeId::of::<T>() =3D=3D core::any::TypeId::of:=
:<Enabled>() {
> >
> > I would avoid this kind of logic. Instead, you can add an
> > `disable_on_drop()` method or constant to the trait and check it here.
> >
> > Alice
> >
>
> Can you expand on this?

Along these lines:

pub trait RegulatorState: 'static {
    const DISABLE_ON_DROP: bool;
}

impl RegulatorState for Enabled {
    const DISABLE_ON_DROP: bool =3D true;
}
impl RegulatorState for Disabled {
    const DISABLE_ON_DROP: bool =3D false;
}
impl RegulatorState for Dynamic {
    const DISABLE_ON_DROP: bool =3D false;
}

impl<T: RegulatorState> Drop for Regulator<T> {
    fn drop(&mut self) {
        if T::DISABLE_ON_DROP {
            unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
        }
        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
    }
}
