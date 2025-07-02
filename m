Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8E30AAA4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467847; cv=none; b=BTmTnql+f5/ohE42qQWyLcRr/EUaa+XGUIycRgosIu51sfEDXxA2G755tpr4H8e7FMFmWmq+AEADRozYE+NGFQbqhnCRyNYIok6QQZeyMVj4HayM1fk/TuPxnO1lmzm7P93qAODDpoqN+v72jJRfRkEveVuwK30XyE5rNkPD2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467847; c=relaxed/simple;
	bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6nB9NcXmzeTy7+irsm+9Q4jv7UiGNgOyFPQPPg3KsFa7UGPnEwQpsv/MiDy81TT/CF8183uZWMwfPKP+v9YfnfeFXpQF0lFxSOP97WIOILAO1g8ZGjHQZAVzASxLtrknr5LnCXRuttQWszzJXSPEPnVhiKH9zX+Ea9kdYTobMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fl8eO+hr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fl8eO+hr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d7b50815so34631595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751467843; x=1752072643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
        b=fl8eO+hr+B5/m7SMDuoL0hDElM0F8Ng3rf5t2KhFFOAzzQEDtFyWslG88Z9QqC5Sf5
         7v5DYq6xk7WQb+8mfmHJCk0v0CFqoQLidHvLrWYFzTe+EJJEBxj8XcO5uYrabIB5GC4B
         m59caVfTNNCIVvk0PtCTarYaCEHQHQlZoWe+ITVR5KKcQPAyxMUSP5Pi1/LVJk/ByLPf
         9fMrIcTep2isSuXSuX2VdiOldY1TxIP9DU16j5LJBxL9MrpjwNsj0/gW04YQnifnL4NL
         OIC9H/TBnmN4GHQpTksKjWXKagqy80fwgQs2D90pvli0Wl7kI5gJrmKsGDIzFnpMG0Ld
         jKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467843; x=1752072643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
        b=E9GtECTqXB4pCDJCtkOPEDNP04mEEORuRdiNRBGlZ4/40lhGBWYkWpoBtP8jK52+Ba
         GPsTXxzw+uLY3ozf9IGcHF1VU6pkwIAOKbG+gBbbIQZ5ZfxnIqgLx2TRuxMHy1Jp23d8
         oAkWggnNzFJ4FJz0sOWKj+Jjxqu/HZv4iWNQRLhRj6IHgLU5zhNNtLlELgXgfUfGM31U
         1FQnQXtU73EnpYKYz0pNi5lsCjnLmG9e0beNxpLTQwjW3PA8sCQiOoGfcMg12Tc0vV+L
         C1SdlK78fTyTvw5afhecvyZwMc3Wt0FkRxjz4808/LT7/3WFqDG8+5LANht/RX98VFjm
         4KDw==
X-Forwarded-Encrypted: i=1; AJvYcCXn20k7zeVXaQEDxAlEdsjWyk/rC+cs/GGqgeXJlHjt0QTk+2TUwycNDOg2kQkNhkTnJxg2MpWtEN8U8s4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tIHXThcjxrzBxPiok9V/Du4ywrE26LmNPDG/Ixrc3ZqFBjaB
	yW5WZ4jzinkEMVnsXhT5ySu1nmZbs8eH5vVKpeYURqX1Lbnr13kOcBDH9M3MFwTfEm2uxDx3bQb
	1ww2SbecPDU13/9S7UAqZoZM7hjOYiQl/kuNfjff0
X-Gm-Gg: ASbGnctCNmtNhd9UvnozLN6rPGFyHfwMW6BIpGUtIJZAPpokg1heeona03A8Ex0S8+E
	PAEFNJ4lCd6/4sJ329iQeREbxWSV9wfrAbNa7HgDb4FmavRG+in0RrVhxZMbfnuFgIT3EJVA4ng
	JW1M9LCWKDVwTlcNW4hhq2nxKmCLz8ikea4zFMkJDln3gX
X-Google-Smtp-Source: AGHT+IG+nGGlVC1LAKFybNU3aqbmD0eZd0ceRrzz5dRVvQ8OU1lPy3YrwXIf80CODXdFzmMy/vEJc2Ci9DIJm39I9S0=
X-Received: by 2002:a05:600c:1c94:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-454a373259emr30006825e9.28.1751467843001; Wed, 02 Jul 2025
 07:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org> <QU7IDrQqnXyNZDFF_jgZ4qTsRLPmUeeWedU_T1i11uOyc1E83Zo4tETj_oPxSfJySNZZ4-XEVBlkZJ-MZech4g==@protonmail.internalid>
 <CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com> <87ms9mvgu4.fsf@kernel.org>
In-Reply-To: <87ms9mvgu4.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 16:50:30 +0200
X-Gm-Features: Ac12FXwuZ185xGqP0rxNGwOW-SGS_WRsBbvNFuZzozirA5KDsx5bUbkVgIxui7g
Message-ID: <CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:54=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Introduce the `OnceLock` type, a container that can only be written on=
ce.
> >> The container uses an internal atomic to synchronize writes to the int=
ernal
> >> value.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > This type provides no way to wait for initialization to finish if it's
> > ongoing. Do you not need that?
>
> I don't, and in my use case it would cause a deadlock to wait. Anyway,
> it might be useful to others. Would you add it now, or wait for a user?

Waiting would require additional fields so it should probably be a
different type. It's more that we probably want the OnceLock name for
that other type for consistency with stdlib, so perhaps this should be
renamed? The name could be SetOnce or similar.

Alice
