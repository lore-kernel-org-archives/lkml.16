Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258C2594B4;
	Mon, 30 Jun 2025 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282534; cv=none; b=Z2BjTqoyrEZqM3DmQBffH2B1+w7bJ4sh+Jm6g7kr1lEwML9LFfeg96uzKRnE6hExF3L8h93LTd9dQl1+Ic5X+DzgPyKysOppqeQGOXfqup/W8t2iq2V9HYNOL0sWGECoDn0RddTiOPi81QWnmjpDgeZJK7z1dMMZD/F0idhYKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282534; c=relaxed/simple;
	bh=1bYhbuvaWAJUJvzUh/GTOLonJNXtyEs9OxUNE2UftcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyCc5WnztlnoGNO8lkxi/dFOImRXr890ZyAdYp0/Wz2gXNvRxAI+neIJGNY4VZ2gKDnwL5dapjDaGx97on4DXC6Rzr5b1eL4RheVXDAacqtaVxBf2SkYUrU5AmXZAG5VjwdADZ1gJXUf3qRlMN7xAy499kgS8BJClsUQQbRaElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=efVc9BvE; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="efVc9BvE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kb6pBthkR87A0/ZI5+bsHban2xuUDD2pS2s55zWu6hs=; b=efVc9BvE3b+6DFi03dY5sdz69b
	laq9Wkyq9Kw0IVwUv4YxiDJah0dgnWQQY9c+iSBBFFc4tp6leiMQV9l5vEHTKskgOgGaE/XXtlUGB
	/qIcSU83M0KwBofRXKsWACSzKjgEgETqOlDgJl72vfG5mr9kcFL/guORaUYT/4CcuHdTf0sK9GWO4
	3qtQkMubv/Rg0m4l/7CrI2ZxWtWB43LR46CssJ/BsTTOM3496kDdXsBL/qlWzCnY1Fj8d7hYKizWF
	FACa6xgYRrBtromoERDjnIlAoMMRHHdoqJMjBGORLqiXbv4/R8AHjy2kgwb8ZUdlwnUyJWb6EzpHK
	g/hExCmg==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:36744 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWCaP-0000000GwQK-38Ng;
	Mon, 30 Jun 2025 13:22:09 +0200
Message-ID: <dea91aa3-abfb-4ecd-9801-f915269bfce2@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 13:22:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] usb: core: Add Kconfig option to compile usb
 authorization
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-4-0d92261a5779@ssi.gouv.fr>
 <2025062104-debate-compactly-9aee@gregkh>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <2025062104-debate-compactly-9aee@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 


On 6/21/25 09:22, Greg Kroah-Hartman wrote:
> On Fri, Jun 20, 2025 at 04:27:19PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
>> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>>
>> This enables the usb authentication protocol implementation.
>>
>> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> ---
>>   drivers/usb/core/Kconfig  | 8 ++++++++
>>   drivers/usb/core/Makefile | 4 ++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/core/Kconfig b/drivers/usb/core/Kconfig
>> index 58e3ca7e479392112f656384c664efc36bb1151a..07ba67137b7fe16ecb1e993a51dbbfd4dd3ada88 100644
>> --- a/drivers/usb/core/Kconfig
>> +++ b/drivers/usb/core/Kconfig
>> @@ -143,3 +143,11 @@ config USB_DEFAULT_AUTHORIZATION_MODE
>>   	  ACPI selecting value 2 is analogous to selecting value 0.
>>   
>>   	  If unsure, keep the default value.
>> +
>> +config USB_AUTHENTICATION
>> +	bool "Enable USB authentication function"
>> +	default n
> Nit, "default n" is the default, no need to ever list it.

Done, fixes will be sent in the next patch version.

>
> thanks,
>
> greg k-h
