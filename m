Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD72F872
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303117; cv=none; b=Ug7Vwj5f76Gi0vxvqIRzm3cbmamhQLkMxMOQUeniG5gUpc5c61on+3So9UK4CcW8curgz/BlfK9uEBocJGlxeXaxaRToJv19OZBYg+NFwOTv/IYzkcKE0tX2hQTfeVtz8V3JXC022FjNOYk2zTMacGBKukkxo60RCSbim21pdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303117; c=relaxed/simple;
	bh=WoUER+RlE16ITj8VlE+L9VguQMKJtmcK5lmnna4nc70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIJid2Rb8fnC6glAg2OnjbWxDAs5ByRsj68mgJXuuldOcZhNTgrGRtl09f0pZP8Xr7x6W5EnKvK+ZQHKTHX274RVhYCom1MUeSkBpz8EIr+RZ+ZkGbITNkNQzqSriF/akNXT3jSz+xKsVbk1ebRWtX5d0SYV9QdtV1iSjH4D0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYr1Rm0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYr1Rm0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF1AC4AF0B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745303116;
	bh=WoUER+RlE16ITj8VlE+L9VguQMKJtmcK5lmnna4nc70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QYr1Rm0vtNdW2Jym6LuMjLQXkwPJ7nYN+2ABwFI6PIoQA1M+PpuEfXJbszuhS28oh
	 DuhLfDCDd5f6h9e9sFgVrhS9EkiWR18bayr+l67aQ90G81u8vnA2wZwAqBcT/FmHSv
	 GrA+LB6ouU+bje/LqK/OfBtpab9zUJDENENR0xf32JcC1MRTwCsMwhwHXmHC47TEZq
	 cXWAsByaIMZg0SaHMQbQfrt0Due1hyNEBippqKDKiyS0Fm0ORVKkf5MEzTEEde90d9
	 jrwG9EbL/zrocRA1qT1bV7NBtXNqUKj8iT1bR9bHN2StEzsyQ5GoAEoxwSX5LvTF2K
	 K+XUOqaqJU8gA==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c554d7dc2aso767246985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9zEjSkj2xuNPDH6x/DHAa4AFwa+JtrbGxOJKUUN7P6T0nErawZUpgxJ49LZD5q2v0W42DR6GlnZBnDI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8lreaMwdNTDdeT1KAv9XVal8q0OozhzZtZR66oVVB2gPQOcG
	ABoDL3aOvr0QAdebWFld427oU7TaGfIwHHqKJrliqxc8F7cDwSo0r8lorUE/G2KEyzB2cjpENp5
	hFXyPAQnWtjMyQwEwl9s3O5b6ahQ=
X-Google-Smtp-Source: AGHT+IFq/kCrp5sAoPRx2ufn6VDCk/MgNt2ImfpjzZ/wbGytewzE7HFRZ82iD9KlMJRBFRa24L4t6F5ZSbo1aByp8XI=
X-Received: by 2002:a05:620a:46ab:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c92804d668mr2515679885a.51.1745303115971; Mon, 21 Apr 2025
 23:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
In-Reply-To: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 23:25:04 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
X-Gm-Features: ATxdqUEv9Xn7L89x3Z4tWfx0SMDCVGs9AoZFtdJTNbi3OfiiHlhmph8HruZ6k7M
Message-ID: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
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

On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.c=
om> wrote:
> >
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Could you please share how you test this?

Thanks,
Song


> Acked-by: Song Liu <song@kernel.org>
