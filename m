Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418371DDC37;
	Tue, 13 May 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149896; cv=none; b=RLoZu9yJhZxVRgoIeX9u8uvZBz4+HYiZdvsH4JDJn3R7tqX7QWVGaMA/LYYAI+LFANfS9M6OaHIA3iDQiq2ONGgtqrx5/OjRqt0i6dReBCJ0tJXaCpfuk1qUnwU5gjdWASUXQAXXBHH3TDmX7RtbRYsUGLpk5QZpJJpa/1D8hwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149896; c=relaxed/simple;
	bh=ldabwZbfmu/cUWRNTF5lR3eSKA1zCVBJ3Ef5/yPAGkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rOu7CaRyTWnkaOEkYYFMVewr4y2DN3qSFfGSoNf31Yb2DsjeTa2Zm7NDkczsy5duSDaLQDk0SJQErB6KH6Umr7Tp/JypC9Fifc4zBJjum7PzD6/dzp351RZy3guEUO1ajq4o/V1LTzOY/t/ljJA4yDsNTTrsOPiULeXbpNb4i4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6WjYTtlF; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6WjYTtlF"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDxVGf019621;
	Tue, 13 May 2025 17:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	e4Aq7HPeyHmZNMONnd/Qv8JQOHr8stkcWD0o0/Qj+zY=; b=6WjYTtlFh2jVpF6c
	sAiuYst1VrwSG4Uu1J3k6lhmhRQFOjgBZAjZsSpgkJauvx9f1zwfbvNspQ7atVbd
	iKp5tMvKZ6JFMQLPXPzQALgN9KBKwa/8OCI/Xwv6xwUYVFig7OsacuQ9vCBMgJKX
	wGpe/oJTOWyIvZnUs83Fx9VAdQt4gETCdSELW9yHlAHIbRLFnucKgKj1VcGcxMC9
	uMFD7keTcqOFIceCsICL89TuHQHFjgXzT0iitYSh9R3XX71dhpJ8+3LQj5Hc4fQ6
	esm1fowNraTMATZLvrA94zjT9UakGtQJhX5aBsYUHY5rC3sEYOLwBs977cDbhAME
	tN5OfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hx51cvaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 17:24:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EEF74004A;
	Tue, 13 May 2025 17:22:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4592B1D1AF;
	Tue, 13 May 2025 17:22:02 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 17:22:01 +0200
Message-ID: <33c35580-e6d6-4c66-80b4-2f5769ce4e67@foss.st.com>
Date: Tue, 13 May 2025 17:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
 <aB29hOrv0nU73RCn@stanley.mountain>
 <cff1ddb5-b438-4287-80cf-3969f7b7b767@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <cff1ddb5-b438-4287-80cf-3969f7b7b767@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01



On 5/13/25 09:54, Krzysztof Kozlowski wrote:
> On 09/05/2025 10:32, Dan Carpenter wrote:
>> On Mon, Apr 28, 2025 at 10:58:31AM +0200, Patrice Chotard wrote:
>>> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
>>> +{
>>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>>> +	int i, ret;
>>> +
>>> +	for (i = 0; i < omm->nb_child; i++) {
>>> +		if (enable) {
>>> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
>>> +			if (ret) {
>>> +				dev_err(dev, "Can not enable clock\n");
>>> +				goto clk_error;
>>> +			}
>>> +		} else {
>>> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +clk_error:
>>> +	while (i--)
>>> +		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int stm32_omm_disable_child(struct device *dev)
>>> +{
>>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>>> +	struct reset_control *reset;
>>> +	int ret;
>>> +	u8 i;
>>> +
>>> +	ret = stm32_omm_toggle_child_clock(dev, true);
>>> +	if (!ret)
>>             ^^^^
>> I'm pretty sure this was intended to be if (ret) and the ! is a typo.

Hi Dan

You are right, it's a typo. 

Thanks
Patrice

>>
>>> +		return ret;
>>
>> If it's not a typo please write this as:
>>
>> 	if (!ret)
>> 		return 0;
> 
> For the record I consider this a bug report which still needs addressing
> by the authors.
> 
> Best regards,
> Krzysztof
