Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA81F1A23B1;
	Thu, 24 Apr 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476614; cv=none; b=DK9AWK20jlArneLx/nSOcbnUARhv35bQLILk6iOl+gpu1LpL71QVXK43TrNEXgih0IoC1Nbz7tHYzOwAPS12lTZ/FlJy+0JFyjuY1vSeY0h3n2qa9vbNUvrpPeHDi9nppSF2Y+JqRszx3N0LVUCJXUdJvUJQT3NDL+I1HwQ6n2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476614; c=relaxed/simple;
	bh=JLj1BnMNU8WF+yUunp5YM6VjkJW4gQPN8v0ZqMXmZ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwfshlxyo/h7lA95Ls1bqWAmTF3kocoRTXUUBgaI9v/2jiVd75Hf0CMNg+9IHRRi4ERaj03smTXAkU2xploQvwwc99whLn9jxM/RlzLU/YYhceChzKah887lBx3WLw9RXgnkt93YvEcbH66GhG6WXLtTfF4tsjrJc0tRLkSsYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEcJ6jRY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEcJ6jRY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549b116321aso756899e87.3;
        Wed, 23 Apr 2025 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745476611; x=1746081411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VgManF3W+m3EucBE52I+E2k3U4KfqO+q1493Pk/44+o=;
        b=XEcJ6jRYmWUVnlxoMF26cwwZMZfvCXiFZy2KcoB/sy3db9HmdTsuG01kAiZGj76bXV
         PK/Kr2iJblOHEGoMwZfM+3sO1xh2pfXMLLK5NSpEmipzioAK9oSfoic9OJJtmm5v8GKn
         FR9vRToS0A9l3cJoPYqatrYy2+ktLTf1Kf5B6h7NtUiP8oAb5K9oa6b4vEWo/RpJ2Yeq
         yOMMWEexCOst4n9AoCuTXVxQmbwwCS0WztzEzzk/0A48gB9MluQx6sDE9ADavS1QkKZs
         tJsY1zO/tPSof/DF+SyTggmcYde05LMNhKBoewedvOdE3XWadWwJ7cqsIbEFaretXpLR
         3oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476611; x=1746081411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgManF3W+m3EucBE52I+E2k3U4KfqO+q1493Pk/44+o=;
        b=ueD35ky6ebFdKs4prQ1Vk+35dMThVrA6/eklafcWfiUm/kjZzV1AOcyA7Gh0YHlngz
         hTAR0SSV4sbWvZvxyQcCig8vTTu/vQ4/fo1ZRI5U6KeHmBzyrUwrBqq+1l18b8oqGWwC
         0+jjQIcxdmVrj7JQ/ewduU1dp6UjpUzG6EXFKBZoVW8IRWyIG0sDZKsixBZwjNqUs0kP
         qP/lFoeN93R2SQULOGo3g0urSncxPt+xobFRnIR1VyoKnUUUJCOtNqzAIh24klZOocPN
         BUa26UP7fqyDy5BQjyLavSs6/h4e3mms9trfus466aH//8J6pVfkcnVwY0TIQF+qCYfz
         xWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWjQAYTvGTkwr1gz3BkY6xNcudtgDzhQdOTxNuY2xk6cZkFUhFxtbIdByiNDjq4cYY0oagQYFXsAaolKMcD@vger.kernel.org, AJvYcCX0Xwxd75mPflYsLY8wvXgMNyRalccLj5rzSCTLNcEp6ciQWtIfoO6RAUoVSio81+da3dwn5T0EWo6m@vger.kernel.org
X-Gm-Message-State: AOJu0YxaeUxEmjnqsdLauKO0TRUBOO3gXenMXEVQDlFUnGV2OiQGIo/q
	0EZ/+rMOGdFDI7wZwNCB4gMoHKe/YD17xff/mYCWvGmLUPzXpb5i
X-Gm-Gg: ASbGncuKcglWh/mm0gAx9zH8QYR4wzGe+cD0PI4uS8U3qU5GXQarJnW8VFINRPz26xL
	MOdwiWr5G1Q0Sp/DJMDZWXaGCg5uiieLtCQ7AVFexO1wc8HHdm17YdcFRgBIqBrPxlG386DrHEa
	K455kLG9TNmvnquJmvCDjvugaKYA/9EjS+rcESciZkNAgZFtnaylreMV9hP7ZnW2OTxDS24cqtH
	oSvNpBansh3EdIb7QJ3+oDRAgeSINy2CETEYPr2Kce0QoRsMJQounMUaieO0R2HAKhYyXCncZNh
	7GXu6W5uYzbhXrVX45rhsB+EzRCqvxN2H23mrknjK6pAWzPRFhJqrSuS4zDfvb6v0W9HUqDyISE
	skA==
X-Google-Smtp-Source: AGHT+IHG0jMwpWPkpVYMRvWwLynBDuuX4rGAYjKrh3BbGXlEiCCaEKt5ltz3LfLHsRaI5CSLX7agNQ==
X-Received: by 2002:a05:6512:12ce:b0:549:8ed4:fb5c with SMTP id 2adb3069b0e04-54e7c3fcd69mr447665e87.31.1745476610341;
        Wed, 23 Apr 2025 23:36:50 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9eb4bsm121756e87.137.2025.04.23.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:36:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 08:36:47 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aAnb_97kxSDvDcdd@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S7Yr4c6CSMMUOBqv"
Content-Disposition: inline
In-Reply-To: <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>


--S7Yr4c6CSMMUOBqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >
>=20
> I would structure the driver differently. For example, what was done
> for the Solomon SSD130X display controllers, that also support these
> three interfaces:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/solomon
>=20
> Basically, it was split in a ssd130x.c module that's agnostic of the
> transport interface and implements all the core logic for the driver.
>=20
> And a set of different modules that have the interface specific bits:
> ssd130x-i2c.c and ssd130x-spi.c.
>=20
> That way, adding for example SPI support to your driver would be quite
> trivial and won't require any refactoring. Specially since you already
> are using regmap, which abstracts away the I2C interface bits.
>=20
> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  drivers/gpu/drm/tiny/Kconfig      |  11 +
> >  drivers/gpu/drm/tiny/Makefile     |   1 +
> >  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++=
++++++++
>=20
> I personally think that the tiny sub-directory is slowly becoming a
> dumping ground for small drivers. Instead, maybe we should create a
> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>=20
> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
> your driver. And also have a few more Sitronix drivers in the panel
> sub-directory (although those likely should remain there).
>=20
> I have a ST7565S and plan to write a driver for it. And I know someone
> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
> the reason why I think that a dedicated sub-dir would be more organized.

I'm looking into moving all the (tiny) Sitronix drivers into their own
subdirectory.
When doing that, should I replace the TINYDRM part with DRM for those drive=
rs?
E.g. CONFIG_TINYDRM_ST7735R -> CONFIG_DRM_ST7735R.

Or do we want to keep the config name intact?

Best regards,
Marcus Folkesson






--S7Yr4c6CSMMUOBqv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgJ2/cACgkQiIBOb1ld
UjIIhBAAudyN05XrXX2Whsh+pWT+inxuTM9ECu2URVQ4JqXI16xqAwInW0nSgf5c
vN3mZR+EuIb8wYORU/FgG+1JDXtQGt1X7a0aYC7RkAJxOovF3uTfJPDP3GPp1sQW
cIXyFoantymDoA+KXZ5gt1YYBI1Zq58nkblmlhh+z+w6X1SfyEubK52ifFCQYc0O
91p98iGzpLzbU+fdgEA3ZIvxxl8bWcdCtBLrSXWzUjLTnZEZxMKJQqnPJBZjzYin
3MWmyQIDRvAXFgPswHEN02JJ91zv12+V0ak+k+2OVT3N0+53gW1HPkZuRqzEpoSd
VlI63w5rKxW5VmgH7RPryHsLvT0+tvyNGC9KR6A/wHbdIuYNGyiibmzpMMWESnbY
5b+nYHjInQuwiEMnv6hsCM7GrewTz7O6UfLx2LQn5nSlYWPt+JnCpsTMg83DOgFP
eVXPjCcZ9xxIdP4b3VJxdX0adS2+zfz7Xrbub7abWqbx4xmWBnI0aZM2uhc2Nf9F
PrYqUfa7qCeLw8ZcoYtX3LnuxJURFXdtm0pJtVWb3c9ZbMixA6owFi/D0+2jqDQ4
U30YVe0832ko1HPzMTrgCpa3C9mDCywmYNItd/+sE90K/VfBZ8qiFQRnC1jpiFbB
1RtJEOwoLytRGK7OFS68+yRVEzsBa/vBq6AQuN57NqZFNBtkmnY=
=7lP1
-----END PGP SIGNATURE-----

--S7Yr4c6CSMMUOBqv--
