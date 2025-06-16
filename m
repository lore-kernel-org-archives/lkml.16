Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA34A0C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113327; cv=none; b=oc8V+NUWWtPKxAIqOBVkNGoUhDqgGGI1h1eaaWUReFeaFcsH9YCZcwbGWNArlg+sv9rXt9fe2hNK1hZMWCDznhTvxDN0uC0AIuDYa3GpqQJAlvJ6SaDgejvy4MEek9sbfj2GO9r9Iv/wIw9Y36Xl5pPtUZwPeZ8KQYeqlUHhhag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113327; c=relaxed/simple;
	bh=jRE8q825ITu9aQFou1ym5Nrl8CwPEfbXbjwT7qI4k/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKinhDgrFYHy7f9WY1oykAfxBliiNlxZzLcgcaXHB3v1jXY9+VMy1zQ1kr+9IO9m1qzklzy1RPriqKpcztufGDdK0DiBN2zELy2yjoO4xX1HgqbGln7puJAcfCc8mPrNp1h3VKnqr13/i2+2pcC5vxUInspdaS2RsdM58GrT2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzSAdGdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzSAdGdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FECC4CEEF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750113326;
	bh=jRE8q825ITu9aQFou1ym5Nrl8CwPEfbXbjwT7qI4k/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EzSAdGdudgYXl5I7sScTHMIraXWbDbGDbmTQ8fo74+bXL+K6YQnZxiMjbhq49+glp
	 vk/2v24aJ6Jspdl7nYg+kgt/tRpFtqtdvEoPYObQ6bZLFyt6qejb6zjjpfM02zYta4
	 CczfLEL/gbrpEJdj3pb4Xr3XMkxzvwfsiwD5KNFwGTWbdxrQNdIunK1XhMleg1Ll1x
	 z+Y2uLnomv++eCL7wbR9JONhuSYkP78sL3xwYE698KXa5tu0QLvACqKfE29vmjhfW9
	 at/ci+7x4sD8k/ePhZSKN0M3NX0BJ0xgNH8ffl5IyDI9l15oz+m45Aqs5oN8jdKqgo
	 eXedmpUaVWGww==
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a745fc9bafso23049291cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg/u6dEZDG5oNf+vd3sOr9zE4g7TxgLuUzTcjjZyVc6ju7LUgFaZUX/EhvgaaZf755oOBTCzn0kD6GtxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfozrrA7JyyhQxONoInuOZIxRIRL1wvqEE5NT6W/BnowJjvG+
	wkVveICH8rFkxZn4QZq/RVbZM0UPyDOamghm9CMLI2Y8TOJTprWbz6yDpXvBmHNHnTMWTy1EzWo
	1LUbeXg60mSlDT07EzTJnOHQaUBLpaPY=
X-Google-Smtp-Source: AGHT+IEfmvAp5VLvaA2Z6l6e0kzOjdnQpsHXb/3iQIsmmgJHO0aw+Xmaq8UUE+SfG5vEUerhV9acyq7B9cnAFuWFmnI=
X-Received: by 2002:ac8:7d88:0:b0:4a6:f0bb:4d83 with SMTP id
 d75a77b69052e-4a75b8d40c0mr5529711cf.8.1750113325821; Mon, 16 Jun 2025
 15:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603223417.3700218-1-dylanbhatch@google.com> <20250612151859.GD12912@willie-the-truck>
In-Reply-To: <20250612151859.GD12912@willie-the-truck>
From: Song Liu <song@kernel.org>
Date: Mon, 16 Jun 2025 15:35:14 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
X-Gm-Features: AX0GCFtjIT8CYMuT4GuWpCCQiOclI0xAAPv_Ht-16o_ETrbw7xxCug6vp97kulA
Message-ID: <CAPhsuW5jhwxcd01XBwLJxsP46a+P2sPLcZwtxAX3h7U1=JV_tA@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will and Catalin,

What's our plan with this set and [1]? Once we land these two sets, I
will respin [2] which enables livepatch for arm64. We (Meta) are hoping
to land these in linux-next soon, and back port them to our kernels.

Thanks,
Song

[1] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-1-mark.=
rutland@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-3-song@=
kernel.org/

On Thu, Jun 12, 2025 at 8:19=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jun 03, 2025 at 10:34:17PM +0000, Dylan Hatch wrote:
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario however, the livepatch module text and data is already RX-only=
,
> > so special treatment is needed to make the late relocations possible. T=
o
> > do this, use the text-poking API for these late relocations.
> >
> > This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Us=
e
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > Acked-by: Song Liu <song@kernel.org>
> > ---
> >  arch/arm64/kernel/module.c | 101 +++++++++++++++++++++----------------
> >  1 file changed, 57 insertions(+), 44 deletions(-)
>
> Thanks for sticking with this, Dylan:
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Catalin, I assume you'll pick this up for 6.17.
