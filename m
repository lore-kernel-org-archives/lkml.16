Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624E3187FE4;
	Mon,  5 May 2025 04:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746418446; cv=none; b=JS+M2ZdfylR7oWWq/OSQPIEdHnKqN4SBNalAzSRRaA4xhjUBYoOvFmc5o7sbFtsehaIcL057GkFZc0ewfn4kYtkVWhI8MGlQSdA+31L02xQ6+g/wZJcRXfAbNH3WOU0z5ax5ck3nmbF/SbqxM93WOY0eBbwqMwRUpFU4vNDWAyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746418446; c=relaxed/simple;
	bh=OCbBZgWJEgkuKmW5A2BCohBDpLhfnmUO/AdducyQejM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDP4lbZMlWb1zohdNsoDajHu1gUmv164oRj2rU29FtsGAAY9O0mPWogW3fv6hW8BYsNm62lVLocIAOaymH7+Py0ovp9O0H7xREeNgcFerv6otAy2AEUuunqw3ZD6QDeXECd1JarjEUgtcpFKRkh+v0lvz9lfTNxwt58Cmieq678=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLwqGN0R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLwqGN0R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so47083335ad.1;
        Sun, 04 May 2025 21:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418444; x=1747023244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1LpDnhLJgDU1QRp3lqDCTiCNSE9ok/7E/ZGoIZajrI=;
        b=kLwqGN0R1cGt3S/fXDrvF7vZmF7HAFOmF7oRJIas32kqjZM8GsAY6fPH/YgXJ6ycWD
         wl6ZuNtijLCcvDR3yPfgNTzP6TASIYAjrGN31/TcQ0s9JWqSWpO62xfH4yfPkSXpgipB
         8VkYI8aPA0wLJMAJl2El0HwHueuRXeWjqf6A6ASDeFoXwl6tMtd+T/EBJj9UW3sFB+Os
         h8VBF5PolVyU5yNeC8Lu2ZhcU9EI1LWpc+5bq8DF76VfN8UHTNQGtKO+FLQL1ZkfbiN0
         kd0YV5tbs7WWU/nurp+OqZL5ew8tWMjThwIclCF/tVIZn++N4tzhdFKvY+sSFzgj6rOP
         c/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418444; x=1747023244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1LpDnhLJgDU1QRp3lqDCTiCNSE9ok/7E/ZGoIZajrI=;
        b=wH2lxgAQlrVqPdLAwsvQtWMkPZJrViNlSM2I9F+NRdNXLAmutYFyV5K0z6LEZ6Fecb
         U/IroJ/cu4BjPJN6ArusQ+BvPVSllcPwoPaxkDhqLX8nJHCVH3GRjbWP+FfONI3u7WFk
         5NtE/WsTTbg5egCW193zsNz/5FOMO3vEJpxRIx1i8LxINNfoITim0bbjeabcadaShDAW
         Ff7ogtmlFPi9EjBuzATOjtGiIOYoaukvOxsUDYOiJZ1nOq8cuccBtVyeAqCIgwp9YClM
         bM83H+a1fEgZIOhsK8pMZdnHDHo/uEfUh2W7CVTdn8Ddc1TyJLLzK8qFii55OnmsFLKO
         w5cg==
X-Forwarded-Encrypted: i=1; AJvYcCVi3+U8Wei+wil6nQ6eunWkYc4/p1s+uGvwpSfCdmuS39INk287uQU/mgJjiDILQ0uAb8OqPeoW8IpshkW+3uw=@vger.kernel.org, AJvYcCVrRpLdH0TZTG9iryI5/0d2C/Z9wo2XvX19FpYm3ShN5iIEmdsw1LMUpE9sICaZcftbLpu1ZWcoi8Yhw0Vx@vger.kernel.org, AJvYcCVsPx/Ey7WtyEFnIzVx+aIHtmiKIxqcR2H8Fl83jLQqM4mJemZmLpxwVfS6pD1iFWFfkkdwiZDFU/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB52JGorIpnGovdaxhE2fyMiOjh552P62RXkEGq7AJqKN/WcNt
	c+kGbJ2YKdMCLmaZPFz5oOd55HIdtZ0wJCRb6fF5fRObCumgEBBr
X-Gm-Gg: ASbGncvjNpQ/6KZZmxLYmb+nHqtJ1r0DVtt1aM2tZhrkZfx3ae7NT6Fr0jUozILa9G2
	DXeKLMlyYoT7LmK4ioeMfbU7TDefHjQR1OmSu+LB1L8U4mQzGo+8ooA0EdH1inezI9iKIez3uao
	OKQAJPZ6E5ZAoHkgdsQgnJ9BLBGYZz6O7/h70QjhuQOZrV7oEZ0URCNFo9c+CEwHvy2NY+NiKjI
	kqJkxy5tFNC4oBUUdNW4totGEa2g12dCom1mq4ONKcM5weXCEoH48emkz1YwzyWxAmP78qFNdmX
	dHxRdOiPIARXOkoUgTval/+ewvTvt4kwQhzHGycP
X-Google-Smtp-Source: AGHT+IEK1O4aQEQhNSHHYVvpvpv0xPif9mmHoJQDOFHdu6HbE68r9NGJpzuixg3pzhEgwObGHD0OLg==
X-Received: by 2002:a17:903:32c9:b0:211:e812:3948 with SMTP id d9443c01a7336-22e1e6f03bfmr81066455ad.0.1746418444460;
        Sun, 04 May 2025 21:14:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ea17csm45304685ad.95.2025.05.04.21.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:14:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B2070423CC6A; Mon, 05 May 2025 11:14:01 +0700 (WIB)
Date: Mon, 5 May 2025 11:14:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Shirish Baskaran <sbaskaran@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] docs: nova-core: Document basics of the Falcon
Message-ID: <aBg7CUoAo1xyYlo8@archie.me>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-7-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qL8Yt/S+SdYspBq8"
Content-Disposition: inline
In-Reply-To: <20250503040802.1411285-7-joelagnelf@nvidia.com>


--qL8Yt/S+SdYspBq8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 12:07:58AM -0400, Joel Fernandes wrote:
> +Conceptual diagram (not exact) of the Falcon and its memory subsystem is=
 as follows:
> +
> +           External Memory (Framebuffer / System DRAM)
> +                            =E2=96=B2  =E2=94=82
> +                            =E2=94=82  =E2=94=82
> +                            =E2=94=82  =E2=96=BC
> +=E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=B3=E2=94=81=E2=94=81=E2=94=BB=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83                           =E2=94=82                         =
=E2=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93       =E2=94=82                         =E2=94=83
> +=E2=94=83   =E2=94=83     FBIF      =E2=94=A3=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B                         =E2=
=94=83  FALCON
> +=E2=94=83   =E2=94=83 (FrameBuffer  =E2=94=83   Memory Interface        =
      =E2=94=83  PROCESSOR
> +=E2=94=83   =E2=94=83  InterFace)   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  Apertures    =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  Configures   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  mem access   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B                                 =E2=94=83
> +=E2=94=83           =E2=94=82                                         =
=E2=94=83
> +=E2=94=83           =E2=94=82 FBDMA uses configured FBIF apertures    =
=E2=94=83
> +=E2=94=83           =E2=94=82 to access External Memory
> +=E2=94=83           =E2=94=82
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=BC=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93      =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83   =E2=94=83    FBDMA      =E2=94=83  cfg =E2=94=83     RISC   =
    =E2=94=83
> +=E2=94=83   =E2=94=83 (FrameBuffer  =E2=94=A3<=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80>=E2=94=AB     CORE       =E2=94=A3=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80>. Direct Core Access
> +=E2=94=83   =E2=94=83  DMA Engine)  =E2=94=83      =E2=94=83            =
    =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=83 - Master dev. =E2=94=83      =E2=94=83 (can run bo=
th  =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B      =E2=94=83 Falcon and     =E2=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        cfg-->=E2=94=83 RISC-V code)   =E2=
=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        /     =E2=94=83                =E2=
=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        |     =E2=94=97=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B      =E2=94=83=
    =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83           =E2=94=82        =E2=94=82                          =
   =E2=94=83    =E2=94=83   BROM     =E2=94=83
> +=E2=94=83           =E2=94=82        =E2=94=82                          =
   <=E2=94=80=E2=94=80=E2=94=80>=E2=94=AB (Boot ROM) =E2=94=83
> +=E2=94=83           =E2=94=82       /                              =E2=
=94=83    =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
> +=E2=94=83           =E2=94=82      =E2=96=BC                            =
   =E2=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93                              =E2=94=83
> +=E2=94=83   =E2=94=83    IO-PMP     =E2=94=83 Controls access by FBDMA  =
   =E2=94=83
> +=E2=94=83   =E2=94=83 (IO Physical  =E2=94=83 and other IO Masters      =
   =E2=94=83
> +=E2=94=83   =E2=94=83 Memory Protect)                              =E2=
=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B                              =E2=94=83
> +=E2=94=83           =E2=94=82                                      =E2=
=94=83
> +=E2=94=83           =E2=94=82 Protected Access Path for FBDMA      =E2=
=94=83
> +=E2=94=83           =E2=96=BC                                      =E2=
=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=93      =E2=94=83
> +=E2=94=83   =E2=94=83       Memory                          =E2=94=83   =
   =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=93  =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93  =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=83    IMEM       =E2=94=83  =E2=94=83    =
DMEM     =E2=94=83  =E2=94=83<=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=9B
> +=E2=94=83   =E2=94=83   =E2=94=83 (Instruction  =E2=94=83  =E2=94=83   (=
Data     =E2=94=83  =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=83  Memory)      =E2=94=83  =E2=94=83   M=
emory)   =E2=94=83  =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=9B  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B  =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=9B
> +=E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81

Wrap the diagram in literal code block. Also, note that it can look messy in
htmldocs output with certain fonts due to box drawing characters. Consider =
using
ASCII constructs (dashes and vertical bars) instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--qL8Yt/S+SdYspBq8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBg7CQAKCRD2uYlJVVFO
o2ooAP9EDkF20n/zrhDf903MO937RaMeOnqKk5pD0BdlUxaF/gD7Bacq7T46phOm
zX7FsWCdSWe2piN5J8ZWoFIws4kd3wQ=
=4DmV
-----END PGP SIGNATURE-----

--qL8Yt/S+SdYspBq8--
