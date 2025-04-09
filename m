Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EB1DEFE7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180277; cv=none; b=u1RlR7LY1WFsSbClqbDVcdH80KcWodynS+0ABKIlkjO9f2D2OeP53WxxgoUCLYJTpRxYtS0TcR5ny9rT31xEpYFN7Lt45dj+EQ1nP+tXyEMYMbaY7zLYBwvuFDDE+mLpB7C/LU6gKl9XJX4Q8xUQIrrKWXde3iAynz3BHS0sxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180277; c=relaxed/simple;
	bh=c2PprSJYcvSOOVD7CPC11hdDQnxIfNPG8Zd5bRYVz0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqVAeZTVNMn+n7vaAMP7i9Xac7Bj/D9H0gAYg0IUConsmK6Mduk0ECcEGEdztyvhdjFspOp+h+gDJdm0AOE02kwhV5iHb/kl5WB3P6tai9G6uVouEdU0Z2Vtq0KYHvRLxZfutYu13DMXISb3qOMdq4G9cjl5hjjz5vOls99zYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVWG3tzm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVWG3tzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744180274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxsCkg7T9hdK7RNaWY5esSIdR5AuOm6Jdp3figUFvGs=;
	b=MVWG3tzmEvlGcT57Qp36cBAlcBjkJ/3RNTY2dIDJWEOzKksxD54pKTzpD9kKWcJfHgzuXv
	nk1ROMqU1SXYGthxlGq8NvlCdiwpcnHrXgSzRwoda7OKxtuicNsnBetP/oRi/zmuOjpLuG
	yDEPexZr/kEvS2oaSGqqfq6kc+nQdEc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-RdlbYl45Mk6sCPkLfLCfvA-1; Wed,
 09 Apr 2025 02:31:09 -0400
X-MC-Unique: RdlbYl45Mk6sCPkLfLCfvA-1
X-Mimecast-MFC-AGG-ID: RdlbYl45Mk6sCPkLfLCfvA_1744180267
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6896A180035E;
	Wed,  9 Apr 2025 06:31:06 +0000 (UTC)
Received: from [10.44.32.72] (unknown [10.44.32.72])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DCB171955DCE;
	Wed,  9 Apr 2025 06:31:01 +0000 (UTC)
Message-ID: <333a12a8-157b-47f1-9602-e68e7d52b4c2@redhat.com>
Date: Wed, 9 Apr 2025 08:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] mfd: Add Microchip ZL3073x support
To: Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
Cc: Michal Schmidt <mschmidt@redhat.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250407172836.1009461-1-ivecera@redhat.com>
 <20250407172836.1009461-2-ivecera@redhat.com>
 <9b38d033-72aa-4fb0-b1ee-41bbe3884040@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <9b38d033-72aa-4fb0-b1ee-41bbe3884040@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On 07. 04. 25 7:53 odp., Krzysztof Kozlowski wrote:
> On 07/04/2025 19:28, Ivan Vecera wrote:
>> This adds base MFD driver for Microchip Azurite ZL3073x chip family.
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Will fix in v2.

>> These chips provide DPLL and PHC (PTP) functionality and they can
>> be connected over I2C or SPI bus.
>>
> 
> ...
> 
>> +/**
>> + * zl3073x_get_regmap_config - return pointer to regmap config
>> + *
>> + * Returns pointer to regmap config
>> + */
>> +const struct regmap_config *zl3073x_get_regmap_config(void)
>> +{
>> +	return &zl3073x_regmap_config;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(zl3073x_get_regmap_config, "ZL3073X");
>> +
>> +struct zl3073x_dev *zl3073x_dev_alloc(struct device *dev)
>> +{
>> +	struct zl3073x_dev *zldev;
>> +
>> +	return devm_kzalloc(dev, sizeof(*zldev), GFP_KERNEL);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(zl3073x_dev_alloc, "ZL3073X");
>> +
>> +int zl3073x_dev_init(struct zl3073x_dev *zldev)
>> +{
>> +	devm_mutex_init(zldev->dev, &zldev->lock);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(zl3073x_dev_init, "ZL3073X");
>> +
>> +void zl3073x_dev_exit(struct zl3073x_dev *zldev)
>> +{
>> +}
>> +EXPORT_SYMBOL_NS_GPL(zl3073x_dev_exit, "ZL3073X");
> 
> Why do you add empty exports?

It is filled in the later commits but yeah I will include the function 
once it will be necessary.

>> diff --git a/drivers/mfd/zl3073x-spi.c b/drivers/mfd/zl3073x-spi.c
>> new file mode 100644
>> index 0000000000000..a6b9a366a7585
>> --- /dev/null
>> +++ b/drivers/mfd/zl3073x-spi.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/spi/spi.h>
>> +#include "zl3073x.h"
>> +
>> +static const struct spi_device_id zl3073x_spi_id[] = {
>> +	{ "zl3073x-spi", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(spi, zl3073x_spi_id);
>> +
>> +static const struct of_device_id zl3073x_spi_of_match[] = {
>> +	{ .compatible = "microchip,zl3073x-spi" },
> 
> 
> You need bindings. If they are somewhere in this patchset then you need
> correct order so before users (see DT submitting patches).

Yes, there are. I will reorder the patches in v2 and also split the 
whole series into several ones.

>> +static void zl3073x_spi_remove(struct spi_device *spidev)
>> +{
>> +	struct zl3073x_dev *zldev;
>> +
>> +	zldev = spi_get_drvdata(spidev);
>> +	zl3073x_dev_exit(zldev);
>> +}
>> +
>> +static struct spi_driver zl3073x_spi_driver = {
>> +	.driver = {
>> +		.name = "zl3073x-spi",
>> +		.of_match_table = of_match_ptr(zl3073x_spi_of_match),
> 
> Drop of_match_ptr, you have warnings here.

Ack, will avoid.

>> +	},
>> +	.probe = zl3073x_spi_probe,
>> +	.remove = zl3073x_spi_remove,
>> +	.id_table = zl3073x_spi_id,
>> +};
>> +
> 
> 
> 
> Best regards,
> Krzysztof
> 

