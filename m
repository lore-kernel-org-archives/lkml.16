Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDE4C79;
	Tue, 10 Jun 2025 03:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527162; cv=none; b=gDbN1svVvM4gYtYA5EY4sFcK35601VM5ercqUCeBISFEuq1Lt2w48brZh9A0AfwlPfu1+HxH72izDD/qjI0tI6VjNVa0zB3xL6OblF+OkIIN+8EFyt+aqU95REf1F19M1aJeA24TNZEetH1dAqf9rrgNHfL/BTM+KLOTiPTHdwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527162; c=relaxed/simple;
	bh=8e4qj6N+IXj17KUKfVGCbXzKVLM2X1zMTNP2QZuyqNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiHCotTEoUGDH381mggws8dYghkkjn2iqM0QskAY1lMU8wlmQp6VkFRUqAFQWg4ojskwVSKzHzjowWsJCbsOjlOxJHpy/KpGZOVPc32PkXnEpiGXmH9FkapxeXKzz+L7LPARBChqgR1Wn+dJ5kTH1aRIqq9wA9V3kWxCOoPEsrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1mJjegS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1mJjegS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748582445cfso751601b3a.2;
        Mon, 09 Jun 2025 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749527157; x=1750131957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xfh/WiFLIUl5mePx18jQVGyGKjTDMPbOj8xAWCL5Ao=;
        b=e1mJjegSXT6hpzNymo67dvzCa0kDlO1zdfOwR090T5GjzFbPiM4+jdqiF4/A3LaCW6
         hlg0vjokWJU5K0xKjR2fcCGYTTC+BC5OoXx95SN5WSG29rQOH/BeIBo4tii7xhEiopKu
         KdCqj/oPp/HOWANBLAoIuAkGlSklayE3W5X0w8DjCRlIW8ElwQ7n6MCQwvZTRtljzQ4m
         x5f/zFrqKE0gX2F9OY7MGQDvXsxAmgzjaIlp1f8ZX7Ek9FVh8BgpNwEFbUeWAY0mRgRx
         xnsA+j2lqNziGolOlUws8p8sMrYaCsr1yn8iHyP1F/P+i/koq8njPBXiMI65rJv5hB2X
         g3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527157; x=1750131957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xfh/WiFLIUl5mePx18jQVGyGKjTDMPbOj8xAWCL5Ao=;
        b=Jh8qU6msGtisITyRqkKIc4nUQkpPqEcf4Pk8HFLu8Xv8N/AG2+H0OSviDlqtTJM7mq
         6dh83r7GZNHdtA+kYBkWjn1cYEqnLZOtTZvzcoofSpvgwZVF5ou7KiTYHAsWkdxlBoo1
         AQHitzdjeFQoxwcbwRAzXGv0lIfl5D6GJ80rfZ/xS3QfJwj+tcRALfV2tYGcITsbWNB+
         iyik3JCLVJYdXFY9POCf02Tho3FeDzQNq/lozPRlMtrf/sp2Yw47DkJBtgyKSwNPZ6lA
         ohvL3Ll9DF7vN5YRBqP7plx0A26NWqOtB0o9SczqgQrkCd2g+DWlQ0vMkB4KF4Lcoawz
         gnbg==
X-Forwarded-Encrypted: i=1; AJvYcCWwPyPDv8cLPP5fwjcaIBupmvcTqqTutkgQIhsScYWGKTybpWe11tPQO+8K+xh8zblkywWjCXW7PHPz@vger.kernel.org, AJvYcCX4vLRgK/UMkL/nVanL0LWNyNryPePE55kKK2NkgorPO8qvsOxnfmO6BI5WyP2unQvglbF//QgNXrXunRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuQjboea8j/yJzl/2UelC8W0OLTQ15u9dr4O5m3I5PmU/3grc
	y9QyZkklLoRIMcSuLD/JVLsUxUWL2M6cQdZMsm1cTMXOs5Q9L/w13Gn8
X-Gm-Gg: ASbGncvNEBW17wHl4xMUsPc1yvyYdeEXhZOJKbFXHdF5qL5K3mPgUb23mHBEotUeiEj
	XVjeqsbF96jn+3nsq9KOa4CmwZ60aGvgw+u2gXqwODcvd+NugsOZ5OOcHXhh9PhA7Xyd6lLrdCj
	7tfJ+D4c4FBCcMdzGc84o7yUzoJ7ucj7lmLy25ECsi48JLiKRrGalMoNRQn9gvYpb8l9cK1ZxkD
	Lehm0zLLiFYhongVH0tT9adJokNHiMHflHkzGY34n+fXAsGuRsnqqs3Z/bU01Kc59x/dwd5669z
	q/7vMcJ+DZI4VtAgjYERMAtm052AHrPKF0E1a9jIEd62/weEIpGOu0+W//0gFw==
X-Google-Smtp-Source: AGHT+IF9HhHuKIYd4WZEes4fvzzUzS8fCX6PpbQyFmzMmY8uWr8bGAlgTK6uXtOuBFxQlad9q/ku/w==
X-Received: by 2002:a05:6a00:22c7:b0:748:3485:b99d with SMTP id d2e1a72fcca58-7483485d9d4mr18151004b3a.18.1749527156782;
        Mon, 09 Jun 2025 20:45:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea38dsm6702190b3a.148.2025.06.09.20.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:45:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EE2284209E8C; Tue, 10 Jun 2025 10:45:53 +0700 (WIB)
Date: Tue, 10 Jun 2025 10:45:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Dante Strock <dantestrock@hotmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify
 terms; added note.
Message-ID: <aEeqcX78zipEGJkl@archie.me>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tLYwtbPJs95ruY/Y"
Content-Disposition: inline
In-Reply-To: <87ecvtc772.fsf@trenco.lwn.net>


--tLYwtbPJs95ruY/Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 08:37:05AM -0600, Jonathan Corbet wrote:
> Dante Strock <dantestrock@hotmail.com> writes:
>=20
> > diff --git a/Documentation/process/2.Process.rst b/Documentation/proces=
s/2.Process.rst
> > index ef3b116492df..70f8a6603454 100644
> > --- a/Documentation/process/2.Process.rst
> > +++ b/Documentation/process/2.Process.rst
> > @@ -18,17 +18,17 @@ major kernel release happening every two or three m=
onths.  The recent
> >  release history looks like this:
> > =20
> >  	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -	5.0	March 3, 2019
> > -	5.1	May 5, 2019
> > -	5.2	July 7, 2019
> > -	5.3	September 15, 2019
> > -	5.4	November 24, 2019
> > -	5.5	January 6, 2020
> > +	6.10	July 14, 2024
> > +	6.11	September 15, 2024
> > +	6.12	November 17, 2024
> > +	6.13	January 20, 2025
> > +	6.14	March 24, 2025
> > +	6.15	May 25, 2025
> >  	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > =20
> > -Every 5.x release is a major kernel release with new features, internal
> > +Every 6.x release is a major kernel release with new features, internal
> >  API changes, and more.  A typical release can contain about 13,000
> > -changesets with changes to several hundred thousand lines of code.  5.=
x is
> > +changesets with changes to several hundred thousand lines of code.  6.=
x is
> >  the leading edge of Linux kernel development; the kernel uses a
> >  rolling development model which is continually integrating major chang=
es.
>=20
> I do not object to these change and could apply this, but it might be
> nice at some point to rephrase this stuff so that we don't end up doing
> these updates repeatedly.  After all, we'll be at 7.x within a year... =
=20

What about not hard-coding first version number component like below?

---- >8 ----
diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.=
Process.rst
index ef3b116492df08..47bcc6248a1338 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -13,24 +13,12 @@ how the process works is required in order to be an eff=
ective part of it.
 The big picture
 ---------------
=20
-The kernel developers use a loosely time-based release process, with a new
-major kernel release happening every two or three months.  The recent
-release history looks like this:
-
-	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	5.0	March 3, 2019
-	5.1	May 5, 2019
-	5.2	July 7, 2019
-	5.3	September 15, 2019
-	5.4	November 24, 2019
-	5.5	January 6, 2020
-	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Every 5.x release is a major kernel release with new features, internal
-API changes, and more.  A typical release can contain about 13,000
-changesets with changes to several hundred thousand lines of code.  5.x is
-the leading edge of Linux kernel development; the kernel uses a
-rolling development model which is continually integrating major changes.
+The kernel developers use a loosely time-based, rolling release development
+process. A new major kernel release (a.x) happens every two or three month=
s,
+which comes with new features, internal API changes, and more. A typical
+release can contain about 13,000 changesets with changes to several hundred
+thousand lines of code. Recent releases, along with their dates, can be fo=
und
+at `Linux Kernel Newbies site <https://kernelnewbies.org/LinuxVersions>`_.
=20
 A relatively straightforward discipline is followed with regard to the
 merging of patches for each release.  At the beginning of each development
@@ -46,13 +34,12 @@ merge window do not come out of thin air; they have bee=
n collected, tested,
 and staged ahead of time.  How that process works will be described in
 detail later on).
=20
-The merge window lasts for approximately two weeks.  At the end of this
-time, Linus Torvalds will declare that the window is closed and release the
-first of the "rc" kernels.  For the kernel which is destined to be 5.6,
-for example, the release which happens at the end of the merge window will
-be called 5.6-rc1.  The -rc1 release is the signal that the time to
-merge new features has passed, and that the time to stabilize the next
-kernel has begun.
+The merge window lasts for approximately two weeks. At the end of this tim=
e,
+Linus Torvalds will declare that the window is closed and release the firs=
t of
+the "rc" kernels.  For the kernel which is destined to be a.x, the release
+which happens at the end of the merge window will be called a.x-rc1. That
+release is the signal that the time to merge new features has passed, and =
that
+the time to stabilize the next kernel has begun.
=20
 Over the next six to ten weeks, only patches which fix problems should be
 submitted to the mainline.  On occasion a more significant change will be
@@ -99,13 +86,13 @@ release is made.  In the real world, this kind of perfe=
ction is hard to
 achieve; there are just too many variables in a project of this size.
 There comes a point where delaying the final release just makes the problem
 worse; the pile of changes waiting for the next merge window will grow
-larger, creating even more regressions the next time around.  So most 5.x
+larger, creating even more regressions the next time around.  So most
 kernels go out with a handful of known regressions though, hopefully, none
 of them are serious.
=20
 Once a stable release is made, its ongoing maintenance is passed off to the
 "stable team," currently Greg Kroah-Hartman. The stable team will release
-occasional updates to the stable release using the 5.x.y numbering scheme.
+occasional updates to the stable release using the a.x.y numbering scheme.
 To be considered for an update release, a patch must (1) fix a significant
 bug, and (2) already be merged into the mainline for the next development
 kernel. Kernels will typically receive stable updates for a little more

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--tLYwtbPJs95ruY/Y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEeqbQAKCRD2uYlJVVFO
o3y4AQC1hTD9k59RVIQu1eO+o0pxGW4kHjoCUSsVEwUUpvy65wD9Fq14tPwv4Y0P
Ex8ixqrIPrHmHsvJagvkBwJ1EV5LDwM=
=8b4G
-----END PGP SIGNATURE-----

--tLYwtbPJs95ruY/Y--
