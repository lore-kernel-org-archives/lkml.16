Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2112B71;
	Mon,  5 May 2025 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417862; cv=none; b=t8VL85rwHCRwst8bYVtG4zQueXyrpEeeUyza9nxegZc/7gjhdaJWp5XMh/3hNOEDWgu+o6Nme3NeDFQjaZGwRGmCiKgjUNc32qEVb3E9Y7xVCopZtrvReTBXBwQJe5l2H0AP+lAZgEmRpWr9BQ5DNOkncRXA5qEOWWi0pUauBgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417862; c=relaxed/simple;
	bh=U0H8ISKtjS/t/QrfUvsD1+AcZmAJ3zkEpjlrAlNsbN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVTBDPL+oMGzSICm3hfNrIueIFr5/iDeWPsymGwg2I+UqiaQUHa3mvDgxKDMnAD/SOmOE82zt3bp1Uej6Q1P3n6z262Iyxa1HktKRpl31LdL2vCt4ApdsDWPzUT537XLOUv1uB8PpvkAFdM8yzxmBGDvRqCEVyf1usmSfys4c44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtJkhtlg; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtJkhtlg"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b350a22cso3206993b3a.1;
        Sun, 04 May 2025 21:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746417860; x=1747022660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gK0oUnlhk0xQS6gfCO1+tbdbmqMk/aeI5m31soEvVPQ=;
        b=gtJkhtlgLFMiRZ/U/B8yn7LTB7fk1Tfa0G7lX6RXOpRiE3t6rCYrDgoiyfEhcFXbHq
         DqR37rbZF4oDN3MNu2EclBBrCe3RhrQDPSApwr5VoF3Kru6g7zPfJwGPSXWus7Ov00EJ
         Bujk2C6iWyKI7/qyx5CkJ1tih42z9GctjkQpWnxz1x0w7FtAJIr2BCHeSZTmnuzsoFSa
         vvc8sM+ooi51dbNEyXGvS7XBkcdhs2vX6brbxPoWjqua9W2wB5Zwhbjm3z9Ka8DCSmwP
         bZ8Zw9mlNYwCOsJqoVacu1BPfkXErncvs+0T2A28vS4SDsvqVW07EcrKvulQUdNs0JiD
         H3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746417860; x=1747022660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK0oUnlhk0xQS6gfCO1+tbdbmqMk/aeI5m31soEvVPQ=;
        b=vOPYjgYsqHiK6FJ3VlRkkdeQTmDwjzxwV3imkxq4Np1rRRBCMmg0Xwz6biS6yFfTGU
         zw9frRshXul4oHW4C9FEH+Ctu0VOlQXzNcjq9dSCRH2/NYYqN0OKKUR5TDpA8JhpebZz
         z546xTBIGVgNeDpFuLQl6RThcLsI+eyETYOtYsGvQ4UNwfJUG81aatYnjoIquDH9rLK9
         pxIv7ze1pKCKfxpG2AJ34gLaZ/sLWAw5OLaKYWw7srcIqnQs/dD5rSY0jrn6NZpLvbB1
         MkoLBY0t6EPauUfKwJDptPqalsi0LY5NUiu6ngHq+hKWpY+MtgSZ3DIQ5MlB3LG8FNDF
         +poA==
X-Forwarded-Encrypted: i=1; AJvYcCUAn2LzDiZCsf8IaVYvJYtMM+XMYy30Uckr+C2C1Xg2G4r7DJdmI9RT/ESJQDPPKL3hJrIF0Vi56EC4gv/IFZE=@vger.kernel.org, AJvYcCWzujhgwihZst7ARhXfXGIcUudkMAcdxCsnXaHau9IVJSzZAY0ZGsO1LL9wZhtUe+LPzcWcsLABfywK6QFt@vger.kernel.org, AJvYcCXCQkgn9XsZUUl3Mmfcs58AtZJ4CkCCSmEBHN+YUgtrnMigNUuhXYW5TpI1n2p6ikg0gfdbA90EpTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXmomPK4JqQ9tDhceE/t755h0fuiB9vzbIXg0eqvlQv/+P9qa
	suN0t7zRiw1Qc7sChSuSIC72TOWEg95rjduY2QMKkHBV3RDcZu69/AZNnA==
X-Gm-Gg: ASbGncuMjQ5Gj4ZEN9TOwWRZ5SaFRHFOllPZLQICSZHd+eXAUBz5zRbSkMzdSYNaj4I
	FYE7l829hfQ6Etl9GYnoJ7X/E2dioQKsHDk5p8z17k7cdiI3svz6UmtiI7anu9elhijoXoXSYam
	JZyRMtnJUP73vfMAikoIO7L3+Y2wKZQ83/LBdddvNBuLSI3y66M6yGryx9/X9HnS6Vj9m0BW0Qn
	KMQTvUpM+lL24pTLmgX2ZrHh1D5U1hbSedWK6/d5LwkgesmNEyvb02foA6Pk/uVALSRDiFaWhH8
	SoWTcu/v0uIoXgZ6iwjLJu+XPsNcNfNcsRkvktps
X-Google-Smtp-Source: AGHT+IH4zF9L7zy3QfMIAIAAGNtwxpqx4wl4oSEMzfDCKzMJyIxHn4OFP+beI5OEKHOC8jno8TXaFg==
X-Received: by 2002:a05:6a20:3d85:b0:1f5:77bd:ecbc with SMTP id adf61e73a8af0-20cde951f95mr16724233637.16.1746417859836;
        Sun, 04 May 2025 21:04:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c439f2sm4553060a12.53.2025.05.04.21.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:04:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2799B423CC6A; Mon, 05 May 2025 11:04:16 +0700 (WIB)
Date: Mon, 5 May 2025 11:04:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Shirish Baskaran <sbaskaran@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/7] docs: nova-core: Document devinit process
Message-ID: <aBg4v1N6R3ryOiLj@archie.me>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-6-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGvKDiwG6ZHKPkk2"
Content-Disposition: inline
In-Reply-To: <20250503040802.1411285-6-joelagnelf@nvidia.com>


--ZGvKDiwG6ZHKPkk2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 12:07:57AM -0400, Joel Fernandes wrote:
> +.. SPDX-License-Identifier: GPL-2.0
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device Initialization (devinit)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Separate SPDX line from title heading.

> +These low-level GPU firmware components are typically:
> +1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and=
 fwsec.rst).
> +2. Executed in sequence on different microcontrollers:
> +   - The devinit engine typically but not necessarily runs on the PMU.
> +   - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System P=
rocessor) in
> +     heavy-secure mode.

Please separate numbered list from preceding sentence, and the bullet subli=
st
=66rom parent numbered list by a line.

> +Runtime Considerations
> +---------------------
> <snipped>...
> +Security and Access Control
> +--------------------------

Match section underline length with the text.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ZGvKDiwG6ZHKPkk2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBg4vwAKCRD2uYlJVVFO
o3anAQCb2dsZAHf+GyS2JomBvsALFHIJndX3uTSqBg0K+xrfMQD7BiYBQ5cTMcf0
W4c0tLhQPadH6gGQM8L862yUMgNpIwI=
=+dDA
-----END PGP SIGNATURE-----

--ZGvKDiwG6ZHKPkk2--
