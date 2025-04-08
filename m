Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20B263C66;
	Tue,  8 Apr 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101636; cv=none; b=abMgRvykuRfDJk8Kd1TT6OQvmglcx8Di4an8vvId0AnwQZ09BB38uvj8UbAaBxYaaZ3WZ4tDMjVrq7KvJjN/doX2hC/1Ah4Ch7cYPh5mj8f7lUZoanwjFdYVz9kvZwxJO0Npmezy0V/74Md1Iwpv71N0vAcMuJv0nRkjVgCiJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101636; c=relaxed/simple;
	bh=RbtSh5sGcPvhzBQmhjuXpMcZI+MVyld1H8J7Yf2U8Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ir1zo+CM69Zu4iSAGzgvKnl8Ry/GVNwkgr7o/9h4JnsgpVIwMeNMBcXRp9+qQNkTWfzOiJu1l/INaIacw/WFnC5fcy4+fuJix/Nx13Y4TIw9FPdHsnqdED091lZB+I7aNiccVEgBV2VlVKLwcMrxTnZaTL4umKmD/d5W5boJAbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcAuaWqD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcAuaWqD"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5867122e87.3;
        Tue, 08 Apr 2025 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101633; x=1744706433; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUna0Z6KWTp1ccA53qtQ/qFbmJnk6lgSwviDmunYxHI=;
        b=QcAuaWqDIneOb1dMLN7YmDN13iPQeyQ1IXJZvGs8D55ML0SsAeMV8pfiIJTZjOEjLO
         h3cTxgmbJKWPPVAdgaK6PBaDRmqW2Y+hn8RVDugwiPmQzw+BpO7FfbkFEl/jOqPeba3/
         MIjPrHL0hQovqiU8pf9tfkwzEymvAEHrSjPdenT8xhyNgQONpD6biHlOoh67dgEUbaNa
         QpmSJPYtmeNPrie2ma0OrLlKqAlgDHaegHkNlkmDln1w4U3x4Lh9tu/mkuSdHAGrOVDi
         lEoX1bCgBsslZK1LKIve1AXBpbu8KHCYQOdS33stqO6JIITIIKnVYDkm3gb2fjsjKyZh
         sR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101633; x=1744706433;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUna0Z6KWTp1ccA53qtQ/qFbmJnk6lgSwviDmunYxHI=;
        b=UF0j0tzBX6c1NE4fVcGXPNKow2ofRFbDY7U51N4SwS4VE0Utz6DKaFLZfod865JkEE
         mnazDaq+YB9lsNQhdvbHAJNUJ5sPYv8Glp4eoD+5YuSMK6QfU0QVYiVNsQQsdJFThDUO
         RfcH9lCVx65q4a8ZeEZvdvBlLpD2+f+8khiprCbXOs6dvE+YxvKZFqKWIXR8VYhTS2W5
         16hiV4gRbdMVWeCjvX+bL+yQVgsn0kliHREyxKKf8KEPVpGJHcCf8QZRd8gt6/SWeKEo
         1ff7P0zZJXvpsRd/0TPjUOyDtOZymVmpXDkDpk6SzAqKOj+1HQA9rjMfuh0hehIBGR01
         GDsA==
X-Forwarded-Encrypted: i=1; AJvYcCU+YtVGYSL370xH58kMckdAHS0cucSaX8H2cjgICVF+iXeXkYmDR2mCt1DqlwtsN+tk5sQV+Rnk/ZSf@vger.kernel.org, AJvYcCXLgf/tKtLVf6VQJGirdHYyC1MMRtm1lsQnTEw+ux6PJbcui15+xLscO/JYugWa0L153Dees37s3dRSd045@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrNwNqgW11RKt8AIq6wNB278IxCxz/VPhKaVAHt6biSBBx43a
	q09BvRTbedrqPjD5IphcRy8gqCTeTaNWaU0sBKmeWB2ubWV12B0NRMvB2Q==
X-Gm-Gg: ASbGncuzaGx5LWndpmLd/7r2OtCGP6KrpkYkwVkMv3pQpMgLuvHe3/6eak5KWtCS/IW
	IxD5MmKSAXO7WnuAIppwIihP9iGOdqtIsoSLsix6GbmT6/fELo8aw1tQb+wCSEgMuEmwejKBN4s
	69971VfbDXFh3/YXtnT3jrcmU2KPQ6N7TAGWqyboxxpiIrjWVXrFgrY9AR6FXEvhXRuprs4dj80
	Ibkjr1MmxrGHD10wxQMj5W6tYHg2GY6fS+YdTU0WnrCt0KAxYVrBxwz/1EyTVCFtgVU9ATBweBR
	zlpXTzDs/H6f/qwHioLNwb9MYAOceyVICg0UvMk5rdG9prg=
X-Google-Smtp-Source: AGHT+IGuAD7+Pt0U81DsE6u3op16cOXzipAjTK4IKtEVL42pAIE64p9u2uh3AUiuv3LsZi94Jh0IHg==
X-Received: by 2002:a05:6512:39c7:b0:545:93b:30bf with SMTP id 2adb3069b0e04-54c29836d15mr3301146e87.41.1744101632611;
        Tue, 08 Apr 2025 01:40:32 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65db99sm1473970e87.207.2025.04.08.01.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:40:31 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:40:24 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/14] Support ROHM Scalable PMIC family
Message-ID: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4BfzcElUxBtkbPf3"
Content-Disposition: inline


--4BfzcElUxBtkbPf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD96802, BD96805 and BD96806 PMICs

The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
to the digital interface. Main difference is voltage tuning range.
Supporting BD96805 with BD96801 drivers is mostly just a matter of being
able to differentiate the PMICs (done based on the devicetree
compatible) and then providing separate voltage tables.

The ROHM BD96802 [3] is a companion PMIC which is intended to be used to
provide more capacity on systems where the BD96801 alone is not
sufficient. Startup sequence of these PMICs can be synchronized in
hardware level, and there seems to be some mechanisms which allow
delivering the companion PMIC (BD96802) status to the main PMIC
(BD96801/BD96805). This patch series does treat the companion PMIC(s) as
individual PMICs and allows using them from software point of view as a
stand alone ICs. From the digital point of view, the BD96802 is a subset
of BD96801, providing only buck1 and buck2 regulators. Please see the
data sheet

The ROHM BD96806 [4] is similar to the BD96802, except that it does also
provide different voltage tuning ranges.

This series adds basic voltage monitoring and control as well as a
watchdog support for these PMICs using the BD96801 drivers.

Similarly to the BD96801, these PMICs too have a few configurations
which can only be done when the PMIC is in STBY state. Similarly to the
BD96801, doing these configurations isn't supported by the driver. The
original BD96801 RFC [5] driver should be able to cover those
configurations, if modified to support these models.

[1]: ROHM BD96801 data sheet:
https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_re=
gulator_system/product_brief_bd96801qxx-c-e.pdf
[2]: ROHM BD96805 data sheet:
https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_re=
gulator_system/product_brief_bd96805qxx-c-e.pdf
[3]: ROHM BD96802 data sheet:
https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_re=
gulator_system/product_brief_bd96802qxx-c-e.pdf
[4]: ROHM BD96806 data sheet:
https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_re=
gulator_system/product_brief_bd96806qxx-c-e.pdf
[5]: Original BD96801 RFC:
https://lore.kernel.org/all/cover.1712058690.git.mazziesaccount@gmail.com/

Revision history:
v2 =3D> v3:
 - Fix BD96806 voltages
 - Use defines for voltages to ease spotting (copy-paste) errors in
   regulator descs
 - Use lowercase node names in the BD96802 dt-binding
v1 =3D> v2: MFD driver changes after review by Lee
 - Use enum for chip type instead of picking the data directly from the
   of_match_data.
 - rename "chip data" variable 'cd' to more widely used 'ddata'.
 link to v1:
  https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/


Matti Vaittinen (14):
  dt-bindings: regulator: Add ROHM BD96802 PMIC
  dt-bindings: mfd: Add ROHM BD96802 PMIC
  dt-bindings: mfd: bd96801: Add ROHM BD96805
  dt-bindings: mfd: bd96802: Add ROHM BD96806
  mfd: rohm-bd96801: Add chip info
  mfd: bd96801: Drop IC name from the regulator IRQ resources
  regulator: bd96801: Drop IC name from the IRQ resources
  mfd: rohm-bd96801: Support ROHM BD96802
  regulator: bd96801: Support ROHM BD96802
  mfd: bd96801: Support ROHM BD96805
  regulator: bd96801: Support ROHM BD96805 PMIC
  mfd: bd96801: Support ROHM BD96806
  regulator: bd96801: Support ROHM BD96806 PMIC
  MAINTAINERS: Add BD96802 specific header

 .../bindings/mfd/rohm,bd96801-pmic.yaml       |  10 +-
 .../bindings/mfd/rohm,bd96802-pmic.yaml       | 101 ++++
 .../regulator/rohm,bd96802-regulator.yaml     |  44 ++
 MAINTAINERS                                   |   1 +
 drivers/mfd/rohm-bd96801.c                    | 565 ++++++++++++++----
 drivers/regulator/bd96801-regulator.c         | 455 ++++++++++++--
 include/linux/mfd/rohm-bd96801.h              |   2 +
 include/linux/mfd/rohm-bd96802.h              |  74 +++
 include/linux/mfd/rohm-generic.h              |   3 +
 9 files changed, 1073 insertions(+), 182 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9680=
2-regulator.yaml
 create mode 100644 include/linux/mfd/rohm-bd96802.h


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--=20
2.49.0


--4BfzcElUxBtkbPf3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04PUACgkQeFA3/03a
ocWPMQf/Yg8ES1jx9tfsSTj2zBIVa4pucLMjnroA65Nl0q7YZ8afSk5MKhwOamOw
AVQAg/myYqMudHgJWm9/KLZBowj7ky7in4pbuhtMVV6Fs4AaodTSs/r6eJfIENrQ
nbAjKYNFlched0HatklVm4F/prLb6pYQI4WJJFPlH6QgAXm9gQIxnZvkN9mqQvNC
q/hMZQK/iFmQEO8e/2vSaSzQPheECGSWQt9pOqQOQn925tWmbgLSxmwdw0ebdL+E
bBP8bkf/k9OEiy4OMpq4SFhFIVAsgO90yQjZ7wnzqUQHrvYrPK2wu7kbkQX/AC/K
5xQCkWvUOKOno98N0o6Gn+vxgsikCQ==
=GRyv
-----END PGP SIGNATURE-----

--4BfzcElUxBtkbPf3--
