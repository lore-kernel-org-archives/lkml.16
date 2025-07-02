Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC8260569
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456849; cv=none; b=A3KQa8HEFip/5b01WzHCVe587RepLLqO7iJDQhHRY3dBHK8fjlGkbOzOTRPX92mYidgHQAFEznY5IAecfktE6q+b00b5bag6TSAybFcJsGC8ALVF9TOOa8lhoqbERGqtBAxVm0B8SQFLRRQwtHDpAUJ5ucpwEe6d4dzDOqdGZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456849; c=relaxed/simple;
	bh=EdrNrz0J5/F40ltBEuQ5eTDBQM8WpBm8Wgb12vkPL4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlTQmwl/gI07B0DLZXYSEO0IaUU7Lm3NNaRbCVMyz6fsAvJEVVnFKTJowCns00p6513YIGYnISobThQ+/pKCm2pPUgnq1UCQbBeJse3gG2rVsnipV7JgQMeFBVm+4BX4QY1hgEUF5cG64Q41lidNObe/eyGYwum5RB0NXougKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MhNaDu3K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MhNaDu3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751456847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vpjls0kbN64i2dWrj9KDXg1RVSJyJ1rvA/dpxJi7NRE=;
	b=MhNaDu3KbOM2/vUId7NQji3WKNZar+gNmAwLdAQQzv08Wc3eLBFWhAlxrwv+qCv3bdUYbk
	fssCamLvzB216qhlumXGvqLfi77JtArCQ/qC+KVWjoTv8o1w9VKYHWVyB/1YtA82x/6Bmy
	rZpZisKuTshoaEvqqXJyX/Q1g/WIat8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-U-JgH6XrNR2I76D7Zs9FDQ-1; Wed,
 02 Jul 2025 07:47:22 -0400
X-MC-Unique: U-JgH6XrNR2I76D7Zs9FDQ-1
X-Mimecast-MFC-AGG-ID: U-JgH6XrNR2I76D7Zs9FDQ_1751456839
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D996B180028A;
	Wed,  2 Jul 2025 11:47:18 +0000 (UTC)
Received: from [10.45.226.95] (unknown [10.45.226.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BCBA30001B9;
	Wed,  2 Jul 2025 11:47:12 +0000 (UTC)
Message-ID: <18e5cef5-7907-4c65-a255-56af0cfa67b8@redhat.com>
Date: Wed, 2 Jul 2025 13:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 08/14] dpll: zl3073x: Read DPLL types and pin
 properties from system firmware
To: Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shannon Nelson <shannon.nelson@amd.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-9-ivecera@redhat.com>
 <vpzjeh5kc6s4cpah5wagdy6sm3rzt6vlfyfcdbenppwnzftzow@u4xu7mhzg77u>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <vpzjeh5kc6s4cpah5wagdy6sm3rzt6vlfyfcdbenppwnzftzow@u4xu7mhzg77u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 02. 07. 25 12:41 odp., Jiri Pirko wrote:
> Sun, Jun 29, 2025 at 09:10:43PM +0200, ivecera@redhat.com wrote:
> 
> [...]
> 
> 
>> +/**
>> + * zl3073x_prop_dpll_type_get - get DPLL channel type
>> + * @zldev: pointer to zl3073x device
>> + * @index: DPLL channel index
>> + *
>> + * Return: DPLL type for given DPLL channel
>> + */
>> +enum dpll_type
>> +zl3073x_prop_dpll_type_get(struct zl3073x_dev *zldev, u8 index)
>> +{
>> +	const char *types[ZL3073X_MAX_CHANNELS];
>> +	int count;
>> +
>> +	/* Read dpll types property from firmware */
>> +	count = device_property_read_string_array(zldev->dev, "dpll-types",
>> +						  types, ARRAY_SIZE(types));
>> +
>> +	/* Return default if property or entry for given channel is missing */
>> +	if (index >= count)
>> +		return DPLL_TYPE_PPS;
> 
> Not sure how this embedded stuff works, but isn't better to just bail
> out in case this is not present/unknown_value? Why assuming PPS is
> correct?

Per discussion with Microchip, the PPS should be reported as default.
The platform can define either via DT or APCI or software_node the
values for the DPLLs. Anyway this attribute is informational.

>> +
>> +	if (!strcmp(types[index], "pps"))
>> +		return DPLL_TYPE_PPS;
>> +	else if (!strcmp(types[index], "eec"))
>> +		return DPLL_TYPE_EEC;
>> +
>> +	dev_info(zldev->dev, "Unknown DPLL type '%s', using default\n",
>> +		 types[index]);
>> +
>> +	return DPLL_TYPE_PPS; /* Default */
>> +}
> 
> [...]
> 

