Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF72820A7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512161; cv=none; b=gFOVnK9DJthEVS1wA+D2zh2X2OpLzLcNo0tg+F35PWAJpxOtUgN2LkG8xFPNwwuURZ/EAkQ+roGpQJmZLDuKaNKvvvY8rJdSNDu14pqvHw/2yd54UdFzc5eVPRwbSyVXjVclalm7l/0F6C/uTDfx110P+Y1ZzbjSbInJBd+YzsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512161; c=relaxed/simple;
	bh=VuvWR/xR3+1XIIsqP3Mnd1zii5PRZEy6rSHMV+8vxQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXKqpIDrtWp42KhFK7J8AuRLcRQ6i3J6P3nl5k1i7RXJLvm/QLIABykzyceebwOXkdjBqJVd2Aj7nJp7kAbyUbwAvAE1BkLyRGaH5lcLWKIifr1YXqARuEqQZ1TgyZyYqdyQKWSlWc2xvs53VNVwyl3VhiXK3KE/ZvEZpYD+TTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+hiMem2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+hiMem2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745512158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uVAEopdtpgVlguQ5ktM175hscYiDLv9M0FIM/OwWmE=;
	b=A+hiMem2L6fpPbmFXd3rDcSeq+8heMShl7tBTH+NGQIpMZcSQhvzTclGaP5Jk3f7oNoVFq
	gN2pZF+THvDhUQEEYC+xBREqX9HXPmloy7iJD/DfDz6Yo/GRW/3g3BMvQ/fqIrOwTwsBWZ
	fjAPzND5H1SS51T6vJAeCdqly/N7aYk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-ujNod1RPMM606MOUQpAlhQ-1; Thu,
 24 Apr 2025 12:29:13 -0400
X-MC-Unique: ujNod1RPMM606MOUQpAlhQ-1
X-Mimecast-MFC-AGG-ID: ujNod1RPMM606MOUQpAlhQ_1745512151
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5310F1955D86;
	Thu, 24 Apr 2025 16:29:10 +0000 (UTC)
Received: from [10.44.32.28] (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F59919560A3;
	Thu, 24 Apr 2025 16:29:05 +0000 (UTC)
Message-ID: <5d035e9b-b36a-4088-89fb-b0f35d98a909@redhat.com>
Date: Thu, 24 Apr 2025 18:29:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/8] Add Microchip ZL3073x support (part 1)
To: Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Schmidt <mschmidt@redhat.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250424154722.534284-1-ivecera@redhat.com>
 <20250424155106.GI8734@google.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20250424155106.GI8734@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 24. 04. 25 5:51 odp., Lee Jones wrote:
> On Thu, 24 Apr 2025, Ivan Vecera wrote:
> 
>> Add support for Microchip Azurite DPLL/PTP/SyncE chip family that
>> provides DPLL and PTP functionality. This series bring first part
>> that adds the common MFD driver that provides an access to the bus
>> that can be either I2C or SPI.
>>
>> The next part of the series is bringing the DPLL driver that will
>> covers DPLL functionality. Another series will bring PTP driver and
>> flashing capability via devlink in the MFD driver will follow soon.
>>
>> Testing was done by myself and by Prathosh Satish on Microchip EDS2
>> development board with ZL30732 DPLL chip connected over I2C bus.
>>
>> Patch breakdown
>> ===============
>> Patch 1 - Common DT schema for DPLL device and pin
>> Patch 2 - DT bindings for microchip,zl3073* devices
>> Patch 3 - Basic support for I2C, SPI and regmap configuration
>> Patch 4 - Devlink device registration and info
>> Patch 5 - Helpers for reading and writing register mailboxes
> 
> Whoops!  I just this second replied to v3.
> 
> This needs moving out to somewhere more appropriate.
> 
> Use MFD to allocate and split the resources, then the sub-devices can do
> the technical and heavy API stuff.

They cannot because the bus is shared and MFD parent device acts as bus
arbitrator. It has to ensure that sub-devices access the registers
safely.

Mailbox could be confusing for somebody but it does not have anything
common with HW mailboxes. In this context the mailbox is just a sequence
of register reads and writes in certain order and this sequence has
to be done atomically (I tried to describe this in my previous replies).

I have followed Andrew's recommendation to hide these special sequences
and provide sub-devices some simple API to use them without special
locking needs.

Thanks,
Ivan

