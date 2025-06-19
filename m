Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455A18E02A;
	Thu, 19 Jun 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344288; cv=none; b=s6y4EVhFL4fkMuUGW7jvkUq2FrVcLfHzTUjSbkCI9xpkAdh1A9z1Ao/UhiXtyhYxxo7ihAG1P2tQR4izCmnys6SqTMQAkfnPuxwhWC8ao6nCb37QmZ5usQQbdi1TitnAo8miN5GruGcwFc9eq9tlU8LPpRvG3uuT586entXuSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344288; c=relaxed/simple;
	bh=2SBtOHAa8PXv7Oh4DwBgBrVlkUpWnuwLqFJrzHmdOjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok3yIdJXFvm7kp0vgfHXhTTm81fvI1AJ1j1BUEkwn7xU4SjAu9LjtE25eRe6j9urRvdEXQcrfVBwQNwla8aKViWTmve2JWAH3iN4LcoHGOxrApd35tHx/PBsgqVnvsRM//zEAIZZwui+j7SJoYkTpsEQP1LKPYG44UdygtzX5lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6Svpu2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6Svpu2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A739DC4CEEA;
	Thu, 19 Jun 2025 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344287;
	bh=2SBtOHAa8PXv7Oh4DwBgBrVlkUpWnuwLqFJrzHmdOjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6Svpu2u9Rw1VPl1lBofruzEIlctenWb1IdyXMqbQNzFpmtVSulfTcXzYrPE0qye9
	 JVPNUkToJZnrW++nJ0AZHENFTgEt1OSy8Mg9edW04BMuWf4p17L7zLVK9U/uSzKUd0
	 1iYfW/NZUNhra8w8czOQBUrQ2L68Y/qohjjPbpqE+SDKOA8SeAw2K3k0gsQEc7deSI
	 eIUlu7miJrsFEVPWDyV7di+KE8hBSOavlzAJREcnUiB+9/5kUEOSq3GJdJJGrBKNiT
	 iV/SlC7L1ZyKvTmiuZJjrTK1NGLkWmxLZMvDJsDleBcSo9r+czNv1hbx1TZz+RAcAj
	 /Sb/w87Na1dfw==
Date: Thu, 19 Jun 2025 15:44:42 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	broonie@kernel.org, lgirdwood@gmail.com, wangruikang@iscas.ac.cn,
	dlan@gentoo.org, troymitchell988@gmail.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250619144442.GI795775@google.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
 <20250619135151.3206258-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619135151.3206258-3-elder@riscstar.com>

On Thu, 19 Jun 2025, Alex Elder wrote:

> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
> but the driver is structured to allow support for others to be added.
> 
> The P1 PMIC is controlled by I2C, and is normally implemented with the
> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> regulators.  It also implements a switch, watchdog timer, real-time clock,
> and more, but initially we will only support its regulators.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Use module_i2c_driver()
>     - Expanded Kconfig module help text
>     - Add MODULE_ALIAS(), and define and use DRV_NAME
> 
>  drivers/mfd/Kconfig         | 13 ++++++
>  drivers/mfd/Makefile        |  1 +
>  drivers/mfd/spacemit-pmic.c | 83 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 drivers/mfd/spacemit-pmic.c

All comments fro v1 are still relevant.

-- 
Lee Jones [李琼斯]
