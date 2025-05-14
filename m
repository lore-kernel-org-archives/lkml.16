Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52D1F866B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253799; cv=none; b=lEf+/fnrsf63IwXccI8TQEkRrLevFcycax/lHiL2I3tbrduZHV0l8IDc2QrBH915PwyAPQ545E6XGdZk9hle59vIT29wCRgLUzVVQCLltm9uf31MQ3YejCOZSfmpqi8IXXYqS1TsjPbJHGjoAQFQlV8a5WWaCXBnQpGNYfb1WqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253799; c=relaxed/simple;
	bh=SY7MSyMBUqyDDrbn4j++gL18TgAdHWyBHiS/YGXUBXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbPFkFYzTvLGPsbmGu8wTLPufja3+N0sioTynDBPtzlp9kTFmPbjsq4IcWQvgxzD/kDX54AYUCqpO40nqCaQ5TzmYLaULsDImmQ5H7ZkmoE40eCAlXKfMpZBFZWL3KUHQKqr71nUIKOZql/16w/9T7XYQmbDxk4YBtVk/aUGKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gppJjGxx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gppJjGxx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e8461d872so1983615ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747253797; x=1747858597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XN93Vqx7e9FnvEk/EK5cI4vqECk3VSnMA5C+tkIxLhA=;
        b=gppJjGxxdsMc4/EgEfG1GCI7JX40eji2aYRSHQwgSipxgoHovY+oMUTKcRrtwz0d5y
         R/rwVFTbfpwrjTte++o00kaFOJK4NfIBiV/MDCI8mi5CUQqdnGFFvZD/Tw/b2Pe5Wbtn
         bTyTXB7MpmRp+epseN1XWhezOrPfpwDKYyknw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253797; x=1747858597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN93Vqx7e9FnvEk/EK5cI4vqECk3VSnMA5C+tkIxLhA=;
        b=AmeBsN7+8alZPmXgTe/Xz46ghEq4Dt1KYkl3HnLqLBcxETWV02VtZWFShyGAOzoGCo
         29/fkwOOdps0b9Bb6tVPmYfBT96osZ31urP/lEGnbU0HkPUs5EqtlcoqThhvNRNHLfCC
         LBLKTERSQK4L7H88L5o+gtzY48jReUCiMjN/46qmU6na4EZMYuQX6hyEK2jEFMcSCZKH
         nLjSkmsUaxgu2ySVXw+/RTTsDDgJ8hzu1Uw9CUALpe0cNumPD5xhIWHPrZXucs6qQULA
         JpFAhAn30sb31vivR1AlGVf6OppcfNRpnoXUEjLiYYbb/Wye3925R2qjQ3pSiGtgdE6A
         KAog==
X-Forwarded-Encrypted: i=1; AJvYcCXC0ZfLDvTUdWjtsZfwnJ+q38ooBD90BL36GNtI8kq0dybAz80uNYK/Qtf8uhBTwNhvrf8Ri4HYu3MZ7zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXkUs3tQZpSAjMOvccaNKiw4Y2K0p+TuZE6zJSjy1JRDoR427
	zJxfAVglfle5EFfEokC8tk105ajWvwsbzBQG2aR0XKdsaqnw1dvON2PAV/lBRA==
X-Gm-Gg: ASbGncsHoNHA4l6QGJNHClLiDpiqUeTFoXJ/uNZFC7Je1/mxkhbx7kY5SUD8i5RmYPI
	hc3/j/deYQRg/V8a+UDL3OTqODCR2qn3YF0RotmT140XD9LXDzN0rS+3xuvdhotfC9ebF8YRnAn
	k+snOxkKtDZNwtY2p7NxJUVt/xWrKj/FaDJPvFVmxD6MN0Yuk2xs8OKXhemn4l2OL3KYqYCH7z0
	5pLDn7IiBZj5JyBcRInRVskSxLqUoLqE1+0lTh14UuFdLRheZy3FxvAiDEL0GFGizsFvbBLb4it
	B+wUWL5BZGE1QjCuA2LPcGu8k+QsL4EAegRZVZhQ8r/87d7QOuWJ8s8IbX4iYYNvat3tD9IvtKf
	xskP16opr6/GouA==
X-Google-Smtp-Source: AGHT+IHb90aen4RxvV4sM3hCl4CXU+KiMWNDOfxgG468ncfDWtQdA+PELE77RhKOkC4/Xq7snoJUMg==
X-Received: by 2002:a17:903:120c:b0:22e:40d7:3718 with SMTP id d9443c01a7336-231981cf6b6mr60214895ad.47.1747253797393;
        Wed, 14 May 2025 13:16:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22fc82a1958sm102636985ad.229.2025.05.14.13.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:16:36 -0700 (PDT)
Date: Wed, 14 May 2025 13:16:35 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] genirq: Retain disable depth across irq
 shutdown/startup
Message-ID: <aCT6I5dhx5-xluOo@google.com>
References: <20250513224402.864767-1-briannorris@chromium.org>
 <20250513224402.864767-3-briannorris@chromium.org>
 <877c2jk5ka.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c2jk5ka.ffs@tglx>

Hi Thomas,

On Wed, May 14, 2025 at 09:35:49AM +0200, Thomas Gleixner wrote:
> On Tue, May 13 2025 at 15:42, Brian Norris wrote:
> > @@ -272,7 +272,9 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
> >  	const struct cpumask *aff = irq_data_get_affinity_mask(d);
> >  	int ret = 0;
> >  
> > -	desc->depth = 0;
> > +	desc->depth--;
> > +	if (desc->depth)
> > +		return 0;
> 
> This breaks a
> 
>      request_irq()
>      disable_irq()
>      free_irq()
>      request_irq()
> 
> sequence.

Ah, thanks for the callout. I factored that into another unit test in
v2.

> So the only case where the disable depth needs to be preserved is for
> managed interrupts in the hotunplug -> shutdown -> hotplug -> startup
> scenario. Making that explicit avoids chasing all other places and
> sprinkle desc->depth = 1 into them. Something like the uncompiled below
> should do the trick.

Seems reasonable, and it works for me. I've incorporated that in v2,
although I'm not sure how the attribution should work there.

Thanks,
Brian
