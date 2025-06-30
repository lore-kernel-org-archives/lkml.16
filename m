Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A752DBF7C;
	Mon, 30 Jun 2025 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304584; cv=none; b=ucCrDxAbzufCXoyUXG9KsenoWihhKLrXjmcAz7skerQ0HRWQGSsjivHMK0UTbZPhbI+yoE0bf+3tHmXz+jbhDdXUF8/e+aOIYZQinmlIKKnWnfM+IUrAsl6CaoBFDzucUxCn38zfp7g5XlmtNh+d1cD65RI4Snk0PJEGbMUevMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304584; c=relaxed/simple;
	bh=2EXuYQU7ofnFyRQG+83B5WuZEhJmLAt5qEiC4cw0Gmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6DzinQ5bygsJzikLB73KuA1UZMdNXxAeR/inRjkdfhfFEtzHrIogBDm+1iaLgfVS/sLlrWjYPF481tRCyKjiaISFUx/vHNWJgxdjfKWqq8BAPdvBHL0oBF7TsIhEd6qzVDtzpgXIW4+LdRrO6o6AejBF7F+Vm8vF8litLAuo/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyhlBMHy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyhlBMHy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312efc384fcso585362a91.3;
        Mon, 30 Jun 2025 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751304582; x=1751909382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EXuYQU7ofnFyRQG+83B5WuZEhJmLAt5qEiC4cw0Gmg=;
        b=JyhlBMHyg97spm5L6SCRl4lD85oO4h1v5VPfeZ3fz3ULoBfq8c1QRvcaU0Uwcr2Ih3
         QDFtAX6JnFPBJVaZaQ330Mw4/IBmVBb2I4r+CyOWTaD4eH0xULjVILifkyMS90wYhQUZ
         t6s6xyprDD27uRH8Npv9ncRY2AwU5Zm89GolEpbTuz18Ecf6HZz4wO1csPEvSiRzglBB
         s/Cx7cmcyzTOdmJRiqp6MBUYsuxLnOUyXjTzo3PDFjqEVRm+CgITBKblpUMTiVr7usSB
         /eOCeG5IN+SCQer3Dab3mc65lGsgsdlv1amAnqk0H6e3056rRXkxRc/+wDyA+OnyUoDl
         R5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304582; x=1751909382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EXuYQU7ofnFyRQG+83B5WuZEhJmLAt5qEiC4cw0Gmg=;
        b=dXDKDCp8khEsolq3KFrogN1LvCVOUkCSAzKt7uHn19UO+7t0IrlDW95lLfHFWrExDv
         aB8E/6DffDReKuzFuby4PlVx4dBdVKzvbFd4Box8akDFmsYqF5eeXXkWO4UyC6A9vp2G
         KpyldcNc7yZ9OmeXjnyj8mOnDjLu9qHo3t+I+BuyHV0ohOEXrw1E+22Gk2EEEaNx0qZo
         j7sNsULMZROhac73US4dTzEG7gadRiIKGV0b5S1H4CM/AsdapngQ+Cwo80Z9V6S7ohzH
         G/cqKPvFc7bexGZC5RNqlau+xB3fb+fm+XhajzZaUjle793XvwXdZLQha620TLJqTJl6
         X1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV/bEAQxhslokvD4nrig3CG3baAFEoFbOi8EX3rwrqVSgJswvrR9CwG0bd9sYrrpeg0bqsplVRPWCVDdCV78As=@vger.kernel.org, AJvYcCVAnMLCY7/Wx6os/fg2Evs/+nvRJmh1VZNS6myxv+L1lzoPu3aKfIJQRhS+zCFpXoGlqqYwzFS6QumMvag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGWjZ5iSdUanavgn2ZukkS2NSo0uv2UfLwTRiF9ayQ4iFbCjp
	j7MpQNXT9O6OONPDkH7oX8A1tsOCWAkvvwtbUvGw5ElQKz7rktV0lnv1E9bFd4K7E6033UBYlqg
	UxhNkhoa8ogp2BtDZ2G1buxd1BU5N5/k=
X-Gm-Gg: ASbGncuUgAxFzeT5K7hyK2+Sm/xLJoUluDIe6GDURm0CxYr88YvOsuYpW1RnyGaqxko
	SmdvznJoq6BYv1r4TuXQ6AIK+PzoVwBMBut5tZOzasv4dPyq/ZbhgZgYAcUji4Q5WVQjEr97AfU
	Few/zqdQUZBxuaG/nc6XCJeJAmBep7Q2RYRpFS61P3n34iD1TbjTGBZw==
X-Google-Smtp-Source: AGHT+IHNFAoy4LZZlwy+/lc9cF0GFvTc1DQcOMPk7F5P4dPZFOhIkhTNy3nlwLcOglC6k+NTX3ec5cp0d0xZXUE089s=
X-Received: by 2002:a17:90b:390b:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-318edd3da95mr5373513a91.0.1751304582241; Mon, 30 Jun 2025
 10:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com> <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com> <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
 <5F5F10F8-C082-44AA-9126-3436E14D0855@collabora.com>
In-Reply-To: <5F5F10F8-C082-44AA-9126-3436E14D0855@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Jun 2025 19:29:29 +0200
X-Gm-Features: Ac12FXzbdm4NBVEeo_qmkEvUx8JoBPgE0GdbkjzAa5lShkG5ds9T9qC8hzuoveA
Message-ID: <CANiq72kYP5WcrFNhdAuJ_mK6s4kuBoJp3E_88HrXU4zfcb5UzQ@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>, 
	Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
	Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 5:23=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> When I said "in development"I was referring to "dead_code" specifically, =
as we
> will invariably have some of that until the other parts of the driver lan=
d.
>
> Just as an example: IMHO it doesn't make much sense to only introduce the
> register definitions used for this patch if we know for sure that:
>
> a) the currently unused definitions will be used once the subsequent part=
s land,
>
> b) they will not change, as they're derived from the hardware itself
>
> It makes more sense to just sit down and transcribe this part of the spec=
 at
> once. It lowers the chance of copy and paste errors too.
>
> As I said, I was unfamiliar with "expect". Can it be made to work on a mo=
dule
> level? Anyway, I can try to make this work with "expect" instead of =E2=
=80=9Callow", no
> worries :)

Hmm... I am not sure what you are trying to say -- using `expect`
should just generally be as simple as changing the word from `allow`.
`expect` works like `allow`, except it will complain if the lint does
not trigger. It is essentially just that. And, yeah, it works on
modules.

In particular, it should not change how you decide anything else. In
other words, it is not about avoiding `dead_code`, but rather about
using a better `allow(dead_code)`.

Sometimes `allow` is simpler, e.g. when triggering a lint depends on
the kernel configuration or other reasons, in which case using `allow`
is just fine (please see the docs I linked). But I don't think you are
in those cases (e.g. I don't see conditional compilation, at least in
the patch above), so that is why I suggested it.

I hope that clarifies.

Cheers,
Miguel
