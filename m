Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A822A7F9;
	Thu, 12 Jun 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721671; cv=none; b=ioUK+B1Ufb1mzX03aY2h3tmBL4WyXX4xKdcWGzye5r9gTOD7VyUrHYdMbxK0S3ngeEWu0M/HvYvCGqW3+eQaNcqnN0BjbZepG/ikaHOVBWS5+1WyJsQabsWjDHGfGa21FLNGuVauwkSHI3H+4XpXpDsUrzxhCzgK06I4U6itkkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721671; c=relaxed/simple;
	bh=rTU6bf46PA0oHIQhlmEaMDf7Kt1hiZXnnDSh281Ox98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBCgqInkicxlheFvG2+bRE1iowLiU0pnAMJvYVvm++Vr5xuir3per3GJ7fDoX2IrrjX5Ms3AUmX7xEUljYRzGIwI7RumVwDPNrag5WOKh3yPbc3x4DaNUAaoChQQmYFW1nPraKPGiHM7btRwQgTD9qFsv1kIYCsIk4CT9pCl28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl93twJA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl93twJA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2363616a1a6so6446855ad.3;
        Thu, 12 Jun 2025 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749721669; x=1750326469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=Fl93twJATuapYTzfMV0Yt5OMVAXe/3VC2HCiCEschrILUinY+GrcQS541Fyo0iaUdk
         DHrKmvkDDZLyOSHODZYHIVDj+0CKmXq0U1aR0EOkWzxUM8klMn5bfERBwLbB4631AdA/
         xjSvO+WbE+ZBe3SUi6uGOiKtD3E/nHah871XTRhlAZEAviNVZr6oGvHho17Gs/y35EBS
         Xy6BzY9zNh8vMquU0zWLyOFS9NHjkTnxbb2JEfJN038mCMMWk/AIA0+Glfc/mdrdIorr
         r9slYS4hN6IwBCircTlgynXA6qx0Bofv4iAudNg4ZnNKMsSfxBXajBcM9D+cOsIUIbMf
         XUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721669; x=1750326469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=G/h4xES5Zh4ESZGs+I5zcZCKwyns0xj8gCo+NEQY48XjpL7k04Dc6ekIGGLtU/n0z/
         vyOOkYvcciBF+y+hgvu/MeWzDDGAS7POqn4rn8e+ZBRfBYFktuxlnX0kW9jD1Z4RtTgr
         SaFvUnFfG5kSg8d3jwX0jVH5w6stMEEpo3qlQYZpj5nwiZu8pDlDpBxCuadzHJ6LUYpP
         AOsl/D1Q5HuHcwlXTxz/9DRAsiPobkXXNiLWTniPOzV5n1hnm7FeP/dnSLa/6nNND0kR
         J3lTuZ5fmlwcu3Oo2/GAApWsYbqU9u5OWs7YOePzTeNF/tqYu083sxjaGC+Wd88ZxddH
         A3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWnTTjU27gBOHutTlFiVyysLLBSPoqdnbukeqQZ8mhftWNqR2kSn7xnEBqFC9W6ecNwklbxl9h6Kssy+Tu6@vger.kernel.org, AJvYcCXyIvJAy/3Fx6InbsGDdIW5YvbC2D9mbVFdTb7+ijqajBZKWHrHu53hgz5ItHot1IJ4/ak7rvOOKYwv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyju5XfJWg3bDILCPc1HT+MPK1Qm40cBwC9Thq9NfqsksnxlAui
	biEBLJW9whjpDiHI85K4/uH4ZpfoDCOAmA2VPjQXBL2m7M6oP0F0sIsY
X-Gm-Gg: ASbGnctCKUlJ5/HP9g5HhB+Sd5DpPn5tM/OWKIBo8FyUkTqf5mMhEatq5qh1pK14j0k
	rJf3FSMs7n1I+ottyvOYNpTTn3sEygFvawbYLMljtoW61W/8F65b50Le5tROBZJwrk7l50N2zzL
	CuXl/GjZsT9LY902HZfjKVQhM63o33sL1matUX4UJ7V5vJrbe1FIMa5DgT+cnqtHn34Svg51Crf
	0tV/EPpQzVH8ET3Z2H1O8rC7wNby0pISLvs4WyeKQUECXdNgSM+9qr0qL5LiIVcVgT/CmD5UaVO
	KOGeqrXf75dncECrBJBGePHQ2ogkcEa4GZhfjpUagdenfjemgL59dL2hOLJEyQ==
X-Google-Smtp-Source: AGHT+IHhLvngJtDRD+nYjK9Btm6MhDv0YP4D2zr7z7HuxF1XD76CH+/kMW6iFysL+jWx2aXWWVzh5w==
X-Received: by 2002:a17:902:f612:b0:235:f55d:99cc with SMTP id d9443c01a7336-2364d62da39mr36075835ad.2.1749721668549;
        Thu, 12 Jun 2025 02:47:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd613d81dsm966545a12.25.2025.06.12.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:47:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B44D44241817; Thu, 12 Jun 2025 16:47:44 +0700 (WIB)
Date: Thu, 12 Jun 2025 16:47:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <aEqiQEMpbekiG6Hn@archie.me>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oH2YG5RUiU+HONaV"
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>


--oH2YG5RUiU+HONaV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:31:32AM +0530, Pankaj Gupta wrote:
> +Each 'se-if' comprise of twp layers:
> +- (C_DEV Layer) User-Space software-access interface.
> +- (Service Layer) OS-level software-access interface.
> +
> +   +--------------------------------------------+
> +   |            Character Device(C_DEV)         |
> +   |                                            |
> +   |   +---------+ +---------+     +---------+  |
> +   |   | misc #1 | | misc #2 | ... | misc #n |  |
> +   |   |  dev    | |  dev    |     | dev     |  |
> +   |   +---------+ +---------+     +---------+  |
> +   |        +-------------------------+         |
> +   |        | Misc. Dev Synchr. Logic |         |
> +   |        +-------------------------+         |
> +   |                                            |
> +   +--------------------------------------------+
> +
> +   +--------------------------------------------+
> +   |               Service Layer                |
> +   |                                            |
> +   |      +-----------------------------+       |
> +   |      | Message Serialization Logic |       |
> +   |      +-----------------------------+       |
> +   |          +---------------+                 |
> +   |          |  imx-mailbox  |                 |
> +   |          |   mailbox.c   |                 |
> +   |          +---------------+                 |
> +   |                                            |
> +   +--------------------------------------------+
> +
> <snipped>
> +
> +  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
> +
> +                                Non-Secure               +   Secure
> +                                                         |
> +                                                         |
> +                  +---------+      +-------------+       |
> +                  | se_fw.c +<---->+imx-mailbox.c|       |
> +                  |         |      |  mailbox.c  +<-->+------+    +-----=
-+
> +                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
> +                      |                               +------+    +-----=
-+
> +                      +----------------+                 |
> +                      |                |                 |
> +                      v                v                 |
> +                  logical           logical              |
> +                  receiver          waiter               |
> +                     +                 +                 |
> +                     |                 |                 |
> +                     |                 |                 |
> +                     |            +----+------+          |
> +                     |            |           |          |
> +                     |            |           |          |
> +              device_ctx     device_ctx     device_ctx   |
> +                                                         |
> +                User 0        User 1       User Y        |
> +                +------+      +------+     +------+      |
> +                |misc.c|      |misc.c|     |misc.c|      |
> + kernel space   +------+      +------+     +------+      |
> +                                                         |
> + +------------------------------------------------------ |
> +                    |             |           |          |
> + userspace     /dev/ele_muXch0    |           |          |
> +                          /dev/ele_muXch1     |          |
> +                                        /dev/ele_muXchY  |
> +                                                         |
> +

Wrap both diagrams above in literal code block (use double-colon).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oH2YG5RUiU+HONaV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEqiOAAKCRD2uYlJVVFO
ozyXAP0aBRO1KFa+AGM5cBvWcVeY8OuEyqTxzHKI/v6k+zKsNQEAvGxANofk/mBi
s+wj3u05E/Xgxa9C5b23RBYacSQLLAE=
=SdFq
-----END PGP SIGNATURE-----

--oH2YG5RUiU+HONaV--
