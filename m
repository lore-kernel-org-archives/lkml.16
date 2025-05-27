Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E71DB551
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375387; cv=none; b=NHCkLKgOiruwH4nzTCWJkxacCWbi8OjHfrCIH5UuA5jTYnsCke5wagBq2T++rImbVsE5GsihqVDPctJGMmGM1zYQlDbzWuPBBgXcWecGQnY95kn1KF3AQVymr5p/KgtU0Ht+WatrFJUnFguzjIItRQ07EdG9sRVrBV7K4VLxt8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375387; c=relaxed/simple;
	bh=YsjX3bcN0YX2ehzopkrqwDQV5us4P1djbal5yVeF0qQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p4uBrWN7IjXjRoUb3s+Ir6mDMqrAxEmqj+QV0oR74Enqf00FI2b6rubVBDDGdjw5VoJ48U5ZVjvUHYVoIagtNaK0j5vQusCSgoCyJ2+9kQfg8ysG/8ny86+YGsB/Fp9XcM9ZpoQkUtl1RYkEDn3FENxUGsqmYHRzot+/dkxcguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cO7/wLco; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cO7/wLco"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7425efba1a3so175374b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748375385; x=1748980185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPRm7zOCQTnMDLJxSagbT3wHkG31wqIoLSG9SxZ+g6s=;
        b=cO7/wLco0fLbsCtXyYw3EFSabt4a2p4X4HnucwapFr/4+s55MhT9t0E6TMpwj+JA4x
         Lx+CIIIz8vKq3E/F5lfXckK0ns40JEYXemxfi/3v86KFJs8GhT8BsqxbTIZAb6hfP7MQ
         V3co+gcptyQG+YIRkg1fGDAHkiawxrZ80VLWo+H9sq9u2QBTlE4NSNwZrFvre7u6yuyS
         kV5VtlsNiXnILE7TFL1sQ2CVP341gQ7Sn5d8mKNbtVfrCajyDw4wphE6M7Rt3hDguqOM
         /nmr8ZihuBaNLJmOFBpILiqe0nexMydxbJKJ/hclLxLohN5H7JpX0rJobJsblpw7eG8B
         Fbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375385; x=1748980185;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HPRm7zOCQTnMDLJxSagbT3wHkG31wqIoLSG9SxZ+g6s=;
        b=EjfU1MUf389jn/M410kkDLvVBpVTYIOyWex7IDHz4/RtFMPrNgrYMvfD6NDcS5Xig8
         FdT3rCD/VtI1XiQDVH0SsruQK7bxA5a2ZbPuc9hor/CwiH70KWfd6BRsB26jV00lDeFI
         wHJ5wKSHbfUV9UCxf5+7ThgvwIhUCEJN6ySrhlmBZ/kI0hHUhhHPIRvtEbxuajLBtn+p
         q8YZ2STMXaWe6swIYqUiu6oysJh3ZS8T5miC/S/C3qw3Ku1Gt1HS2fDtGvYI/HAtiQ3a
         zT9pqw2eTenoMEtwOv+5tZARf4sZAY+m9TX+XEPcXjJ8XV2/is+M9ZReltf+PQx5TYbO
         T4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXcLSxkA2NckxomXtrpZIoZXcrHLyS3An40p0IA55KxqLVNH80rwQ2KtqRSa2r5ubR8cOTMRVR3+WA+zrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8iO0AYpxSLITV67KMkoq0Or/Aq8Mo/nVOxO+b7D4TULNHtak
	tO9V2zCYzoAFAZjnbpopuE1Kvhi+mKsq/0Y0OKdK2IQCWXsQ6SiYLBNio5ShxLE70P1dYK781pG
	iM6FoDg==
X-Google-Smtp-Source: AGHT+IGcUWh7R9GA5AW9ML6xvAg5vcChqjH5j+QDAMi4jmlbY7oLuIno/JLIYnsTk/045OLRIxyTzY7wmxY=
X-Received: from pfch8.prod.google.com ([2002:a05:6a00:1708:b0:746:247f:7384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:929a:b0:736:4e14:8ec5
 with SMTP id d2e1a72fcca58-7462eba4eb5mr2608237b3a.11.1748375385010; Tue, 27
 May 2025 12:49:45 -0700 (PDT)
Date: Tue, 27 May 2025 12:49:43 -0700
In-Reply-To: <dc0fd831ac82f313ce9bf8bc3180b7beef565821.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250526204523.562665-1-pbonzini@redhat.com> <aDXEG5tXRfsSO0Hf@google.com>
 <dc0fd831ac82f313ce9bf8bc3180b7beef565821.camel@intel.com>
Message-ID: <aDYXV-sggmWmaUyJ@google.com>
Subject: Re: [PATCH] x86/tdx: mark tdh_vp_enter() as __flatten
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lkp <lkp@intel.com>, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025, Rick P Edgecombe wrote:
> On Tue, 2025-05-27 at 13:54 +0000, Sean Christopherson wrote:
> > The "standard" kernel way of handling this it to mark the offending hel=
per
> > __always_inline, i.e. tag tdx_tdvpr_pa() __always_inline.
> >=20
>=20
> It looks like __flatten was added after a very similar situation:
> https://lore.kernel.org/lkml/CAK8P3a2ZWfNeXKSm8K_SUhhwkor17jFo3xApLXjzfPq=
X0eUDUA@mail.gmail.com/#t
>=20
> Since flatten gives the inline decision to the caller instead of the call=
ee,
> clang could have the option to keep a non-inline version of tdx_tdvpr_pa(=
) for
> whatever reasoning it has. The non-standard behavior around recursive inl=
ining
> is unfortunate, but we don't need it here.
>=20
> The downside is that we would not learn if some code changed in page_to_p=
hys()
> and we ended up pulling in some big piece of code for the recursive behav=
ior.

It's not just recursive behavior, it's any new code that comes along.  It's=
 not
likely to happen in this scenario, but in general it's not at all uncommon =
for a
noinstr function to gain new code.
=20
It's also quite weird to "flatten" a function with an explicit call to asse=
mbly.

> Overall I like the flatten version, but this works too:

I'm not a fan of "flatten", IMO it's too big of a hammer for general use.

> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 5699dfe500d9..371b4423a639 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1501,7 +1501,7 @@ static inline u64 tdx_tdr_pa(struct tdx_td *td)
>         return page_to_phys(td->tdr_page);
>  }
> =20
> -static inline u64 tdx_tdvpr_pa(struct tdx_vp *td)
> +static __always_inline u64 tdx_tdvpr_pa(struct tdx_vp *td)
>  {
>         return page_to_phys(td->tdvpr_page);
>  }
>=20
>=20
> > =C2=A0 Ditto for tdx_tdr_pa().
> > Especially since they're already "inline".
>=20
> I don't see why tdx_tdr_pa() is required to be inlined. Why force the com=
piler?

Because tagging a local static function with "inline" is pointless, and loo=
ks
weird next a similar __always_inline version.  Either drop the "inline" or =
make
it __always_inline.  Modern compilers don't need an "inline" hint for somet=
hing
like this (or pretty much anything).
