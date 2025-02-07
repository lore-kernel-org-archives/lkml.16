Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF954133987;
	Fri,  7 Feb 2025 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892547; cv=none; b=FaX2pU6SvikUKcv1/OF7AuDMwxnQ/RIxly61Pl6SZaxBOMHg5dvu1XCLojNLJ3kgPRYNCmqiF9PybpEO+O4Lh4xM6nTyCFWT4+MsyWhl23M4c+7dJnRSqN4py39Ozg2rVabDkxvVAxCNa5eHqQqyaESVJzCKjOrNKSvbhOeSu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892547; c=relaxed/simple;
	bh=k43Z5zQYXMDziBkOvYiUcPMfe3Io+6ARNvUn9Kruakk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwidWx4J/B1ZCYiftiEXXDSfvqBR6pTfqEpYEBS97t3EB97upqO3f4PYPu9mdgJA1IxDYjisy0CebWNvE0lIXBF31ZAdzezRvGJ0d4iPT1n43UZXlNXMpT0L2Yw8WP/HqanM2mVM7Fr+WPCRSNqJiKXaSg5Bq42N6efoRDdSAPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaJZkbZr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaJZkbZr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f20666e72so33047935ad.1;
        Thu, 06 Feb 2025 17:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738892545; x=1739497345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCB+UDvr+o1SyUgsR9HsOtoX0gQumnxAJYb/vLwqtqw=;
        b=QaJZkbZrWZqcleMZ05KJLzLSfRGjWW1p1NWICgR+A5pln6XzhPk5wW770fMrg5oRvD
         R1e5AopGSeoTwTFi0OrjlLVBRY2qZ6zPHxzt81TgjFxfG2+KR4t2ucsGIZvit8R6qHcs
         KVM0HBZy1jg9MpTXWhpne/JqUrTHL0+C14ybT4a9IEEkdjq81i4KGQ8kvvtF6q4UlVXB
         ar5lDtGGV/dXxZ5rTAa8NUvQbR09sp5/iZHI0Hqr/n6aHAqxFYIiMqn0HBzv+KsSInrW
         kOssjS+vpos2mavOf4UJW1TPVoqUx5pZniiyvYTeO+XrtgdbaSPvhdSTAXjXfCaAsQSk
         1/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892545; x=1739497345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCB+UDvr+o1SyUgsR9HsOtoX0gQumnxAJYb/vLwqtqw=;
        b=p5N88bveOtOiFK1QmMrOB9pXV3Jl+OP73s5zox+zCXjnRAe9D+FyWOEz54IdPJhq5b
         Yjg7W06/bwGBeFugQKJyy1jKTHzFkzaqrRvxWRX0Nfaky82Vi72Sz5LHT4zjQ/1CpnyR
         q59UcvpEubrAcBA1W2CGvRlzPoHtB9kZzQBxPOYIwUwy0OQ/rskBgNCUvVogHIJyMBQL
         bPrNsfs8dJTzznwBT5lwwiCtH3xvv1aPVAHxBNEq4xFBHH5HSfN2g5C01Uw47xJvv6aN
         fdBZyICiHj2FK+xzj+fwxPAdEPem8XTw1bzKkBGeRRvyw4lH0VQ6/vLJVW791ZXqTihN
         vQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5YGrdw4Oc4bK9AUNFdDowb3GNZzm2qu+/soTY2Hx0laoL2Mb7XLkTH7LYQKlewZuiF0opwIqsM3xH0j/e@vger.kernel.org, AJvYcCWLu8D42Fz+njxZ/IlHZrE37+mjbAXpJl0Q9ecSZidM+MC1+Zp7XgPzdYYxOYuZIozBQdkC9cqJ3rE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQY0BRgJAf4arV6XahuNAx5GIUIfTZWvTgywXSSd98cIHusWp3
	pw8Z8EjBBDyH6PrZsy2+iGzWIEx4M64tU01bnOHqf+DoHTLcJG90
X-Gm-Gg: ASbGncsV/UH6F6LUkQSWJr551K9bPzwGTw7unR/nbK9xR+3l+h2Oc2aYoLNTThlHSq2
	cLqYzQBiIR7uViO+e8pX7gTm51vo8HalGEUYlIGSKyJNO8LDBsUMWpDlwXz4fx0mEKkvdEMY82D
	FmTsfzOFZfc5PmDRyG8Em0B8a67FG0+yXGJ7K4UCWhUxnOthwf7f6Fkhxbn00m8vOepwzW+F5BA
	Z1sq2jp0hGXtHIv2wi81/Kju5HrO8kc8H6spAD8Ww1Rss3KSmFbFYUqJIhHLxMeHozW4iYvAWKc
	6u7gREj/c3L9g1o=
X-Google-Smtp-Source: AGHT+IF3V6aRkJmvBMUyGn28OZdzyd9mfmHLPCK5NSACkkmLi9GELXLragQ10mugsV/1WBn6R3f45A==
X-Received: by 2002:a05:6a00:1a93:b0:728:9d19:d2ea with SMTP id d2e1a72fcca58-7305d4adb54mr2015174b3a.13.1738892544911;
        Thu, 06 Feb 2025 17:42:24 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af78034sm1698885a12.67.2025.02.06.17.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:42:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A30A04208FB2; Fri, 07 Feb 2025 08:42:19 +0700 (WIB)
Date: Fri, 7 Feb 2025 08:42:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
Message-ID: <Z6Vk-7OgDB3DM7Yb@archie.me>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C6onUu6KEVPlj5WK"
Content-Disposition: inline
In-Reply-To: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>


--C6onUu6KEVPlj5WK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/=
5.Posting.rst
> index dbb763a8de901d..22fa925353cf54 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -268,10 +268,15 @@ The tags in common use are:
>   - Cc: the named person received a copy of the patch and had the
>     opportunity to comment on it.
> =20
> -Be careful in the addition of tags to your patches, as only Cc: is appro=
priate
> -for addition without the explicit permission of the person named; using
> -Reported-by: is fine most of the time as well, but ask for permission if
> -the bug was reported in private.
> +Be careful in the addition of the aforementioned tags to your patches, a=
s all
> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission=
 of the
> +person named. For those three implicit permission is sufficient if the p=
erson
> +contributed to the Linux kernel using that name and email address accord=
ing
> +to the lore archives or the commit history -- and in case of Reported-by:
> +and Suggested-by: did the reporting or suggestion in public. Note,
> +bugzilla.kernel.org is a public place in this sense, but email addresses
> +used there are private; so do not expose them in tags, unless the person
> +used them in earlier contributions.

So for example I can only include Tested-by: when a contributor who tested
my patch explicitly offer the tag by replying to it i.e. with the tag, righ=
t?

> =20
> =20
>  Sending the patch
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 8fdc0ef3e604f4..72f6de419ccc4c 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -495,10 +495,10 @@ list archives.  A "# Suffix" may also be used in th=
is case to clarify.
> =20
>  If a person has had the opportunity to comment on a patch, but has not
>  provided such comments, you may optionally add a ``Cc:`` tag to the patc=
h.
> -This is the only tag which might be added without an explicit action by =
the
> -person it names - but it should indicate that this person was copied on =
the
> -patch.  This tag documents that potentially interested parties
> -have been included in the discussion.
> +This tag documents that potentially interested parties have been include=
d in
> +the discussion. Note, this is one of only three tags you might be able t=
o use
> +without explicit permission of the person named (see 'Tagging people req=
uires
> +permission' below for details).
> =20
>  Co-developed-by: states that the patch was co-created by multiple develo=
pers;
>  it is used to give attribution to co-authors (in addition to the author
> @@ -544,9 +544,9 @@ hopefully inspires them to help us again in the futur=
e. The tag is intended for
>  bugs; please do not use it to credit feature requests. The tag should be
>  followed by a Closes: tag pointing to the report, unless the report is n=
ot
>  available on the web. The Link: tag can be used instead of Closes: if th=
e patch
> -fixes a part of the issue(s) being reported. Please note that if the bug=
 was
> -reported in private, then ask for permission first before using the Repo=
rted-by
> -tag.
> +fixes a part of the issue(s) being reported. Note, the Reported-by tag i=
s one
> +of only three tags you might be able to use without explicit permission =
of the
> +person named (see 'Tagging people requires permission' below for details=
).
> =20
>  A Tested-by: tag indicates that the patch has been successfully tested (=
in
>  some environment) by the person named.  This tag informs maintainers that
> @@ -596,11 +596,11 @@ Usually removal of someone's Tested-by or Reviewed-=
by tags should be mentioned
>  in the patch changelog (after the '---' separator).
> =20
>  A Suggested-by: tag indicates that the patch idea is suggested by the pe=
rson
> -named and ensures credit to the person for the idea. Please note that th=
is
> -tag should not be added without the reporter's permission, especially if=
 the
> -idea was not posted in a public forum. That said, if we diligently credi=
t our
> -idea reporters, they will, hopefully, be inspired to help us again in the
> -future.
> +named and ensures credit to the person for the idea: if we diligently cr=
edit
> +our idea reporters, they will, hopefully, be inspired to help us again i=
n the
> +future. Note, this is one of only three tags you might be able to use wi=
thout
> +explicit permission of the person named (see 'Tagging people requires
> +permission' below for details).
> =20
>  A Fixes: tag indicates that the patch fixes an issue in a previous commi=
t. It
>  is used to make it easy to determine where a bug originated, which can h=
elp
> @@ -618,6 +618,21 @@ Finally, while providing tags is welcome and typical=
ly very appreciated, please
>  note that signers (i.e. submitters and maintainers) may use their discre=
tion in
>  applying offered tags.
> =20
> +.. _tagging_people:
> +
> +Tagging people requires permission
> +----------------------------------
> +
> +Be careful in the addition of the aforementioned tags to your patches, a=
s all
> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission=
 of the
> +person named. For those three implicit permission is sufficient if the p=
erson
> +contributed to the Linux kernel using that name and email address accord=
ing
> +to the lore archives or the commit history -- and in case of Reported-by:
> +and Suggested-by: did the reporting or suggestion in public. Note,
> +bugzilla.kernel.org is a public place in this sense, but email addresses
> +used there are private; so do not expose them in tags, unless the person
> +used them in earlier contributions.
> +
>  .. _the_canonical_patch_format:
> =20
>  The canonical patch format
>=20
> base-commit: e8bcda12176c47f2ce6c5104955845d028a640e8

The wording looks OK.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--C6onUu6KEVPlj5WK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6Vk+wAKCRD2uYlJVVFO
o5glAP44+tawF8z7wtEt+DIrZa5CIvAEEOKGpIiDllIt9liccAEAxYfTO/Zl3U98
Y11LKwZ1AOgDaQdN7XXWB6DqGApB6wc=
=Xisa
-----END PGP SIGNATURE-----

--C6onUu6KEVPlj5WK--
