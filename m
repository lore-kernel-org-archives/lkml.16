Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4430A1ACED2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970895; cv=pass; b=KcqzXpnLbQ3kKFO2/f75/VrT6DmryP3dO3IjokHYy3QFytB6UBVeSAuXh+H9GRCt55r+cSExNOPg98Di11zqqy5v4yz4zOq3zFKRP+6xLW3mxqZO3QGEejJ/vtX++zJlhKK6xK2ITtAkXfHsb+2kOb4YN4OFkXVH7JXbD41tRsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970895; c=relaxed/simple;
	bh=pTX3kRyRdr8cnrct5rigGJe9HyL57qgeK0fARTNy/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGEMnY0roCW6ziCAP5Xbqnuskc4HDcaUbW4Z7oXC+6m7pFvHpCjjHDARAZ8eczff1lmOTsOd7bgfHYcq7jzdOD8xo1GeAclhkLhtKJqeBXUALR8difZf5AdYyi2s2G+UpivYRH6b6HaLLAOyrkLWu2+4643guO1FH2rWJJ57kWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=P6qoJ+iO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="P6qoJ+iO"
ARC-Seal: i=1; a=rsa-sha256; t=1745970890; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jM34yvcWXVDakFssALnPBXS9O+xXQ+u4htTxwds2DAJ8JtptwdSTb5o0USKUmVVspTBdo8yEroBKtRtnvIEt+W3G/pAAafl9wAHmlA+qTnrBe0WnBa98eBy0LOAEyYzyIZFaz9EA6qbbXkWA5JmVyPPjaUqPjzanhIdJnb6g2eA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745970890; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=adWGNDmwEwcHMLop6XiAjXYDbZtgTeWp0aSquj6P1yw=; 
	b=k7uhdtEagAav+3qFX2pg8FJHDTmYBwVhDJD80X3wKN+v0TIJJNwXsPXHFD/StyV1/M2IyifqzBZVdkXHXqwHemGdF8jd53XGDVDDxxqoOc+hm1F5aWS9DH0cOInjBnVAHVn3GZdgINbF57++qNGDQ3l2+ENVZuLl1S+M9oUaCXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745970890;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=adWGNDmwEwcHMLop6XiAjXYDbZtgTeWp0aSquj6P1yw=;
	b=P6qoJ+iOtN2nCYWHbubur4Klerv7u4GsK4CAx7ERz1T6A/+c4amK3aUitQMm7pBK
	sJTgLWCO4IvPbAMYIYYjmJs1qKO1WsxTG5DILcAledja8KweVsDTH3eo+pDEPDrcYT3
	tc2VCVxgJL5OUzTs3WKojcQgvtDboKUsFA4ZK6A0=
Received: by mx.zohomail.com with SMTPS id 1745970888522126.10910937781216;
	Tue, 29 Apr 2025 16:54:48 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 25D421805AD; Wed, 30 Apr 2025 01:54:46 +0200 (CEST)
Date: Wed, 30 Apr 2025 01:54:46 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Snorre =?utf-8?Q?Trehj=C3=B8rningen?= Svedman <snorre@svedman.no>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/power/reset: add missing space before '*' in a
 comment in syscon-reboot.c
Message-ID: <7jxb3woolmg7jwr3jkf5t7k22zpokj4zmvsf5d4fknrsp56jaj@sekgsbx4ludi>
References: <20250427183910.145641-1-snorre@svedman.no>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pryeevcsnee3dwe3"
Content-Disposition: inline
In-Reply-To: <20250427183910.145641-1-snorre@svedman.no>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.214.33
X-ZohoMailClient: External


--pryeevcsnee3dwe3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drivers/power/reset: add missing space before '*' in a
 comment in syscon-reboot.c
MIME-Version: 1.0

Hi,

On Sun, Apr 27, 2025 at 08:39:10PM +0200, Snorre Trehj=F8rningen Svedman wr=
ote:
> Signed-off-by: Snorre Trehj=F8rningen Svedman <snorre@svedman.no>
> ---

This does not follow the kernel submission process:
 * prefix in patch subject does not follow existing style
 * missing commit message (run ./scripts/checkpatch.pl)
 * sent to wrong recipients (run ./scripts/get_maintainer.pl)

Greetings,

-- Sebastian

>  drivers/power/reset/syscon-reboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/sy=
scon-reboot.c
> index d623d77e657e..89a9916ee0f7 100644
> --- a/drivers/power/reset/syscon-reboot.c
> +++ b/drivers/power/reset/syscon-reboot.c
> @@ -76,7 +76,7 @@ static int syscon_reboot_probe(struct platform_device *=
pdev)
>  		ctx->value =3D ctx->mask;
>  		ctx->mask =3D 0xFFFFFFFF;
>  	} else if (mask_err) {
> -		/* support value without mask*/
> +		/* support value without mask */
>  		ctx->mask =3D 0xFFFFFFFF;
>  	}
> =20
> --=20
> 2.49.0
>=20
>=20

--pryeevcsnee3dwe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgRZsUACgkQ2O7X88g7
+poN4w/9FxxedHMOZgJZGNmsgqBZeQAel7/zBYtXs0/sIJigZKIxERE5b7EaPNle
TKHUim9P+nc3dPYHsnIwa2Z7ogF0anneN5GYYTKOsBfCb7weBG70XX7L7CEmm4RQ
csfNH22Yp4HcGYn5DYUodH0uYkkGOmn5x9aRa6LnvfRhcUC3ChLGZWHj5NgbJA9/
t7TZe0ZjuZaxHhzdB5QSRMLrIbyw2koU5d3crmWIiJH4+tQ26Ydfl5rhkHs2zaEu
KhaNgecWSDOlPKgk6Eg8hgsiDH6qky8zu45Z/uUTr8wI1pMfOPJZGmgGs7dDPAkf
aj2Sybvfist4XkvoQ4B5D6VFoYwg2K6gH3KN0Yc1PyTG9wV1OVlTSwjefNlioAx6
KOEdCiG/VH6geK3Svfo7E/UyaryoNboloCMLFcu+zZo0GWyxJKgzlVIQZfzsv0BE
5NScKQuNFawQpRX2NTUBs8U/D5vD7vPgHHK2lhll2j5R2dIh8obZvG/FLdbMEiQ/
tsHP6QVIjCvjabNOHfRe961dJOCUwybVQESi2skUX2y5hKJvWcm7+GXvhP+4sOkr
4tjlKOzVTPL0//g5ZSjXRwQRKtaGBhTyUmEz0ubsiT1zs2NaoNOX4CTE/C24vIGy
yL4QYqpMJFpVoESUE7eq7TeWKHNUMBtfhSWZBnw9VIjKbPb1JOY=
=MBzN
-----END PGP SIGNATURE-----

--pryeevcsnee3dwe3--
