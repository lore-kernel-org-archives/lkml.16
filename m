Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C921C5F18;
	Wed, 30 Apr 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026359; cv=none; b=TobpOkTgKLYwFFqGeFXt7Oh7FcI6GIiGatSK9zA5HC81tP158y+YcdgYRYXmAQ/qlALXf/VPcuKa337+gY8boPwEPL5vlR+BcYDUq0OTgHLJrlCd+t6UVlwa2fdZau9as7UdC/O7DbzlrtTIY0KTyT1cDrq3HwEceNjzXQ7Zy9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026359; c=relaxed/simple;
	bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAobTu0t4IZZFhPNzr42UQeFrKbQQ+bMxX8s4p6wHLas/ugTRiwV8VQw79BNBavpQB0ma3gc+SQyA92w2FgfGAp53QuWCIveraaGdL10qcgJRsGK984XmkOfY7gPQKadXsKlW3Kq4D+sJWWkSQVqyjcoj3/yXWcJH7iCVX1JlGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctbGyw+7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctbGyw+7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so4794722f8f.0;
        Wed, 30 Apr 2025 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026356; x=1746631156; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=ctbGyw+7nupI3tgzwivmECoAZ+GE0xPKNPCLvC8uY//MdkXajv4YKFluT2ni7aWRbm
         26vhEk0zTSpcxDnEJZQYCV/0l5b8QI5EaMUg8owqxQ0QA1KwfLHa4RxnAdAUaXENwlmA
         2GXvP2wUpyLSn0jMUPxapCQ9ijpnE4uW2fuLbtGDZWbJyM9p9tz9nEQeO/zvgZLu3voG
         0WhyOi3nNGIoReuyNxtIqsLkSW3HDlwwdhfNHyJJj66gwfOBPLKDk1t+aA9OWs5JxE3L
         wfin4l2xJZO52IF3mek02CrrQbj3l3UqmTrZwwkDNtuKQb5lbY8Hmbvb4R/FdOfRI3tP
         0qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026356; x=1746631156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=Kj8gLglSKyjM7NjqrV6UIDwjFPwFYXekv4yvXm2OXJqTH5PGS2mexHIyjRT9ILRRX3
         3OQJ2iSJlm9fKZf0yM9PaxB8Y4RtRenAfGDx2H0oeEIYeYnTklRWwayOze7wAWVpKNFo
         HtgmYMrdnYebOLJcWtwFcn6scY6so9Bf0reVAIutH0Ozp0Cn/uuR5Eep/EhO+q5L//tV
         uIqbq3r9haeTO8uutXgTxVi+ZngdkEsgSs+vwgHwNeEj0ROP4oakepbanvLom5kNtJAq
         YQxau+Xs+S2pMr0WcUfRQBk/Czon9ryGpM/3rTfIj2dOADnLEvOcPpDazO/AvqFH8lbM
         0lIw==
X-Forwarded-Encrypted: i=1; AJvYcCVZmdh8p+NeN93NXcdbS4F3iH/jYb+ep50inzGMJtMkxEfSJAt0UgWHyAEtMocWw3Uc2QFebeqbVrdEgwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJbYNNrcgYzCmfE3HRlIuRbOqmMbLs7V4Kc77t5vQg0/Cns2d
	++EE+LA+ZkqLQ/UODWoegccDy+W8BlMnDdrZrVa5OPllOwXSEvfR
X-Gm-Gg: ASbGncuClhLO3eLFx8CwByC+lRMiP5XrBkMMnQZko8XxcWlMq3O/Hq9+IZTL6dPd92S
	sHrmJEj2VVcg6t5aMEJIy9c0KZNjidHZf+YxRmNzCr6bp6RJWZOXKzthLx8YBDjouvoSUJIJD/v
	Mxf2rztNQIgUgVd7mLo0J04THirXol0niFPj7tAyQiDN+9thNY+88nmhDgZgsZ0lLxnpVqPBByT
	TEhTQdYd+xgc8/HXvUuewBpgUuTupLydt01X/x2Wo0TTQQukWxw1cBqUb5RWFt9kPzFGUbobPvS
	vSoPndJRap4O5yKDIVCaYXgMDXDdwq5+B2xTA4weCiRIYU2H5i+x4IPz/CYyP7QcsZ0qJP0=
X-Google-Smtp-Source: AGHT+IFmefUVJ6/gagwWms/2NhJFqSEeEmwPNox/ehYzux4BtgClLHXr43p5sjL1gtcn7wjV25ZOiw==
X-Received: by 2002:a5d:588f:0:b0:3a0:8070:8af8 with SMTP id ffacd0b85a97d-3a08ff3755dmr2980301f8f.18.1746026355424;
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca42cdsm17020431f8f.22.2025.04.30.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Message-ID: <94f4bbd9dbf4da9c056f90dff3028e45a659c8ac.camel@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device
 into soc dtsi file
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Chen Wang	 <unicorn_wang@outlook.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>,  Longbin Li <looong.bin@gmail.com>
Date: Wed, 30 Apr 2025 17:19:16 +0200
In-Reply-To: <20250430012654.235830-2-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-2-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-04-30 at 09:26 +0800, Inochi Amaoto wrote:
> Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
> some basic peripherals, like clock, pinctrl, clint and plint, are
> not shared. These are caused by not only historical reason (plic,
> clint), but also the fact the device is not the same (clock, pinctrl).
>=20
> It is good to override device compatible when the soc number is small,
> but now it is a burden for maintenance, and it is kind of annoyed to
> explain why using override. So it is time to move this out of the
> common peripheral header.
>=20
> Move all soc related peripherla device from common peripheral header
> to the soc specific header to get rid of most compatible override.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++-----=
---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++-----=
---
> =C2=A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0 | 22 --------------
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0 | 38 +++++++++++++++++=
--------
> =C2=A04 files changed, 78 insertions(+), 58 deletions(-)

--=20
Alexander Sverdlin.
