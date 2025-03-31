Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E1210F5D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433563; cv=fail; b=sHS5+cFmswCXNOSIUhpSOVnEO6EwxOdlxWYnwv5IC4DcW6TxC/uO0vCoHRUXyw0uWle6g4/lXTs3sz35An5Txw2GCppBO8j/iSw1JoR8PCGxRSbZDWInaHzTooNQMzfASuCtHBEZSPnaxQxWZNORGU4B+On179+sHnYB3Dze070=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433563; c=relaxed/simple;
	bh=YAlTkypCMqD6UhQ5HkSJhoyEb79hjbrF0Jd6o/54hEE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kqv4U0vRyZ6tDoOimiatnFpIRX6g7A1FtqK7lhJ5zubHRISXS3QAF0JFY5mBkjU9ocBf67p1D8D1OlLwcIa7+nDL5aoFZxx2yFLqfV3BFQmvjjhSjbMGNI2N9azSaT6gd2O5TlgCTR1PYU2SPPfQflwcohGDVS0huEMlizz0g3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=2TQCxy+8; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=Z0q6P5B2; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="2TQCxy+8";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="Z0q6P5B2"
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id E36E4480A55;
	Mon, 31 Mar 2025 11:05:53 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1743433553;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=YAlTkypCMqD6UhQ5HkSJhoyEb79hjbrF0Jd6o/54hEE=;
 b=2TQCxy+8ByExtNs+icNL+InVhSs5r97ipQKE3SY3OY5VxChxdKf7fLiEELcT49+18S8wg
 8uGkIbDNy4D14ClCA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1743433553;
	cv=none; b=ozi52zx+aDuZc6jhohb4jsqHsaTsyvvgxoqV6F5o+h0L/K0BJ2TK0+e0sFZv5OOPMMuGvP6envRVZV/wysBe7Kz6wB0pFfJPgt720LsGExQCl9p/5JjX+MVs+SLd1fOiEoFiDpO3p0rMcnnEyI8rbG5A/P0U9LJnSA9gc+J8+3aAQ5xZJkvZvR8fb0NmGHpd6X43pmQFkNoOahysHu2x0C/Ahequp5lp7/bMcXs/gBzbWFaVpmne3IrFQWizb9LzD0K00OSKw3qxGkasdYqWDurAgY1B0dnH6z4HkeslXkNerZWYJM/JO86DuEDNbhzWk+oT3uZ+F7+3zNl6Ze8u0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1743433553; c=relaxed/simple;
	bh=YAlTkypCMqD6UhQ5HkSJhoyEb79hjbrF0Jd6o/54hEE=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=waPVi9vLr+AuanEDeA8F7nqeFn6sW7SOTQJyUOVZBSZYst5YO0312hJCAVnBMCcqy4U7AX/kPbcrl9Aq0sTsshhJ9qskzmKzJbm03qnSW1TQko17hLkoyDCz7WD004Ma98SxcoU4UBuFj5kV2aOzEX8Jum60RY/NOI8ve0nO8hmytyzCwvB11xbFyQKk2BAhe5JNATibRm1KWAhMlH++qQSg1f544SWrum2UD+QLY9n7A0Lc34ra5mQJqpS6/vhVnuRMrWJgcoDt7iyW0vNgxak3vMJqvtxxfda7OuXMw+6khPXfSWGrLiftJM2sTnze3Q0zj2gxH9sKyRXLf3wC8Q==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1743433553;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=YAlTkypCMqD6UhQ5HkSJhoyEb79hjbrF0Jd6o/54hEE=;
 b=Z0q6P5B2IBMWcZgqhUquRVHUoE28qihgRzLJMYlAswJi1AQKUr/5xTUS49Y1rCVZn2JLk
 O4ZAKZeGbKLH08JTz4GW9UkxjVLIWrocuZhxGozDzw5hE08160F9UOseKsORhYaSexwv7JS
 9bE72ULcsZVsRam3TwVoRmHgfG4eaL1pjtD45+ZpXGF0eO5guVgnbQGS9tzGfxnN7mobyHu
 VzsIXh+y3iyJFM2tD4YDtM/GF//0X3ZlGc5Q+QcKu6H8+ql4B0GuQAw4+4pr7G8Jiz4fmBA
 MHMC2Srd1U3KGNU3lfnfJ84EdwqEohdxwBnt/eoiCVpKxYQ8SoBv7syN/1Ag==
Received: by srv8.prv.sapience.com (Postfix) id B0D97280409;
	Mon, 31 Mar 2025 11:05:53 -0400 (EDT)
Message-ID: <f63160cde06665bc4bf0e0a18402074e3843f9eb.camel@sapience.com>
Subject: Re: platform/x86: thinkpad_acpi causing kernel oops commit
 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
From: Genes Lists <lists@sapience.com>
To: Kurt Borja <kuurtb@gmail.com>, Jeff Chua <jeff.chua.linux@gmail.com>,
 lkml	 <linux-kernel@vger.kernel.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Date: Mon, 31 Mar 2025 11:05:53 -0400
In-Reply-To: <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com>
References: 
	<CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>
	 <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-OqYzoG+iSIu3s4tiTxVe"
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-OqYzoG+iSIu3s4tiTxVe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-03-31 at 09:24 -0300, Kurt Borja wrote:
>=20
> I submitted a fix for this that you can test here:
>=20
> =C2=A0https://lore.kernel.org/platform-driver-x86/20250330-thinkpad-fix-
> v1-1-4906b3fe6b74@gmail.com/
>=20

FYI - Confirm it fixes the problem here as well - tested on mainline
commit 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209

=C2=A0Tested-by: Gene C <arch@sapience.com>

--=20
Gene

--=-OqYzoG+iSIu3s4tiTxVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ+qvUQAKCRA5BdB0L6Ze
26EQAQDHrsWFCO+xQmFqOrdu1bHmeJ4FU16K5rzRWyA5AS337gEAtTDjvZCCntUM
zAQrcFmxBozyEc2MYVqG6oeap5VWJw8=
=IJ6p
-----END PGP SIGNATURE-----

--=-OqYzoG+iSIu3s4tiTxVe--
