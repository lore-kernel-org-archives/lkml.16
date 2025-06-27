Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F1D2ECD36;
	Fri, 27 Jun 2025 20:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056710; cv=none; b=nSyBwMm3NDU14fPmh218XfFv9mWeEKAyX28PuPwjHDNVxyHM3zhwSzpHM32Z0KnTA07EO02Xc8+Ih8iWGwP0pajLRpAN7E8ypBI17C+/RjdtzOkXMdvLywdYagaHeM/jRChH4rI25F0cj+SGQjBgvBT71qIC/KavfxmwzVHb0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056710; c=relaxed/simple;
	bh=+eGj7zgGi5dwTzNE1CT8j7CF9nne/AsU+wpmGrdbYzk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nzN5592Ygo9K9X10EGRSUXnfoyj426BvdfdUw7BfttS1fkVzb8/0FhhTKWL9zAYjq2BJUzdfbEoHsCkcMpbes0J6CvhygA8cf+LjPDI93MKgUjS9nm8ZBdJ50HKZFWkyBEj512zeHQhYJD6ivlfTPbaSml0790U6MjAd7aXZKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDM2Q/V8; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDM2Q/V8"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a44e94f0b0so34817531cf.1;
        Fri, 27 Jun 2025 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056708; x=1751661508; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HRQMeMJ9GJ70sWKndVBYSqsjABZis78O/cgobcgMLcI=;
        b=RDM2Q/V8lyQAL04rLT9tNREKcFYRqYH8XDJBiSIE6jcfqhYCdw9Nx1bDngwhFWGhkz
         W+AI4RSjUp6ZeozBig99l6TaJyb3vlW06WqSLQ5At6QDSABoV+kR3RHnv0DnEBnCPmLy
         8zbJe0pcm+D4wtDxETQQqjBw/lb5hcFjQkLWzAKR/E1hmc4psdAq+cNDtJ3G6XnjyVkQ
         +Znh3+QUawfOoPt8Twe63gzXZI37m/h8/nKsJF7x5Bd09cu6y/XQEI6m6+Qd84Uys1Mx
         OkrTRg263R5rzuiLTIJE/gBptihbHK2iX3gKcsaHyRk9blAhrP/XNLMBicD+BeWANUT4
         3l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056708; x=1751661508;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRQMeMJ9GJ70sWKndVBYSqsjABZis78O/cgobcgMLcI=;
        b=M8Qik6ZR2VZ92Qki8a8mIEeXtvlGJk6cP40+LXmD1+KlUUpha/izub6OHPL9Yk4e9d
         EtbYRR9mmjuFbvLz2aPSx4cINf2uCJWJa7GtenjnCMWf+p8bGkTYEbYiayosgZq6mZnS
         HBeqtxyV8pwaAkuNB4sWfcDKtcCplqdmqSWy0QkAOOvMhpmCBDF606oX/3qgKrwRnPrU
         p/G1jTdCE/HHOBnxXRNp32td3sRcAG+YBO48rvkzTEXuA/O7DsuXRosft81vSjSEEbvM
         SWpDh9xNmGBH9lv2YpnsYZlqb52jq8dSQWezaQn2Rc7zHc9Y58N4ptF6/bab0Uj4vt6I
         lvdA==
X-Forwarded-Encrypted: i=1; AJvYcCVQKBJzAnWJ8to1F/tHQwf1noIrCRCTdNYUhezWQXqzBeBdBq8yDhx562P9wVTKb+1YMCwW2YrX1/upjmk=@vger.kernel.org, AJvYcCXZyxTgvRiWgu3dR7JaKJApDj3qG9/4ti/QlBeHJdORa/sGiA27Ui4e0p5LS7mvyrk1DYpbUh87QFD4/0M0igxYMnTnbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBjJNRk6QhJHe3eOLE0t0dtbcKIo2gupwq4MPGVzW/guuPVpJ
	2/OppDOYEEGvQTeDQTIVDGQfJz+6zYC9NGA4bojcuPCl6hYV1MqYurnR
X-Gm-Gg: ASbGncu0aBoNGYUEcIt4DVz7/tE2snw3e85cVKLXc8AKBxMxTteT+FHBTa/uVZMOusu
	f66JO654VTd3ST40SokKxyfPhr21sROAqo9CmLCQKnjIsaBEQ9xYbKwUcwGO51eZjdOo8R+sUm+
	7JnoIPMqE4VMC+SLHnJLOsWAQfytAfM53kQgveq5cwRQ6hQJbBNM/OgnLxy+RB1rl7Vrayg/PJs
	5zZDmUo6XwutiKPokrcX9W+0xoX0iuQrjetf9Q+wtOyUJaQeXmZQ9EMqVGw0BSO8vPuhe+/eDO/
	l5yfJtbjwKgzNnppwl7vl1gm/dDreTAVQgkrQNi5oFM6skJaDq6vDQY=
X-Google-Smtp-Source: AGHT+IE+PZcuEiD8A2+EEBg8+3JJWIdKjKK/1KFeguTiNAF19ipY7xJtM236kz49MjcRPP80KWytTQ==
X-Received: by 2002:a05:622a:34c:b0:476:8a27:6b01 with SMTP id d75a77b69052e-4a7fce1c431mr79154601cf.47.1751056707710;
        Fri, 27 Jun 2025 13:38:27 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c65bsm18098691cf.52.2025.06.27.13.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 13:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d77776d3ae73202e0ccee692db360a93d0d95a9a8b45106f9cd2204109ac;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Jun 2025 17:38:19 -0300
Message-Id: <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
Cc: <mpearson-lenovo@squebb.ca>, <hdegoede@redhat.com>,
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware
 features gracefully
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <xy-jackie@139.com>,
 <alireza.bestboyy@gmail.com>, <atescula@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627195436.3877-1-W_Armin@gmx.de>
In-Reply-To: <20250627195436.3877-1-W_Armin@gmx.de>

--d77776d3ae73202e0ccee692db360a93d0d95a9a8b45106f9cd2204109ac
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Armin,

On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
> Not all devices support audio mute and microphone mute LEDs, so the
> explicitly checks for hardware support while probing. However missing
> hardware features are treated as errors, causing the driver so fail
> probing on devices that do not support both LEDs.
>
> Fix this by simply ignoring hardware features that are not present.
> This way the driver will properly load on devices not supporting both
> LEDs and will stop throwing error messages on devices with no LEDS
> at all.

This patch makes me wonder what is the policy around issues like this.
In fact I've submitted and changes that do the exact opposite :p
Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors when
detecting feature support")

IMO missing features should be treated as errors. i.e. The probe should
fail.

Quoting documentation [1]:

	If a match is found, the device=E2=80=99s driver field is set to the
	driver and the driver=E2=80=99s probe callback is called. This gives the
	driver a chance to verify that it really does support the
	hardware, and that it=E2=80=99s in a working state.

And again [2]:

	This callback holds the driver-specific logic to bind the driver
	to a given device. That includes verifying that the device is
	present, that it=E2=80=99s a version the driver can handle, that driver
	data structures can be allocated and initialized, and that any
	hardware can be initialized.

Both of these makes me wonder if such a "fail" or error message should
be fixed in the first place. In this case the probe correctly checks for
device support and fails if it's not found, which is suggested to be the
correct behavior.

BTW this also leaks `wpriv`, which would remain allocated for no reason.


[1] https://docs.kernel.org/driver-api/driver-model/binding.html
[2] https://docs.kernel.org/driver-api/driver-model/driver.html

--=20
 ~ Kurt

--d77776d3ae73202e0ccee692db360a93d0d95a9a8b45106f9cd2204109ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaF8BPwAKCRAWYEM49J/U
ZpCKAQD9kVouyazJBEdUB7HrwPvRO9ampPP4Nc0XJqLWWERQQwEA1c++aRcrBiG+
icr25qdwlo0j1QSw+GtWsa+xivZwSw0=
=7Ri1
-----END PGP SIGNATURE-----

--d77776d3ae73202e0ccee692db360a93d0d95a9a8b45106f9cd2204109ac--
