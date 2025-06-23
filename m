Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE81C2FA;
	Mon, 23 Jun 2025 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750650122; cv=none; b=TVuAcx8XjVX0nWbM6iW9LG8TJ/TaqFbmGDYpl1qsANs/5pzO/NuBKnadeL8HikPl5OMCEspsXLbiZIL8vUt9W/0Cv1i4MDFNBlWWG9+twoMmKrJGXkePRj418x9jI/DqMWgRMZdCW90ciFOCl0PTbX3wlY5JIQXFAQ/yvlz5KBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750650122; c=relaxed/simple;
	bh=C7lWDwFmY+a5+xdP1TSLeEsk1cMxy1H7IRtYpyastBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jd4IFaeuPq0KIJCpdFWBK5b0tTMxKdDHdRx6vBskbhIW8clOX7dZUzOAXMMAvyHEzNIeLH5sF21qYSNEEfEJGH4R3DpEgirDv6Bn6Di7zm/jux2WsqR7m6PjkHlFoLorwTfC59En2zoAYw/Fgr28ZFrFp859krT5FFgL9fuMctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlOdw5h6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlOdw5h6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2200125b3a.1;
        Sun, 22 Jun 2025 20:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750650120; x=1751254920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7lWDwFmY+a5+xdP1TSLeEsk1cMxy1H7IRtYpyastBY=;
        b=RlOdw5h6BiALmUFnLjUhLBas+1tk57RqXfgflzUei2KNVTHGfV1RzaJcaekC+ghMhV
         XgPEW2tHrg6wF+5Pw30VvTHWWtKUyeUMetur1+gefmYrtpJwuPZXhjmd/VE1s9eRdC9P
         1aw89ClZCOIBI5HoJqXXWaWslfwpEiAK+F8+MoUJfO4ZDrfZvTO650zUb5uieIwqudhU
         Aa9wLNuEAseqLPKa7tPL2pGtDdfcKcoMityVhH2LobIFRMWclrev1TtafqJ9geZW+3AV
         7UHJbjktAsjKAHXQUCHTotzELgT9Y1LyVOQQtSImP8Y1e4irUoex4CPCK5D1Kx2DQNyU
         TWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750650120; x=1751254920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7lWDwFmY+a5+xdP1TSLeEsk1cMxy1H7IRtYpyastBY=;
        b=bYXvAjDBen++fXVNhLmS630cTIL9RPlHbrWV4390mvlySH2u252xSM8R0JgypgH4n9
         Ra/o7zXYqB6muL+kUUZHNWH0xd0sL41UUHlYRkqYEPa/BxaR0pwfMMRDeYq5WnBAapmi
         aNnE0B4qbrl3ruhJVdkQwIa7i0fUvORrzAnV02MGHt/pRKYtcNnm0kbKHDs9GZTPzwTt
         TC+BnPfP3NnktCz8jOCPUFJRanjCpguu5Xn+JDdU4lsBnmYFyn4K4a8v/gH1R2py6cxX
         OtjrlmWnj0gv/p7rk/Izv3UQwWtedLtCz/gsy5VfxbKm7np6vyPuFBO4kE9+xmJzZ11S
         ubLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB8ud3wWp+VJTdnrbIK8FH3QkrlltxGC7z112yOy0NYJ75cIc42IQBZHpjuqVLwCM+xjmnIcq+0ZlU1oi1@vger.kernel.org, AJvYcCXTGtf0lobTLU3ui+dsOh3XHFrLxpxqTFC1PYKQv74zIkhYtQYO3WnESlpQuPtugBCNTEztK+8ypeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwnllePLa66N8z6i1je6IfzIAKksVN+tB3V/BNBoPYDxzHkla
	1cEoqLNFHxKCRDRetmdexLNcOA6zW+jgpOZscD331DUO8MYiKEym/3Bu
X-Gm-Gg: ASbGncuZWr5FLKoDoC2T6pKRx9v03f3fKT4W/cdg2Ui01PXi1yFd4iNFsD5ZVTwrtHq
	fXSmEezDKbswMrEKgy9gkpar+dMpG5l/fvirQz2zNgMjfcN0MuHn23ViHRqJbV4iafcOch8fpEe
	astBCsh5iuwq43z7hElG/wRwGHXCY+riRnk0BcCNG990kbLuCLHHRyf2iqEHihL6M2Lbsumg6BI
	3nOcT6KWeIGEdXmVBn/8Qo+YhzKk4vnA7tCTvDWWBv78LdHVSPx4GXheGwn5/3nk3BNpAqk69x7
	qk2h+I6c9rPzM+QdWHPveBScd45BIhXjLR+FrnUwthQykBingQNSBHS/NlcZSA==
X-Google-Smtp-Source: AGHT+IGZFbK9gWDiOql80uktuYJl/SQ7zdnIWXbjE5cvVr7gGf4Yeuemid5KEXrIuQUaPSHEO4DAQg==
X-Received: by 2002:a05:6a00:13a6:b0:746:2591:e531 with SMTP id d2e1a72fcca58-7490da49974mr15506667b3a.12.1750650119919;
        Sun, 22 Jun 2025 20:41:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6b3aa5sm7165350b3a.166.2025.06.22.20.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 20:41:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 313764141E9E; Mon, 23 Jun 2025 10:41:56 +0700 (WIB)
Date: Mon, 23 Jun 2025 10:41:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
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
Message-ID: <aFjNA1TkBiHXNKPD@archie.me>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XoplodwdSplvyu4T"
Content-Disposition: inline
In-Reply-To: <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>


--XoplodwdSplvyu4T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 10:58:08AM +0200, Vegard Nossum wrote:
> Hi,
>=20
> Could you share (links to) screenshots of the new look?

These are in a tracker issue on my fork [1].

Thanks.

[1]: https://github.com/bagasme/linux/issues/1

--=20
An old man doll... just what I always wanted! - Clara

--XoplodwdSplvyu4T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFjM/gAKCRD2uYlJVVFO
oz40AP9NrwCAcJ8xZ78/eHf09TGXNaxryqm7K/wl+IiNlgiRxwD/ZTDZH5jHST9j
NXOkjlI5TWU6XAYEWtx/bnQi5U9BcgI=
=5ZCs
-----END PGP SIGNATURE-----

--XoplodwdSplvyu4T--
