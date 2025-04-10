Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F331283CAB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288198; cv=none; b=XAQRpFLuwfsfQplHHOqsEgcijSqCfTVDZ/188t3YVSkURWCeWro3nsYblXf8en425qa24xo0EGOgVmPVpxe79jUIBMjM8BkgpN6hNO/Wobw0PyStFwX3rpuA7rDvYt17Xqfh1+dQr7g5OQ5Gf4krHCdjNzo7HC7j2VXZuYifdaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288198; c=relaxed/simple;
	bh=r8RtWRc3Ys7lb3CPSdWXdXYs7h+Ngv/uXqjlSPDyyMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQxBz2vb74QdUvyGbC9+DztmTBCHElwKYMRoDLzqgHtpjUy1LSq0XtlOA472ZxNv488GvfAQbbkZHHgpICbKChl6l9oCBfgZVsoLFY7xgejWXxNZHrCHMc1VxPYWk9oTBtCB+p0I4k5eTSqnFb/Mb2dZ5q+C3+NBgDN4UjOIrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oa/32uow; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oa/32uow"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso997444a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744288195; x=1744892995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W58zftoxA/h0euOQhznKhUitEEsPpASpF27ovwB6sRg=;
        b=Oa/32uowiqXj8XBX0is2329SdphK9jB39e0NI0w1swXjaktwRBP36+wSrPqRWRF9G3
         QTsZsI6y/Q+BcIIcLFiUPbZuML6K4dj4rfUwR/xqI7x5qyalODUKbT4OoXc2jqNBLJRx
         tN0cg7yUnVRtHhiZ0gsXIVqfy7/7MAYWnSy3DtzW+jog40yfUX3MK177F1oZAy9Ok1RP
         G3Th1wD1YS2Z1BQPfMbjsBedmXQz1B6AkS0Uc+4/rbW5hbHBOq9iR798vDVQ9M+cSrLk
         4csuHq4RNHZF39yT8UsLGq44H3UfD4k7j+id1JorKfTDVWilJwsfpT5pJtF6aKVr3u2y
         VGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288195; x=1744892995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W58zftoxA/h0euOQhznKhUitEEsPpASpF27ovwB6sRg=;
        b=PZmWo1R6+BvnMc6cvTkuJ+6Bcm1LvIAX020juh92ah6UTKgZyJizSeAxBIE0FBQZp4
         HKI5JVurgkbGJjRem1do+qr4/ziUmP2PeOWTRNZ7vQL9bcpCo0S54cUW0PpwMgwn05nw
         fB6ID/1OBj7YMOqDKn9ZY0gwI4tc00/rKhhGWDII8qODEeX8kF+3uTTdutdclcFrevnN
         8UpJ6NvCX7NRi9jQreTN+jnrZSUcs5fNKZ0ICBYIdOdZzCXkwG89SzHs6C4ysWwjvUCN
         lCO90l4IFv/hJwzSf+UMyD4Rv++TzhDl1tybuxnChrcDWamLNCFe4tfcbvOnic2spcXs
         W2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhcl+d54TL9o0Hr3W12/MjgcRQ2G2YJ1VcSJZMmii/VMwbPXBc38psDpxOTgJcUQx4OHkloklq6fwONg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+2yvlqQiQGuFBUQGgsIEOm2MQe2LU34waDPo1Hdl4wV/Hxx9M
	yTcePTP1LWGn3lGA10hLuCVataDF+lTMfEdmxCCy4QxF0rGd/mcmZ16CKHT6GBw=
X-Gm-Gg: ASbGncv8LKf7YxstL4R5u941EKbMQEYdpXCYtwgqNgTq1WLw4a79qK4TFo4xg43cYMj
	zVTIZLfimql/zTKVdwHCxAc2f2zi8VV7JBR+kTVc5nhCz7VpXQII/oW9W0t+AOoLwe6ZBDEuqku
	ODMEwt/yaEhxzbU2j6736Z/elCd2M8U9q7wWB0F9SEr1dgJbFAnWk1kMG+xcPOOv6aWxXg+g2Dc
	Z7M6jImiy0q23IdMteDP8qtcgVlPzpNoCDh/5II6brjGbw7ePzXSpgouwOohM2S+Y4A0ADRV6QL
	G7+bPZseJ11+SQNuq1gaJBkRlRCnaWj4Wx/VGrA0uRc=
X-Google-Smtp-Source: AGHT+IGkRcCdesVQfmGut/2T1Nf41hQW3Xy07xSRue+c6AyThON1gDnGuZ55vBm3LGdN2t2bjeOkNg==
X-Received: by 2002:a05:6402:5194:b0:5e5:4807:5441 with SMTP id 4fb4d7f45d1cf-5f329337b8cmr2248387a12.30.1744288194931;
        Thu, 10 Apr 2025 05:29:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbd17646sm2295348a12.56.2025.04.10.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:29:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:29:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Message-ID: <Z_e5rWcJKUh7eozw@pathway.suse.cz>
References: <20250405145915.493173-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405145915.493173-1-ryotkkr98@gmail.com>

On Sat 2025-04-05 23:59:15, Ryo Takakura wrote:
> Add the necessary callbacks(write_atomic, write_thread, device_lock
> and device_unlock) and CON_NBCON flag to switch the sifive console
> driver to perform as nbcon console.
> 
> Both ->write_atomic() and ->write_thread() will check for console
> ownership whenever they are accessing registers.
> 
> The ->device_lock()/unlock() will provide the additional serilization
> necessary for ->write_thread() which is called from dedicated printing
> thread.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

I do not have the hardware around so I could not test it.
But the code looks good. With the added comment (reported
by the robot):

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
