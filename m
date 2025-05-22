Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20B1A725A;
	Thu, 22 May 2025 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939679; cv=none; b=aNXmEtwFODlfdmD4NBr8DtR315bPuBHo0bSnhRsJ82+p3+1gWrMPAS1rGET8ylju/7Lw76ywMwBjj7sl5hg9KKzTr9H8ULN3Y/gUk/97h0DE3H8XaUiMUpdG7JCdcxCRINBEgbBNqfQ87vCPvZPNGaWM/vihXFtanVDdEsVCiNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939679; c=relaxed/simple;
	bh=q0JKMkIPM+QvuI8I+FRDnaRfPPatAv6UzNu73tMJTfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YidxHvr7cI2+ICoMTcV66zRBboeKgi1+yMzMg3Q01uwPWx7xRuCPnSL97EQAU+Gh5cGuMF3Hvcl163DXl31pVHH8Or1hQg1uAkkf+QW/mohZEtIF1QWOlnhUQkMYooV2q+n3cv1HxS2eIWkyNLDZqmSjSaxDzyrmwRi4BVyEuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5Oy7Q6W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5Oy7Q6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAE1C4CEE4;
	Thu, 22 May 2025 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747939678;
	bh=q0JKMkIPM+QvuI8I+FRDnaRfPPatAv6UzNu73tMJTfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5Oy7Q6WFJFNvuh7z1gPL1ATexPC1FmN3Ywgyg3bjH1DZHFtOPFPnRq9ZnTPSIDy6
	 88C45nFUe6ZA60vdfZgzPKxWrV+7tdOhIVlaIADWcYllMW+MA/9VlZ8PgM7A5Iog3D
	 +D0C6CrM2YnVcGYtoVzcll7XYjtzbe9yqIBEF6x9/KkUIfzW8bBP6z5XOTHfCbeJgS
	 MiDwWWITxK2rWWHAqn2VPYXlhc5CGKkKLbjdV5KaxsECofloo3UeeMxhXjuHeNVhMS
	 FEX3apteYkZ+qgQXK9cw7bSKPlD9ybVz6Ncs9L0x0SKBqnmVRWknUf88ucfVpvvYjK
	 40lI8M/wxDSqg==
Message-ID: <111ba367-8e26-4b45-9206-d7a28038abf2@kernel.org>
Date: Thu, 22 May 2025 13:47:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix 10 service channel
To: Mahesh Rao <mahesh.rao@altera.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-3-fae5c45c059d@altera.com>
 <b92f2ad2-7cca-455d-af45-cfd418bf54bc@kernel.org>
 <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
 <40b939d6-9339-444f-a2e4-3e4cd4bcb317@kernel.org>
 <ea381d6e-3554-429b-87ae-74451c72d4a2@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <ea381d6e-3554-429b-87ae-74451c72d4a2@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/25 05:33, Mahesh Rao wrote:
> 
> 
> On 22-05-2025 01:48 am, Dinh Nguyen wrote:
>> On 5/21/25 03:42, Mahesh Rao wrote:
>>>
>>>
>>> On 19-05-2025 05:28 pm, Dinh Nguyen wrote:
>>>> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>>>>> From: Mahesh Rao <mahesh.rao@altera.com>
>>>>>
>>
>> <snip>
>>
>>>>> +
>>>>> +/**
>>>>> + * stratix10_svc_async_prepare_response - Prepare the response 
>>>>> data for an asynchronous transaction.
>>>>> + * @chan: Pointer to the service channel structure.
>>>>> + * @handle: Pointer to the asynchronous handler structure.
>>>>> + * @data: Pointer to the callback data structure.
>>>>> + *
>>>>> + * This function prepares the response data for an asynchronous 
>>>>> transaction. It
>>>>> + * extracts the response data from the SMC response structure and 
>>>>> stores it in
>>>>> + * the callback data structure. The function also logs the 
>>>>> completion of the
>>>>> + * asynchronous transaction.
>>>>> + *
>>>>> + * Return: 0 on success, -ENOENT if the command is invalid
>>>>> + */
>>>>> +static int stratix10_svc_async_prepare_response(struct 
>>>>> stratix10_svc_chan *chan,
>>>>> +                        struct stratix10_svc_async_handler *handle,
>>>>> +                        struct stratix10_svc_cb_data *data)
>>>>> +{
>>>>> +    struct stratix10_svc_client_msg *p_msg =
>>>>> +        (struct stratix10_svc_client_msg *)handle->msg;
>>>>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>>>>> +
>>>>> +    data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>>>>> +
>>>>> +    switch (p_msg->command) {
>>>>> +    default:
>>>>> +        dev_alert(ctrl->dev, "Invalid command\n ,%d", 
>>>>> p_msg->command);
>>>>> +        return -ENOENT;
>>>>> +    }
>>>>
>>>> What is the above code doing?
>>>
>>> This function prepares the response  for clients after retriving the 
>>> response from the Arm Trusted Firmware using the polling call. 
>>> Currently only the negative scenario is shown for incvalid command, 
>>> the last patch in series adds command for hwmon for the positive 
>>> scenario.
>>>
>>
>> Okay, but this is confusing. Please just add this to the last patch then.
>>
> 
> Shall I combine the last patch for adding hwmon commands here so that 
> the framework has some command usage?.
> 

I like the idea of splitting up the patches to be small, but I don't 
think combining them is the right thing to do either. Each patch should 
be able to stand on it's own as well. The HWMON commands are fine in 
their own patch. You don't need to put the switch statements in this 
patch, because nothing is being done.


