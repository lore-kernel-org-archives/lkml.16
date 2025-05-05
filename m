Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE4141C63;
	Mon,  5 May 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449632; cv=none; b=TBESA/Rsd9d/8bCWF4TU+pWkuQ7tXuvsyHF5m9djob8P9/Z46e2FU0vgIG6TlX/FXWPhc0ENJZcYuplo3ZgAKvb5FFJGP7TqEmQv22X/vpXGVKzzbMNHyFANuVjM4OtBHQuKMEpfsK/9/A8rH8RpQsJH7AAKgO0dmfMlqj0Qgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449632; c=relaxed/simple;
	bh=V8b3pEfvhaQlw67HmAf2CHOrUuSPji7iXtzlP2LMMmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZDJi8j+h67MGVRADE98RfIp3T4myfdpvj5Ah1NK959+V5qFISyxmiptwvI/xubNMa4Wf2Ub/OR9KSThFByXxF+kt8tlIEIFshz7UvJZQ4X/pZPVBo0zAkdH/HkH4Rsh7chJjTAJLJy7gz1JqZ3YOdbfvLdJPYa8pD7b2Zug1SKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GXsQryc0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GXsQryc0"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CrUAs224792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746449611;
	bh=pN/hJ2/tR8aIxvF43AzkTdJbZKN49d7SnCAQeO3ZtQg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GXsQryc0gX0twUQHUcGdrIE0WENDfK0kglBO5GJNoCUcQQTVvLFBrKGggKfNiHUNt
	 zK6aJl5Wsek/yogbV7WR9joSBNd8/YRihig78uw+b7gR4syz91G8t7ixQd+uLIR971
	 Fhfl+udKKl5Fdi2vFVbn/YlaaZznRtOOzTH65yho=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CrUCE051150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:53:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:53:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:53:30 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CrQBW013511;
	Mon, 5 May 2025 07:53:27 -0500
Message-ID: <5d2aa775-a374-419f-b800-e1db96986660@ti.com>
Date: Mon, 5 May 2025 18:23:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1
 on J721E
To: Nishanth Menon <nm@ti.com>, Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250505112731.2515734-1-p-mantena@ti.com>
 <20250505123832.shukji5gfx3erjdq@lustiness>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250505123832.shukji5gfx3erjdq@lustiness>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Prasanth

On 5/5/2025 6:08 PM, Nishanth Menon wrote:
> On 16:57-20250505, Prasanth Babu Mantena wrote:
>> J721E SoM has MT25QU512AB Serial NOR flash connected to
>> OSPI1 controller. Enable ospi1 node in device tree.
>>
>> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> ---
>> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>>   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> index e3d0ef6913b2..3112b351c052 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
>> @@ -571,6 +571,7 @@ &usb1 {
>>   };
>>   
>>   &ospi1 {
>> +	status = "okay";
> Follow Documentation/devicetree/bindings/dts-coding-style.rst

Also, please use Fixes tag

Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few 
peripherials"


>
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
>>   
>> -- 
>> 2.34.1
>>
