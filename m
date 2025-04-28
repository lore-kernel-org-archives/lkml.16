Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF7211C;
	Mon, 28 Apr 2025 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745882340; cv=none; b=hu34VVr8DgN/g4ZS/67plfeUr58a2hR/W1TJCFzwMlYcwgiCGsGgfQZ47Ybo+AlXGnuoN3d5JVdZ1wl2sPLWzfQUL43E13e9Kjvnq72oXP/TQWeI/cbPeGtVDdXZNMOX0/qI/AzK6maHXBhLq063Yl/nqiaeTEsC662CqjwKmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745882340; c=relaxed/simple;
	bh=nw/cV9CDkXJ/YxEJE5wrrDes3Gm0B70rdUc8vo0jWh8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NJEG/HChITeTAOIGgwbIRAnbmb3mjSM7Uqlf3kROVLNn0U5+tEjkDwv/dCudHeeN/DkCBrE0kHSOnZp2iCCzJQxJEacGNcCsIrM5Jb2vjJpIIOUxcNx0Dpz4iCADFSZn4VaP28XsIaNYDamDeT4hfCf5J3MRZrsm9oOc8JAvldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=j0GN4dxB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="j0GN4dxB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 84C6B41060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745882338; bh=74bAVJ4wpyzhT47LoRB3BGcKaUxv3wysfJ0gIrkqbvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j0GN4dxBXTTyPXSuHnemY6NKr/Pw49t6J6swI1MREpZqdJ63VxEhiKWUzM7U95/ZP
	 latH/Z9nKOTk9NpDn13TdJ3PpCu8oL1cCUzDcrey5njHH6/bgRsVg9d02Sc6hNrXSE
	 AOxNgrepYVK+0bhDyUnmZ8PMXdCf29w4RWXBQhAANsIFKaS7whFx666HOA6H/TiWia
	 7bmAASorIfFeUt4UpKbKeo6UCm9slAJM+TGH2ikgtuYWCSF+tBDDRqKoOwMFgA3nuh
	 7wsLUx86qUkpAwhlbubZST3XS1nnt+Wsmbf4UmZU0niAyxfWBjNlE31WcxnNzy5grM
	 O/QmkWnK5ad/w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 84C6B41060;
	Mon, 28 Apr 2025 23:18:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Adrian =?utf-8?Q?B=C3=BCtler?= <buetlera123@gmail.com>,
 linux-doc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Adrian =?utf-8?Q?B=C3=BCtle?=
 =?utf-8?Q?r?=
 <buetlera123@gmail.com>
Subject: Re: [PATCH v2] Documentation: x86: Fix a typo in fsgs.rst
In-Reply-To: <20250426122303.15905-1-buetlera123@gmail.com>
References: <20250425135836.19081-1-buetlera123@gmail.com>
 <20250426122303.15905-1-buetlera123@gmail.com>
Date: Mon, 28 Apr 2025 17:18:57 -0600
Message-ID: <87wmb3ri1q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adrian B=C3=BCtler <buetlera123@gmail.com> writes:

> Fix a spelling typo in fsgs.rst.
>
> Signed-off-by: Adrian B=C3=BCtler <buetlera123@gmail.com>
> ---
> v1->v2: added Signed-off-by
> v1: https://lore.kernel.org/linux-doc/20250425135836.19081-1-buetlera123@=
gmail.com/T/#u
>
>  Documentation/arch/x86/x86_64/fsgs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/=
x86/x86_64/fsgs.rst
> index d07e445dac5c..6bda4d16d3f7 100644
> --- a/Documentation/arch/x86/x86_64/fsgs.rst
> +++ b/Documentation/arch/x86/x86_64/fsgs.rst
> @@ -130,7 +130,7 @@ instructions. Clang 5 supports them as well.
>=20=20
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    _readfsbase_u64()   Read the FS base register
> -  _readfsbase_u64()   Read the GS base register
> +  _readgsbase_u64()   Read the GS base register
>    _writefsbase_u64()  Write the FS base register

Applied, thanks.

jon
