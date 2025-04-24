Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8A2918F6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524437; cv=none; b=LA7C1MUX0nocfvaXP4xD9ETJmBgonRWf3ATk69k75Gr4NkZDsaqwzvjpb/pCoSuiqUfumv7P7x0HcO4rtAHhMaH/FdxJ2LPmsD13uEf/GMY/LJ/bd8IAnZTSGFo6lfDQRJhcuhoDD5cavj8CuSzYip4yVva+4Ez4Qq9OZlh1M6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524437; c=relaxed/simple;
	bh=DNuxbwxEeFug/FXNMVi+tNl0Z2xT6Mw5Dv5Mh+OaEE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMJwtbpzNyCXMn9Oz72co1tC/NDfgddVjJ52/7H+4izNIXH2yuiVkTCZhpWCredhQXdtUJpXhWl5tAWolu4N1dbDIlRAs4fDrWnwR0jJfLDkjNvRRmXvgvUlCLASGWBFtUmbT5OPIjrKtOcTWKofmnT3vvVjGZN6amZgzXDdMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JstsVFhM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JstsVFhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745524434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU/3VyFMOfD63tP5kzXYfWr/+peX2XaMqzrC6eK+CtI=;
	b=JstsVFhMpZZ9a+3Q5A5Arw0eyWA0QbSg9NYc6dYS4CQafBnp7I+JivXdw0FMtaaUY8j8fX
	dfFDLEqEmhDmmTBo5N6IA+FIODX4XN+/c5QcBLrFqLpcT1LdEzD49dwq5EUq0nq+IgCnBl
	LRvh8d8B6rvJRd2h3BnFTjKU0xyMQeY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-DyQdFEH0Oo6vg5QkMrlHNg-1; Thu,
 24 Apr 2025 15:53:49 -0400
X-MC-Unique: DyQdFEH0Oo6vg5QkMrlHNg-1
X-Mimecast-MFC-AGG-ID: DyQdFEH0Oo6vg5QkMrlHNg_1745524427
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE43C1956086;
	Thu, 24 Apr 2025 19:53:46 +0000 (UTC)
Received: from [10.44.32.28] (unknown [10.44.32.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59D5530001A2;
	Thu, 24 Apr 2025 19:53:41 +0000 (UTC)
Message-ID: <ea9cd028-3d74-4d46-b355-a74ad549269b@redhat.com>
Date: Thu, 24 Apr 2025 21:53:39 +0200
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
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <8082254c-01a6-4aca-84de-76083fdcbb3b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4



On 24. 04. 25 9:18 odp., Andrew Lunn wrote:
>> During taking 613cbb91e9ce ("media: Add MIPI CCI register access helper
>> functions") approach I found they are using for these functions u64
>> regardless of register size... Just to accommodate the biggest
>> possible value. I know about weakness of 'void *' usage but u64 is not
>> also ideal as the caller is forced to pass always 8 bytes for reading
>> and forced to reserve 8 bytes for each read value on stack.
> 
> In this device, how are the u48s used? Are they actually u48s, or are
> they just u8[6], for example a MAC address? The network stack has lots
> of functions like:
> 
> eth_hw_addr_set(struct net_device *dev, const u8 *addr)

u48 registers always represent 48bit integer... they read from device 
using bulk read as big-endian 48bit int. The same is valid also for u16
and u32.

Ivan

