Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9A265630
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456299; cv=none; b=CoYaLpMfToaQY8fjUEj8lVA/NTS3+bJuS34G/Q/vhtKGLslSSVe5z9SZG5gC8XseUghsMM8cbWgxKrYk6CA0G0/qAioCYD18uVhxgfcqXQydIGCDS5ezI4JDvzorC6oClDlN0QVTR4THlY+nl9I3D0y5NcarHVUuGJmigN83/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456299; c=relaxed/simple;
	bh=cdS71tAI3Nx8q7bq1BIepQO374y9DFYjtTkJEkJFAg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmLo6uE9AouCmJW4Bx2/6dTAqz8A3vGXhBK9rQX79cd3eP63MEUH1QUnUuQ4ESFKJCFBwDacOCJhTEct8EbqiA6Qa5z4x+DqcyCbVcFF/3BfUcwXmv4owjgyziPw0d00dkt5fhnLRoXh2pM5yiRw8zJFDFY726rT2nvg1gWAMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Boed4aJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Boed4aJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751456296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeaR/weAU/4mIF4C+gkIt+G1cKiX/aTOOLald2KG+J8=;
	b=Boed4aJNVqFAcVFmmzusKkanSAbx/4US7NpaaVq+iJsLQh3KpBE7Dd9DIa7lU4GhwjLLJu
	cYY4XE+E06Euzw77UpCFHQ3BzDM9usYxm9NJeILQumuaMXzmcjgejeF3zfJ7GKfW8NCqzX
	Q2hIxTlvJaL/rbsfy2Rg7U8NeX7MznE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-v3vjMe8DNs-zc9D7_xlaJg-1; Wed,
 02 Jul 2025 07:38:15 -0400
X-MC-Unique: v3vjMe8DNs-zc9D7_xlaJg-1
X-Mimecast-MFC-AGG-ID: v3vjMe8DNs-zc9D7_xlaJg_1751456293
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84708180028B;
	Wed,  2 Jul 2025 11:38:12 +0000 (UTC)
Received: from [10.45.226.95] (unknown [10.45.226.95])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A8721956087;
	Wed,  2 Jul 2025 11:38:05 +0000 (UTC)
Message-ID: <351c8eb7-26b2-4435-a6cf-6dac36e55ad9@redhat.com>
Date: Wed, 2 Jul 2025 13:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 04/14] dpll: zl3073x: Add support for devlink
 device info
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
 <20250629191049.64398-5-ivecera@redhat.com>
 <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02. 07. 25 12:25 odp., Jiri Pirko wrote:
> Sun, Jun 29, 2025 at 09:10:39PM +0200, ivecera@redhat.com wrote:
> 
> [...]
> 
>> +	snprintf(buf, sizeof(buf), "%lu.%lu.%lu.%lu",
>> +		 FIELD_GET(GENMASK(31, 24), cfg_ver),
>> +		 FIELD_GET(GENMASK(23, 16), cfg_ver),
>> +		 FIELD_GET(GENMASK(15, 8), cfg_ver),
>> +		 FIELD_GET(GENMASK(7, 0), cfg_ver));
>> +
>> +	return devlink_info_version_running_put(req, "cfg.custom_ver", buf);
> 
> Nit:
> 
> It's redundant to put "ver" string into version name. Also, isn't it
> rather "custom_config" or "custom_cfg"?

As per datasheet, this is configuration custom version.

I.

