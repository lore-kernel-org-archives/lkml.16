Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58721C186;
	Sat, 28 Jun 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120986; cv=none; b=Hl96ZMMJSBscWb5DcN6q7f7PtS8IRF8qvwWIhkmZMXlVM0mIB7OIrbBs/ODp2lj2gkBB9nDYKjBduuDwsZHiBLKxMAtLZCWpLScpxBZ6KcEyDnDtdjfCZ5ehPBTd7ubgJezbhP/RAwP5hrSNuKfRF38sGI/vryjjpWzQgGUsmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120986; c=relaxed/simple;
	bh=J6PmAR2x3Gaj2uMT0husjz5AQ81kQiQjYOGaLvseu78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdP8+qtMTBxKoUiHrItOdtiBvhZNoRD2XENVaib9/h8/bU6A1UXg19EKFjiOLVw4RL2vIGZddiey2z5JbjflJZYo+lZnXT8qEVxRmU8ZqOARsYM2RFiV3azVHEg0IUoPOJO8uO8/Btob4yEqqepq3GRLXklNjRr/YKg51m8154U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKJbYdvM; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKJbYdvM"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2fcd6fe970so523727a12.3;
        Sat, 28 Jun 2025 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751120983; x=1751725783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8rK0LNTNZFI5uOITPOK3NWDXLKxWYEPkVY5RC1g95E=;
        b=lKJbYdvMYJuk17gczWFSHZMH8lcsWWnxtfFBDh+jzbd99FpNreATtHf8VglbEdt9eH
         2bIWeVibrZqdyybsEYEKTl4E2KYyqNRNSOYGViRpvSJQn8SUNA3v661UyIelxPhM0MwM
         rmz2GA123solgNw2YhQXEgvw4UqPuqdyx0x+ZZVceJoIyDD2Pdml/ILLbl0ulkJmDpCT
         H3TOlaEpWmzUBMN4kPslx1u76zA+seTuVr/YLZNWVK0aVmtzMIXn9BntM3A/CiovgdQE
         3wWMdHayYhc1N6cKslMSM5DZpv7LrdrABFRB9/0K6hnHgCgGaAGn27TznFaDLQOs+zFa
         1WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751120983; x=1751725783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8rK0LNTNZFI5uOITPOK3NWDXLKxWYEPkVY5RC1g95E=;
        b=HNHwaa5YDRgOIy+y2E7KpsV5rj0rhWk4BC1xU4IyzbmmLGXL86JHWA8OD1wbeqB8D+
         KMJnMvtAgsCf8DndQjSHIrYq5vWjUcO5WRa6XsSkfOot0QZiKd1Rb0K5oyafxKscZLzq
         G+BiyeqzZo8C2/dEhFxdsgVFiIV32MuVMAATgvI/dZxPuQuD4sGNcHaSvlydYTVt40dO
         k3tcsgo6Gdo8vTjKJQAcKyPtFaJhcEae3iP3Lk9epwikG29MKQvWBFr4fOrsYc/t36vo
         TTxCE+1/RhYmb75sC1RBRBeof+fBvgUuj7nLPAL2EmrMABBty9Qf07kw2GcKpT9tuAce
         H1kg==
X-Forwarded-Encrypted: i=1; AJvYcCU3cXvcCqI9CL4aGphauMnUMfo2JwPgHBiYhIDFGVSObJkroBcNC17Q5sqUxKDtSoN5MLLdttpv030Z7Ik=@vger.kernel.org, AJvYcCWG3iYU+KCOwPPe6SgOGLdJt0er2FXZw/y5qz6ucTI/456mMaPPoPVahsg17HbVtp80MQhO42le12MAgrHbXaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZcfFfEiHcJbY9nddyy4UwvweW61233ScRgbrONjktwVGIe32
	vagjt8i+J4x87u4AhcOneVYYSQQ5Aj4OdQstrmKbqM7+GrDgj+tFwhHQQXUgTTK83gVhHMXFCBg
	DNcrpKbAP0eIeSvZny8ZtUoislwVaTws=
X-Gm-Gg: ASbGnctye/F9PQNEDvB3Cx7kBUu/offYHIqzC9WfBInnRoF3MBFc8mJJUfyfkNX2Rui
	8PRELStwIjMc5bQPHq+OWAKF2M5xLuEJ2p2pPRFJKc6Hmc3+JfEe9haX5FfRP1VJX16K3Lu8WQv
	SJ7pF1KGqznmskkjqvbsvdwKJGwTnyLCH8csVcBv+P5Tc=
X-Google-Smtp-Source: AGHT+IEBB8Xqc39C0N994YZDielieKfflkaDCiTAdwXbea0djsWBlJZ8r6j9Gki1hd80aLoznxs3pd6yTbRPtIErX04=
X-Received: by 2002:a17:90b:1dc2:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-318edfc8f90mr1619475a91.8.1751120983155; Sat, 28 Jun 2025
 07:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com> <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
In-Reply-To: <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 16:29:31 +0200
X-Gm-Features: Ac12FXwykK9WpEDj8sy1SYn6UJGGfGhd3PbUMsp81V7dzsqhylvpeGilPLCu43U
Message-ID: <CANiq72kWGUbpDW+WjKki4JUYX63j_GFBcyQse-rgddwyoFw7cg@mail.gmail.com>
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

On Sat, Jun 28, 2025 at 3:06=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> The branch I shared is drm-misc-next plus a few dependencies, i.e.: 10 co=
mmits
> total if I counted it correctly - all of which have been sent to the list
> already and most of which have seen a quite a few iterations. I should ha=
ve
> explicitly said this, though.

Ah, that helps, thanks. It is completely fine -- I am just pointing it
out in case it helps you make this easier to land and for others to
follow.

> Anyway, I thought that having a branch would be more tidy than listing th=
em, as
> the branch shows in what order they're applied and etc. For example, the =
patch
> for read_poll_timeout was cherry-picked from Fujita's v12 series, and tha=
t was
> subsequently dropped in v13 until the rest of the series was merged on v1=
5. I
> thought that referring to v12 of that series would be slightly confusing.

Yeah, the branch is definitely nice to have to see the end state you
want, but having the Lore links helps a lot clarifying what the
dependencies (and their version etc.) are. You can use that chance to
mention anything out of the ordinary for each dependency (e.g. like
you mentioned here).

> Yeah, it's a constant battle between having spelling check enabled (which=
 on my
> case flags the code itself, thereby producing a mountain of false positiv=
es) vs
> not. In this case, the bad spelling won :)

I would suggest using `checkpatch.pl` with `--codespell` (I don't know
if it catches this one -- I just saw it in my client -- but their
dictionary definitely did catch some for us in the past).

> Hmm, I must say I did not know that this was a thing.
>
> Why is it better than [#allow] during the development phase?

I have some notes at:

    https://docs.kernel.org/rust/coding-guidelines.html#lints

Generally speaking, we default to `expect` unless there is a reason
not to (I list some possible reasons in the link), because `expect`
forces us to clean it when unneeded.

Not sure what you mean by "development phase" -- even if Tyr is under
development, it should still try to conform to the usual guidelines.
Of course, if a particular `expect` would be a pain, then please feel
free to use `allow`. But is that case here? i.e. you will want to
remove the `allow` anyway when you add the new code, no?

Thanks!

Cheers,
Miguel
