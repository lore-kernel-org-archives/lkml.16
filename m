Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802558F77
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951010; cv=none; b=R34OcOoEVhZWOV0I+4swFsAkHJGL4+Q417yd+JhR/RYl9MK455ft2R4iMi/OzyaQya235kgEri4s36urOCPQf3ped8mpQV5B27yqiURQNx3hf1QTZgeueZkTFIuT1fU90FWe8769GcHIu/gC3/ET4a2XIMDYXuh6ojRsvCIK9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951010; c=relaxed/simple;
	bh=+3ADR+cH0CbK0NKmfbbLGJBdzktgf/SlxMDS627dQgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umIoLZsmv1dsLWO3hvwok0LHtVhGamYRSsd0nhP3qOdr66Ve2ERq6rkaLvOiTv9KDWyDnZnPExmg4gnR+rLEeYzdWMgOpXMVGlRTO9fysHFchqXZcG1eeAYKjCBiEIhc5w1lU6KLln0bN4jtDP5+EXXkPNauvQPRqyAub704iqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePkkUHJ2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePkkUHJ2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22409077c06so102279605ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745951008; x=1746555808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GAf18Ji9JgpAG5KOErephGKphdnSleRNqAmCLZCu10k=;
        b=ePkkUHJ2Sh9Sj8I20mWVwJkkiCY+6BtLeJ54dY4O/lPrO4I36mK/lzZISAG748S8Eg
         jkENSVchL1Vw7fbNVZXwghmFiEzGA1/dLslH21MLVUG/7AkNUj/yCCM2B6WUQeWc2RDd
         2JqdVVnc4zHgQHuZ1moNhfTGGKPUjoReWFQFlggP+Q3CbY4bce3uMfrF2H/p3Vvpm2Mg
         XK2dPxOSkV9gja0cCgyP0PYWJziRezzVwl+Z+2ldOBhYfeUX3Nt8P8z6Z0spQ877BBCA
         P/539pR7oDInL0cYErWeT0w/kOX7VpUL+d1ThboaDmlk7kBbpp2lcWFn/SNNtrqlWCVx
         abKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951008; x=1746555808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAf18Ji9JgpAG5KOErephGKphdnSleRNqAmCLZCu10k=;
        b=E3Rsp6wAxY2ltZI/wUAgLEdBoo5WDHVxLvjSixAnziH15PHxxuK4ZR2N0rHyGHHA6W
         CprOyRS0TZTBs9XX+9IiRT87jGG4rJz6MgjjX5fhR3ZwekZJf5aw4jYeNitZeRsVWtci
         h7wIrPPs+M89H1I1dMJIMUe48B6/TYTuVms+3d3SMD/oLmHsFUo5F2LwMmkOlXnxOX6T
         G+8Q8/8nfBQol3Y1KIv/SYZkKZrE0CANZWF3y8NIWVlFmNlk4Y2bsyhWALOAdj3GmjVG
         JDtkZwZovSrKViY06adiQbe4bFxHx59j7k8Jz8jd/W2vQHEw5L+AIKjP/YKZzyBJ/jfS
         rDWA==
X-Forwarded-Encrypted: i=1; AJvYcCVuFAgemx9XtjNsfWdtL/V1uzunJOhWjeVyprZHYUclZG/hwNs43ldvnmzopih6CSKHgQr/pBLaYKRcins=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw221ImO91jT1AmpYExWNDEZBvzws5Adi2OzaGlhstGgVnWq1dL
	39kd6C8A/XWE+72oWFZnL/9zg+ZqJtSJY3f4+BQQjlMapEsuM8RW
X-Gm-Gg: ASbGncuJaRE3AYnYZAx/fyWKuASABGE1q7e9GZJ0HNnQw/THMpZmwnUpORCZU4p/rSl
	YuJGqBz9H3dWDGKIYrPjbBMSMe3Z+Xcxfw3AWo+noydU1lYaqMxWpdjdhSm5TTgweiPVoP0e+z1
	nvvGmWc9aNNBEIWc9Gadht4rhdsqdyOzksy6c7EvqaLdIvngsPPWWPeVZHExxtUSVwRRSzlBnzj
	Vd/kAB+auC78OVlUW0td5Op0CDymRywJOv5ll+xIkb1RO2Z2lQSB6vJ3bcgzmIgDTjWpWAKam2f
	/hlsAqNHM3GMkggZk6zIHPbgyVoTxJxbFh5KpjS2v2f+w0+2rqD8tMrVPqvqYgSs5kk2EWbuxRZ
	XDDSpxpkYt2vPUA==
X-Google-Smtp-Source: AGHT+IHMpQLALORtMi9sKVun9/H4ZHJwdsRSTKawyGw0F3/yv4RnrEuqwPv26YZAfD7Xo43y6ZqldQ==
X-Received: by 2002:a17:903:3c48:b0:223:668d:eba9 with SMTP id d9443c01a7336-22df34a97c3mr6447415ad.10.1745951007718;
        Tue, 29 Apr 2025 11:23:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa75sm9329038a12.56.2025.04.29.11.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 11:23:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <253e0551-d4d7-4ffe-8842-daecf1f6c753@roeck-us.net>
Date: Tue, 29 Apr 2025 11:23:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
To: Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <dwagner@suse.de>, Daniel Wagner <wagi@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de> <aBEW4W40ZelIXfs2@kbusch-mbp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aBEW4W40ZelIXfs2@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 11:13, Keith Busch wrote:
> On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
>>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>>> index b502ac07483b..d3c4eacf607f 100644
>>> --- a/drivers/nvme/host/core.c
>>> +++ b/drivers/nvme/host/core.c
>>> @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
>>>                   msleep(100);
>>>           }
>>>
>>> -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>> +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
>>> +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>>                   return;
>>>
>>>           nvme_unquiesce_io_queues(ctrl);
>>
>> I would rather have a separate state for firmware activation.
>> (Ab-)using the 'RESETTING' state here has direct implications
>> with the error handler, as for the error handler 'RESETTING'
>> means that the error handler has been scheduled.
>> Which is not true for firmware activation.
> 
> But the point of having firmware activation set the state to RESETTING
> was to fence off error handling from trying to schedule a real reset.
> The fw activation work schedules its own recovery if it times out, but
> we don't want any other recovery action or user requested resets to
> proceed while an activation is still pending.

Not only that; there are various checks against NVME_CTRL_RESETTING
sprinkled through the code. What is the impact of introducing a new state
without handling all those checks ?

Guenter

