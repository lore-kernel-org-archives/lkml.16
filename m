Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7336C27466A;
	Tue, 15 Apr 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703852; cv=none; b=nyBwcvicNRGYvggt2WF0ZBDY5vxJE7gZxt16IfbRBiKToG4hTD9gzqdF4M+v3B+LXQsCpyWc60fwLvpDUYDkOTO3LdR7wooiB3HhoLBbm57kFEmvj3t4QoDhT8KJG4OByrawqG39NuYesUq6d7vZsIQ6qSnhZw8O38ycwB7EpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703852; c=relaxed/simple;
	bh=+eHEt0h9JroIcM1xqkRnd39ju397O6yPjglOaIRJdqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRmvSA2L1vuLl7/vTQOOll3NFKsJFkcvWS6pzfOfdhcKW9fU0ZYbcWRc9iZroGA4h+bfL7cjeV705i9ShFtqwyPSZozW5xHe8chqLbyMInRlAcdRsKyMXzlbKyOTJ9rMvXdvYnPKOuYmpRCX4LIokZsAZjcKMu7bM/2nhwcUuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ0ntHaB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ0ntHaB"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso6361324e87.0;
        Tue, 15 Apr 2025 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744703848; x=1745308648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gBlWb6559YGHiqiH+9G6nK+InkFDugG59lEaU3YDbk=;
        b=ZJ0ntHaBtq3cT+WUH7Dqf93hXFtvLWe8xLztnQy+pqGOeT2kaeL9GTnKHvqutMwvrI
         0sC+Pbk1FvaWJoSkH8yGEc5Rjeyh862mPIUa2Q4cobntuypuNq6ojh+cI8dVgIyZoiUN
         mqg891SACzQXnw7xTnZ7U3etXGiT3FeOoPJxEkqiq2UsLDr7o0xMc2xM632FVMsFc+cZ
         DuxB52KchY994Ir008/qNzuUcm8eNMc4gPYGOALf9euYY9pfJfk3YuEdQXuMWj5TYvUO
         2L3D75W2AGAqT/ksanGKmmXWRavw/zKihagpoGx90Dra+Pwq5qtQLTZs482wlrYaYAJ1
         Zbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703848; x=1745308648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gBlWb6559YGHiqiH+9G6nK+InkFDugG59lEaU3YDbk=;
        b=fRl7ItsdYbgoJOwypL/QGg0HNl/0XW9jgh2ysvY277VYcW1EO0WeGTgItjY3j/y6G2
         H+VVNGaEqIzPLcQj8p8ZSaEC3MkHnnQX/cyFteSk6Z46b+gJdCO07fWeAuiEtuB6/PCu
         ouLVzLrryhvGuWufnWvgx6xFHtgJhHZLig4yEfEBS8UXVAWqs0oOeQ3WpZS1BBmWsevt
         G3JH8vCbNdvijl/OR5gQ1lUJp15UKQ15CkN8kxpcG5iY6hCR8z3OzZpijlp1q/SGShnM
         S/RRyuQSVG/A2e/feqV/gqJgfINUnX4vlp+qHgHQ99I1w5cAZMVivlesnXTCqjSbf4Pu
         On2A==
X-Forwarded-Encrypted: i=1; AJvYcCWFmR4vNiq5hv+nJTIKrhBLUHWxpto9N9Sq3tJQQKJrV9xX2fPEOu9kUax370UcJxfxSZM4SWiF9qMoW8ZM@vger.kernel.org, AJvYcCX6WeFjccEvXenh30Motxv7XwMW2eEs7W6sqkWPL7ozv4ppEMQiVsZtZu1lf7dyNH3bNEgedUHm2CDu@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0zW9FB4X8kpFE0nJYiTmVrf+M/vD1fLpyCEhPABPctceCvj6
	IIs4R7hONRPM72Rjb38NGxtWk4a4a30uKloQqxz0HSEGjVK5C0Wk
X-Gm-Gg: ASbGncuYxwL1761nl3GCJ5c+Vdiu30JPCt55HQ9EShE2/3qMqcWw8ox0A3Drovr0xjE
	6DwGdUdV78T2/1Yx0p6+QPeytMjz730HJBwduK1G/nV/pfSUkdX7dsZxXpPn/v73EfyBZpXo9p6
	/SypSAumYmC+rzdW6V5zN8Lxvm7ysF5MIcgG/oL7UuVIUHCoMWVxC3EmQxPX/HOJWyri6wukBux
	JopZrhoyO4kAu3UHUKbj2ZK1wg/Dy8fMEKjQvAxNRwqf1cFfXYFC+OlxTYm6tfesXVNFnWcdFof
	lIH3231UHYARB8g/3KDYOHcORrSA/wpDQ/IYW6wtEIS9usqSPBfOY8QjgzC7niimAotAJ0o7u6h
	kkw==
X-Google-Smtp-Source: AGHT+IGjjm4pg8koEpOg3Wt7gjyKmE0ps383FEzG1/M+bp1nFX3gl1QVl7IJM7lw6mxGcRX6KRHuLw==
X-Received: by 2002:a05:6512:2397:b0:549:8fd2:f7d5 with SMTP id 2adb3069b0e04-54d452cc1c8mr3890661e87.38.1744703848106;
        Tue, 15 Apr 2025 00:57:28 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d12357csm1353654e87.32.2025.04.15.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:57:27 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:57:25 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Message-ID: <Z_4RZdlV_OV1qLRj@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
 <c82085a7-c725-4a26-82c1-817dac508916@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PYgLrlyTIbn/KEQ5"
Content-Disposition: inline
In-Reply-To: <c82085a7-c725-4a26-82c1-817dac508916@kernel.org>


--PYgLrlyTIbn/KEQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Apr 15, 2025 at 09:22:30AM +0200, Krzysztof Kozlowski wrote:
> On 15/04/2025 07:58, Marcus Folkesson wrote:
> > +title: Sitronix ST7571 Display Controller
> > +
> > +maintainers:
> > +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> > +
> > +description:
> > +  Sitronix ST7571 is a driver and controller for 4-level gray
> > +  scale and monochrome dot matrix LCD panels.
> > +
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sitronix,st7571
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  sitronix,grayscale:
> > +    type: boolean
> > +    description:
> > +      Display supports 4-level grayscale.
>=20
> That's fully deducible from compatible, no? Or does it depend on actual
> panel, but then what else depends on the panel?

No it is not, the ST7571 is only the controller and some properties
depends on the connected LCD.

ST7571 supports both grayscale and monochrome LCDs but has no way to
know what is connected.

Other properties that depends on the LCD are:
panel-timing.hactive
panel-timing.vactive
panel-timing.vfront-porch

In the first revisons of the driver, I thought I could let the
grayscale and monochrome setting depends on which pixel format that
where used, but that was not the case.

>=20
> Best regards,
> Krzysztof


Best regards,
Marcus Folkesson

--PYgLrlyTIbn/KEQ5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf+EWAACgkQiIBOb1ld
UjLLOw//WG2bV9xFCnP3a9f5fnoJFj0raNigAXMxMp8tsoI6LxlREytKUA3m+OwA
jf1uys1VFfrnklHtOWe/Hy/LLNzXmNws/1lsPR2UHpWbnqPT9LLCjrWhgf/TGUno
pR0Vkm5t50wNi4XqDkTS0MEvWMM1xJc4iE37DH38b91OrkE8g+38cVH3BryuO4WK
zlSznROUSLqpegSWBfvUtHAmqSI6eCoKLJXGPlCz3ZAVRn+kXmFSSfaxNR46BzCn
PxSYe57JQcOWH/Vxue7pAHOPlb058haer4kQvjN1RG+hQgJqUN4HWBwWYiyO4mhb
GFqiqYz9exR4XDD3gLAJjmq3ZoGiaaNTDdkoJN/eTiMrSjMpBQs3aBn0or+3VOo8
W6QJEh9a9jKls4TxrSXJBg4WN6rHq8Rf5BNnllXfwKB84asCywG2hjP0beHKWQJf
MDq8NbiBC137+wxwBYYr6/O8VYptjs27C6628A0f6IoZis/ufdVE3bXUYobubwVW
gzIdqHN2qIeYv062BscRxexCElnm3tvxWhNkWIdxYlr9c3KEwaBXp2Wf5w7YdFCN
eLlsxlxZSoDVySfh5SHTaws6yS77PN6hSwR9ZCAjltFjtZEe2LJUfQCXDozLA9zf
ZHhhDRyEjE2Z6K3hLDAwu9U70nr4O+oxzME69mNbWHj9iM1EUwU=
=BMEH
-----END PGP SIGNATURE-----

--PYgLrlyTIbn/KEQ5--
