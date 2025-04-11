Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F5278174
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374301; cv=none; b=ON47HJmad3vYVJdcrOd2FF6EbSPudGzWnUtZ8IkZGTiquiD370LuxrO/vlT4ncq+Swbh1+SHWSnpPHL24dXbACzNZWSvDbUCXHvfE7fk06jnB2WAr5bGr5eOB6u/NP/YRFg9UCEhhPetedolLuOpNeobmeRkbF2gXaAl39xsbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374301; c=relaxed/simple;
	bh=S73mtvRXoKnp6wWCT4agWe2tdoLu9bOKyvuJg2gvwwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrRUPDjmOID35a/boP1JWP67oQCsar/Fy5944HpbMhpQ+gHchxWfZsKnwwhMTG+9i09e3nbKELTUN8cBgtOVjqK8K4zNNygoA4POGJQuZFZfJOex4Yincwph/+dx0JwKPvx7ijbPYE+BFfrCZvzLom1bO8VDVLb+FkpRwlkPTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MrjO6Zh6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MrjO6Zh6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1565576f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744374298; x=1744979098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S73mtvRXoKnp6wWCT4agWe2tdoLu9bOKyvuJg2gvwwo=;
        b=MrjO6Zh67Ff9Nucj9zqlEw2UxlP0MPADEjXj+kEiJtP53a40tc9BK4toIhHs2xlIyk
         tdTafFxWBdcTLOm4YhKhZPSHx5B3NqWpp9avYY5Iy1GgBSiujZdCEJWz4IaCStVhKcmd
         bj9PMjmz4/hma6vQwNbPWZPnwRixs4Fj1wqZmbXX0cKfYG/iEnldXj9c4f7V8Gv50LpI
         LsdZQgqnoC8YHypuXFhbiZpY2p0Rgwf/19Y091lCZRQTX9n3omnRunnFxkVySfSPFQ4D
         ht62Q7WmfTzy35igJaVPsKeNWMh7KPafehjdzx2NguOKQ8a9mWLCZjYqcYtaMRYyA9zf
         bGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374298; x=1744979098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S73mtvRXoKnp6wWCT4agWe2tdoLu9bOKyvuJg2gvwwo=;
        b=NNYQAOotMyX/pux6PxHVPgxu4ajUqAUR95/yTpwKLn0Q1jd40egZ5uNdg3d3wxPVEy
         OkWSMjhTdavFdGR5HkqQVGJpggMGJPCdjo4BKTWpobFx9u+IfNCUemJ9AJTxnMoNanbm
         NUgXV1KAYFMuFdNk5EHSz30WasPLWnoIJ3wIPrW61bN1gajPDD8JL87Tn85QIci+0YT8
         t0bhz2xP8gRZvsoCNRJ3EqLg5f0q+SdN2JoignBKkZiszF3YxJZENfhDdPbqaRJCuxxO
         b4EdgAd+gzL3QK/rq9cs/FQDhpL4H2f1GjGBPBLX/liN78I2G1J59fh9h0a/cSo2FFFu
         qLcw==
X-Forwarded-Encrypted: i=1; AJvYcCWbGg6UvBEMcFIb77J22K3awSE3wvzwfBbeetx1dRjGhmR5zT4hy9B1+yAbgqaN3jW9W1LumtP7fvSVcyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yc+XKhSKctAysRvEtJb16urkJvxGTzEIUGvWhknxPAJsFZIF
	tuGCNWConHj7GOIhUKAocdYz4z7xdsPp8gmwS08PE7rRctRXK1hesYcqDB3q/gSpGOQix7dQbTI
	XODPmril6z0YwyEeNz0+X993rXL5WMmRRsBPS
X-Gm-Gg: ASbGncsUNv1iMwrX9lcjxvy3V/xTsTyNzmZNqW009a6KB6HyKGm++WgaSmG1Lo8pQYX
	35Tju1IUmKkJUU4UGsRNvIY2WTvUnZiAFm8t9Z8Sbc+d5p+BkVu0v1bNN/dvFgUMxGnH+oFXgK6
	vGnnt+qyS//2n7PpZraL0cYbo=
X-Google-Smtp-Source: AGHT+IFUQ/oSxDMQSF7UbzPHM1PMz6/HL8F9hqNZ2SVtXPbSMzWNeavfs1Jm4eP+fMT2PPiB5IGaNrouzhadLw/gIug=
X-Received: by 2002:a05:6000:290c:b0:39c:266c:400a with SMTP id
 ffacd0b85a97d-39eaaed1fa5mr2002521f8f.50.1744374297780; Fri, 11 Apr 2025
 05:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
In-Reply-To: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 14:24:45 +0200
X-Gm-Features: ATxdqUEwPywhMcciYH8vaOKcIZHSHmPedE8H-vOnx_DWvJZtR5N3XbUhlC8d5DE
Message-ID: <CAH5fLggyQNrrMuN9RO9r1joXJZwyAKYZCr0_oWK9evn72gKsug@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 2:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This enables the creation of trait objects backed by a Box, similarly to
> what can be done with the standard library.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
