Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413222F3C39
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267798; cv=none; b=qzDt0y3/LBKrA5mlD4MQs6ArESW7zRHwMsz3AJvhQDTV9u6l4PwF4pQJ8QztHFPiAgvkkJlwbmYUxzJ2pA19RBAfnp31aQswcXO/s9dZrwxTe2+UFpjF7uYR2T2fOeKQNKrC69LJwRZS7gI0+qKIaQkzJ8hfOL8BV4MBTOImtAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267798; c=relaxed/simple;
	bh=QxNatCv/O3861aZBNyqUBLKmJGBv/spu7pwTIkEnWd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=uIfDrcumGVHKkrEgmfgVHJLPGXu8prVqkST1WoTfBrhtpUczK2SGVtalw3yw2AsJJMFduW0r8AaH4yT665E4hNtdSaOtbY01E0rQkWQd002tzKX46b2MBlR1g8JlBxRhUmk6Do6yVggdtpetn9D4qoYd9WUTcyBP4/2My8JMXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Z1Ho4Wbo; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z1Ho4Wbo"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618172953euoutp01a154724671311c94c02970c0ee81ea17~KM0jpleFO0416704167euoutp012
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:29:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618172953euoutp01a154724671311c94c02970c0ee81ea17~KM0jpleFO0416704167euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750267793;
	bh=K97FTbMt5JoIwDvHOKNiKQwGHF/yxquenFxIqJsaQGA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Z1Ho4WboWTzD6ZKXkHwmx6aqguEFBqCE8rmMzauc4t7wvDVMxgWxgDywg2Lcx+02U
	 WEaAKOBULRs8ErBhtDM9n9EOQaHsa/n/+3paOFFzk9utbBdLi7jBcm5eqPWkkOUC0J
	 hvD4X4zn6Pabypumk5w/5Ln0eBhdu3LE4icUIXvk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a~KM0jT4eL62797627976eucas1p1S;
	Wed, 18 Jun 2025 17:29:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618172951eusmtip2483250b17c457f30b81134e00802b6af~KM0iD8APO2341123411eusmtip2j;
	Wed, 18 Jun 2025 17:29:51 +0000 (GMT)
Message-ID: <3771a2ba-84a4-4cd5-a9ad-913130f19c27@samsung.com>
Date: Wed, 18 Jun 2025 19:29:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
To: Bartosz Golaszewski <brgl@bgdev.pl>, Klara Modin
	<klarasmodin@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon
	<tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture
	<venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
	<benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
X-EPHeader: CA
X-CMS-RootMailID: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
	<20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
	<CGME20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a@eucas1p1.samsung.com>

On 18.06.2025 15:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We've converted this driver to using the new GPIO line value setters but
> missed the instances where the legacy callback is accessed directly using
> the function pointer. This will lead to a NULL-pointer dereference as
> this pointer is no longer populated. The issue needs fixing locally as
> well as in the already converted previously users of gpio-mmio.
>
> Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This fixes the NULL pointer dereference issue observed on RaspberryPi5 
and BananaPiF3 boards with today's linux-next.

> ---
>   drivers/gpio/gpio-74xx-mmio.c | 2 +-
>   drivers/gpio/gpio-en7523.c    | 2 +-
>   drivers/gpio/gpio-mmio.c      | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>   	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
>   
>   	if (priv->flags & MMIO_74XX_DIR_OUT) {
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
> --- a/drivers/gpio/gpio-en7523.c
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
>   	iowrite32(dir, ctrl->dir[gpio / 16]);
>   
>   	if (out)
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>   
>   	iowrite32(output, ctrl->output);
>   
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
>   				int val)
>   {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   
>   	return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
>   				   int val)
>   {
>   	bgpio_dir_out(gc, gpio, val);
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   	return bgpio_dir_return(gc, gpio, true);
>   }
>   
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
>   				   int val)
>   {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   	bgpio_dir_out(gc, gpio, val);
>   	return bgpio_dir_return(gc, gpio, true);
>   }
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

