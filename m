Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D653211290
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835598; cv=none; b=uWn0fcf+4Z+Bydhq8do4WVGWv82baTGaFlODawKbtNs3OisZu8gYoFh2iJCKoApklSdBvctLaufM1V/tHbSgDhpi71/7j5Eg5uL6f9TlXjKzdHNKixZcPURovJfTKfvdZWB/2hrD0/0AzFUgu1pn+Fcy6arZVnE7pNkbyYcPhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835598; c=relaxed/simple;
	bh=Ds7IUTDTvw2CV2lBhtiAyxq24lOIiiA5IpHwJwPyoJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3VHSVcmauUr0jsb4dzs21ReLhZ1rkANYLmJQj+sgLX+Ipk6xHIKymbCnXwbtq6gKtrBvJdXN47WPR7LRNCbjk5wU4aIapmJKqL0w/y3tzOxwKVOB2RGgRIy6j5jfueOh5dDdcsNuO9dfolhqP6X63oU7NSHngIHXTxfPzUWuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fidglaxO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fidglaxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750835593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvazZI9dix5Ccz8uQdaazIH2SdfSX8TXp65gCpdhwKo=;
	b=fidglaxO8zgwVMEne/5d6CJuRbHesSAWTc3zRbvoVhVlYLNFsgtu71eH6YQI9tFGK7ViKU
	E6x2DP7n94ga2sjB7aqXaSBU+zZaPVg0T8825/revwhe6MPoiLN9mt37aKboCkxZ+T6DsN
	0M2QoVl7BJ9zV3gLnxM/md90UMUsBX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-Fe5EUMpbN462kZ5hMWAkjw-1; Wed, 25 Jun 2025 03:13:08 -0400
X-MC-Unique: Fe5EUMpbN462kZ5hMWAkjw-1
X-Mimecast-MFC-AGG-ID: Fe5EUMpbN462kZ5hMWAkjw_1750835587
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d50eacafso8848655e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750835587; x=1751440387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvazZI9dix5Ccz8uQdaazIH2SdfSX8TXp65gCpdhwKo=;
        b=cYIaf2rznvsypF6J/lSF3R92pBlDbX6SA/5kjfXickflqrChqth0jBxREYV8nr2toa
         S8Y+s40sGKtC0rNjYkCKjcuepVgCTLNBYwl1G7tLtSZJbbyhZenfbtu1tnD86dL137nt
         54nfTADaCdGyrIrRezUrJ7NzAZf9+jkhBKagLT5Cg7xuZa0lxEw/nADa2SA85SW+2HYa
         AUhOfWNdbWz2YxFi9WxJd605a40zqdrELFkePB0CI53amRTy5bCXaY8vndvU6OvVN6Lc
         8xuUqzSiz7QTxQq4xP8SuMb2trKYru8DbqJcQYo3Snw/6E/zd8XSsnWlrpGhr+lKy+hm
         SMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWadFIuO3c2Hu1DVIz4ZRreSULf5gAFWCYa+uLx5gzDDA7aH0MzeQvQwf3V9oXWX2NMOmCVN3XTjfXOozs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDuRRCcjXD5XITjy4bCYUPagZEifjfKYXXV1709VRmpkhC15E
	OrY6CMvzX3Twkev8TrV9vJ68vMINzrUDVAj+1IVx3PTv5WyABd2vtzlMQfkUQKvobfEKYJt5PbW
	l3+c41P+1zpMlI20bmFnda5BqscL+jaIMUYpyovdTbs69IVA9EB0YUR463wLO8vxZiQ==
X-Gm-Gg: ASbGncuXcxBuX6pt2ZKgakQNNQPjIH6/x6zb/K7VBeqUzQxJkhuv0c2I2XgUT8Caro0
	kv4rfIw1yXyuPtfLoTuJ7COunJyvgWITQYmb1xbM6i+2ITZvZv1iIAQsjVcroJJGztfzMwAdSxf
	zUUEZ1x9MNCpY9crH1kSu5g55T64T07YAJ2+C3KZpIMQXP5qsE61K7NOfA3WpWuL1X/J1FLtstv
	KxRUP/LTMP3IChHNyEEQYenAnYQcwwlDH9pItxGTSf2/NbySlXga3A1y+EdoTdpbiFNISHxsGHt
	ftG6uPUJq+KmrQJ5oKO719ivVcT1GgDtLyuNOU26eJfYeNsJLeQTjGFhOTA/RvYchsvjAA==
X-Received: by 2002:a05:600c:c166:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-45381aeaf59mr16247375e9.5.1750835586442;
        Wed, 25 Jun 2025 00:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3iA3F1mdUK03DtATl2924qBuUv87aDvuUQRfj1Hbnrj8+86URjh4kC1Jl7WzPkyXWYI1Cug==
X-Received: by 2002:a05:600c:c166:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-45381aeaf59mr16246855e9.5.1750835585911;
        Wed, 25 Jun 2025 00:13:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc86:3510:2b4a:1654:ed63:3802? ([2a0d:3341:cc86:3510:2b4a:1654:ed63:3802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm3692041f8f.44.2025.06.25.00.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:13:05 -0700 (PDT)
Message-ID: <20159d14-7d6b-4c16-9f00-ae993cc16f90@redhat.com>
Date: Wed, 25 Jun 2025 09:13:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
 <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
 <20250624230437.1ede2bcb@wsk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250624230437.1ede2bcb@wsk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/25 11:04 PM, Lukasz Majewski wrote:
>> On 6/22/25 11:37 AM, Lukasz Majewski wrote:
>>> +static void mtip_aging_timer(struct timer_list *t)
>>> +{
>>> +	struct switch_enet_private *fep = timer_container_of(fep,
>>> t,
>>> +
>>> timer_aging); +
>>> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
>>> +
>>> +	mod_timer(&fep->timer_aging,
>>> +		  jiffies +
>>> msecs_to_jiffies(LEARNING_AGING_INTERVAL)); +}  
>>
>> It's unclear to me why you decided to maintain this function and timer
>> while you could/should have used a macro around jiffies instead.
> 
> This is a bit more tricky than just getting value from jiffies.
> 
> The current code provides a monotonic, starting from 0 time "base" for
> learning and managing entries in internal routing tables for MTIP.
> 
> To be more specific - the fep->curr_time is a value incremented after
> each ~10ms.
> 
> Simple masking of jiffies would not provide such features.

I guess you can get the same effect storing computing the difference
from an initial jiffies value and using jiffies_to_msecs(<delta>)/10.

>> [...]
>>> +static int mtip_sw_learning(void *arg)
>>> +{
>>> +	struct switch_enet_private *fep = arg;
>>> +
>>> +	while (!kthread_should_stop()) {
>>> +		set_current_state(TASK_INTERRUPTIBLE);
>>> +		/* check learning record valid */
>>> +		mtip_atable_dynamicms_learn_migration(fep,
>>> fep->curr_time,
>>> +						      NULL, NULL);
>>> +		schedule_timeout(HZ / 100);
>>> +	}
>>> +
>>> +	return 0;
>>> +}  
>>
>> Why are you using a full blown kernel thread here? 
> 
> The MTIP IP block requires the thread for learning. It is a HW based
> switching accelerator, but the learning feature must be performed by
> SW (by writing values to its registers).
> 
>> Here a timer could
>> possibly make more sense.
> 
> Unfortunately, not - the code (in
> mtip_atable_dynamicms_learn_migration() must be called). This function
> has another role - it updates internal routing table with timestamps
> (provided by timer mentioned above).

Why a periodic timer can't call such function?

> 
>> Why are checking the table every 10ms, while
>> the learning intervall is 100ms? 
> 
> Yes, this is correct. In 10ms interval the internal routing table is
> updated. 100 ms is for learning.
> 
>> I guess you could/should align the
>> frequency here with such interval.
> 
> IMHO learning with 10ms interval would bring a lot of overhead.
> 
> Just to mention - the MTIP IP block can generate interrupt for
> learning event. However, it has been advised (bu NXP support), that a
> thread with 100ms interval shall be used to avoid too many interrupts.

FTR, my suggestion is to increase the
mtip_atable_dynamicms_learn_migration's call period to 100ms

>> Side note: I think you should move the buffer management to a later
>> patch: this one is still IMHO too big.
> 
> And this is problematic - the most time I've spent for v13 to separate
> the code - i.e. I exclude one function, then there are warnings that
> other function is unused (and of course WARNINGS in a separate patches
> are a legitimate reason to call for another patch set revision).

A trick to break that kind of dependencies chain is to leave a function
implementation empty.

On the same topic, you could have left mtip_rx_napi() implementation
empty up to patch 6 or you could have introduced napi initialization and
cleanup only after such patch.

In a similar way, you could introduce buffer managements in a later
patch and add the relevant calls afterwards.

/P

