Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719541C36;
	Mon,  2 Jun 2025 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748827615; cv=none; b=Sn772XJkKKCKVei5LwbyLb3UJh37OjWtqcRRvQ5wkqlieTAK/iF0KjTFyafwCRXOYFHChA/uxyDRqWGFfyGodQW03LdIoAou94jA4uDP8ZNICn6yhmBfo/bxbc4vUpJrQUJsmpues3May3uqylfjnLrIXR0Qi91i0a81Q+aclAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748827615; c=relaxed/simple;
	bh=EBiBJgwoh5aEhCj5Q2ZZovHlEhxmqveBySI6f0g/iFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f38BX8Jc+8yaMDBVHoH5PFSGV6Ek2N5VrFi6Mua7szeHe2PpNi6LGQu/KZl1NH1GFQEz6r1B/6SfCT0UMipT0heMblOjWI+WMuDjwo7lGDMIu4TTAZeZ8R2joqzDeIwNEPTcx+d01eOEVZL04Ixy8fxqk54xOFe3iAOhWOJSuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRNQctzE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRNQctzE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so2256294a12.1;
        Sun, 01 Jun 2025 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748827613; x=1749432413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EBiBJgwoh5aEhCj5Q2ZZovHlEhxmqveBySI6f0g/iFs=;
        b=KRNQctzEO2y7E1a8BgdnBRJguKKOT3avl2BrWIIALCI9BEzYFBVgXIuua37L3+EI0w
         6HYxbXjMeif3qqSImpK1h1vFa6UgVuE9Z0QWsQQMhv+j9eSTh1zcbv58b6V1kn98hejc
         /AeLbieXIfTOGhyXLtiExjLaFo9fUKSOd4912YfDneg5xMpXC0p7qOBfhRLP6raOH00v
         jRTKC2d8eYVbX8lMFRp2AfNbTduyI6amQdqXr1C22ZEeGnl08K5GcvQokVUP1G/7WjFg
         jVy4OjnHG+vX0S6jGAop8KO1dciZgXLwpE0mTGx80RQX/pkTZ0dl7GeMWHymmk7yrfcB
         cLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748827613; x=1749432413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBiBJgwoh5aEhCj5Q2ZZovHlEhxmqveBySI6f0g/iFs=;
        b=IvLeYEpGGu8kuc5Lt0OJBDkYmdvcKcK7tehoK8AYkuxwcdW5mH7lv4QS/gZNt2jwCp
         CJvzrTreliioIOmFxYjp4E4IYQSOJCsXJs+1MzlQ7y5/NQ6DHCcMaqqtedjetrrB8Fe1
         oYs4ONTWtseW/l7+yq6xM5J3LpysQSdu2BcJyTrF34fpn/0IG6HL8VwAdDiLqndOFC+n
         8GMWUYdxO0olSPb6tIdrhJSDtQ5yZ6w2CyDUmQMaNgyIsAhKAWEidjFIwM0RMmL9luIw
         IUQeyuzzpUS3fkFbVhup+3sQLOcjFZUx6mMEIJ+J/cXy4Ga3ng64l6j/xvdRHZn/TXQn
         4i8w==
X-Forwarded-Encrypted: i=1; AJvYcCXgTE8ztgJrCZf48GIzEKQm61R7L7FgOnReaLVeiOdjP1RCItmdMMkd+ibpzeQV29kGqcI/cxEQYNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKFwoBPOqbonkE3nyMKBbTqEqiSJ/usUD+7oJEprea4rD/LTo
	51wmApnOkd9tUoQL82TrJE1X1OKbqfyUmI2ZQCNiLCmwHBqEJamw7ZK9
X-Gm-Gg: ASbGncvAgK1eQXM+pGnvUErdBKoUELRI3cOot+AFraHpqmxa3leuvGcHFcWVdFvLEjr
	GEZjjrsaQq3PpmfXm97r0PW4Dd5vRubD3svocXvV+5KVVMlc/BQTX1Yd6ezEw6ghnXDdLPgOnrk
	Ji18h27nC3lsCq9xw/tTojQir4uWaMm8VILIx7vOK2aut1P8EBJYT6I6XWLrDVsdg5CrweZ3+c4
	8MkUlwL1MquZoOo5uaTp9UH4HsUx+YQzc167s8IJEnknwa5REcgQIzet4HPVUhM925XBHdFXq/w
	QALnqJTDIMEh6SgHW/e+Uti0CuQA7Hsk43cgxMZtqdK2fSpjjQI=
X-Google-Smtp-Source: AGHT+IF9FortDvoInFEsktJ9EgFmUf3mWfhPOwfkPSsaYeJZgoCfbwczqIaR6w8OSSdkYoUc1YNHvg==
X-Received: by 2002:a17:90b:4b48:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-31250475630mr12644129a91.32.1748827612388;
        Sun, 01 Jun 2025 18:26:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d16e04sm60112715ad.212.2025.06.01.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:26:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AA6694209E8C; Mon, 02 Jun 2025 08:26:49 +0700 (WIB)
Date: Mon, 2 Jun 2025 08:26:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	William Raezer <wraezer@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] Documentation: Add a source tree map overview
Message-ID: <aDz92QNc3ZSVkdx3@archie.me>
References: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
 <f882f6d9-c914-48af-97b7-0aad6d995819@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HsbckGZv56aBrvQU"
Content-Disposition: inline
In-Reply-To: <f882f6d9-c914-48af-97b7-0aad6d995819@infradead.org>


--HsbckGZv56aBrvQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2025 at 09:50:14AM -0700, Randy Dunlap wrote:
> Hi,
>=20
> On 6/1/25 9:22 AM, William Raezer wrote:
> > Hello,
> >=20
>=20
> Please wrap email lines at around 72-75 characters each.
>=20
> > My name is William Raezer, and this is my first contribution to the Lin=
ux kernel. I'm submitting a simple but hopefully helpful addition: a high-l=
evel map of the Linux kernel source tree as a new document in `Documentatio=
n/source-map.rst`.
>=20
> This looks somewhat useful, although I was expecting more of a graphic pr=
esentation
> of the tree structure. But that would cause trouble with the role of each=
 subdirectory.
> (and one can always use `tree` for that)

I was expecting tree output either.

>=20
> > As someone beginning to explore the internals of the Linux kernel, I no=
ticed that while there is some documentation available that describes the s=
ubsystems in principle, there's no centralized overview of the source tree =
structure itself. This patch adds a basic source map that describes the rol=
e of each top-level directory in the kernel source.
> >=20
> > The goal is to assist both myself and others in navigating the codebase=
, especially new contributors who may be overwhelmed by the kernel's size a=
nd complexity. As a follow-up, I plan to add subsystem-level maps for key d=
irectories such as `kernel/`, `mm/`, and `fs/`.
> >=20
> > I hope this addition is seen as a positive and useful step, and I=E2=80=
=99m open to feedback or suggestions to improve it.
>=20
> Patches should generally be inline as email text, not as attachments.
> This is up to the maintainer to decide about...
> and gmail is not good as maintaining whitespace in emails.
> (I don't see any whitespace problems in the current patch.)

tl;dr: see Documentation/process/submitting-patches.rst.

>=20
> I get a warning when building with this patch applied:
>=20
> Documentation/source-map.rst: WARNING: document isn't included in any toc=
tree [toc.not_included]

make htmldocs.

>=20
> Also, when I look at source-map.html with a web browser, no parts of
> the source-map are shown. (tested with multiple browsers)

Do you mean toctree in the sidebar?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HsbckGZv56aBrvQU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDz91QAKCRD2uYlJVVFO
o6QJAQDu6id3peVcQpn83sfrnKiJFxhk0QiCvPAl63MVEcxFfwD/XDGE4geIxTPM
y6EeFCOVRhogItRuAurs4qj7cHXa3wA=
=5o5+
-----END PGP SIGNATURE-----

--HsbckGZv56aBrvQU--
