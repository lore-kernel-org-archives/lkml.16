Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CA238C3D;
	Wed, 21 May 2025 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818901; cv=none; b=PDJlME1sZAyO+rBkPyPmWdO92UsOujFj95VpvL+wo/yAaCfy37V+/BbO17rZLO8Lw06lXIr34Xvtq9ETFTm9xBdMOWTc+NxLBnnm/pW8C8MgoljkGOCETV0/1cgmDpYm5B5KyANYqPEhufKP2f2PRRBeateL4mrFqrEBJO6J4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818901; c=relaxed/simple;
	bh=YSpDBfKl2V81ILNyL21Nv1m0vSKQGw/nVO0nNErWsyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XIFavn359rBBHNdxczn3FwgiKKGJSKmknIAcZzkEPklF0AifDgeNenPyQUee4Uemsaf1AU49Ruu5ufX58MjL4F/s4D0ODCtM+JhI7MOjJqQ62ivAmJdNGh1Qq6/zs6WHB2pOF5o2YyFR9OGMbDXOFk0e+2GpKElGoSAm39yRZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KrJSRluA; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KrJSRluA"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L3wVbU011053;
	Wed, 21 May 2025 11:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KuHtnSKsW+7Ihg+kQpOB9bOtYG+LujduoGhpLuXqrxs=; b=KrJSRluAke1eFynF
	YsRSpn4AixLB3VnboO1r/4KySuJbz6jh6HF9bPuPTr5EV1/70xIUQgxGOKw/pMPS
	UiVo2ky357LFlpVw+LbDpowzzLAOxpBFxPkjDAmnF4B1KIa4hpkhmMZNe7L2ohZH
	8ooz1eucpgkw9UYlaARcJoHSIh28cPYjEQO2CJOU2nfF9Xl6U32qvtbPtT/yPZfv
	27NPa1QM8feQ4Hwm1ZCRNOIN+n8+hRBialGHh5DeNIaHEVGS/9nv480F+cbh5dXy
	MsD6/HIs1k6x3/vLAuWLkjnJ+/SPG+bAXbRzZc+bUgC8vypIHgig5knNR+9o5WE6
	HebIfw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfab5cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:14:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ECB1640054;
	Wed, 21 May 2025 11:13:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F64BB2E19D;
	Wed, 21 May 2025 11:12:18 +0200 (CEST)
Received: from [10.252.1.130] (10.252.1.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 11:12:17 +0200
Message-ID: <3e855041-3eb2-48c8-88d7-0eb7b9948cc8@foss.st.com>
Date: Wed, 21 May 2025 11:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and reset
 bindings
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
 <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01


On 5/20/25 17:56, Conor Dooley wrote:
> On Tue, May 20, 2025 at 05:28:37PM +0200, Gabriel Fernandez wrote:
>> +
>> +  access-controllers:
>> +    description: phandle to the rifsc device to check access right.
>> +    items:
>> +      - description: phandle to access controller
>> +
>> +    minItems: 1
>> +    maxItems: 1
> That's just maxItems: 1, the minItems is redundant.
> ok
>
>> +    rcc: clock-controller@44200000 {
> Remove the label, there's no user.

ok

Many thanks for the review

Best regards,

Gabriel


