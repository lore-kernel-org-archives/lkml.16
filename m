Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C8293B7B;
	Fri, 23 May 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008803; cv=none; b=uMDzbvpNmB/2u3Fz6IdL360TRAMSvFy4pqKHPTAH6Lgmuw+fSk6/yLlJvZ0IQSu0NLhU68XdPyOrWolsDM8DgvAeDiOsTZxdTS/Bn0agePfu9RWZU3QmjnCwMf3HoNvW8nbUXYz0x7fZzxVHdE5F7sRIKtIiKDofAn02dnDDcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008803; c=relaxed/simple;
	bh=sT1GVLP96c1iadPkzdnCKklALd1n3eFpGLCf4Ox6qt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k41u5NGsfQDdxOiE63cwpPJx5JdPrCgrHwHy8rcufgLKEUlL2Ie2rPGP+y14sVSI9OfPM8dPA3V1AEc4eplxzGzseD3i39thm/vfjBNpLe3X7YzW70kM+HvchNLhX9c3eO+c0B8gSjS21LMmdjHPNGqs4hTuq0VqQ4iOXsWoRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Vyz/K+59; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Vyz/K+59"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ND60Jb017699;
	Fri, 23 May 2025 15:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	e+IFdO1usXKHPiQf33sJ74JnT4YFmfU5fTYrm93yLqI=; b=Vyz/K+59SCGHceQC
	kOjfJsoERs8fnIZIOj6znI55PUoh6cU/Lvi94TMR1NtqhPDab+uVxYqR70OVE8NC
	KszErRyOOPahLPpNm5tC6/J+V6IU7AvDUsodn3S/eY2N8XJ1guulqMr3Qh3ymeLp
	6J5SWme3OF5d9p+0NQxUYxwHt6/5AjE4NTBDCEceuPkdKq/7xA5/sgqi8E8dzKU7
	8zUVsfFzfFYnfc4KFkkaQYgNA3IwuvBQH492gk/nGJSaisrmj7glHSSy8WxSELYO
	dJQKr2tJ4/p4DCl8TzeFVYhguNyD9mDwQOiCKbkUPjK5QCIqHw1xoGlcO0a+f+Vw
	SYQeUg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4ej9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:59:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E9C840045;
	Fri, 23 May 2025 15:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47D74A7437F;
	Fri, 23 May 2025 15:57:43 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:57:42 +0200
Message-ID: <89b8b7ce-cd0e-438f-95ee-2a3058728a5c@foss.st.com>
Date: Fri, 23 May 2025 15:57:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: stm32: introduce clocks for STM32MP21
 platform
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-2-cac9d8f63d20@foss.st.com>
 <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01


On 5/22/25 18:21, ALOK TIWARI wrote:
>
>
> On 21-05-2025 18:08, Gabriel Fernandez wrote:
>> This driver is intended for the STM32MP21 clock family.
>>
>> Signed-off-by: Nicolas Le Bayon<nicolas.le.bayon@foss.st.com>
>> Signed-off-by: Gabriel Fernandez<gabriel.fernandez@foss.st.com>
>> ---
>>   drivers/clk/stm32/Kconfig         |    7 +
>>   drivers/clk/stm32/Makefile        |    1 +
>>   drivers/clk/stm32/clk-stm32mp21.c | 1586 
>> +++++++++++++++++++++++++++++++++++++
>>   drivers/clk/stm32/stm32mp21_rcc.h |  651 +++++++++++++++
>>   4 files changed, 2245 insertions(+)
>
>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Many thanks Alok

Best regards

Gabriel

>
> Thanks,
> Alok
