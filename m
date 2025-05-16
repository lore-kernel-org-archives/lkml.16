Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2A86359;
	Fri, 16 May 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412933; cv=none; b=CGuxkQsSjxd8/xlWW7V3PXiwXWaX+fnX6FmPicjkpuMX3x4QCwMKJOEKZGB0bqlM9MghHLZu3Cg+IG2urq+MXvd4ftPf9wChpj5+UkYH2vDAm8XJwxEKttUb7qL+tqVGJ2h/ab9+cORzUGDyzUGtYWM+i0AZopLhCxl1V3A5+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412933; c=relaxed/simple;
	bh=FTYFrVj4awtJfW3qAwCEdjiCVlrz2NLcawO5FwDP0r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrY5WSeVeBAUHi2iIrbfulLBqq7rsuEnrzqxBkeX4Q/5PQ0YWO8cNrKn4JyydQWxj2xJN60xwyJ+/cy9v+sgFb+c2B/Xr0vVrqa/vf11eUzV/lt+Y+9iqIpq5FT+xKLonSHPCJssnfaRQXWck9i+wW8lhkW2EJxJT5lCITlm4m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKv8qMhE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKv8qMhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F277C4AF0B;
	Fri, 16 May 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747412933;
	bh=FTYFrVj4awtJfW3qAwCEdjiCVlrz2NLcawO5FwDP0r0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKv8qMhEt1A+0M5mYm8QwOzYTXehC9Zi4DVHvENNv1g0x7V3wgpNiSpPPhQ9kZHlC
	 wGdqzkhnR28rly1BU62qup7bQqvEVyHonFZvqZyrL5vSH89qiUlqq7ohQ6Am14rYgb
	 NR8y1iJDHoNahcZ7J6/vQNCHIO26Uf8GXh2S7nx5GF8qjIgrSvkLyy9JqcYvKMCrcv
	 BvZ4UzEULeXQEJkthM/5VmiQu6t30PeqvA5+hBAY6MihWtr80Qm0B1ocILQySN88mJ
	 6aOpIcYfqhp6IMpfNcVOBeec3Qpm+6Vfvn+IA+XG9zvnfOljfadBgq0qJ3j3zUniUk
	 4vVQnFxIX0d8w==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so470774666b.0;
        Fri, 16 May 2025 09:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUJbuFoB1sJ2WzLvBFganEFoQV4brSqsKR9i7z3y9v818KhdRtb5bDd1FDtdxdas423P4wEPURSVcr9RJhstI=@vger.kernel.org, AJvYcCX8D8zGmF9Y2qUAZQ3dPGAHl3ge6Lcm4MhHSTeBJ+gLethqmnVq9VxDq++WJTkcqh904RMk34IUOPxlo9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQoE7OODAm/cithYIhiya+qDZCl7+6lpz4SishWAz6VPwzv80o
	QruqX/NczwnfLsmlz4QplPGE1alYOCLGYcxVX5QsMn2SYJFiHdBwvKxsjVDT/zK1hNoN1FLTFZY
	N2invyysQc0zQYB/ZpJVxdGpXdKXfZM8=
X-Google-Smtp-Source: AGHT+IG9tgxiM6/+KJfbVumIqvRQLZ5c9aVQRfgPzDiopXUShRVm3aRy3IvkP8/2aCadHOh79NuDcntss8gsRLhft7g=
X-Received: by 2002:a17:907:3f19:b0:ad2:18fa:e265 with SMTP id
 a640c23a62f3a-ad50f64a1admr852145666b.11.1747412931597; Fri, 16 May 2025
 09:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com> <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com> <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh> <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com> <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux> <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
In-Reply-To: <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
From: Timur Tabi <timur@kernel.org>
Date: Fri, 16 May 2025 11:28:14 -0500
X-Gmail-Original-Message-ID: <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
X-Gm-Features: AX0GCFtA2M71135St4n-WiGJNvjyNod59W6UCg5qaqRXjyhf40RlVnrlWP7C0uo
Message-ID: <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <timur@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 9:35=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We use ELF as a container format to associate binary blobs with named
> sections. Can we extract these sections into individual files that we
> load using request_firmware()? Why yes, we could.

Actually, I don't think we can.  This is the actual GSP-RM ELF image
you're talking about.  This comes packaged as one binary blob and it's
intended to be mostly opaque.  We can't just disassemble the ELF
sections and then re-assemble them in the driver.

Unfortunately, for pre-Hopper booting, we need to do a little
pre-processing on the image, referencing the ELF sections, and based
on data from fuses that cannot be read in user-space.
