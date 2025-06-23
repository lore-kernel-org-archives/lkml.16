Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1461E2852
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660101; cv=none; b=gidnzelAVvZCLkrpS1hBmIjFcwo+tHe5VHokyaeJN9kvlUkX3SQ79Fbx7WTOQXTsqEZ6OwPVf9+3/1g/iSxVGRWgI0lHSv3EqnOzZn81sxYMFHYUd7zDeuC0khqH/ax1VjX4dj8qxMIAnm/KcvGlzvzErVzICFi4NCT6gdBbvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660101; c=relaxed/simple;
	bh=4V6OS7iCEGY040+hV9VWGSogwoPmP5nnqcnuzCqFCpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZzlUnOp1JrqbuhN6i8+B0V/SgDu/jA0q08oMrH3ATv6GxKqUg9wloB94QTUv1GsjEX/CYni/cRDPY6xfyLPr7I1A7WwBVdnFecF3OvG7OGPoUq9OTLvX1buXfV+CdAQ8zgDA0hCEavQXSNiGapOk872zaLeQDM8dob2pHQdvzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uTaeS-0007Ec-61; Mon, 23 Jun 2025 08:27:32 +0200
Message-ID: <133e7a14-9c61-46e6-9ac4-e1c17c0c28b1@pengutronix.de>
Date: Mon, 23 Jun 2025 08:27:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Abbott Liu <liuwenliang@huawei.com>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250620111257.3365489-1-arnd@kernel.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 20.06.25 13:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
> 
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
> 
> Add the missig exports.
> 
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm/kernel/armksyms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
> index 82e96ac83684..1ff50106afa4 100644
> --- a/arch/arm/kernel/armksyms.c
> +++ b/arch/arm/kernel/armksyms.c
> @@ -83,10 +83,13 @@ EXPORT_SYMBOL(__raw_writesl);
>  EXPORT_SYMBOL(strchr);
>  EXPORT_SYMBOL(strrchr);
>  EXPORT_SYMBOL(memset);
> +EXPORT_SYMBOL(__memset);
>  EXPORT_SYMBOL(__memset32);
>  EXPORT_SYMBOL(__memset64);
>  EXPORT_SYMBOL(memcpy);
> +EXPORT_SYMBOL(__memcpy);
>  EXPORT_SYMBOL(memmove);
> +EXPORT_SYMBOL(__memmove);
>  EXPORT_SYMBOL(memchr);
>  
>  EXPORT_SYMBOL(mmioset);


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
