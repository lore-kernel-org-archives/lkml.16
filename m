Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D392517A9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745586298; cv=none; b=V0idiKHlZPkeU2yYFTmF93k/v2SALvx/arshKQAIuRTIz27XzP4SolfBS/tgZgDpLMHt9L3ImqzYSkV4E+zozKf9jh4+ImDuBwWmdqqdaq/Q7nGuRREaETsxiPgRqLPieCkd0JKcKHrfZi/ltl6fuSiK3CyR34OS215xakWy6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745586298; c=relaxed/simple;
	bh=rPaDqGzlo8kKc7078BfnnKIU+GVWwOACSGFFD9+ZYOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSICYmG8x9PRu4bdKD7AsVhK7JQu3j0M29uVHOQvvNKTUw5YDn0Xhtq7X/Zh/opOEhz5ChnwrcGd+pik2BwExpiQ2HdbiY8dCh0euJrd78+o+0KGU54ZRUvp7Sa2Re03JP/kXDpmHFhJaZb6Hi6ltTJoT94BqFhGbkOVXNzl8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PwzqxmA4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PwzqxmA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745586296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRT3RKx4TZ+P54S/HXqOrC/ht/rfJMrgmNz4iAs0uEQ=;
	b=PwzqxmA4cEzvFGpCD6NxwNA9Qo2KrDaphK23Hm6vuYX6i2KrU6LgFDMBbQx4fiTwGX+EgG
	PQquMDRuq/kkSMI5fV1Sop2pP7SEfvu2ha5mTfBcYYwuE8/7XaqCY/lwFoED7kgYPwhspN
	T1Yf6Uim5jIQZ7CbAAezAsPgsvf2XLE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-_3s_6pwmPWC8mVY-6ElxbQ-1; Fri,
 25 Apr 2025 09:04:51 -0400
X-MC-Unique: _3s_6pwmPWC8mVY-6ElxbQ-1
X-Mimecast-MFC-AGG-ID: _3s_6pwmPWC8mVY-6ElxbQ_1745586289
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1CFA1800264;
	Fri, 25 Apr 2025 13:04:48 +0000 (UTC)
Received: from [10.44.33.33] (unknown [10.44.33.33])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B090918002AD;
	Fri, 25 Apr 2025 13:04:42 +0000 (UTC)
Message-ID: <1ba66392-f41d-4ffa-9952-900b6856e861@redhat.com>
Date: Fri, 25 Apr 2025 15:04:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/8] mfd: zl3073x: Add functions to work with
 register mailboxes
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Michal Schmidt <mschmidt@redhat.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250424154722.534284-1-ivecera@redhat.com>
 <20250424154722.534284-6-ivecera@redhat.com>
 <5094e051-5504-48a5-b411-ed1a0d949eeb@lunn.ch>
 <bd645425-b9cb-454d-8971-646501704697@redhat.com>
 <8082254c-01a6-4aca-84de-76083fdcbb3b@lunn.ch>
 <ea9cd028-3d74-4d46-b355-a74ad549269b@redhat.com>
 <34f29b17-dc68-4005-b2da-95fde34117a0@lunn.ch>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <34f29b17-dc68-4005-b2da-95fde34117a0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93



On 24. 04. 25 9:57 odp., Andrew Lunn wrote:
> On Thu, Apr 24, 2025 at 09:53:39PM +0200, Ivan Vecera wrote:
>>
>>
>> On 24. 04. 25 9:18 odp., Andrew Lunn wrote:
>>>> During taking 613cbb91e9ce ("media: Add MIPI CCI register access helper
>>>> functions") approach I found they are using for these functions u64
>>>> regardless of register size... Just to accommodate the biggest
>>>> possible value. I know about weakness of 'void *' usage but u64 is not
>>>> also ideal as the caller is forced to pass always 8 bytes for reading
>>>> and forced to reserve 8 bytes for each read value on stack.
>>>
>>> In this device, how are the u48s used? Are they actually u48s, or are
>>> they just u8[6], for example a MAC address? The network stack has lots
>>> of functions like:
>>>
>>> eth_hw_addr_set(struct net_device *dev, const u8 *addr)
>>
>> u48 registers always represent 48bit integer... they read from device using
>> bulk read as big-endian 48bit int. The same is valid also for u16
>> and u32.
> 
> Then a u64 makes sense, plus on write to hardware a check the upper
> bits are 0. These u48s are going to be stored in a u64 anyway, since C
> does not have a u48 type.

Just note that some of 48bit registers uses signed values so the check
should be:

x is in <S48_MIN, U48_MAX>

this could be done using bit operations:

(!(GENMASK_ULL(63, 49) & ((u64)(x) + BIT_ULL(47))))

Ivan

