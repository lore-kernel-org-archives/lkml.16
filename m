Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B692561CE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202205; cv=none; b=Vex4YLIKHd6J53qysPQ9it4W78vJdVMSdWaae4Mil8mGHzu05YRiNIzz64pNM0PAOeJmSjzmIr/5Y+8uAlGNvZEBr6tltNCv/puPKzAzOxlvNOTMEWNJYYhf7ak9DiUyLUPm0WcqhkpLul8hyzZ3zKpr85hrU1278RKyzxWwepk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202205; c=relaxed/simple;
	bh=pCcQnsh8CRxpv5xHp1wrSTOStnKxLEg4YyQW1LbBAlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnIoFACYCKDwcnDfivUgus83yb9O9tyNIky9LDuaGmIzDfVthyEo+wFChHUHRts8m+YfWcYmXgGX+X8cyxbrWZJY60XvTrEt1WUc/cYAn61pWO1QB70zAwb9Go+aotR5oVRjgRuNyWotwqnDrvlAi3Rb0Oh0JtylhcIrvtsVxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1gEqkhQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1gEqkhQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so11284628a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744202201; x=1744807001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QH7veB4JfW1Wles/JBHNgdIkw9ORpNInhsceujqVsTs=;
        b=n1gEqkhQi7XM/04q79n2aM4jKTrzu0XaHTUaarT8ZZArWln5aOd8F1PXqVIei/hYbW
         mB23eTe7Q4+n0HRC7lTKikJR3x8XghGcTsgjqRKRNXTWRb8ob5nf3tIfcpsUFJ4HLal1
         fZ6WMeCsgJePHnRQugr26IrBYBUJ4V5K5vqVYw2JYQ7bvy4V5kw8nj4J/87kFY4eMzlE
         BYRFXiNgLUhvhUt145i+bqsDvfa0ky27fEW9xQ7oQfZA7pRQGXvRk6+qjaHmZNbT/byv
         tJuzpEKVZnVdze88aOKSVLj2pmMz/aemn02hw8C/2mtd7muUSnGMNyY5zh4V1kD9CHLh
         QcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202201; x=1744807001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH7veB4JfW1Wles/JBHNgdIkw9ORpNInhsceujqVsTs=;
        b=MD6rSho6gzGGZz2S5+pfMyFQEAwSaz567ZMmEhgVEU4Qy3TZ7tq6ucPI49FQaJWw/X
         g1mOCVj5bVojmF60xL34i90U1StN/TDeptObn6DOPo4nvAUjIJmYiM+cQ4wq+7bhCgEH
         NwmbDIxAM0cfyFQJikQp5jiB+PIPxBsamHqdtVPAT+++Uo4dAGkSnxnMBE/YHwudhs7o
         8lNuMPu7uKjgvSXK1B8KxvlJXZE4bpSqW/XU1v7x6KwyZukH4kK279sbyuRgNqZZlV/Z
         VbT0AN8eb8BRji/f1i6+nhrJeXttJts4haeoIb+uhUoFNFr2WTQynrQSwDQZSqrvozE7
         ylYA==
X-Forwarded-Encrypted: i=1; AJvYcCWn6JgygMhSDHJ+Dw37wMdTTmuJoEFKi84e3iar/3EQtHQyAjvf0O1dLAUTMGFcOsYwTStb5LhMfbwQIJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvbDrCBnevDzhn+BPXWIbmoWL+bzqJc1IdJSXU7cAeJEEeTTE
	xjIrXDaYVv2+eNy9WHvCQtfz4eglDoJWH2PisuUZEZuxGvQ7YKPIOoTeF5bJqv+sGRoj+CUkaUy
	6
X-Gm-Gg: ASbGncvK9rXUHB1hZXd78X8ftlfnxngL1wz6bRei83tcRHNIP883H+/JRfb3SI9fKdP
	3bfNphLb7psut3ju1tPawFT31cQZ/Ffk+rT08CVnpB1pbAl0Fv/i5wTwDDJA/cuYlOX+ayfeD8H
	0aTdGBMCu98mo2Jd3zInTn6gEFquVtUNiOwYYG0zMhxMzNaIWdH2LBxkO1IhwC3ofgw5vsKxzuh
	Q4vpfGSKVmWjDND6LXnhYUSZ/XhbRCHZ53tSO4cBQ1kiYnTBVzOFMH063SWCYhpd90gqhHdp/Gn
	T/EDo9OahfJy0d9QDuYV3oJjizncqLmlRA6gwU/Zxab+3vRs3jA=
X-Google-Smtp-Source: AGHT+IElIPi4StbNu1fXcOUzTMwgB5987RBpnEzg2VNy/DLgYGEJx5pDeTwmq7vbIqpvHrwBZzfZ+w==
X-Received: by 2002:a17:907:1c1a:b0:ac3:9587:f2ac with SMTP id a640c23a62f3a-aca9d644d3bmr191195666b.33.1744202201219;
        Wed, 09 Apr 2025 05:36:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:9738:960c:8c08:7b2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3167sm90726666b.21.2025.04.09.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:36:40 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:36:35 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Sam Day <me@samcday.com>,
	Chandana Kishori Chiluveru <cchiluve@qti.qualcomm.com>
Subject: Re: [PATCH] serial: msm: Configure correct working mode before
 starting earlycon
Message-ID: <Z_Zp0yCXrYM9zG83@linaro.org>
References: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
 <058f8b9c-55db-4735-bf61-b1e0f3d05953@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <058f8b9c-55db-4735-bf61-b1e0f3d05953@quicinc.com>

On Wed, Apr 09, 2025 at 03:30:02PM +0530, Mukesh Kumar Savaliya wrote:
> On 4/8/2025 10:52 PM, Stephan Gerhold wrote:
> > The MSM UART DM controller supports different working modes, e.g. DMA or
> > the "single-character mode", where all reads/writes operate on a single
> > character rather than 4 chars (32-bit) at once. When using earlycon,
> > __msm_console_write() always writes 4 characters at a time, but we don't
> > know which mode the bootloader was using and we don't set the mode either.
> > 
> Looks surprising. I haven't seen pre-kernel UART console ever works in DMA
> mode. It was always fixed to work in FIFO/PIO mode. From what i know.

I'm sure you're right, since it doesn't really make sense to implement
DMA mode for the UART console in earlier firmware or the bootloader.

DMA is just the side note here though. As I wrote in the patch
description, the real problem this patch fixes is the "single-character
mode". This is still FIFO/PIO mode, except that the register will
take/return just a single character rather than 4 chars at once.

This mode is used by firmware on some platforms and I'm planning to make
use of this mode in U-Boot to fix some edge cases. It's much more simple
to implement reliably for something minimal like U-Boot. With that
change in U-Boot, I get the garbled output shown below in the earlycon
serial console. This patch fixes it.

> > This causes garbled output if the bootloader was using the single-character
> > mode, because only every 4th character appears in the serial console, e.g.
> > 
> >    "[ 00oni pi  000xf0[ 00i s 5rm9(l)l s 1  1 SPMTA 7:C 5[ 00A ade k d[
> >     00ano:ameoi .Q1B[ 00ac _idaM00080oo'"
> > 
> > If the bootloader was using the DMA ("DM") mode, output would likely fail
> > entirely. Later, when the full serial driver probes, the port is
> > re-initialized and output works as expected.
> > 
> AFAIR, console UART was always configured in FIFO/PIO mode. For non Console
> application e.g. Bluetooth it works in DMA mode.

I think console UART in msm_serial does use DMA at least for receiving
at the moment, since we don't differentiate between "console" or
"non-console" use case in the upstream driver (as far as I can tell).
My patch doesn't change anything about this though, it just ensures the
UART controller is in the expected mode before starting earlycon.

Thanks,
Stephan
