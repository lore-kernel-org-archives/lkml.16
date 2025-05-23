Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CD129AAF2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023178; cv=none; b=F+1WhVkCKlCu/X3PHCsKtYbdV9juEdveWQA+0zapOOPM7oAwVB8E48V2uSG1ognrygR/m0wusgY8hbQIY+isZuEw5BWIb3xgkBvqZVQXZLZ1PcmV/94uEhDfuiRrPdU6EMn/O9oRKmntZNgGu2TAqUmQAoqQ/Zku5Ktgxy6FGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023178; c=relaxed/simple;
	bh=/yzNpMpyyZhhfCj85FSoI7CiSf/qoFm/Fy9Y9bnPFbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pePPP06p/emGquVUL+HUY7UiDFQQqCB/eSkbv4urRqt/qAn7Nb6as/Ok5LSRpf1jE0pR6Rq4s2vw/QVlzdjOwEEHVC6+dEazstfjmwMQj2/WY+6iAZEy3e4W44/8UFCIPkiuw0ZwH114sD8O0vbm9iSVfQ1sFm2Lhxenj1k6aag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=WKkIG6Ba; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="WKkIG6Ba"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc64b08343so591035ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1748023175; x=1748627975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhBDaNTzWlvTPxEir4mZRJwdB13jn1nJVWTFTNCoz3o=;
        b=WKkIG6Ba5lbNM89igSb0YUj758CbWuWcOSSaUd7sMCiV5tIg3DtON5Zs2sstc68XZt
         LA+HpOVGPBe+lFTJF7LBlRLq0e71UgBoGhFVr9mLNNAjQiSKcx1g2+ha5hjCgduhtl6j
         J5wWNZskpLP+1JnpPXOnH8op8o0yKPjCQ2z14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023175; x=1748627975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhBDaNTzWlvTPxEir4mZRJwdB13jn1nJVWTFTNCoz3o=;
        b=EsvnC1uwV8JSTMOxvWA2K2mnCMuKcxMCjywuQ5LtpxkeuQFm+bokXCfhUNUm5PaUzR
         3r/sqBGiNQGqUCPizS5N4255GMUBXNpm2Tjl2qcL/AN+lqzPPRdX/wI3v3HgYvcH4CRF
         xrCcbMa0bRUdqfrbdP2bIhFrMr1+ToEocQgRBJ4u3bO4vmc+/zJP5xbGCkUZN+qXcJtI
         uEx2gGag/MFa2ggxl4lFEDIxfHEaBrshw0tmjQncPPbOaeR73tnylHQknut7m1+4Ffyj
         fmWypeEGjsheC2b9NFUvnJt7ceK8OlgHrUhFUiIbQxkqK5umqqCwvBLgbakidsQ2NWN9
         tiEg==
X-Forwarded-Encrypted: i=1; AJvYcCXAJcYFfH/YxfXOjAzorTsQ8+IgjyOE5782yVMaUAV2qpFVS+0VsO+LJSRkbfFcvFBWT8dGalp6Tvp8PpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmKzdoFiovvkbDqmO3OepEboUIZBdOhw4Recx43Pao6pN3s+7
	vVoex6EDm6rGKe2OMrXT9Rx1a6Dek987wUlxj0t4J0Yl1ujIyaj7YGv9JJ6SJdCYDw==
X-Gm-Gg: ASbGnctBoBtoVL/SC/KW18Le8aBr9weO7xrErZI2pRS56dBcdixTrzPrVgw2QWZ1m/q
	lHQJMMEbpxR5thB3w5P3w+Q+jQ5cNGIxlrQzQIj1kKWKWeGOGJQOhXoxdpCQGtHzYw9SI+BJoX5
	k76hJH2cw8lRuiiJ8xva1CMH7pl56z/Plz7uYBjTT+KOJh0qrTpWBIOEsRvKfMeIEX9RQqoIcT7
	dog5PN1LNPunESPrJxP4ixA1RwAezoJQmpZJtFnbvX+nKPong5lHC2Ms3OLEjRgnn4Y1+/wmd1p
	XGvWPrLP6KxBckdEQAUAGsqj9RnLnRdU8X/bKBLYPJSpG3JY/zODPTz6+MhUYd35GMlzq+uQtj9
	kkPDrkFAWZw==
X-Google-Smtp-Source: AGHT+IGPHZwu1y3fmBV6/SA9MrxkyTECcIAP4UrpCzWAITxakM2wVnv4idA9gL9CdXIurUt/Yc25DQ==
X-Received: by 2002:a05:6e02:3e91:b0:3dc:86aa:7ab1 with SMTP id e9e14a558f8ab-3dc9b70989amr798245ab.22.1748023175350;
        Fri, 23 May 2025 10:59:35 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3dc7f126188sm18218695ab.65.2025.05.23.10.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:59:34 -0700 (PDT)
Message-ID: <f6174a63-eee9-4138-8923-9f3d587ef548@ieee.org>
Date: Fri, 23 May 2025 12:59:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 6:08 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

You need to fix something here, but it otherwise look good.

Please fix, and assuming you do:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_data.h |  3 +++
>   drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
> index 2fd03f0799b207833f9f2b421ce043534720d718..a384df91b5ee3ed2db9c7812ad43d03424b82a6f 100644
> --- a/drivers/net/ipa/ipa_data.h
> +++ b/drivers/net/ipa/ipa_data.h
> @@ -185,8 +185,11 @@ struct ipa_resource_data {
>   struct ipa_mem_data {
>   	u32 local_count;
>   	const struct ipa_mem *local;
> +
> +	/* DEPRECATED (now passed via DT) fallback data, varies per chip and not per IPA version */
>   	u32 imem_addr;
>   	u32 imem_size;
> +
>   	u32 smem_size;
>   };
>   
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 835a3c9c1fd47167da3396424a1653ebcae81d40..020508ab47d92b5cca9d5b467e3fef46936b4a82 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -7,6 +7,7 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/io.h>
>   #include <linux/iommu.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/types.h>
>   
> @@ -617,7 +618,9 @@ static void ipa_smem_exit(struct ipa *ipa)
>   int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>   		 const struct ipa_mem_data *mem_data)
>   {
> +	struct device_node *ipa_slice_np;
>   	struct device *dev = &pdev->dev;
> +	u32 imem_base, imem_size;
>   	struct resource *res;
>   	int ret;
>   
> @@ -656,6 +659,21 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>   	ipa->mem_addr = res->start;
>   	ipa->mem_size = resource_size(res);
>   
> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (ipa_slice_np) {
> +		ret = of_address_to_resource(ipa_slice_np, 0, res);
> +		of_node_put(ipa_slice_np);
> +		if (ret)
> +			return ret;
> +
> +		imem_base = res->start;
> +		imem_size = resource_size(res);
> +	} else {
> +		/* Backwards compatibility for DTs lacking an explicit reference */
> +		imem_base = mem_data->imem_addr;
> +		imem_size = mem_data->imem_size;
> +	}
> +
>   	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);

You want to pass imem_base and imem_size here?

					-Alex

>   	if (ret)
>   		goto err_unmap;
> 

