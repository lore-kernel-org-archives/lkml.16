Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6276C61
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867737; cv=none; b=RTzdLficXv2CJmAv4+HEG5rTilfEgT7Az0zW3ZgO6Fm/J6xxQB0iMbnpS3K35/t4/1VKwM5TMBppm1r00KNhVS+aMi/dVFWe7Bu66THqhJUPF92t43bW2bHJE3Aaq7NS2Uam8dcjHEgQlfJogXWjEOWwBnNeo1NxhcfbI/fHo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867737; c=relaxed/simple;
	bh=6EuACr52xq/37QMgatS0sOBdCCEvBQF2mWjnJc85ksI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OLfXFEwH0ajhjfIsIR6ZzmaCnkycyKnB2Ua/TCN6ygaXdonU7/Dikrt8toa3TVpKV7uS3CbmTYR04CnA0q4ljcsdnfWpwPpvepAtO5Vpf+06sIsDpYtPorK4Cy4As6LHaSbZyzZEcsQoIyiWeE9ivaOba1dDaXhSAruf8It/n1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=paY4TVDu; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="paY4TVDu"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SJFQ4A3483992
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 14:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745867726;
	bh=lBCJPzECeQ94pyLvoYBNYZYvuPQv+pUF49fQn7m2S6o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=paY4TVDuTXutO7pM+NNIDs0LVN2B+hE4gQ/q8uG9n7nIZhh5fsJdClT60QCAGHPGn
	 MlmpvvzW8gdmibeUGN3BhVFEOypPNlhE1rHT6ZvXOfUxZY70/4pHV0WGoJsV2HHyUS
	 z91bBLmk4ul5PRMYkYDsxgUb0XaFst9rzXoglBpQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SJFQCM127901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 14:15:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 14:15:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 14:15:26 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SJFPe6065459;
	Mon, 28 Apr 2025 14:15:25 -0500
Message-ID: <76193d4e-965b-4029-98ba-393870e5f86f@ti.com>
Date: Mon, 28 Apr 2025 14:15:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: ti_sci: Convert CPU latency constraint from us
 to ms
To: Nishanth Menon <nm@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250425153754.2141984-1-k-willis@ti.com>
 <20250425190803.s7bag5fop7hsxcxe@sliced>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250425190803.s7bag5fop7hsxcxe@sliced>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/25/25 14:08, Nishanth Menon wrote:
> On 10:37-20250425, Kendall Willis wrote:
>> Fix CPU resume latency constraint units sent to TI SCI firmware.
>> CPU latency constraints are set using the PM QoS framework. The PM QoS
>> framework uses usecs as the units for latency whereas the device manager
>> uses msecs, so a conversion is needed before passing to device manager.
>>
> 
> If this is a bug fix (sounds like it), follow the stable kernel rules.
> 
> Also please do not expect reviewers in the community know what this
> means, I think you intent to point folks to the url
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-set-latency-constraint
> 
> If so, add the reference to your commit message.
>  >
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> ---
>> Test log [1] shows entry to MCU Only low power mode by sending a CPU
>> resume latency constraint of 100000 us using PM QoS. MCU Only is shown
>> to be entered by 0x1 as the printed mode.
>>
>> [1] https://gist.github.com/kwillis01/059a2ca38232387b414bc6f4b87c7475
>> ---
>>   drivers/firmware/ti_sci.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 806a975fff22..bc138a837430 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>>   	struct ti_sci_info *info = dev_get_drvdata(dev);
>>   	struct device *cpu_dev, *cpu_dev_max = NULL;
>>   	s32 val, cpu_lat = 0;
>> +	u16 cpu_lat_ms;
>>   	int i, ret;
>>   
>>   	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
>> @@ -3682,9 +3683,13 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>>   			}
>>   		}
>>   		if (cpu_dev_max) {
>> -			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
>> +			/* PM QoS latency unit is usecs, TI SCI uses msecs */
>> +			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
> 
> round_down or a round_up? I assume you intent round_down, please
> document that in the comments.
> 
>> +			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
>> +				cpu_lat_ms);
>>   			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
>> -								cpu_lat, TISCI_MSG_CONSTRAINT_SET);
>> +								cpu_lat_ms,
>> +								TISCI_MSG_CONSTRAINT_SET);
>>   			if (ret)
>>   				return ret;
>>   		}
>>
>> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
>> -- 
>> 2.34.1
>>
> 

Thanks for looking this over, Nishanth. I will implement your comments 
in V2.

Best,
Kendall Willis
