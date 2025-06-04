Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBDD2B9BC;
	Wed,  4 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031427; cv=none; b=t0j9MPq255Y8J/yKr4s5WKxopKVbB28Zt/+j0J65a0e4qocwrocrdEkTFLBdW/QYMrmW4Mg22W3eBnWKuXoVUWackPNXSSoy2wvBqXAAUi5i+YHO2cR24u4/cqrzd6ocAYPnoI1Mdoy1Xq3xMY1m3xe+W3GjjvoTpKs+qQyBO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031427; c=relaxed/simple;
	bh=iYIRVfkXKufURUDOPAucqCIYt8hFzqU7YK1s1FIrhP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpjgGwsaGUkv2+I1avQd1HIKNS4Uthe4OmE04T8J6MJpnsV6T7kO1MqQywk39GKND+E/tpfXrm4jSyj8cGQeYbgh8cxl/gsIzN1j2i12ivOFFt7D56MftX7pgAuDvICsJD2Z9cDceHS7g0nss0q04vT2WOqeYygPnjEaQ1xzZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1Wxwlrx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1Wxwlrx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2705e3810cso616427a12.0;
        Wed, 04 Jun 2025 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749031425; x=1749636225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYIRVfkXKufURUDOPAucqCIYt8hFzqU7YK1s1FIrhP8=;
        b=S1WxwlrxhvGu6me8x2hmoqmLFx0N/FFnA33hE72rpQc1A5/c1t++4Mmptr+z3mtIkz
         oTFH1BC2Zn8KWUUdUBocQ/bKsHO6jbZmDTrUgpCxfXVQ6WsnvjaU/ulUv2eUgpm/XCgd
         We/9m5qc1cet7OpEGzSKqsdG/HvXs1sQUPDOIt7RaktlnFxxi1G46F4Bo+bYpkKKS4r6
         O/PpcX6sjSBuq5kadHPj6H1/kSMyJ3gZGM6mJn7yd1DDR3gAhP6PhfXPxRPdYDtprNWe
         OrJWXmugdDg4k07MCq3qlLK3bkXqC/nzSj0DlI08ZMwIS/pXu2tDZc08SvlP3xqMOKzX
         4gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031425; x=1749636225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYIRVfkXKufURUDOPAucqCIYt8hFzqU7YK1s1FIrhP8=;
        b=kiajUKFb+YciceI/bfQl/srESzixdq+ucvdacKuSWihUuBNajiYPi79IRMhSIGtgyK
         w51uam2zMIySseq7Ns0hAgVn+Hhku3MffYyyS9oyiVBgnrjDveX805rXj9sVYNhkxeV/
         JVxHDaBFtpp6YVcdKnePbHkrB8trocM/Azbsbv16iY6a8WfCeYnOiSNMjGPftZIuXtRi
         eNFkYwgMWjpxcg9Qn7CJc204Mz9V0cfdeoCiQbH3BnJPmCPXqvm9UMXqLAT6ibJiLsP6
         ciGihq5LGy2W+jNvL5u7b+hJPBEPpjDNTzD/nSV/L0iveTZ7Aari0fJWtaicSBX5dJmM
         6Glg==
X-Forwarded-Encrypted: i=1; AJvYcCVoR4bKUal6gHODOhLxXCqWFVb9XmW5ShMTeugPBt5LlzMLnJQHG1lWYS4m8p6sxYVd1IoIfY7KfCT+h0vxfys=@vger.kernel.org, AJvYcCWE5qRUUlT93lknJWIB5tBL9LYZgprTT2sMhF+hqCAF6ATPUFqt6KvytOZfm0Z+YZSWHH6jsOn0bpOShRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DLjqjC1yNlu7e5RGGfUdZ/qQDPTfqX9uVuewTQNxU87C5nOO
	idOb5+YYse0hu7mTKgRDLH/CG9ESotDJozl7Fp5JqAcO5esiIEiNusPaM2JAeeQ6EYES6vgE+CZ
	rSBmD7Rh7FEnpPkklgBJgBth+mY7D7xI=
X-Gm-Gg: ASbGncuAaDglpX1NYJItmOs+QNhJ7QgAATku54pvwOXcji9DgY96zcngj/vb52Fp5Hh
	4fiv8ggua0C2KukuLUZJvSvsljfWlbOvf7CIouxNB5Ccg5M51jDdp8ObHeNaVMsBtmM+AHmwwoU
	+w5hAXF4OdfF/TS2GDHlgR38b1Pbanb/mD
X-Google-Smtp-Source: AGHT+IFY54/4SXuHhNfhR34u/tz7WHBUhSm2/IfQ3AqffQFchQvW18uxeL7Cd6oGwhaiU9pD6yfyiIBQ6dRYcZzfLS8=
X-Received: by 2002:a17:903:181:b0:234:11cb:6f95 with SMTP id
 d9443c01a7336-235e116766cmr12020315ad.6.1749031425395; Wed, 04 Jun 2025
 03:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
In-Reply-To: <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:03:32 +0200
X-Gm-Features: AX0GCFvjWD_zgPyKD-OQaU5vX3FRf-KmGpph09TCktkVk0tXDV8Lo-vignDRYHw
Message-ID: <CANiq72=daoTUH0qdEuTLtgaDsdNj=RVvX4fn2xjDtQZn7-xYcw@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Lyude Paul <lyude@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:05=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Not sure this makes sense - debug_assertions is supposed to be about
> assertions, we probably shouldn't try to use it for other things (especia=
lly
> since we've already got dev_dbg! here)

Yeah, we added it in `pr_debug!`, but I think we should match the C
side for that one instead.

In general, we probably want to say that enabling `debug_assertions`
should ideally have no "visible" effect on the program if there are no
bugs (modulo performance etc.; and it should have a loud effect if
there is indeed a bug :)

Cheers,
Miguel
