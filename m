Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD41297134;
	Mon, 12 May 2025 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078783; cv=none; b=sqh5e1sOwimXkzGVjowC5Z+bJOw6fZ++T7yOhF7rjj5x+Vza/2nvGICIBys9At+tTvtM02n2mB8UwA7tpW0R/FfRIE6lEYc1X1+Rgx/xFoPq2ghmTAfAv0kJNv7h/gow38Oe44VsXM7gUfD5lhf/Lfqk2bDyXUj7YD0VCgum7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078783; c=relaxed/simple;
	bh=zWqwTZnS76HWtNuNUspZIDXiDCFe2LiQkTMjeRhfTaE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LCh1rtOo8rQf2Jetzwc3p/7whtB7n/8Q2v8cdgYNlVkp0BE0hTfYpupLvjo+lClqNSz57+9hnTU4g8TkumUlrCYtpewms4nXHHOvETAEh2Q96gBYWWm1tYrhlmLEfmQvGh2EJiwzjv1O+OeK2csnRYb3n3iBj9rOhBjXo9aa5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJPJ6gNt; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJPJ6gNt"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4def6955e85so1238196137.3;
        Mon, 12 May 2025 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747078780; x=1747683580; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qEOztcDFpCxbBBwmaH8iMJeEYi2msupjI4IRNdXD624=;
        b=ZJPJ6gNtI2nFKa4B6+93LLlhWiu+3Psi1HcXgUlat8yucz3Oknx+OrBEE2z7EGS2jr
         heuqGoGixgwqxl2d20N+yYlUmaQ9JKjUfX/FkVgLY5Nw+Xr76V9y5rJmJzdwJLBH2Iu7
         gnaCPhTgOtOiuN3ewytZFnMc+fK7SzeXsxcQYcrRb6SJ4b0QxZh5ExFmWI/4nnzS4vsf
         GWVZgzsBZamnxBGm8u/eggHHcuratk8G+eAxMQRMZU0sk07zNCB61r+N3gFKsXoOIWWq
         ztmAsYwc3fg1V5PeJTpV8/RJ2C3UrABL3CDoaXa+y8wqFPBGC7OeK84E1HBBMMcgDoEN
         n1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747078780; x=1747683580;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEOztcDFpCxbBBwmaH8iMJeEYi2msupjI4IRNdXD624=;
        b=c0Cz8xdddyPjhl/izxGRlRX3h49z3Bnguwkm/eIvJCkmSVXwTwbrUF0f1n5jrxckS2
         M6XlS9BD91JHpubZYsmwUsZXISSEsSetWhivZpgTPXPxGOuzTVkU/Fs73yXtVmFaZ8o2
         k/c5cfTn+282EVhfsK444age8+uv4N5+8qcZEBmiJUONKTMUxuGyt905E5xy7OUlAzb8
         UfVvFcJefhgD279cMkLD7vQJBj4PEGLHnPPE4241A2Eo4/krhDJygQ+VBU8hZYJXJ28n
         kwNO23iH9cR9tt89mn/vcb7gzDqzaUUbKpblj9aKetVNbITmVxKC2XstGbOIMcNfuagv
         k9sg==
X-Forwarded-Encrypted: i=1; AJvYcCU6I8G+n5Ea2E915MAlFmvMj/xbVlL5q9wOr44vzk2X8uexjiOK0bpBuAp8C1BA/afunzu4ohQomhzF2jvhJtuC0+up2w==@vger.kernel.org, AJvYcCXMOqFl4VftLn18gdiJFnopL/om2E2Qvs9jZnyVlmpj/s24Ti6YUJGY2d7TDn8/mPnhbVtcwxkJdN0hCk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0xCFg67rn1Teokc/BZHcCn6XN/489iyN1uS17xxJQMUXvWf2
	xkqrqvqPOl+Jtp+/US+4G4u4yYb/fY8LAOQktlmLirHNH7H0p5+x
X-Gm-Gg: ASbGncspq9w5ngikD63x1lBr3qsK/Fsh6Z4CxHfkq+VfwJRwwPvACd9wYPZ1vLgdCGv
	u7DID3EUAbOx0gHeQqTPEOKVUiIXua9JEo8MHHv1N8I+m7HyqV+ZNRTYpM4dOtzWtK06JXZGeX1
	gwslYxUK8a1SMXkCfoNGmVgE5WPdrau2jg0HVWrirZsJR8BTRdiCF1ARxHvev8sqc0Ms4vteBmP
	PIecUZyO3WPARcIvD/AWRJag/IvgUJ8Qm252L6saajxCHvjQ5n1AlKUPXOsOWd4CpUmoqzmQ0i2
	Q5PDuHCgehriXiB66NueJhp8g88Ux79OVHKuH31WJsGo
X-Google-Smtp-Source: AGHT+IFHmKvVYujoDfRaGW+gYgzFRF0r8EvU+3iFPT4pOgmntvnbdDEVJmbw+LxRM/Qz/Hc08nt4Bg==
X-Received: by 2002:a05:6102:3ca9:b0:4dd:b9ec:404e with SMTP id ada2fe7eead31-4deed375c48mr12172963137.13.1747078779923;
        Mon, 12 May 2025 12:39:39 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f603551dsm5757258241.0.2025.05.12.12.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6f0cc1decabd567587322599201ccc75fb70ba8e65c9007377c55730d4cd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 16:39:34 -0300
Message-Id: <D9UFQL7OM386.2PQP7IG73O0MQ@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Joshua Grisham" <josh@joshuagrisham.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Antheas Kapenekakis"
 <lkml@antheas.dev>, "Derek J. Clark" <derekjohn.clark@gmail.com>, "Prasanth
 Ksr" <prasanth.ksr@dell.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH RFC 5/5] platform/x86: samsung-galaxybook: Transition to
 new firmware_attributes API
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-5-258afed65bfa@gmail.com>
 <5706c07a-f8e7-4dc8-95a0-b128f1306c02@t-8ch.de>
In-Reply-To: <5706c07a-f8e7-4dc8-95a0-b128f1306c02@t-8ch.de>

--6f0cc1decabd567587322599201ccc75fb70ba8e65c9007377c55730d4cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Thomas,

On Mon May 12, 2025 at 4:12 AM -03, Thomas Wei=C3=9Fschuh wrote:
> On 2025-05-09 04:48:37-0300, Kurt Borja wrote:
>> Transition to new firmware_attributes API and replace `enumeration` type=
s
>> with the simpler `boolean` type.
>
> This is an ABI change, using a newly introduced ABI.
> Some elaboration why it does not break userspace would be good.

I thought it was not a big deal since the driver was still new. But TIL
fwupd actually interfaces with the firmware-attributes class.

I won't break the ABI of this driver in the next revision.

--=20
 ~ Kurt

>
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/samsung-galaxybook.c | 299 ++++++++++++-----------=
-------
>>  1 file changed, 114 insertions(+), 185 deletions(-)
>
> <snip>


--6f0cc1decabd567587322599201ccc75fb70ba8e65c9007377c55730d4cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCJOewAKCRAWYEM49J/U
ZngQAP9ySJTGTF5F4pQBV3c6rnU43Vrxg972tsx/srVdfJAnZQD8CvXtrz8WaK/6
waldMQy5miKuhazsWGHV6J6XdI33dQw=
=Jldn
-----END PGP SIGNATURE-----

--6f0cc1decabd567587322599201ccc75fb70ba8e65c9007377c55730d4cd--
