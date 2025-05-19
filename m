Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58691EE7BE;
	Mon, 19 May 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648823; cv=none; b=QSckNOoDSDzo0K9H2+bLeezD70H2jBzho1mZJjTVSeRdE847pws6aFlUDCcMYAmwRhbgnRt4Ej+tEpdilOvgbtd3iYRJag1qtK89xhuXAwYo4hkZlmdnFGgUb8lTXzc6l5DitOsiCss3IjzI8J1hIF0OytxeH5Omft/zrUWLgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648823; c=relaxed/simple;
	bh=HHSitiozwfNiWVJ06ieuIpL5bxaDJ1ifVhX7Rkvx2RI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Cc:Subject:
	 References:In-Reply-To; b=cRAHTR7Uxks01PeY0gsVW81zFwdD1nCLbYa8wDzqTdyUrdcLij+IPx7gj8+0k3r2mdxa0+c/gMAXQlQsZ1R3eh5Pt4hJ86DxeTMR50cJ95ayNox4QyMaej9KelBFK1syqhRhKm1Ky4qVDZVrKddeQhsZnNDuByGahUTR6bnX4VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=BwXCJSTE; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="BwXCJSTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1747647245; x=1748947245;
	bh=WfhZWsojv/52yaorrbcpAgqYpchyuwYJo8yoDgMhlv4=; h=From;
	b=BwXCJSTEDpL1MB6EU3+T4TTgUdRe2xHgDia6xMGQWiL0yWikro1kO/rVfPf3MnFqM
	 lro7yTrACWrFU9+MsCA2GOe/tyNay1lvwVbJgO35vf9YSANHNrd/20kSjf6KF7eYid
	 /ues9juJZYfaCE3Ai21FMXwBni7XeJFieKKxiwBVhT/lUKQtWULjt9jBkJUGkfkxSG
	 rjqyv8jGL1OLhUkkp1zAf2eCi6vyTABLzjQI35q2MV9gFkaFiBDXVDHFkCAUssYAA6
	 yLhdZ93o2JV2reNrSJJjE+aFtKEWcNEjLcPZ3OjgKow52f5JN9vXZloThLjM14h7eq
	 GFI6P3rhNrwPw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 54J9Y333099263
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 11:34:05 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 11:34:03 +0200
Message-Id: <DA018S0Q8E24.2KK8DE7QWLZTX@matfyz.cz>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
        "Lee Jones"
 <lee@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: 88pm886: Constify struct regmap_irq_chip and some
 other structures
References: <1681629840761e30494cb8920668710df60a81b8.1746996137.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1681629840761e30494cb8920668710df60a81b8.1746996137.git.christophe.jaillet@wanadoo.fr>

Christophe JAILLET, 2025-05-11T22:42:30+02:00:
> 'struct regmap_irq_chip' is not modified in this driver.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some

increases

> function pointers.
>
> While at it, also constify some other structures.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>    5032	   3304	     64	   8400	   20d0	drivers/mfd/88pm886.o
>
> After:
> =3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>    5800	   2536	     64	   8400	   20d0	drivers/mfd/88pm886.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> ---
>  drivers/mfd/88pm886.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Karel Balej <balejk@matfyz.cz>

Thanks,
K. B.
