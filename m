Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978C1F3B8B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669700; cv=none; b=g4UcPWwLImMmspHY7kx0qLRxNbcDLJcIRZbtKDIU+QdbZyEGb8tpuoeaMmuLfo6rYTSW0mJUVRFmVJjFXqVxEfoFdHDWrLTVoUcPXJFKrfxfIls7L0Pat3pW6wQohYjRwc8cuHF6TsXluvkKCIJhDeDiEQDVPFOFL1xR3I3+s8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669700; c=relaxed/simple;
	bh=GYC2/6x9N+95MGF5/R1C9EvLfL1QTUU90tcZuaWd8GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPwueELD4rfai6vBCCTSzoVmAVS0kBSa5/Ek6GnfskHfka7DRujQ5iR/CSqTQgjn77RL+KFhbdN3VuY1n17zd92CZBiuWCHQV2xey97AeJkKvzPSlkNV1/SorxCZtOTUPuT2fL6nYMLB9FT1ZY7+cxdmDVYsbyuZVQRIBB1YR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4580422f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669697; x=1745274497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kGU6A6Jr1/mVprmOIpSU0J1mrESNNr0cDnyTghWIYo=;
        b=dHH/ZGjGHrQZii53Hb4bUFeUJDakFboCwS/tmFO/EHz51DLRp7rKkIH7LnGNa8nc1h
         KMdmt0Le53DLL12Nab38+yWbF92s1La4ENO6xcq7hHoE6tk/UXbra8gZVKtY5QHv6xG8
         DstZCX7d4w70GucMr23L+yd4yBmac6bRM6UnnpUVRVjsi15Xi8l9QWMl9+w8oSad5ada
         aTnJITDuBuhmqFAk6ha5TyCgQLyCC7PrNagN5x1Ov4wX60OOI6MFAkq+dI1bcbHy39TE
         N94E3MbHLLRE0nc7ZQdFLxcNmnSi+3AGu01E1aHV2UYsbUtvwk6kKFQhT6RK7ijHyMv3
         uNcA==
X-Forwarded-Encrypted: i=1; AJvYcCXj2cNwFpMDXSI57Kaba2xPuGls4ienFdOCNdLiaZ8YmkKqlVQiQG74T5MLzVpxEn5cdAvefQMc28iDQec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHSRhfvugT9hIZP7edQyz7wX8oe1zqc7TFqDPbc8ERe79jlbj
	xVnhNQ2faCbdIjJtZv+5PmRg3d8Kc2HWrIqj3ccrPQf5AV7DoDbu
X-Gm-Gg: ASbGncve1dZV2yCwFQnp96/86+9S9xHcKedqluy5YM8lURMkkyJwXD5mgR5gLC5+9ED
	N+BZs1lyXI6anxeydfQ3a5ybZVxBDXBgn8bsShZsPtwCSc+a7NZWJBFHD1VOcUPn8GBIj9D8L5x
	rY2ocs+bFKUQW1cbtrIzZxzN9TJJUssgVVjnDQ1eq8l2MOHTViEPrEuMAnn8piKEF3VjXGzy6ku
	qfC15YHW5eowth9UkM3wrwVnGw871We8dLPkWjy2gw3uOh7jsE8OPegJGNPctNojcFc3Gh41FlS
	9I4pJrYpebPH4NaoEeVVZklYALafoE37W/bqvFXKtctskXjZIEVIIFRrr1htViBNsU8nPg2k
X-Google-Smtp-Source: AGHT+IGvEqNrRzk769p8HhSi/2Qv7EgWRPN9cVexNSBgMUaNihh0RLlvC98RK4ZriM82pD4bGWBV6g==
X-Received: by 2002:a05:6000:2586:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-39ea52171d4mr11476328f8f.25.1744669696641;
        Mon, 14 Apr 2025 15:28:16 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm12098902f8f.7.2025.04.14.15.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 15:28:16 -0700 (PDT)
Message-ID: <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
Date: Tue, 15 Apr 2025 01:28:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Daniel Wagner <wagi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, John Meneghini <jmeneghi@redhat.com>,
 randyj@purestorage.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250410085137.GE1868505-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/2025 11:51, Mohamed Khalfella wrote:
> On 2025-03-24 13:07:58 +0100, Daniel Wagner wrote:
>> The TP4129 mendates that the failover should be delayed by CQT.  Thus when
>> nvme_decide_disposition returns FAILOVER do not immediately re-queue it on
>> the namespace level instead queue it on the ctrl's request_list and
>> moved later to the namespace's requeue_list.
>>
>> Signed-off-by: Daniel Wagner <wagi@kernel.org>
>> ---
>>   drivers/nvme/host/core.c      | 19 ++++++++++++++++
>>   drivers/nvme/host/fc.c        |  4 ++++
>>   drivers/nvme/host/multipath.c | 52 ++++++++++++++++++++++++++++++++++++++++---
>>   drivers/nvme/host/nvme.h      | 15 +++++++++++++
>>   drivers/nvme/host/rdma.c      |  2 ++
>>   drivers/nvme/host/tcp.c       |  1 +
>>   6 files changed, 90 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>> index 135045528ea1c79eac0d6d47d5f7f05a7c98acc4..f3155c7735e75e06c4359c26db8931142c067e1d 100644
>> --- a/drivers/nvme/host/core.c
>> +++ b/drivers/nvme/host/core.c
>> @@ -239,6 +239,7 @@ static void nvme_do_delete_ctrl(struct nvme_ctrl *ctrl)
>>   
>>   	flush_work(&ctrl->reset_work);
>>   	nvme_stop_ctrl(ctrl);
>> +	nvme_flush_failover(ctrl);
>>   	nvme_remove_namespaces(ctrl);
>>   	ctrl->ops->delete_ctrl(ctrl);
>>   	nvme_uninit_ctrl(ctrl);
>> @@ -1310,6 +1311,19 @@ static void nvme_queue_keep_alive_work(struct nvme_ctrl *ctrl)
>>   	queue_delayed_work(nvme_wq, &ctrl->ka_work, delay);
>>   }
>>   
>> +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
>> +{
>> +	unsigned long delay;
>> +
>> +	if (ctrl->cqt)
>> +		delay = msecs_to_jiffies(ctrl->cqt);
>> +	else
>> +		delay = ctrl->kato * HZ;
> I thought that delay = m * ctrl->kato + ctrl->cqt
> where m = ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
> no?

This was said before, but if we are going to always start waiting for 
kato for failover purposes,
we first need a patch that prevent kato from being arbitrarily long.

Lets cap kato to something like 10 seconds (which is 2x the default 
which apparently no one is touching).
