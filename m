Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8021C9EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279340; cv=none; b=P23LsDLTgpjWs/7Fn/AazAfnAvLrsPxxGBpJizL3Y+aKdLxwzxs2FpIOQhZ2/J6lrqb7JXIOl7Y3P2CHN1NbdauK3PgqTTbs1EfJhlX31qy+K/oAD1647w7CbmtiD7FjoEv857waGuboxrQ4cp9LkXTQ/ZRsyZfRPVE1/tvQXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279340; c=relaxed/simple;
	bh=L+cyLQGnllq28JQ6DaYTG1avcsFD5VA3UICOvndcs64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6ez+w04NvFdJzEXCfT0pXCdEQ10MTESgL1Z5nMFIdm4RjdlJqYQ3KYXDxR086l66labJ4X+jG/vh37jdk+CeolNNCm1DZgDp8guN55zuyGkqzN9QqTJuo++/CQBIQSHoIbTlSLRXbKmDRTzBQub1ixzSfAVzH/FZB0X0Z68axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDJUhT4o; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDJUhT4o"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-735b9d558f9so33677a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750279338; x=1750884138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=vDJUhT4okjDtU61p4bS0yoF1Js3vkssAtcZyVxH1EhAEvHpZcPcw0K/xLvQgz1/hcg
         m1jnQaHl+aYahNPw87+eEVzePhY0H7q6SH4ngYrgWIwHyiO4LFMPzbtrHqeWWWXrQX+8
         Nse8+28yEaHSiLPi0xNmBTAXfBSEUuy2TjPTi3j30o2yhQ8Wqqwf45VTBO6rtWCh/xeq
         D4ZXu7ZtADvwHx0OnDrUIEQffT+Eu66WYiWFvzaKHWEaH1GXsJYaBrIMan4c07lPfxi0
         Iy8T8LiiE1YWanxi91gZwRrq4uBmYYI0XrwfKtv7xS9eGe8YF8qm5ktCKRjbiubgAwSU
         WUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279338; x=1750884138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=UPVBtg6A2mogqgORxoSiIDqDWU5uguNrzNdRfPeqFtPTwNfZbBrcBYFotcV3MGrXrP
         mcTyGIklV6jQvoFYBTfzn/pZe1KCviR/suRiCr5LhKUvPVq84RLkSwPzpO7liWKWqH4D
         CXn8u7xNRB33gqbCApo6q8OvX142sK8SjFlQ1/pBKabliNmZ0j1tCnZIbo2J8EPirrim
         F3dI0VC0DvWDab6NZbfb2CRa78zR49+SzfZUICB5/VRdEEU8NP5rlyfgLNsX5Nqfbt8P
         41CrDI5sU9vvVkMLudJhk2DlPaPaNLuz9xqi++s7NTQ9o99jBcxV7xmD1/LDsei/xywL
         DfIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxtoCbndKpkWCSCE1uCIGYHr/hcsdvtnYqc7hC6CigKwz/U/lWXjaUfT/oLUlA2A1K5iB+wToosxErvs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/1bL5VHoqwHQrXXx++GbsTZxYESMXatM3mZ4qNUqRn5TK5ZV
	SlfiPsL9wcsBE7CIouJ1iOlFVRb35wNrpYlrfmwEHN/036rc0i9C8KpKL4YROgLF1hI=
X-Gm-Gg: ASbGncs8p/1FJxvOEhl3rZlq8nbwZKAA+WzRGq4uV2K9KmiDV4WEgKtoDbM27pNEHwQ
	FVaLcAl/ufkaXKS9AedvFYhZabLIIbkqtZ4ygAz5jkq3WGmg2P0Abqk2g0dbG0iTTjEbHt8kpLV
	j+pEgYrH1lIJE2PrWEIeM0P9mu/F/luInyGe60jIhGuVTIPDu3AynEb45ig6qAWmcAASxllrrHg
	El+C+T8p4KB6/p7Ed2RpfUbv22HQ5LcKoZWBQFUKhpnXDVv82PHemHmewniWO1BYUJh+gpZABdk
	Nsh+3kT05JjwXpNOhggCTjQ8AsA9QN7EuL3iLSp6FTn59366hpSG998f5XeAjPWkC1K7ZcnPHzl
	OtD9U
X-Google-Smtp-Source: AGHT+IGzzeXqvvtMYEhgelf1zxaiR/pha/QAgFAlvhTzf3pfuLBytIh1fL2ehaLfaCgrcdK94vSXtA==
X-Received: by 2002:a05:6830:8209:b0:72a:10ec:3542 with SMTP id 46e09a7af769-73a36318969mr11536449a34.13.1750279338012;
        Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403ed0sm2124977a34.26.2025.06.18.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:42:17 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:42:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] greybus: firmware: use strscpy, fix tag size
Message-ID: <29717a11-8867-4a28-81a6-2d847b254042@suswa.mountain>
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617125137.24503-1-pranav.tyagi03@gmail.com>

On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> Increase the size of firmware_tag arrays in the following structs from
> GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> accommodate null termination:
> 	- fw_mgmt_ioc_intf_load_and_validate
> 	- fw_mgmt_ioc_get_backend_version
> 	- fw_mgmt_ioc_backend_fw_update
> 	- fw_mgmt_ioc_get_intf_version
> 
> Replace strncpy() with strscpy() to ensure proper null termination as
> firmware_tag is interpreted as a null-terminated string
> and printed with %s.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..3b4061f4b34a 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);


This is in the Documentation/ directory.  It's sample userspace
code.  Userspace code doesn't have strscpy() so this won't
compile.

regards,
dan carpenter

