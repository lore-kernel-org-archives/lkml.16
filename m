Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918D2AF1B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594942; cv=none; b=uHxdp5IVvUaC8ULN08i8qB1lFLyK44b5RN0w+BUKk/n+wLt8IkuUul6SaYBqv+JuLngoClYIoHOABOOYe2yEHyPRq2h/j2gU/keNwCCsbG0zWixZCpyjPnaWfYf9Y0bASaVU8Z4/a0aCsjK4OpqfnCupSps8e+5FriKk3G1jSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594942; c=relaxed/simple;
	bh=Porb4W83a0gib9uRoxn9CMZ2se/J5ebanB2cj+BFiYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lOFdEeF27X+labpCFoMBj75njafrJJJrOECH6o4pyrD5+cn+oQFOZKp/rsZV3R/g5brSknpDJ7a/Kmtti7zyiTx9nf6EBpt/G6XLGQNMklwXTOgliEn2lIm3EpDeqss5Vz2SVGXZrdipqNQxW/aOVrnkK6+YHRy2tBrNDztKW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q34ijoAg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q34ijoAg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1FE0C404FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738594939; bh=i85hiGngUu4NNSTeUMs5YjPb/z65eBW7Kz5BK/a+xMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q34ijoAg7jJsK7PapvQD4+pFkqTh9YgDmINrTKgRugNpFCIV/TzCjBVth7fUcRmNL
	 pcbRVlmVlhfMpV44z04WP9eehAOzA4Z9UJgQ7plqMz22nJyXeXobsAl1F89hWUD9F/
	 1+mhS7dYOI+tlKfYcu1UvQsqXt09OWJC1H96GzXgwHp7WntEitm3yMZ5IiVvqd1yZa
	 Yvkfw6jRVgtt6EUipTHeZfuP6pOcap41E1XcFOXJJxRlmGlZ69kt4Uebw4tOwiB4kl
	 PXKBL0vG8JweHVt4x36Ztj4/02qISjn4+O4+Fkn5oOk0m6ANxAwNIt6d1FYbhSOfhP
	 JqXxaiYaslh1Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1FE0C404FD;
	Mon,  3 Feb 2025 15:02:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: mortodinoite <mortodinoite@pissmail.com>, linux-kernel@vger.kernel.org
Cc: mortodinoite <mortodinoite@pissmail.com>
Subject: Re: [PATCH TRIVIAL] docs: admin-guide: rename GTK+ to GTK
In-Reply-To: <20250203083707.11175-1-mortodinoite@pissmail.com>
References: <20250203083707.11175-1-mortodinoite@pissmail.com>
Date: Mon, 03 Feb 2025 08:02:18 -0700
Message-ID: <87zfj3rs05.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

mortodinoite <mortodinoite@pissmail.com> writes:

> Upstream calls it "GTK" now, see [1]
>
> [1] https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000=
.html
>
> Signed-off-by: mortodinoite <mortodinoite@pissmail.com>

Can I get a version with a proper signoff (with your full name)?

Otherwise looks fine.

Thanks,

jon

>  Documentation/admin-guide/README.rst                    | 2 +-
>  Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
>  Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-g=
uide/README.rst
> index eb9452668..d30867620 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -165,7 +165,7 @@ Configuring the kernel
>=20=20
>       "make xconfig"     Qt based configuration tool.
>=20=20
> -     "make gconfig"     GTK+ based configuration tool.
> +     "make gconfig"     GTK based configuration tool.
>=20=20
>       "make oldconfig"   Default all questions based on the contents of
>                          your existing ./.config file and asking about
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Do=
cumentation/translations/zh_CN/admin-guide/README.rst
> index e679cbc3c..1bdafdc4c 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -146,7 +146,7 @@ Linux=E5=86=85=E6=A0=B86.x=E7=89=88=E6=9C=AC <http://=
kernel.org/>
>=20=20
>       "make xconfig"     =E5=9F=BA=E4=BA=8EQt=E7=9A=84=E9=85=8D=E7=BD=AE=
=E5=B7=A5=E5=85=B7=E3=80=82
>=20=20
> -     "make gconfig"     =E5=9F=BA=E4=BA=8EGTK+=E7=9A=84=E9=85=8D=E7=BD=
=AE=E5=B7=A5=E5=85=B7=E3=80=82
> +     "make gconfig"     =E5=9F=BA=E4=BA=8EGTK=E7=9A=84=E9=85=8D=E7=BD=AE=
=E5=B7=A5=E5=85=B7=E3=80=82
>=20=20
>       "make oldconfig"   =E5=9F=BA=E4=BA=8E=E7=8E=B0=E6=9C=89=E7=9A=84 ./=
.config =E6=96=87=E4=BB=B6=E9=80=89=E6=8B=A9=E6=89=80=E6=9C=89=E9=80=89=E9=
=A1=B9=EF=BC=8C=E5=B9=B6=E8=AF=A2=E9=97=AE
>                          =E6=96=B0=E9=85=8D=E7=BD=AE=E9=80=89=E9=A1=B9=E3=
=80=82
> diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Do=
cumentation/translations/zh_TW/admin-guide/README.rst
> index a6e34c200..0b038074d 100644
> --- a/Documentation/translations/zh_TW/admin-guide/README.rst
> +++ b/Documentation/translations/zh_TW/admin-guide/README.rst
> @@ -149,7 +149,7 @@ Linux=E5=85=A7=E6=A0=B86.x=E7=89=88=E6=9C=AC <http://=
kernel.org/>
>=20=20
>       "make xconfig"     =E5=9F=BA=E6=96=BCQt=E7=9A=84=E9=85=8D=E7=BD=AE=
=E5=B7=A5=E5=85=B7=E3=80=82
>=20=20
> -     "make gconfig"     =E5=9F=BA=E6=96=BCGTK+=E7=9A=84=E9=85=8D=E7=BD=
=AE=E5=B7=A5=E5=85=B7=E3=80=82
> +     "make gconfig"     =E5=9F=BA=E6=96=BCGTK=E7=9A=84=E9=85=8D=E7=BD=AE=
=E5=B7=A5=E5=85=B7=E3=80=82
>=20=20
>       "make oldconfig"   =E5=9F=BA=E6=96=BC=E7=8F=BE=E6=9C=89=E7=9A=84 ./=
.config =E6=96=87=E4=BB=B6=E9=81=B8=E6=93=87=E6=89=80=E6=9C=89=E9=81=B8=E9=
=A0=85=EF=BC=8C=E4=B8=A6=E8=A9=A2=E5=95=8F
>                          =E6=96=B0=E9=85=8D=E7=BD=AE=E9=81=B8=E9=A0=85=E3=
=80=82
> --=20
> 2.48.1
