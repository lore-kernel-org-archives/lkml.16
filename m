Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92B126BFA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743442224; cv=fail; b=nBSZitjCXsVNcir3TYwluktXfI/oV9YmuIzeb10szM1GpG/+GXB1TWj3wyUotBhvkUsCwqC9zbjOuSYug4O0YgAaKrO7U12t6iA2EpxtJxr/Rps/JsK2UagqS+iv2mZq+qPJMQZGJzHUvmW/vCByopUAScUuBPSuqS4HiRUxYvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743442224; c=relaxed/simple;
	bh=/M0zQp2mYjTNfDufutYAC6n9+5eisyFQuGvd4puR838=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NT7g161TD10hShoFh5RrEIW1vSnCduFB++Z51OHOstDGkVEqJeSP014qUrU1DUBenEqUuHJPcX93hz2Le/RjBRTT05lbKjOW2EoV5A65RoXAug/GnJ9ffzP5I2s2x3DCzgknve1kGnTjLgxlqSdc8jh/iJt4+JS4VUhcFuPlR68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=fI4jWdz6; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=fmKVEPTD; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="fI4jWdz6";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="fmKVEPTD"
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id B2236480AAE;
	Mon, 31 Mar 2025 13:30:21 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1743442221;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=/M0zQp2mYjTNfDufutYAC6n9+5eisyFQuGvd4puR838=;
 b=fI4jWdz6O4XjzW2OljXjM+/U6Vn6FXwYt51g3cqcMM2SBXwz2ehHHzQzlZDfbgxYQvCrZ
 tTGmvVB/a0IqiswDA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1743442221;
	cv=none; b=gft2Rk0NUl1qYVbWyIVKc0Dpl3DQuDwsjyeTzrTymIDhuAJXh+UDgKFFZgF0cUpB7QDfV83isc+q7DJKkERoxhrys3Cex8kFlZvWCQmcyk+Dytf9jW+lDIbsHshWMmlAD/gnw6CKkMBWd6GDSeoeJL7oOcQMPrLEMjXVk7gHU37Ii6kysVySAoJpOiBf57+vCrmug6bP4fGNQeiVg3eNP96n9uQiuzeq0R7F/07jbF/UU6A6gEI1k0Xh/g9obwz1pceGu0K34G7KOlFPsAycMhtr6lAdw0NznY+g4G7/56w92nc2iMYRPGTVZ1LQp5KfSXpSyXCKm/1elzBTgwgaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1743442221; c=relaxed/simple;
	bh=/M0zQp2mYjTNfDufutYAC6n9+5eisyFQuGvd4puR838=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=RadahWr56nZlVJ3bQGCfWg9CxD2nwNCczg71yW71pEiVJhamSkVx2yVZtYFCG1K4yE9a1Dobhgy9AznvoQ+7YewobH3fa7GNxd4gW+WCucvZ879j1wfTy1DnizgEB6tFUQt03geRUCKj0dx7Rr9ESb3//6kUkmGiJNmGuaPOkWJbR9h/f5r+d6QuYFPzoXfBMg4AxdHa5A/fdunz9MstOCPulFn8x32ellqJEdg661olGcfFkdcBmgAaC8uxKqe9FFpQkNCGdJXIFf6b03fqxVzoZ2v8l4VVtFrJd+CPVxe8RCNSJp/rvnDv0TNLrlDV5/x9GnyIWm2EtIV/ouDhFg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1743442221;
 h=message-id : subject : from : to : date : in-reply-to : references :
 content-type : mime-version : from;
 bh=/M0zQp2mYjTNfDufutYAC6n9+5eisyFQuGvd4puR838=;
 b=fmKVEPTDPwSqXHRjSLzIXAxFWM+TNy8lcR6gATwZ7Xp5xf8rMefeo240EGeDBcDTVtVRa
 40CQKFqt4BjOk/glTHQvGVKengj1MzfkkbLQ1uuiZq1XFQOHpvcBiN/wTrYf2dB6etL9otH
 fLV0D82KRNP/F9tIYarvi0F/M9OUvHwr2KQN/vKLLjWiA5FClBOEYFzn+8Uw8Jikw8Kwi/e
 FmLTKxQAAkS/A/x5bKNLmA+yPcDfnerZs2Crcl8OwDy9RbVKQf10i8D2L3QFUBdmXcgNBaS
 fyoftV8mdz+tmz5QNWwmifB2tD4nETXsgAwn5N3qUtecd84+fZ/w5O3Uhdgw==
Received: by srv8.prv.sapience.com (Postfix) id 782CA280409;
	Mon, 31 Mar 2025 13:30:21 -0400 (EDT)
Message-ID: <ead550cacbdaca4667bd67ca0d353863c41c14e8.camel@sapience.com>
Subject: Re: platform/x86: thinkpad_acpi causing kernel oops commit
 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
From: Genes Lists <lists@sapience.com>
To: Kurt Borja <kuurtb@gmail.com>, Jeff Chua <jeff.chua.linux@gmail.com>,
 lkml	 <linux-kernel@vger.kernel.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Date: Mon, 31 Mar 2025 13:30:21 -0400
In-Reply-To: <D8UKVCL4JHTO.1SFF4L6LPUE3O@gmail.com>
References: 
	<CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>
	 <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com>
	 <f63160cde06665bc4bf0e0a18402074e3843f9eb.camel@sapience.com>
	 <D8UKVCL4JHTO.1SFF4L6LPUE3O@gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-c64WQJ1o0afgmOxPN6L2"
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-c64WQJ1o0afgmOxPN6L2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-03-31 at 13:04 -0300, Kurt Borja wrote:
> On Mon Mar 31, 2025 at 12:05 PM -03, Genes Lists wrote:
> ...
> Are all this driver's features present before the regression still
> present after the fix?

Fixed the crash and machine seems to function normally.

>=20
> Also would you mind re-sending your Tested-by tag to the patch
> thread?

Done.

thanks =C2=A0for fixing !

>=20

--=20
Gene

--=-c64WQJ1o0afgmOxPN6L2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ+rRLQAKCRA5BdB0L6Ze
2xYZAQC23INuLv4VA8j8dGvgLYFwtIEpe6wC1oakHrCo5g+HhQD+N7llWDT8Tb+g
/8l5FTfq627HyeD16duiaUndcDTQDgM=
=hicd
-----END PGP SIGNATURE-----

--=-c64WQJ1o0afgmOxPN6L2--
