Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2281F91F6;
	Fri, 11 Apr 2025 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384979; cv=none; b=EPQEkAOI1/y5iu7JZZvSty9KgvoMwSwvhUDWTrhccChnn1kXIchqb0nr4LS8CA4LhTZRklhLP9MzxZXVY2/G6k2qjdkRV7YAMpgrRMIuJlD82BKhF6HTiHgsDG4uNuGKe53TeC6L0c/4wp0zCTGTVC+HaDSuJIO+k2w+H1yBC2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384979; c=relaxed/simple;
	bh=5VH+Kw5uc61DtQBWYw5PyM1LgNGGDqiUvj3mP4vtzho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SN04HYjz/8A/1dO415FMe2y+PI7kr55fsIvukk+YeI+qrYmZMSVPawSiyeRFxEPn317p6NuSVsDpO/ABuHtFHZrl3wbxh2CZBxtgbOmtPZiZZ+jlVH78XfhxVdHuo/jMcJF7oAhUS0JUQP52pcwfW7I/OcZdRpw0AXWtaqL5MoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFF9wtRU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFF9wtRU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DF2C4CEE9;
	Fri, 11 Apr 2025 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384977;
	bh=5VH+Kw5uc61DtQBWYw5PyM1LgNGGDqiUvj3mP4vtzho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFF9wtRULrrQbnny31jmOpzUAXpNXxVUrIbTKxxkZqGvmmTdqSj91KKl6NkPMNhHc
	 ofnKGdxbM4RHHURb4B9U204zCVx1plMNxKPefqEYWeCd5fQ4ZT2VaiUNyCfrMvhY6W
	 BNnCA7cgDNLjfMIk0zMTEKGpCe+k0h8yXGwyZ38B4clA9A7buKm34VNETzfBJOR2gH
	 VyYG1on5KELT6IABs0XHhehlnP5fl4fUF3iiOSnPmhxxbWH3wU4EAttnWDBXVwln1K
	 JyAXDEMgbP65kUhawrPNSRo4ksd0PAxzd+aE8QBgjkCVtzVxvnaVtTLbS8RbnaaMrb
	 bejGVLTBzQdoQ==
Date: Fri, 11 Apr 2025 10:22:56 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Message-ID: <20250411152256.GA3270148-robh@kernel.org>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
 <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408154236.49421-6-laurentiumihalcea111@gmail.com>

On Tue, Apr 08, 2025 at 11:42:35AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 39 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..b816cb6ee9d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX8MP_AIPSTZ_MASTER 0x0
> +#define IMX8MP_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP (1 << 0)
> +#define IMX8MP_AIPSTZ_WP (1 << 1)
> +#define IMX8MP_AIPSTZ_SP (1 << 2)
> +#define IMX8MP_AIPSTZ_BW (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
> +
> +/* helper macros */
> +#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL					\
> +	IMX8MP_AIPSTZ_MASTER						\
> +	IMX8MP_AIPSTZ_HIFI4						\
> +	(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)

Drop this. 1 define per value. Combining these makes the .dts look 
wrong.

Rob
