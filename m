Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AACA20458B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524836; cv=none; b=n9mIWJkezzHC+W66f6yO3TSPwt10SUB3vaHNRH0Kb0KL+H27AcOCPq8lpy/g4+42JUvFwV2VHGptlKTCgYpsKqV5O+g4dHTMAWbTMrB47C3zknAniJD67tiY4kXQjQi4FBsZEdPr1VEBdDx5MWP+d+9mYOcVViWSEXjWdwDm+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524836; c=relaxed/simple;
	bh=xFFHZyQ7IPDD28Vh2LQSW7R0qVQrzUftnErUZO0zbqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYO/hwXo2qf6t5Dk6Xc+GCaFWlbcCwXyXThcKyM/PGcbZg7TMNC3WprQo2FQZt8tQWBmqBY4upslM1jYC5XHHLeO8cCIYZIadRw/MiNCyILUunqFhBkrxUuvdnuJQYkz+4G/Tfw0LdXZx9Maox7fG+B8IA37qiWAkuUhpGkhsts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQ+aq70X; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQ+aq70X"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b45cso24587835ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524834; x=1744129634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiCJ+0nvHppI8Z1iMldDvXvFUvNA7Z2vIeGOxDeUG3A=;
        b=AQ+aq70XfvVuAK3CkMwLjagKL832ARHex9vvjNlDw+WPTCW+h2K4eoctA5X9YwEtbH
         ztzIKu+9IHTvbor7a7mVVJlk5GByTki4mwzjG5ytgSHPnABsUylAkVhaZY2a7OQZZIXo
         5600SbZCMc0HAgijst8KNIrlDws/MmkwI1XNUSoOG2cfpxgyAVIc+qeiFL6r1tojFlwL
         1R+8g7wmC4mOJuHTx7RAc8v7i71R0tp/pdYsLMI7gJZeFjLCfkHWTxu1PDC7CVgqqNui
         CRNsrd8xyoPHthgHdwhmRvVIIHDPlecx8QxjoO/RMd0SXTYmoKaTuy9CN7DZLV2irlqQ
         kkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524834; x=1744129634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiCJ+0nvHppI8Z1iMldDvXvFUvNA7Z2vIeGOxDeUG3A=;
        b=C1oQ6+s5SBvUGFiCljdaZQy9ppNm0cTVxOFdvED5DzElttmIwvNpZsxc6kOl8IkpmJ
         dYPL4Wed1cgLeeQymNnzK22bOKAr72NmW18d9XZMWsTpoAPHVZoNpcPK4eOx14ZdMara
         SOaOj+Kcz7CLYOh01hhVJbkqyM3rTq74pUZ4INQBEYCK5ml3bG3kaCzCD5qSrW1Yv1aW
         3FcT5l2BHyIO+xEMBrav0nZjBojvxlwQW9nCFbvPtXXpZmmzTRUMuXtM8lTsYYEKyMnA
         O1m//gvvJl9EBOTuQhzBolW+W8K9GNM8IMYLweqCRejgnAE/4s28qd/off1ZfHg2PUcv
         TyqA==
X-Forwarded-Encrypted: i=1; AJvYcCX3qcvz+yJimlXEAW6wlDa2GWe1yu7crZ7lipEo6xDX+2K3xPgn81JXHeLbo9Ibs9AUfoksnViFC068N8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzTXfkK0YKhSldFYOtKUQsmJgW2N2Cx6anTAr8h7dCoCSm9Lf
	VlnheDBtO5EUM7W9aLsu1dlC2ITJ9ASvmrkO3Vnt/tHSJzRAEvxWgM01vvicsA==
X-Gm-Gg: ASbGncthFsh3Nbxma7Txr1pt0Z9VFQAPMkx2TbcSlf5sihdvVDU+XbLPnpqN//yuKZ9
	Ob/2KQsvfN7RQclUUHms8pkLn2IQVrO+IxnAW1/y3jGdM0JSJFdSGS9RHiSiQ21VmXTleUvB3T7
	8Oc+raa8RcAkFGsdD8p/BS7O2iCGBEh0NRjudDCgF6YUoZKDrDv9xX9fjs70LVxuZpmUt751Itm
	kJ3GSJBPx6bwSD2jJ1hP3anHi6GlFlms149J1MYnIiskaj44GTW5+sPXQ+icxTk9uTdB+3hoOT+
	WN3ns2JVTIhbWBkB9jOlI1NVQCu+ZX3N4Ai6ZcegK0HGNH0Y7aWXHINuGK9Bg/9AkN81943CTCR
	k2Dsdl2nWFPr2RNY=
X-Google-Smtp-Source: AGHT+IFuDdi1VulATC8EaumQBhjKKw5JE43KeKuzHYuRoICEO7rhRETwg2aMwK6/jUYFXFP8w4bWLA==
X-Received: by 2002:a17:902:ea0a:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-2292f9f981amr220280025ad.46.1743524834183;
        Tue, 01 Apr 2025 09:27:14 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deed14sm9416725b3a.19.2025.04.01.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:27:13 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:27:09 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z-wT3ciq7nL5wa1X@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
 <9f594cf1-f1c3-45fc-8d1f-a5abe6c84699@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f594cf1-f1c3-45fc-8d1f-a5abe6c84699@kernel.org>

On 04/01/2025, Krzysztof Kozlowski wrote:
> On 01/04/2025 01:00, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/Kconfig      |  3 +-
> >  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
> >  2 files changed, 42 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c85259967..e5d9d8383607 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
> >  	  Support for Timer Counter Blocks on Atmel SoCs.
> >  
> >  config CLKSRC_EXYNOS_MCT
> > -	bool "Exynos multi core timer driver" if COMPILE_TEST
> > +	tristate "Exynos multi core timer driver"
> > +	default y if ARCH_EXYNOS
> >  	depends on ARM || ARM64
> >  	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
> I am not sure if you actually tested it as module. On arm I cannot build
> it even:
> 
> ERROR: modpost: "register_current_timer_delay"
> [drivers/clocksource/exynos_mct.ko] undefined!
> ERROR: modpost: "sched_clock_register"
> [drivers/clocksource/exynos_mct.ko] undefined!

I tested with the gs101 ARM64 configuration. You're right it won't work with
ARM32. Thanks for catching this! Since ARM32 architectures don't have the
arch_timer, I'm not sure if we can actually support Exynos MCT as a module as
you wouldn't have any available clocksource during boot. I'll update the
Kconfig for v2 to handle this and make sure it works for ARM32. I'm guessing
it'll work with something like:

config CLKSRC_EXYNOS_MCT
	tristate "Exynos multi core timer driver" if ARM64


Regards,
Will

[...]
