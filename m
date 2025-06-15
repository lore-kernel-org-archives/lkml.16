Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4927BF99;
	Sun, 15 Jun 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001942; cv=none; b=C45jYlMA5/LzajBZP/UPK7/2cXYtkM5dkWrGmOfO1LrsgYiZVOq84XKq30OkLv9nrf61D5l/esalTSghGntFb4ay5bHsN5fU0CN0wLxAOSFsUitPn4hBhee4peLSaGgy4dankcGjAflrwKyDwZ1Khu3c4n8Zl7BQtGSYhOynZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001942; c=relaxed/simple;
	bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCgwJmknyzs4xaUJty23mcjo5lkaR6sPpxhbl+ktOjiZOJqB9v9xVyGck4KiALq0KHvJNXc3sFzhq8v3uVQPrPG4M2WVEJbrR9a+/33rCeHdn8Fsgw4GeEv5qJ4LjADHW8ODGKt3NnTcDSx/tuTsT7UIbIdZEjmpiZ6RM+e4djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hia1tjnf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hia1tjnf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so30221185e9.3;
        Sun, 15 Jun 2025 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001939; x=1750606739; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
        b=hia1tjnfFOKqOLC3n5Oh8ocMx8O29YY9O04g5MgcgmdMA1vMmTrfCdtKckpWSXDIZx
         mKDzbNJLM7IiJoeQmjvJSUzqctGYsVSVlBAWlOetTp9RBj9YpRchr50WXVcXCOBKw6AC
         9TGAI4uVptAAvGbvna9ych7jN4Ra0ila73HDXmYRPhbkNUjpm2PjE8o/8TV6ltBm2njw
         8eDyjW4u5+R+tzXHeyIe3I9y0KfWBOwPyzSeGoxyBi2/4YtlinrAzG7Dk/4O92z3iWxS
         dK57HwdRQ1Vbdl5Gq62Mkg7JNOIrTuTHzGnrKfvQDzt55PNqsz7UVoyc85tfMgKEmaIY
         Inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001939; x=1750606739;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rME222jHVNJXTiRKF33r0lWMTw33bee8wdcsXHC+a1s=;
        b=d6zZLjrach9blDH2WsFiURtMngg7Yz0iAesxljoowhUnwQFtqK8yS7zZV7PiqIYvmM
         KDnlUWtVp9gNWpq37MkjDP/EM1VIc4F1rTgWtO7kkjDJAksVJkSpobNhIf5aa88wGgFd
         UlJAzbiDUc66F4twXPhqEPHKlQSZJLzLVPFV2ouq4KJ/hFvKzt2ZdXj9oBinlfJXFHe5
         bKGDLwBdbYGMKyhrmFgdFjPgHh7oapWZxRMX5nZ+Pb9ajPZq3lH9JQZ9tA3vJ/dLTFLY
         VSEalHXB6aiDSt/yIpxf2ypSQM3HpI5hQCpFat7iWJmHEp0jA27vDpwh1dXJoIklWXuc
         /KuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2MK+8ffVjLmfQVqDzIbTxbO9iFq3g9Cmr8kXCJWD/bw82fJM+mU9eGOCQtB0ye40id1oj+zK6rWLfhBgb@vger.kernel.org, AJvYcCXEPb2GowOjp8+w/dePTI/LC+LyqO5VsRjIXM4UUS8vdr1y5obFR7oTzlp2UVGBqO39w5qY0OhJ+PJn@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGt995NqR8QQUim+rYeK8BDFiTTYyTsRQ/x074Mqr8qUlECnD
	5gk/C1eEPY2NMzmY4A6G0oUJ6JQhTngc5QvbhEMhvJ1EnHWqR5bDf4/T
X-Gm-Gg: ASbGncu4r/qu+EJvqmdFptGR67OLjZnSjEGP7GyDK2rXy0VxObyai0lqKPhVdw/nr+O
	K6NorBZpP3dJhFHGeHcXKSt2nUMaT/k0Upj0K6xu5Cu+651GTyqx8znFAvVC9lXuSlf+2/KJVv/
	7KWd56RI6yu9blyOMzwR2va/raylPkXRWpg3Y5nSRJjQepBEPS9fy44R4UbSG0GCFHJ+Hrwja29
	PV9975cnfxLkgsiFKfjxQWOmawrDCxCgFuWU6AzPcLM1EuoI2zrB0jLgrrkHde9SBm0GDt7BDXA
	Bx9Bp7rxCrJCpigg8+yLxy96BHXjN15ZAy42WFpvCaxAR67uiJ7/ro32Zgi8AF1/8DxR9l7Q3u2
	Ks9kBN+HDUNxw/TDH
X-Google-Smtp-Source: AGHT+IFaaughF501wrIicIPdZSmtM/WV0+01/gyRTwtKr7hDVNcSWz3eVWkWINX+wq9hJITrW3t+2g==
X-Received: by 2002:a05:6000:2883:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a572e82213mr5614719f8f.27.1750001938625;
        Sun, 15 Jun 2025 08:38:58 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5405asm8229858f8f.13.2025.06.15.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:58 -0700 (PDT)
Message-ID: <3b9237628547fdaa65f524204b79176e5461cc71.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I	 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:10 +0200
In-Reply-To: <20250611081804.1196397-3-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
	 <20250611081804.1196397-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 16:18 +0800, Inochi Amaoto wrote:
> Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
> this driver does not support OTG mode as lack of document.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/phy/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/phy/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/phy/sophgo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++
> =C2=A0drivers/phy/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/phy/sophgo/phy-cv1800-usb2.c | 222 ++++++++++++++++++++++++=
+++
> =C2=A05 files changed, 245 insertions(+)
> =C2=A0create mode 100644 drivers/phy/sophgo/Kconfig
> =C2=A0create mode 100644 drivers/phy/sophgo/Makefile
> =C2=A0create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--=20
Alexander Sverdlin.
