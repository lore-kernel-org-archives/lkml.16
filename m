Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A728DB5E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305013; cv=none; b=J6X8Iatz/nt6tGC2MvWXTdM6E297Gw6P9GJc+mFBP8wymcIMUi0pztt2GhFxqVxdKllBfNr7NIhvdIR6SE6O3o63G5dX3nhSTjyB/YNFVRkD6wyRyl3aG87biIL/49ZXxR+3rrad0mmZBjP9hsuGlRhXGvHpg1k6j7lgxl8KWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305013; c=relaxed/simple;
	bh=ysWa+Ky04RffJJZjxshaFRSc0YdWTGs0OEuot4LZ9Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTeNUBg4qZV4zrjVMrzhcQ4YDhL+ofKswfin1/8kbl9ym6+/RJbeHD+dZPaWLP49oU6mbtooq2lxyoDg+K3g4xjfmdJN9RAVldiuDR0sjQvF5nb9T4K70XGcEBv8NyoVJzRRNt3tk32BAZgFbktE4m/rztWtb2Dq6f0O4TkD658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4W3wY2zJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4W3wY2zJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so723a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751305010; x=1751909810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6N30jp2KR8xyjaqR21FRKv38F3EhVGr4FCaN1WtZO4=;
        b=4W3wY2zJt16698lPmp6gvZNo02XzzY3C/0289feZLHwjFVf3MPux4NPva63GGXrqrq
         ZYWVV3UoLmmljyJFG6QNf3rA7mlcQefJz8xVp5eNEr19BYMao3lK0mFO04GGp1tJY6M4
         biIG7mlxZ+qwsae6lT2tVWQnUGcZoJ3yRj508rAX67k8l7OGVYapC4iHb3mz8m7wzB1E
         YJGcc9oMs4te00iQ/1d015+cG5BXmQ8J1EFm/ivzl3qgG1/J72tJOOI7Xq3bYJkJVA2G
         K/3tQLOuU/m3+82p5jt/jAjq9XJaAcfAR5c2ScK8nt4ixR1bDhfcRBCXMyy7g9nh8lY+
         gGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305010; x=1751909810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6N30jp2KR8xyjaqR21FRKv38F3EhVGr4FCaN1WtZO4=;
        b=f6jKgwmqFD3CWM+ProWo1ZNxSSzJd40skCoKUM7/pkkoro2Q3HU+bhXr6rfBGRPFNu
         8NMn8tDkW73d+EiGEi8GDbr3CuPoijKJLFHU9GaVZxqZGZzGJU2XMRmwrZxUNqz9MxuS
         3qcL32B/yw6vKgZgqezTe3389CQQiquZIohLKbZGBrjyEJvXAZ0B58tryBipMH4SJOkE
         dleoSdzqNYOUNWwYDf0yT2hp+mV0tBTEmpqDKWXeptYyLU+0IYAJhljYa4Ozb4SSvmO4
         l9I/kkaFkBntZk2bWXY3bg1kmR3ezV+FkRlxvVAg0MJWnvweORXVInUosVLLbU2Ruius
         RytA==
X-Forwarded-Encrypted: i=1; AJvYcCXRWNvFNPxpsaaK2NqMUpWg9dbKnRKeafHxuvCTOGbTTnXobKP0toX9FZ4DDPw7sI7UCqotngmtALzu9R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIf6RzxWVSpJFfdGaAymZlm/8cgFUPzu03S8ilmRfbeLeqyeu
	2CrFW+oZV9ZcuHd6fFx1mF8VFsAmSB1serOlrYbPR4sKXp5JdDneRzi5/gn+rvKxOGgmixin60F
	XKXdgEvrs8Bmh6jqZwLIWLtCqaYeqx0yTO8Le3EnX
X-Gm-Gg: ASbGncsJL+oYp0f+dr2Pj57+Qk6GUTyjhUuMlzSNZqyEtjH47YOx2NPTg3XR+gJeqGM
	bFfUeYxyf+B3KGx1901PTdOYpkIQsWQLs7sReXc0U80xpd7B2QgyxiMRDLGrltnd7VV2nbDVO69
	YoibsxIQtmCENhTR8kg2PEuPkxGhJ9x5JYBhTK9UEwOoBaSV0TcNmkCI8z5CvJzrTg1wJdtRUn+
	AAvtUBeb5kk
X-Google-Smtp-Source: AGHT+IHLwdETfJPpcz6klOFedU/0eZYPQGYvn15iUEUJ5Hr5dw/y+HG16aZ455cWeOWOTT3ZmKOEq+E1KpnnKk9H0O8=
X-Received: by 2002:a05:6402:3708:b0:60e:2e88:13b4 with SMTP id
 4fb4d7f45d1cf-60e2e977131mr18350a12.3.1751305009920; Mon, 30 Jun 2025
 10:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com> <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
In-Reply-To: <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 30 Jun 2025 10:36:34 -0700
X-Gm-Features: Ac12FXysUe_aqbgFykO0Xo_MEDAeUsAt64aZiMhFI0dNH1_QJXaE_LG3DONX2wk
Message-ID: <CAGSQo00C9b0KA7QLEeR6EYWhn288LWTm5h3O_ko3GO=naMQsiw@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:34=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> On Mon, Jun 30, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >
> > On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > > +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) =
-> File
> > > +    where
> > > +        for<'a> D::Borrowed<'a>: Display,
> > > +    {
> > > +        File {
> > > +            _foreign: ForeignHolder::new(data),
> > > +        }
> > >       }
> >
> > What's the motivation for the ForeignHolder abstraction? Why not just m=
ake it
> > File<D> and store data directly?
>
> 1. A `File<D>` can't be held in collection data structures as easily
> unless all your files contain the *same* backing type.
> 2. None of the APIs or potential APIs for `File` care about which type
> it's wrapping, nor are they supposed to. If nothing you can do with a
> `File` is different depending on the backing type, making it
> polymorphic is just needlessly confusing.

If it helps, effectively what I'm doing is adding a `dyn*
ForeignOwnable`, but `dyn*` isn't available, so writing this without
`ForeignHolder` would involve an unnecessary `Box` to hide the `dyn`.
