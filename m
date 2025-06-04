Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A96919ABC3;
	Wed,  4 Jun 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028566; cv=none; b=M8YUCgfZuJPrmdSa0HBxNO3utn2eN6ADOB7gJWvXPypxDsTuW8ZhJqcjvkZziS0JFeRT7dI53n5rVb2esZd7HUKjGtdat1hsjA8YzcSqf479P5jlZp1bmRgi75jM83fJL0herkiMqW5HZUQqXK1vi2wZUl6fphoDi0anYRQSMGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028566; c=relaxed/simple;
	bh=grsrZugybN3F6VyiCoKld/OeM/h4bD/8V9Nm5ynOLUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4gAamKc0N+lrFiJU27Kz/uUwHBkw9pjGOt0MRQmpSVfJ0O3dDwjoEq6D+ab5+4ez7heFrV8ZpBJsWeupzu+YiE2GM8EyX6uChMb6qR5BfYvJ+scXQmRcSeq1zeMaZP1uK8tEMMB3205nvOCU3sEKJI4bKhYFZA37jhKZPmDC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtBCX46x; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtBCX46x"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23035b3edf1so59920025ad.3;
        Wed, 04 Jun 2025 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749028564; x=1749633364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nI/6YlgTzUh2prtcIfEjGRmgA/bBPARRMlGcFScsjKQ=;
        b=CtBCX46xu1sRoe18ohSc6W/KbnLtWMNGnLsohx3NzhfYDFwjjDPiaPHIAvTtbFX4pO
         plqUxviQJe7EEQlYWCOASzCmcj9POZjT87UOx1kHteC5notQ13EyqjR/O0ZyhpClSpax
         aXVS1M204aCE7nzZJDtysMtaYMXDXPq9ZCpa524iLwIwqsSrDy0N097vQfFkvcdmxqwy
         80QxQT+WI1rPKoBC8tmfbU++b2hhV5l99C6XirTCvTIBbKB1CUJNqsQXZZRJGAZkCOKF
         PFXx4lqZmqahmiAZmx8gVVah2KqUxB3xKR9hTrR/RbQpb8gRBHjlgLD3H04JLPX/Gdip
         ZaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028564; x=1749633364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI/6YlgTzUh2prtcIfEjGRmgA/bBPARRMlGcFScsjKQ=;
        b=jcAeJbOu04OvUwN0H3egqwzSxBFM4CI8JeOV2vnHf5bMGWApKx7gBZBMsty8CaJhnP
         EOzBU/Rzc16T2q1BEj1brcPMtttofTYLp+QrdcLW+ktNiUsFfc1wjSnwAmJ9vVyv6rJR
         ZZzE4BfYuH/xKWT1Xi3Z3yyRxuQSJQJd1v4IUUDH0xNQB4epLbm9tfH9FP2PfFI8rO/Y
         xj1Ljw245mXrV4Exdguf80e8SfgVcsY0vldVfPb1f3WqoDoS3aVBYHHRY73qenmaPo8O
         oTZfmKay1u5ivSwa/t6JKSGgT4/hocTQSO9SXF9rx+x/zyVTAj7JostHXaD6lhrKNVld
         XpOg==
X-Forwarded-Encrypted: i=1; AJvYcCW0h2ZjFj3ewiN12THt6FqKKlU2PDMIHPZ26EWsB/XLFW1tNAS9g6bXv8yNQtUB3d9qyfYFcZObKF8kDYos@vger.kernel.org, AJvYcCWhSjGYMQerq/EXZDBhO7fTYPtH8Y56cCw54Ca32S+4c2N3m9CILUMipNVtPhU+iZ5u769lVQ+Dqsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy727pC/2BgnnJzzagccJbq4hHHHP0giMyeeynz2iDiu7/KuxAu
	UEI/pue4qeKc6wbTv4K/F93FF7KavBPuqATyRETXko+Qh90q1NwnKp1h
X-Gm-Gg: ASbGncuDnFXj6RUvTxy/EKISBx1MICeR4gWcEdnNuN2620pGxuV9O6LUShykl1pxHI2
	pZ/UEIEMTQYbd7nGe8orDBfMF6fE3Gv0EVKGi+YRzz/+hPDQRSAxjqpT2Xg2BmBumccGnOyGckg
	Bj4TI/9gYADi5VMU3ulcqngL8RaCjLpvDF1hitxH25hV/UwaTO3mrA1QHx6f91jiurQGS4RDOYz
	YELdgQelHnSoRGGS8fwWvtxRqeBrM18uFphANXV23Ea7K4YgevWcXPTLvRhdyABKeTU2c/vc6wG
	+SA/UYsImnQQr7dYDNSo0cb1X6Nq9gRx7kwHPEKiDNxic2EYpTM=
X-Google-Smtp-Source: AGHT+IHzv3k2gTUTKifPbpkzozgMxHoz7WVl1+DoJ5owKz1/z9GU0aQ8jzHXBqgXCR7VY6lLjPPErQ==
X-Received: by 2002:a17:902:f684:b0:226:3781:379d with SMTP id d9443c01a7336-235e1504d3bmr28548765ad.33.1749028564327;
        Wed, 04 Jun 2025 02:16:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47edsm99708245ad.161.2025.06.04.02.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:16:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 239904208F51; Wed, 04 Jun 2025 16:16:01 +0700 (WIB)
Date: Wed, 4 Jun 2025 16:16:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-doc@vger.kernel.org
Cc: willy@infradead.org, linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	masahiroy@kernel.org
Subject: Re: [PATCH v2] docs: symbol-namespaces: fix reST warning with
 literal block
Message-ID: <aEAO0VFSuIIKH8Pn@archie.me>
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
 <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36Yld1iwtkyBYIys"
Content-Disposition: inline
In-Reply-To: <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>


--36Yld1iwtkyBYIys
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:10:39AM +0300, Khaled Elnaggar wrote:
> diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation=
/core-api/symbol-namespaces.rst
> index f7cfa7b73e97..32fc73dc5529 100644
> --- a/Documentation/core-api/symbol-namespaces.rst
> +++ b/Documentation/core-api/symbol-namespaces.rst
> @@ -85,7 +85,7 @@ namespace cannot be imported.
>  The macro takes a comma separated list of module names, allowing only th=
ose
>  modules to access this symbol. Simple tail-globs are supported.
>=20
> -For example:
> +For example::
>=20
>    EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
>=20
=20
LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--36Yld1iwtkyBYIys
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEAO0AAKCRD2uYlJVVFO
oxXFAQCQBvmwrk24N85ZsbVQgSBPpBLTRsUUnF6bCri79+v0EwEAvvvCCxaNOgkD
G9uFKpE386a6N4Q/Jm9LmW6tAkZtHgw=
=Qhoh
-----END PGP SIGNATURE-----

--36Yld1iwtkyBYIys--
