Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C81B95B;
	Sun, 22 Jun 2025 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750576783; cv=none; b=dCccj5z8ai41cnAOX7ihX/0FY8s6R31gSx0CqYXy/12ozedR3iaoNG8R9Qe94evk2zSlvjUeXOyC5y9HFulvATru+WIe4muQnGleYoSX0CHqOYgdV22WAJB/axBJsaTYywHtoXxfDEeq+6d6K/XQlrWk8nvYkFwcAoqzjo2m4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750576783; c=relaxed/simple;
	bh=XsZpFFTl/CwMcVUKNuQcK7fwZPhYxxqoMjPXSWGPEFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNREuulEgcI9WAySWhZagZoLjovUeaNVD0SsCwUc8X5YFA8edNqq+zM5jlLFz4JxBQ3BND5C+Lko86r0uD0GSvIJzfpOQu1nV80d6++2FdRfJSkQsNUGdC1HfeWCI3E5okMZ8lUJWtw91o8XnnLiOkWAoyVr3VQPMZgTIMY3u4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edRWLMKj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edRWLMKj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1499510b3a.2;
        Sun, 22 Jun 2025 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750576781; x=1751181581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZpFFTl/CwMcVUKNuQcK7fwZPhYxxqoMjPXSWGPEFY=;
        b=edRWLMKjQKdfGJhisrgspGVBmsf6IGcLjvalJtGUptEDN9bGKwZUwK7ATtJSFRfN1u
         uKhFYX1osvVJq93UcAPb9FCWsdFfAdRLXbZt9TmxfSy1LFEtmpBMFOv/h/6IAyEm4bfi
         Ta0KHAKtyfzZV3opjgL4bTT2H2pYHqMRMl+4/qtimKvwGpZqz1Af0UW+HIvDN+dEeA0k
         Ox4I9f39aNtiYqCQ9hOvg9GgZkA5oY85eSFekc+H4auaSu9OLLGHZngqJjd8oUg7Tx9i
         eKoCm1SZ43TRde20FUzJQBMtmSDgUq35byzNFIcRoOx1Nk3HY0I8sojXOobYEdw/hkRo
         UK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750576781; x=1751181581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsZpFFTl/CwMcVUKNuQcK7fwZPhYxxqoMjPXSWGPEFY=;
        b=mCErk0JaPPqvtmWh8ESKxVTlumYinCLeNq+Q8evM8UsZUuXuz7j6wjUviZkV9cYYz2
         NfulGq4VBHlLVwh1JcLvxUldTMZgwig5mbheT3NC+wWLIitFhWUmLqyGLEdMerS2CSQ6
         2fX/yYrxsg6cOqsp70HUK2YY1t9gtDPmg63y0bcPZVfNC0fHbdTfFaEp+mDNUUXmFJUd
         0qvqQi3Kt4xVaEUtCoV3GG/oDt22P+rlgC8P4qzu8Z6iVizdn81fE7dE7K1VsROaUEEM
         sv2ZbLVCKg8oqwp4eiFuOh/GKtTMGQXtqk0//9yDp598OmcdM6XdUg7q4T+PNN1967VP
         xE7A==
X-Forwarded-Encrypted: i=1; AJvYcCXwq+THym0pw332OcuwzIuIABaEn7qK5ZgfofdD96nTXc7AZDfAZ3dD5MbzBO3YrY7XI/AFbxFfo+ZpcNED@vger.kernel.org, AJvYcCXzNLnachgUso8Q9cKKSjujKLM70mxDOhoYOwdWQ338da8tCR+GgmMSbO/pCBfcp8y5pSsDncBCGIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXiTArppNdYxuKH6c6idLEzbtP77+Xpr+Ur6u+cUEDqqwZql3
	z5KeD5gpS3lsamVDnnBpH++W2eAmBv+naDJj+ydoJl/2waEBRViQGVP6HIhBeg==
X-Gm-Gg: ASbGncv2J3zHsVsCCuTlEI7jOV0nslcrtROZZtFf6axkDn/WjYdEC51Tfph4OJ/KI9X
	20e9TNakIT8h+nqPE4ehUZYPYIMRB2Fv6TW3IsC+emUq6jxVJWBThqI5F9zdX4sjMpRwfnosPjr
	8YMDbS3dNJM26RChln8OnRa1V+xp34U4+s0myyRjo72ossZCukUIwHCDngNZYYUGczZOfqXti9z
	VKFEXW8hFmQl4SrloEjVldCC3T5ALjSWb1PMkzKrbqxgkOYnxV3HiyaHEABIIED+rvcoFu/HJz6
	M5H6SGU7Z7EIZtcWPk9Ep+ow5yuLpX1Qcdhh1hxdt/OdtCcNjNV9VgJlKevODA==
X-Google-Smtp-Source: AGHT+IH5957iiVn86LDQ9aR/PfErlpuO6KF+Ksum9DqhMmO3m0DuZkdPNQZZO+tm4antCLdKZS3Q6w==
X-Received: by 2002:a05:6a00:1396:b0:748:ecdc:ca0d with SMTP id d2e1a72fcca58-7490d6636eamr11954943b3a.2.1750576780855;
        Sun, 22 Jun 2025 00:19:40 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a62a132sm5816943b3a.96.2025.06.22.00.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 00:19:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E473C4200200; Sun, 22 Jun 2025 14:19:35 +0700 (WIB)
Date: Sun, 22 Jun 2025 14:19:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH RFC] Documentation: typography refresh
Message-ID: <aFeuh_HOH8d2rXL6@archie.me>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <1067bbff-be53-4bec-9cec-8a4d0f531fb7@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGGSKdNNVVEwADi7"
Content-Disposition: inline
In-Reply-To: <1067bbff-be53-4bec-9cec-8a4d0f531fb7@infradead.org>


--iGGSKdNNVVEwADi7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 12:12:38AM -0700, Randy Dunlap wrote:
> Hi Bagas,
>=20
> On 6/18/25 9:23 PM, Bagas Sanjaya wrote:
> > The reason why serif fonts is used for headings in complement to sans
> > serif in text body is to break up visual monotony of docs page by
> > creating contrast between headings (as entry point to docs information)
> > and text body, which is important considering that kernel docs are
> > quite lengthy with many sections.
>=20
> It's interesting that mediawiki chose to split the serif and sans serif
> usage this way. Newspapers essentially do the opposite: use sans serif
> for headlines (mostly, not consistently) and use serif for body text.

IMO I found that sans-serif is more pleasant to eye (i.e. lesser strain)
than Times New Roman on screen. My htmldocs build now uses Google Sans
Display and Roboto Mono, though (as web fonts).

>=20
>=20
> Have you read "The Psychology of Computer Programming"?
> [https://geraldmweinberg.com/Site/Programming_Psychology.html]
> The content is very good but (at least in early editions) it was printed
> completely using a sans serif font (probably Helvetica). It's not a
> long book and I found the subject very interesting, but it took me
> forever to read it because it's (or was, don't know about the later
> editions) in sans serif typeface. I hated that part of it.

I didn't read it, unfortunately, due to financial constraints.
(Oh, and in Indonesia where I live people usually shop things online
at Shopee, Tokopedia, and Lazada [my go-to marketplace] instead
of Amazon.)

>=20
> So I applied this patch and tested it. It works as far as I can tell.
> I got tons of sans serif font text instead of serif font text that I
> don't care for. (I don't mind that the sidebar text is sans serif.)

I keep the headings on sidebar in sans-serif. Also, the body text is
darkened (but not completely black) to give contrast between docs
body and sidebar.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--iGGSKdNNVVEwADi7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFeuggAKCRD2uYlJVVFO
o95OAP9yqtCMX798pRtyj4NkP0KfzOeY1aSLjMQxHLwNoDgOMQD+JOkSqAUFurm+
SXw/VKt/Cq6a4/APpE1D13/4OAV8RgQ=
=spbx
-----END PGP SIGNATURE-----

--iGGSKdNNVVEwADi7--
