Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129983FE7;
	Thu,  3 Jul 2025 00:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502595; cv=none; b=nC1X/PPsJhHKkgwJweQiQYo0ZJmyj9+Dar5c/YI4myI0bZP9xVPoYpR8Y1VbsSfNYP9nIvZaHBDyh9Wb5wpNYwMMpXrDuswFN1yI2tmhum9n0Kh4FWNv32Vohju3QX/rDcIxsY8pvHRd9X8cZo6vfSDaDWmHDTBWjo5qHLGLkVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502595; c=relaxed/simple;
	bh=qLj0TXy/C4ChLhv47uxrJQ2AY0s8Wl48wFKwr5idJOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7ius0C2Y5c4kgXhUeWEXgdHQEh9aSgcQxk2fYw/n8M4uLgEkueKUPrwbnQVKM642bUDDe5iVopqJLyn96dbADMn8pI87cXHU672QS55GahgLKV5eZ/p2eW6IkXWfSBfx34vtfnGI+f6Dy1L6uPpJwW2p+4EnLYAp2DwoHVS4e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbNTUWNj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbNTUWNj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3508961d43so3220825a12.3;
        Wed, 02 Jul 2025 17:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751502593; x=1752107393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3btm0C+OgxQ5QEm2FQI37az+ANU6clMCCL/nrwET2o=;
        b=VbNTUWNjDBb4VyWxi+TJgcKecmk9gVDXzlwZ3qAoqlEXLpm+nlhpLmGf2ThGUMTEud
         94kyCV4YsDU5XPBiLAN4VybVjnGoRqSEHDe3+ii7MDCLeV7+kNA8XihuTp4dQtJ24Gdw
         kCMsOYkby2fmyVu1ukxLBaV0pfLWPvw/pW8tA8d4nYYwkDEZDOFJcItV2hvSkMJ/uqUp
         xP1NgE5rqVDGOJnMrZ1NL5JH5KhtQoNd9M/5eS5mmvVE6OFfcjKVZQlQyr96KD23hUIf
         tmXJNsfGALedh+sUPhgzjtwNT3hYGCY7LDUwmSgbIAHsUGzNx8mjYtT/IfLmOc0xHjyw
         fr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751502593; x=1752107393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3btm0C+OgxQ5QEm2FQI37az+ANU6clMCCL/nrwET2o=;
        b=M/jHyls25wKn/Hig6XGgXMQNPhSG0n4qSlGPqQXcMX83KEps7qHjX7UuYL+7InS95b
         QJrXIBTHTKvNYffyt4CPHt0tyho0w/Sk9+N83Ym5wRHzxKqGGhwlbayYbFkBzD/13CVw
         JAFq/jo1zYqkd0k67eBvlhQ0vSRaL6k0ELf7sZrzoBhSNvFsYkEsqRIP6fG60Qvc6MQW
         IbHEq0+pV1VwZzzMyiK3Oz2fAk9lby6b294YgU4jcRzgd/fQLzXI2yXMcYj7i1vXprrn
         Suk2tgLRS8FbrIzBSZ+yHS07tAPzQiGafqScU8BShFkzeDiiJdj0wWp2klnL0RIF8IxL
         ugRg==
X-Forwarded-Encrypted: i=1; AJvYcCVX8TvX8n9DlGtN4FHkNh9XWOP4XI/sRDRKmfidLjvVl2z9oHot7/cGR4r9z4uHdyA3LY6Zo5plR/KUVkCg+Co=@vger.kernel.org, AJvYcCVy8ieT8A62wW/B0yO/6B+5O67plUADM/iL5686gJoohD5UwEJLiPk5CQcQRhdzpMcEm3WrlZGJ1rqNw2pP@vger.kernel.org, AJvYcCW6zbKL89H2lIwtw32c7nmy0BICcLlj4mOACdn2ZWACXiPsw/HqYJRP56qLCUpcccQad+Aw5Na/exc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+fd62K/eALnajU0kk3z27LH1uW5YuB3R/quJoiNKvyhAghmr
	8lMX51x8AfKlQ4m7mViYDpIZjDYMtnGLgnBjt59cDh/sF9QQNnh3xkHh
X-Gm-Gg: ASbGnctFwbkAkG6BdI2Ieo+2Lsn+84MdpZ5Mx9amHx+9IPa7XzwpnsI/XSHBl01MZfV
	a+hWNaHFr9T0m4oBPdxvEY2yR7NlBZchLBSF+gZWTo7MJRoV0TQhv1+na0zjH7CmEADD5dmtvho
	BL3InJgqI5JsTkpihtMYAqVP2hKR3XAyH8pcUly1ivLbWAbDToyneLXOL5xIIuTLLXGYVH/2igT
	2UBdPGEYWyXcGYLs3nHGyYEYITNezj4wV2CS6lSBFvEZDfg64qdIwJU3v+FLeAN6PgW94J+Zm+R
	LsNNGpDD1HTR7qVlNpqdOwwbrFy+VrsCdoIki4MlxNDhn37IuyuN3FIHEIYFDd3dIvDbHTOo
X-Google-Smtp-Source: AGHT+IGaXUIDqbVoHXfydy5dOy7oCHo+S3QFh3Rub7jZRkYV5azpHyz/qCWKYAcEQmn75CBb9Ofogg==
X-Received: by 2002:a17:902:e886:b0:236:7050:74af with SMTP id d9443c01a7336-23c796a16bfmr20576375ad.9.1751502592903;
        Wed, 02 Jul 2025 17:29:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c956asm136349465ad.237.2025.07.02.17.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:29:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D9B3C4206887; Thu, 03 Jul 2025 07:29:48 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:29:48 +0700
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
Subject: Re: [PATCH v3 7/7] Documentation: gpu: nova-core: Document basics of
 the Falcon
Message-ID: <aGXO_IHrEVOR2MwQ@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-7-f362260813e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="020yO6lyeKvFuC8W"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-7-f362260813e2@nvidia.com>


--020yO6lyeKvFuC8W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:44PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/falcon.rst b/Documentation/gpu/n=
ova/core/falcon.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..33137082eb6c14cecda2fbe6f=
db79e63ee9ca2e6
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/falcon.rst
> @@ -0,0 +1,158 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Falcon (FAst Logic Controller)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +The following sections describe the Falcon core and the ucode running on=
 it.
> +The descriptions are based on the Ampere GPU or earlier designs; however=
, they
> +should mostly apply to future designs as well, but everything is subject=
 to
> +change. The overview provided here is mainly tailored towards understand=
ing the
> +interactions of nova-core driver with the Falcon.
> +
> +NVIDIA GPUs embed small RISC-like microcontrollers called Falcon cores, =
which
> +handle secure firmware tasks, initialization, and power management. Mode=
rn
> +NVIDIA GPUs may have multiple such Falcon instances (e.g., GSP (the GPU =
system
> +processor) and SEC2 (the security engine)) and also may integrate a RISC=
-V core.
> +This core is capable of running both RISC-V and Falcon code.
> +
> +The code running on the Falcon cores is also called 'ucode', and will be
> +referred to as such in the following sections.
> +
> +Falcons have separate instruction and data memories (IMEM/DMEM) and prov=
ide a
> +small DMA engine (via the FBIF - "Frame Buffer Interface") to load code =
=66rom
> +system memory. The nova-core driver must reset and configure the Falcon,=
 load
> +its firmware via DMA, and start its CPU.
> +
> +Falcon security levels
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Falcons can run in Non-secure (NS), Light Secure (LS), or Heavy Secure (=
HS)
> +modes.
> +
> +Heavy Secured (HS) also known as Privilege Level 3 (PL3)
> +--------------------------------------------------------
> +HS ucode is the most trusted code and has access to pretty much everythi=
ng on
> +the chip. The HS binary includes a signature in it which is verified at =
boot.
> +This signature verification is done by the hardware itself, thus establi=
shing a
> +root of trust. For example, the FWSEC-FRTS command (see fwsec.rst) runs =
on the
> +GSP in HS mode. FRTS, which involves setting up and loading content into=
 the WPR
> +(Write Protect Region), has to be done by the HS ucode and cannot be don=
e by the
> +host CPU or LS ucode.
> +
> +Light Secured (LS or PL2) and Non Secured (NS or PL0)
> +-----------------------------------------------------
> +These modes are less secure than HS. Like HS, the LS or NS ucode binary =
also
> +typically includes a signature in it. To load firmware in LS or NS mode =
onto a
> +Falcon, another Falcon needs to be running in HS mode, which also establ=
ishes the
> +root of trust. For example, in the case of an Ampere GPU, the CPU runs t=
he "Booter"
> +ucode in HS mode on the SEC2 Falcon, which then authenticates and runs t=
he
> +run-time GSP binary (GSP-RM) in LS mode on the GSP Falcon. Similarly, as=
 an
> +example, after reset on an Ampere, FWSEC runs on the GSP which then load=
s the
> +devinit engine onto the PMU in LS mode.
> +
> +Root of trust establishment
> +---------------------------
> +To establish a root of trust, the code running on a Falcon must be immut=
able and
> +hardwired into a read-only memory (ROM). This follows industry norms for
> +verification of firmware. This code is called the Boot ROM (BROM). The n=
ova-core
> +driver on the CPU communicates with Falcon's Boot ROM through various Fa=
lcon
> +registers prefixed with "BROM" (see regs.rs).
> +
> +After nova-core driver reads the necessary ucode from VBIOS, it programs=
 the
> +BROM and DMA registers to trigger the Falcon to load the HS ucode from t=
he system
> +memory into the Falcon's IMEM/DMEM. Once the HS ucode is loaded, it is v=
erified
> +by the Falcon's Boot ROM.
> +
> +Once the verified HS code is running on a Falcon, it can verify and load=
 other
> +LS/NS ucode binaries onto other Falcons and start them. The process of s=
ignature
> +verification is the same as HS; just in this case, the hardware (BROM) d=
oesn't
> +compute the signature, but the HS ucode does.
> +
> +The root of trust is therefore established as follows:
> +     Hardware (Boot ROM running on the Falcon) -> HS ucode -> LS/NS ucod=
e.
> +
> +On an Ampere GPU, for example, the boot verification flow is:
> +     Hardware (Boot ROM running on the SEC2) ->
> +          HS ucode (Booter running on the SEC2) ->
> +               LS ucode (GSP-RM running on the GSP)
> +
> +.. note::
> +     While the CPU can load HS ucode onto a Falcon microcontroller and h=
ave it
> +     verified by the hardware and run, the CPU itself typically does not=
 load
> +     LS or NS ucode and run it. Loading of LS or NS ucode is done mainly=
 by the
> +     HS ucode. For example, on an Ampere GPU, after the Booter ucode run=
s on the
> +     SEC2 in HS mode and loads the GSP-RM binary onto the GSP, it needs =
to run
> +     the "SEC2-RTOS" ucode at runtime. This presents a problem: there is=
 no
> +     component to load the SEC2-RTOS ucode onto the SEC2. The CPU cannot=
 load
> +     LS code, and GSP-RM must run in LS mode. To overcome this, the GSP =
is
> +     temporarily made to run HS ucode (which is itself loaded by the CPU=
 via
> +     the nova-core driver using a "GSP-provided sequencer") which then l=
oads
> +     the SEC2-RTOS ucode onto the SEC2 in LS mode. The GSP then resumes
> +     running its own GSP-RM LS ucode.
> +
> +Falcon memory subsystem and DMA engine
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Falcons have separate instruction and data memories (IMEM/DMEM)
> +and contains a small DMA engine called FBDMA (Framebuffer DMA) which does
> +DMA transfers to/from the IMEM/DMEM memory inside the Falcon via the FBIF
> +(Framebuffer Interface), to external memory.
> +
> +DMA transfers are possible from the Falcon's memory to both the system m=
emory
> +and the framebuffer memory (VRAM).
> +
> +To perform a DMA via the FBDMA, the FBIF is configured to decide how the=
 memory
> +is accessed (also known as aperture type). In the nova-core driver, this=
 is
> +determined by the `FalconFbifTarget` enum.
> +
> +The IO-PMP block (Input/Output Physical Memory Protection) unit in the F=
alcon
> +controls access by the FBDMA to the external memory.
> +
> +Conceptual diagram (not exact) of the Falcon and its memory subsystem is=
 as follows::
> +
> +               External Memory (Framebuffer / System DRAM)
> +                              ^  |
> +                              |  |
> +                              |  v
> +     +-----------------------------------------------------+
> +     |                           |                         |
> +     |   +---------------+       |                         |
> +     |   |     FBIF      |-------+                         |  FALCON
> +     |   | (FrameBuffer  |   Memory Interface              |  PROCESSOR
> +     |   |  InterFace)   |                                 |
> +     |   |  Apertures    |                                 |
> +     |   |  Configures   |                                 |
> +     |   |  mem access   |                                 |
> +     |   +-------^-------+                                 |
> +     |           |                                         |
> +     |           | FBDMA uses configured FBIF apertures    |
> +     |           | to access External Memory
> +     |           |
> +     |   +-------v--------+      +---------------+
> +     |   |    FBDMA       |  cfg |     RISC      |
> +     |   | (FrameBuffer   |<---->|     CORE      |----->. Direct Core Ac=
cess
> +     |   |  DMA Engine)   |      |               |      |
> +     |   | - Master dev.  |      | (can run both |      |
> +     |   +-------^--------+      | Falcon and    |      |
> +     |           |        cfg--->| RISC-V code)  |      |
> +     |           |        /      |               |      |
> +     |           |        |      +---------------+      |    +----------=
--+
> +     |           |        |                             |    |   BROM   =
  |
> +     |           |        |                             <--->| (Boot ROM=
) |
> +     |           |       /                              |    +----------=
--+
> +     |           |      v                               |
> +     |   +---------------+                              |
> +     |   |    IO-PMP     | Controls access by FBDMA     |
> +     |   | (IO Physical  | and other IO Masters         |
> +     |   | Memory Protect)                              |
> +     |   +-------^-------+                              |
> +     |           |                                      |
> +     |           | Protected Access Path for FBDMA      |
> +     |           v                                      |
> +     |   +---------------------------------------+      |
> +     |   |       Memory                          |      |
> +     |   |   +---------------+  +------------+   |      |
> +     |   |   |    IMEM       |  |    DMEM    |   |<-----+
> +     |   |   | (Instruction  |  |   (Data    |   |
> +     |   |   |  Memory)      |  |   Memory)  |   |
> +     |   |   +---------------+  +------------+   |
> +     |   +---------------------------------------+
> +     +-----------------------------------------------------+

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--020yO6lyeKvFuC8W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXO/AAKCRD2uYlJVVFO
o30tAPj2OirzElzOU7jnaff+3cI7ewT77HSFpgReywWOS/AsAQCeoTuIZdUMVWb2
LkqPz8Waim5p1YxyJF/CNBA6cc70Cw==
=cIhU
-----END PGP SIGNATURE-----

--020yO6lyeKvFuC8W--
