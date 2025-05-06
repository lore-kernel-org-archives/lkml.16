Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B41A76D0;
	Tue,  6 May 2025 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547889; cv=none; b=EhPXXPEbt+/SHWuivVmVISm2jtiIxyyBhXTFYB7Yjc5uWyQFeW800dlHtnEX8HQn5wt3hQ0DmvNeuiudH3mWAx+zXoVnLCrbIfLILA8ONsM2LW/YdylvcY61rN8AHuNjIVAnybWDMBLNBwR0VqLKALfp9dvGjFkf+odFsNzdI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547889; c=relaxed/simple;
	bh=SBbShnO5sydaviYERNDfQbFXQfEwfJ4PO9yI555wA1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2AlR0+nE3QzlgkQMGAsZG+gdxzc7AbBZy5CU52DGFAvx9pRvfsGT7csOuu7RysorDHQwjfnk7dc7qA4KyySO0YJwookM4CodtUlaKwrFp+a5NMJ/di20MSIu9vAgR0AAVh5gU86IgD7gmZbZYA5B6kf5EjviRuSWGJlz6DiJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlZL9Oqc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlZL9Oqc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so9694319a12.1;
        Tue, 06 May 2025 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547886; x=1747152686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kkoPM3l+7lBzFUb9NEMVxvMo2JwLrBmweMRUdwrQK7U=;
        b=TlZL9OqcTYthCeSxzR/ExKHZf+2xH1KJhUsVD38tkkogr4PyoeZphQxRDxNkRAuePp
         s/4WseQd2GBS4iy1GdamHpJo0xklIxqzVDgqdQedilS/+3tXBNfEJNQu8iq8oQ8Zw39v
         ku9cyKCbplveiAUglGbHfTAEzsQmH6nKRSL8VN77/l/BInQScvvPLXffdOyHJMqzzv3g
         Npqx7Np9iUXJJZDTwn6MY2KBkMJda+RSngihy/rrleADT8meXOsJT0Db30woP/xKfzzt
         vrN6GPQ1r7JOB5zFDcQlEmME2Nez854459AF2MVAkaTfgMiWQSBulqN6y/edrLEemSm5
         6Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547886; x=1747152686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkoPM3l+7lBzFUb9NEMVxvMo2JwLrBmweMRUdwrQK7U=;
        b=udDpaHp0UdxvkiAT2ho/hFZMGj9hmcfGarYu5TlQeurazORB8fUfKU9dgSsJaoURhP
         enPODm3ayf/zKAkjchcgkB2Rm5YZ3+FG9ZyazzQaBLHsyA6WL5OZxKLbj06NgJt2OOG2
         8L0YTnxYisdbDeMmdxd869TiZDO0CQ2IsGkWQX3tmTaCmNe2Wy3hYCQLBr7Km0zr0vWk
         R4DKeMIGoTEIOl/sO16D2ks1hPoSEtASKThhlXcl/8dfkKOb3XXTEK1ED9iZaKHDhcbg
         g4q6conoFvbNRJEGqb89AaY6BpnEO9c2gIDKZMldy66iXRknNVmChnFFtk5HAelhHIJE
         IT4A==
X-Forwarded-Encrypted: i=1; AJvYcCUjUk8KrHAppuXHCo3eJmJoMXHhVr6cgyKHQeRrXdggNr5Cdh27E0YudBVUt2nqyX96ejmEKXvEsUG1Iog9@vger.kernel.org, AJvYcCXbPkbyJAISdtWUPHGHZMZnXLe7IM0ZIPH6q6/Yd5WEpjEZYjtwR19dAI68LF+iYQavRkBfVTCfPkLr@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbUr+7MtGVi8yFUAqRiaQeRT738DiXG7WwxX+lr5GfcyuUgyy
	beY35YMTZ+f911wtxQ5SwV/rMcnUq4BOgmDiq/jvDdAZfm5K3Pvx
X-Gm-Gg: ASbGnct0OIN6JSzdEnBP4KoRnsCakYzeuRQ1aP2Ly3tmBUB+VxUt9c9PXv6FoRJNx2O
	V/zpmXTItFbOWEmjuXptw3gqJqIzlfJMAilIuMozb6svVImKu5TPcLqQeNM/tP6uo3fZhS0261U
	JuLsFVZVkXtpkaol1IbvMbvEsbiBDOt/eAC1V2xLq2D85N/sv7UnVCKQlVk750cRY9o7AtyUQ5A
	1boFg1rwFuKkDDdyVPDQfPoIuCf1Mt91PNF8AC1T4jxAoV2baQk5RuQWDOZjFnZ5tgmzAwZ1Z/2
	0X6mavueTW+KRkoUwrfW1Y0Z3ollxlhk70Y8907mQm/elAcLbGXN7LkkY8VBWF82sFrRCvhuEN9
	9WTAU
X-Google-Smtp-Source: AGHT+IFFb8Sczr+GWj749ickdZJm25UBwRYzY6YSoQhWF0Yb59oFUJeLm2Ct+iUNZh1aWw2nmZXEEA==
X-Received: by 2002:a17:907:94c7:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-ad1e8bc3f2bmr5838166b.22.1746547886026;
        Tue, 06 May 2025 09:11:26 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fbadsm7933492a12.50.2025.05.06.09.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:11:25 -0700 (PDT)
Date: Tue, 6 May 2025 18:11:23 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>

Hi Artur,
one note below.

On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
> The BCM590xx PMUs have two I2C registers for reading the PMU ID
> and revision. The revision is useful for subdevice drivers, since
> different revisions may have slight differences in behavior (for
> example - BCM59054 has different regulator configurations for
> revision A0 and A1).
> 
> Check the PMU ID register and make sure it matches the DT compatible.
> Fetch the digital and analog revision from the PMUREV register
> so that it can be used in subdevice drivers.
> 
> Also add some known revision values to bcm590xx.h, for convenience
> when writing subdevice drivers.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

[snip]

> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -17,6 +17,16 @@
>  #define BCM590XX_PMUID_BCM59054		0x54
>  #define BCM590XX_PMUID_BCM59056		0x56
>  
> +/* Known chip revision IDs */
> +#define BCM59054_REV_DIGITAL_A1		1

1 seems to be the digital revision ID for A0 (couldn't find the analog
revision ID), see [1].

Other values seems to match downstream (as far as I can tell anyway).

[1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82

Regards,
Stanislav

> +#define BCM59054_REV_ANALOG_A1		2
> +
> +#define BCM59056_REV_DIGITAL_A0		1
> +#define BCM59056_REV_ANALOG_A0		1
> +
> +#define BCM59056_REV_DIGITAL_B0		2
> +#define BCM59056_REV_ANALOG_B0		2
> +
