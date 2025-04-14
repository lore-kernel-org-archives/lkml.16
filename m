Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974982472B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645979; cv=none; b=WtHkjkjDyrisKH2+9KtONcaellV6ITdQIhMecSnf+F+EZUqU9itCXcrOwyE2PTmHKm66yt1PvGFslbu6iZhN9VZdv04rnQDKrmStKTm6qOcOuqn6p3kUZ6D+H6FZgfzOaVwu2hJ8UZNNn8ezTS6q9tFYU8dh3uH82ASl2zSYm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645979; c=relaxed/simple;
	bh=iLoIDWCOvBn+roSWDcEwlS82akYrA+Z/TCi/vcWsPA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsZuqwW5K9FjXE3Kac4ypPxdQxKMFSBSjUmbuyhIEOLqMhx+E4wmKhLrbbDR+v3kbe43m9D+mJZ/l7xT6yAseZEsaHfXuEeoGGsrHsWFx4tk+0GpnvZamKjwSWTRJOZpLGCSYdHAbux781Ljc3+LuKCo9LiQCiXPLxiV6NTWnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=EPWBDv8U; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="EPWBDv8U"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so4357963a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744645977; x=1745250777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BirFEKiaNC+SpLA00n28uuL4+1Jwjbry4ySGYXNeQXs=;
        b=EPWBDv8U7nuxK/FDMMGeBVsbAgWD43lEMGn9ViOT+I6bus8eLiiyldWSsJ8c3RugS0
         5xsVJkW+hbXvw+bCbwXkncyHkH1MyDbWSJKo+jBpbVfPQpbDHHXvW+3ZF9A2IF6PBGID
         brVOtBI8r/kgk84Rql1QFvg1cyo7ZWwaMHJu0dF3Ol66gH0+VXFTPY4TKXhsyiya6HkG
         39VRDFyqxnMrKsY5SoJMoPPYbja8WAjDcAZKz4E+rXa9LU5QsUxSKVN9Saz0C0wWWjR6
         hfnX4e4e8LsXrFGdnQ3LUAOJy7tuQ+ehbkoEFFgLOxdSGWOxiCPiYZQ/vOIQ58S8g5u8
         FxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645977; x=1745250777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BirFEKiaNC+SpLA00n28uuL4+1Jwjbry4ySGYXNeQXs=;
        b=EPmR1v+z992lNS3z+62Ju3QUdMVX0y8c+T94qgM/URFdAKLoYBHZyOFsnbU2Eq3oyu
         2SLXi1c8nDB3eyDSt5et9qNU+yjUM35uoOa2C+87NHHoJ1KXcBLFiN7wlYy+QB1GtTDD
         +gZ8d4UtsoAjuenIUqWs3Z6Vpx1bTFNn42kw8pnPc109CrLtGzRdNplmHxtdX2/IxnD9
         TgEQP7HLeIq+Es8ATW6n/D1H2vw1aQnqKdmSHSAlcmUIRn0t07m4UNl0JGb65xv1O8YH
         Jbk94kEMaRh/Mhvyiisg8nmLDUYdnG46qCGcm5wPywoQI6VOFl1ZNFFnt7nGiTWDIwTQ
         9WCg==
X-Forwarded-Encrypted: i=1; AJvYcCWtOEPnjISda5IKP+WCl4PN98uDAjtq1waTs+Qs8Mm9oyVqDudvn5STNZZfiBMCKNvbh73k7ER3vw8ELpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDIrTMqn65zTD8+++6oUL+KJ8KZSdnKHgk/cn7hYi/eoMG4No
	qb9ljpLebt5pujw+cYrLoqzYglcSLMZiRKP/LyFkbxB1F9vI9x1zptr/D5QXdDiV9SnTuCINjTI
	weegXS4uQpUwv4PFW87BuRWo0fTdyX89fPA3kUQ==
X-Gm-Gg: ASbGncsrhLZHo6kL95QknGExvvCSkrJAdKIQmSD03Z82aAvSxZHzIcBAcuNhsjWScDq
	mNj8Ug8cxy8QaEw6TRPce/NbcU8Op9d7wIMbvuqYRg3Td+kUd6a7HUdGySoHQzVSYPyTfTTixil
	I+GnL93dg7vta6OXm0jGQEEZC6
X-Google-Smtp-Source: AGHT+IEmpqIAhKV+iQD6ehf9QO3GWF1ECohAPIWkrO1irEmIvUlvixloRUoIRxT4QbGu/iVLAJdp2dh6VSuWE07prZU=
X-Received: by 2002:a17:90b:5643:b0:2f2:a664:df20 with SMTP id
 98e67ed59e1d1-30823633ed2mr19810815a91.7.1744645976634; Mon, 14 Apr 2025
 08:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414131053.18499-1-vdronov@redhat.com>
In-Reply-To: <20250414131053.18499-1-vdronov@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Mon, 14 Apr 2025 17:52:45 +0200
X-Gm-Features: ATxdqUFwwNisbNMOiVnXLeNrPuXmgjNUrBVKkFA1941W9jpG24eDOmML8wA3Lrc
Message-ID: <CALrw=nHS9UnMMwXfYo_6goDi==DD5feeemxqAXXAWvA0yOi_cw@mail.gmail.com>
Subject: Re: [PATCH] crypto: ecdsa - explicitly zeroize pub_key
To: Vladis Dronov <vdronov@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Lukas Wunner <lukas@wunner.de>, Stefan Berger <stefanb@linux.ibm.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 14, 2025 at 3:11=E2=80=AFPM Vladis Dronov <vdronov@redhat.com> =
wrote:
>
> The FIPS standard, as a part of the Sensitive Security Parameter area,
> requires the FIPS module to provide methods to zeroise all the unprotecte=
d
> SSP (Security Sensitive Parameters), i.e. both the CSP (Critical Security
> Parameters), and the PSP (Public Security Parameters):
>
>     A module shall provide methods to zeroise all unprotected SSPs and ke=
y
>     components within the module.
>
> This requirement is mentioned in the section AS09.28 "Sensitive security
> parameter zeroisation =E2=80=93 Levels 1, 2, 3, and 4" of FIPS 140-3 / IS=
O 19790.
> This is required for the FIPS certification. Thus, add a public key
> zeroization to ecdsa_ecc_ctx_deinit().
>
> Signed-off-by: Vladis Dronov <vdronov@redhat.com>
> ---
>  crypto/ecdsa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index 117526d15dde..e7f58ad5ac76 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -96,10 +96,12 @@ static int ecdsa_ecc_ctx_init(struct ecc_ctx *ctx, un=
signed int curve_id)
>         return 0;
>  }
>
> -
>  static void ecdsa_ecc_ctx_deinit(struct ecc_ctx *ctx)
>  {
>         ctx->pub_key_set =3D false;
> +
> +       memzero_explicit(ctx->x, sizeof(ctx->x));
> +       memzero_explicit(ctx->y, sizeof(ctx->y));

Isn't this already done with crypto_destroy_tfm()? Or am I missing somethin=
g?

Ignat

>  }
>
>  static int ecdsa_ecc_ctx_reset(struct ecc_ctx *ctx)
> --
> 2.49.0
>
