Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270DB29B797
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893872; cv=none; b=itoxHnKPtXcuQm6lWuE8b+H9UHqHTReVL7dTf+fc77Xdpdm/h4Aw7xuNzqosoFXVo5Bci5pRC63qQokUR7A/6FM2EyjRwSL8s7Y9DrXk64nKykft8Vs8ihtM59QyADoeBDGdxLcDpet5ndnfBZEtdOusEcQ5BO4Nt0W/VsOanyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893872; c=relaxed/simple;
	bh=40DnKg+YQPDIcAmF5uWP2p/D9eH4Oh9jjmwhWksPPoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zh4ZANr0XoPETKoFenX26CpxLwwj/oIYDzZRJiip7Yxe4vtlj08Zc6lCkT8pmZCw7boDWLDP1HWFMClEeweCdo1hMXeFHpFOMlfTiQtib3KKRN/DHWSVTscNZxUFgavhc4eMva2MyVfwsitCtgvUseJeck169KFWTQybxBJhN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+NDnmsW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+NDnmsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751893870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWi3pSu9OtqgbaqSGhfJZ0s+az4AigV80DZ7IYOhf7I=;
	b=f+NDnmsW6mjHEV88S6c3/+Lt3CGN0nG1IWE0BW6MLmQ8vhJQ+E7RTjshB4gJiuI7l/nSfq
	5YEXcGaG05gqwq4p6Y8H40NbufU48u5XwJiO0D7jbKXDH8JGUKJGtZm2HHdk0W32Rxcatq
	EWLeWhI/AiG5OT/k/d4jqLQJmlybXbM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-c6GcVHlOPsW8XXx_O2Xm4w-1; Mon,
 07 Jul 2025 09:11:07 -0400
X-MC-Unique: c6GcVHlOPsW8XXx_O2Xm4w-1
X-Mimecast-MFC-AGG-ID: c6GcVHlOPsW8XXx_O2Xm4w_1751893864
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB7871944AAB;
	Mon,  7 Jul 2025 13:11:03 +0000 (UTC)
Received: from [10.44.32.50] (unknown [10.44.32.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3932B195608F;
	Mon,  7 Jul 2025 13:10:56 +0000 (UTC)
Message-ID: <6fcfeee2-f6c9-43a4-81de-6c4e9d1b923d@redhat.com>
Date: Mon, 7 Jul 2025 15:10:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 12/12] dpll: zl3073x: Add support to get/set
 frequency on pins
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>
References: <20250704182202.1641943-1-ivecera@redhat.com>
 <20250704182202.1641943-13-ivecera@redhat.com>
 <idzmiaubwlnkzds2jbminyr46vuqo37nz5twj7f2yytn4aqoff@r34cm3qpd5mj>
 <25360415-bd91-4523-b0a6-664d22ba9f37@linux.dev>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <25360415-bd91-4523-b0a6-664d22ba9f37@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On 07. 07. 25 3:02 odp., Vadim Fedorenko wrote:
> On 07/07/2025 09:32, Jiri Pirko wrote:
>> Fri, Jul 04, 2025 at 08:22:02PM +0200, ivecera@redhat.com wrote:
>>
>> [...]
>>
>>> +static int
>>> +zl3073x_dpll_input_pin_frequency_set(const struct dpll_pin *dpll_pin,
>>> +                     void *pin_priv,
>>> +                     const struct dpll_device *dpll,
>>> +                     void *dpll_priv, u64 frequency,
>>> +                     struct netlink_ext_ack *extack)
>>
>> Unrelated to this patch, but ny idea why we don't implement
>> "FREQUENCY_CAN_CHANGE" capability. I think we are missing it.
>>
> Do you mean that some DPLLs may implement fixed frequency pins and
> we have to signal it back to user-space?
> 
I think this is not necessary... user-space know this if the supported
frequency list is empty or has only single frequency.

Ivan

