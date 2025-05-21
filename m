Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E7F18BC1D;
	Wed, 21 May 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836442; cv=none; b=h7YAXsbl5qMbd4ipB4CTnuYaBzNSrt2QWAmPXVuH/06y+JBpsdoqWs+MVUFdntrIzePuBDNBLAvk6MIS4pwvujPJe+ui+2Qx3hv8Lea6RvCmPrIS7ne0sDwKge9rhxsJDDRPIRtg29mdKMU4YhJFgFVl2gCXil87Xh87XYBT/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836442; c=relaxed/simple;
	bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA5bp8Leu29y/HHlrqfT19DD8e+MmFRb4DUyIZJPgVyQgRw03HC4KyWa6R/ejBAiyvWglSW4SEDmOzsQ76uLfbeaNswbO5kN0mZa6snm2aBHTpwicBXtNasY5U6ILTI5TlIS97bwMSA8NlPl5QtN/jq1DOVDflGcn2JYK1nk2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCBY/6km; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCBY/6km"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26fabda6d9so719585a12.1;
        Wed, 21 May 2025 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836439; x=1748441239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
        b=CCBY/6km85CwRzTODsZxK47GMCOEp7Vs8zz3K7mtbb7T7WSj4G8Vuwrrs/wnysY8Ee
         uQUdJF/pMsm/KvxSKJH/pNw6cKQ31Fv0CBJi1M78pvV1RA0HOew0s+5Ne+MLPMwJ+MNv
         t5zPtfh50R/er5uRgq3U6Nk4Xr38YcluKk/vu19v2x0mA8PoGWzD/hrn9Etd+HlqsRN6
         1Ig/ICHo1dSgztOYVDBXw8USK6FrpDgECQS2FyVH7AaINls30K1JN72KbSFD2JtOXFbO
         Ure+sGVB//ful4vBPO2O4falKI60FoRWDFS4bEZzapZhiT04W1ZSJLcM/pg6Dg0OR9mN
         6qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836439; x=1748441239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCs14DxQ5NqkyOeBSguPQlw1Wnbae96Ke81Jokz+gII=;
        b=epGsI6MEBnGASOQwOFzXRKHk8U+gSVIH/td+7ItaMzo3+JUf26AopkYn1lS2H9HhH1
         VPwv/O19mIX2Mz2dhBXwB7n1PUlsH6FZhiEGGyONukNrjHd6QhtswitkanVHXY9C7e3a
         PxZvqccayX+9+Wdro1xJbw9X3j/3ICbSt6cAMq0yZtldSREHa7IYqy2waJgQ/CCprYyn
         z1J5Q+IOaSmEu92thmeIyx2flDMQj0AT/N9/2fJ7yst3vNNtWYFO//kiql7FA5ZDe6bo
         Lw9T5iNp6fQk5bEXy5VlsBOGZSrLfaVybneCkzVewiqiF3N7qV9nhx/jWW2vHoSvY5IO
         Fo2w==
X-Forwarded-Encrypted: i=1; AJvYcCWD+UZmemX6/A/L2QlRyAmfJDHyJtTWnHB5xRyk8mS16nsQj+gkV4a1yG/53KN1KTbyp9FNP3dbWtzZ8IWrjv0=@vger.kernel.org, AJvYcCWgNAngvN2081ROaUM+qH5wbJeeNoFJuepeh5pxrOyRl1FzEtt5vE72lNFbhvtqaiTXYwWdmWGtJYxWDTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPLogfLLseJ1d00e7CdbdIqRarguBaH+lbYbbbL03VK5CoTDF
	h2mwBgX3F07EOMkSV68R7m/ARLWbB+MrDUhBAJNevFygtO/InNmMuHPi3nxSYiWWLPruGvBa1ws
	GXbExU+bZBFUYVX4bksSkreSnsWDn4EE=
X-Gm-Gg: ASbGncvG1UaLurroDvnHhajmA6U5ExjMQAyAw58XmGfp6NuEh0193KfwAFh4F2KiUe8
	NNKzRjbPcUNPYDU91ot1YhM9AP9FotVtj581CuiIIB5dUVfQD8n3YiiauP5fddDT/GYci9/U/HQ
	J2MWq76Uq+jiPn5spubKgoihtKibqcnB6d
X-Google-Smtp-Source: AGHT+IF6aBM/50Jwx88vE8L8XntLzVmxeGWByLSHx68fUNc0gFsjGteE5FCLep+weivc24FSmszHPWH/N29VR+FdsN4=
X-Received: by 2002:a17:90b:1b04:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30e7d5bdb2bmr12445110a91.3.1747836439087; Wed, 21 May 2025
 07:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com> <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com>
In-Reply-To: <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 16:07:07 +0200
X-Gm-Features: AX0GCFtcjHzj-d0hFEXFvN-nr4E6i5NNd72l4twkSGnegqafCiAQwJElREpdn5I
Message-ID: <CANiq72nDCfoy2v-VbMR9ntNbTt=3JoYsVhz_gqX=Q=4iWN1YCw@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>, Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:57=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> This does, thanks! I'll drop this patch for now then and will assume
> that Naresh will eventually send it. I was hoping to get this in by the
> stable release that is set to happen during the weekend (doesn't excuse
> my sloppiness though, sorry about that once again)
>
> Anyways, thanks for being patient with me as I learn. :)

You're welcome! :)

Let's see if Naresh says something; otherwise, I think it is OK to
send it under your SoB after a few days (acknowledging the diff from
Naresh).

Thanks!

Cheers,
Miguel
