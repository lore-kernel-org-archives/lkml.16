Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50858462;
	Thu,  5 Jun 2025 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092433; cv=none; b=FjiBdFEmP5PZXhDvoOI+4zHO4YO1S74YRZ0Yuy0uKtdGVPL6jyUFs8lnNnoHjTe3PgG7D9YL0uIgjNXqMnKi234go4ckDMBYn4uVgo0Wa6x2Q9Vbs91Gcxd6L5/Pu2/ver2Wf5ROAjS71n5+z/Net/wyAIG5DDpP9/3y3yZcG9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092433; c=relaxed/simple;
	bh=od8Srxi0ZDThkk/K8ZieVDKuC/Csm+DVoiedt/ryxPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOpYphNnThDjMV/i+TdZdOVX+d23N3PESnWqE2bynML87UEHA7Z17SRas1gC96wEn8hfGqrdjCRczS12N/Y5n0WfAvCG0N8mdc97f/wT1EHXQ7bSti+iX8d9wpF3VthAVP6x8e56qghcuK0tNeyWSKdg3iKGBifD+U6GPduwItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OubdubNO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OubdubNO"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747c2cc3419so415461b3a.2;
        Wed, 04 Jun 2025 20:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749092431; x=1749697231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Slde/kYagTx037Us5u9pqXevqwcUDRHPhGcdcmkeis0=;
        b=OubdubNO0VVnv9EnCGM0YudYrbbucgqc9wqR1E3k7plaORlyRKqfbsQRmPEN5M8pr7
         OFRogMANX6xJ10fZGVHMpmXnuwMdH2C8d0tjk+JwtWnOK8pXEqsYuHxeGJmuO5nh6omH
         XViZ0xqPhkPBHWPDaSKWF2TdnpA5ivoiOZKkGS0g6LBijDswZf+YGmAWn9xOGG5ynB4y
         xiGv3nLUSK+WnHQnMGBAtokALhgLluBy9QQieV6cB2xir3j3xP4c8rOgx8vpf2wdRjNM
         8v6S0pbt5Oh6ChZKACLTSpsiKzMhcntVpJabhvpgjNMxSirf1aqnCaaDxoXDmLfmFmg5
         p9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749092431; x=1749697231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Slde/kYagTx037Us5u9pqXevqwcUDRHPhGcdcmkeis0=;
        b=BEpfvTdXcXIMu9rbzWbMZdfgtrGqW1qx2trKop2QiUpodAmXVrgtAHLuYW4lxrIkrj
         Td/sc8UK6PG1TT5PvGKUbcXAzzjyfmV3d92MKANA0dTUZvLG4sgE6EWUytz/Pe473oWQ
         TbqiUpxv3GnSND5B8DFlbJb7w3AsmTmXqpm+jvL1QoTRhIGPfgjsSf0mAAkbNHdssdHO
         zNWN3TNGXmRjYVS6oiVzu1NVYXA6XGcYsGNhjPDQV5MsrpeP/QAd9SaGcvsACZDDupTB
         sEtLzdN+WgreUndD4hX4hmkkl4yzs3bZtvsf1IOTMt2/zowgH6f6rokwhVty47ap98os
         2diw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwZi4Hs9sZ4ySr9HuFrB0OU3079xB+w+f9k0mg9A2V69JMq1yEq7f5bzmyq4r5An4fSe1PofyEk90fvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPcFo9bHUZZ8Hp6lUVD1YVPuH8gd7CRNhH8RU0+fz8q0xEYPWz
	ZOn0kW3XatkzsEFEKVfa6+XoJDRycWCHRItnZNQBqMCGtaWPgIbmcxuL
X-Gm-Gg: ASbGncsrHZvEMyvkb9lT4dI9Uyt6cfgZSdJ2VXKeqoG/c6OrhtGoVKCGqCMfv/wIPFN
	zvFE2Lf9e8CqODETdDQca2nlP8CnE47bej1LK8UN5yQ44z2OJEpnLNBJXtWqQvn9bf75KzcEVE4
	6IYS4WiPGXxsScRkvn8n/vZPDwGScRGBE4aabB33GwCEeHwb8FbYwbewqO/BmQyPl+fei5xaBmg
	xM56DiXbrd8e96V2pxdUh8hG/sNBc7K9GZx4XFBunSXATph+lrTRklfsMhjqIFRjzogj8AnrjK1
	xZBFrjkawgnrOjQHEYGPeD113yO0Z61VySElzpa2jSREz3GTcO9nWdgVi6YkOw==
X-Google-Smtp-Source: AGHT+IGp8g8iik3RW6LdOVwHZPYHPYCXIc+7QLRz1H7jq6cTd3prufZaUyjdG7LXG7YLR9ql0G+naA==
X-Received: by 2002:a05:6a00:1823:b0:746:2591:e531 with SMTP id d2e1a72fcca58-7480b4974dfmr7198327b3a.12.1749092430882;
        Wed, 04 Jun 2025 20:00:30 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747bd44eb1asm10677468b3a.61.2025.06.04.20.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:00:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CEC9B4209E8C; Thu, 05 Jun 2025 10:00:26 +0700 (WIB)
Date: Thu, 5 Jun 2025 10:00:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/3] docs: some automarkup improvements
Message-ID: <aEEISsfy-O3DwXMJ@archie.me>
References: <20250604143645.78367-1-corbet@lwn.net>
 <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EEjZrgwjpbfZiAAG"
Content-Disposition: inline
In-Reply-To: <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>


--EEjZrgwjpbfZiAAG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 06:05:06PM -0400, N=C3=ADcolas F. R. A. Prado wrote:
> The only other thing I noticed is that the links in the sidebar still use=
 the
> old style, since they rely on a different CSS selector for some reason:
>=20
>   div.sphinxsidebar a {
>     text-decoration: none;
>     border-bottom: 1px dotted #999;
>   }
>=20
> That makes it a bit inconsistent style-wise, so I think it'd be sensible =
to
> update that selector as well to follow suit.

It can be done simply by also applying the same style to aforementioned
selector:

---- >8 ----
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-=
static/custom.css
index c9991566f91488..14e1bb9c4e63eb 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -137,8 +137,9 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
=20
-/* Make xrefs more universally visible */
-a.reference, a.reference:hover {
+/* Make xrefs and sidebar links more universally visible */
+a.reference, a.reference:hover,
+div.sphinxsidebar a {
     border-bottom: none;
     text-decoration: underline;
     text-underline-offset: 0.3em;

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--EEjZrgwjpbfZiAAG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEEIRwAKCRD2uYlJVVFO
o5r1AQCSfBjD1Q0WBtDnGDrAS2WvGCFR7odGDRswMdh0m8uE0AD8CKSSOn7a+uW0
PIcRkEq4dX+1fFt+rcbSt91j3zhf6QQ=
=yF4l
-----END PGP SIGNATURE-----

--EEjZrgwjpbfZiAAG--
