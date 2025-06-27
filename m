Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A0629DB6C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024466; cv=none; b=aKBJQRHaOI4qZtSN23giXKtDnLnyO/llilTWDEwuGWIOZPNlOLiBx0C7hNzWb8HUvfau9U8jVCSFhVfEICaJNdNDGvZYqFQiKqMXhmH/tAoUxmRKr4g7AH1zDjkDXlY7t9Yxs4/7FK6DPSLcIqkX6r9FC33EXoo2gNrLHI9Ju2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024466; c=relaxed/simple;
	bh=fl5PplXrSvYrXkPFIRlB9i9CTn2b94Avf8dhkd9p2/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9srk8pRmqaIZdAbnYd2Nrj0Vhus+pXh9TXjN7dMBsU2sZK54hZbyOuxBLRXRunpQYdEg3c8vddm1GA+BGXOT0pQdY+lFJR1f+hOVFfndWfxR8E7hsOW8J5qBgKvpre2eIplfdDL1gmlJ1vp5xBkZL2LP1BV3VKJaf68rWd9pJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=XVWWW7bp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="XVWWW7bp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so19542685e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1751024462; x=1751629262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+f+ZsWg0Gmymqmi+4OUAMPiH1U0HhSSc/DH6fljnhAA=;
        b=XVWWW7bpjPDN6QmmxJ7yYPSNzM48auOVrB7VVVW5aGKKztGXzPSIsmpujzQqAx55ub
         pDESo3Rd1WiAUjiQ+Ou7mzSQDHiF5bFvvuaFp3C8gi/27WQYMrUZE1b/bWKcyE2k8LkD
         O6qCzokuO657/7WX5fndeuppYP52dgME+gG1n/cbncqPOZJ8drb7YdcjfKopBhSTxQwJ
         SMA5rQ9EOhFu6q/zHKqGdsWcSjUUsk/mxvj/XdQ3MDuO+Dqw91bucvtdKZePCgfbUjFt
         0YGzytUtOyeDGxZpJAfrIiGWuLunnH1rVaY4CkKXFcV2FDwYxGfqtTxYtg9u5ff/nNlX
         +ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024462; x=1751629262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f+ZsWg0Gmymqmi+4OUAMPiH1U0HhSSc/DH6fljnhAA=;
        b=Bu2hVgAJ5HvTQPkqAIaZS+J/Y160xZfqRgtwbVk+yc9yjjsVKhUwsyX4PJSn2YFJrq
         z7Uy64JAMTfA7hZ3o/G78jzRsJncuYSaJcqRDHzLxwoCm4GsdEg1JTSR1MHxn8ThYcqC
         mfyFIqyqpuW0hV3UUJ2zhonQRT3c1IrquRvM8JpU1uFrsYW6aS/VcKGlYdFlGD46ylCs
         MOGU9FMnS4isTZYw9mpGAbQcQSKvpVv3P86O5kvB4wqmhcDF4c/zOxPElJApoDEhe4nC
         qRT8yKYxHM3nxlOxFz3SiZScJnZv9wf1qsyI+/5cgY6CYIzXFE3LRevSb1llM4W0Yj/b
         NLSw==
X-Forwarded-Encrypted: i=1; AJvYcCWjZK5ujzc2GbsZmx6e0v8Mlapa1klkoZaKzHq9QBGbhrt4mSDaP5MOKiG8CX4Kt6qJ2LfOYn60vnDT5Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGHAtSSkeMP6ThfQYTm37J0Xyqx8te+eObqF5Nk1ZRx1H4eAMZ
	9hJkmTcz2PI0zWgDGILSaDNmsJ3v3e3qtwdJ36/7+vSsTv4mDqhHvMcBrRoHqcmTxg==
X-Gm-Gg: ASbGncsO6sWdeKFahDbCkB7VrA6vs1QQi8uSkhhXK0I5IXCwgcUWzAVcSryFvrX9yYc
	D3nbFTzaBBd/sor9AX/p/nkgLlvdYYpMJrTwNGZcb2acZN3KqsgAzWwyOtYHGONy21jzJvgxunA
	OtlMyVV3dSaoMxpcQ7rlMnGc3RS64nps60zhb2Mmv8uDZnbbVsdIkJzqCE61hcWvu3KU44Peqo8
	lcT9cqfly+EEpVenTmlUWFyRpjesVzEzBoC90yl38uTalSwwkLl07uoHPYJPmSEeVHvpgA/P3/C
	gq9QRz/Vbc9jfmeMr7tW7n2F+zbcQ2g0JDh7d+qVuwss+DUodvQLKNjf45CYyjrwq5d+MxajBHl
	hahYxkpKmXge6cTVptZWFoOI7IWNXZG33KqdnCloP5A==
X-Google-Smtp-Source: AGHT+IE5U0WFB3xmAQyJW31NBkdohL+E1I8yjzg0yul66CSK8NPf4uCADLUurvYUtJNKZDRdAmrH0g==
X-Received: by 2002:a05:600c:a40e:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-4538f8836bcmr21511545e9.30.1751024461841;
        Fri, 27 Jun 2025 04:41:01 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d3fsm49139535e9.1.2025.06.27.04.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:41:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:40:29 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF6DLQfKq-bpEmnr@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
 <aF0x-d-uBbMQxrxO@cyber-t14sg4>
 <aF4GsTGNSHQKn7Ms@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF4GsTGNSHQKn7Ms@google.com>

On Fri, Jun 27, 2025 at 02:49:21AM +0000, Tzung-Bi Shih wrote:
> On Thu, Jun 26, 2025 at 01:41:45PM +0200, Michal Gorlas wrote:
> > On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> > > > > +
> > > > > +	/*
> > > > > +	 * Gives SMI some time in case it takes longer than expected.
> > > > > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > > > > +	 */
> > > > > +	mdelay(100);
> > > > 
> > > > This looks weird. Are there some ways for Linux to be aware of the SMI has
> > > > completed?
> > > 
> > > Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
> > > [1] before and after sending an SMI, and wait till it increments. I am
> > > not aware about any unified way that works for AMD SoCs. However, so far
> > > none of the AMD boards supported by coreboot was tested with MM payload,
> > > so to make it Intel-only in v3 is not a bad idea.
> > > 
> > > [1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880
> > 
> > As a follow-up here, making COREBOOT_PAYLOAD_MM dependent on !SMP
> > resolves the need of acknowledging SMI completion. If SMI takes longer,
> > Linux is just stalled until SMI handler gives the CPU back to the caller.
> > I think for this case it could be the way, LinuxBoot is by default
> > compiled without SMP support anyways when used as coreboot's payload [1],
> > [2].
> > 
> > [1]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/x86_64/defconfig
> > [2]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/i386/defconfig
> 
> To make sure I understand: do you mean the trigger_smi() becomes a blocking
> call without a timeout?

Short answer: potentially yes. Longer answer:

 "mov	%[apmc_port], %%dx\n\t"
 "outb	%%al, %%dx\n\t"

in trigger_smi() will switch CPU context to SMM, meaning, current state
is saved and CPU starts executing whatever instructions are under the
address stored under SMBASE register. At this point, Linux has no control
over that CPU, which can cause chaos, particulary on real hardware.
I am not an expert on how the scheduler is implemented, but I can imagine
it will assign next not-blocked CPU to execute the instructions coming
after trigger_smi(), while SMI is still being handled on other CPU.

> 
> I may misunderstand: depends on !SMP which also means it can't use on most
> modern architectures.

Not necessarily. This driver is useful only if Linux is used to be
coreboot payload (aka LinuxBoot). As far as I know there is no real need
to have SMP enabled there, sole responsibility of the LinuxBoot is to
bring-up remaining hardware (similar to Driver Execution Environment (DXE)
responsibilities when booting with UEFI), and kexec to the OS kernel,
which is likely built with SMP.
