Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C113D62B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970343; cv=none; b=QsQCbxvkVclrBPj2lYtLKHKP3UP0Zf8D2snl0q7I3HQ0DvbGO/w1XuCnwqulDxAEMUiZKAgOuE+FQjSvvFJZ/Udz1USrVmTwkCh34tynp6EChUY5428CwXCQcAQO1j0IJ3UQrAvQYrgE2dGKt0TUz/Ukua7TyTSSk0Daxo3QjqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970343; c=relaxed/simple;
	bh=nrjqM1BQp5PQEQJNTmIhzVyniEbySKV8s6LVXgBl81A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY3c6IGbBSIXcDKnrcqJJOopMtys/w9Pf5Pn5uR+PRUDhFyeCsHJeSjVY1eoaao1KNiIAb8aY7YmC497PlebVlzTmPJTckR7Cq2B0l2sHKuFB/FDf4W0Mnk3qJy0E/LzdZS21cEp/374Z59tRjEuHctSwct1FAKRxUkApEWTe0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOPASi1a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOPASi1a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFCFC4CEE8;
	Sun,  6 Apr 2025 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743970342;
	bh=nrjqM1BQp5PQEQJNTmIhzVyniEbySKV8s6LVXgBl81A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOPASi1aGrT5/CbGBcIfqJAMWnE46VITXobSpb4XWJgdOZKDnEf7h0GGGLFtLVNC+
	 yu9BzQiQwU0K1BH9/W651oIkSDI2UawEWQH6BbXrRfC0Wlc4QAziVZD66BNDv6z8Cg
	 GDcyotKY75nZb2TX64sKP4sDmiFkvFg24y07HJ5GkOWQtrThUJgJAK2xO9xUIEYf1Q
	 d0XA7dA7/Lp0AwqQuHzjSh86b4U7zRLLgeSr14VGRwT3JLvxFZlS2bSP2ob53UsqoM
	 J0ml3abGLGG0O4f/LYb6G1z6MYsk8b5UYEKav2x1rpDJdhWCyWTsEoK7r+cGGfPbOF
	 GBe3jM4gq+Gng==
Date: Sun, 6 Apr 2025 22:12:18 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] platform: turris: use ffs() instead of __bf_shf()
Message-ID: <fiplj5dgokc5syrahjoddwm3lw3vdweg3axi5xcof4qfr6bdo4@yhcnph6lx7zz>
References: <20250404135531.2421755-1-arnd@kernel.org>
 <20250404135531.2421755-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404135531.2421755-2-arnd@kernel.org>

On Fri, Apr 04, 2025 at 03:55:26PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> __bf_shf() on a 64-bit variable causes a link failure during
> compile-testing:
> 
> drivers-platform-cznic-turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2
> 
> Open-code this using ffs()-1, which has the same result but avoids
> the library call.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/cznic/turris-omnia-mcu-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> index 932383f7491a..c2df24ea8686 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> @@ -1104,7 +1104,7 @@ int omnia_mcu_request_irq(struct omnia_mcu *mcu, u32 spec,
>  	if (!spec)
>  		return -EINVAL;
>  
> -	irq_idx = omnia_int_to_gpio_idx[__bf_shf(spec)];
> +	irq_idx = omnia_int_to_gpio_idx[ffs(spec) - 1];

Weird that __bf_shf() procudes this error on non-constant input.
But I guess a variant of ffs() makes more sense semantically, since the
spec arugment isn't semantically a bitfield.

Shouldn't we consider using __ffs(), though?

With __ffs() we can drop the "- 1", i.e.:
	irq_idx = omnia_int_to_gpio_idx[__ffs(spec)];

Both __ffs() and ffs() are used within the drivers/ subdir.
Of the 649 usages of ffs(), 482 are ffs(x) - 1, so they could be
converted to __ffs(x).

But I don't particularly care.

Marek
