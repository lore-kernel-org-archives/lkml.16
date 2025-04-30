Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7BE1E990A;
	Wed, 30 Apr 2025 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997023; cv=none; b=CIJqrPdifutWnUrPaWg2AfihSaEPm8C/R6/qhUc7JJWE8haz2ghlOhcsfMuwnLfF6NvJWIKZ0Ibsu38Y8ZAob/hhTC6SXp7XBeaJTRaTU2S7Xl3gUHWofgcXqkU3OvNkm1HFigJVibK3zxErQgSRcJy9eyQf7x8mtWDZ9BVJkow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997023; c=relaxed/simple;
	bh=UlIz3BsJiESUbd0PqNHjGxSN7AGOc5ii+Gj8qpPwqLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RLlmFm7NnHwiBYjRrmDnIPLrODQ9HIFBTx2fR9FNaT2J178bOSy8ITE+bzhJmX/VwL3mSUART77FF1lf6IlgQ7sM2FSEQtYZfZT9lcFORahjKe14sZcdTeprqcD64nOrJ0lTNvb9h73KfpY63MflyQ8I1UJq8khiGelKY+rnDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Blt/qIuc; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Blt/qIuc"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZWIJ026622;
	Wed, 30 Apr 2025 09:10:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PbfPCoz7K3yyLKhPzzjMngjt4hki3q6Xp4ZTRt1mSNE=; b=Blt/qIucYIVVVjdF
	ZXX1VYBNOpLeOwvWCmP850xclhl8KSwzXUefbVFvV7gP6aYxTVfJddEsKwJ+EdA3
	h5AhP3EBcF3QN3bZMT1mBUWb/QTw1p1nvg9RLM1rrtYu0CzjldTqoIVVpL12aA6s
	l+uIm20CzooNw6RyT1MJ7Vi2GbVUhTshXYRdp8FfJe8estFLaH1F3y8Rg43tq88a
	JI8emqTt1e7x0i9q3sKy3W7RTU3srgWsCLJLJ7oOhWunaniTIYqibSwaJtVZrsAG
	yNvShTkfwupYfGkiwj/veUpfd5HFNZUVuXxeX7LnIquylZbSXaVHwN9RDFhbuxye
	sJuokg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmsjbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:10:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 948604005E;
	Wed, 30 Apr 2025 09:08:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6E6FA564C6;
	Wed, 30 Apr 2025 09:06:00 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:06:00 +0200
Message-ID: <ae61407f-81fe-43a6-bdb6-1d1a58ed67de@foss.st.com>
Date: Wed, 30 Apr 2025 09:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: st: stm32: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Christoph
 Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@dh-electronics.com>
References: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01

Hi Krzysztof

On 4/24/25 10:47, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>    stm32h750i-art-pi.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied on stm32-next.

thanks
