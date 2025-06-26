Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24C17BA5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938112; cv=none; b=AGQ6uyyadS53MceoD8gdDsbcS1wEjHkci/844YQMkABuZ6RJrQ0qxB4XH7VXNJ0D6H6Rfb72ZTH+cgpn+OHivUkgZOPZCNjLz1VqNr1m2pkl1L4jCTD803JaisdEMJm7veyD5o9jnCIpkdcHA6sEb5JU9TNd+5sboGbcTGlpmPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938112; c=relaxed/simple;
	bh=ZplEWNBtHcZ4mdOLvvIwXC2Hmv5WMUfJ3rsoc8VVJnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml0+zMTcbmiHx/lYjUCu1KnXZZHF9vhyFDAADikzRHdtYaJq+2VQTn4+5uIMAmzSY3U/nJaJfh3n5SOzwhR/m0jP1qAvZbRDI+HoESlJO3JoMh3g6pTni5BcmP2nQs+XkXjqHxvXEaBGcyzCuhIqbAeOQeZTBrQoihTQbzfbRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Eudll2+n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Eudll2+n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce671a08so4626355e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750938108; x=1751542908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ltL0CUXeRmuJ4RejWH7RMJozlI0dKlYGqD8O8bc/Ck=;
        b=Eudll2+n7C2LYFl4FyXYdlAj2PPBdBvIEM1JuRlmP/emi0DQTGMCrFnEjd5lLUgErh
         0ZqN014mQNPZOHx8xSh4BrRNr7yVU2r2be20WlszIdVixLE/Zmv148hauawKBMJUFa6E
         6dY23vXNzobPVPPAiKAUCky01eAuBcnBh+DDAVabfIYmq1k7o2zEThvq/p/bxkPzJi/S
         wNwKie0k7lNIvbietGw7H+aWd90cmMOwwxzm7M5Eelpzt1JRACfIsGJQh4ahCppDwDZO
         S4P6eWnnTxZDMMdiOuOYr16bic42WaBJqShmdR1IFHGWrH8Mu0z0L/mpb/UXZCQ0mV4E
         sX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938108; x=1751542908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ltL0CUXeRmuJ4RejWH7RMJozlI0dKlYGqD8O8bc/Ck=;
        b=osbwHHYd7Fsv8jopdmnm3qCYUi2Q8me8MsjzP7Ddt98+B0nLTZBR6myFGPS64rHxdT
         Ga6eijTKsrMFKXHo7wnC9cLNaufUWh3phK13xvGsexFNgq97rhyfd/qNMB4XrKvkBmJ/
         cVI82n+YaBnaQ1VU91Q8+KV9/vlzifI4B3KPMXeRx6oCDE/QlRLuAwha3Dp2M6Jok7xN
         vsdEq4W+vVpVowBzKI6t7BdlROZUOKiINjKJ55rMTlrfpaHagYdQNK+r6BJRBsIPWVAh
         q2l7pmlaHSCIKZEUf3hrxlxLoLXCYAVkaHCQbok1VxM5hBvW6NUQORe9w8y5I4F9r/z8
         p5wg==
X-Forwarded-Encrypted: i=1; AJvYcCU87Udh7kMGcZbx6U/9/1+rq5WjqAHQJ0tpjZl9Xb8Yecza3jKwOvuC+sV/A2AbzmmKbeFAAfN+HZusB9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4x2ybuPQBMbu0VJ9NU5XPg+m/wrb3vgIHyWf+UECOhRcS46Ec
	dP8TvpFe1plrjKuxo0QO9OGFefmJ1Ka+i4EJZk+MtZZdlc2AfCl6CfygbqJV+L63vQ==
X-Gm-Gg: ASbGncv7mXagsjVZc4VxAFS4ByEXlekZ49syDwSzDqKS6pJSjM9CKzfXDdGkBwHioND
	y5iw390i8B783//Ses3boRoJytctLGzqMiUmTh3GdGNaNrQox2rzERIFUDA8MOx7rIf8qzbwspI
	2kY/yU6yT9ePTvL9q4VwEGCNTy1nVXRAomDbAycmNhl57buAo/+XyBQPUmYt42QKfnTEFvq5Jkn
	rbtws+Wut8b9lUtKGfDxE89fT8Q7Zc/w8pDoHgjWuxBlVUCuHhOsdg+IrbBbTpcRTSg0P1sIqwb
	49/Zv0B2GIaZr4u9UXETUvcn0ZGOM6xreCwl0BX/sJatEZDeYB+jpFkIE/1A+swN4Iv0YaNSMMJ
	hvS7UwEyi2o8jCvc0P6FaeznBjAD9M42RlUMKVB98RQ==
X-Google-Smtp-Source: AGHT+IGQ3HVge8+n1amo8NkGCsTCJQTSNRnL9rshARj8zSdPIXUqTQ6P8JU+3XgaHRsYlz9jWszwXw==
X-Received: by 2002:a05:600c:1f0e:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-45381b0af78mr71483905e9.16.1750938107787;
        Thu, 26 Jun 2025 04:41:47 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805eeffsm7146276f8f.34.2025.06.26.04.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:41:47 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:41:45 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF0x-d-uBbMQxrxO@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvq49ODR3XfcwZJ@cyber-t14sg4>

On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> > > +
> > > +	/*
> > > +	 * Gives SMI some time in case it takes longer than expected.
> > > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > > +	 */
> > > +	mdelay(100);
> > 
> > This looks weird. Are there some ways for Linux to be aware of the SMI has
> > completed?
> 
> Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
> [1] before and after sending an SMI, and wait till it increments. I am
> not aware about any unified way that works for AMD SoCs. However, so far
> none of the AMD boards supported by coreboot was tested with MM payload,
> so to make it Intel-only in v3 is not a bad idea.
> 
> [1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880

As a follow-up here, making COREBOOT_PAYLOAD_MM dependent on !SMP
resolves the need of acknowledging SMI completion. If SMI takes longer,
Linux is just stalled until SMI handler gives the CPU back to the caller.
I think for this case it could be the way, LinuxBoot is by default
compiled without SMP support anyways when used as coreboot's payload [1],
[2].

[1]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/x86_64/defconfig
[2]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/i386/defconfig
