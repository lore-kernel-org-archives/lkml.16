Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356D20459E;
	Tue,  1 Apr 2025 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514503; cv=none; b=RXIuGiqR4DBQXIpO6PSV/x0C3oB4egxu/uolEu1tvp/TKu6nhU9tSMiAXi9ArHOOdycyEjzUGv3TJY8frn2AtnPFjEPYH/K8TZpREThGCdCKPPgtuvenmMGdrw2PKmq0bJQ/GK8YYwN7xFwh+r1gxxGmsxmqoxujgxROPnf2kg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514503; c=relaxed/simple;
	bh=qoD2ZSfHlOlZZH+/abvDfZnd9hBErR7NrucAH3q4Ea4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETw3IVVe3DMIPWGBlkKsdxUailC7Hx46Z7Ppz+KCvC3CT8zWIlt2TbPLRxBohhC45ke69Am0W09DnFkhubDeFbmPTzPG6HuNLjPT0Zm2SjtMjdq6ienrw3e+15y5EF6xdFPxhhKoO2KUtNadi1AQqaDIgC2F5nrNY81oM+oanBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5MrnDKO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5MrnDKO"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549946c5346so5896146e87.2;
        Tue, 01 Apr 2025 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743514500; x=1744119300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuEYZBCqwA7CIYJgjlYrWkZYpXQDIV1uaU3I24EHO/c=;
        b=D5MrnDKOkxfgFj7t6Fwoto89EgroIcPwJvclexU/xmbtYuNpCTrfo25s+U+wAGPGXG
         gI6oszi3sB2dNgltQIXrU9hXyv8YLrFyRAqK3SfQj7T8xYSeaIpsOKXCj9Oa4Jqm0Sur
         mO8vlO/xDwZX+ZpCHkKULIY+6NgzQ0BTmmaLvoh34vmu464ipGp/UZ8uj70KQQyC41rL
         rh4JZiawebZW7ElT3Mm3tjGyOEQ2/2LWLBQD4BRM6GEuSikN/DU50axum4GNhEmrvegX
         05yGSxpbs3IAb3kavFc0GXjHmesa39HxKVfl5gnMEfwt4+8LufK0VbsJGzho4QGJCV4k
         XYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514500; x=1744119300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuEYZBCqwA7CIYJgjlYrWkZYpXQDIV1uaU3I24EHO/c=;
        b=t+3TjN+dx82SET5/tZXymwVEPinubYs40bqgo69Wc2Qvhta/KovO3Mh2sFKHF/xisq
         IpMH+ActuGoJdHaSSesZ4Ufl0pCsqw6pM+3zsAM+oTOkRDR3NHA4nTcPyD20LqQa9T1W
         5UIfe150j4+1reAASExkUwQt5jfhNxt/fuLs1qycDpiRpK3R2oyeGCNcwm7pfQiG2TeM
         9z0RzJDoAM8ttlv9DImroupQeEPOhlNOYYAFCIZY/Vmg/9/uVWHpmDNzh5VKS/s/vHCD
         mDnI37UYn44xKODW5ban1zF6LoJodX7lG8UXCgwraHO2EiUdbqIbUiHkmW/lOSeluXqA
         gt6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKwqNnffmCOjjeYMu90ywFPMf1QMBf8wYE1prfpQ68IyVWgm3/ChnMdeYfjwWDbupE//90jOIUUMS4Y7qYN/k=@vger.kernel.org, AJvYcCVqlYDJMTMNch/T2SImPK5h5L7Cj8sG9IOX7MAJvjoo2eYXLv5R/JwE6TC+W+tHZub1KyGOv8kh2hmf+Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YylhBqCNkNI4AAZMGSxY1COXNmx2RvQuFO3+a8kpnUBl1mRBenV
	D9Qm1UtHk3ds6fphS/3ilOfgXJtBGKReZyNBmexxSHs7ym8c8JfKI8HEJsDWNPB9wUYe9StKk7Y
	dnZ9yjcWz3QzSvJcJ6PLJcKy4VH4=
X-Gm-Gg: ASbGncsLEsU3O5Vk6pTtTnIjhAH1/5hZAiZ0Rxige6rN5hhMzincxsVyCnCACZgShbP
	PtOEZOUN4/tNJhClwI+aoG+ijcjNgGBcV3yA8Z8uyyv1JL62xSWH4xmkEtQxftdiXBb4DFl8b8A
	XCJ2lb1sgvExnZy4zwOSLpYxOR/BkqKBC4HpYAjmYMPw==
X-Google-Smtp-Source: AGHT+IF+nlByXR6ehVfY14OCQBHDhwh1Y6M21JKzjJwKg17ho+RUMPp+Ao+XjX7bG9JypPUaOg8SVnSIZbUrznE/gAE=
X-Received: by 2002:a05:6512:224f:b0:549:39d8:51ef with SMTP id
 2adb3069b0e04-54b10dbbcbdmr3419216e87.6.1743514499624; Tue, 01 Apr 2025
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com> <CCB6D89D-D513-4514-8992-AC37313F5588@collabora.com>
In-Reply-To: <CCB6D89D-D513-4514-8992-AC37313F5588@collabora.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 1 Apr 2025 09:34:22 -0400
X-Gm-Features: AQ5f1Jr5JEDjv_k1baNbh2nHOn_sHHoojSO0_Rh9-XsHMS-i1vHmPpxE6-ORYu0
Message-ID: <CAJ-ks9=UwmdZqVnvJ8dzASG2hjtWFS=PAM2jAtWpEuZ9Lu5f+w@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, 
	Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 8:59=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Tamir,
>
> This patch looks good to me but,
>
> > On 25 Mar 2025, at 17:06, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Make all arguments required to reduce the probability of incorrect
> > implicit behavior. Use keyword arguments for clarity.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > scripts/generate_rust_analyzer.py | 90 +++++++++++++++++++++++++++-----=
-------
> > 1 file changed, 62 insertions(+), 28 deletions(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index b37d8345486a..badcef4126cf 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -69,9 +69,10 @@ def generate_crates(
> >     def build_crate(
> >         display_name: str,
> >         root_module: pathlib.Path,
> > +        *,
> >         deps: List[str],
> > -        cfg: List[str] =3D [],
> > -        is_workspace_member: bool =3D True,
> > +        cfg: List[str],
> > +        is_workspace_member: bool,
> >     ) -> Crate:
> >         return {
> >             "display_name": display_name,
> > @@ -92,21 +93,34 @@ def generate_crates(
> >     def append_crate(
> >         display_name: str,
> >         root_module: pathlib.Path,
> > +        *,
> >         deps: List[str],
> > -        cfg: List[str] =3D [],
> > -        is_workspace_member: bool =3D True,
> > +        cfg: List[str],
> >     ) -> None:
> >         register_crate(
> > -            build_crate(display_name, root_module, deps, cfg, is_works=
pace_member)
> > +            build_crate(
> > +                display_name,
> > +                root_module,
> > +                deps=3Ddeps,
> > +                cfg=3Dcfg,
> > +                is_workspace_member=3DTrue,
> > +            )
> >         )
> >
> >     def append_proc_macro_crate(
> >         display_name: str,
> >         root_module: pathlib.Path,
> > +        *,
> >         deps: List[str],
> > -        cfg: List[str] =3D [],
> > +        cfg: List[str],
> >     ) -> None:
> > -        crate =3D build_crate(display_name, root_module, deps, cfg)
> > +        crate =3D build_crate(
> > +            display_name,
> > +            root_module,
> > +            deps=3Ddeps,
> > +            cfg=3Dcfg,
> > +            is_workspace_member=3DTrue,
> > +        )
> >         proc_macro_dylib_name =3D (
> >             subprocess.check_output(
> >                 [
> > @@ -133,66 +147,75 @@ def generate_crates(
> >
> >     def append_sysroot_crate(
> >         display_name: str,
> > +        *,
> >         deps: List[str],
> > -        cfg: List[str] =3D [],
> > +        cfg: List[str],
> >     ) -> None:
> > -        append_crate(
> > -            display_name,
> > -            sysroot_src / display_name / "src" / "lib.rs",
> > -            deps,
> > -            cfg,
> > -            is_workspace_member=3DFalse,
> > +        register_crate(
> > +            build_crate(
> > +                display_name,
> > +                sysroot_src / display_name / "src" / "lib.rs",
> > +                deps=3Ddeps,
> > +                cfg=3Dcfg,
> > +                is_workspace_member=3DFalse,
> > +            )
> >         )
>
> Why the change from append to register+build here? Maybe this change
> should be in another patch?

The reason is that `append_crate` has lost its `is_workspace_member`
parameter, so the only way to pass `False` now is to use
`build_crate`. I chose to remove the argument from `append_crate`
because the alternative would have introduced many instances of
`is_workspace_member=3DTrue`, which I judged to be less-good than this.

Cheers.
Tamir
