Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F781DE4F3;
	Tue, 29 Apr 2025 14:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937860; cv=none; b=u8ZKBitFHSq5KCNVI+Tb9AE1IvutLc5RGZJ6gWAWR8O9Tz3WTdwMjZ/Ifc4cg9Eg1ftSDZRO5DXrhDB8AjH6f14GW/j4WImubGW8EYN/9Ks6pEjmarEY0s00vJuASJhGb4yCYCT1yAHRWd7ZdlknfpaXTItV0lngP8G5quoYXc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937860; c=relaxed/simple;
	bh=4rr0S3mSjoui4D8DbAX2wTbORXf1cAmtg5M9HmjHuhU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZlSpD4OnlVJkyVyVggvY6BTqISMWEehiBePo01eIclDgA/fsR2TZIB31TdchAb82EYZO7PpA8aLWC4cQGB/elpYJSb84T05VB9QTBBH6GxtKFopI4WflEOmO+icCn3xc4ffopoqJP8XIyIhwIdwtDp1BQlCKj2zuW9ByIbllDwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3YUk0Ov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3YUk0Ov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C7C4CEE3;
	Tue, 29 Apr 2025 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937860;
	bh=4rr0S3mSjoui4D8DbAX2wTbORXf1cAmtg5M9HmjHuhU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=d3YUk0Ov4iLTp8IvzNdV/ZNp8XRfU0tpb5oO11Ch7TeqYX980y0eKGMK/tSkiZdHG
	 vKKfoEdkR1s+NYjN7a+AJ5LIM2s8BnXPc1k9zkOx3UAgsn7GdLXMskG8pcyMg6PZjr
	 hnW+l0awaOZdLhL+FF6sOcWJBst8YDQPRSyQW//eEcvnLFRkEHcFbRJrI4NtMZ4/5s
	 9oXWECSmFA4F6IcyherLCLXt/f8gFvTWDlZX+lIkLCg2rPK6y/rBhahA2HfK5II7y2
	 TITnqai63Vv44JqE0pz38xD3AqDqqBaPCzJM4ILcDM3e08c2AK0fAgXs+F+HIJjvhE
	 S2Zreml59gaJw==
Date: Tue, 29 Apr 2025 09:44:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
References: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
Message-Id: <174593770361.4057747.4332961101566967821.robh@kernel.org>
Subject: Re: [PATCH v9 0/3] arm64: dts: st: Add SPI NOR support for
 stm32mp257f-ev1


On Mon, 28 Apr 2025 10:40:20 +0200, Patrice Chotard wrote:
> Add SPI NOR support for stm32mp257f-ev1 board by adding:
>   _ Octo memory Manager node in stm32mp251.dtsi
>   _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>   _ Add SPI NOR support for stm32mp257f-ev1.dts
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v9:
>   - split patchset by susbsystem, current one include only DTS related
>     patches.
>   - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> 
> ---
> Patrice Chotard (3):
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> 
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
>  3 files changed, 137 insertions(+)
> ---
> base-commit: 65954899a157832f68536b488194cf698248a26e
> change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52
> 
> Best regards,
> --
> Patrice Chotard <patrice.chotard@foss.st.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 65954899a157832f68536b488194cf698248a26e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']





