Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5411DFFD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225324; cv=none; b=jQuMf0UHELR+R1htdAb8YXrDu4a9OOYI8UC41t2BzIvAM/l+td4wDZpH9L1xcaVsFMtu862oaJs3Ta9bOFcstC73vDEBM6f9IexneclBgVWsfMpmOX0eFu2o7zh9utrPmQf1XI7BkRUBBmjw4YAnQenwwPqGCnMHgOKHzWQJ0gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225324; c=relaxed/simple;
	bh=8fiUgzEDAb/CPt2ThFku6rRgGJ1bHR98JE7uXO5Swkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLUxZiGrphrE0WCw2AgiH5ZsODzwg4GN/2hwd5d5zh21L2r8YHEClNSXhex/5pDxwsQTdGnrJdRNKPuUILxmAlPy1LHk0NUtfKAf1oTGgLrQ5vXRJ7txCaaxxwxzew0TRHJ3Gqf4s7cJ92/iN5IQSegn9wDkA/ir1ASMIumQlOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FlgFutvz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FlgFutvz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a823036so632665e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744225321; x=1744830121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ROf/FyXlvK5lJYdCngxjxqdwGQ6incPFtb/OHbqnriY=;
        b=FlgFutvzgQss5o8R3pM4FGbLJbUZpuFbDFDCIgyfCR3MjN14g4P3jr1ZUXNJBw00zq
         pwB6vP7Qd8ivFe+kHFOKphDBt9tx08AXpBdlll/9Lj2OO/wSTNVlJakQrZpFq/as3vWe
         ZFdN4rboYHoG1UVnbphw+L1mEh+qr4Dh3ze0GynXjtg3v+hxXpuR26QwUSYanfdta4Fo
         UgZu8CN5WVXKAkG89cysLyob5D9SUPzQl0A3tZ+GneXd8pnpwIgTlUdFuQlBo/b+YH2U
         fd2C104Cf+MBI9h9gxNWQA8f2HOR94zHUaXZPE9mp+d3YEuWNS9RB5jZIvLT5IOGGGdN
         Mz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225321; x=1744830121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROf/FyXlvK5lJYdCngxjxqdwGQ6incPFtb/OHbqnriY=;
        b=Kffm1+hMMYQl/o5VlSQEYSS/sW5uOfhcbRcjt8WNTKGZ0m9Y394AgMu0wke2y9bdgZ
         LgyzFd6/WQ7B5LAxVwMg1FMc6c6b5OjhOpiNmWE1BvzY/IZwGX8kTPHiF0RK65aivU1C
         PfFz5GEF/I3VgHQIr/zz502Xm39g9qcjptKgRvKhJg3NilP8mU6VrtH9oqjRIS+IO1hB
         Ad1RF4q1AAGM62ijTPYPKGisdascCO/X2+R3C85N7FFYSfMNCxGQS8aY5TvPOh6JKi9u
         qOR6qsqWIKrm92Ua3d2zBa+17PyESnbloXQQiJIhv3kpcVkxST3IkOvQXmrKyEHJU+GR
         o/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn8uqidaJ5gGaVM7sJe56b6nRvaZC6mI9q1KeUlILOjQ5Kx7G9SUpND9+Zib3aL/lD+W+wZKlxEVvboGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweN1Zcl03xeF7c4fuBdqMVVJYYxwSuauAA0afO6hNkuG89lP2s
	IpydQfXcGECNUp94g5Fs7J5rJUUGLXNMPl4kDaHtFdw4TRsPZC7MkrHLZ3NNURM=
X-Gm-Gg: ASbGnct6NmOyczpHOzci2Y2EY1FVKb6Q7WJW4ELSTJSvld1Jxhz+YMs9vo9i8Hs5C+2
	mkHR7uGN7FNTh2k2cmzvnRy/F7S++4uzjFdrL8gXbH0NwXDdJft6DH+TFiGR/Wda4qDsDCuOJmM
	HEyonayANlx9bMnQjGIBOc6Koqj/0eBns+mlnbVe7xZ/7GVmqkXZOaHWlEkCRX4ksMQ+W+pd4O1
	twM61Vaf/98YRyJPJFvL1ZNVkm7AeCDVOzci2H5VOXdzW0g+SHn+v/PU3S2bZh/D1k5p681nUNm
	mcWh5FD1uQv3wZnk9geVvL3gYj654tSmbZ2vd+VP5wb2bU1aN/L/
X-Google-Smtp-Source: AGHT+IEyIRkiTwSNNIAg2oHYPBzs0rkTcPyCv7biIBEY7Pp3zAUiU75B5HFIdfXkzJnkiyq2+BVokg==
X-Received: by 2002:a05:600c:3b16:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43f2d7b4f1cmr1323835e9.9.1744225321022;
        Wed, 09 Apr 2025 12:02:01 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d36f:db1a:e26c:8aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89361165sm2471277f8f.19.2025.04.09.12.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:02:00 -0700 (PDT)
Date: Wed, 9 Apr 2025 21:01:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Sam Day <me@samcday.com>
Subject: Re: [PATCH] serial: msm: Configure correct working mode before
 starting earlycon
Message-ID: <Z_bEJGwFIlPdBtAy@linaro.org>
References: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
 <ac130f09d89b8efea8e0d24f1465c42f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac130f09d89b8efea8e0d24f1465c42f@kernel.org>

On Wed, Apr 09, 2025 at 11:11:00AM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2025-04-08 10:22:47)
> > diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> > index 1b137e06844425584afe5d3f647e9537c6e2d658..3449945493ceb42369d2acafca925350fccc4f82 100644
> > --- a/drivers/tty/serial/msm_serial.c
> > +++ b/drivers/tty/serial/msm_serial.c
> > @@ -1746,6 +1746,12 @@ msm_serial_early_console_setup_dm(struct earlycon_device *device,
> >         if (!device->port.membase)
> >                 return -ENODEV;
> >  
> > +       /* Disable DM / single-character modes */
> > +       msm_write(&device->port, 0, UARTDM_DMEN);
> > +       msm_write(&device->port, MSM_UART_CR_CMD_RESET_RX, MSM_UART_CR);
> > +       msm_write(&device->port, MSM_UART_CR_CMD_RESET_TX, MSM_UART_CR);
> > +       msm_write(&device->port, MSM_UART_CR_TX_ENABLE, MSM_UART_CR);
> 
> In msm_complete_tx_dma() these are under an if condition checking the
> version of uartdm. Do we need that here? Although I also see that
> MSM_UART_CR_CMD_RESET_TX is unconditionally written in msm_reset() but
> not MSM_UART_CR_TX_ENABLE so maybe the condition check is wrong or the
> bit doesn't exist in earlier versions of the hardware so it doesn't
> really matter.

msm_reset() is called from msm_set_baud_rate(), and that one does

  msm_write(port, MSM_UART_CR_TX_ENABLE | MSM_UART_CR_RX_ENABLE, MSM_UART_CR);

unconditionally immediately after, so what I'm doing here matches what
the driver anyway does for all the IP versions.

I'm not sure why we have version checks to perform the reset/enable in
*some* code paths only for *some* IP versions. All of this feels
obsolete at this point, since "msm_port->is_uartdm > UARTDM_1P3" covers
all SoCs we still support upstream. There are no users of the v1.1 and
v1.2 compatibles upstream, even MSM8660 has v1.3 already. We might as
well drop those conditions at some point.

Even better, we still have code for some super old controller before all
the DM variants (qcom,msm-uart instead of qcom,msm-uart*dm*). No users
of that upstream either. :-)

Thanks,
Stephan
