Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19331284673
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511635; cv=none; b=k9c+nT/YiozHJOFySymXPlNxFkpMb3LSZ/HbKIOxFKg868CAfrjBH3OBGKlVm5pZxF1dRGMeZZtPY4+Y9LqIoaZE7wCj6gGmpRQtOw8YrJoqq/CLgCSQ3/TInER5DKoV8QJIEvRMbp/0bO5krNFZhSrgRU6abg91vnFpoIqqbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511635; c=relaxed/simple;
	bh=InCEXlPry0Shz7qVuW3hH1vNAWeUV5R/D7hsRSK5cXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmHln913krcmiMpjwk3O8TEaaU1eOy/abcBsIXQmavT3pTXujjCKBIlVD7W9tuoakMxz5zkge/bh2Tb/mtzSxeH+cNPFBRhVUNEuBLBr9F1XsQXhyjnu3vLA8U7JoHnqz2Rsfo7uGzXGYqmBNserF4Gx5n+7wmDoaN94sFBmt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMdsQgZ9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMdsQgZ9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224171d6826so19498185ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745511633; x=1746116433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjA0zRqOdoO65aeGmUVGM27lVhB2Fk68FwOzncHTk4I=;
        b=rMdsQgZ9PGjTsS+tEjtyRiXuk08i4ku/GiVOjbm8rSjCfY4Czjr28w2JqWMIsgkZc7
         Mx6h9K5OEMXERb/9WTH1MmRwXk/NFk5W8Nd6hpSGAtn+GQRNdIFdK9fPDGTv3bpx+Kjq
         WiEOBTDMAxiCLRZ7Xg3ekjZX7g/pz3zogzUE8gxEnWPTS/MqgCKmPMu7rtSE0sc/nTcS
         CwjcOxIB2FR4/YbadvC1JgfKmX9mxEGob6CQjOwVJlwnflDQoL12x81n9h52BmK4WkJO
         l+ICwq2gNX/MMaQ+ILcDzTc2htxhjvBGIvmcpWLO1KIdK5K39xPMolpHCjnX9gU5nsou
         i9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511633; x=1746116433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjA0zRqOdoO65aeGmUVGM27lVhB2Fk68FwOzncHTk4I=;
        b=L6On6QKdnloYVzVW2oGIRsmv/NdDKs9yBxpWd5kaRDoCnRj1eZQYRAHAbQIcIWvjOV
         TUErTiAHZ/qpzlihVHrac1ABoaAo1p/rNyCShR/qUWB66XvmXLCAIGO4MDjzzm7rDcr6
         xazkff2nlmpD3Wo9ArndKZfL01My9CEfugcCROY5KOcX0NwrTIeOtl/cLGUO2wPu8384
         xHCSrev8FRFIJRDPTWe/OJhXXX2NRf9ILWJ9zA0Sk5vLPLATkEcfNYkGvHt3/lBsDada
         2ZA7f2108sd/hmRKJnDGJJNp/CFB4SuWyBSN+OjiFlR75ChaciYrIImBJ+B8rm+OoLt8
         OItQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtfrMi8wAWq5x+rRISf07VdZ2ZH6BkDoThNOwGcBLlVHVRzryLNCIiOL/x2bNj5GmEdkRXO94SGY3wDGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2oM/tFKCTWT1dIR4XFELPFyion9HHKicZRC7+G9QAqYVXuJe
	5skCiKYtM17INdx2QekggdpOzOKEMNPR76iYyWKZlXtcfVmnKFCRKkIY+0EdzQ==
X-Gm-Gg: ASbGncsPUYqYiUc4vssuif2qacNhZEXLcajkFD9T32omAMmrtUpzz0OiHhSU4s0D2Zo
	WbimEzeqdTxhoshJMX3MxbkI5oYZyuHPwOIh064CmO7EgXzrX+/LbVUcMc5C7rhqbY9xakRrWPd
	r//rpoqokBlYbsm+dPMIYDuttyi1L/Gnr3p4T3JbRz7KNp2GivICaLJxS8l3lR3oyQG819lq+gr
	yJocOtuEgl4N9AAktkwxNKeytImrQIr6Wd3LIQPGazDm12e9HViYrV9+7IW072uKzdokEroshhC
	NsksJVB5bNPk4uujpXHFsp7Wtj1LvBBqIbBKqH8/UDh9bWJxSDe2180l83jm6NBp9jt5w8fWyjy
	guA==
X-Google-Smtp-Source: AGHT+IG8P6+pJNOxYWYGXFazufP063CNc7E1r2Vnv478yECDez1ity5Va93DLn+NqSzjAaI191FlTA==
X-Received: by 2002:a17:90a:d88d:b0:2ff:4f04:4261 with SMTP id 98e67ed59e1d1-309f5724fcemr351652a91.34.1745511632805;
        Thu, 24 Apr 2025 09:20:32 -0700 (PDT)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm1597107a91.9.2025.04.24.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:20:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:20:25 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: displayport: Fix NULL pointer
 access
Message-ID: <aApkyew8pxtOonFK@google.com>
References: <20250424084429.3220757-1-akuchynski@chromium.org>
 <20250424084429.3220757-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yN6CB+ZP4HAxLcf/"
Content-Disposition: inline
In-Reply-To: <20250424084429.3220757-3-akuchynski@chromium.org>


--yN6CB+ZP4HAxLcf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 08:44:29AM +0000, Andrei Kuchynski wrote:
> This patch ensures that the UCSI driver waits for all pending tasks in the
> ucsi_displayport_work workqueue to finish executing before proceeding with
> the partner removal.
>=20
> Cc: stable@vger.kernel.org
> Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/displayport.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index acd053d4e38c..8aae80b457d7 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -299,6 +299,8 @@ void ucsi_displayport_remove_partner(struct typec_alt=
mode *alt)
>  	if (!dp)
>  		return;
> =20
> +	cancel_work_sync(&dp->work);
> +
>  	dp->data.conf =3D 0;
>  	dp->data.status =3D 0;
>  	dp->initialized =3D false;
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--yN6CB+ZP4HAxLcf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaApkyQAKCRBzbaomhzOw
wmZOAQCJHSNgJn3fio8LE2QNBerK0r8asdS4fi/alefs3cAcqgD/Y50z1pEaIDoS
Ne3XXI4RGAwgX1RNf4VOHCVJcSyczwk=
=L2jV
-----END PGP SIGNATURE-----

--yN6CB+ZP4HAxLcf/--
