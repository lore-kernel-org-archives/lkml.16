Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A019C56D;
	Thu,  6 Feb 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865470; cv=none; b=dox8oLqYwrBqByXESCHqwbxOq2AC06MQ0hPUi4PpeRD6ElTHBkdh1O6NSwobylG8BbXuQkkOf/Nad2f0AUioyWxCESCrKWUOfnfGh9r6NMeTORftVVFHI1aR5USRG1ECp6ug2jt1ugQEghQ4WPYzz9Dd/MIN1KnMeVjsWpK1itU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865470; c=relaxed/simple;
	bh=/7VoocD3Ij+bveFi8F+87A5fYEza9Rt1ojogVeZn+LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjh5I0jPLhPeXmVf7OoFKi6Naq47PKnVvSYP2udtXhXqIIMpcLYEq/CWZTwQkvb9D3tAos1UP9Wdwadkac+ODDjJpskAFQ0zDIxhLvf4fD6hKq3T2QJXfcn3h90ulHBI77d4KnMZTdcqyA2z5w0LCPGkU6SvRkgAMgevEX7hoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRb8I1/H; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRb8I1/H"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-307bc125e2eso10960991fa.3;
        Thu, 06 Feb 2025 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865466; x=1739470266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqECkEPcqWBxHFz7lsQZ+32OV1ueEqTNFLXI7WsUDEo=;
        b=GRb8I1/HG647dqTIJJAEyegI4lN+TJvrzItSp5/pkD3OurnR9vRNxp1cjdPS/TtEJJ
         LBIgftyrcXkf0kJOQSVLFH97HBaZVg/rCR//r8Odtfc5rkTrxXjmGyc13TUQTG1V1BGA
         eKL+znEt/9HyC95PCdl0hebEuDn5ZOh01T9j0SwhcmNcvX7DW2EA7kVU+mfBXF5erW7G
         xwKEZhPFj2kIE9xOIg0sKkqZWfJ23BXK3F+7OFsmFaQqb/VDPwiKA63TAgNM53+0lvse
         XSfrAZbBhTeRoOty7Xx5a01UEA7vliv3ZKwtfmF6ztWmNExijqJ5PcAER9RZN8Psy255
         RqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865466; x=1739470266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqECkEPcqWBxHFz7lsQZ+32OV1ueEqTNFLXI7WsUDEo=;
        b=BHBmyulmj6r6cBY/Ql0BbpTZhzNhKoa07jgXbfw1hQU18V5g0PNE+wyC53ZYS4AFUJ
         Uf/rViqBs7jFTp3ygJEnKOI3HQ4od4L9FDyuUNhpJkHOqwcn2Vhrquh+qHaf8zdpzL+1
         r7JGsQZ31uRLsJz1Sin8p1YhWrmAzd4RkWMJEO1WmDaVerwqYHTnSu5Xm0hgS8uMLLK6
         JfO7DkT4sA432dJvieglEZHdg4dSxwsUXmR0FdaDX4HqyqNP3MkBot8h99RwMPfssrWj
         jfo3UdUD5uYhHqNl8+Kgj8YL0nJ0UiMENnroAzWgyz/zM6eoncvXxVaF08+oowkbt+Y4
         4Htw==
X-Forwarded-Encrypted: i=1; AJvYcCUud/GCZ/mOzNzmAPqPNYjJqIqpfbN5QRISylmRb7KD+ashO2GIo4jbfSc1p2OBMRVHgXTMICFb6p1q6VM=@vger.kernel.org, AJvYcCWJMqZGpZdiwW6lCzr2ynMC3YEX9Vovjyiyxp7TuRacTMgwz9VEktdTJV7xjZvNgh4LBrmOgLS8vMwyf/PoZwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJvm1Zf+MPpFe+lujV7MWnBQWTsTdwrWivVnuPmCq5AbU/Hx6
	VflAMlmttvseMWm+szyekkYm7bWS8db9sTC3fTEwTATz5bQC6O8XI1h/z6OokWUcfdn7DJQUheW
	+/CIdhM1VUkR9oiI/B4IKARzxsvE=
X-Gm-Gg: ASbGncvL9MyQtBn+JWYazPkwC1hG4cLNjddFCzJBdWslOgjBCRTpbxDDGe7YjiC4+6g
	q+YM+nQgUhikU9baxUGlw0IN8IFuAnSxyTZRFrZd0lUXpP1zZnXZhue+/LiYFqvgoh19fHv7OA6
	ID/3GsUiUHU1cjPoC1SpB8cjzikgHF
X-Google-Smtp-Source: AGHT+IEemNa4+Qp+t6GpSIw0f2acpbYX4uJ9NdrPEXjIEMD0zChCZkjyra35mBChn6sKXIUFEvu0NRz7sYyOpiW9RQs=
X-Received: by 2002:a2e:be1a:0:b0:302:264e:29ec with SMTP id
 38308e7fff4ca-307cf31437bmr30514571fa.11.1738865466082; Thu, 06 Feb 2025
 10:11:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com> <Z6T5sOWXxmUsflW7@pollux>
In-Reply-To: <Z6T5sOWXxmUsflW7@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Feb 2025 13:10:29 -0500
X-Gm-Features: AWEUYZk6hpxH2uijVqS_l5mcFLvcg5WHG9K0M4G57KJCxoYOTruWp_yKpNu2KDs
Message-ID: <CAJ-ks9mokMqBYEucYBgL-72c3o=+L7A8O=6Q=cc9JofFEmseXA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:04=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Feb 06, 2025 at 06:56:38PM +0100, Miguel Ojeda wrote:
> > On Sun, Feb 2, 2025 at 12:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.=
com> wrote:
> > >
> > > requirements of `aligned_alloc`. These requirements may not be enforc=
ed
> > > on all systems, but they are on macOS. Ensure that alignment is at le=
ast
> >
> > Which requirements? `aligned_alloc` comes from ISO C, and POSIX says
> > it is aligned with it; i.e. the change to make it work in macOS seems
> > fine, but please see below.
> >
> > > +        // According to `man aligned_alloc`:
> > > +        //
> > > +        // aligned_alloc() returns a NULL pointer and sets errno to =
EINVAL if size is not an
> > > +        // integral multiple of alignment, or if alignment is not a =
power of 2 at least as large as
> > > +        // sizeof(void *).
> >
> > These requirements seem to come from the macOS man pages, not the
> > actual specification. The C one seems required to fail on invalid
> > alignments, but is the set of those the ones that macOS mentions? (It
> > seems the history of the requirements of that function is convoluted
> > and involves at least a DR, and glibc is very lax, more than
> > apparently its docs say)
>
> I previously checked man posix_memalign(3) and it says:
>
> ERRORS
>         EINVAL The alignment argument was not a power of two, or was not =
a
>                multiple of sizeof(void *).

Right. The best description seems to be on
https://en.cppreference.com/w/c/memory/aligned_alloc. ISO C says:

> If the value of alignment is not a valid alignment supported by the imple=
mentation, a null pointer shall be returned.

Meanwhile POSIX says of posix_memalign:

> The posix_memalign() function shall fail if:
>
> [EINVAL]
>   The value of the alignment parameter is not a power of two multiple of =
sizeof(void *).

The note on cppreference addresses this:

> As an example of the "supported by the implementation" requirement, POSIX
> function posix_memalign accepts any alignment that is a power of two and =
a
> multiple of sizeof(void *), and POSIX-based implementations of aligned_al=
loc
> inherit this requirements.

I could rework this patch to use posix_memalign which seems to be more
completely defined, or I can try to capture all this detail in a code
comment and the commit message. What do you folks prefer?
