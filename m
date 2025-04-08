Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91E264A7B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102143; cv=none; b=VDQuDIJFOh7N/IP59yCgJmRKs66ekxaLDJejPa755azyLa0LNFjPMtO/EP9m38z3PEXf8+x9EHNgKy0Q1j4jaDrwEiByQ31L+JeutNyL+HxoClZTwa3ImOf5rt3V54MbxeX9Lta8NBZAHYGkZcO70nTXoupcNZGjH2rvU6twVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102143; c=relaxed/simple;
	bh=zqzlA9n1r9CR6wuCNl1kJxLJLTIDkxwhE6SgiF36x5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/SHcTUunmw8f22EWZiUqk9neV5zLeC4iu38ZfE2NiUXYSNyl03RoFN12iePjk0T7MxwKIuR32cYAPHWbDTvaxccgL6Fu7aW/J+g0NT6ZmwlvRhNmeam40poXOKmcDVYKnhlVeXZNxe3sa6dd3/fFPcxp26qsNXCzH3do9t6fKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=qFUykChR; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="qFUykChR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1744102138; x=1744706938; i=christian@heusel.eu;
	bh=zqzlA9n1r9CR6wuCNl1kJxLJLTIDkxwhE6SgiF36x5s=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qFUykChRkfs0xaQ/FVNErfJK+ceDdWGsQp5C4v3s5HS9ofLdlZ7rOZF8sxF8SA6b
	 m2uEB1lfwzGZGI6F/3OHj8jV9zc015W4drtHLojoiGXmAduHIs/9aQIPhae4anfC+
	 cY0a52q11bLULt0PtWsTEwkheMNXnf7ho61WWB6qRtR/AdXmSdRhdd4Ew0TA1QkHY
	 PjQyuk2NhkxLnDx4Cr4psT3azXycttI+ZPQjFYE37aOEUzMynhipAhuAhEv5cunVT
	 JT+iDc+a/hNIkz8eXFa0J7d3JbhSJWB8OMkF9IpCZrvmo15ZSOLN67NdnYnxavx6q
	 BJ97jLW1QzYjrfdd2w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.49]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXH3Y-1tYr7T10AQ-00Japt; Tue, 08 Apr 2025 10:34:37 +0200
Date: Tue, 8 Apr 2025 10:34:34 +0200
From: Christian Heusel <christian@heusel.eu>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, 
	linux-mtd <linux-mtd@lists.infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <5bba59ac-005e-4994-aa22-c2565b8cdbbd@heusel.eu>
References: <20250408082018.GA23886@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yjhj4l62urfzefuc"
Content-Disposition: inline
In-Reply-To: <20250408082018.GA23886@francesco-nb>
X-Provags-ID: V03:K1:qonpYrkuTDJlp5WFS+b383LvsXrAX+asOUbtT8PWMUg3L4yHDZ2
 sL3ShWIKXJeOAeXZbimyWpIl/S/tDjssqsmlsYyal5wBD5fnbpzWciFEE53fmLg4vGFx2Wn
 I2qjSCk2fQUO6oDVpj1e369gA+RKI4Rx6OxQaivcGqibHm22bScGmaSxt6rMs8rktAypru9
 x2UNhHZFTLBcZKQ/s+gnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vY5Q6X3ExnY=;KODHPSAGyWm08t5JAlsL65vsjMy
 uQ3lPmVGNyTvKm8G0ab53vBDx7abZH2IUzy0IEYzbvLtTn+3+WX3kbOVqO8GdHp1mpSyFOvOD
 o4Hb6601Zo0ohF5Qs0BYe+IYpcRrKMA5dy4n1Zpi8+IJNtyYJfGF53koNnlrdJ0r+W+QKxa81
 NG6k0dBmjuJPV0H3i0JQjTBYKtN4DJBxgQEmjvR+2kp9KGUQAVO6MDgd+1zoDT1nn892zsNzk
 9nx8T5dtjqwJRoh6IOLzlGWlmIiyyf5JeJG56I+KBONOT7+ePZ41NQmB3fFVcA8wOjaSgXg+D
 Z4GLKMtmPQckb7wZ6if6hA06WWqpIy0NnuC7jzwEVMUF18oKpBdG6BBpKZz4ioHML0kvT//nR
 1Jet03DMx2ZqQGNeOF/CmbrD+tO++QSdAzEU9M2Hvwf93XiS1Jw4Br5bG32hKQqXhlhEHv40U
 DGeKzCiBtgrrWx0YvARuTIkP5Whm5UwkRzl2dGvnB0fr/G4AXi3FkO+mhQg5AF0HbapLD3G7Y
 mt335Jv9JtxL9gr56reGAn2zZOSRz1gD6cthwWWUO0ZsUDs8Fwa7UMIjpl+LtWGosK0F92OKe
 QF33QFo9MQxkJy4RvxnSU2WVIuoTNmJ6ZNLefcgZEaOu+rnqIpey1Rqiyl2R/IR0clSKcCjSL
 vOZeU4NEj6pzhtysYxrKBP6dlpUOYYCOKF9HIP9LO7fg2X2k8VCkUWduXddlAmdu/tZFoDFIQ
 jDRgBw1SE3ES+bSTDVuek98Jf5tBen7X4m7MXkMxMvWS8lw27RR0daat3WJMKc7bfcBUs0kdK
 qq7Uosyz8hh4hXZwfN2EYadY03CzV7q8sMwNZCA26z+7AXlaWCNDbdlb347S9nBSV8dT8n8Vy
 600m4rpKAeKaUEzgD9QE1Wwb/Um4cAzkvwwNMKyDSKZhQvxOXZdqeRaSNuDuAI+xXS4i2PhOB
 P85SIk314J2a5hurbC6Q0diXYVk6dyze3G1SVmNZW3EEtNtgV9r9Db4GKPwpsAt2i4wj8OQ0q
 FbCLi/ez9NyMPl2lc2NIMAThoE2dN0T+KH5XH7VWlf65kvLSxtOTRBgFiuEZM7MWbaUfheB4D
 bfoyEJwXb50CqUgKZtJN3g+JjuWxbMriVnHdZ/E2akntGL5xFC8+gQc1O8ZUK2l+z9E11tcV+
 LATCrs2hihd+MYg5cbbYUeoI92U32OO1cOoIwnHHCdcR2E10T8SKkBkpJkc7X5C49alfCXwYX
 zQ1W37B3/rQMsJRv2yr4ZgYiTxpF653AcMby5e6V6ETZY3lLkF93eHGQt+1tDUMDMMlOYUfad
 1kdWkY6o28J8TD+/fRxPlOpoNxiTGe4fNVYnLk3459lHVKrrs1WGazc8lt4KtfGB0Bi28GMAI
 EnSs13qxr1onWRw6PhAlnVQTr5SMz2SUA+YNo=


--yjhj4l62urfzefuc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
MIME-Version: 1.0

On 25/04/08 10:20AM, Francesco Dolcini wrote:
> Hello all,

Hey Francesco,

> I do have the following regression on single core system using UBIFS,
> dual core seems not affected, any idea?

could you try to bisect which change has caused this problem?
This usually the best way to pinpoint the commit that causes the issue
and either get a fix or a revert on the way =F0=9F=A4=97

You can find the relevant docs here:
https://docs.kernel.org/admin-guide/bug-bisect.html

> Francesco

Cheers,
Chris

--yjhj4l62urfzefuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmf035oACgkQwEfU8yi1
JYWgOxAAvhglW0Uz4Z/ODifFww4icGEshUUXIPnNmmCDdBhKgySaOyAOY+UMErNQ
pN8bHEWr1EDpLX7aIze88pLQalCs48wKfFoVZch7Q87Wde9MZqti5ls75VGCTwvP
+bDtUm64VRsLOShejWodpdDO0M8I37K/8jMA5E3qujXmqaxXtGtZEvnmHZA3hJAQ
b5k6of/UxRJySe31B8DHQR36FOX9y4Fq3fp37MOZk5ROGC2C3xv2SNF/iWDEiRFB
4+hcfoqW25n73v819Balrrv9Zr5g45a7eoS4PXuF0Ugy08vKaWGfB+Cl+FODRtqs
EPMuXmJJgLiNzldX68GZ31L1So7e6ze3z3IJC2PZuaN+EqAxXTtFT+IKuKxvvRHj
KI0oviYlE3h2sPX3UD+PK/7lKOcMkUo8CkOvvpLuXMbUstkMXz2xm8M7a/JxQdz6
KUpddMAdDCe1eTS6N2QVVJ3RG6j6AZD54/1+9N4+HibYlH6mnnPeLccJP1Y11b9p
7WrYzCjn3uIuK+haw7JYaMZjcWAzwTQlbKWBn3j6FDziqtCQ3h0zX5Vs+1PPFv3/
x1tqNw6atqQhNgtUayk6vft37XDonDtkgTsKhLP2lom3lCepS5TNo6T3wfANCSey
uOdLYUphC04ChRKsNFMkwiBz1ommmgM5xUUaXwgrBkL/lj6Z9Xo=
=UHYC
-----END PGP SIGNATURE-----

--yjhj4l62urfzefuc--
