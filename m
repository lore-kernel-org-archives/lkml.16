Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AB2AE68
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745379053; cv=none; b=FYCqnUnsy/xgn9zfDrMvQXtS3Q/II1kn92dhBtrG72tWoMHyt26NsbLBKS74LLU7kTjPSbZf/sJ0deDRG7rX+CSmi4FLDqtcWH1TOYYJxXJ52HnScYe3i9NlpEVr5STLLBtlHuB7AtllkZxG1mL6xnB4C31Pw/29qzXfvYuEppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745379053; c=relaxed/simple;
	bh=TeQzPkQf/aF1ciElDMbnp40aUZaxwxkk5xIS2nheQUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=docqWtahvsQJkWTWhOGdyuD7iET6YQvDrWqWdtsCyiWgKZmCUjlFFK+CJcVevrTUsdIbGKVgund2gmRIsX/tOSHhTHN3/rjEDABlDwxoIAfP6KCXFD7rdCr6q2SFXlS5gOAW0oSu/zpQ8phkihEbyAkdU0d4tLjH3gIkHVNb8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=RDclMVVP; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="RDclMVVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745379044;
	bh=+lMqHsMW4wRv+AN63DmAI86koqsK7plRQvtx5jf5Mbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RDclMVVPpncNy6Voj3sWnPUB5/Q/X6baA6sHZRo97OWbJoo1gj/uuV+0h5Vle0p6O
	 ydhN8Mu7w0Sw11te+I+rKnZspqC022PErx2bR7f4kKWzZ/xb+tTCPdjQSJcgojfHSv
	 ynCx6SBfVjGD7NehtahfRKCRPCwNgZ6ooAYz8sTc=
Received: from [10.42.13.56] ([116.128.244.169])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 7AA94E9F; Wed, 23 Apr 2025 11:30:42 +0800
X-QQ-mid: xmsmtpt1745379042tizv844o7
Message-ID: <tencent_695CF323FAB82DA8D22073BD6C4F56E62C09@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAVheloBDCaRsHkeUBGs9WscxMvVKyCQUZX4IrJqr5ZmfuuaFAu+
	 AFqPqQZgIFlRgv2oZi2HSJ0fp2fcb/5nQitgthqYEy6euIF/I0RlQMAvpfl4rR18NTnWA5wyv1O3
	 ge6D1WWGv09pAvpehpLUPyvPYuU6KE+SLeVhuHbhfNieR9U6mq0DHrr2P6yFlC2JJUJlQUC2pkFs
	 wU9pUjQCW2SCRxxP64SxaG+y049t3X2ZATBsbY3o7VhpkFwDXQbZxKExnMhFkFnFnUzdlDux+wpf
	 IQQyGQ0weAzg4kRP0TG9Y70IpxJdhGZ3Nv/KXLwMhMFIvu2BYudq9hykmLbETahVjn+YdpE46Xvu
	 iDaXJnOruJ9qQ91dKHLdfmUaK3+9ctu+aigEfdZfvpbe6bK1KpYpAkCwUGXEOtV9Ili8DXb0iQI1
	 A1IUTNyRtAEyx4uBq0jEtI49gyNJN9ad5BFrppVPwv78mlQ5/m/Ht+xlZoO4vDr72eek3abXXotu
	 9rpDDvBUci8UOl8iFBbxvUkZ6/vgvyJXVexSlfd8qu5eEk27TSIqwDL0iJ9bkoIQG7/fUUZCKPBA
	 sb5RbfPG1l3MmX/oH7h1lyaTvKtORI/5o0WIoS+aM3mBLUJL+k6KKt2RbaqWXMEhtlCn5XPig81K
	 L2o5Zm757riLU6h6YrlWQDKZDzu1KfcHWxbmhmwcMW7lS07WkAYz2NVfVKa5Zkfr4s+jV0b/W/id
	 wtpT29pUmXRL+6Z0Tg1OXVE5vKTaegSY2vJs7QqaOzhuXcsivGFPnCu+3n0wXM/URROErqg+k57x
	 VQ14WZPHf4FoO7dgFlja5It9KAg2JEEZYH+d3Cia/EsrQfM3n5tW3f9Xzrpv6ucSBgyuWkq2wgFG
	 GIT+mqxn5OvpdRpwSrzhP5nl8JIE5QfDiLYgKc4epeGHnFaySj6fVP0LgBDSYVzPK2UM7ANz/zgK
	 LSVhYsiinV9R//2Rr/1U7Yo7LxzirduUuoNym+aggd35FwKYYa3Lmp/Z1pvIQl
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-OQ-MSGID: <877a8213-a369-4b36-af0b-f71d3b89b7b6@foxmail.com>
Date: Wed, 23 Apr 2025 11:30:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3 V2] bus: hisi_lpc: remove unused head file in
 hisi_lpc.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org, robh@kernel.org,
 xiaopei01@kylinos.cn, xuwei5@hisilicon.com
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_29AE601199DC77543B902D5EA227CB730E08@qq.com>
 <aAe5937NqfE_c34-@smile.fi.intel.com>
From: Pei Xiao <xiaopeitux@foxmail.com>
In-Reply-To: <aAe5937NqfE_c34-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2025/4/22 23:47, Andy Shevchenko 写道:
> On Tue, Apr 22, 2025 at 07:31:22PM +0800, xiaopeitux@foxmail.com wrote:
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>
>> linux/console.h,linux/pci.h,linux/slab.h
>> are not used, removes it.
> There are more unused and many are missed.
> My diff looks like this:
>
> diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
> index 53dd1573e323..4911afdac316 100644
> --- a/drivers/bus/hisi_lpc.c
> +++ b/drivers/bus/hisi_lpc.c
> @@ -7,17 +7,22 @@
>   */
>  
>  #include <linux/acpi.h>
> -#include <linux/console.h>
> +#include <linux/bits.h>
>  #include <linux/delay.h>
> +#include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/ioport.h>
>  #include <linux/logic_pio.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/of_platform.h>
> -#include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
> -#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <asm/byteorder.h>

Thanks for you help.

I have send v3 : https://lore.kernel.org/lkml/cover.1745377493.git.xiaopei01@kylinos.cn/

You are such a helpful and technically skilled expert!

Thanks again!

Pei.

>  
>  #define DRV_NAME "hisi-lpc"
>  
>
> ...
>
>>  #include <linux/acpi.h>
>> -#include <linux/console.h>
>>  #include <linux/delay.h>
>>  #include <linux/io.h>
>>  #include <linux/logic_pio.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>> -#include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/serial_8250.h>
>> -#include <linux/slab.h>

