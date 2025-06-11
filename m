Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AE1BE86E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668126; cv=none; b=nijvgVk1MM/fZcJiR0xFyuGlN8ORxwb84uop35Vy05iCNbusLDAYc2764IvPIIrhshIkj91v5GfEc5PohpXWiQyhYRNSO5HykwXNWxi8xesUaDrlZpl0UGey+DSkPKNkrQXbO/tD6QX4sQQYjIrpDbrStyZ5cgiwuExoo9guZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668126; c=relaxed/simple;
	bh=wp8HZyLOC3rXTiPmHjUFoTJefTT1msqGjMmKBtHfquk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cciwg2/bnEXOuefR9SZBdjydlxSHdFNEQlZGNR4bP3MGk0392pXJugYCpK7ijZQjvY33pNnI6Gfn06HbLPBSqtL3/NdD0MzHT8FGT0nkakmYAfgm1zq93P71c/NpW3wjyiUlXz6X9TYGKTA0Xf2mdp0g+WVmTt3OHIh0e9Olzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HIM5Fk3v; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HIM5Fk3v"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ea83f382c3so71849fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749668124; x=1750272924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beC8Z65uROnyx1+hT6aGH8wiIbVvPAr55ja+xnQ3O4M=;
        b=HIM5Fk3vfRKh0lxCSAZeVDgIoHJVM+bp/0GwwlZ5JlZfDvUw9kxmQQ6TtVu3iTHQXv
         uj1kTSGyOsdtRdPsdVzWTMKH/R0Ttwc93jaJHlVD7etAsGOGEr7RwdNL7VAJVuESDmVM
         MzIWEnd1oIFAFn/J/mdcN6sEdVmCeAt+2XnBemqfn0lHukY/nscSvKzeUzhGJ8aJmYam
         SvO/LxpU/HZbufUNbUuBRHJPq18szAnvypoxY1hV+/Y+7BPsnimA8EhcIsX6uWhsJEM7
         n2khs4yOxMoTj5jf8RzAxMMP/nGNFIs+t6+YNHJDtSdrDiec3zXkB2ctVs7Dt8pSm6s3
         E/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668124; x=1750272924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beC8Z65uROnyx1+hT6aGH8wiIbVvPAr55ja+xnQ3O4M=;
        b=eGAU2O+H8mrkEZbZWlxrtipUfCdHW4sNlm48Afc8pj2JL3FtX3G2XfIVmdv4wjAyg6
         nkKDOqPHSSwxlqUvskvPDiGDQ9lcYtAbt2DeF/ylZSkFgl7BLhuy4MCsJOq6+1bmDR8F
         qYKNJ9pYz0Ddrb+wItP0EZCdpyekApLqSyF7qGfRpL9FjUPRIHF+oQFePxg45ewz/ucH
         zFc8uR70MvXkgqrFs03YSvBm8o24gVhGGfTu3tajRsLLLPxYLF2UBjmg7nOxxF85+YxD
         uytIClPfXyGjEVLdLCuPEFqXiIgMYQ83ysCkrgGld/PBdn4cK2qsNLB9aCBbahyQAiwO
         rh4g==
X-Forwarded-Encrypted: i=1; AJvYcCXjuSJAzUXWdeqZPH57mSABc82oAkCVyAyqlNpcRzGdWQKPhkShjtqEKiog4f1uxZCcZC+zjDwGLX6IrT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZm1RJ1jXmD+Pc0ob4CZtSBVP+7+fZyYi7Xdl1dBxZ+knreNBR
	xAAhi7Xil4275Yt1C8J+xUsAdTidqOl+vwQ9y3J6W7s4PHIxrDA9ZnxUAz56hAXCstpl7+GxQ5i
	c35ewMbmBeWVtA8tzyEzuaPpUeOTc9iroTSQHN6qs
X-Gm-Gg: ASbGncsRmnpvxGPPiCOBih0Dzg43cfI6rxxL81eOjoRmLgpIpu0NjwEsKpBTKAU4zD3
	msX8ByrXh1RBQFIS1ADlTQcuZ3AMdhKROsBKeM1AVOpLlWJkSgtTix0W5yF1dJm728lG3+GeUZH
	i3m21GPSm+7eLUy/232CapIJnoGz6SYDxchKIP4tSUNnkBpiHUAt8dtT41CBX2anrOX9IP/eWod
	w==
X-Google-Smtp-Source: AGHT+IFm5koQ1am9XzCkDYWSKKHdTnpCmDx3ukx8uUs89uQXT6FQEXhC8vQNZ/zb7P0GTM6dRbspZekaaZ+IVXid7JU=
X-Received: by 2002:a05:6870:9a21:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2ea96e50019mr2720181fac.25.1749668123822; Wed, 11 Jun 2025
 11:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602135231.1615281-1-bqe@google.com> <20250602135231.1615281-5-bqe@google.com>
 <pXt1ZkjyScL3fnnuyw12MHGyxxDunKpUjhGl_tL4kg8FpobamrUohmzQyqMxtCPfgbUmmPl4ZE6wco8Yqs6aLD5jLTD5ZL-zeNo8wk0uKUM=@protonmail.com>
In-Reply-To: <pXt1ZkjyScL3fnnuyw12MHGyxxDunKpUjhGl_tL4kg8FpobamrUohmzQyqMxtCPfgbUmmPl4ZE6wco8Yqs6aLD5jLTD5ZL-zeNo8wk0uKUM=@protonmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 11 Jun 2025 20:55:12 +0200
X-Gm-Features: AX0GCFusngWoMukaoowA3Y9KxP77OHDb2fRjiDbystdMuSVSbnZshuD95D1DnoM
Message-ID: <CACQBu=UqBHD6XfVbjGfc+0i93TLJNrrHCrzHuzkd=vVU8H+RVQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] rust: add find_bit_benchmark_rust module.
To: Pekka Ristola <pekkarr@protonmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:37=E2=80=AFPM Pekka Ristola <pekkarr@protonmail.c=
om> wrote:
>
> On Monday, June 2nd, 2025 at 16.53, Burak Emir <bqe@google.com> wrote:
[...]
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index f9051ab610d5..3f826a73bdbf 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2605,6 +2605,19 @@ config FIND_BIT_BENCHMARK
> >
> >         If unsure, say N.
> >
> > +config FIND_BIT_BENCHMARK_RUST
> > +     tristate "Test find_bit functions in Rust"
> > +     depends on CONFIG_RUST
>
> The `CONFIG_` prefix should be removed.

Done.

[...]
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > index 28c11e400d1e..9fefb2473099 100644
> > --- a/rust/kernel/bitmap.rs
> > +++ b/rust/kernel/bitmap.rs
> > @@ -252,6 +252,20 @@ pub fn new(nbits: usize, flags: Flags) -> Result<S=
elf, AllocError> {
> >      pub fn len(&self) -> usize {
> >          self.nbits
> >      }
> > +
> > +    /// Fills this `Bitmap` with random bits.
> > +    #[cfg(CONFIG_FIND_BIT_BENCHMARK_RUST)]
> > +    pub fn fill_random(&mut self) {
> > +        // SAFETY: `self.as_mut_ptr` points to either an array of the
> > +        // appropriate length or one usize.
> > +        unsafe {
> > +            bindings::get_random_bytes(
> > +                self.as_mut_ptr() as *mut ffi::c_void,
> > +                usize::div_ceil(self.nbits, bindings::BITS_PER_LONG as=
 usize)
> > +                    * bindings::BITS_PER_LONG as usize,
>
> I think the second argument to `get_random_bytes` should be in bytes, not
> bits. So it should be multiplied by "bytes per long", not "bits per long"=
.

Thanks for catching this. At least I had memory safety in mind when I
overflowed the buffer (facepalm)!
Fixed.

Cheers,
-- Burak
