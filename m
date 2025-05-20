Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29710E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740440; cv=none; b=PqeTZdkKGps3UrZRE3vgGnWNw1fJ4kCirErbYivKT3+wleHfaW0ce6em9eP7yxXdFByV99AAXia71TLPSdoLMvI0X0RAKch5x4MmbnnFLtYICFcumY9sC3vYo3eTc31B1JRBcjP7Jrtgt0MelyrL2n117if+QH6ungEeBXDKx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740440; c=relaxed/simple;
	bh=PtaX0eBM5rletBJOMQmU8fYeu8UgpPvbAhTQ+2lwVeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPIBWoMyUNBxoQAU+/A9v6olYiiJ8Z7sLgFxZua2VYvYsuMUlS1PAiGAzClsk10o14IdeaRz+ZsClYc7z1g12HQOvu3cSR14uj3Ed1fnwf1cZDKXJJOTc6Cx7Bu2/w8EXTL7Se9sIh9ubjqtUh3WY+TNlx+UM79ufmpBTZB0iec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKeORPix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKeORPix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D885C4CEED
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747740435;
	bh=PtaX0eBM5rletBJOMQmU8fYeu8UgpPvbAhTQ+2lwVeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WKeORPixViJ5QVTOa7xSDNtMKwAJ4PKXJDMCxtUz6pJba0sGjHeRe05zQS9zzZxKD
	 CG9g9o4EU3Mq0q2va5avW4Jc4nh2z69HEUaI90SXLqb/JpC2Ou5YR0nV9V2ZzZmQ8/
	 /An9e71eLv7sTveu6CBGE2gZwlA1M0D89Km0JwX+Poz7KFIW0J/ndoioH8696lO4az
	 YCQRKqp5PueQk5JFIetg2T7y3+o+WD5C2tByRrMM3rJwcZI1HV3Oqss09T/04COQdQ
	 AbnIiOL27uNZgylr2ZJIKKsMJWJL3EzV/AS7OlquVLdHWrw02SKELl75GAUV6pIVsS
	 lo/4Y2v5rtnPQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6347038e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0zz+zYy0CnO3LKmSs/dvMhpU4rhS/5Va3cthzu+okZdlAIk+uYksnxCqT5fc0h0WHIGNzfgOqLMNPDrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzToWFBmkR3DpbNqI1NmZIg1hsi++aQtHgrdNgHDDuETrrYniLZ
	bAKRvVIOzTS5W3faUAuKCb4HFTk2BcdpdA8FuZ/QKTm/1kR/mO2tQFriasxP7o7iVvek0Hlcpxn
	0byrOk6mqxVS+OdMmYI7niwH7rq5io98=
X-Google-Smtp-Source: AGHT+IHiRvXXbr+kpasSHC/WXGqsjTT2Omyut2z3YqHnmNkZoK18Mz9+jO4HOTVQ52Ihz6vgpyUvszuZVY3b9z3d48Q=
X-Received: by 2002:a05:651c:421b:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-328076e8934mr47660331fa.1.1747740433974; Tue, 20 May 2025
 04:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-10-ardb+git@google.com>
 <sjsxy65qkdikr6ppdyce2mu7exbnlvxdjbf3ypfqbpspf566rh@cc4atj6vn2pa>
In-Reply-To: <sjsxy65qkdikr6ppdyce2mu7exbnlvxdjbf3ypfqbpspf566rh@cc4atj6vn2pa>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 13:27:02 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH_0+J-Fq_Kk8MCv0HGibN+NHpZ=CO4gK8TQiZp09O83A@mail.gmail.com>
X-Gm-Features: AX0GCFtLv57t5NGDglfzK9iSzJjAvJ59u5VG4x-S6-xPd68JyphHLj_1fPUEL3Q
Message-ID: <CAMj1kXH_0+J-Fq_Kk8MCv0HGibN+NHpZ=CO4gK8TQiZp09O83A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] x86/mm: Decouple MAX_PHYSMEM_BITS from LA57 state
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 12:59, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Tue, May 20, 2025 at 12:41:40PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > As the Intel SDM states, MAXPHYADDR is up to 52 bits when running in
> > long mode, and this is independent from the number of levels of paging.
> > I.e., it is permitted for a 4-level hierarchy to use 52-bit output
> > addresses in the descriptors, both for next-level tables and for the
> > mappings themselves.
> >
> > So set MAX_PHYSMEM_BITS to 52 in all cases for x86_64, and drop the
> > MAX_POSSIBLE_PHYSMEM_BITS definition, which becomes redundant as a
> > result.
>
> I think it will backfire.
>
> We only have a 46-bit window in memory layout if 4-level paging is
> enabled. Currently, we truncate PA to whatever fits into 46 bits.
>

This is the linear map, right?

I assumed that this affected MMIO mappings too, but it seems x86 does
not rely on MAX_PHYSMEM_BITS for that.

> I expect to see weird failures if you try to boot with this patch in
> 4-level paging mode on machine with > 64 TiB of memory.
>
> If we want to go this path, it might be useful to refuse to boot
> altogether in 4-level paging mode if there's anything in memory map above
> 46-bit.
>

Agreed - if RAM does not fit, it makes no sense to limp on. I assumed
this limit applied to any physical address.

I'll withdraw the patch - it was just an unrelated thing I spotted, so
that shouldn't affect the rest of the series.
