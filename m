Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DB1DF99C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123931; cv=none; b=gNGAD4/BvPkWdssLFETIqQzxHRHkLNiPXRDB6xJQTTFTORP2VbEzv1Dwnk9zzIEwGAzBGiXGDRK54rEGZjYNFHlWIiTHI0lXgbDskhcqWJE0U+h/hN81xuf58dO4TLlrGZyHVmUiza6dJTUX/S2OxpQONWwOF/oVj/LL/7SR5+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123931; c=relaxed/simple;
	bh=dkh/98yD4kXhtEKPe+HK8ikqP0ZY141EiqYtwVGcXm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uX3Jc2rVDD3gAmr80Tdcwm60YU4BNcHOxJmXWuBfuu48TCeho/GgcpeDCrBh2LqnGMev/M+w0zfj3RCvhtpCbOrM3TS9x7JM8x1Y3a9bf8YU8+B6Rn/mVXNsMoMaEUoL65o92YVyXDi+JhRXBmA/vNk2oFxzGuBiPQ96GkmOrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW+18Ek3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW+18Ek3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DD4C4CEE5;
	Tue,  8 Apr 2025 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744123930;
	bh=dkh/98yD4kXhtEKPe+HK8ikqP0ZY141EiqYtwVGcXm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PW+18Ek3XAbcHQkGvhfLQ5tsAJ/zpAlfljO9hdR3BuLaI0Q2JH6C997h2WKNN+2MQ
	 xQ3Ejq06d3SZorw44irBRrDN0wKSEeCxVr91B8Z6Z8xMrwbVLBsZB5OZwgO9aq5SVI
	 ekMO6gMB+l6ZnrnXyvTsJdQ011xANihVY3an3fDWU8HIIRmtvXvsn/EWxM0VaOqe0m
	 WNSIhJkzlf4esKK7pbv9rWEcO7HFazR1ZbOrFWuhuqhyJTX7XIIU+hC9UER7HJpG80
	 49LWg2MRjAWDkT7KNXr5bkmt4l750hZyjrvrYj9CpTuV6zMIs3Prx7BA75ofD88G0y
	 6H9tKtSy2Fn2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: macronix: Add fixups for MX25L3255E
In-Reply-To: <20250407075400.1113177-4-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-4-linchengming884@gmail.com>
Date: Tue, 08 Apr 2025 14:52:07 +0000
Message-ID: <mafs0semipuy0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 07 2025, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> SFDP of MX25L3255E is JESD216, which does not include the Quad
> Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> Therefore, it is necessary to correct this setting by late_init.
>
> In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> address mode. However, since the 3-byte address 1-4-4 page program
> is not defined in SFDP, it needs to be configured in late_init.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 07e0bd0b70a0..4bbd3b651cec 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -58,6 +58,31 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int
> +mx25l3255e_late_init_fixups(struct spi_nor *nor)
> +{
> +	/*
> +	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
> +	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
> +	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
> +	 * Therefore, it is necessary to correct this setting by late_init.
> +	 */
> +	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +
> +	/*
> +	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
> +	 * address mode. However, since the 3-byte address 1-4-4 page program
> +	 * is not defined in SFDP, it needs to be configured in late_init.
> +	 */
> +	struct spi_nor_flash_parameter *params = nor->params;

Please don't have variable declarations in the middle of the function.
It looks odd. Though neither checkpatch nor cc seem to complain about
this. I thought they did...

Anyway, no need for a new revision, this can be fixed when applying by
me or Tudor.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
> +				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
> +
> +	return 0;
> +}
> +
[...]

-- 
Regards,
Pratyush Yadav
