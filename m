Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D631FECA1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828385; cv=none; b=ToA29rXmM+h7D1xGSOpLyDGxo8Ch8uw680hgtewZ8C5SRvAo3HWZ41zujcuxkFLUOTCMDu3HA+EBgkUSJkYsoGLUACKC+LFADk6TAUt5cTyIHVyFSW5ZoaH8OWloQ7ZCU9nZ9YdqJ0bKVzBJuScQZTxuPGEP14cMNFYhl3fbmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828385; c=relaxed/simple;
	bh=lTS23+OVr+U8jOyUDY2Ng/g2joDRg5LwmQv4+9E7gU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HdUA1CdpT8VrBhnJ0HmJ1he29SsUQnpCna6gwlgQxNAOkJ8K5YomtniZcESkPAsvRYAloQFQxRg/PMioysM78j+JCEKMWqnR/V6RNXhjIGXJkmc4qzg4KyxQ4j1gm6Jbq6ZnAE1xyQOA5x7dkaioMwWGe+QXkSiELyWrGAijHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lkHT60FW; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lkHT60FW"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GIWl3M424996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744828367;
	bh=8LL977dbkymvSQK4ivUClHaDB3bJ8D34+HYE6+9SqpM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lkHT60FWwEMF9Kfnk03FqA8UaYB3TT3DzazCRdTXJWlV1AxR8VI1YlN0GqydumRgH
	 bSHNEMU7xw+wJrmyitE2XBQNd0TAYloI/I8JpI0OXOlRPfHRY+vL62TuOzOquK3scR
	 L9t5ES8u5naQZM7H47b0zuZJOmTRtHkzVAtu3g0w=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GIWlwN009498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 13:32:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 13:32:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 13:32:47 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GIWhiW095159;
	Wed, 16 Apr 2025 13:32:43 -0500
Message-ID: <eb6c1dfc-11aa-421a-9b46-2fcaecb04435@ti.com>
Date: Thu, 17 Apr 2025 00:02:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
To: Nishanth Menon <nm@ti.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-kernel@vger.kernel.org>, <bjorn.andersson@oss.qualcomm.com>,
        <krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>,
        <lumag@kernel.org>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250411095043.272488-1-j-choudhary@ti.com>
 <20250411112802.x2q4f7cq4hwilxoe@blasphemy>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250411112802.x2q4f7cq4hwilxoe@blasphemy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Nishanth,

On 11/04/25 16:58, Nishanth Menon wrote:
> On 15:20-20250411, Jayesh Choudhary wrote:
>> Enable configs for cdns-dsi and cdns-dphy. (dsi wrapper for
>> j721e is enabled by default if cdns-dsi config is enabled)
> 
> What upstream supported boards need this change? Add that to the commit
> message. Beagley-AI64? or others - please enumerate.
> 

Posted v2 with the list of platforms that require these drivers:
https://lore.kernel.org/all/20250416182930.32132-1-j-choudhary@ti.com/


>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 5c85e5da152f..4c0eb2711bbe 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
>>   CONFIG_DRM_ANALOGIX_ANX7625=m
>>   CONFIG_DRM_I2C_ADV7511=m
>>   CONFIG_DRM_I2C_ADV7511_AUDIO=y
>> +CONFIG_DRM_CDNS_DSI=m
>>   CONFIG_DRM_CDNS_MHDP8546=m
>>   CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
>>   CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
>> @@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
>>   CONFIG_PHY_NXP_PTN3222=m
>>   CONFIG_PHY_SUN4I_USB=y
>>   CONFIG_PHY_CADENCE_TORRENT=m
>> +CONFIG_PHY_CADENCE_DPHY=m
>>   CONFIG_PHY_CADENCE_DPHY_RX=m
>>   CONFIG_PHY_CADENCE_SIERRA=m
>>   CONFIG_PHY_CADENCE_SALVO=m
>> -- 
>> 2.34.1
>>
> 

Warm Regards,
Jayesh
