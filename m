Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F6226D11
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495338; cv=none; b=S3gNHPT0KX3336AAyI7T4vr+M0U8B1+YLlnCZ9R9Q0UBFpVMrCPPLV1JVtFv9St9OHRIlKfqeCuF1owBIqm/Was3jbcz8sYXYe6jMJibL9pc2DTis13hRpTGXAsxtPi2fTixTCGSnNtyWMsFinzkTFjMlOD6CgkG4Fwo8eZ8gtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495338; c=relaxed/simple;
	bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rUiixurWmefdEPVq1uBATSXpjOeHUYjTYK3NkqFURXUz62G0Uojm8DHDNRP14OpAAseBLOETHaaY9OF+ayl0hGyZNHu5XuW3n2pnebKhGX+Fyh9tKTXlINm/98hksgRUmIqo5gEU85ww2dthPhzokiJImLqLX+Rj4tlwmbCMkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0d2ZAVW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0d2ZAVW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so3790955e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495334; x=1746100134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
        b=L0d2ZAVWTisp3aKH3Pb3lSxFz+MoWNVLiZVBR6mUDngCVHjM32Jn3cChNXdbK2yHg4
         Qr5ZDqTdlE0XwkidufYQcXmNyKcGM34VpM+arIn7wyejeeUs3tR6TiMcNpcgmZVJ2ofA
         F1k4KD+DNoKJYbZTUM1/nsFBQyKZ/FTQnyeroHFkSOMjb+6ZHvE8MSB5w9E5YhHz++fk
         umdcglF/M9C3dpe7jacHYiDC7eM3WEDkytWxTSkXu5y+jzSO540+Wm+wgU3mhHfReTh4
         SiN0gQOnX7bIQw+0/4PaNjjVjB91gjjx3rLNvN5J03hl73SuQz/JL0So5lahLsYm26M1
         ct6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495334; x=1746100134;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
        b=g/qD9FRWFiVh/u1BjvfVPNFAQCswQUpRoOB+/ss9eZ3uiu46f6n3HXpH+EZTu9BXVo
         bLOZpPI7JTuB9jzV9/3tcz2b2pkBiDSZuyQtZhBf+GiJsU2vqY+UyI1Br6FwUjTGDqMS
         FnH9bVjabqY9S2WFO53DeOVxyHd2S6rHYjadHOHHbcIgcMBzBSB5C9lneu6y7/PXFU88
         VuQgjOnmrKIXsHc+qFozINbB9vvSzyLhvzPswgqGW4E9sJHRmQsyYwyKz2sV1CR8RW+Z
         pNFICdPh8gDTh3Of959koZ4DxGGos17w66tQkLzPIf3of1z9CiudqxTjLoqQn3Pv10Dx
         m9DA==
X-Forwarded-Encrypted: i=1; AJvYcCVksxfMB29K5egwE/RGaxlF35mBb2dqAek/AwVHUrYfR0eBwQZzWCXz/wjqMU3kPUBnxIOAgjh8/QLeOdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA59A7huRdnY1SH5AJd7P0ZfFf0D0QKzB9SGnB2WFn4cRbY8zY
	hTHvcmKbdOuTR1ILys+OjgoXvnyVAc+puZ0GkGzfm0zNBosv3CUV4RYu68j9fc8zTN11B7iPMYC
	7ayM463loCIvxow==
X-Google-Smtp-Source: AGHT+IFRK84dzOvIeFc8HB0WOHiRXhwdVaQDJrtHgwU6SSNDk1zrUXE5fQ6jYagO6EYR9o5uOoyyBy5GxZ4tt5c=
X-Received: from wmbfm13.prod.google.com ([2002:a05:600c:c0d:b0:43d:47b9:bedd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c18:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4409bdb373cmr25454475e9.30.1745495333949;
 Thu, 24 Apr 2025 04:48:53 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:48:52 +0000
In-Reply-To: <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-2-deff5eea568a@google.com> <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
Message-ID: <aAolJBv6RMvsmZ7b@google.com>
Subject: Re: [PATCH v3 2/7] rust: alloc: add Vec::pop
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:42:52AM -0400, Tamir Duberstein wrote:
> On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This introduces a basic method that our custom Vec is missing. I expect
> > that it will be used in many places, but at the time of writing, Rust
> > Binder has six calls to Vec::pop.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>=20
> Could this be written in terms of `remove`?

The `remove` method has a lot of logic to move around elements, so I'm
not sure we would want to do that.

Alice
