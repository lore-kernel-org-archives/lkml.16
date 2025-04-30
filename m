Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA825332B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026669; cv=none; b=g5rzP1DrahMTuRYkB+8INVKmQVIz3FHtS2nFEum782EWngNtMXrGG/lkejx+CUipusENkjsdP2WKnEDf0WDTWyJ9G4+tbla0fe144TO/ca7PQHMSgAuxP6RoFsETR4RD78hCH8Vr3XhDJxWEJdSI6vVM+UbxPLBNqaY4rrfeDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026669; c=relaxed/simple;
	bh=mc4iqsJtm4Sch2mwpZ8Pu5tQvX+8lkT1bH+4ftx2oVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUPw3fZZVhhaEJdkPUDqgdGTR84kIEw/jWG8ykW4UzH6Yso2M44ZM0HDk65SZ02RAmu3ZmHo9LQ9O2kRnyLVJUuHb2LAJ8VGVpBv2jp/ehXxPVQbGgRjPv7DIPGomgfGWtxlnVTXPu0tvt2L3PFq3zt3DQbamrUPLXoKDNtG71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzeE+dli; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzeE+dli"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso16022a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746026666; x=1746631466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeDm7nLAxnXu6RatwjkT71ungT8sACaa75OHLr2iMmQ=;
        b=lzeE+dliI/Lx+MKSAyH03cnIeXHSc+IFbd3VPweuFt/xbKQ8oKW3UN+zu0ONUCyWyz
         hT11U687IAfm41FnFWJbYwrb7/IcaCRcPHlFd6JGVHKKNBR1uSh6FoFjVJ3+o6xlDZnP
         jPQDKlGyfg5UmmTh+VEM3a4eacrdWU4PwUtHSwY1ZBOrU2xz7TAh95bTtymUaI7NYksk
         kSI/WSLfoiizCsEcHDvxwNj16Zz5ML1U4BTq0vmL7ceDRBw9FwwFMx6mEPdpx5bmAUUX
         5efkkKX/k8dr1oX7DZqhSAqByd3acr+D+eNy9FkZUuXJnDNMmQsiaprBcC82JgY9b5Ak
         7BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026666; x=1746631466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeDm7nLAxnXu6RatwjkT71ungT8sACaa75OHLr2iMmQ=;
        b=IRQdtsTl4AQUlLB4x1OxrtdsBq6rFs++KzkNi/ojE6K9hz7ejighko5wvmiGXnWudW
         HEWWV7clPDh1sPeVkafO/k0H8HDbOHNnrbI8lbDV7Eh4tL3uWXjf/5pukYYJmaD+5nrA
         diLtWCMSONyIRYmmsyNKYd1rOvUWfY0UX6WxHwW0JCiqffm8FF92/QMF2pQf5GUGj6kY
         LlqspkrS74HM2swMrGiZP/I3IdloK4R0vU+v1fwsudKTNdEWBau/88YC+HxCddx28QVt
         UUfzVGm1fH3cvG36quwKTLYVnCbP49R5B4z/Gw69tmvOgAkBAol9j1b2BvkAuE+fwTWz
         ENJw==
X-Forwarded-Encrypted: i=1; AJvYcCVl/eHoLrljEUHza1Q624qOyUI2z4k8Z327MltgYAEyAxTBSKfmpJun/ZXXa8lRuHFkBqq8ucnA4dU98vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7eFLCxJvdDCnvYTiwRHspKBA8gYDENDH7DkEeSLqT81oj12D
	MrXmYIaH2I31QkGAABKgJvrvfp3ELUWg6zSoMVWmCw8MAHBEdYk1ZeKXei7jFckcrV2FIF4CaqR
	g3bnkVbWSBQ7MinW1fYcb4goFz/sY0rak3vZn
X-Gm-Gg: ASbGncukHYdJtJS+SJ2cDXZnXT5JtrDPv9FalpFGGNEusMffMIxgT7vpn3eJAzhJsiF
	fDFV2BDp7M4IZ90aYmGd9OZy5XCrDkIcijU1PXX126Icj5vaMbGejdq3nybzSnGYfK36TeIPTO4
	8ZN2tsgX1jJNArQS0HkI6aRiH3f2iCVzR3C6GkRCr2aRE0Dj0x5X6aSZiqjCeexA==
X-Google-Smtp-Source: AGHT+IFEbNLx0ZK5cPqpPxBC+AtdkFb1w6qa4q56RyKF/vAzRVoyOMywLtxe0yeCxlss2t8QVgLEVaarl5iaH36JsFQ=
X-Received: by 2002:a05:6402:b7a:b0:5f8:d6b1:71ba with SMTP id
 4fb4d7f45d1cf-5f8d6b17480mr49571a12.4.1746026665751; Wed, 30 Apr 2025
 08:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <2025043024-disk-rockfish-1c1b@gregkh> <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
 <2025043005-monkhood-caring-7829@gregkh>
In-Reply-To: <2025043005-monkhood-caring-7829@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:24:14 -0700
X-Gm-Features: ATxdqUEAzeZzctZ3LnlPvf2gn0jZW2r_7XtedXu0n2P3rjYFwFR6rEnjuHYaGh0
Message-ID: <CAGSQo03=09qCj230-y3yqD_4zRJ9PE8U-9NLmOZokUfBpRdKCg@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:21=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 30, 2025 at 08:01:38AM -0700, Matthew Maurer wrote:
> > > And yes, I know why you want to tie debugfs layout to a structure
> > > layout, it makes one type of debugfs use really easy to write in rust=
,
> > > but that's not the common user for what we have today.  Let's address
> > > the common use first please, save the "builder" pattern stuff for aft=
er
> > > we nail all of that down.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I'll remove that API in the next version of the patch series to get
> > the basics down first, but to give some motivation to what I was
> > trying to support which *is* done in C today, see qcom-socinfo [1] -
> > it uses a backing `socinfo_params` struct which is expected to outlive
> > its whole directory structure.
>
> What exactly do you mean by "outlive"?  Right now debugfs has no way to
> "own" a structure and it just "has to work" so that the file will always
> be there and hope that the backing variable is also still there.  I
> guess you are trying to encode that "hope" into something real?  :)

Yes, the `Values` structure used by the builder interface enforces
that the backing variable must live at least as long as the `Dir`
corresponding to the lowest directory it's going to be used in. To
make DebugFS safe in Rust, we either need to:
1. Have DebugFS files own things (not currently done, doesn't seem to
match intentions).
2. Expose things that live forever (e.g. globals, like the early patches do=
)
3. Have a pinned structure that is guaranteed to outlive the files
that use it (what the builder interface is trying to support)

>
> > [1]: https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b=
46565f4616186/drivers/soc/qcom/socinfo.c#L133-L156
> >
>
> Yes, SOC drivers are a mess of debugfs files, but manually creating them
> is "fine" to start with, let's not go wild to start with.  If we see
> common patterns outside of the single soc driver use case, then we can
> propose exporting structures as a directory structure in debugfs, but I
> really think that is a very minor use of the api at the moment.
>
> thanks,
>
> greg k-h
