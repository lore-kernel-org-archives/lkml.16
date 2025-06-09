Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27CC218EBF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491970; cv=none; b=PuU2MckNh+lerT12sMI8IWk5yR1YVrOi45vxRYW9w/VhLlS0G1oyEdGK8hAbjOXIBNytZyYRRplhuC2Ko8A7e02H5gylYxlWPe/7Y37RwHLTs3FQfK90scE+V4VJLMnFL3+1bHrDFLZjIf1D0a5x18sRPx+YRZ5NeRJ9ifp+xE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491970; c=relaxed/simple;
	bh=Na30GlknzdZiABLMWSdd39v+Z/ENok+XEyt3IOc8ai0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmF/4Q8p+sXdlE6yM4SJmmh6KcX127/Et5QDYwMR/wmz7gWpFNxbnvWz/BS5Uo+Qv6GMVDB/AuZvhXHg2j4OirzblOFNmHYCLiMWiYUX4Ox6DbLcOhQuwmFMqzfKcCav7TEqO2h8HW8HltxpU7aTnmaFtu5RFsOHsl2jwaFhWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZxJ+ESt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZxJ+ESt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2C2C4CEF0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749491970;
	bh=Na30GlknzdZiABLMWSdd39v+Z/ENok+XEyt3IOc8ai0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OZxJ+ESt7yh3BZGQilp23HXBvZ3O+rCKdAIpi31zgkM0r9bcW8YFRzS9xz2B2Ntl1
	 /uPk87XUJxLRvWgpJQZG8JWHSyS4RPXlU2crtOXcTlzlC+tbGn6peVVCxthbK56Hio
	 Mipb8TTbiKCjgYLCKqYO3y6uyPRgyJrC2gkjqz2Ya21xkT3U3utBu8bFB2EhU1KsYI
	 Op1n34sYb77uS3V6HBmiV1jYr3ibXPD7ddysaz256PDco2flBWUFrNVoXcmIjz5cxd
	 srloO2KKcvDwDVEU4NLFQtPntUkPVAbT9c4pAfFmqRPS0FJC/fxdcwTkBOEwtu20NJ
	 F1/+dgX5RPmJw==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fabe9446a0so43912286d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXskCYSzbhnYrxVv2GozwjdYpda310eGthb3kLkKT360Q8ck4g/laIopiK6xYrrE3SQlTh9Wj5bM3Po1E0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/i+PlOQcrQ+0kvIrKyytUvVYbtKa5v+6JpS3ZMvr6ZMzEDpf9
	KGqvIWVznkQb7U4BDDUdKORjZcUKXVV95xNApwDzx2x5QZWB9efE7vRq1gZ2q3YKPvpQgEy7ZCb
	kZ/QPj61B0i6l8Kicv4grcGX+ftjfrVM=
X-Google-Smtp-Source: AGHT+IE0/1F+tJmdfUTBxMygYYerrwYiSSqscVu/E+k19TT9Jo7m4EFtGcDYALC6bTqErlWjJ2Aqe20xCFO+jVRrbSY=
X-Received: by 2002:a05:6214:2682:b0:6fa:9baa:face with SMTP id
 6a1803df08f44-6fb08f96f34mr214305856d6.35.1749491969419; Mon, 09 Jun 2025
 10:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603223417.3700218-1-dylanbhatch@google.com>
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 9 Jun 2025 10:59:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4o87DA0HM4UHjuAUsYbYkuuwZCo9v5Ht0N=OzRTEqztg@mail.gmail.com>
X-Gm-Features: AX0GCFtlZJVV0vhRsQmmP-jCcIp5jN7wzYtrnRX4e8Iw_dQaZDg_1BhZGrTrnkg
Message-ID: <CAPhsuW4o87DA0HM4UHjuAUsYbYkuuwZCo9v5Ht0N=OzRTEqztg@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will and folks,

We (Meta) are hoping to test livepatch arm64 with our kernels soon.
In general, we strongly prefer patches that are already landed in the
subsystem's git tree, and being tested in linux-next.

Could you please help us review and land this set and [1] and [2] so
that we can test them in our kernels?

Thanks,
Song

[1] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@=
kernel.org/
[2] https://lore.kernel.org/linux-arm-kernel/20250521111000.2237470-2-mark.=
rutland@arm.com/

On Tue, Jun 3, 2025 at 3:34=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com>=
 wrote:
>
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
>
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>
