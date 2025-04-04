Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218C1F94C;
	Fri,  4 Apr 2025 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770658; cv=none; b=mvShFpICSnvcN0ivhvxX7napxzMSVyas5/L80akRY+9kL4qb9WnJDr94zmUy9EIoBDiiAVmMORNLMTjCSyK2cFdwXsc2F8l11g4LTFW/x6f96I0mri/5PufvkH0FD564kFyySOO40wNuq6TvqJvfL+Q+NGYVpEfs86qZcU+F4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770658; c=relaxed/simple;
	bh=WC2rA/Jppc7oOTVyOQArv8xMIayyeeJQC95QBqO167I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N94ElgqgbB0ZVl8UJUIIvuG0omduN+tJSY0wooR4i7BNkMGKsZtRGzWVGCNuQbSJ+1hc3SU6gtuDV+ojMBdqwDNI2/XRn0FYmBUDjstr2X3nOQOshTiwfuGJbiguzmWyD4k7Z+LN0Avoe3Qkhl0yHikTZkF1ibOWTdjUyeLie9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8ukBMhc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8ukBMhc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227d6b530d8so17674685ad.3;
        Fri, 04 Apr 2025 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743770656; x=1744375456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WC2rA/Jppc7oOTVyOQArv8xMIayyeeJQC95QBqO167I=;
        b=g8ukBMhcYRDOe9bTN7JALQ+7fn8FIdx1rjTnmqA2aIDTbaqwx/osseu15wg7x4gB+/
         mFM4F5BO4JMARsITdnczlhtNryL88kex8ay7/wgtfOWIaT0hHU8MW3m4PgNvobGxVzsk
         UHJvgbwy7R/ZSx6+Uc09Wc947sWK3mK4BImE6vE67XUEHBSz/7TuJKdaYsQ0U1pFekAU
         32xuF1CIlAngpCXTxeKfwfs9wrylF4n9pe81GUwmFDh2BrZrDgrkwvjZWpyKN1tdbCb/
         GGMEqSsXaiaZha7lqx0H3okBv7uR4PjC7poPKjNKki+5vOwYLQy4X7k7edMLmArXjave
         2aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770656; x=1744375456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC2rA/Jppc7oOTVyOQArv8xMIayyeeJQC95QBqO167I=;
        b=ColdBAYB9qaaNR9ZKri7Jm6gpgyyswLucGaJIBSepxrMvZ+x1Bl2c+A5jt2JRdy88P
         IcDLwSyOUfYmxK54uUd54GGz/s+Dz3aW92/C2FnUOxqFhPKk6jsF36Ei7S+AVq1pL4cL
         FPI8fSzHoEPmsb2/qSk1LYzrrR7CCN8rGFrxQbZFivVVNszvNujRXGh9hIolcaqds7w9
         a7ZRjAzKhBXJL49EpH7giF5vcwUanxDVawNXR+3xuXIDamXIrUB24INp1Sciw84Zqo6B
         p82vA8E0EZGEQbmkCT+l0qMmHERKN0fGmxQpJIOZ9mOUMEYSJZuj5nzlJHNUeZmPcyg+
         7Ucw==
X-Forwarded-Encrypted: i=1; AJvYcCVRgmgPuOzBMwcj8is26I0iAmw6DR38LyzZG2iKzjwdHVTxvShKBXbvq8Htv8iHl6OPVIANxo2Y12U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXa1tthT0sC+fzux2JYDu2Ef4ORUxEjwI4+xvpTuwjsyfAiAg
	xdoB3KoKTzAdq8niNrNn2QV0f2coJyz+TvMqhB2ew7FNKea42gLx
X-Gm-Gg: ASbGncuaqItaLLXZkM7ZV2bg+f6L/8LHLYGTs5sZ3vMCkcDuadc0KCXycq0sf1piyi9
	tU4BjBKiFYYES2KCBTZ3G96gL7AaI88leUYuiZwuSFI6W5h9l5+IMMieG3Q7wb+QpPuJ56wCHWW
	hlPuqErXuSm8KL04n00eZbhLz1x4A0dpoRT1eN2hwC9ovMxOAZNtoMe/wuPMpZyz6PEnGi8LGC0
	8JN8aFNLGUPuYcgbxB8aWvgRpqTGlwLW71KI2WqHA9CQnSo1mu6vOlFkqX4TTYl5q8IlPzNdE/E
	nyGKx2g1aSZeXQXo+MV/Xj+VoY4dBwQZnegQOEAUZa0s
X-Google-Smtp-Source: AGHT+IEvjB1jY24Z13x0dvYi9z2si6Y37G1nkpKhYR0ZDT64yYzGqz/AEZfMgEA3TFI0v72Qx1Z98Q==
X-Received: by 2002:a17:902:e944:b0:220:c911:3f60 with SMTP id d9443c01a7336-22a8a0b4022mr38854395ad.47.1743770655725;
        Fri, 04 Apr 2025 05:44:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34e91asm2769802a12.33.2025.04.04.05.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:44:14 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AF9E9420A6E2; Fri, 04 Apr 2025 19:44:11 +0700 (WIB)
Date: Fri, 4 Apr 2025 19:44:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org,
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org,
	mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v2 2/2] docs: clarify THP admin guide about
 (File|Shmem)PmdMapped and ShmemHugePage
Message-ID: <Z-_UG_zVLZNjxPD6@archie.me>
References: <20250404100159.27086-1-kernel@pankajraghav.com>
 <20250404100159.27086-3-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q2Ttcq6upHDrBmCH"
Content-Disposition: inline
In-Reply-To: <20250404100159.27086-3-kernel@pankajraghav.com>


--q2Ttcq6upHDrBmCH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 12:01:59PM +0200, Pankaj Raghav (Samsung) wrote:
> -The number of file transparent huge pages mapped to userspace is availab=
le
> -by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
> -To identify what applications are mapping file transparent huge pages, it
> -is necessary to read ``/proc/PID/smaps`` and count the FilePmdMapped fie=
lds
> -for each mapping.
> +The number of PMD-sized transparent huge pages currently used by
"In similar fashion, the number ..."
> +tmpfs/shmem is available by reading the ShmemHugePages field
> +in ``/proc/meminfo``. The number of these huge pages that are mapped to =
userspace
> +is available by reading ShmemPmdMapped field in ``proc/meminfo``. To ide=
ntify
> +what applications are mapping these huge pages, it is necessary to read
> +``/proc/PID/smaps`` and count the ShmemPmdMapped fields for each mapping.
> =20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--q2Ttcq6upHDrBmCH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+/UFgAKCRD2uYlJVVFO
o8iyAP4y2cPlJ9PmjvYd9bQbQj/LpLzDJjMeX0hgGkJTM/RWigEAqWWio4oMoXd6
sLnP2GA/32m2Yy6fmUBZJDqtcS9Thww=
=dIDg
-----END PGP SIGNATURE-----

--q2Ttcq6upHDrBmCH--
