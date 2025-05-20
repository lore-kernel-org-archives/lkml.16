Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18B1FFC54
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760632; cv=none; b=Z7Nq4mCRDF8b2lKCf/0L/z2jwAjh6ClSW6c5BPXPfq8UMMJzKqaogcs/UM2ZwfqINBdnr6rqbptMeIRI1u9JgFOWl4KPdk7E46l98Fh2lFuFPmyhpynkVMc4nB0p1Bho2DpDOKJawds0pEllvHOKHPdqgtiQE93nB1nOEUdDU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760632; c=relaxed/simple;
	bh=3Ps9im7Hc9N5HbH/qseV6thcNGxd6rNY7p0Daho1VC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlTmQDNo/29mbUgZAScir4tUjtWIguGxm2PYWxerfyVacVDXprVYNaB5+LBOytdtTVIpo2j6NslBt17tCoYIub1Dsids0RIqok5UnX2aMPl5no7ZGj6spcUm+poXhJ8PUBYRCJyo0MEOW89dnlNk/zS+XAJx7IkNBTVVa6/Fqdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1Xh32BF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1Xh32BF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A88C4CEF1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747760631;
	bh=3Ps9im7Hc9N5HbH/qseV6thcNGxd6rNY7p0Daho1VC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X1Xh32BFMl/zbfaMT5/OG50JK462JRjVGUhvKzziaJ5UO6MNiX+iq+/yfhAK+zrZh
	 Zg1godPMMJoGwE5qyRhPPbMY7S0TG3NJ/x4zh/jy92bKaGiT7YFQ71ZjKDypqBer6c
	 0kgHfKcCDx4FGhusEzPOFlpXKH0r6YN9WW5KVFy7gsFscbw6sdWYUWu9dFu1HCtVTw
	 VuMmBfsZaZAuw6gHsgJ/zFwNbayiwD+k6fz8WtkbIhIfdj0foGLtHQ/VL63n+6dPrp
	 yVnn9mTdb3NVmfAJVnvsN9dDtiZC1a9moY60XrieSLkLEOVrxsX6DXnuzoiQSz5MSk
	 N36huZa5piV8w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso54229861fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeEhEQE2/EbOyBqBzefhmzj2Ni4ESgzmIwGUyAXVS7LYVBQzQ+YdcccbL3pBATTyeRQz4H3fYfay/W/qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5iAG2LF1YMkCgaKFgdUiBK1iqUwx4Ealk6CKv5sMcKS0QKM7+
	0fNdQr4aZ/ku7zG/oj+8Cg/WExhttFtCYsnbe703nwCZt5MTyjEVof4xf0ZU0OuRtYl7h9n0k51
	DBE47RIpni1CtjAvi03qMC1c4g8+XTnU=
X-Google-Smtp-Source: AGHT+IH9edSBCBx5n6YJL5VZjNTH9UOxOovmE8e4gtRTAvmx8o9L4VKBfYBqPwwFLT2iyBhQq/JW9eTENmXtt+8tAZM=
X-Received: by 2002:a05:651c:111a:b0:31a:3744:6ebd with SMTP id
 38308e7fff4ca-328076e89femr45422431fa.5.1747760629590; Tue, 20 May 2025
 10:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com> <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
In-Reply-To: <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 19:03:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
X-Gm-Features: AX0GCFt3N3voX1hVAf_deOVxGGWrKF66m70N9HJp_lPOsw0-jUebL67H2rMD1Gs
Message-ID: <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 16:35, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, May 20, 2025 at 01:28:52PM +0200, Ard Biesheuvel wrote:
> > Are you saying we shouldn't optimize prematurely? You must be new here :-)
>
> Right, but do you see __pgdir_shift on a seriously hot path to warrant this?
>

No. But if you had read the next couple of patches, you would have
noticed that PGDIR_SHIFT, PTRS_PER_P4D and pgtable_l5_enabled() will
all be derived from this variable, and the latter currently uses code
patching (in cpu_feature_enabled())

This is also explained in the cover letter btw
