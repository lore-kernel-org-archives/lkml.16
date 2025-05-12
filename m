Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145052AE68
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050434; cv=none; b=sBaz5L4sPgq8Dnqd2coMIEAQVw7x+/cjnUGseqnOBHqDQSeM8/ZGBMA3QY9AXH6AUtwiEt49k1nau//RORCSxkI5jQjCwBQuMkeBhrh+QB/YNyPbI+1HuJYRWCKVtR8jelS+MUs1/q8i+ER+k9y/INQ4CdMNx/wYUARDLjmLShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050434; c=relaxed/simple;
	bh=dYdmcxtOT0PL3hJhNzp7IkiVHqpd2RzVPV4jjj8pTeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3VbRwJ2YzIbYf2WNTNeQaxFb+L0TbvQP0+vXpOevZrEhdom5qrNEYN+oqWbzgrmql3UTZoJ24hc0yJE7VZUy2XOd5+X0Zxc78igp+XPxgRTCc3KNj6Xt8mp62YeyurKOzwdiaw1us1q0KRr7wRMlGO0n2y6wFQXLcHHoZjjr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IEiSIk+R; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IEiSIk+R"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac34257295dso740245966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747050430; x=1747655230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVLv+spmoaAvztxddjO2Hy7beQH8ngEJQDm25GE/NA4=;
        b=IEiSIk+Rf3mcZxTAE64R3kaYOYd5GO6QfLZK4n2t7HNi5WZ29o+j5pPIOsa2Ccv33x
         PaAvmQsY3D00klvgaDbbtub/RrHEdXxs8/grIn6BI2YvZDhGwWtEKWa/StgSBj6wg+DO
         jBbrByrVbyL6Tq3BtyYfDoHOac5PxhjvWoT7i6tPzTnFOoDcuP5xAP57SoYeNn9nkI2m
         +eR/yJguHyNH0nAtS+pUK2882HRo/q8Kt0V1bUgayU1cDawzwLzX5c/KNHd0uQ2EeWBb
         uSkmAKpY8+ddw+P+XjzdVMz3Fk/ZmEP005rL4eAW///Hzpv1KbrP2Jf+TRyzxYachl80
         +ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050430; x=1747655230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVLv+spmoaAvztxddjO2Hy7beQH8ngEJQDm25GE/NA4=;
        b=E0OT+Kx3K+PBmZk7CVbRc86NzBRsf7DQJe07EcfCtXd8kDJmQeGjOi3poZ7H4khOfa
         bCCOfsMvW6AuQK5c53NlcSdZ6SOmh0J2TEJtocfb2I8id7JsTxy1X/AwcHzgJUFJfJNy
         QXOfXyP8d5BK///85Mw1qf03BRVi3sCs1VUD4FQXZXF6VmXOKIIgW4pWqYEWq+UxXqlR
         8M5xSWnuFfQoasx0u+0BUuKghmS4LyIY48PQ/1PXQLlqi0rv8UtDewV4QRgcqg0gbEtf
         63bCyvkY/diP5nuRBlHwTfnxbKzBmtOLFh48Fwp5xeWtGdbGpTmKyWRvUQ+7CX5w2OwN
         tHzg==
X-Forwarded-Encrypted: i=1; AJvYcCUKsFNG1x2FJ4xQu0XrYoo6Utk6nDaN0dEOjTKthHX6KVTN/PP+JH7/RMxs8Y7QxROlVdnS/GVj77Kp8UE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YMeW8RswP0PzKk4e6U3I6Gwp0QtEueSUvxCM1D6hTeTops0p
	G48W8h2Cwpr+gEUIVqnGu0xZ1kzWDgkfr54vgP8EXOp3OsodjUlTJuf5VCHSy/Y=
X-Gm-Gg: ASbGnct87fWn2QR46mNj5CN59VFZXnZZpzMGDxaKlxL+U77/Y+0XqjJaQY5SzkDigwP
	TGXcGrfod+dcl5souxPdJJ2Ml0Lv0UboKm0S+bcu3HLKAhZkQrYkYZEUhLx3HX/unLwHRxsyZE1
	JoCfxY8jmbW62KKTnjuAgfv8cmcBCXnXBwIik4P9Qxc63vRdoQ5WPfJbHWthvgaVGjnf8m5sOvi
	RdI1HAJK9KwnewAF6JJZoUE4lr0nEymqOGnKO0uB8wpFyyiYT/NS6gfmwPD+lEKxueidJ8fms1B
	BRl2yYevc6IenG8bxMeaVsj0QEgyQ3pBhVk3nt9Fjzmls1tw9N2J88tu2K2PoMYs
X-Google-Smtp-Source: AGHT+IE1VbmKMbNr2uygysNhb2Q2CrLOamNkk+qyab09zQFyHUhGx9xJDRQHSPfoK5VaWJdnc5BVDg==
X-Received: by 2002:a17:907:7ea0:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ad219057ff1mr1315018666b.36.1747050430347;
        Mon, 12 May 2025 04:47:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219346b85sm601439466b.49.2025.05.12.04.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:47:10 -0700 (PDT)
Date: Mon, 12 May 2025 13:47:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: john.ogness@linutronix.de, Jason@zx2c4.com, gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkp@intel.com, oe-lkp@lists.linux.dev, oliver.sang@intel.com
Subject: Re: [PATCH] rslib: Add scheduling points during the test
Message-ID: <aCHfvBOY0vQ58uaC@pathway.suse.cz>
References: <20250510013515.69636-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510013515.69636-1-ryotkkr98@gmail.com>

On Sat 2025-05-10 10:35:15, Ryo Takakura wrote:
> The test has been prone to softlockup but stayed unnoticed because
> of the printk calls during the test resets the soflockup watchdog by
> calling touch_nmi_watchdog(). With the commit b63e6f60eab4 ("serial:
> 8250: Switch to nbcon console"), the printk calls no longer suppress
> the softlockup and warnings can be observed more evidently that shows
> the test needs more scheduling points.
> 
> Provide scheduling points by adding cond_resched() for each test
> iteration on their up to/beyond error correction capacity.
> 

We should add here:

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202501221029.fb0d574d-lkp@intel.com

> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>

Otherwise, it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks a lot for nailing it down.

Best Regards,
Petr
