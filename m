Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5581D86DC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667103; cv=none; b=lFOQ5Z+980xZHGhYEPwmk7ZXGcsMUFiaBcM6gZwyKOgaZ45SreeWt8DkqjqNzchkTya68zxpw4LQVhyTn8bUXoY5zFio/pCjiYSEV1NMwXZGE7LJfMZionpcWNe4cqW82Lo423ypRf1zQPexRfXj7GarUDczJmhZobFtVyTDKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667103; c=relaxed/simple;
	bh=en8QrJPhsNrl7YK82mZ5WzMrvKzHhr21END3yzfm6LI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kDlDBdObSiQr3ddi0dJ7ZyMteaeVFKMTencMThwqBGND0ufcA0x/3bcLyhI1x5U7oC9mqkCkC1jMJj0bzkbG44J9H9ylGqQI4XLls1ymp5vtGoxOGL+/nGTyyVguY438Vw+24hujcdA2lsmTdWkqD+5xIHAgnt1ARyYSRMgM+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoRG93o1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoRG93o1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750667101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jSW9p1LFhnQZlRzlNm8vMLHTJK3KRvHXtgF/U+dj4Q8=;
	b=CoRG93o1nkinbBgG01qfkZR2ywX3MGyFvg2hcARBxQdyijAWQWb0FgcuQ6ly8WShYMMSHm
	MfU8A9+qBU8A7QcPbEnK8nb0y8vZO58CfQTgolQnISC31CmNvtF2yWqUpDOhXEc6s7xwQ7
	q431jDi82WyoOUh97xbwXv/iSd/nY60=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-LWBR_lctPpSBalGsuWmgmw-1; Mon, 23 Jun 2025 04:23:45 -0400
X-MC-Unique: LWBR_lctPpSBalGsuWmgmw-1
X-Mimecast-MFC-AGG-ID: LWBR_lctPpSBalGsuWmgmw_1750667025
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1562440f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750667024; x=1751271824;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSW9p1LFhnQZlRzlNm8vMLHTJK3KRvHXtgF/U+dj4Q8=;
        b=JdhyyP8DwQkXJSQ6UiaTjfTQJrGb7gCmm8WbTxfUnkIG5wD73t+CV8o0TH1Y4T94mD
         Ejz/3Sc1V2pENCiavZIFqHB45E0WFQnnFq6cuCl5gx896gHOxt7vWJn4kbz066+4cCvV
         9iOVy04eMf5UuW2IhqIyjriLt4/JZyDziox/QMI1QeM51rBaWt1xKAl5wUU947mm7j0W
         LPqJ1XaGWAncOBxaYAQTGY8ldV5MPsmdwS4lK+R+0HaEUQEzcFOBdDJsGBXOfaJthdnT
         oYOLcEpWSnh2/Pt+64xYkIpsnT5zgMx9t41pIxUk+2DCSUQEkBWdToeZQnHjhlFPCsw/
         rstg==
X-Forwarded-Encrypted: i=1; AJvYcCWfSWVSSbQj1yIxARN1GdFXy0synurRvJQun5pbjqWBLVdmkfSyLDJTkAIjxn5Dq2LifyK8RSFOwVLed1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kcQNK4xzuMyfGOU+06dGsnXdh/h5O3w2tyeOSre9rSZykju/
	Mkw71d7TidxYT2UKT7qAMB2DpVFzZWBXm4d+QopYEyEYSN/hu3mvhmn57zAGxF6pTCOZSJpeFvh
	AOesUnFCTbWleEjdrQyo7lLP9SUhaEo1pqrvcnM9tiljYmrY6JdMDWNu2tCE8QKhG5w==
X-Gm-Gg: ASbGnctPIXvVC31pjbGoZZz4PFbvJxqmVuMN72cdLLTnES/k4Z9+s3gPndxr39qTFmB
	JRPeIFjzZ+7nXd3w5M2MtWONU9B94ddK0e4ofhm1K+0G5UEisKPQUZivn2Wn3OHX4HuGBTs/r92
	AMTfFVPDfFHNdgFYSie9atyE8LmXP5PB9qrLKXT2j0/Xz9lzT48mM/tA/YWIL024X8ax+kgc23f
	ZkllLh+Nse4yDZAUZ5SDsE1WBCnUdh2R3c+F/KRutEQL4S0S5EaxpF4WxMeB3IIFV1UK4IWcpVu
	WoPfXXJAUsixcYoLVsn5rX7M1xw0Rm13ZHuAdBlJ3UDAzhycPd+a8r4baTEivA==
X-Received: by 2002:a05:6000:4282:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a6d13130b3mr9743546f8f.46.1750667024670;
        Mon, 23 Jun 2025 01:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4FMRtntVzqGm4uW67TEz4zWMScYCoKrEWMQ/X31AJVb/Pub9G52VV3df8sIk+2vF8etjpg==
X-Received: by 2002:a05:6000:4282:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3a6d13130b3mr9743527f8f.46.1750667024316;
        Mon, 23 Jun 2025 01:23:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c? ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8edbsm136655255e9.24.2025.06.23.01.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:23:43 -0700 (PDT)
Message-ID: <0c4b28a6-44c9-4b9b-a917-634c24d0e01d@redhat.com>
Date: Mon, 23 Jun 2025 10:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
From: Laurent Vivier <lvivier@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
 <20250528031540-mutt-send-email-mst@kernel.org>
 <ecfe7d40-257a-426c-b200-4fd62f18cde7@redhat.com>
Content-Language: en-US
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <ecfe7d40-257a-426c-b200-4fd62f18cde7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 15:07, Laurent Vivier wrote:
> On 28/05/2025 09:20, Michael S. Tsirkin wrote:
>> On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
>>> On 5/21/25 11:22 AM, Laurent Vivier wrote:
>>>> This patch series contains two fixes and a cleanup for the virtio subsystem.
>>>>
>>>> The first patch fixes an error reporting bug in virtio_ring's
>>>> virtqueue_resize() function. Previously, errors from internal resize
>>>> helpers could be masked if the subsequent re-enabling of the virtqueue
>>>> succeeded. This patch restores the correct error propagation, ensuring that
>>>> callers of virtqueue_resize() are properly informed of underlying resize
>>>> failures.
>>>>
>>>> The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
>>>>
>>>> The third patch addresses a reliability issue in virtio_net where the TX
>>>> ring size could be configured too small, potentially leading to
>>>> persistently stopped queues and degraded performance. It enforces a
>>>> minimum TX ring size to ensure there's always enough space for at least one
>>>> maximally-fragmented packet plus an additional slot.
>>>
>>> @Michael: it's not clear to me if you prefer take this series via your
>>> tree or if it should go via net. Please LMK, thanks!
>>>
>>> Paolo
>>
>> Given 1/3 is in virtio I was going to take it. Just after rc1,
>> though.
>>
> 
> Hi Michael,
> 
> rc2 is out. Do you always plan to merge these fixes?
> 

Gently ping

Laurent

