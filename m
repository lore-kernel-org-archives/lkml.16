Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E74430;
	Sun,  6 Jul 2025 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751809348; cv=none; b=lFHap2Ff6RdjUh05+wgDMZ6JtjEpL33vSH9j60jNhUt0aUHIEmPweQn8pTZA4kfU0qGKIiSwfdXKmFEyUyNAU6OuNo8JjpeC0zwkQG3dSlbRm8Iw1H2L7t6t+U0lTuVhFw+4A29A0KJzBcZgcegbrU4mxDBa01FibivURIgSxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751809348; c=relaxed/simple;
	bh=Cy4aTnm0PK/yKFsyGAYaEAZDr6+UCRqKUiOSIDFcSU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRl6kcI9QFYxm5DgFFHvOZYXjzVVgrjciQmMDg/3mb9AXd4b+kLoWxlhuGlq2u9x/RkNmnQRTFmvC6O8uAGnmnjKN0LF/Cf5TjelDCsNv1wZj99yTTRSubesvmW9xIf82DNglv2fRYTueEbKHz/WWmXL1938HgVDTNVUpPodN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijpd0ays; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijpd0ays"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7481adb0b90so404185b3a.1;
        Sun, 06 Jul 2025 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751809346; x=1752414146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9p/OUC5tbbC2lQw5VTLyJND4KlM7wvMWqPSiwnuyFw=;
        b=ijpd0aysuCKfeJjUVGU/e3t/GEAbTdARAKTngx1LF5PUix0bdbZnNeIrJEXCYsW1Sj
         NbFUBftXT+thXS8PuE+bwWGAzyVrWu3IqAaNFdZLWuYn8TXiWYrTRRi9MOwgSQVDQ5z9
         ZrnyaOrTRZLUI0fboBNBEfLH/GducV0t/ne0/mZ7fI+wCNSmH9+bG4nJK+fDEffG59nM
         TFcp8EvrfTeeH9/TJk+sn26s8rOLT2wJDLLPbQi822nUrUEKfxP4XJw82SV/UyM+gETo
         wFnCPn+qtSDHROlkJZuvI5V+jWXubeF7a7HWijYuOrssxx3X9Gmv/5x7WsxXFNUhHlBF
         ziOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751809346; x=1752414146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9p/OUC5tbbC2lQw5VTLyJND4KlM7wvMWqPSiwnuyFw=;
        b=eNW/d7BYVyfqKOAI9bwMh1iXLbJVjIN1yR7ELOjZ9uJM3e10mwg7I9GEgtIzqW9Sfi
         MOwES1Lx962Sua1Y1mqg6zpvwB4pZHA6KgYAE1XIN03ODSZ23AgzKq/kxF+fNMagXrxm
         PlcqeIyOAJjjfUO5eCUi+qLPZZBy8dcrOJwRgRQ2ZybHXPC3XrNRlXS87hptQ2a5Btjd
         SvThDvcOeVkfKSQLP1Middb1q6APbQryjWELjnn4p/WuCjtEe4gGTVYGC6KWv36e7N76
         R2PxJdOYAo37zH8x9ywFGy+lCpHK/gu8Fm+S2GjbvFj+zQ8eWqhxzA+rJyyFT8Du0sxM
         6+TA==
X-Forwarded-Encrypted: i=1; AJvYcCWYWMfiqEV3s2N6mJuDVp9w5ogdjPbVg9CjzniiYkSwTHB6GyJwGeZYjDEPYzgBIhLBxcxp0jBJUXz79D2E@vger.kernel.org, AJvYcCWe4pxLqekgK5v6D06JPrYuJ372PkMYScmMF5JHdfpnoDjdlaS1OFdsZX9dbBeqWiWFmuZkQw+gFbg=@vger.kernel.org, AJvYcCXpKc/vB3yOxI08OcOJe+fXa0zXMY/fNEhfxv37YzrKr4m9a9O9sDR/cU7+EBIjokzynGTclNjQ7iq+5se9lUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BVMI0BLkKRyWalJNUcRQyTmVm2nT7kNxWsreskRG09GSjJfa
	uwaqGEtG4Yoqz3AKWi1b24zHO9IfFYhguxXAYzSWp0RNBfynZ4LHvqB7PX0gOC+Qr/AyZzm6iay
	tteUv+xqu8tt1UYPXRG9fwQWDEMKZkJE=
X-Gm-Gg: ASbGncuJS1YeIMtbMZFX+XnW7qrxMNL6Aq1XV32XdQAP3auS3Zp2+pPN5ZcXEwvdPD0
	GaK0weIgGIbejsGEO8IHbn3xI9VoIi4BAvx8K/XwtzGH7cby9DvRHtbsMmoFwHxAKLCQ7Bm6+aM
	95DyELlHckJ6NHwIAsWOIkbQjohye292gC422oT/9874+H
X-Google-Smtp-Source: AGHT+IEUJFZL2JU8xJSFulzsZPwp7Y5KKKb4k5Vl4oukDhrgiu5ve9lkLrK/mtQ4PMRZ7/XS+4qg94PJ9RHtwPTgAOs=
X-Received: by 2002:a17:90b:258c:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31aaca78f48mr5496701a91.0.1751809346077; Sun, 06 Jul 2025
 06:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com> <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:42:13 +0200
X-Gm-Features: Ac12FXy1CaP3o3WtkbtVOog3-QiqhLt2Ifo86odUyVkUt2_fgezqFSeaSXeO-AY
Message-ID: <CANiq72kUoyhbwiTeB3Bwv3X0iGLbiVWeQCBvKshOaNMqkEsUPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] gpu: nova-core: Add code comments related to devinit
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +        // Check that FWSEC has lowered its protection level before read=
ing the GFW_BOOT status.

`GFW_BOOT` (another one below), since it is written like that above.

> -/* PGC6 */
> +/*
> + * PGC6 register space.
> + *
> + * `GC6` is a GPU low-power state where VRAM is in self-refresh and the =
GPU is powered down (except
> + * for power rails needed to keep self-refresh working and important reg=
isters and hardware
> + * blocks).
> + *
> + * These scratch registers remain powered on even in a low-power state a=
nd have a designated group
> + * number.
> + */

I noticed the file uses `/*` in a couple files -- could `//` be used
or there is a reason for it?

(I guess maybe in a different series, since it is already there for
PMC in mainline. It could be a good first issue.)

The idea is to only use `/*` when `//` cannot be used, e.g. within
code, so that they have a different purpose.

Cheers,
Miguel
