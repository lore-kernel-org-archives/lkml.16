Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB81AB50D;
	Fri,  7 Feb 2025 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928576; cv=none; b=HIQ7oZHiSB1m2OY3myS4tMn5jDSJx5DJxfHatBZ/2RoDwkfU/V7yeOYWtwY/qhSRhxOlEQF7PNyR6ek7kxFMraYWKOGxdjF3Ynh7YuoAvR05k7GT7vPGrlWxybnvBdKiDDZB3RgY9RKHHaO+QUc1coqrFdaiElsxtwMNZwws2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928576; c=relaxed/simple;
	bh=B1IY2LizCmjuRbgMh8oZXBFBN2K9kAS64Tn/T1DvfI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnMKv8FEjGLhAvaAqLqLccoYYB6/B0jjLxMJxJjIyKvPVAeMjm0gCo25xERmEYMeVmkjGgiHLCAT0Ix5KePpounN2/KO6Vi0pOYykmOvgbTIJndH42MRO/mhigWgdxzuTklSh4xhHHVWkixk+EEy1JCkQkP3aJYIjWUFtR5ZR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEBiNeAF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEBiNeAF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5015bce7so1387745ad.2;
        Fri, 07 Feb 2025 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738928574; x=1739533374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY9M0kuGNKIlnRJ54ZSgFSum7bas+3NP4/NP9Pk/iOQ=;
        b=YEBiNeAFsUxuucHkNcvBlAlPAkBypMNrJXjVG6vwXTQ/gPx5Vjemo0HeVL3Uu/lYkZ
         LuytmkoZHyE4fbjP6538HlvnQ9FVdeBsRXI1Ih6m/vPZT3bQQ2uuWJssegvu0rOmwWaC
         2DA2zQ+JxnxWru/gVP8vqamqqZ6EvWL9CjoU+YiRk6YKW5Blg0MDCMlkiok8naSCyCoD
         UVb1zH/qNxtMbyTD9h8B1w1Z7JkaYOvieQealbcVrXuEwJgSvfavijci/7QeZmUDpzL/
         KIFcim2MCy117pqLoL40mUyE1OzOMVH1UUPH6EuUCCn2L65Toll7WkZvyAKj18TpDl3w
         kkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928574; x=1739533374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iY9M0kuGNKIlnRJ54ZSgFSum7bas+3NP4/NP9Pk/iOQ=;
        b=CoXv2DDnCDi5YsStAsithnaBaOnhEMi0j3RavO67IjPwasRflqHqyMUrx6q8mlILBP
         7c2BHco5UrFSNKZMf26HSW1495E0dLoBsXCt3RPxZyWuioMymdnQ7Tjn9jSb92SMNP1W
         iBAntlr5dO3LgkkVcv/XBvMi3Fz+h72pUrVDJU4aIZl929PZkHE7sNGlIz7OLlm3qmQp
         xoBkdQu97T+5F+Unf7kWSlstwHPoN7kEpEo0PlAycSZRzOGkCuby/NAnJvUB5k6jlQSb
         H1r6xPBHMth8mb9+jxjFhfZ5TXVZmAUveYRvz+kFqD15QDonJQpFelVfMaYFgOOhsZOX
         JElQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHsbZeLIPELARrmjVLZPJjAyWiSwdLAxcKK2Ap6UTPYQa3XyjNzjv7JGNN2k2vYxLFEeM4wUWVgfOeu4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEesJAxgsPgom/WpGAAGuq4UOjyyfrhRXkfKdUXGrvaKLOxQqD
	fH5KtdSsJb+2G4qB9RZ34UIhgwAAidLX5Z5vS1cd9GtoaSilS9QqlMli8epRqHi/WYiKxi94QjF
	QUjqXcjPNNcJNrTLvmWvUTEu1lgo=
X-Gm-Gg: ASbGnct4JWeRLVBm4Ggd2ZmZLdmwGnfwvtglZqBwbrOBYhuLtnu/Tu1FimEml0YPj/x
	Pxfd9N+gE6CkuRDYTQ1rna28yQxRRYb1ff53uu/X0s1w11HEk/21sLiVbXecPvW2bs3RkjuGn
X-Google-Smtp-Source: AGHT+IGg3EOLaEIr5rRgEuP+z5Hca61CIKhIOhGaAZVkN3fxjtBjRwoSI38aE/HF6q2g1MaF07I9/mil9J+vs0lZ5qk=
X-Received: by 2002:a17:903:32c7:b0:215:b75f:a1d8 with SMTP id
 d9443c01a7336-21f4e1b1236mr16563665ad.2.1738928574257; Fri, 07 Feb 2025
 03:42:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207004049.178049-1-lyude@redhat.com>
In-Reply-To: <20250207004049.178049-1-lyude@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Feb 2025 12:42:41 +0100
X-Gm-Features: AWEUYZkUbYWulYqfAta1s8MbY8W16wi7jdedt_OfQikyj7oHM6RkNX8Vm2it60k
Message-ID: <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 1:42=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote:
>
> This introduces a crate for working with faux devices in rust, along with

s/crate/module

(also in the module description)

> +//! C header: [`include/linux/device/faux.h`]
> +use crate::{bindings, device, error::code::*, prelude::*};

Newline between.

> +        // SAFETY: self.0 is a valid registered faux_device via our type=
 invariants.

Markdown.

> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Sync for Registration {}

Perhaps some extra notes here would be useful, e.g. is it documented
to be so? Especially since faux is being added now, it may make sense
to e.g. take the chance to work on mentioning this on the C side.

Thanks!

Cheers,
Miguel
