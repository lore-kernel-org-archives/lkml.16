Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33001D8E10;
	Sat, 28 Jun 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751103872; cv=none; b=blCA0jPj8kOxIyPeTwbgrAuYfNj37TnDXJN0vTAk4iiG8HHWyVopkLyCdBiBIjiznftMFzWP333d+o9xBWxkuIUjhsCEB1rrhcKQlJ7wzWbBSpxCBWV0MhaPLIIzcMC81gBpA5VRyguusZN76QIfiezxzLrmLPrTXnz0wOpgLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751103872; c=relaxed/simple;
	bh=GZksN5HMUgHH96NAs1DWVYTwkrpdxxqRwpGN+wRNTvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRi6EFqJ3HTDby+iBcJP09es3gpWElWkV3N/zjJQ6P5ATP73id5eexdWpBAAoMQM3Y2SJE5KzA3log9XXEJUWzEU2PrDDIbvx1PuKc3yRT7LZnOpFtXxQEcaImFuiRRiDfViQeTsmLEgjNJgtPnVg16u4A6bAxlfo5KBXdrmRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlFHw2jH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlFHw2jH"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313067339e9so406448a91.2;
        Sat, 28 Jun 2025 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751103870; x=1751708670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcHXHz1B1vmqvkEsjx9+yGzCZswDC3Fos+ipXd+Hnrs=;
        b=OlFHw2jHrKSUWM6IM+0kS6WzA5R00bev9R9mRQFzNM66hrjiMDyhmH53yCIAJ+OtbX
         hgZyhIQX/++udU0VEuSeaU9V330MKA1pCqzuP0S0OgMPBX4ZjEhr4JQn/+p0/HoYPdiO
         Y57gjQs0RD0ssi40EBxMz5aGXd+007k453XS/BahV1bV4Vl2rmL3lV20VBgNdlnlGMYZ
         gaoQeZQyN7jwD0r5h3YePauI3XVn0VQwheoe6XJfPD4ykawKFN7NtY6i05VIzMoHkNw/
         JfyhF43gGExyBC4Pf9wtXtKi6RwWHuKX2zKQ2YgtuW+VCN9a6ZfUNUsP2dR/EB4xLfg6
         KmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751103870; x=1751708670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcHXHz1B1vmqvkEsjx9+yGzCZswDC3Fos+ipXd+Hnrs=;
        b=WXao/2JCH6HzwZ61XjY9FVn08Y3GarwLNQWqKVQDQMTbLaZDFFrVR2S0wN9i+vzE4u
         hOD+DojW3+asnimw6Wdj47DSnborAMeLHm0y/kCtimvPOj3zb+joBw7Wkyp4Fhl+T93Y
         AmUZdfl4NUc6NbQsH2VQ+OzpXw70njayZIBFnv3zkI0pn1KbOzPlCjFbsti+zEAB+sfw
         +fBf2VO0WCdcmLO/cJqzZHHNQ1OWzPan79Gx/O86YJShWLswNy//+uWr9n0VX86oxqOJ
         rVT4iu+M+u+alYNALLmOA3jujURGoU9qL6zw5IUVw22oaxgC5wCjZsnk+H/h4BBt0e+i
         3UtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGOLv9Bg5iHcN2TMh3E0U8lib3SnhpT/vPdPFDBGCf8P8DXLFA73jQlSOV9zaeVE1FbQyONWmKVn92a1g=@vger.kernel.org, AJvYcCVO/Fw+dSY8MjjVJbFsnjcxDKJfCEWGlhr4ZS5s4n4jT/2Ao8GQmvoUUXTslOKI2/jzwjR38v83dw9Nbx7FdBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xVcKE1n3HFRVSVXOd64qdzBsl4C+X4+JHvWKM07UwpHG8pt8
	AsUs7TOMKvAkegtU2r+TrPAAX+7322WN9lbOnm+f6bSjU6+fSo5KRj6q1FjvxDvRt/QbaleUNrX
	SvGN77j5MtcEij5GSoxuL/W+cAjoNfmo=
X-Gm-Gg: ASbGncuwXSLwaQBjZB7y1Omanv6hAMnjEvfOtOO2PEs4HqqiqPgjcqgqeUCmzKuR9m1
	viwjJ+iRIId84LI3d+bMOXYSsLZVygJxl0t4FHKyNhspo/1rFYO9NzZkxYfUGW6lAcujPW8lXMu
	BSKNkjGEHOe+gRJIdQ66lZd+u4NDGoR0lwO731wzXvUks=
X-Google-Smtp-Source: AGHT+IFpR2NtTiSDwMI35AZFOItnq7Bu2P5qPUqQ/PtEJe5JryIFAhz1wxHrIbGMDKN7vAFrdD0eE+FrYWg2knHpE+8=
X-Received: by 2002:a17:90b:2e4d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-318ec4117d4mr1354608a91.3.1751103870255; Sat, 28 Jun 2025
 02:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 11:44:16 +0200
X-Gm-Features: Ac12FXzxLzruq7u-2xy50vbt4xsqJsvBZY52gJWCC8AWCWuJvvAtFd8VhM8e2dE
Message-ID: <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>, 
	Alice Ryhl <alice.ryhl@google.com>, Beata Michalska <beata.michalska@arm.com>, 
	Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Some procedural notes and general comments, and please note that some
may apply several times.

On Sat, Jun 28, 2025 at 12:35=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Signed-off-by: Rob Herring <robh@kernel.org>
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

No newline.

> [2]: https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr?ref_type=3D=
heads

The base commit seems to be the one in this branch, but the branch is
a custom one that is not intended to land as-is, right?

If all the patches are in the list already (like the regulator ones),
then I would suggest putting the links to those instead. Otherwise, I
would mark the patch as RFC, since it is not meant to be applied
as-is.

Maybe I am just missing context, and this is all crystal clear for
everyone else, but normally patches are supposed to be candidates to
be applied, possibly with other dependencies, all coming from the
list.

> +use core::pin::Pin

This should already be able to come from the prelude.

> +/// Convienence type alias for the DRM device type for this driver

"Convenience"

Also, please end comments/docs with periods.

> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}

Clippy should catch this (orthogonal to what Danilo mentioned).

> +use kernel::alloc::flags::*;

Prelude covers this.

> +// SAFETY:
> +//
> +// This type is the same type exposed by Panthor's uAPI. As it's declare=
d as
> +// #repr(C), we can be sure that the layout is the same. Therefore, it i=
s safe
> +// to expose this to userspace.

If they are not bullets, please don't add newlines, i.e. you can start
in the same line.

Also, `#[repr(C)]`.

Regarding the safety comment, it should explain how it covers the
requirements of `AsBytes`:

    Values of this type may not contain any uninitialized bytes. This
type must not have interior mutability.

> +#[allow(dead_code)]

Could it be `expect`?

> +/// Powers on the l2 block.
> +pub(crate) fn l2_power_on(iomem: &Devres<IoMem>) -> Result<()> {

-> Result

> +#![allow(dead_code)]

Could it be `expect`?

> +    author: "The Tyr driver authors",

Please use the `authors` key (this one is going away) -- with it now
you could mention each author.

> +#include<uapi/drm/panthor_drm.h>

Missing space.

Cheers,
Miguel
