Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F5219A79
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834708; cv=none; b=qU77BktuKP6G4GfhdVU2FDyf/zDRpojPrrkVQhbJK0GWOVdMCtgf1ktOv0FRra9vRjKT8MjqlMGTvmKLemT0PkmQNaaMps3ZAAAsdN+cDK0phOmbCxpshEbwaZ7EM7k0mfo5LtkH6SYtIB9gBmQFoQD3uIm83aFh/ALOkcsBnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834708; c=relaxed/simple;
	bh=fTX5OQpsOIvGGolJi+LGmIhsFf3xuv/829/xXoCnK74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KygXXYJFsfJRhP4AfyNVjnqcrcS88D7oubiRoRP6EFr0lvYIJW+IOmrIRxKdC5FjTPUskmghWqoFsSENAMmSJQzAlNVgsYLMhoYkX81W1e2gqA6Tmsbi5c6YbY/rbZbEcm5aYAg/LgcBWKi10A+WkyT4Qj87RYivUPOcGvUNRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uo3lbv6z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uo3lbv6z"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so515415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744834705; x=1745439505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTX5OQpsOIvGGolJi+LGmIhsFf3xuv/829/xXoCnK74=;
        b=uo3lbv6zmpTO1X/lmVIm/XnalEEOzU2LrPZgmEpq8YqSceN4mh3J4qgRDfFPNpswTp
         egDinuRkYsV8WEqQbaZEHACTeFhAbBHz7v9a6DYvUiSRZ1iqQDs3hDke4N7gOiXC9wNg
         PKYoUgK2pQkWEzr2LYfhmmhQGnW02cbod0Ni08JaZLWfFL6+cjb/6r4JKvpiSH5q118y
         Cx1R7P0Y78EUnOIdmRvm9Q9dEfat+MEOcP8YcufJME769dO0tOZKkXT4onzmBJm5BlxZ
         PWXDlbi40jlM1RvvJBGZSnNg9b5hymqFWA3NfOff7zJRjyMVjOQWIePguZlELw/ttjro
         XFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834705; x=1745439505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTX5OQpsOIvGGolJi+LGmIhsFf3xuv/829/xXoCnK74=;
        b=UrQLjvY5vd8QGz6tX4PgmWPoyhRcfHRLkYzHSn/7psQlxjM4UGPdiraU+FNNLTr+PR
         1i/IXJ0ZEImADKbtJoldXEbTmgRM+tVFY/7GWSkSVaCH3inF+J1JCKLch/AMlJYVa0yW
         QKc3n4qK28iEZPkMsGUcCJFttnGU/U7jIF4NE2WcBP/Q/5NaxzJ/qcogACAYHVh6hFle
         h9Zu7CwboGpjcbCj0YaCHOb2ye6SGdvijTIBnjRWDUJxpu60SOyfTbEw0KRdACjSgZqm
         EAPahAY1LzDXFqZS8MdPJlu6Y/mkNSfvnIGY9bFl+/GLa6tokTqYqW/cLvFo/iZ1MVEF
         wR8A==
X-Forwarded-Encrypted: i=1; AJvYcCUs3fJ1+k6Bv9r5tRcDmgjH2WuzbAUXl9aa7fTRIeAG/Sy2KuWxVQoAxrN1IyGWXNKvO1h29ycU7HQoGgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9hC2upjHjGuMvtBO+apB4Xje5euT9nf+/qscUPiLFzxeyAcJ
	Khn6tSTV/YkAoN5NwgfyZr9/DVPQbBwCEVZzlGJLKjocP2noZ9KAjcy1H8J+3gj5wPWdLCTyumy
	Dw2Y0hplX7YxgEJ5XO5DcMemTUQvTDcC9j4D8
X-Gm-Gg: ASbGncsQ5wAIkzhVNRqJTiF0cQBfAsUap7Zy0Vu5AW/bPWaELe9pKVDAG0CQNJctyEX
	I87Ixdj1jzt3l0EGQV5EvHAsbGKOfOr+1ux3VUY9I73AObsCe4R6AOVZ+UHgJ6Si25wQoKhHn2X
	cwlvoS0bVTAvgZjOTuHbgE4Q99CzHYe/LHQw==
X-Google-Smtp-Source: AGHT+IFDMr0rfAKUIyc5bxaXzoqZBD2+B51rDRj5MMNDAfcTDM0vgNyxjpxWFueRreOkTG5llMEc5cPDUrV/0P1glsw=
X-Received: by 2002:a05:600c:82c3:b0:43d:7588:667b with SMTP id
 5b1f17b1804b1-4405d6168d7mr44732035e9.10.1744834704767; Wed, 16 Apr 2025
 13:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
 <aAAKwTj9egoFdq6G@slm.duckdns.org> <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
 <aAAOwfmi-RcCtA6W@slm.duckdns.org> <aAAPqtC_8k0lER62@slm.duckdns.org>
In-Reply-To: <aAAPqtC_8k0lER62@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 22:18:13 +0200
X-Gm-Features: ATxdqUGVxH-bP-DhR2Gk1pJ7pZsOf1ovTk4dZawUyHleh_uCc9t46Sr65198q0E
Message-ID: <CAH5fLghxUEzeCzjx_kLXvkZZWSLiGp-Uo28DQ-psrno5207XsQ@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 10:14=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 10:10:41AM -1000, Tejun Heo wrote:
> > On Wed, Apr 16, 2025 at 10:08:35PM +0200, Alice Ryhl wrote:
> > ...
> > > > This should be pretty cheap and we can probably enable this for eve=
ryone,
> > > > but if the overhead is noticeable, this can be an optional behavior
> > > > depending on a workqueue flag.
> > >
> > > My only concern is that we're executing work items *before* the
> > > deadline they specified. There could be work items that assume this
> > > doesn't happen? But maybe it's okay. Otherwise, what you suggest seem=
s
> > > reasonable enough to me.
> >
> > That's already what flush_delayed_work() does, so I don't think it'd be=
 too
> > surprising. Alternatively, we can go for canceling on draining/destruct=
ion
> > but that'd be more surprising I think. As long as the behavior is docum=
ented
> > clearly, I don't see problems with running and flushing them.
>
> Also, note that self-requeueing work items may still be pending after
> draining a workqueue as the draining is best effort. This is considered a
> bug in the caller and, we trigger a warn and just skip freeing the
> workqueue. This is again not great but may be acceptable for rust too. If
> one wants to improve this, now that we have disable_work(), we can probab=
ly
> trigger warn after X retries and then switch to disabling & flushing
> afterwards.

Rust doesn't let you call methods on a struct while its destructor is
running, so I don't think this bug is possible in Rust, since it
involves calling `enqueue` on a `Queue` whose destructor is currently
running.

Alice
