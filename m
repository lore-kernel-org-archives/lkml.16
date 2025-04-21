Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577B1362;
	Mon, 21 Apr 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745236948; cv=none; b=Mqi5ledGZJdMXqUJ5RlBLw/IQicvtzOKiRr85ajdHZnTUUvp9BeUZuGtvQo7CaLuQOdAlw4ke0MzmMqXpCgYqSIRnHhF41Zxp595Pzem2pJnFX8AXHIr6W5weXf/TBbG7VX0RRbwWCDy4dbvdR8JI4aOfHyy5EVt9Q0anxH/i/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745236948; c=relaxed/simple;
	bh=1vMq+rgVXm+nnHuhn8FvZrITzH6C+P1zT/oD8UHsssA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f+tJZuGxrTLNiAwz8KazgWFJtp9udlJSwNTRO4HgZV1wofdjWK3na13jteJtb5UDofvcHJmEncED0GU25u9dxHU5c/lF+c6P1ViwzFGJSRdiX65BIaI+I0YPP77DBeHjSQYihsMtT1smXRwqTfcRptI9Ok9gy0zg8hBP3SJ3iIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xssQn3jC; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xssQn3jC"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LC2FoM1616124
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745236935;
	bh=BD7xSvDOtjjn0N4MV1/8yTlPk2LHTF7F477X62OPbhQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xssQn3jCFG+ePxngYzVYU/SBHq6vynTNR0kPMnSYV96Ru9/uTz2E7Tm1lN2p7wRAK
	 2rL7LTeH2MEz5dJfemqGJMmlKhNmMoo+i0GSMgF7DQVcu2pMOcbimjoVkdDLY4TdWu
	 DjLgxJE1XvTcJi4w/5s4p/TCdIB3vNNhQP3cq/qo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LC2FqL021846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:02:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:02:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:02:14 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LC2B4g006706;
	Mon, 21 Apr 2025 07:02:11 -0500
Message-ID: <18ff4046-34fa-48bf-a1e8-3472de46ac01@ti.com>
Date: Mon, 21 Apr 2025 17:32:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 DisplayPort-1
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-7-j-choudhary@ti.com>
 <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <945e0247-a971-48de-adb1-60a1e7fe5f24@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Udit,

On 19/04/25 14:59, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Enable DSI display for J721S2 EVM.
>>
>> Add the endpoint nodes to describe connection from:
>> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>>
>> Set status for all required nodes for DisplayPort-1 as 'okay'.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index f691ae4c19e6..15a7d9b813d3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>>                <3300000 0x1>;
>>       };
>> [..]
>> +
>> +&dss {
>> +    /*
>> +     * These clock assignments are chosen to enable the following 
>> outputs:
>> +     *
>> +     * VP0 - DisplayPort SST
>> +     * VP1 - DPI0
>> +     * VP2 - DSI
>> +     * VP3 - DPI1
>> +     */
> 
> Sorry for basic question,  In this series , you are enabling only DSI 
> interface.
> 
> why you need clocking for other interfaces ?
> 

We do not need them.

We only need clockID 14 with its parent clock as 16 (which is not the
selected parent by default)

The other display on the EVM (MHDP on DP-0) will consume clockID 2
whose default parent selection is okay.

I will change this.

Thanks,
Jayesh

> 
>> +    status = "okay";
>> [..]
