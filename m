Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365D1DDE9;
	Thu, 15 May 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319467; cv=none; b=p1fD/R0FC1s067SpXC0RRt2R+ps4cL+/5XbnhwJKIW9tTywI66u91mH1U4mmOiFkY1xa64fbV+UYfnwaQjmEHZdyzCEkpLLN9DkSdslcbmhk2ud38sADb3F4GQ108PD4Kw3X268MdTJZtheodfTdkL033voLwlP/jnx3/V9zHVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319467; c=relaxed/simple;
	bh=gBVcgI+bVIW8089OzOAqCSzjfYMoWZXlfDLqx2jCPmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCcDsC/SfT2szINBRRx8zVHOooFAA3l468ThujAE04TSGQt3mB7gSYupJYSCw+lNudJOPLWle7hulHemVq4oIaT3rohFgTUnM3zXgbINCNoJdRQA8vBQXYdjaiPc+3hKwQTE6sKYZeB/M0WFe30ot4kbdA0uFyVTjhhDEHoSOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWBx0eCU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWBx0eCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8112CC4CEEB;
	Thu, 15 May 2025 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319466;
	bh=gBVcgI+bVIW8089OzOAqCSzjfYMoWZXlfDLqx2jCPmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HWBx0eCUbJnz4Ejz3fckFs6s+gnEZIIp5C5jdVn9DnNWM9TqiKGmZmrhvw0qaFxW9
	 jXTT+wDk175eR/8/kIGhU3Zoa7cDhHB37ljjTt+fuHk0VoBT8B9+s8wvQ9Vg5VbPfa
	 U+N9tFo6QZpxfldW2YwX0IGUWjEVLESNHfpT9z/7ffAKc5tm6W/whkaKxVXLCNybTM
	 Bba4SAAj1B9n1bjEQkTOxtwP+90oD+dLYnJjyWbZ9qSgSLrR7vOsG+IF6NeYnHGGA/
	 GB9JkYz7pgoK9htWDseTdpuJ4cUyzAyCfRU4cChmtK0GJpVbDhrU8HPQPGC2TvAFcH
	 qrVD8Z9Te+A4g==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so210873266b.0;
        Thu, 15 May 2025 07:31:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuodCV3+7lRBUJoNuLScLCDX7LCjDA9wtsjdiguFx/ivm+4QnlMgC019tjpGu/+tiCGi04EB2c3mSUr6teiD0=@vger.kernel.org, AJvYcCX63CD9t0Lp+iJj44sSCW3UHqGbLMPNETYOFcJdbtyF7x87KMWCr4f2TNKaKFJ0YrImb5XNZVtoEtAeltc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMIhZPNmTI+4HreHoVdCrZpvwr+96xxYGLJEQsiRaKmyQYUo8+
	BW7SPTwHI9dSe5EpnKKM0Ib56nWsNZqocq8XqZDsB5l2OAvzkikDMdQDmMhwvI0aKQ4DrZzvLf6
	dKsEr/LNPOZdokuYb7seAy28GjGc=
X-Google-Smtp-Source: AGHT+IGN876loDT8s+NGMAWAM46LQrqWUl7KnLWNCjkwPsoQU/5Vy+NFYEVa/HhDZO7UdP+c5HGPEGWy3u340bSCL8k=
X-Received: by 2002:a17:907:d28:b0:ace:dc05:b186 with SMTP id
 a640c23a62f3a-ad50f639d09mr341806666b.21.1747319465054; Thu, 15 May 2025
 07:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com> <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com> <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com> <2025051532-gentleman-reset-58f2@gregkh>
In-Reply-To: <2025051532-gentleman-reset-58f2@gregkh>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 15 May 2025 09:30:28 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
X-Gm-Features: AX0GCFufjMIcd7AJh9ZUGCRgOX9zzN0oFtSrFsrGtHN8krwCpqrMyqtRdj_rCqQ
Message-ID: <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 6:43=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> > Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
>
> The "problem" I'm not understanding is why does the kernel have to do
> any of this parsing at all?

Nova will need to parse ELF headers in order to properly load and boot
Nvidia firmware images.  Nouveau does this already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931

In addition, we are adding new ELF image support to Nouveau to support
newer Hopper and Blackwell GPUs:

https://lore.kernel.org/nouveau/20250511210722.80350-55-bskeggs@nvidia.com/=
T/
(grep for "elf_header[]")

For this new code, I used ELF for new firmware images. I did this for
a few reasons:

1. In addition to the large GSP-RM binary, there are 3 "meta data"
blobs that are very small (<100 bytes) and I wanted a way to combine
all blobs into one file to keep things neat.
2. I didn't want to invent a new encapsulation format from scratch.
3. ELF allows you to use existing user-space tools to parse the file
if you are so inclined.
4. ELF contained all of the header bits I was looking for.
5. I was even able to include a CRC in the ELF header, for extra validation=
.
6. Structs for the headers already exist in the kernel and are used by
other drivers.



 What does it do with these segments that
> userspace can't do instead?  Why does patching have to be done within
> the kernel at all?  What prevents all of this from being done elsewhere?
>
> And ELF parsing is "tricky" in places, and you aren't using the existing
> elf parser, as proof of needing a new parser in rust :)
>
> thanks,
>
> greg k-h
>
