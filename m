Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E621B195;
	Wed, 14 May 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211731; cv=none; b=tegCXXWG3QdCUK8sVq6eyKCTcELHizhqbxmmcJrtaACONFFtspuLSSaiBU5Kfk8p7LhCyu0qEXl6KFEqANX6YNEgGu4iWQ85HHKV1ykhs04tncgRtND1xgZ8X3tvy4pyp4i4SgnXycE8+LPNJnUFui1OOxuudB8IIJjgokX/w1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211731; c=relaxed/simple;
	bh=tyHS19Jo+iP3Lquv30HuR8SaMuhl3ZrpELRb1028Wj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UubdvUA0qChdz44pIVO0y8zf4TP1beoApYFGheNk6hwnd2+G4W3HXaejXuIGdxAkobOTO9g96+t7YQlOBzf55rUo8LTEQquz2fhUEpwJT81sHtk9fLXogN7gQ+k7CnpIVxJliAIXMZUS0bJ/KYTsUVMDXOUGf3QrZ+2+WaRSmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dz80wl+v; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dz80wl+v"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7w1Jx022967;
	Wed, 14 May 2025 10:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zTYcnTgzrTSARrdRyGgDqevHWfgdqMFkurpjm2teTzU=; b=dz80wl+vuCkp60ij
	7FaCb6Y6rODPhEpIjDoGI+ijqilMSRtvYWm7EnQx9GskOVNIsUs1uVfmNsv+G5Ay
	cRSz2iiBT5+l55aIFj3fJr7kRNWkgkQ6RZTQpTRwMb7D5OIhDBOrxfd0O/ry0klN
	3Mt8OA2itjnWurK3iiNcG5oq/w8l+I+4J7E/hI4RhD0v38DQ/pTJrvE1ppDKxczQ
	VOzgCkLMnebXGBJnI7fdiqdSUm+jWCaGP/DRZENCfrUbqLpFuo8yNS96tbUAzTCE
	s5R9cyuwQKvkhwUI4wPqL7TMC6IEwiyx+sY4DtQdnp0IzufcwdAa3Al16bjuR/O2
	pdndOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbds2h27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:35:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AEA64004D;
	Wed, 14 May 2025 10:34:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D13E2B3CFAB;
	Wed, 14 May 2025 10:33:33 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 10:33:33 +0200
Message-ID: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Date: Wed, 14 May 2025 10:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250508143818.2574558-5-goran.radni@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01

Hi Goran

On 5/8/25 16:38, Goran Rađenović wrote:
> Add support for Ultratronik's stm32mp157c fly board. This board embeds
> a STM32MP157c SOC and 1GB of DDR3. Several connections are available on
> this boards: 2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
> SDcard, RJ45, ...
> 
> This patch enables basic support for a kernel boot - SD-card or eMMC.
> 
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> 

Series applied on stm32-next.

regards
alex
