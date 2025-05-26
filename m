Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F5679E1;
	Mon, 26 May 2025 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244629; cv=none; b=MA3jad7bZHm6SXUMx5bcCy7xiQY0EF5a0k/Naz6W6jh6fESvtcAA/nMr5Z5gQ6+tLBYT0a5+yDwTxa6/mQCkYHbgF7VT8uSW+SVhQSh4JDZrwiss6iT+DHTa01+1AbWmeu5OocR+9yae+i4LqK2m9ITo9rqSiAYTK2RlhEcbBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244629; c=relaxed/simple;
	bh=phcXms82Ag/702pZeGo/6JV9q8rnwY3rKI6a6RvO4Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GicTqfS+OfYSZ/WFqp8/3usPgEZ71QQRmsrXCH8ok9a1tVjc5Og7WnlFyc/S+M0uc54s+Z6DEOYrRgqHgJo7l7l7wJa0o/bb+SX0yDPV+obQYJvZ2wj8rg1alPpMGcifBdPGP/i1uZ4erulqBok8OqurdTV/liGtoOvhDcLPExs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ivq9k5wk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ivq9k5wk"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q6SCL0005493;
	Mon, 26 May 2025 09:29:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lTDE2wTWZMgeazVaiUjwUqBmNK0bFNpP2NUy4dywBoQ=; b=ivq9k5wkkgImWz8e
	OgYaMgLRKQm64L3kTznaiEm1CCggncqx/b5InZc+2pbSRvNaZvgF3SJu+n1ObOjj
	ul0ZdGCnzuRBOAvzO94zqas9EueTrjE/orpcOEWu8kuOn1JI3V6srHR9YOqcbYOJ
	/gWlrW9iwYlS0pYIvB6ksAkrDLeOOaYyIgG7q48MqgHDNiGtvznOzNLjjiwA0Wpv
	SdjdNNYakOhzIQUSrdv7wO9rC5QdU9NG/ydi9GeEvP4QHi72GEzU4xbGrSFSvsYx
	RoEL5IXYTbWr7qOopPaVOWSVHGLKwibxODLYlRhxlbvOFS3T4gQJ+5/2f+70fGNi
	06hfuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u388npe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 09:29:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC9A440048;
	Mon, 26 May 2025 09:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C894EB2E883;
	Mon, 26 May 2025 09:27:24 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 09:27:23 +0200
Message-ID: <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
Date: Mon, 26 May 2025 09:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ARM: dts: stm32: add support of stm32mp157f-dk2
 board
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        <amelie.delaunay@foss.st.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc
 Kleine-Budde <mkl@pengutronix.de>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?=
	<l.goehrs@pengutronix.de>,
        Marek Vasut <marex@denx.de>, David Jander
	<david@protonic.nl>,
        Roan van Dijk <roan@protonic.nl>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01

Hi Himanshu

On 5/24/25 12:03, Himanshu Bhavani wrote:
> STM32MP157F is similar to the STM32MP157C, so reuse the existing
> stm32mp157c-dk2.dts as a base for the STM32MP157F-DK2 board.
> 
> Datasheet: https://www.st.com/resource/en/data_brief/stm32mp157f-dk2.pdf
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>   arch/arm/boot/dts/st/Makefile            |  3 ++-
>   arch/arm/boot/dts/st/stm32mp157f-dk2.dts | 15 +++++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts
> 
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
> index 60d55516f723..38179638e5eb 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp157c-lxa-tac-gen2.dtb \
>   	stm32mp157c-odyssey.dtb \
>   	stm32mp157c-osd32mp1-red.dtb \
> -	stm32mp157c-phycore-stm32mp1-3.dtb
> +	stm32mp157c-phycore-stm32mp1-3.dtb \
> +	stm32mp157f-dk2.dtb
>   dtb-$(CONFIG_ARCH_U8500) += \
>   	ste-snowball.dtb \
>   	ste-hrefprev60-stuib.dtb \
> diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
> new file mode 100644
> index 000000000000..ab406b2c44c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
> + *
> + * Author: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp157c-dk2.dts"

In this case what is the aim of this series if you just use stm32mp157C 
devicetree ?

ST people (mainly Amélie) are preparing a full support of 
STM32MP157F-DK2 leveraging the F variant compare to the C variant. 
Series will be sent this week.

Regards
Alex

> +
> +/ {
> +	model = "STMicroelectronics STM32MP157F-DK2 Discovery Board";
> +	compatible = "st,stm32mp157f-dk2", "st,stm32mp157";
> +};
