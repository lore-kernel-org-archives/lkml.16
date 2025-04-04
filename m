Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8931F3D52;
	Fri,  4 Apr 2025 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781440; cv=none; b=XCCIo4l878lo9Ge0DvIu8GKzz2+lAItj4qva6BnmYQs4ernDCsB2EcPSi2sMs2JJnvsvG3+H1B6qqUNC+cOaKxUZRvsRsPKJIx1UBZRlpKyaSawdV/7UDQoimzuv6j7/J1sAlMP1OKliv7d8SlsvOb3XC1SbGkASGIYeC094lqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781440; c=relaxed/simple;
	bh=DW/wqyJx+YCqSUOlSSVG9BIY+e2C7Nv89wJzyiuMFP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgWqXP/y2yJitQXgyjlGyESQ01VAH6+VTgB8LMx7NsrNHI9/9V4CyAk1OHJC9tKXYYtFC0ChWae/VUVrLFRRjQKsWX7Eslkc8jNwUAfofshcoY/YOl2d+EIZIlv7UlAfQVxY+b454HBsuvTWwdR2dioD4gWkhWfNPQEJIc8s2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trg3FmI6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trg3FmI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDDEC4CEDD;
	Fri,  4 Apr 2025 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781439;
	bh=DW/wqyJx+YCqSUOlSSVG9BIY+e2C7Nv89wJzyiuMFP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trg3FmI6Wtd7AGBLlZJiY+YpmOckUsjSwyLuGpkTgcrTcUlRrIqH9mUdL7RBI4kXA
	 wGg4FYp4SHCgXtuiFYAz2U407PN0c9OQNL+oTy/3PVdBqym1lQfeimc/809LwsN5pY
	 54uBZOaqQyUhkt+tCFuwE+JFaeywtH+MayBetTBPjHh0fyDdPZF/njcRQUbZQjvJJg
	 Wv0SlBsF5tQ4E40ku16kf7gNvizK9MQIGeDXzoPzpLRq6gEt7PqA3B4Kn22FoXXkxq
	 qq3lpDzU8KnGfpu0Hmj/EXVMpACBGSlYL9/umM9do0lebsPx5Be6NvbHxknxevlOBT
	 hu56/JLLiiNew==
Date: Fri, 4 Apr 2025 16:43:55 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] Support ROHM Scalable PMIC family
Message-ID: <20250404154355.GH372032@google.com>
References: <cover.1742802856.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1742802856.git.mazziesaccount@gmail.com>

On Mon, 24 Mar 2025, Matti Vaittinen wrote:

> Support ROHM BD96802, BD96805 and BD96806 PMICs
> 
> The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
> to the digital interface. Main difference is voltage tuning range.
> Supporting BD96805 with BD96801 drivers is mostly just a matter of being
> able to differentiate the PMICs (done based on the devicetree
> compatible) and then providing separate voltage tables.
> 
> The ROHM BD96802 [3] is a companion PMIC which is intended to be used to
> provide more capacity on systems where the BD96801 alone is not
> sufficient. Startup sequence of these PMICs can be synchronized in
> hardware level, and there seems to be some mechanisms which allow
> delivering the companion PMIC (BD96802) status to the main PMIC
> (BD96801/BD96805). This patch series does treat the companion PMIC(s) as
> individual PMICs and allows using them from software point of view as a
> stand alone ICs. From the digital point of view, the BD96802 is a subset
> of BD96801, providing only buck1 and buck2 regulators. Please see the
> data sheet
> 
> The ROHM BD96806 [4] is similar to the BD96802, except that it does also
> provide different voltage tuning ranges.
> 
> This series adds basic voltage monitoring and control as well as a
> watchdog support for these PMICs using the BD96801 drivers.
> 
> Similarly to the BD96801, these PMICs too have a few configurations
> which can only be done when the PMIC is in STBY state. Similarly to the
> BD96801, doing these configurations isn't supported by the driver. The
> original BD96801 RFC [5] driver should be able to cover those
> configurations, if modified to support these models.
> 
> [1]: ROHM BD96801 data sheet:
> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96801qxx-c-e.pdf
> [2]: ROHM BD96805 data sheet:
> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96805qxx-c-e.pdf
> [3]: ROHM BD96802 data sheet:
> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96802qxx-c-e.pdf
> [4]: ROHM BD96806 data sheet:
> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96806qxx-c-e.pdf
> [5]: Original BD96801 RFC:
> https://lore.kernel.org/all/cover.1712058690.git.mazziesaccount@gmail.com/
> 
> Revision history:
> 
> v1 => v2: MFD driver changes after review by Lee
>  - Use enum for chip type instead of picking the data directly from the
>    of_match_data.
>  - rename "chip data" variable 'cd' to more widely used 'ddata'.
>  link to v1:
>   https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/
> 
> ---
> 
> Matti Vaittinen (14):
>   dt-bindings: regulator: Add ROHM BD96802 PMIC
>   dt-bindings: mfd: Add ROHM BD96802 PMIC
>   dt-bindings: mfd: bd96801: Add ROHM BD96805
>   dt-bindings: mfd: bd96802: Add ROHM BD96806
>   mfd: rohm-bd96801: Add chip info
>   mfd: bd96801: Drop IC name from the regulator IRQ resources
>   regulator: bd96801: Drop IC name from the IRQ resources
>   mfd: rohm-bd96801: Support ROHM BD96802
>   regulator: bd96801: Support ROHM BD96802
>   mfd: bd96801: Support ROHM BD96805
>   regulator: bd96801: Support ROHM BD96805 PMIC
>   mfd: bd96801: Support ROHM BD96806
>   regulator: bd96801: Support ROHM BD96806 PMIC
>   MAINTAINERS: Add BD96802 specific header

Adding support for 3 new devices in one set!

You don't like making things easy for yourself (or us) do you!  =:-)

>  .../bindings/mfd/rohm,bd96801-pmic.yaml       |  10 +-
>  .../bindings/mfd/rohm,bd96802-pmic.yaml       | 101 ++++
>  .../regulator/rohm,bd96802-regulator.yaml     |  44 ++
>  MAINTAINERS                                   |   1 +
>  drivers/mfd/rohm-bd96801.c                    | 565 ++++++++++++++----
>  drivers/regulator/bd96801-regulator.c         | 447 ++++++++++++--
>  include/linux/mfd/rohm-bd96801.h              |   2 +
>  include/linux/mfd/rohm-bd96802.h              |  74 +++
>  include/linux/mfd/rohm-generic.h              |   3 +
>  9 files changed, 1065 insertions(+), 182 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.yaml
>  create mode 100644 include/linux/mfd/rohm-bd96802.h

The MFD stuff looks okay to me now.

Let me know when everything else is ready to go.

-- 
Lee Jones [李琼斯]
