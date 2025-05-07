Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9E322E;
	Wed,  7 May 2025 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661150; cv=none; b=CYvjOcpXRw2vUxzwju7iYTqURu6KWQ2mpS3VTfSemqKvv+vjm1fVAoGe97P+rr6iwfYc+/SFruGTrMD0x1hgjYcWixeIPcqH1D6sR5bCRgyIs+L3ltf5HZNnbBeylts0Ksz/uDQjevnzAECYdZx+DtNgMaTlmjQp18E6odkkQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661150; c=relaxed/simple;
	bh=sze6JImOddVBeoe5ZYxkxGB646bsGwYrizhw8ok9CLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpqEBvAKfr1Ndtf0c41aTWxvnzGQm1Dbs0c/h/2TZebmju7p2sLWQgwPArhkg1A8nncsD4vU17tHrPZq7izm56zMxbNpDltmHNDPj1eLhGf4XXMPTpyyoQAl37ImnzoKWSTDmoUssYS5ieMHJSMaENoPXGf0XHfoPqwOTp4w8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeNhokIR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeNhokIR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224171d6826so6147335ad.3;
        Wed, 07 May 2025 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746661148; x=1747265948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ReqURK0qlVdqR2LceKfkaE6OLO3yaJRV2izh3luEHpM=;
        b=VeNhokIRAeOrix0QI+SezcuEq0IvSTkj2nW4LT9hEXzPFFniV0D6d5CfbXcf0z/qhe
         wnpgXN1PAtkbgM8joz53SPox/IjT1xGb/9B7YVpiWl3rfYNn/JtriOl8v+6HajsBOwLV
         iQFLjCZJk9Ch6ofOc+QO7fkgetgfIbMPO0prlK1G2/vgSdPA4xOHc7Hl840DdASzrN1k
         gSDR8T4jGubb8IMuL0BPpsuMbLhIgTOXieHzUeGsmeIThXrtKiMMm7RGyMv2zCQTlO+Y
         98LPfyxxEZeYtXZCZMkaNjjcPFOAMKF4kD8LVhmO1O3PtMimb9tHZVYe+GFlSEaz9e/h
         1+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661148; x=1747265948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReqURK0qlVdqR2LceKfkaE6OLO3yaJRV2izh3luEHpM=;
        b=k+37K65Pc+oKlWFxdCLgc0M7kWFfzx8t7HDgBgQ3cyaKVPef1UHMFVL9gwDwiJ6+bB
         Tv428GchzSjMRjf09S3SqF/krZgbH4sQGdKy8vCf5mFCzo4wo1Adz3wm/vXlWW8a4mUX
         j4lf29zzskVc8rUvr6TK9IVU6Aqu/ObjgS6sHLhhhQstBrXTBmOwQipbvTmxSM/3hW02
         NWN3PYlZJrmDrZSyMj4S0FtRDwFTYfSLuxJ4u2ljt7g/2tp+ccyNyL8BfwILkwtViziS
         4KORwPHTyj+YTX+9UJNzudBn4sHAcNO1RD7XRzrdyelTBkNbpinoke1VwwAtCCf9Lrn9
         F8RA==
X-Forwarded-Encrypted: i=1; AJvYcCXi4au+kktvue2DEf4tG5D6WVccZCPg5KDGJWrnKpveKUbmb90OjOtcNzaPRWsEGCNSCjUIo/Or0k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZS/x3bSvJdwcSyS5G5nNvl8o/xXXA1aQIo3vCQ0jajM4qglP4
	ZSoQ/WYEYwLHfBMVYKrfRq0vUXh+PZ+SbXK0kZC9XFzjoykZJ8a1
X-Gm-Gg: ASbGnctSZpyvVpqIA8bSA7x6qEGtUfsfMWl6lgNDeo6bax9rwGgWgdG0KEOnCsHMJU9
	7oAGspokJk5AW6CW2e7xngRV/hE3/ZlbvQgXb+qPCCkbjd3J6m5VnYATO36FYCcyovACIurmZ5l
	G1clb+sEW1tEm+bzkPJeFJImPmDrVFpGJGe5QgUyl/JsdFHEtlTJ9lVfJguQlJpwcATxv7NCIw6
	517Ymm/OIcjOa0P9YkDG93VmJ9D2BaCbHm/ABDLVY1TtGi3RFbzP7LKoSxiLsztjsPcEpfC0IRr
	cL3Bgztan/jW87cCnaOmRu4i9TNUp5cqRULfEFOn
X-Google-Smtp-Source: AGHT+IFy6hXEFFlyYyjl+uCnBLXLxV6DCKTn8hzZ8VG/NYEnx66OcWUUjedasImdI9jWYdSN6cKg1w==
X-Received: by 2002:a17:902:f789:b0:22e:3eb9:471b with SMTP id d9443c01a7336-22e5ecbe214mr66711485ad.23.1746661148297;
        Wed, 07 May 2025 16:39:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e7bde26e4sm11414375ad.15.2025.05.07.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:39:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A01FC41E8D47; Thu, 08 May 2025 06:39:04 +0700 (WIB)
Date: Thu, 8 May 2025 06:39:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Eric Biggers <ebiggers@google.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Beau Belgrave <beaub@linux.microsoft.com>, Jan Kara <jack@suse.cz>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] Documentation: ioctl-number: Update table intro
Message-ID: <aBvvGHb3KCpRGU_d@archie.me>
References: <20250507055145.23345-2-bagasdotme@gmail.com>
 <CAOc5a3OKA-zQQU1pF3T4HT7awEg3JMgD-BYOXbviqMDyZr-__Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9iA4fu4h4YvL32oS"
Content-Disposition: inline
In-Reply-To: <CAOc5a3OKA-zQQU1pF3T4HT7awEg3JMgD-BYOXbviqMDyZr-__Q@mail.gmail.com>


--9iA4fu4h4YvL32oS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 08:34:59AM +0200, Lukas Bulwahn wrote:
> On Wed, May 7, 2025 at 7:52=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> > -This table lists ioctls visible from user land for Linux/x86.  It cont=
ains
> > -most drivers up to 2.6.31, but I know I am missing some.  There has be=
en
> > -no attempt to list non-X86 architectures or ioctls from drivers/stagin=
g/.
> > +This table lists ioctls visible from userland for Linux version 6.x+,
> > +excluding ones from drivers/staging/.
>=20
> It is probably best to avoid mentioning any version information at all.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--9iA4fu4h4YvL32oS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBvvFAAKCRD2uYlJVVFO
oyenAQDa4uohylaulWA1bDK5QW+7Jss7CG+MS5JWF1qGvXaisgEAkMbgtYT19xp7
i9JVpIn+ou2RKDBeIhmABzx1DCMQ/w4=
=eHOp
-----END PGP SIGNATURE-----

--9iA4fu4h4YvL32oS--
