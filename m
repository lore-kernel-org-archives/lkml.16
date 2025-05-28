Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F1286889
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452931; cv=none; b=gujcZ5wiaVJP3RY9vula1R642WVbCgmKjiFbu4h3pcaNy11EjFTSNRG4rauTIqhSfLaUkhJ8Pq7ZVmbFz4hdK4nG8wferSjaHjxwjj9FWPQQG5fpMo//96DlYHdklIJiqmI4tXgludwWDkwvahGTSgMmaq1wbkkAq7D7KqkCuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452931; c=relaxed/simple;
	bh=bzykNJC0yFhho0Mjy9mYg58d9bvQubzWLeDw2OxaW3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sScEp1+8gj2BkB9n7bgkaYxG6VnCY8h0sSXbJG3O+0FL0tm0GJtxd90Fu3lT6lcamv6BGmu4cGxCT7A05Mqf94bXusfuWnbn9NKSk2GOsMUQ2lpd01yw4bVflnEKArixkM3t5ShcmzyERsdrZ8Sa3CLP+g/j/ueYceoePBosGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQQxt0Wq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQQxt0Wq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a375d758a0so55277f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748452927; x=1749057727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzykNJC0yFhho0Mjy9mYg58d9bvQubzWLeDw2OxaW3I=;
        b=HQQxt0Wqd45yDDDJBREsWd9BngE93nPTUtBMkGKfn+FZTfLudCCissVzlfUIyffgxs
         YXNSAtm14AN6TC7gQFENCAud1Cx5ArdtAEL8Oc+UkRWUk8uouCECcgwcP9K/Af2E1MXj
         V/bOVDb9mh6JaXlkpyrJshnhwevwCTITmNbdHFQU9hTF1/ku5X1XV0hjYZH288lfEOGA
         IsUmT0ZdxFT5pvjRyjzVbaUOO8xUrlFYr+44PS6IRwQzG/xk2DWRmNALj5JU8S83hqS6
         V6HZfi/wL1gPlR97EValfQdaujl1r5/MIn4RvNThtcLIzBzY7jBxfaAA7+2qu4+Dn0Vt
         ZrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452927; x=1749057727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzykNJC0yFhho0Mjy9mYg58d9bvQubzWLeDw2OxaW3I=;
        b=eSetPBkJx4PL5lwLZtia677SAZi9opJLLMgWgJY4Knkgc9xLQS6vBReIDN3ddR7Jol
         5IeQBIRK7E+WFavxi1dNw8xTMIiNWGWdzywk/GlzzWvKHvG1SbuZX3xdyj4hWJrk9deY
         iwuWloyjwkH+KOyhvYX3slwQq6XFsC7EHzxQTUPeumjkPNxC/X4PnuNcOzX1oZIDE3V1
         cLNIoLS/8aiMc5HydklBFp3aBk4lyqHcB+dGznnbTB6vRU3j7TvcOKhyijSjm8Ia6CT7
         IVp9RIVRF+WeNFOlLwFMNto90d0dmrORPXyqbB1ty1hwEFybQiP+8f8ghQ0PDjgg7lHe
         mttA==
X-Gm-Message-State: AOJu0Yxe0AnC7aRuuunNL/ji4zq4pu3dlWTUyYHpEIbuUElYUtjX8fRM
	1romF3w+Fo3QhL/hhbfUVKlcxoYVqdw2+8SaiAdAcmM64eFMwyFxDp29f8V/UGbd1Y0=
X-Gm-Gg: ASbGncu8BTpGhE87I5ffGeIQkx2kN0n6wxehSe9wGCwpj9780QOZAHt+DpCAaf852FW
	X3PJcXLGSHfWAp9rm2hbHbXfo75jCtz1C8tE9qi1Z2yevZz5oCcVs4fbdCu1wIYLi3X7XUUQYNX
	fIhTmKO8hoZCHnbZcNwjNl29oeYXyRiPe7QyXik+IDpvhAxgPxHiCaTlJ1L1IHELgmZ9vpwObRI
	tximl21wTV7U7+AY7loRjbJhxrIW5GFrL/opAmycoyzkWUoSQn6N/D942+Q3n408GXgxbIFzolZ
	W3WfQUEbvrKKLu27mi91GqNhdGosxM2qIF/HR0V2vO/jaQGq7CURCw==
X-Google-Smtp-Source: AGHT+IFagD70gO4AKeaPcwfMq16swcXqF2yQvtlCsTSXmcwuPv3hauQcc0CpY8veXb1iRLaqwkBnjA==
X-Received: by 2002:a05:6000:1ac5:b0:3a3:77d7:a669 with SMTP id ffacd0b85a97d-3a4cb4c5af1mr16833260f8f.52.1748452927297;
        Wed, 28 May 2025 10:22:07 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac8adb8sm2046093f8f.56.2025.05.28.10.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:22:06 -0700 (PDT)
Date: Wed, 28 May 2025 19:22:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Woodhouse <dwmw@amazon.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
Message-ID: <vjy4zalxudzzi65twg5y3e7fsslfo3e6ee5k7pbxwjrkae3tbh@z6i3yvt3bbiu>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-14-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5427nfkclv7rqs2"
Content-Disposition: inline
In-Reply-To: <20250506170924.3513161-14-mingo@kernel.org>


--z5427nfkclv7rqs2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
MIME-Version: 1.0

On Tue, May 06, 2025 at 07:09:22PM +0200, Ingo Molnar <mingo@kernel.org> wrote:
> +CONFIG_MEMCG_V1=y

Ugh.

> +CONFIG_CPUSETS_V1=y

Ugh.

Those config options were introduced to retire old code (their Kconfig
defaults are N).

I'd prefer if these defaults matched the Kconfig ones (and leave it up
to distros if they need them some time longer).

Thanks,
Michal

--z5427nfkclv7rqs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDdGOwAKCRAt3Wney77B
Sem5AQC4McToTqwqoqr8BUllnjF8yzFakk2KWngMvou8cJaMnwEA/zGTEp6CHWvl
Y5dr07pORDR/L7qHttPadyc0lgFIGww=
=nz/F
-----END PGP SIGNATURE-----

--z5427nfkclv7rqs2--
