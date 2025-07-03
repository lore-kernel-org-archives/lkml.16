Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC802DE706;
	Thu,  3 Jul 2025 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502011; cv=none; b=WvefaoS2/ljZiIEm7euiKn5JgkNTcNGDDOjp5U4a6Ano49C8nGZJ/XbgEqvTAT/VLZtcYiCxolM8/WgyEvvaL1gYlhDri01EgP6nzy6lM7YxaBlgC8zrdxMyEtYLOq+8HP0ur+Gews3dLeE8Pmvw8zokzOylQ0BZhxPjqtZU5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502011; c=relaxed/simple;
	bh=HGP+d5DiZXY7edL7mXuCyKpn5kmU1+BAkFeysOyabnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmQ3Ffp4QrnutfKgwv1mJnkych/VlYokQ1b2tzfbjlmanOmdrBwPjcr6BmzEki8miS9JI50v4pR1/Muxhxr+1hDyvsNHZIr1bQHBmJWEGPebAU7JqgwgTK/OAP+t5DvGaOt8f/Z6IdVZgsMNPPaaZXmw3emXyVvrmkSje56iARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pcxtryek; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pcxtryek"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-237e6963f63so32882615ad.2;
        Wed, 02 Jul 2025 17:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751502008; x=1752106808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74rKt+STDv8gvziFnmBUH7WzclmqAx6VBVFDifAftQU=;
        b=Pcxtryekk7eYxYmnb29je/MxQWfDmFkSQzii/14vWpuI3YdetoNBo0gn8o5/bn5xD6
         DKo5XA0o/NlpBiOYFoY8cKuegx1+4NnnwOMtNqyTxckJkGIvtMk3c6ge8dg0Jo3nzMPH
         1oGOJz6WMTUyAqnULrSpwWz8dT2mTP5wxF9pANQbkwYmDY7UnFMs/i/OP7AO166xpIED
         iLQfHx9hDa+uP8JYZhe6V/BEaP7y35lzu+FazGjWOeFMR/NszNj1r4yK1t0H1nP6+NZF
         0vXPpDpu2DjrELX+PYT1k2maYiItT2YZN87OeD7uwv9TQNWi+zoWw4Kb/rhmaMA+jpAT
         nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751502008; x=1752106808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74rKt+STDv8gvziFnmBUH7WzclmqAx6VBVFDifAftQU=;
        b=PZ80rYfO0+BTLjaOeRd451zTLSGyGj/3gNNJDyBuyKVyU8pMlhoCB4RPZkXaJnWmQM
         AA98UH1imTW3MpRXCee7VNf+v/JI1wH6dGgmJn+QNb+Kf0O+C6veMmvqODAmh+gXfSP4
         nk5MKdSCdtp/3nClWYQ4uM9CCjD+VlMCMFDh5SFoqsxk8ls9s7P/oUo7tecgimd5bB/0
         xX0tbvuaz5NioHXGKXzGsZatRYop4dhJABBh59gIWlZHuj4+JIxS73egrjx+M8gsho6v
         43P/+AIhCSrXA3VXSxtYLiajhD5mon5SSCTOsuRltiUknS9xyYi2l3+4/y0AaAnQz85L
         xNPA==
X-Forwarded-Encrypted: i=1; AJvYcCV09GHW2W8dW/ejulqYnvYtnUr+9S6IENyhfLjxeprSLYmIfawoIpsE+mONgL+G/ZnyrwnBa+g4R40=@vger.kernel.org, AJvYcCVtxSyk+ER/1KLk3eIR+zNMN8jcN1X2+ydA5RuWRLkx3ZYxikeWvSMR4GRwE01IXvuHYyiM+jEJxMBAgBeKWVo=@vger.kernel.org, AJvYcCWFRT7eC5a124wQ/uOrtdbtTMRLLzhljBTLeUJ6+k/6w+fxfdMFB0cgODXBmRPWZvZ8sTJAtVGh3hQALC+M@vger.kernel.org
X-Gm-Message-State: AOJu0YxfEfQaUAarm2kiIgLxFBsxHhZhz72dlZ0B+5P9vI+SPCNagEqE
	kSo0HWv2hEFd0THeSS3Pz4h+EM1QUMRJFE5VSEgYu1nZ/x4to6NfMc8d
X-Gm-Gg: ASbGncs+Fhjc4I2FMrgoXoI1jWav2B6YQcMqIQ4JWGb1XF9LFsBEEw5pLj+EFuURWZ5
	dJV7S6FKbUgte/kUI5T4kn4AOMd5zqlLkdCH8Hvdle7PFM7EGFvDBYwj5XiwKBeK/btbFpjaOpQ
	k4KzXE3k0RW7+hLEClw/v+JwGBlIARxuGXHbPtEh2aa97yF+m2h71UFk9MQyOa12O1IPmuGRuxv
	NrcYggNMDyyQz1MQ3hORsKrSBS0kW7l9Rldfegy05GmQRE0PqWPcOskxyX9oUoPTk5zK7u9eg+m
	5iK9FbKCjR3yiCBe623Ecvb37RR4stymgwGcEkhyj+8R0bpTcvAY+vJCrl8UpQ==
X-Google-Smtp-Source: AGHT+IFreKQK98FHtTd4csmo0TGyK/ccLa13EmASTbcqZiR2H8hgMzgT145WTD5dZuLeULY9C5CM+w==
X-Received: by 2002:a17:903:1b63:b0:235:e71e:a37b with SMTP id d9443c01a7336-23c6e550151mr82210355ad.34.1751502008326;
        Wed, 02 Jul 2025 17:20:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1814sm135737205ad.57.2025.07.02.17.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:20:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 82C5E4206887; Thu, 03 Jul 2025 07:20:04 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:20:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 4/7] Documentation: gpu: nova-core: Document vbios
 layout
Message-ID: <aGXMtB7sN1FJOXAL@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dcvzE3w8GZbsAc7N"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>


--dcvzE3w8GZbsAc7N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:41PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/no=
va/core/vbios.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..55d7dd4a6658c2a20cc5617f9=
6b278bc4ec2ba17
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/vbios.rst
> @@ -0,0 +1,180 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +VBIOS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +This document describes the layout of the VBIOS image which is a series =
of concatenated
> +images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space=
 and is read
> +by both Boot ROM firmware (also known as IFR or init-from-rom firmware) =
on the GPU to
> +boot strap various microcontrollers (PMU, SEC, GSP) with critical initia=
lization before
   bootstrap
> +the driver loads, as well as by the nova-core driver in the kernel to bo=
ot the GSP.
> +
> +The format of the images in the ROM follow the "BIOS Specification" part=
 of the
> +PCI specification, with Nvidia-specific extensions. The ROM images of ty=
pe FwSec
> +are the ones that contain Falcon ucode and what we are mainly looking fo=
r.
> +
> +As an example, the following are the different image types that can be f=
ound in the
> +VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
> +
> +- PciAt Image (Type 0x00) - This is the standard PCI BIOS image, whose n=
ame
> +  likely comes from the "IBM PC/AT" architecture.
> +
> +- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UE=
FI GOP
> +  driver that is used to display UEFI graphics output.
> +
> +- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
> +
> +- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmwa=
re)
> +  contains various different microcodes (also known as an applications) =
that do
              various microcodes?
> +  a range of different functions. The FWSEC ucode is run in heavy-secure=
 mode and
> +  typically runs directly on the GSP (it could be running on a different=
 designated
> +  processor in future generations but as of Ampere, it is the GSP). This=
 firmware
> +  then loads other firmware ucodes onto the PMU and SEC2 microcontroller=
s for gfw
> +  initialization after GPU reset and before the driver loads (see devini=
t.rst).
> +  The DEVINIT ucode is itself another ucode that is stored in this ROM p=
artition.
> +
> +Once located, the Falcon ucodes have "Application Interfaces" in their d=
ata
> +memory (DMEM). For FWSEC, the application interface we use for FWSEC is =
the
> +"DMEM mapper" interface which is configured to run the "FRTS" command. T=
his
> +command carves out the WPR2 (Write-Protected Region) in VRAM. It then pl=
aces
> +important power-management data, called 'FRTS', into this region. The WP=
R2
> +region is only accessible to heavy-secure ucode.
> +
> +.. note::
> +   It is not clear why FwSec has 2 different partitions in the ROM, but =
they both
> +   are of type 0xE0 and can be identified as such. This could be subject=
 to change
> +   in future generations.
> +
> +VBIOS ROM Layout
> +----------------
> +The VBIOS layout is roughly a series of concatenated images as follows:
> +(For more explanations of acronyms, see the detailed descriptions in vbi=
os.rs).

Looks OK, but...

> +
> +.. note::
> +   This diagram is created based on an GA-102 Ampere GPU as an example a=
nd could
> +   vary for future or other GPUs.
> +
> +Here is a block diagram of the VBIOS layout::

Above sentence (but not the note directive) is redundant, though.

> +
> +    +-------------------------------------------------------------------=
---------+
> +    | VBIOS (Starting at ROM_OFFSET: 0x300000)                          =
         |
> +    +-------------------------------------------------------------------=
---------+
> +    | +-----------------------------------------------+                 =
         |
> +    | | PciAt Image (Type 0x00)                       |                 =
         |
> +    | +-----------------------------------------------+                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | ROM Header        |                         |                 =
         |
> +    | | | (Signature 0xAA55)|                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         | rom header's pci_data_struct_offset |                 =
         |
> +    | |         | points to the PCIR structure        |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | PCIR Structure    |                         |                 =
         |
> +    | | | (Signature "PCIR")|                         |                 =
         |
> +    | | | last_image: 0x80  |                         |                 =
         |
> +    | | | image_len: size   |                         |                 =
         |
> +    | | | in 512-byte units |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |                                     |                 =
         |
> +    | |         | NPDE immediately follows PCIR       |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | NPDE Structure    |                         |                 =
         |
> +    | | | (Signature "NPDE")|                         |                 =
         |
> +    | | | last_image: 0x00  |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |                                               |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | BIT Header        | (Signature scanning     |                 =
         |
> +    | | | (Signature "BIT") |  provides the location  |                 =
         |
> +    | | +-------------------+  of the BIT table)      |                 =
         |
> +    | |         | header is                           |                 =
         |
> +    | |         | followed by a table of tokens       |                 =
         |
> +    | |         V one of which is for falcon data.    |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | BIT Tokens        |                         |                 =
         |
> +    | | |  ______________   |                         |                 =
         |
> +    | | | | Falcon Data |   |                         |                 =
         |
> +    | | | | Token (0x70)|---+------------>------------+--+              =
         |
> +    | | | +-------------+   |  falcon_data_ptr()      |  |              =
         |
> +    | | +-------------------+                         |  V              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | EFI Image (Type 0x03)                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | Contains the UEFI GOP driver (Graphics Output)|  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | Image data        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | First FwSec Image (Type 0xE0)                 |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | Image data        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | Second FwSec Image (Type 0xE0)                |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | |                                               |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PMU Lookup Table  | <- falcon_data_offset <----+              =
         |
> +    | | | +-------------+   |    pmu_lookup_table     |                 =
         |
> +    | | | | Entry 0x85  |   |                         |                 =
         |
> +    | | | | FWSEC_PROD  |   |                         |                 =
         |
> +    | | | +-------------+   |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |                                     |                 =
         |
> +    | |         | points to                           |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                 =
         |
> +    | | | (FWSEC Firmware)  |    fwsec_header()       |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |   immediately followed  by...       |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +----------------------------+                |                 =
         |
> +    | | | Signatures + FWSEC Ucode   |                |                 =
         |
> +    | | | fwsec_sigs(), fwsec_ucode()|                |                 =
         |
> +    | | +----------------------------+                |                 =
         |
> +    | +-----------------------------------------------+                 =
         |
> +    |                                                                   =
         |
> +    +-------------------------------------------------------------------=
---------+
> +
> +Falcon data Lookup
> +------------------
> +A key part of the VBIOS extraction code (vbios.rs) is to find the locati=
on of the
> +Falcon data in the VBIOS which contains the PMU lookup table. This looku=
p table is
> +used to find the required Falcon ucode based on an application ID.
> +
> +The location of the PMU lookup table is found by scanning the BIT (`BIOS=
 Information Table`_)
> +tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which i=
ndicates the
> +offset of the same from the start of the VBIOS image. Unfortunately, the=
 offset
> +does not account for the EFI image located between the PciAt and FwSec i=
mages.
> +The `vbios.rs` code compensates for this with appropriate arithmetic.
> +
> +.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/B=
IOS-Information-Table/1/BIOS-Information-Table.html

The rest looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dcvzE3w8GZbsAc7N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXMrwAKCRD2uYlJVVFO
o/gJAP9jlcd/JgjSS+ZtfVD1Ol3IKve2PGOU8NWjOZb3riPbKAD/fKtPOiNkS/Xk
V8jmP5oeb2MVjpif7ckRWNLTom80Fw0=
=9m7c
-----END PGP SIGNATURE-----

--dcvzE3w8GZbsAc7N--
