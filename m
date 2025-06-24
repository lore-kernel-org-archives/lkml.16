Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682D1DE8B2;
	Tue, 24 Jun 2025 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799643; cv=none; b=grvmfxsVKbd5fjAP0vGQwQyef476mY1x8CEAKv2l7XXOmCZx1Iq56bkcjh7SuemtxC0BKy1UD9o96Ph8KcJHsS7pY+FaaIwbgT2f7eMXytk2X3lcCvCzscbVV6kwZM5LxscSY6oxP8AT/znT6HvnnTal89u0HpixWCfnyLKEeQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799643; c=relaxed/simple;
	bh=mxpbj7+7aiyOHL0XvewuzjpkoAy8jbYePAbVKI3rvvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1K9l4q9g/oaTPoo9Dbef425wK6kOf2QF8lEsBHoujpCZl5YpzrIeyR91uwZS1+9yGzt7g4X/K/lex/kc3PS/IEsTj/Ospi7yo0EEQtnwwaBkJS7UbY1I8OdodBGtTAApnBqSJ75fbS6QzFwPeVM89JPV4Y5t5e3lJt3JiGWHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbO9NYV9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbO9NYV9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2369dd5839dso13387485ad.3;
        Tue, 24 Jun 2025 14:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750799641; x=1751404441; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxpbj7+7aiyOHL0XvewuzjpkoAy8jbYePAbVKI3rvvU=;
        b=MbO9NYV9pfZ2snp6l08LdtNGVU+xCe+Xr7tPhHsh1/iCs6cAD2LJDkdoRMreQgPwyP
         XvnyDwHcQ/Ou/UVvUgwbGSFPDLaj4zFz/ysvVpWf+QOz2ze4ogq1I37A+ou9IkuD9UAm
         hXpsyBDKl1t3vwZsH/8dF80ruF3QMhWopz+wBQOJuRVKkyvXFLnR0qyy4ZnkO1BbX80r
         4RuErioTlco3vLzYAZ0OM9AZyrasWwoLUI3z9wq9C+GATq8IsEr+q/Oji55EotFtXvWX
         KZgKcI+gDsWoheSBZ+AyPgGlIdYAH0Rjkb7j9479E4N1gLZOpxMPjr2WNLV3lgXA6DyF
         aFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799641; x=1751404441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxpbj7+7aiyOHL0XvewuzjpkoAy8jbYePAbVKI3rvvU=;
        b=bDNGk75ON/AP8/l62Hx5CrWup+vr7vo3LV4Dnl49gVVDWwokFQGix2bWMJRp6/waKF
         Djrj47tFAy/M2aF1lINlRiMdilKcrXFSI78b4MlUYC3Lrjmx+r4tvueU3HSm0s2gXypo
         JyQVwuKZkExfXg0VcO4TWXw9rsRoUnPC+A5rWcJYSt1ek5Qql1+8LpMkY+EsrwW7tn51
         b4mPRCgNt8WoWIAtzzskERJtTpt9E9QzvaDHGl4CbalW9BMkCAwjFoxK3yoGoqhtYDVk
         H+u21wgiBPxGyiwbiz3rSaB9Bz1D9KacZFbpg4utpzgOa/aVygRNmyQOaSaSAks+6Zh/
         va4g==
X-Forwarded-Encrypted: i=1; AJvYcCUVpPX/sZ9QntuFVhv06gT1X55QF1rLW1yonkbwlWaTFJJimzWXMEMbl0OX14qeHIop+s/Nr0dv7v3oTVU=@vger.kernel.org, AJvYcCWi75iAxPPRu6NmQFRSGVAMOCQfJ9v+yGctg3z7B0EciOHnI3HsJEhm3nCP7S/n8ne9UCLNvSyStjLb5QfgH1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7iCeWkDkbk+aZAePqRytf2y3ukL5/gUIdf1jDho1qPHF7b9z
	S0aUT6RzvwtyjgaThfoGXTJ3D/dp/6+Y5KyJNMjQMR3fUDP1cO8t62vBKamw7/GdILaP7XY8RrZ
	O74emDd8AjgMt7bjNdYgfFIVoQiF2mos=
X-Gm-Gg: ASbGncu4RKEa6/ls/iewBvd/KHqKKxJPp5Xm3K4vfJVz9ksmCbJ6+bBvwG5JTvgjtGQ
	llaHi10vgBWMIWL4ZlBlnBAk5Xbwmf627RDgRx1WvjF2D8QlVdpHSEHB8BHGhkIZzjvmXUZxX+X
	p47MMkbOU/13pf9IMxcvk1kZ4G4eUBblEO9mJ60oRay9k=
X-Google-Smtp-Source: AGHT+IGYyQcumkAenptjy2lvnd5vYH65mG+PdJ1dpzQGeDvwH0Tz6ACQggQr4CIa1EsfWlDtmSngXOVNhnWKT+IeLtk=
X-Received: by 2002:a17:903:1a67:b0:234:9fee:afe0 with SMTP id
 d9443c01a7336-23824080784mr4083605ad.14.1750799641529; Tue, 24 Jun 2025
 14:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
 <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
 <CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
 <87plet4cjq.fsf@kernel.org> <_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
 <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com> <87wm912sjg.fsf@kernel.org>
In-Reply-To: <87wm912sjg.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 23:13:49 +0200
X-Gm-Features: Ac12FXzTfPaGunExTwkXXEgL9VwYIwPnJPjGxxTKuOoYUf9mK8y2zn24qvDSg-k
Message-ID: <CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 15:11, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
> None of the options are the right choice.

That is fine (it is also what I have been arguing in the other thread
and in previous times), but that does not imply `into_*` is not a bad
choice if we really want to follow upstream.

> Cost and ownership _do_ line
> up for `into_*` in this case.

No, ownership definitely doesn't line up: `Delta` is not `Copy` and
there is no conceptual ownership transfer. While it says "owned ->
owned", not being `Copy` is quite important here: the guidelines
clarify in an example for a `Copy` type that if the input is not
consumed then it should not be `into_*`.

Sure, "Variable" cost means anything could go there, but that doesn't
tell us much, i.e. if it was completely free, we could just as well
pick `as_`, which would actually provide some information since you
know it needs to be cheap.

So the whole argument for `into_*` is... "it says 'Variable' cost so
it lines up"?

Now, what I argued is that we may just as well define our own rules,
since that table is confusing and doesn't cover all cases. If we do
that, then you could propose things like "all owned->owned methods are
`into_*`", which I think is what you are essentially implying here.

> I do not think that is settled.

If you think so, then the patch shouldn't be applied.

Cheers,
Miguel
