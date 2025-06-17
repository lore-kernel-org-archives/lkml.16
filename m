Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B8236457;
	Tue, 17 Jun 2025 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174137; cv=none; b=tzwK0r3UyJ3YxuSsyH/6m4fUvEPwZXn4cqQjaM/lsrL4CgXY2W+KEecEVfHDow9S+W0CnoLs1s9Btfcj7e1e6vMA5nuAkeiPiH4fmCVVm1W37PbEM91VCBeKdxBf56EMz9drkUcziZsGhxbAwCuUx1Wg/mWn6MEIIevH2JviZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174137; c=relaxed/simple;
	bh=TdGRs5iTXAhHxPcxu4PNEeCbPjsBGuk+HPcu/c1kMr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/TWjeDPSmPduFNd/ehbqKCH71DIiqBbFZIKaDUqjXz4E1ISoRHF8KO8fUW/m+c0PZVyBqiizk6k/SE7xuc0+Mp0bXMbFAESQgkRMS5H+vFHZSqfybJTwB39Me92xcgeYLJ7qV1OfO9Yc2MUf/2yFsx/PcL0dEjZE746zF1yJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRk8J4cG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRk8J4cG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313290ea247so1107950a91.3;
        Tue, 17 Jun 2025 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750174135; x=1750778935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jl/bvQTlSEM9wNIbLl4lqqqlObXLJdt8Y58R9WCaRY=;
        b=KRk8J4cGoLKkbUZ+sj8yT/2V5UofFQBLrTIfLsWak8bp3q3vbil/dRrQ987n28li/C
         x3jTqJy4ROzKZJ9UoZLHQL81ywOh4V425l2lsqkXMzcNn3gMMfs0v9rYLLw7wZu62lmf
         F4ylUImuJVPjz7OCFKCdzvo6Ehy4X/jXXQyd55OTrktaUmoMgMSomUTRFTkKe1jAgLqi
         1H2t75MvPqYtVOxiooLIuhAaLxVgPCbis3CpFzv3XHjEMsMtHJeyxDkaHoTjMM1e18sY
         rcTUKHj3MO9vTk4EITtVtryhOxZZ8Cu6JU5cGO9X0QTZlUskHwEVnAjEECeJKP/jvMJL
         ltdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174135; x=1750778935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jl/bvQTlSEM9wNIbLl4lqqqlObXLJdt8Y58R9WCaRY=;
        b=OOa3aNHU5fPrVbP8cgVOQP1SwiLmwYVnq5Q0lqOV6FwhNoF32yJPRNOYBnKxtjkC3k
         m4nL4GoGSvpZxttV8FgiylhVYKMftLO1hZEHwuBkGWNlQbLPzxP7i8ioK4MSKW1QyOLM
         sKTdcH1v7SypjIFbqWRz7+CFSjQfnjlr5KR76dPRAdi4PT2hMbAmMlSC8FfgfBf0O9W8
         68GO5Ju7hDZ/zc6CVhVdMRrQCwZ0SidplQpA3i+E6C1XcOi7rCFcIHE6Ln06gvWOZaHn
         75shGMRtLlM0GE57ZEAqTev6t8tfn2gJeudyoVEtGGDvlXkIqVLYCspROY92lZwqB35a
         Y6kg==
X-Forwarded-Encrypted: i=1; AJvYcCUOflcZtoHJZteBQEm1IcR69PCSm3/c7Xm49+7fdvfs4GDOrOPnwYZAw15fb8Oqb1N2lteCm5n78qM465KbVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/VEbZucdKHy0XoUBpdjTE9gn6LJtiwloMjPzXlIFKHpJAeXV
	6WVor8IVPpB2xxBs78C3c6tpUhh8pithA2LTMe6ZAX8alwqrEE/ONqYHdgP9QGJNhI88yNV2lH1
	o6ouG93Fj1XWOCm3m4uYYQS0pp/EkKhI=
X-Gm-Gg: ASbGncuT09QZCfJlbMuxd3ye4pGkz3cdKxnElv3ABeHaVeMUijuHKtHIDNoPznv7ATy
	X+SwTNNMkirKHpN4rCwwG322UmeWBz232bDVdff+iX+520tGk7HUIHMeP4FCu3zpk89fnh2UO/P
	OUmBNZRuoSFGbBdwLGy9GgbHaQjeJXuDl2uEb12RWq0oI=
X-Google-Smtp-Source: AGHT+IHz7EHSJNK8P0mXt11Gy3Vb93D7esc/bn47cDuavJY+nxH+F+vwX6BkXRQVgsSgHW7lKSMrgZgLjA69fuKXA9A=
X-Received: by 2002:a17:90b:2509:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-3142d383ef1mr730281a91.3.1750174135384; Tue, 17 Jun 2025
 08:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com> <aFFwumsjuAEIJVUF@Mac.home>
In-Reply-To: <aFFwumsjuAEIJVUF@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 17:28:41 +0200
X-Gm-Features: AX0GCFuptDR3g5HiZbpjFL-Mr5gbSNrFwDaY5tm0p7QAQA_x53XmbZs1C5Ik4g8
Message-ID: <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 3:42=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Will do, one thing though: the comment lines seem to wrap at 78 or 80
> chars, so do other lines for conditional features in rust/kernel/lib.rs.
> However I believe in Rust code we use 100 chars text width, any
> particular reason that I should keep these new lines the same (wrapping
> at 80 characters)? Otherwise I will make the new lines wrap at 100.

We have both styles, so up to you.

It would have been nice to at least know already if `rustfmt` would
eventually land on 80 or 100 for this, even if the automatically
wrapping is not stable :(

> Sure, will do, but I'm afraid there is only case, unless I misunderstood
> you:

I meant the "If `file_with_nul()` is not available" vs. the available
one (since it is mentioned in the docs already).

> /// use kernel::file_from_location;

I would hide this line, since it is a single import of the item itself.

> ///     pr_info!("{}\n", file_from_location(caller));

I would suggest adding a comment on top of this line mentioning the
output it could potentially show, e.g.

    // Output: ...

Thanks for this!

Cheers,
Miguel
