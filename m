Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323881F4703;
	Wed, 25 Jun 2025 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833258; cv=none; b=CON4fVfha7OWgq1ZrhSSkb+p4Sedi0Lu3J+T3/1sRxK0CpcNv2lWQPVTATHgBOMQIqi+9/uHGWqPTRxJ7jOip7FEKQ4sVelb++bII9hr02Ivz9TAoNW6bT+CN14QTzY9tJF0KDG+nPt/xCVMw28YZysOR/eHJEeVyrc790/o224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833258; c=relaxed/simple;
	bh=3WhKG1NXdKzzwq28Ut/IGW1/t/WSec7i2UkUGPPqsWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLg7hKkhgORpoeLZmii5AAdvxsjzPvzG9tsVt4y11knIxtLKSp5ZX0cOuZArKQCR+UA++lMgAR4UobJHvgZrZITVuZTTdPQoXuWYbc3tspzTxqO5mW3KZPQJEPrd9GZWa5EqfHDJnRKK9kkr21a2w4hGPukDfMi3x7amCOo8zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q58/IymQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q58/IymQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5018446a91.3;
        Tue, 24 Jun 2025 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750833256; x=1751438056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYoTCikiF3mOWbHSKg9CxNJmBT0oqbo7zNZegpHWbfA=;
        b=Q58/IymQGlPXLOBg93W/evqirRFHlTwDq/MN9MjIiVSPV+Qch3wZ7csMHjS6+2l5Gr
         cZJv5KT+NR982VK20o2IQJGEOOWZBnv03y5DpxL+aVNZUQlHSr7XYjSFI/VKLCT/zFfU
         FrAmS1GaeL2xPKZe6HXsfAjJgoyrhaxcXOVIlQTA7mMsr/1+7qHON6vh+PZltsHU0uNN
         pyBovtAl63h0LJcelUBn+KEk32MmtkNennsyZvoh5HFBYhVPfr35Wf8VzddcqMO9oIT9
         zZzd8m0GQKMmTbawjf3hDodseg+e9+KvpNS0zfdEkP0hiUAV69KzS+ZpRcw6YMFv/P9+
         BK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750833256; x=1751438056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYoTCikiF3mOWbHSKg9CxNJmBT0oqbo7zNZegpHWbfA=;
        b=ai1RIOGh67Tl4NwqrVg3B9MSgFRf+M6UZltcrfbBoixXgzMa+XKoIq0ULUbNzZ/fPW
         qZczGlZZF897qcTX2S0rpiQWpF7hVL5g3a2eGY5V7FBXhjSR21Oe3SQMPoS8OisXMpAM
         Ki13vd8TTceFB1Cye8IoRuYgGurDaaTIq7qc0iLPYD9SAXwZuuuq6sclZ0IUvjXbirXx
         LmL085X2ghaqYMU6OaI3H+MRXwYepqvSVdm5ctN0hbHoCXYNZFYd+rsbCFqYbfJ5NDUY
         /W9CYTwAJgsajWjSRUj+TArWowp3nMOFwymmY3JQvGMQhWxJwrTKT2Drrc7by0izb2HT
         HmIw==
X-Forwarded-Encrypted: i=1; AJvYcCXl/BG2YdNIGo0ZjPlKxKrEwQcQHBLVIjbsy+CAZbrepQ17O3dBVAFXyaMyiOB2m6cdcXkt0h/YaoSJBS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLf7LlZjDBBqQDIWSuc4fYx/KG82/lD2krZK3DqFIJpyjqEleS
	lWIa+QTWx13r/g22aNaVt5bKrvPEzxwFTK0QQGqks+vlCX9jRmN0BxaE
X-Gm-Gg: ASbGncsa/ielxW+hoOiQhMBknkKC9iYUBnRcmVQZjmfB+i5WDNFX/IK81N4xEAGWR0x
	vWkoT+Wpm6QivjJA8RgxvoUbDgveZ3l1xQXw92svWDhsl70zzlEI5DXs/D9b11SH8yPcbA1f61E
	DNiVCDhWJeNk9fUObMGmVFjyGcFhF15tiKLmapH56GTdQEU1foE0xw+Z3eH8sbgvTxqbWuBSWD2
	9esmWV6a09gHo9iWNnvUTBMS3lWJENoO30Tr6/9AAdhJ2OV37a6SMqgCdos1TA/PW6WNRK4iBLl
	meoj3BvIpBQFexfc5ehDO3n9hyd+A0JD0ItCsLiLxiP1mkjOOxLwbxXOAOhhUQ==
X-Google-Smtp-Source: AGHT+IFZKk8R5zsCq3X62KXZ4uowJyvTYfVGUn7HH/IVWXAWOCIlMIUoGwCzkX3BD8hp2z8zFAXlRA==
X-Received: by 2002:a17:90b:2ed0:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-315f25c9b3fmr2804456a91.7.1750833256160;
        Tue, 24 Jun 2025 23:34:16 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53bdbf4sm967119a91.22.2025.06.24.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 23:34:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E4D274207D12; Wed, 25 Jun 2025 13:34:11 +0700 (WIB)
Date: Wed, 25 Jun 2025 13:34:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-nvme@lists.infradead.org,
	rdunlap@infradead.org, kbusch@kernel.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, kch@nvidia.com, nilay@linux.ibm.com,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] docs: nvme: fix grammar in
 nvme-pci-endpoint-target.rst
Message-ID: <aFuYYwceVvdc896_@archie.me>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
 <20250625041643.174110-6-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9CDCDqAKhwmhjDL"
Content-Disposition: inline
In-Reply-To: <20250625041643.174110-6-alok.a.tiwari@oracle.com>


--K9CDCDqAKhwmhjDL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 09:16:34PM -0700, Alok Tiwari wrote:
> diff --git a/Documentation/nvme/nvme-pci-endpoint-target.rst b/Documentat=
ion/nvme/nvme-pci-endpoint-target.rst
> index b699595d1762b..2f75c8a267de5 100644
> --- a/Documentation/nvme/nvme-pci-endpoint-target.rst
> +++ b/Documentation/nvme/nvme-pci-endpoint-target.rst
> @@ -6,20 +6,20 @@ NVMe PCI Endpoint Function Target
> =20
>  :Author: Damien Le Moal <dlemoal@kernel.org>
> =20
> -The NVMe PCI endpoint function target driver implements a NVMe PCIe cont=
roller
> -using a NVMe fabrics target controller configured with the PCI transport=
 type.
> +The NVMe PCI endpoint function target driver implements an NVMe PCIe con=
troller
> +using an NVMe fabrics target controller configured with the PCI transpor=
t type.
> =20
>  Overview
>  =3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -The NVMe PCI endpoint function target driver allows exposing a NVMe targ=
et
> +The NVMe PCI endpoint function target driver allows exposing an NVMe tar=
get
>  controller over a PCIe link, thus implementing an NVMe PCIe device simil=
ar to a
>  regular M.2 SSD. The target controller is created in the same manner as =
when
>  using NVMe over fabrics: the controller represents the interface to an N=
VMe
>  subsystem using a port. The port transfer type must be configured to be
>  "pci". The subsystem can be configured to have namespaces backed by regu=
lar
>  files or block devices, or can use NVMe passthrough to expose to the PCI=
 host an
> -existing physical NVMe device or a NVMe fabrics host controller (e.g. a =
NVMe TCP
> +existing physical NVMe device or an NVMe fabrics host controller (e.g. a=
 NVMe TCP
>  host controller).
> =20
>  The NVMe PCI endpoint function target driver relies as much as possible =
on the
> @@ -181,10 +181,10 @@ Creating an NVMe endpoint device is a two step proc=
ess. First, an NVMe target
>  subsystem and port must be defined. Second, the NVMe PCI endpoint device=
 must
>  be setup and bound to the subsystem and port created.
> =20
> -Creating a NVMe Subsystem and Port
> -----------------------------------
> +Creating an NVMe Subsystem and Port
> +-----------------------------------
> =20
> -Details about how to configure a NVMe target subsystem and port are outs=
ide the
> +Details about how to configure an NVMe target subsystem and port are out=
side the
>  scope of this document. The following only provides a simple example of =
a port
>  and subsystem with a single namespace backed by a null_blk device.
> =20
> @@ -234,8 +234,8 @@ Finally, create the target port and link it to the su=
bsystem::
>          # ln -s /sys/kernel/config/nvmet/subsystems/nvmepf.0.nqn \
>                  /sys/kernel/config/nvmet/ports/1/subsystems/nvmepf.0.nqn
> =20
> -Creating a NVMe PCI Endpoint Device
> ------------------------------------
> +Creating an NVMe PCI Endpoint Device
> +------------------------------------
> =20
>  With the NVMe target subsystem and port ready for use, the NVMe PCI endp=
oint
>  device can now be created and enabled. The NVMe PCI endpoint target driv=
er
> @@ -303,7 +303,7 @@ device controller::
> =20
>          nvmet_pci_epf nvmet_pci_epf.0: Enabling controller
> =20
> -On the host side, the NVMe PCI endpoint function target device will is
> +On the host side, the NVMe PCI endpoint function target device is
>  discoverable as a PCI device, with the vendor ID and device ID as config=
ured::
> =20
>          # lspci -n

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--K9CDCDqAKhwmhjDL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFuYYwAKCRD2uYlJVVFO
o+PHAQCE+vUOXn1bwzmLgPVFqN1ctK+E0hBGYsbXnSjp1YwkaQD/VheYmW0A5xSG
N42MKwkgxkBAeH0q5RtTr7GF1IFBgw4=
=vspR
-----END PGP SIGNATURE-----

--K9CDCDqAKhwmhjDL--
