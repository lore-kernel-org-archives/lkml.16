Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F09DDAD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749532767; cv=none; b=ORvuAC4uxHT07628dBt2goxGpeeMuxvCfxrCsAmsg6b6MnkwJTFssznL7BHWWnFiYXktS6IIWJvVG6MPdga8c9h/oN9rEMX62E4WjmO4Xp9gVv9koegnxB2XguhtCa7dHPdPVQZ54boNyfqmitA9vADvoPxikA89+nJGd5NeOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749532767; c=relaxed/simple;
	bh=q0NxeqBzTrHIiibg6SzYXXg8dwKYkUHKIPb5urhPa7s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4PUPVGBnvYmZZb31ds3QGIg+BzpKMvXzVvnPeCqSFksD5Rtw4+rIyVU6ijCmExM8DeD7lkU5NdqysVrgkkRIWViLICTG+f9CyfEbYA2dTRs5Ido0bdaMJfqHg07KqaycQBL/64n3qO/CEUGVE93wZti+YedsS1IEadQbgC2ZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXkKIXYW; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXkKIXYW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5048930a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749532765; x=1750137565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0NxeqBzTrHIiibg6SzYXXg8dwKYkUHKIPb5urhPa7s=;
        b=TXkKIXYWATliOsC4BBQwE8Z6y34Nxw+QW1ujpyALmR4GSTv1gQ5m8oIOtJHMJu366q
         g7XfJZW6cg5jJYoVrjY7KEihsblGSIusYIlxcVToSD8WIyJoFKtl0BO/DSHGIUdzZBVE
         DiTAp2JxH2ciIHinWoIPweehaJwwdUzq/eI+p6v+PxfYDuCWoV9Gvv31kw0Cibj6ehmG
         W54E+lTrK0oSX2iefWnWXTnc5aYICRIGY+sUGXMxwK+NN/YbDvAqzrGhLxhm5Rb91JQo
         gFKS2YFl9M4gLqncVi+rcynTCcCHNCQ6p6ZaQmsbS+VjplAHTxTChZBhyg05fCrzoM2L
         Xd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749532765; x=1750137565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0NxeqBzTrHIiibg6SzYXXg8dwKYkUHKIPb5urhPa7s=;
        b=UBcBexgCYi3s9kmL0t0nLH8QBSi62VPGqNlAc/ODZtIY69BhhLpzydnlppmL5N2dfr
         Gaz2W5I4kBRPzWM+aHFuPr7Qpbqwi6qfF4nBaoisE/sJtpRWR9tYLgziLHNPYIbGzASE
         JJePd7w0aGLYNW2vvwjL7XB3mbtnq+urNS7tgNQ1hsUeG17g3cABTFzplTzzwNAnFsAs
         Fe7IPa4/lLUNq7o3rN5EYFh9dZCvMSKNipfwe+HaIYYq4obkPrnxkvhs21OdvK+5QedU
         8EivRbm1OGlns2Q+IqLc9w7qqCc6AXst4PrYj8QqBGMOUS+BPeQrrw+52smMf1fjHbbI
         tDfg==
X-Forwarded-Encrypted: i=1; AJvYcCW/js7oYEg21aztSqdHJpSokUv2JBcuJTt4b3vV++joFB0acOrnX8j9BBZFtqWNOsZ0rIEETA0K3UCuEtI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sra+NjHL3LubR+isEpqlZmfqXlksMWJaA+T3l9hl/Uiu62Nq
	yNtucRsGslKMVBvOXBaI2u8fDRvIcG7GySlLtowZeMX+3IFZCsW1QaU9
X-Gm-Gg: ASbGncutljQ2eAjXkCcOWmHLr3doWVJ4lhn9fvL9OH278hYzDZvtYu62jYvLoRfNSaI
	Zr+a9YKjzzNqavH17ChYmiIVLceBPD/GzpXAk9ayCtYRd90+Prt++EHtzzaSYBx27Mtrq/+Lk27
	ClfBWyxD1orbw1AnJSPFHwiLcGtm0Rrj0e9jOWbgW6pxhqqKy2MgmJXF9OtnrbRxaxJHAtOVRkB
	eZLhNSDQ4hbDepR7MSNLbXJXapD+1m7+uYiMhVBzvIZshYeW53PpZ5zLpsUNX+OIEoT5p4kOfcy
	2Gis95Gh6k1rAQpbsE5uqpBg5FTQze1hb0itd3KLnQtcP0mD3v+ZH6pE3WGmPQ==
X-Google-Smtp-Source: AGHT+IGcxTZADBmswIUy9YiqY0nHgn9vquMQSo6k5gR+VwzTv7U9aLsJKEqlkJLpFzw1nNxqG616xQ==
X-Received: by 2002:a05:6a21:3399:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-21ee2587a80mr23620658637.4.1749532765138;
        Mon, 09 Jun 2025 22:19:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7825c8sm6099340a12.52.2025.06.09.22.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 22:19:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8D3954209E8C; Tue, 10 Jun 2025 12:19:22 +0700 (WIB)
Date: Tue, 10 Jun 2025 12:19:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: TheComputerGuy <rosscomputerguy@proton.me>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: PROBLEM: VMU driver fails to compile in 6.12.32
Message-ID: <aEfAWt96eyeWIK6X@archie.me>
References: <zuZBGnW2fdIaA_VWDHq0rHzzxfyAt-imVmN8LoVry5hU1U_Yr41geYn7f2Edk8jB6cAUDsUknMjbnXUFPdcykyG_QVezsIriBeN5NO5drlo=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBitZsuAkr6o0kKn"
Content-Disposition: inline
In-Reply-To: <zuZBGnW2fdIaA_VWDHq0rHzzxfyAt-imVmN8LoVry5hU1U_Yr41geYn7f2Edk8jB6cAUDsUknMjbnXUFPdcykyG_QVezsIriBeN5NO5drlo=@proton.me>


--gBitZsuAkr6o0kKn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 03:38:39AM +0000, TheComputerGuy wrote:
> When compiling kernel 6.12.32 with GCC 14 and utilizing the "dreamcast_de=
fconfig", I noticed the "drivers/mtd/maps/vmu-flash.c" file fails to compil=
e. The error is:

Can you post the full config? Or can you reproduce with minimum config that
triggers it?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--gBitZsuAkr6o0kKn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEfAVQAKCRD2uYlJVVFO
o7t8AP0e2NhaBn0pW9pzs12U4QO8QhmKozeXHC3CiXwWKhfuZgD+PL9xv19PaHMO
QuLL46OBojPTw4sw4vNnsoMKqHAl7wY=
=9Ofd
-----END PGP SIGNATURE-----

--gBitZsuAkr6o0kKn--
