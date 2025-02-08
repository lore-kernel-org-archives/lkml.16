Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D41148304;
	Sat,  8 Feb 2025 03:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738984014; cv=none; b=WBih1gX6bPxNNR7xyJHhAOp92CetEdPVAG8ehy9pkIfb9iQBStmjtU8Ojcg43hDe85mlwBnNUIky9k+q2eaWt7mIzdHFi9GkABfXvef01bXgf8BMMYj6z2n1oJiFerkWSlmQluEn7ZRAOfm7VMBFhcWMn+XuR2MytaFnLEW+EIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738984014; c=relaxed/simple;
	bh=Xnnfahr+2G8w4owchNWnEm2cHSGVDVQh8K1zVoVGmIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSA2DB4OsH+QEwRdUpieRdeoe7VpVlsmtCsfyfWTiLFjZnQ6szS6FeH/JqT08egIEH8crPjTOIxs1L2nGwuZFkTlPRbroF3IGUnuygCMc02rGRmiJmgDEqg5UnEckXM03XCpW98cXnmRF71TvXHBpjNjwR71CfMi/4fJX+CGSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=av38B6Df; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="av38B6Df"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163dc5155fso56116495ad.0;
        Fri, 07 Feb 2025 19:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738984012; x=1739588812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdgvWheqjT5pXT4I1T07lINQhy5JHRq7w0nHepie99s=;
        b=av38B6Df4VzRnRofNFNdZOaLPkgFPEdIxTCa+EhQFWLW5zg9A31b7PDh6WQKhUQACF
         nMBc3/0/1/PK1Ao16iYE2RwVdCE6zMbAuW2tYX7Yh8TX/gm77dcZEzJ4ZDDeYNQkeI5w
         TrWqdNPiwe5Z3veU5zFEyuHkP4QXEFo/tD+ldNvl0RDk5h17rk8xf5IrkqJHG/dHR55q
         P8zNu0b6IksCtH+/aZEsiYTeihNv8Q6k9s0JTQTR8jVcYD8T9B/5LWhFBXfeEahUOJVq
         9MD5XPTxOW3UqBAuEDpASxi1723eM9n9rgilf70b5D7Et2c0liZLY9c4WnxG1+CARoTM
         RkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738984012; x=1739588812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdgvWheqjT5pXT4I1T07lINQhy5JHRq7w0nHepie99s=;
        b=SEdNbTWlmX/sNCzsbkWhz9/u6ZO6Z6fUU40cAsjTDBtHbrjlLVqQ7Okz/Z737vb7CH
         GLwr8G0wt8/TAwSBgRL17Q6c739XmF14DUx+yR0wheSaGD7jNKrmWepdeZWsNBK9DqYu
         857qz+E8D2YYb4GxVl7iFPCXK3Kw9Ell5UcnZ/ZyFDbBqPU53n9oGhA4a57rCDgUZrLz
         BfcTE/cdXR/yT4M0nzF5CU0knsvHnJfLVSgWtyWYhEbN07uTxj1qQb/2Q+J0zbkkZYiR
         VzleY6YtepH9uwhl3Au7PA+x9+99DFA2LCRszy5rx5H+WV8TYwe8JqG8V7gHf+yfd9Oc
         EaVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJrjN/kueCat/gfhF/QAJOdvTRXzGTfp8VyZp1Vw4cB9iCI8HZdI0dEGTM7YWLM6cB5j90XrtNB1EYVxJR@vger.kernel.org, AJvYcCX70pByXhz/SQJhQnShE1A592oH+x9lfWRVWMHC4tWqvZePchsRwvRtM6KZU0GaUZNGBEFJ272e1n0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyg5G3jiviDGOKh5USUNWg+4K5r+q4aUJYLQmZKQXveuiHneu7
	VzKHPj/u6tMMPQLqtLoGepLP9RM0XegSfC9uoBlANlApi8JlfuFC
X-Gm-Gg: ASbGnctLAqNthGUyWxS8VpxZ9nAhbRc9Zyw+R/Sb+H/40bpui0pUftsyNfpoIK9Ydkj
	OqdDOW7OHKoO5GU+Bzd/qCDfdmQpndLS16nZcevLZFRhaLCTGoNF3lpV9kjw1ebvjXYGEfM+oVh
	L5KDicv5R3Tk5Ls83CQP8b7ocUBwp/VqpHDF7AN/loM81JVpRgtkiFif88WQkp7loYSeH8kbvmN
	RFa4xZbRO25gBR/iEc8NI9XPi4+vHaN8octxQR2Cljxt98TMyHnaMiHEDbeTOz2TTTeVOPW9Sfo
	nzVyIH8BBCybNlk=
X-Google-Smtp-Source: AGHT+IFJLSCXQpLWVjygO2ryT8UBN9/TQaLw2cpmwi5QB34TSe8wHW0JRe80FNHslqUQ/LyOyYDIWg==
X-Received: by 2002:a17:903:2f84:b0:212:63c0:d9e7 with SMTP id d9443c01a7336-21f4e110a0bmr88071015ad.0.1738984011623;
        Fri, 07 Feb 2025 19:06:51 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687dddasm38069655ad.203.2025.02.07.19.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 19:06:50 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D25224208F47; Sat, 08 Feb 2025 10:06:47 +0700 (WIB)
Date: Sat, 8 Feb 2025 10:06:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z6bKR9K16-oYMLFl@archie.me>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zw9znROb1LsOQG2j"
Content-Disposition: inline
In-Reply-To: <20250207165325.3998-1-pranav.tyagi03@gmail.com>


--Zw9znROb1LsOQG2j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi wrote:
> Corrects the following grammatical issues in the VGA Arbiter documentatio=
n:
> - Fixes subject-verb agreement by changing "co-exists" to "co-exist"
> - Corrects pluralization by changing "server" to "servers"
> - Improves sentence structure for clarity
>=20

+Cc: DRM folks.

> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  Documentation/gpu/vgaarbiter.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbi=
ter.rst
> index bde3c0afb059..d1e953712cc2 100644
> --- a/Documentation/gpu/vgaarbiter.rst
> +++ b/Documentation/gpu/vgaarbiter.rst
> @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
> =20
>  The Resource Access Control (RAC) module inside the X server [0] existed=
 for
>  the legacy VGA arbitration task (besides other bus management tasks) whe=
n more
> -than one legacy device co-exists on the same machine. But the problem ha=
ppens
> +than one legacy device co-exist on the same machine. But the problem hap=
pens
>  when these devices are trying to be accessed by different userspace clie=
nts
> -(e.g. two server in parallel). Their address assignments conflict. Moreo=
ver,
> +(e.g. two servers in parallel). Their address assignments conflict. More=
over,
>  ideally, being a userspace application, it is not the role of the X serv=
er to
>  control bus resources. Therefore an arbitration scheme outside of the X =
server
>  is needed to control the sharing of these resources. This document intro=
duces
> @@ -106,7 +106,7 @@ In-kernel interface
>  libpciaccess
>  ------------
> =20
> -To use the vga arbiter char device it was implemented an API inside the
> +To use the vga arbiter char device, an API was implemented inside the
>  libpciaccess library. One field was added to struct pci_device (each dev=
ice
>  on the system)::
> =20

The diff looks OK.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Zw9znROb1LsOQG2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6bKPwAKCRD2uYlJVVFO
o2EnAP9KXpy/sNMRD07GgHf0CZ34bJcFE7NvYEFNIzeNQDcgiQEA3gktCvb0ofFa
SL7vz+ybdAw6ceg4vF/hhZ8ZdbitVgA=
=VhPf
-----END PGP SIGNATURE-----

--Zw9znROb1LsOQG2j--
