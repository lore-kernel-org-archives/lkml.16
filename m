Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C52AEFD;
	Mon, 12 May 2025 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077695; cv=none; b=hO9WkeWOky/3FPFUG3y60kaHiImTsxWU6Evgsewu1aLnie7gBmuSAOpdVDXIndWJWN8qxqxTkj3usln2Dw9ETgiCqswtMHHd96CCFNretLtW8icJqb5xBkmLhmS4hVB7EdIZQdIRj2n7yJc+4lwSvPCihwq18wmQ8U8hePYsMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077695; c=relaxed/simple;
	bh=6tO6V1fnQ4BphmyZCfnhxNAdBz118GU4icXTLHyRy3c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rjfHc63bAmRZoqNCAZKRrsRHbME+YV89bf2WO2ZimbzwHBfYSqiOU6mrEE9oMJDB763TGImLNZqwlke01dKqEDAiqrPM/J+yZs/baoczRKTPvL4sVuF93PCTYH90Kb2k0pIe9xNfOPs705UHA66bZzkhIi2NXtKU7gH8L6K9y8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejND3fog; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejND3fog"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-875b8e006f8so1426500241.0;
        Mon, 12 May 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747077692; x=1747682492; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tO6V1fnQ4BphmyZCfnhxNAdBz118GU4icXTLHyRy3c=;
        b=ejND3fogETt5nj6GXU2lty9jm5t6+yZnL2WFJdXlTuGwvoR5klDL5iOkmlkSqAFCyC
         XVZJRF7rVwlzANyDwosSi8qvAIbOLCaeLL/uwIYZN3WfqsJXqhHdD1vg2p28Co0n/lqh
         o054XmFzqENnCTafrhEzS5igg/E7Kg6yVbWXCRItSWj7BV99uV/XGuCcLI3UKmRKZu5+
         kTH+PgZo4gqKFMsiAqbdN1GLaAqzkGniREv3VkxwTLVGKV/m8ReYzMbxL7QKlH8uWfa2
         AbdtHmO5WyrxpxULSd60QLT6ABzA3lqun6JaYjtiYjyIOxTuuZ7oR71kU8YpYOYhvaj6
         FlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077692; x=1747682492;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tO6V1fnQ4BphmyZCfnhxNAdBz118GU4icXTLHyRy3c=;
        b=EAMJJDvlcbcasuvl8T4HrGGZ49tm6F5aL4Dq2IoTHQxaedbXzisDcuF02qc9TyS9RY
         Mp7BQqlO3gB5V0bD5tP004TDaOwTbrxj8YSlveR8kAeBDlK78YRFZbsIP53Oe7HVoJ/p
         V/mTas9tPK0yOo5BBugWPmQ21NoFwTLEPnoFeySwVPE2L7lb0V7kzxHNK8KZoFNBpuSL
         53zgdS6AvvmutO2x6UmMLPOgvC3CYuqKIUxXTGLIYi86+ib1i8CJugUR3WDzL8vYNe+l
         AvltRVPV6oEMZlnkS8PnSV2wwebG3oP1H2sUHihDsz+Q5oFezDI5RvcNBjjfQCoTDW3F
         W9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0fybuwqRDCrKlKaaMk0NPFaCw0mEjWepz1+XxVNDTEi2P4hRsibdUP3dlirXRj5aE/TATg9CbZS1mCLD9NrkKG7OVPw==@vger.kernel.org, AJvYcCVdvWXmOfYXR4s4YGNQEUUx++4q4t3JQJSF+DDXt10AovLCRyW80DqeZcWQVj4WnLi2zKRRrvlge9LHkyh5@vger.kernel.org, AJvYcCW6c6UxFBNb8wORh/1nBeFTlEunXG0CB613+kWS9Qr06P6xnGZCcXjYqs1D7QmDwlVHycH39u/8c60=@vger.kernel.org, AJvYcCWu9dVt/XJsIJ0TawGIAIdZyWMhtlEAyNznP56TTekSGpWX67uTn+0zeuYIOYl0l0XE2prC13i3ERPzpU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1H2J+OzEiuEKjAbWV22YtTa2YDCQY/bI9OzrQn/xiJ01ExyHb
	kos/tqSa4gHv7x++H9JJEFPA4951ks3EMVwv1UBj/KFmS8SXx/MQ
X-Gm-Gg: ASbGncvdAJDj6kiKXEkjUXEwkTsWVVhIZGqjU/h+oLx3V0QlUdajtNAncX5cBTSHQNg
	hzqQC1Bg3bmjcBarLt7jz3FoC1rZEK7xsOzsV4Q67zp7JnYnsNTePCwe1sv5YDycNyZlwygDS5F
	DR3rLgJ4DRey4PKmDGNCbLDJj/KHQcXuOm4+Mk+EXDZ4SfTbXsmUsuqvu5L48HWJIam1ACpEtl6
	VBBHSYt3CKYocQ+Hwz9G441Ij/nso/5hEBpOs27ewsLrN0GSM6YdfQ3P72ugQa0MjWVKrC1M+xP
	uuCZvRIB0eT2BUPzzfS2v1sxJPqPBfKk/pgDWADExMdt
X-Google-Smtp-Source: AGHT+IEgxCmOA6GDxTk9OZxAAhXhnkR8evFxdcLcnGbDppxlLt6iLU7XobVowtj+sgqFjBbxORG8lw==
X-Received: by 2002:a05:6102:2b99:b0:4dd:bb2c:491b with SMTP id ada2fe7eead31-4deed351cc0mr12281133137.7.1747077692261;
        Mon, 12 May 2025 12:21:32 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85b2575sm5698900137.7.2025.05.12.12.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=43d26cbfefa2873a56beb9d435520e2b45c3cc114187a34e63c1d683ca4b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 16:21:27 -0300
Message-Id: <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-3-lkml@antheas.dev>

--43d26cbfefa2873a56beb9d435520e2b45c3cc114187a34e63c1d683ca4b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> This driver requires to be able to handle transactions that perform
> multiple WMI actions at a time. Therefore, it needs to be able to
> lock the wmi_lock mutex for multiple operations.
>
> Add msi_wmi_platform_query_unlocked() to allow the caller to
> perform the WMI query without locking the wmi_lock mutex, by
> renaming the existing function and adding a new one that only
> locks the mutex.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

You only use msi_wmi_platform_query_unlocked() to protect the
fan_curve/AP state right?

If that's the case I think we don't need it. AFAIK sysfs reads/writes
are already synchronized/locked, and as I mentioned in Patch 10, I don't
think you need this variant in probe/remove either.

I'd like to hear more opinions on this though.

--=20
 ~ Kurt

--43d26cbfefa2873a56beb9d435520e2b45c3cc114187a34e63c1d683ca4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCJKOwAKCRAWYEM49J/U
ZoveAQCdLZOGRy65KeoiJwTn2v+w2cO8JR3Mw99Y3RWodxaHbwEAqxaEYLxBKOy8
ZJGHUpGwkBT1SJEcAHuINbaVnKLcGw8=
=8UlE
-----END PGP SIGNATURE-----

--43d26cbfefa2873a56beb9d435520e2b45c3cc114187a34e63c1d683ca4b--
