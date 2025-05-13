Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6124C67B;
	Tue, 13 May 2025 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136200; cv=pass; b=grnlNLIlvyH8nNPNosFDnEenmTnFvrnde8xYcqu0pLpTY/qqgZpScqAXpR5tXwefiFHc+3H4i/3OuIl/inx+7GshO13DmYN9JdNSoq1QM7MU+3unfEw1EIXC5kcLNWhzt4RDxVXdr1JlJ4C6fR6dicbVMNmeXKYE9YIGQ+xGwnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136200; c=relaxed/simple;
	bh=f8tl4Fxf9bt+uosH7h+NE/cRfT43y8uNqF86p1OwRIg=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=pPJ5YjflmLBG+i1jyhzuE+ix6R6CvZdtfCw+pcH/R6fSqUovm5YSVgmrBbG4xb70ggVC0s2m2hSsl9bOedsukMsv2WbV4KCm5bGVR5XJ0SsUiDEx+tQvLe9dizgetJN+fqw8YDDuuu0cbms4Aa6Nus8GBIFNsVxDHZZQsMf/6jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=XGZsnQSz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="XGZsnQSz"
ARC-Seal: i=1; a=rsa-sha256; t=1747136170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mdo1/BbTWQ1VzvRxcvHt/6rj187KoYp/ifpK3qNUd9i0DCxoviSF3vQ2XxsxxsgCM2ewJqJhw2xbyuLOdUhMHRm4U2rIb5PeC8WMXOZK6suQyZHvDIm4cVc5jZAk/OVftv9T14Ld7uqNwkC3V+3TPwMspjE5l90htwVgpS3Tbqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747136170; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vfj5Z8mlPycK5Gnm8O4QEUXehENTGHBpLm0BTWNLfWo=; 
	b=ehut8gKAmpkQnIKG/d6vR6cBQigXYu3gNmU+KiHs2q5R8lVYhIkQT1o6GIJ8E4tPbL0o+NgTGPDGLNEo+djMrBIU4BKQ0ajPWp2mvPkpGH5FBR8YGHe5RUNBVk/4Eyu6aafitOG3vwiwavWp0P9W1K8Rv15ko/XHrxB9pJT3yX4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747136170;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vfj5Z8mlPycK5Gnm8O4QEUXehENTGHBpLm0BTWNLfWo=;
	b=XGZsnQSzozd7clRgB2OXymPbI/TzS9xGy/PYrtogaSRt3Mp3lm/ly6tfOuzm3cwO
	4c/B9+uOAOsjxDHKH/6dy74XjJ+fKV7ifFu5ZElKcv/YsyzfVPTX+/usOUA94yLvzk9
	oi2v8S+QOa0F1ef4ZtfBwE9lXnSulNFNy5EU7m/w=
Received: by mx.zohomail.com with SMTPS id 1747136165651670.6216762319889;
	Tue, 13 May 2025 04:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>
In-Reply-To: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Junhui Liu" <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v3 0/2] reset: canaan: add Kendryte K230 reset support
Message-ID: <183f13147f01e0e8.b223d1615fe9988e.865998746eb323d6@Jude-Air.local>
Date: Tue, 13 May 2025 11:35:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Philipp,

On 07/05/2025 21:25, Junhui Liu wrote:
> This patch series add reset controller support for the Canaan Kendryte
> K230 SoC.
>=20
> Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
> type was tested by reseting the submodule and checking the reset
> register value[1]. The CPU reset type was tested by a temporary rproc
> driver[2][3].
>=20
> link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1=
]
> link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
> link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]
>=20
> ---
> Changes in v3:
> - Update copyright/license in driver and bindings headers
> - Rename HS/LS to HISYS/LOSYS in DT bindings
> - Add reset-timing notes at the top of reset-k230.c
> - Replace long udelay(200) to fsleep(200) for HW_DONE paths
> - Remove rstc->dev, store device in rstc->rcdev.dev
> - Link to v2: https://lore.kernel.org/r/20250420-k230-reset-v2-0-f1b4a016e=
438@pigmoral.tech
>=20
> Changes in v2:
> - Turn to_k230_rst from macro to inline function
> - Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
> - Remove assert and deassert operations for self-clearing reset types,
>   only reserve the reset operation
> - Add delay to accommodate the reset time
> - Remove blank line inside read-modify-write operations
> - Remove redundant default case in enum switch
> - Update copyright dates and my email address
> - Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc1198=
9eb@outlook.com
>=20
> ---
> Junhui Liu (2):
>       dt-bindings: reset: add support for canaan,k230-rst
>       reset: canaan: add reset driver for Kendryte K230
>=20
>  .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
>  drivers/reset/Kconfig                              |   9 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-k230.c                         | 371 ++++++++++++++++=
+++++
>  include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
>  5 files changed, 510 insertions(+)
> ---
> base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
> change-id: 20250404-k230-reset-32987c6f0ed5
>=20
> Best regards,

I think this series is good to go, can you pick it and queue for 6.16?

Thanks!

--=20
Best regards,
Junhui Liu
