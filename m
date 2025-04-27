Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D735280;
	Sun, 27 Apr 2025 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745769872; cv=none; b=Gxqv0bPtxuDcVv+A+J1uBStRCP80eqLwQCYfO7ImhdGOXckpKXIZijkx9GsA9rUhC+Q4n5DUNFrE2bQat2ZZQBSG31OSRw+rrjompzWYMWuKEdqruxu85XE01uvDSbvSuxkXdHu8LMW1YUuvRMVHDqwkj5x1/pyXUov/6+sZQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745769872; c=relaxed/simple;
	bh=V8JOA6dRotxwbweHH8MKG8LWTT/GiyTYBk0INgJIXPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brMUJ7HYUdPQ8zZc0TxL2ZxHeQUWU5yBzmkHecX2SIeIS1zwoRwKrJlK1fWBMEoItuLEDmwfUekQuPaebKlJ3iTXznhttVS2NMgBhlhoSG7lPVKK6C45rErx7OtirywDy+hmSVaLMeOu5k6sNJK7y9w3S+d+ZyCxcDzd3O66xas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g1zjxJB6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g1zjxJB6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MPwsKOKikUI2Hbjz9HM+ALtIQrd5D4385/ERHMTCY0Y=; b=g1zjxJB6RPGKQ4LCwMZljHL1gw
	uM9f+zmJYAJ6rzQ86RNIsle6oByl7fAxntteNqBleogvDg+mC0DI+CloD+oe6m4QZWmW57wwYs2Gn
	T3ZEkvVf9Sqf6GupTYJral8e6Yj8uEqKlwIw78Ei+uXFOy4NDWJ9X7X/kQd5h29EV6THscMBvRk6N
	G7ZEsIIeBDwovoN96KtO4HinIvfrMo+F6BPh0Z21HOsYF+bb03U7/3Qoem1l237xgRM82G5lxhDF0
	64ftXik4ybmPWI8HH4W/p6hCfaNLFt1ZxJijrkFVbKs8ExDs63hGrrv+ZVJTgR/4UiY7zJqYIUZae
	AUfeTYcg==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u94UL-0000000CUJj-3MCO;
	Sun, 27 Apr 2025 16:04:18 +0000
Message-ID: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
Date: Sun, 27 Apr 2025 09:04:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v8_2/5=5D_auxdisplay=3A_add_TI_LP5812_4?=
 =?UTF-8?Q?=C3=973_Matrix_RGB_LED_Driver?=
To: Nam Tran <trannamatk@gmail.com>, andy@kernel.org
Cc: geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250427082447.138359-1-trannamatk@gmail.com>
 <20250427082447.138359-3-trannamatk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250427082447.138359-3-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi--

On 4/27/25 1:24 AM, Nam Tran wrote:
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index bedc6133f970..896f02b9a06b 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -539,6 +539,23 @@ config ARM_CHARLCD
>  	  line and the Linux version on the second line, but that's
>  	  still useful.
>  
> +#
> +# TI LP5812 matrix RGB LED driver section
> +#
> +config LP5812

Missing one tab of indentation on all lines below here:

> +tristate "Enable LP5812 support LED matrix 4x3"
> +depends on I2C
> +help
> +  If you say Y here you get support for TI LP5812 LED driver.
> +
> +  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
> +  animation engine control.
> +
> +  To compile this driver as a module, choose M here: the
> +  module will be called lp5812.
> +
> +  If unsure, say N.
> +
>  endif # AUXDISPLAY

-- 
~Randy

