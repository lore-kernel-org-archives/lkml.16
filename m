Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4E1EDA13
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745635653; cv=none; b=UPOtKTjBoG8kN+7dJJrR7yXofwFXXxuE5azGCavmG0iEWOmvbzO+u0C/q2sq8UMlD8cOEzXjkAiBWHDUB+q3tOrFZfAqP5v265zbzQULvn+gQhGU0/temNusxUUi+9iPUIfVGSmflJTf3Jofkz6ucx67niBSjTxbMAO1Y0g2XHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745635653; c=relaxed/simple;
	bh=dEmOUfiZRIXIVolwLjkWI1ddw6yx/lDkW5uzEFubTfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCYgrDXlh3oCB6NL3mwzn0ZKsisnMTdvBWYW1shCpwFY1AtN7e0IcCun735n9fpL6Pu2XwDz7Fzdpzxx9jKWr8y6WIOQqZhwgkogWw+ZbnSIyjbm3BRI4bRSwhiCTDnhC3DvksrO//tuDAYbH/Yz+kDovFJ1+bCYHJlUSmsHOyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R3/HZBhu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R3/HZBhu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso3811628a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745635649; x=1746240449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+Vis1nKLgTG0tNyn050nySpncZ/GwqyHhgeT6wraGk=;
        b=R3/HZBhuMYf39RRSJI415KOvjRp7P3vDgeNbGWAh6/NzePYMGioiDZiRSJnlO5YdST
         EXThTGAKKHd8X2vdVohzamvS9AXIeKfkqg1kGcE5tIPVX5Nlgd7hp8hhE4DpCyb4oPTz
         nn3yooHlt6cwIKzqFAI7js3GxkfW8+mw1TWww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745635649; x=1746240449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+Vis1nKLgTG0tNyn050nySpncZ/GwqyHhgeT6wraGk=;
        b=ZmvtmbD7+3FJv2Rly4SqJi/9BvNtuxKBafiWmLoCuuuE+xvJuOY0RPp2+bd4aPwWI5
         hzirEd0vOnMxhAAk3aT90dp/KGw9QhEJ/3KqqvG2Sv0AkRgqq6JCzt1dcHzPYqlYos5d
         jE2M4I3wxiqpzIMdSIhkKPWKqaJi1Mo9kprNshQL1pS7wra5qmG5oiqqCUXl34vWDwta
         KjXJ9zTPtk6env8ZluPXz75W9lduOwl+Wh5d0pSLVEJiTajnA8bNBQygLaZ+/eLkwvZ5
         e3kp+19yVVDqet0ckTTJGrSWFJJy/0pxYHcbei1GM2txqwjWM7vcdNnjTnBRk3D/tX4y
         n7IA==
X-Forwarded-Encrypted: i=1; AJvYcCVEttIZ1YH2QloFzFJUmnnl04BbHAkN3daZbW7SLFu91H99KWeeux2KtJWOa/eNvZ1Jou0zbfuWo2mjYJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4e8xgy8nnMor6qhh2s3gCDhIGnRd3N79VT2AjWmgEgEBzrvq
	kyg2Tfqh5l9zrs/8cWJhi9LTGUSfQkIg0yOG0PQ15hJKxT4iu5PKx6BDZa6STVt2hbj0tYHYGoV
	QPPs=
X-Gm-Gg: ASbGncvUsPbrDxU2e9twKgm3ZvlafSmMUOFIwJeBSHi2dPc3UX/wDeT7m1ZM5FpPbIg
	5FCTZrxizrpdK9u6q3fVvfyGwknrn4eM8GnIRSxrdzlda9CudUCwyne393aXY1bhGlj6Uu2L/+Y
	J7z/vUJ0pqkVCRDk1h12P3Tp54u5IFGjjeKgzc/BeejRB7HE60mQ9iymn91rUTHsfqBibLbuDi9
	3OnXm47XjwAmvSw8MnJGnROGQz3HW1teZC/TihANfsCd3U+mFk/TqTd+oIUzGZtZyOJnTyU0Y+f
	l8l6SYw3rK6vwdbxZwi9NOYJKmAsWKKNGMobuCN1VZ1jsuCpUO6dmJgSO1DKtRBKIgdK7hZGDzQ
	gvY4neG1+x8VWfvo=
X-Google-Smtp-Source: AGHT+IER452nhGAIGrFcYynw9chZlX+Fb6Nsk9An0jaUTzmyAb9ZzztGqDOdQs9l62NmPBj2b7nQbw==
X-Received: by 2002:a05:6402:5187:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5f7395f1b8bmr1241013a12.13.1745635648830;
        Fri, 25 Apr 2025 19:47:28 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc52fsm2057445a12.11.2025.04.25.19.47.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 19:47:27 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso3811592a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyRQWAaVgq+PZd7Lzq9NGhUWrAoMbWVyLSiMFdS2lTNbo5DPhN+JdF1LbifHkYrwg3swxwWwXugVkLdYI=@vger.kernel.org
X-Received: by 2002:a17:907:72ca:b0:ac8:197f:3ff6 with SMTP id
 a640c23a62f3a-ace8493ad90mr121410766b.28.1745635646503; Fri, 25 Apr 2025
 19:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com> <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
In-Reply-To: <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 19:47:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com>
X-Gm-Features: ATxdqUHnAFqikS6_GN0pI3h-AB6C0IvbAMYuZ-wE_sCeheyXsgajo17SdM6k4eQ
Message-ID: <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 18:38, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> On Fri, Apr 25, 2025 at 09:35:27AM -0700, Linus Torvalds wrote:
> >
> > The thing is, you absolutely cannot make the case-insensitive lookup
> > be the fast case.
>
> That's precisely what the dcache code does, and is the source of the
> problems.

I think you're confused, and don't know what you are talking about.
You'd better go learn how the dcache actually works.

            Linus
