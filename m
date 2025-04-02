Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCCF237702
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595514; cv=none; b=lRC9/oTLHgQiWao+eoKBsrPgtoYc3ay1ioifJFCOMOY1xABy5Iz6fz/E+NMiUARpaTzuQ+QNkS9EcQBGlL3vf2eXn7J0Hoeh2Bbr4OkMsfyHu/P8qEKrl7gqtRbenGTlqhhv/lycXlKcihAavOm8SwTTPj4nnOA3UqGsQGfr2aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595514; c=relaxed/simple;
	bh=7CEsnTuCrG0rAa7QCL0T0Eaa6b4iClo2iTSoboqyft4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfPFcWe8AvJOxlUuuVk+VnK6P9SB9iXqPpG4ButMFA+5R77FRJasHhXNKkwrwvtpdhFlorskM8P+7GtlKZU1nqb5mMwfnu1GgcFBl6MiNMhTfqhiHlC8COVaoTP6UYrDiq88VLq3F49Lga5YVFzhw97eTreMQm5KF9wYZ6qvdyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0y4/lHF; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0y4/lHF"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b2472969so655296485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595511; x=1744200311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkTi7Bcj38WU+Rd3hReHr6Wh69RvlQ9bdv7n2XEkdhI=;
        b=J0y4/lHFKDamu2SYC+O1/1xPR81jydmP9WzMDhxED/kedRxfhxUDevAgKxlxDlOkaW
         gtSbM3MuecEEsTPr+aZk4t9Kl252biUT8iFk4kBEqOBQ9N57DMNMw4y/7szmDz2QPd4S
         Utnw1VBcFoiTJ5L0izU//rJw+h8rmg1yTJAep0ga+An2IFiTcWovZxEv1SNzbtaX57i3
         x9mJoE3t70LPGyBAl2ygrDx48o7W9IQIujlKBvsPpHxOHpAC4jQ67ftlfAqxG0XD0vS+
         hT/MgmbRaD521hKq26LWMCYFSPxuYEZexWvzUqHRYPJuDqa9WY7HgNkgS5wMoQsHfORz
         0tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595511; x=1744200311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkTi7Bcj38WU+Rd3hReHr6Wh69RvlQ9bdv7n2XEkdhI=;
        b=Xzgo43U3hP6OwPB+YzYft/pag5Ct0k5K7HMNVNJYaVfqZiNHFk764CbsuEYupJPibY
         DlKBsmoHJblpKZAZmMNfdTeLUO2J9M8q7EctSoIKGnjTzmlK4Fc5PV4KnOVNfJ6XYbBk
         qdnCOoJweYsABbsw8+7NIyQUlM+fFO3bkIRIn8YAu1KjIcvgCdPmyuLsdtRTgVLoaylv
         pNP2qq/zpmxdRkhLkfe8ReB5jkPE9TpedIpUUIFxZ01ne96RmCopcmz+7Zuc5W0q25SF
         JtulZ41IvFnR64F+8udHfbf4dzNhlBHG4pdyJ3svLfVOMMLrBEWQ6twEkuGsL3O5uwdh
         ealg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KFpxQh7FpZYg0ly+02H18FiEtCYw7bWUCH1AOiuLtecnR9Q8LcaId2B71xfxgyZbJriT44BbWUGRba4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/211CgXEOUgVR45XgFANH0ytOuznS0j9VHj5N4ADuPyqdlPoJ
	70xt1bv56q4UBSjlf8lclDYUwXNPdmhZ7rpfTvpFoIH8P50BfDrP3l8ziWC2gCg=
X-Gm-Gg: ASbGnctSatLoUfPtufuK0p8frjlO6Y52r9qoqkqwETiP5n2DnZEtTO1mkN1rkNS2JZR
	D1a3YkumMUJDU/Rs3tzRj5jYeHimDH2OVu9mADdQb5uWWwmr+Tlm1ZodrQdIhI1k3FSVTe4NJs6
	exZxo6J8vjEI72M8019hKkU0HIpJIQoOI4EeWPwifrobDPp23dZx4poyycbMesDcVhlQq08h5M1
	/8cF0cM3Znvks3ja4V6PD8G2TzwZ84WRoowuruF73CDLmbkzszrwfyqfhp5dVTif3pIfalibTxe
	n83o4ayFY9SyU75aKqZvdeijQuvWSzpTBWrL64960wWNkHG9yKWV2w==
X-Google-Smtp-Source: AGHT+IGZ+TKjPjyzpfLvNQqi7skImvMdilaWdCsfXLZWph14f22OHARyD1wKqUPvDzE7YHLPRIWcKg==
X-Received: by 2002:a05:620a:4407:b0:7c5:962b:e87c with SMTP id af79cd13be357-7c7664d7c44mr309610985a.44.1743595511400;
        Wed, 02 Apr 2025 05:05:11 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7765150sm776116585a.81.2025.04.02.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:05:10 -0700 (PDT)
Message-ID: <e8c9891d-cd30-473c-837a-8243f20379ba@linaro.org>
Date: Wed, 2 Apr 2025 13:05:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: macronix: Remove duplicate flash info
 entries
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-3-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-3-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/25 9:51 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> To clean up the code and reduce duplication, this entry is removed.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/macronix.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 2acd8e28d1c4..07e0bd0b70a0 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -160,13 +160,6 @@ static const struct flash_info macronix_nor_parts[] = {
>  		/* MX25U51245G */
>  		.id = SNOR_ID(0xc2, 0x25, 0x3a),
>  		.fixups = &macronix_qpp4b_fixups,
> -	}, {
> -		.id = SNOR_ID(0xc2, 0x25, 0x3a),
> -		.name = "mx66u51235f",
> -		.size = SZ_64M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.fixup_flags = SPI_NOR_4B_OPCODES,
> -		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66U1G45G */
>  		.id = SNOR_ID(0xc2, 0x25, 0x3b),

