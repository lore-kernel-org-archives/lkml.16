Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9BE264619
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383363; cv=none; b=SHol2ShH7sKGH16UhQjY2r75Wq/tvalKadZYa6E6l4d62/1eHGbh5nihx35e0IiKdiZ0LedAYRqdwulCNXvpbRqla6PsPEGhcEOTobvOlYkR5G9NTTZVrT1JWWQ4pYnRJtqcASY1s8QvKK5IooFvJDPCMcegPK8bsZtXrhB8pLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383363; c=relaxed/simple;
	bh=+P/38/XGylBbrnqHr4fmhFxUyNTi6UXbs8nHVB2Fpn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asO11bp9ge9rEVHAhB3fTLASkb5YnITDbOuS/e7bm9RBkx4peLhogZb3934buUlpPF5A2Cy51IqGeMtXWZLIN22gVZwyyF+aNpVQhsG5rtUI9EZjvSA+kJHF7tmNzOmi6+kMbC0Z/qdvHjV5WVuGJ7Ne7Fgl5/s2WmNbhVwTJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqXzynFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqXzynFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF89AC4CEF5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745383361;
	bh=+P/38/XGylBbrnqHr4fmhFxUyNTi6UXbs8nHVB2Fpn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqXzynFpgpUJBC8Y/k/HHg7/gmTt6v0q0NItrSdZXAfYWWoKKqtJn/gWqjnUi7D+G
	 SGqD5Dd71qa0a+m/7QkzgQSDtfbLA83+bZLkkePiU94annKJwrLMXYgNNXr1dTlamT
	 gCwAX6i/U5ggTylSBTVDojRSDFh0EG0zhBKl35P45ShZl71uxrsSDy+bTrbrXrIVW6
	 g4MfhUaqjtet1y7nxQ0Ys/EI04kdtheuds2Xd7tvDNTbCQPmFKEJ1TIdiucIsaMlmD
	 Pna7lK52OhKvyWWZlJzTz9xHpeRL9ibnmXD1GsroliWuqxgqt2soHKJ0x2w1mZm6sj
	 Mdh6Sv/tyP9NA==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f7019422so59028746d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbPL50fsIYjIhr7Mn/LJ9yrEdMX1yQllFqApQ6ORnVgwS/AbwLdLLEWjHMuXtaJIJS2kNUSEZtBLu8w0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKolc0e0B0yXyCkXNMoT2NHElFiZ2HdRPUI+RUYJ0C4cywD7f2
	ONP4EVU5ev6gYxmFd48RJTfcrvo/FEFDuRyilvCh1WztuOkpV3TOzzA2f9Y7TjQIgfvazUijk0N
	vGvz3Mnb2fp2S34Q7KnsafaDzjiQ=
X-Google-Smtp-Source: AGHT+IG2iujGmrxmxGSApdKh0xQE22k8iMs1bF+5rk4Ii7hQjuZ4WUz3Udx35mdZ6VJ/yA0mcIltMuJefK87Efm8gQk=
X-Received: by 2002:a05:6214:23c6:b0:6ea:d393:962f with SMTP id
 6a1803df08f44-6f2c453aa96mr300370026d6.16.1745383360780; Tue, 22 Apr 2025
 21:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
 <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com> <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
In-Reply-To: <CADBMgpzrM7PMePtWaZLaaNXt6z++V0rX2VXtWK4vzdTCS=BpQA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 22 Apr 2025 21:42:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7rMHdjzWdep1x-vZCvPW=vW2odS=VpA2ei8+QRxpE2wA@mail.gmail.com>
X-Gm-Features: ATxdqUHHlly3-QqUr3R7Aq6-RrjYz1OgoXfTzwDESgaWpIEF4419Kqd8nrEEBkM
Message-ID: <CAPhsuW7rMHdjzWdep1x-vZCvPW=vW2odS=VpA2ei8+QRxpE2wA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:27=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> On Mon, Apr 21, 2025 at 11:25=E2=80=AFPM Song Liu <song@kernel.org> wrote=
:
> >
> > On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@goog=
le.com> wrote:
> > > >
> > > > To enable late module patching, livepatch modules need to be able t=
o
> > > > apply some of their relocations well after being loaded. In this
> > > > scenario, use the text-poking API to allow this, even with
> > > > STRICT_MODULE_RWX.
> > > >
> > > > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: =
Use
> > > > text_poke() for late relocations").
> > > >
> > > > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> >
> > Could you please share how you test this?
> >
>
> For context, we enable livepatch for arm64 by porting this RFC series
> (along with other internal patches) into our kernel:
> https://lore.kernel.org/all/20230202074036.507249-1-madvenka@linux.micros=
oft.com/.
>
> The way I tested this patch is: with STRICT_MODULE_RWX, load a module
> and a livepatch that touches that module (in either order), and
> confirm the kernel doesn't crash.
>
> Without this patch, a crash is caused in apply_relocate_add() if both
> a module and a livepatch that touches the module are both loaded. This
> happens through one of two code paths:
>
>   1. If the module is already loaded when the livepatch is applied,
> through the module_init() callback.
>   2. If the module is loaded after the livepatch is applied, through
> prepare_coming_module().
>
> In both scenarios, the livepatch module's text is already RX-only.

Thanks for sharing the information!

Could you please help test this set with [1]? This is a different approach
than the one by Madhavan. We were hoping to ship it soon.

Thanks,
Song

[1] https://lore.kernel.org/live-patching/20250320171559.3423224-1-song@ker=
nel.org/
