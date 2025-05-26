Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB37260F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748226536; cv=none; b=KEoliJUHwjpMdwJZ3n7qlo1A94w5fsdepJQZ4OELzaceWlj4n3VvCELzRirXgqT6OtHeA+ErJTXLZsLd/Hefe4DA5DGh81oM17e7v1Ukwix3IS+0fbD4JkrCEM72QvoWNygXTjmsg6rKmc8TL0mb8cD5UbJujMZw7uOmxYzt/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748226536; c=relaxed/simple;
	bh=lxR24Tcyal93aVfwLlVLRxPeDe6bjXtUARPgt/PEhOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCOeMO8+e76ItCwYf2VSbwJl0mXoa419SDz2uo4SKON4E+y+X6EudPOvWcyHR0+6RiaBp5aqmvXTsD9eGeK5KalkIP77FOPwqPYPmiQWvCkDwQhV3xKB8/sXs8ibuDBU/ydRF7yRLNTVCZUan6zSO1ocBS1r1V9imr1S0BsuhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qm0L+3I7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qm0L+3I7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Q38bzlFvafJEjNOPNr4Btufxla4Ukr/BqMH7YE9oa7A=; b=qm0L+3I7Xsp+Dr895AemcIGaJt
	FQ8xzi2XRu0PYHBL864RRa+jR7LN1ZLi/RdCEM9lwbuEg2i7V2M8pTRA+RL5FIl56PU3kSXg+osDe
	wZuz6zEdAV21zBL6PkWtm2wr+REXTCDvs3zEuOnm/AreCbHRr4QQyZ247EwPc3QGZ2BNbZQPZdwHP
	mU9s9dlYV73du5d81N/MTegv/QVCofBwu8Y6uWmICBeDIFo+xMWxsprJ+pIQBXVfJTc++tOgJ8i2T
	/cUpcTXXNmipjBLWqCQiOmBkWSWZDg7wmTARM4dZTxMWA8y4BYlZLzIRx2HyLWb/s581jAFDOzHxS
	/+M6qvYg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJNa1-0000000AtRJ-3xl3;
	Mon, 26 May 2025 02:28:46 +0000
Message-ID: <31c8c819-6814-499c-8d55-d22d4939c851@infradead.org>
Date: Sun, 25 May 2025 19:28:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] extcon: max14526: add CONFIG_I2C dependency
To: Arnd Bergmann <arnd@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20250520152618.1975840-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250520152618.1975840-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/20/25 8:26 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When I2C is in a loadable module, the newly added driver causes
> a build failure. The problem is shown by Kconfig:
> 
> WARNING: unmet direct dependencies detected for REGMAP_I2C
>   Depends on [m]: I2C [=m]
>   Selected by [y]:
>   - EXTCON_MAX14526 [=y] && EXTCON [=y]
> 
> Add the required dependency here.

Same as my patch:
https://lore.kernel.org/lkml/20250515234803.1385375-1-rdunlap@infradead.org/


> 
> Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/extcon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index 1096afc0b5bb..aec46bf03302 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -136,6 +136,7 @@ config EXTCON_MAX8997
>  
>  config EXTCON_MAX14526
>  	tristate "Maxim MAX14526 EXTCON Support"
> +	depends on I2C
>  	select IRQ_DOMAIN
>  	select REGMAP_I2C
>  	help

