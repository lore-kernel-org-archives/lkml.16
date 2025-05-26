Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129A18B47D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276233; cv=none; b=JaiwCyzvjRvTJoH/LxJxwiXbL6+Quv2+m9HvaxDaj+M3kOVaT+eDtt9WV0Z6BUAHZNcAxiadzlG2IgRbqBfGMO+e8IKwoPpk9YS3Esx1tzN3zEfOI1COI2N85LRkHN0nKbPEF2nqnthwIBzTGWYY79f3e249QJh9zuF9rYCWS/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276233; c=relaxed/simple;
	bh=BbfJwyvUfPcPHmjozsUgs5lTeEXemRIfUXabR3ZB/mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ni7WxmKwjglednUjYM1KLY9m/zE0fOy40pmoImuB14vedMadJh4c/1fIIZk/H0GCjdAjIHoEVbUfj7dUtpgZ9CmytRfYCtXRHgBaX8FyPs5pjjN8zy0qu2qwEY+7bOx7/MA/O9YSrKOzQ1hG9bLFOPKAWS8fx4HvReTcf0f7YQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai; spf=pass smtp.mailfrom=sima.ai; dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b=ennRCcKg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sima.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b="ennRCcKg"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2345f6c848bso1528895ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1748276229; x=1748881029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpLNyektUDJ+Wy1bMHRPw9xz1Qvt5LipEoHKiCF+WW0=;
        b=ennRCcKgO+9VTohpIelqOFFhBf/6aI51TtpdnvkGlHWHurC3WNzDP2C5gJyy8KBBWz
         ZxZIarjDCra3qzvxJm+EzHZPDWQDCMSX/6FuKc5j+8STzGcMQVrbnwBaUo0UHYRwfHLc
         o+v+32NRFp5cU5OMsCw93zTEBFh+zPWGfeXD++uNqn/zKrXnNd/mxsW4fxrBIIenCn4B
         nHZvJCyir7Ytd7mvGHdZAsvsFKgNryCC1xz2qTSqhoB1ixJm1rNgA6DI523S29JeYVF1
         cWe3qsBfLYQp3Jhhc8Tr5qoace2cfpkoq2TqecNfrUbWEPxXws3EVlp7oWs9mkDh08/c
         /3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748276229; x=1748881029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpLNyektUDJ+Wy1bMHRPw9xz1Qvt5LipEoHKiCF+WW0=;
        b=d6GqsfRkmDOjaMkweLwTr8Uq3BNIDmnWgNIMoV7wJlGdp2lKuE0a+2vzOeIGtEzXyS
         4jF0c+MGsGrYnRQQ2kGMT+0vC26m2aK/4dDxoEbibiVxwMlwCNieIDER1aZO4CWT/r7t
         Mq99wbcYgbs4657iftJneGdyEJ+vgaSY3Zh6chw72dxon9qyuwhocwIro0EdWU5k96MJ
         1+VZ/tr/h7gBRPIqHEgPbdlJvoyEDp0iuDsqgeGLUVhxFSqDt6xPT/1Azr8HsHIp75+h
         STApQMM26RAbd00yNc8hwQCsuTCLvFfrm7lNYRj/I1lM30DgzFVYzSAaT2mslqnM907w
         7Iiw==
X-Forwarded-Encrypted: i=1; AJvYcCU6hnMDviryGF/MDO5Z+gtvtG1Z/wT4bc8R73WQxJsPtRX6HAiO2x3B4Tl7nH/rm0Lab1DorUj52MWQDRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBWX4VOLFSsZ/qlvCkwiwy5Agrw90CpIx7X0JNGcbejhYlSXL
	pCr48M8OTfv60G+Jvunq3pCgulzrW/kbgG1l//3N8JM66N+wCJ0F92GhSMQjhIkVzSo=
X-Gm-Gg: ASbGnctkXwf6KDyqq3MAY6SCwK6ov4c93qBLaH4SuAGTczFJPFYiW1HJgiK029mFj1Z
	guHBsDRqaFSzVLIDR05TyM23aykIsRTAwce4hFtfweboBh+dfb7w/FwOhnNn2G0r+rjW01D7vYr
	LIa4Bdy82TpZ/6ybcSJcK6R4WQDPW0rkvH2woeh7kOG7uGcJRIKofETR6+90r+nwfSNV5ZPWfJ/
	1NUYQJI8bKh9me6rLvz88lE4UR9b/A78kr5PXsEJ39Tq6A376dGX31vJki4Unp5BQhXyDezxYc5
	8+Y+7tHs9ehBuT7tdC9wT8TUqk6fD40/r/2m4RnG6KdhDi/JGZBuPvjLGH/bZZtUYhLJ
X-Google-Smtp-Source: AGHT+IEhAY42K8o5WUtsFhwOWKSys2t+FWegKVAVXKM+NEJ0A73fVF3hLcAex7C5XJx2ISqqHBdL8A==
X-Received: by 2002:a17:902:eccb:b0:224:1579:b347 with SMTP id d9443c01a7336-23414f64ab7mr53080415ad.7.1748276229149;
        Mon, 26 May 2025 09:17:09 -0700 (PDT)
Received: from [172.16.1.45] ([45.62.187.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341ccad6fcsm41723455ad.170.2025.05.26.09.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 09:17:08 -0700 (PDT)
Message-ID: <93ae82e6-44f4-4f2f-b3b6-71240f84500c@sima.ai>
Date: Mon, 26 May 2025 09:17:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: set multicast filter to zero if feature is
 unsupported
To: Yanteng Si <si.yanteng@linux.dev>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523221938.2980773-1-nikunj.kela@sima.ai>
 <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
Content-Language: en-US
From: Nikunj Kela <nikunj.kela@sima.ai>
In-Reply-To: <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/25/25 7:09 PM, Yanteng Si wrote:
> 在 5/24/25 6:19 AM, Nikunj Kela 写道:
>> Hash based multicast filtering is an optional feature. Currently,
>> driver overrides the value of multicast_filter_bins based on the hash
>> table size. If the feature is not supported, hash table size reads 0
>> however the value of multicast_filter_bins remains set to default
>> HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
>> feature is unsupported.
>>
>> Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 085c09039af4..ccea9f811a05 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv 
>> *priv)
>>                       (BIT(priv->dma_cap.hash_tb_sz) << 5);
>>               priv->hw->mcast_bits_log2 =
>> ilog2(priv->hw->multicast_filter_bins);
>> +        } else {
>> +            priv->hw->multicast_filter_bins = 0;
>> +            priv->hw->mcast_bits_log2 = 0;
>>           }
>
> I didn't read the code carefully, just did a simple search：
>
> ❯ grep -rn multicast_filter_bins drivers/net/
> drivers/net/ethernet/stmicro/stmmac/common.h:611:    unsigned int 
> multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:26: 
> plat_dat->multicast_filter_bins = 0;
> ***
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:512: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> ***
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:536: 
> &plat->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:541: 
> plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:542: &pdev->dev, 
> plat->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:523: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:527:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:528: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:516: 
> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1527: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1531:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1532: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1568: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1572:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1573: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:543:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:633:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:679:    if 
> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:31: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:84: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:98: 
> plat->multicast_filter_bins = 256;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:365: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:369:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:370: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7240: 
> priv->hw->multicast_filter_bins =
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7243: 
> ilog2(priv->hw->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:570: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:707: 
> plat->multicast_filter_bins = HASH_TABLE_SIZE;
> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:479: 
> plat_dat->multicast_filter_bins = 0;
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:456:    int 
> numhashregs = (hw->multicast_filter_bins >> 5);
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:485: 
> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1057: 
> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1061:    if 
> (mac->multicast_filter_bins)
> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1062: 
> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
> drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c:43: 
> plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;
>
> and
>
> drivers/net/ethernet/stmicro/stmmac/common.h:265:#define 
> HASH_TABLE_SIZE 64
>
>
> From the search results, the default value of multicast_filter_bins
> may be meaningful. And I think that even if some hardware does not
> support this feature, it should still be overridden in its own directory.

There is a DT property 'snps,multicast-filter-bins' available to 
override the default value for a platform however this property is not 
taken into consideration in case of xgmac. That being said, 
stmmac_platform.c logic can be modified to extend the property use for 
xgmac also however the value will be overridden later based on hash 
table size read from the HW Feature register. So only zero value will be 
usable via DT in that case. Hence I thought of setting it to 0 in the 
else part of the code I modified in this patch. If you think I should 
extend the DT property for xgmac, I can modify the patch too.

Thanks,

-Nikunj

>
>
> Thanks,
> Yanteng
>
