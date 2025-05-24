Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942F23BE;
	Sat, 24 May 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108109; cv=none; b=U2sY+8augKDpZh9VrRFFFQtWhdLPfW55ZAUQBQGJh/pR7TzAO9H2t/mtM1FTUtlm6bejV92EJXCus0VeZ2Cnr9fge0/Asqfh9zxMBcAW/6eBj4KbrkNE/DVNjG+bECZEYCCKcvVFMNYFQYUIROj6Aw4OYWKt9jIRcjrPSZaeY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108109; c=relaxed/simple;
	bh=i/LAb6xVbxT1aJ90RfLFJRh5A3lT0zdiGCBkjFs2BmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doNqu0xhBP10cR9cRLFLrbgOsIsEvWYhVYzq+kINJOacnsl9COV5TzyjdAjfKjhIKPY1yMAhPCk50vk4Sspvu9W4193W63vy5uPGjAeA9AwRzPCtt/+n7C/IniGQovkN58QyZVKmswitOBdYNH9yLt7s4GMC9DTqrjyRiu0VmLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOwYRy2u; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOwYRy2u"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad564b7aea9so375683066b.1;
        Sat, 24 May 2025 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108106; x=1748712906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6esos0NCbJWOrHjcUciV7jdqA8qN5ZRshgoZfehNMKs=;
        b=BOwYRy2uTmy1EpOVc/c6Rs0Kh8DZHBrPvvvYhmjZ64PRFfQSAsoSYLrBkbBKzAJpRe
         cz6h6n3r6hXeqs/I2HN4attqDPtyOamSa5+jR8fLmYQ0HUyxY0RZYW2GWSnYxCXUgRqR
         1vwoR5q5ZIIqbizTflzqB71W8svb+1Ld+72mu3nVAgymfmIvnJS/M5Eh31E1ryysi1Qf
         RxxRS5wqgXdcRLJVwoinYre1HKvZcoOYr80qywfE+5Il9TdP45wF20Lqn0R44+A6Ql5K
         I71hDWEWMF1KzVTx6P1vovS9wNnLXYdE1wIf1PGCa882CgyJQiGuB7+uM6TjjcMzD7Qc
         oZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108106; x=1748712906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6esos0NCbJWOrHjcUciV7jdqA8qN5ZRshgoZfehNMKs=;
        b=uRHaJqcJ/Pr74bJduwdszDqWoTRUe9ESSgxQ/b5GGrMCTlX+LB3fp8A3+YX5VHyrjR
         EesRowNfYVd6iggh5QAt+BASo2aBL2bmkqcwdFiEdmZ+Q9GqLKPXEsGgrodv5SDBB9vT
         +XIEYxrn8EqzkwP138vj1YfZW/33yne7+qZIuCpeTx5fu1ckmshjZ4qLnd+zYbf6Ggby
         1DxShKmk4wqftMgxiMFmCuqk+xkykJlqeFaQNY3CdWZqefWhUKV+kLMf1Mtx3DjHEkzH
         Es2UhbkIlKxNDkZLDq72vgEq0/562GNE6MTf5zeH0/07aHYoes43wCkqovsna9qVOHhP
         Exww==
X-Forwarded-Encrypted: i=1; AJvYcCUD9MD6zFivE7yIIO93AZWa9JeBbHlba/slvaLOmQv+7aXE66kJlrH3C5ML2r8fpOMohxUrIBQSy9s=@vger.kernel.org, AJvYcCWFVsucTuc60jqMnDLDJfU/PyR+i0S7AJTFvgKRldK/AWLYZ+zqX8k2fRvCTvghAPSNAG1V/O/FM4Qp0a1B@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzzc7lBFNsRwmIQ0SB5mRgYwyanm6xR9UecINrnjIgASFXXrU
	gxjnmKZFknCEVW6XqqdQhLBANHSUWRqBjfCR+iYoBz19qYKr7EfU6aNhxlThv4B0iy6EhBGpTd8
	hTnza2EzT+hPjU+TK/GNVZz7oDBfz1sU=
X-Gm-Gg: ASbGnctNqnWhrrlrcu2lMjOISad+5BQRgqDQn7yVeApZtUddKSPNVff/NjfJ6wAuQ5j
	E1s4n9407cYG9nlKaKTZKfCTQyKarOME0RTNSj9rBsqleapaVwO0RycqdbI7yhEBIlqimFPuGRH
	AjNIPJ7MKnGSH+Fvn2w03CsSawN6igkQ7Hmc3vMF33Kc5Wm8pFnKAEFZNnaojG07i/xw==
X-Google-Smtp-Source: AGHT+IH7TxQKxV5rqnlT4lgf1dRHo65M8Huun796jND/WC3MPI6epVJVwGlHgQV8HtghIxJJCAIRdYl+87zUl5rXFss=
X-Received: by 2002:a17:906:6a26:b0:ad5:4998:9f1a with SMTP id
 a640c23a62f3a-ad63f984b0fmr718065366b.5.1748108105950; Sat, 24 May 2025
 10:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com> <87ecwfczcw.fsf@trenco.lwn.net>
In-Reply-To: <87ecwfczcw.fsf@trenco.lwn.net>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sat, 24 May 2025 13:34:55 -0400
X-Gm-Features: AX0GCFsi-MN0UA4uRCGebgf9C8Rt3Zsaglwx2_dkVsiyykORTxqO9nOADvqJFIA
Message-ID: <CAC0Z3JtyP+QKdP9WiuyURfnU9ccobzvChCBK1i=eENm5DEyQNw@mail.gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
To: Jonathan Corbet <corbet@lwn.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I have added the fix and sent another version
(v2) of the patch.

https://lore.kernel.org/all/20250523-drm-doc-updates-v2-0-e517df152cf6@gmai=
l.com/

best regards,
Abdulrasaq


On Fri, May 23, 2025 at 7:58=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Abdulrasaq Lawani <abdulrasaqolawani@gmail.com> writes:
>
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> >
> > ---
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> >  Documentation/gpu/introduction.rst | 38 ++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/int=
roduction.rst
> > index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c52=
65b1431fa18110a7a 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,43 @@ including the TTM memory manager, output configurati=
on and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +-----------------------------------------------
> > ++-----------------------------+
> > +|     User-space Apps         |
> > +| (Games, Browsers, ML, etc.) |
> > ++-----------------------------+
>
> [...]
>
> Please actually build the docs after a change like this and look at the
> results; they will not be what you expect here.  You need to put that
> diagram into a literal block.
>
> Thanks,
>
> jon
