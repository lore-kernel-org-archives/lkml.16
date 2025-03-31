Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F50157A5A;
	Mon, 31 Mar 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743443270; cv=none; b=B/FM7w8KYkDxAOH6T1D2LNoMUa7/OPiu0GCTvojLV3rG3gYibbN3tHyYiD3hACW0Vjs/FZOsy4XABMmQ+AmbeuIaSKTmBHwF+kyFheLGyeOIKb7UOdp51dF0Xb3cEdecGD4Yt/L830fQQkBPKFk5jIcGxn2oOoId5E+uYr9zVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743443270; c=relaxed/simple;
	bh=cohf0xBe3HVe1w14VXyw62vPoN3cbVjN+P9XlAIuHy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wf67RZnOwdd0KPOGsBDYRrl53cnkwR/CKPIHFk7cvCFkS3/ukvcHY82A61Z2NgCQgfkZGhOMRq2mReFaG+kMUKt3FN3XBs/uwkLk0uJdH79Y6c3+D3yxx/EQRRZ9OJUfppwOKDR/qXGzc640GfbvgXptyr5l05MG28z5tIvEyVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF10vOic; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF10vOic"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so38302161fa.2;
        Mon, 31 Mar 2025 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743443266; x=1744048066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rheJE/Hf8MWC1TGs8GVAsH8XEAExyurG2WRPYBbS4h0=;
        b=WF10vOicDIUvo9LTpBguHmlE1kuCKi43zV498CzKCJmWv9oeFcsAK1iBNa5dYRK1hr
         VIDqM3PMKCvyWYRAPkNh6ZNcRQ+h+5ulMi6Ros2NWk1+aZ3h9W0PjrTV5z3J+KbbuGur
         i7CeslS9IekO48nxc/3P3XELzegHVNlmMmg+d9B7WXsoDoLhrCL7JBhTEYuqgBk0pUpy
         0EYF0VZFHeis1ozeAFskZJjlX/s538leUI6HYKg+d6Fa8yYGgZgJc2k/pW7Wu43vvOKa
         FEOjWqSkHjuWMUJFf1XY0TSZ/aE2HQ1HGWJR1kel5kXtROvSeeugsnjlXZJnJhqaR+86
         FjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743443266; x=1744048066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rheJE/Hf8MWC1TGs8GVAsH8XEAExyurG2WRPYBbS4h0=;
        b=v42uLczmR230SLpp56nNOvngyIsS+qC1xLKbKXrMaLspgmirKnktH/5WW3GURNw6rB
         KIiagGEbUtuY2bH272/c1N4o21CnWDsyZL2becqhfwz+knZtl6pzyfV2F7yBDkZtnuhd
         HI+U+K+z3We9qFpEGwWb+jYnXjIVny38AnStHgpV0lhsWFDJlCQqIf4chTNM0wPrTCun
         VH/prPYTFwjuKVIjd2rLP1NaPwDn1mv9/ZM+0eaBZgxxPRkPHMLgNzeLxST3TU2cHODZ
         2E3FLjBQu8okk94nBD+Y9eSlO4q2nwUVYCkYKNYizU9Q9tfMxAcKF0MYMVQJ9oduUNZm
         mDAw==
X-Forwarded-Encrypted: i=1; AJvYcCVa8zAFOTnXVGMka7UjG+qDumg64nkM9hR27TgLHOJgsDXlOpvvtZp94YBq6jeJuY4x3szHC7vteqJQ5OA=@vger.kernel.org, AJvYcCXXWgClWq7vVyn9onhTTkPiNdam8WhcHE7bXSBhC5wB19djULRpI4uV5OWCyCskgkmGliKNeoZWoxNbpph2JSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmDULJ2V+CTXY2d19wrxNFNJ2o0TM0w6fWExuNkiJ7MiHo5ke
	hyhwHmiUxwPaoiRdnBmk+gk6GLMnFlzt78dSbWk1c/xBOZ7nOIzC7p8v+kcCAxHjrvc1R3fGDVU
	0WdWB/WbXRdGKIlFTw1WCsfCdq/M=
X-Gm-Gg: ASbGncu6WNF+Qp/zWx1I9Zt7Oh4rGXg+B821aF6ShYdwBuQMNkgqD+RKVVlmRcvxaAQ
	zu52xWgzXEOO7yf3x5faWKoyzjflPG5cowSgA+t4WrAnKIc/hJDLzAUu9KB7R+dA8m/YmYUPESh
	37XquQOf5a4ebwp/vQBn4wIJnp7m1VO3kmacMnKfutsAl1IIDh2yQj6nJLu1I=
X-Google-Smtp-Source: AGHT+IE7S+V/7NxXtdAKfO+zcdu3prC+4SQmecRjM7LaccjG7RPfjXfeRLFWVn7FPFcV8cgJwszMiQ4hLmnqdwE86Yg=
X-Received: by 2002:a2e:bd81:0:b0:30b:b8e6:86d7 with SMTP id
 38308e7fff4ca-30de0278867mr32487441fa.22.1743443266425; Mon, 31 Mar 2025
 10:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com> <1B186177-16B9-4D2D-9603-F713F0FE9BEC@collabora.com>
In-Reply-To: <1B186177-16B9-4D2D-9603-F713F0FE9BEC@collabora.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 31 Mar 2025 13:47:10 -0400
X-Gm-Features: AQ5f1JoZKdRywN2Xd2gVKe_V6-VgwdXu-_yeOvVB_NhalhvBi3F6FP99Fv4lNRg
Message-ID: <CAJ-ks9mNZWrAaHChU6kXHOKcwUkL4MJ1ENjuTPBaE8CKrEYQPA@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] scripts: generate_rust_analyzer.py: add type hints
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

On Mon, Mar 31, 2025 at 1:09=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Tamir,
>
> [snip]
>
> >     rust_project =3D {
> > -        "crates": generate_crates(args.srctree, args.objtree, args.sys=
root_src, args.exttree, args.cfgs),
> > +        "crates": generate_crates(
> > +            args.srctree,
> > +            args.objtree,
> > +            args.sysroot_src,
> > +            args.exttree,
> > +            defaultdict(
> > +                list,
> > +                {
> > +                    crate: vals.lstrip("--cfg").split()
> > +                    for crate, vals in map(lambda cfg: cfg.split("=3D"=
, 1), args.cfgs)
> > +                },
> > +            ),
> > +        ),
> >         "sysroot": str(args.sysroot),
> >     }
> >
> >
> > --
> > 2.49.0
> >
>
> I found `args_crates_cfgs()` a lot easier to understand, but I guess this=
 is a
> matter of taste. I also find that this `defaultdict()` call slightly poll=
utes
> the surrounding code, but again, that might be just me.

Would extracting a local variable suffice?

> Regardless, running `mypy` still passes, and there is no change to the ou=
tput.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Thanks!
