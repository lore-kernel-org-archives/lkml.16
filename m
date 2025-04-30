Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967633C6BA;
	Wed, 30 Apr 2025 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994599; cv=none; b=YqjuuQHhQmirYY1pnE7OAuYfvOMn5s42hZRWNQnE75MGgXhxPyn2r4UfpHwXJNfgndKhUBdXAM0nJOzcAZo4oKT340ecDPSl9jS4cPVku0xtQBaTkKauIs4xoV/Y1fo3s21L7meLPFHhBOYAqLj7rAEoHqMpYL9k0itO13supQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994599; c=relaxed/simple;
	bh=CksxwlboSXNvBIO4qwDbq2f0Wj8LnjMlRZ1a92Qj1uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KNr3A1AJ9JHKxR51KSAfvt7PiMfntwM2BQPkhC5XXz0Xhx/WNsgktrxUgDLJYuQ2PWYibeYHKje+peQFULNo/PtA39JawXRnVchzLi7zCKV+bDoJeHRH29xisy10OCYmwGdc9b8ZFESXNglU533QF6haCeuPUkUagtYqaBh8+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=R/ezM1GK; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="R/ezM1GK"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZhZ4026649;
	Wed, 30 Apr 2025 08:29:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DKGs8pWqRz5fgySPRSKxsWNGQtApl7x88mhEfyirBMg=; b=R/ezM1GKkmn93rcW
	MUTPTqXaoWuIQ+tKQkB+bLfr314SkR3E5wJWFGIdOwexGCo0QYXvJaj/087D8ix1
	MdcW6985sCHesT8DrQdltTR08K4AEvw0A8wxrKKQutvt6p62Up+6Jr1RZ+W6zlQB
	yqXbdNraO9Z6TkEupEHC/ypr+W7dQqkZSECPXhvjc5A66JbgoNzXYY8hL4VjLYUi
	Okdn6fwB31sYFa8uQD2N3kyPOutDmdzLtw/81xWLLmM4VtC+4ztS6/ub2GLAPdY+
	ffJaL3XPMWU7RLfWh8y0dYSAwTlmGgOhctuqUH53Dp0F3d5VvR45cdmb4mWgQdNp
	Z1GJBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmscqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:29:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 191C640044;
	Wed, 30 Apr 2025 08:28:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 315E2A398DD;
	Wed, 30 Apr 2025 08:28:20 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 08:28:19 +0200
Message-ID: <9d95a3eb-f656-4037-8412-1967660b6430@foss.st.com>
Date: Wed, 30 Apr 2025 08:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
To: Olivier Moysan <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01

Hi Olivier

On 4/3/25 13:59, Olivier Moysan wrote:
> Add vrefint calibration data in STM32MP13 device tree to support
> STM32 ADC internal channel VREFINT.
> 
> Olivier Moysan (2):
>    ARM: dts: stm32: add vrefint calibration on stm32mp13
>    ARM: dts: stm32: add vrefint support to adc on stm32mp13
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 5 +++++
>   arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
>   2 files changed, 7 insertions(+)
> 
> 
> base-commit: 65954899a157832f68536b488194cf698248a26e

Series applied on stm32-next.

thanks
Alex
