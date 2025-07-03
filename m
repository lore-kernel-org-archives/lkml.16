Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E492DE706;
	Thu,  3 Jul 2025 00:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502165; cv=none; b=R5kXFlfyK1XF3oy5CjeP9jID7P+zS0H16a9MYZQzJqZ4NpPxOjqp44kYuQo0ozX2393i1cXXNVvEqX62eIYoTkl29DqW1xf4BhhVj/gWiBLBxkPUHFz847ZwcfW1xtBuxRo9Z+VkXqmpOWm3iVk8276fsoW2yjwvPwGzJhrjc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502165; c=relaxed/simple;
	bh=bFdE+y4hmzMunY9zCEqxwMb/MTNjcEYVsB8MI9oe51E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY8LGd4/xDTZAs6PRtoTZ9OEQ4eL1ahk3OC8HaLKHaA+AC/EqQ6+/uzvqU8ghjMhckPxyeoqhA7qQZSk3Rj7+wo/pMTAGMBR5I2NyKdkKD6Ab6fwgw736ZHo4B1xLkKTYeR58+5JZ53Stz0VshmyYqfyU0stl6GKZ3KuN6w9WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB25HmFH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB25HmFH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73972a54919so4843968b3a.3;
        Wed, 02 Jul 2025 17:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751502162; x=1752106962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJK1LPZmNSj7O82pl3GniJn8DVrIh6bpo36MpNcOU/E=;
        b=bB25HmFHAdRO1skrVEGBC17KpfXhxDmSMQ1mYZSjuPlv1MwFaBdKqsP4pJokA4bnnR
         V5W3EtaXU8A93613LcgjwyUmVIxXsYOJ1pHwP5vrNC3K/zaLh7DcYWB8FExoFCDOma8P
         ehonTKyuYZdQ1OmzInAAQi4xx+iPp7pxhHHdLXtL4hyqelagdtATU3v4Zd68taOukg55
         C/PGyL72O4jUhAi8Bpbp+sOVnUBGErcgrQqMCJPj+lCYy/cCGnRDpMKI2KMUw+cRIOKM
         AdLQw8prTPHnO3CGClBe+sCWlx5m2dbjFlXstXTJpj9JMpXJFrw7w31vSbxADegvtyEx
         Mzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751502162; x=1752106962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJK1LPZmNSj7O82pl3GniJn8DVrIh6bpo36MpNcOU/E=;
        b=UN7ZQ/rwuK7VauOgTXR4Dtp1rGWKdSODp+wju0IcVT5CAlz0FKvwugiX7l6h7oH1QC
         ASOMpJcyM0LQArmzT5c0CTYHG4cpgrmHkwslhfNwZdLcA76ABDLnE2xSLkFgRjWMEcjh
         orVmIDDWRFckxDiQoevNjjrxLQ5FpRrKKx7clnB5fWl6GKPKim3r96/9m8NlBzOpvPX9
         5eqdrY4FhHUzFeQ9aE1vYl/QfR5N8PWzLTJIQUdkJX5AUuh91C856qggJejGcQ6lpAgj
         0DvlP43q3GikswkIYv+zofyFXrVt788EgWHA/iw29Atj0tNNogLCZ3zh5DqyBRhpgzLB
         xc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW11y0ETVUufmW8LoOXBQa/uACt4Cil4fZZaL7sFMklXddLjWrIWAjvdtsPXkgL40VbRFitMm05xnE=@vger.kernel.org, AJvYcCWObw17qymIO6sSu30Zcu3Ny9dUJtJpZ/G2a4W9zwePVj53D2kBwyeqHohwhcd8BEbpzyU/aBINOg7cO0IJdrg=@vger.kernel.org, AJvYcCWcop1l3VfPtZW+nmBHS+wWXk59w5dCjVPWjm+CBYX5fxdcWRLJZbrrTrWuBAmZtXxMJJHp4jODLxOMFQSt@vger.kernel.org
X-Gm-Message-State: AOJu0YyoiWGEwtajzK+pjBuLIU1J6ICXnX3baLwBUpN1mpRmqipe70s7
	B1xEGQuQXUCRzQoRlvCsc/yL1NfT0algoAmdOxmb+kGNmoacXSvZ4M5Y
X-Gm-Gg: ASbGncvOHdSCATqTai9jRy5af120tb52fChZx5LQtKsjqcp++w58uoX+kOVirh72mNg
	Z1PXPjj8l+LdowA36O5VNPB4LX2XguViKsvRSuZO5EZYAccZJu/JfJjMm5524p/LAVSX+1EkK3I
	avwLHEYbhwbF4FtlAQ65DTa7E7lfTLIhp+NfocCX3RJiEoLiWF1RTMzFkml0PQkuWSSKzJRp/n2
	AVfRGwxedray+AeEG1YYGS/5kQjQN9mS3ahdboruJyG9PduV9AC4XSQ84Hq8bDhiHnu2J5rGwuJ
	oQLs+IgI9hqxbav1vUwUrFCL2b6d5MlmuVbbGAK0K+u2brwVqMIQB20bRc+8PA==
X-Google-Smtp-Source: AGHT+IG11pZFCQC1d8dXNiTO0PVlbDjh04PIJgu8i7Ochf4Cz2KpROCLMxUu4ZKBPbCLWTWpScLMew==
X-Received: by 2002:a05:6a00:194e:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-74b50f29f08mr6358988b3a.14.1751502161863;
        Wed, 02 Jul 2025 17:22:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ee836sm15934075b3a.152.2025.07.02.17.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:22:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A043E4206887; Thu, 03 Jul 2025 07:22:38 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:22:38 +0700
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
Subject: Re: [PATCH v3 5/7] Documentation: gpu: nova-core: Document devinit
 process
Message-ID: <aGXNTjw-VPTNYrH2@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-5-f362260813e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xHavB6NUYjLSItap"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-5-f362260813e2@nvidia.com>


--xHavB6NUYjLSItap
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:42PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/=
nova/core/devinit.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..70c819a96a00a0a27846e7e96=
525470d07721a10
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/devinit.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device Initialization (devinit)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The devinit process is complex and subject to change. This document prov=
ides a high-level
> +overview using the Ampere GPU family as an example. The goal is to provi=
de a conceptual
> +overview of the process to aid in understanding the corresponding kernel=
 code.
> +
> +Device initialization (devinit) is a crucial sequence of register read/w=
rite operations
> +that occur after a GPU reset. The devinit sequence is essential for prop=
erly configuring
> +the GPU hardware before it can be used.
> +
> +The devinit engine is an interpreter program that typically runs on the =
PMU (Power Management
> +Unit) microcontroller of the GPU. This interpreter executes a "script" o=
f initialization
> +commands. The devinit engine itself is part of the VBIOS ROM in the same=
 ROM image as the
> +FWSEC (Firmware Security) image (see fwsec.rst and vbios.rst) and it run=
s before the
> +nova-core driver is even loaded. On an Ampere GPU, the devinit ucode is =
separate from the
> +FWSEC ucode. It is launched by FWSEC, which runs on the GSP in 'heavy-se=
cure' mode, while
> +devinit runs on the PMU in 'light-secure' mode.
> +
> +Key Functions of devinit
> +------------------------
> +devinit performs several critical tasks:
> +
> +1. Programming VRAM memory controller timings
> +2. Power sequencing
> +3. Clock and PLL (Phase-Locked Loop) configuration
> +4. Thermal management
> +
> +Low-level Firmware Initialization Flow
> +--------------------------------------
> +Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP,=
 etc.) run GPU
> +firmware (gfw) code to set up the GPU and its core parameters. Most of t=
he GPU is
> +considered unusable until this initialization process completes.
> +
> +These low-level GPU firmware components are typically:
> +
> +1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and=
 fwsec.rst).
> +2. Executed in sequence on different microcontrollers:
> +
> +  - The devinit engine typically but not necessarily runs on the PMU.
> +  - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Pr=
ocessor) in
> +    heavy-secure mode.
> +
> +Before the driver can proceed with further initialization, it must wait =
for a signal
> +indicating that core initialization is complete (known as GFW_BOOT). Thi=
s signal is
> +asserted by the FWSEC running on the GSP in heavy-secure mode.
> +
> +Runtime Considerations
> +----------------------
> +It's important to note that the devinit sequence also needs to run durin=
g suspend/resume
> +operations at runtime, not just during initial boot, as it is critical t=
o power management.
> +
> +Security and Access Control
> +---------------------------
> +The initialization process involves careful privilege management. For ex=
ample, before
> +accessing certain completion status registers, the driver must check pri=
vilege level
> +masks. Some registers are only accessible after secure firmware (FWSEC) =
lowers the
> +privilege level to allow CPU (LS/low-secure) access. This is the case, f=
or example,
> +when receiving the GFW_BOOT signal.

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xHavB6NUYjLSItap
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXNTgAKCRD2uYlJVVFO
oyaYAP9dYPzPZJL4k8IbXaAQtRvwo3hRmPlPJlB7ltR0JkTvWQEA7+RK8r3cbs8g
jtqTlDMdRiku8fBY+ztaUKmS/DfOvg8=
=+EEX
-----END PGP SIGNATURE-----

--xHavB6NUYjLSItap--
