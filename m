Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857D34437A;
	Fri, 23 May 2025 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008772; cv=none; b=Yomh+G7QdA1n+ua+jbwB00qKcwuvyZl5+p0K8ASmjzFH3Xm4GRIgHLx5pl8VIj55Xk9wpIllXVzB4v+JJvgKITw/bhk923dUGUa6LshywKzK4LYicVslRyjPNmjv2Qk6PLxIS6807g0/KH34d7rxtdLgSxlXKTQPWCWgUCot+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008772; c=relaxed/simple;
	bh=AIInZnJPnYgqDjAZabB8sZdy0QwAFLIAtwz+MylnP7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OjJqgQLiCDyQEGf7IPeP+do74Rb9VXqs49XCGm2PviXN8Z/ybtXBkpUdb4heySf/bem3sI2Qy4H0tgYq1Vq26FK2oHKI7XYB/j1uqujmi1r1wVUDARPty9IFGdDMOeHY1Md8goqBDbTkKQKHcFVtWLRXeO/drsLXu2wLTlvQHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YdPs9bR+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YdPs9bR+"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCYpHj011934;
	Fri, 23 May 2025 15:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AIInZnJPnYgqDjAZabB8sZdy0QwAFLIAtwz+MylnP7k=; b=YdPs9bR+Tlgi2y3r
	g7xawDkziYKq11SfV2bPECBW4CrNOUj/06DTajvSTFZ76zTzlvS5A3BCDmk9b7k3
	kxiBdGU9mDt5OQ72A13gjyVm9oaYd5A0u3Cn3moxid1cQbHbctdHxQJqOaPvqJHs
	HHqUX4slez11lBycBfy6HbV6LNTHtodEZyI0CknuZZELzx9NRiro5QC49qs2+IdW
	Tgag2pgcO/eYVVnEqWCy95FLiSjc8TxoO16eMdzz1FG4KV5em8/nO1xBUr2Oby2d
	OxVbpWtC0zuWwS7aA+0rT1DDOpbBQuCQq1WVQ0hGGrGZZGn/xeAPRs6X6EBTQIm2
	Oo6d1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffefwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:58:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C28D140049;
	Fri, 23 May 2025 15:57:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C9F0A73EFC;
	Fri, 23 May 2025 15:56:56 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:56:55 +0200
Message-ID: <27bf1d5a-dfe0-40d0-a962-63b80b0d29c5@foss.st.com>
Date: Fri, 23 May 2025 15:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25
 clock and reset bindings
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
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
 <20250521-lapdog-important-eab513a1f0c0@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250521-lapdog-important-eab513a1f0c0@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01


On 5/21/25 17:27, Conor Dooley wrote:
> On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
>> - drop minItems from access-controllers
>> - remove rcc label from example
>> - fixes typos
>> - remove double '::' from 'See also::'
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Conor

Best regards

Gabriel

