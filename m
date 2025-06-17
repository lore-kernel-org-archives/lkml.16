Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852C2EF9A9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185690; cv=none; b=Q/tBfxEqP5o7BqQQafdEj0ouGvmktSQmyQlmUGPa86b5ZC1s7wrTF+XclwIF2ntlgaPGJQiavbjSoAf6CkIid7jMh/GFkeSWGRXOpiwc2xT9NLbR5zKwlUjm7Kr1YSQRuhsiBSnnBySGtQ3/BCF6u7MXbd9iZDxsu8fw/W9hhsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185690; c=relaxed/simple;
	bh=UBxovSv15NDrlLMCfllQ6/CkKKuCdUjcOg0vtiOWstg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tabRtOQBVZZxPBuVJFrWyJJVCxoK42H97gTV7Ko3g+qlPCoskgeJbc2aAkXQqYQujZTJh6EkAPlJpy/SMDTo3fEQPwLr26LOq4Lz1NMRrhVYNLFkJX14ttKJleb78VLdx9Om1faA0adZ++NeNfS70nUqmKuaFOYwTmMn2OnrzNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=upW7zilG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="upW7zilG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vZAMd0qU/zu4E2wzGJDTgjB0dodf9eYxECR71B2LM7o=; b=upW7zilGBnxzAhnfo2kySA05Ya
	UjG9SsvgUidTCdlrsB1tQsZWma4w5iMrM/kYwyTl33km0q8Udwpq5Ar+NRknCvHzTs5gX+bLjEHly
	IBT2SaMQXGHI+DJBWbhYJoeod8t4NSKO6b9lk8mHundPOpvQsb2Y91Gp/k6LfLSf7ikpBFYVK/474
	qai4I3y2td85RBZNb+ABMhvi1GljjufrSzBEFw/3EkOT1JSWCUe6REk1YRoGkAu9JZeUsHfZHrmZf
	fVu6Qk2ilpjZAkYJ5U8uwQd9l9F4bkxIZ17eHhdZ/MsFl2hfB4206n9B7oeftJGMr/ZScrYeVoEbL
	RB2azmMg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbFN-0000000HVUJ-22hH;
	Tue, 17 Jun 2025 18:41:25 +0000
Message-ID: <7f388a3f-6dcc-4989-9a4e-e15000069b68@infradead.org>
Date: Tue, 17 Jun 2025 11:41:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: SONYPI depends on HAS_IOPORT
To: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johannes Berg <johannes.berg@intel.com>, kernel test robot <lkp@intel.com>
References: <20250606071255.7722-2-johannes@sipsolutions.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250606071255.7722-2-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/6/25 12:12 AM, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> It already depends on X86_32, but that's also set for ARCH=um.
> Recent changes made UML no longer have IO port access since
> it's not needed, but this driver uses it. Build it only for
> HAS_IOPORT. This is pretty much the same as depending on X86,
> but on the off-chance that HAS_IOPORT will ever be optional
> on x86 HAS_IOPORT is the real prerequisite.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506060742.XR3HcxWA-lkp@intel.com/
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/char/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 8fb33c90482f..36295558dc85 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -237,7 +237,7 @@ config APPLICOM
>  
>  config SONYPI
>  	tristate "Sony Vaio Programmable I/O Control Device support"
> -	depends on X86_32 && PCI && INPUT
> +	depends on X86_32 && PCI && INPUT && HAS_IOPORT
>  	depends on ACPI_EC || !ACPI
>  	help
>  	  This driver enables access to the Sony Programmable I/O Control

-- 
~Randy
