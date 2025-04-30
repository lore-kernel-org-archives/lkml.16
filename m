Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8F227BA5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029555; cv=none; b=QNKXGLA8NdvGPQ8Zf7on6DTOpBMUPXQfELGydSzggkazVEHheufMTqdozhfky16q0kLew6X+abrY2LqcnGb+HKBSJh+3diHJitylBhnUyZivPbZgsdl1nhvyWhtc5s9tbficudlqDM7z+Ss1gxOqPdgVOnoBCnIEfthO0PwfPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029555; c=relaxed/simple;
	bh=VeFlkvRrqluEcJumeLoaSe7Zch5bozTuOrqJP6XZglE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4YbIRvzY1kXjeiDLmmvD0FrXYnaLw0+WZv+RHZTvHizBJd6wdW+1gnpTeMWAyaBK7HwwySWuAFrBdvj0P8q705XMEgWpHx9v9J5IUdqgBkg/YoYbJiuRCX48BuhudM6XYnKTHH6jp9KpDvKivK6sBCPqp287B2sjP6gvxQBPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwzQb4ah; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwzQb4ah"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739525d4e12so98281b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746029553; x=1746634353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iJJqUV5zTq4SuKAwpTIhgwruln11bq0nuEzvblXoSi0=;
        b=CwzQb4ahj+daUyX3fjJpirtRlluYJjhj3EshY5QPEUfzy9q+GXLlTxAvZJdKwUeq08
         oQxtxDz4fnUx07KdenCy0zwzdyUqvCaCI1ocopKlrENYwGJi1BDrTZTFwurClwU4Ovsm
         UDB9RMoMyNzm9JCD3DbPO1Ffs7ka5ZvTxc1RH7wCDazr5uxv2/DEuqz2JAfQz9XgNvaY
         +1V/oWuG4nqbaowtweOGvE2M1dRbkEZwDwKp7ymQ/0tGlvritT0Z5s8IJLZriG21seGZ
         e69PHM03iZpMGwtNRItqTM+6gv1aJ0CoUHp5trJi38fLcRvp08bm3F4skfZ/ctKqhC3G
         VcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029553; x=1746634353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJJqUV5zTq4SuKAwpTIhgwruln11bq0nuEzvblXoSi0=;
        b=O4uD+xu7F2rPBNdB19NIbWxibr6Q9aYFmVD4RguWUtMpsjG3kioSqy0UT/BxHRUygu
         GXSj9suTHp5hAASYP6iCzt6DMNi86DANQ63dvtU1mfKcyCYHSMl00sddT2Lizp0hEOLJ
         nplcGuRakr64cjvEDWhMta9F3arYNW7xKNafGxFK50vPbBQ4/ruvfDLBFyv8zVQs7x0r
         87VkSjjqsya7tAYZON3ksfYHyiLTzn0ecqU/+cy2u0/c5Hlmh1mCxds1EaD0C6EM7SC6
         avj8aM8iuPZ2Of1pD/PexmFqgP7yXvygXNU1PDHX/EnalqWBmmUwPTSDMhwHKEWn3AkM
         Zwkg==
X-Forwarded-Encrypted: i=1; AJvYcCUavruAs5KzLsyaw6u5GRT4AjqXMjyvkfJbNjCsr9zqmQPGx5QTliwg+vr0akEhGULayWL7+D8tfy/HdfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5XDR7iVw3OQgl7jg5VtzHPe8XZK8GlzQW49Ay8g2qfXgVjFju
	EGe8aPJk/pgDRt+KZQ1I+T7nZkz187AdeywcjGSzPvBk8+u4hSY7
X-Gm-Gg: ASbGncsk+3QuD1o9BPatcqnCBy9CBvuCmlDnN8K5ttKmc5S+RJ6y2A76AoU+RivXGVq
	wKor6eVmNntKDkks7a0Kh0d5PTVk+eWyURuXzpk4bfbx1elm+Hcxf8iv+9WEff4XmoZ64oGjvng
	BXlkBbc3utSBnSjAXxB1FTAIobadPmcc8TajhJLMfka/uU2ej2YnYCr9aBYMWnsTsClfFaO2b2w
	Pv5U3Gf1TtsCBhZyoImQu+gCsIAwCbu6dQyK61XTlbROlLpqD23F/oW5Xh2GORKnIXdkIzuEN7/
	SiNcMbgut4vW8sWpbIeaFXVVS9FKscjeiJbciryLI6/KcsimVT0EFNq0keNSavGLIp8VEKAEdQ3
	tWnyrCE3FtD/joA==
X-Google-Smtp-Source: AGHT+IF1QxhqmtfoW+P880p2hcKc4dZLjzz4WUl32BwIYhDdro/3mUFzvKg09FJiMUNCnseO1GodKA==
X-Received: by 2002:a05:6a00:a22:b0:737:9b:582a with SMTP id d2e1a72fcca58-74038aac069mr6336536b3a.24.1746029552601;
        Wed, 30 Apr 2025 09:12:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c244sm1899143b3a.134.2025.04.30.09.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:12:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8fa9332-9475-433e-a203-e376845dcc66@roeck-us.net>
Date: Wed, 30 Apr 2025 09:12:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
To: Keith Busch <kbusch@kernel.org>, Daniel Wagner <dwagner@suse.de>
Cc: Hannes Reinecke <hare@suse.de>, Daniel Wagner <wagi@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de> <aBEW4W40ZelIXfs2@kbusch-mbp>
 <253e0551-d4d7-4ffe-8842-daecf1f6c753@roeck-us.net>
 <aBEdkUky_-bfgISv@kbusch-mbp>
 <8121b8d6-2b30-4086-b2fb-bce354f203dc@flourine.local>
 <aBJJQoOBhaXj7P36@kbusch-mbp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aBJJQoOBhaXj7P36@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/25 09:01, Keith Busch wrote:
> On Wed, Apr 30, 2025 at 08:43:04AM +0200, Daniel Wagner wrote:
>> On Tue, Apr 29, 2025 at 11:42:25AM -0700, Keith Busch wrote:
>>> On Tue, Apr 29, 2025 at 11:23:25AM -0700, Guenter Roeck wrote:
>>>> On 4/29/25 11:13, Keith Busch wrote:
>>>>> On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
>>>>>>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>>>>>>> index b502ac07483b..d3c4eacf607f 100644
>>>>>>> --- a/drivers/nvme/host/core.c
>>>>>>> +++ b/drivers/nvme/host/core.c
>>>>>>> @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
>>>>>>>                    msleep(100);
>>>>>>>            }
>>>>>>>
>>>>>>> -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>>>>>> +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
>>>>>>> +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>>>>>>                    return;
>>>>>>>
>>>>>>>            nvme_unquiesce_io_queues(ctrl);
>>>>>>
>>>>>> I would rather have a separate state for firmware activation.
>>>>>> (Ab-)using the 'RESETTING' state here has direct implications
>>>>>> with the error handler, as for the error handler 'RESETTING'
>>>>>> means that the error handler has been scheduled.
>>>>>> Which is not true for firmware activation.
>>>>>
>>>>> But the point of having firmware activation set the state to RESETTING
>>>>> was to fence off error handling from trying to schedule a real reset.
>>>>> The fw activation work schedules its own recovery if it times out, but
>>>>> we don't want any other recovery action or user requested resets to
>>>>> proceed while an activation is still pending.
>>>>
>>>> Not only that; there are various checks against NVME_CTRL_RESETTING
>>>> sprinkled through the code. What is the impact of introducing a new state
>>>> without handling all those checks ?
>>>
>>> Good point, bad things will happen if these checks are not updated to
>>> know about the new state. For example, nvme-pci will attempt aborting IO
>>> or disabling the controller on a timeout instead of restarting the timer
>>> as desired.
>>>
>>> Can we just revert the commit that prevented the RESETTING -> LIVE
>>> transtion for now?
>>
>> Unfortunately, it will break the FC error handling again(*). The
>> simplest fix is right above, add the transition from RESETTING to
>> CONNECTING and then to LIVE, IMO.
> 
> Gotcha, yes, that looks like the simplest fix for the current release
> then. We need to be careful with adding new states, so we can revisit
> Hannes' suggestion for 6.16 if we really want to split this.
> 
> If you send the simple fix as a formal patch, please add my review and
> the "Fixes:" tag.
> 
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Please feel free to add mine as well:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

