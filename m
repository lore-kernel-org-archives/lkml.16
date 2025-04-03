Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EE24C66C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682496; cv=none; b=RtaStU4dG5dZBJ+UCEWSrpsHxtx3I8putFOU+awNh+UJ8bWxbXCTpW1UlTUxtVWENY5N0CmzHVZRnh6vfgCYpbMPUbJXGUMxc5QB70Sdd9brcXmIhKHgfXPhesL/WF1ypq+VWutROmCvZ9TDvOFgH4/TAz1zGJ24uaSIYN3baGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682496; c=relaxed/simple;
	bh=17mqGQm/yNfgeN6RIVcwBC8KsDfoiZGqSuOV373ZKGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpfJaIsztWeV5RUtGAGJmv0RO9WYAn+gtXrHNadHuS7oaX3LPMwADNv2Ntx17aILdw4yWTQXq3Fo7Vfs6kbnU/fHAg7dc7UCGG7gXd6ilryW5YMHEzx6K4swiTMIwDm131KEDwAmEi8juxEm5H80r5n/QXQsswcoAoGsUHIiwto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac41514a734so140855066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682493; x=1744287293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyLh0Gw8hO7XZCTxtBxxEiqJvR19g3PaG80k0CYf2qM=;
        b=KswdgGhAKkRDxPSbiChrGQv8KwSNVh9xbg/eil/ywtfbIGo4JQk3dZvbxrd8SAUokz
         COsaExM2jgbBP32ccNb1wI07lSIya9cs/FPc+OUTr2GgpHgx8fHBAJatBZw6ZBjs8UH8
         2+AzKL/rhoqJjp3z2N2IOmrIsVbDZ5iAMZCZoRRXmwVMV4XXuLZEm6RVFuyb+MSbmZGB
         m4NrqBJ/JuVvXfC1NfE6q+trJy979mt+ktCa9N18dMfXiUEboRthZLBh+u4nakb1djPh
         v3Gjb3gdA5+4mQp47xcdbRuYuWtivjQQQqQyZdTxhEKiDg05nmgjkASdCzQtXHd2IPxT
         WGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI2/XAJrJLTybSD0Hbvp4eK0aBbAC4TSzuW5QRnCUqG4IjJtpczvI1u9b1DM7vvT6XwgInIJuwHEB3WFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsrDaX2k6iWuaWg197DTzQzMT8jCqN2QNCSogGoE8LXxYNcHB
	DmxGvDWLLb9/YzFksHozhnPKnSzCtD9WWggXGYpZvHGS2cxdgLxY
X-Gm-Gg: ASbGncu/zDrFik8+oE1LgtBoKmCGcw0Mp0WSM3svISAg6UoIr3k1hHZ2Bl9a2wlMrYs
	P+Ur7d/XmpcMNxaJwwjzI7XG51pzvC9WYsw/+tbjbSpbHkPXZInV+CpqdDA5z8hOtqJuzBs4GtB
	9zEmtTjrqUMCSXasgt4rhLmBkIkS5f27DB8upk0TZ382TE6BUtIrypKDw1nBSpbSxkf9Av7A2+o
	Uys3iWGc9edTcYGKQ1x4aTM5oaiiaK2WhCjb+SLB5j5u3j5GMOtU0xT3bwxDC5xdSFouBS+zwsN
	OHlPkFWQ0Y2r+HRdtkVKvsYDNXn0OsHwyzA=
X-Google-Smtp-Source: AGHT+IGb8dt34rh+KIwOLHtIb26NZR5dMK4uBVyOfM1ZEWUHXPqAhsjekUaTVScDl4dshP9ViO+J9A==
X-Received: by 2002:a17:906:391b:b0:ac7:cdaa:8946 with SMTP id a640c23a62f3a-ac7cdaa907bmr3700566b.11.1743682492518;
        Thu, 03 Apr 2025 05:14:52 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm85923866b.60.2025.04.03.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:14:51 -0700 (PDT)
Date: Thu, 3 Apr 2025 05:14:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, kernel-team@meta.com,
	vincenzo.frascino@arm.com, anders.roxell@linaro.org,
	ndecarli@meta.com, rmikey@meta.com
Subject: Re: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
Message-ID: <Z+57uXX3u0zeTGeP@gmail.com>
References: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
 <87a58yz0cm.wl-maz@kernel.org>
 <878qoiyzic.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qoiyzic.wl-maz@kernel.org>

Hello Marc,

On Wed, Apr 02, 2025 at 11:22:51PM +0100, Marc Zyngier wrote:
> > > -	arch_counter_enforce_ordering(res);
> > > -
> > > -	return res;
> > > +	return __arch_counter_get_cntvct();
> > 
> > I won't pretend I understand it all, but you really want to have a
> > look at the link just above the arch_counter_enforce_ordering()
> > definition, pasted below for your convenience:
> > 
> > https://lore.kernel.org/r/alpine.DEB.2.21.1902081950260.1662@nanos.tec.linutronix.de/
> > 
> > Dropping this ordering enforcement seems pretty adventurous unless you
> > have very strong guarantees about the context this executes in.
> 
> Ah, I appear to have misread this patch, and
> __arch_counter_get_cntvct() does have the same ordering requirements.

Right, I've originally ensured that this part remained unchanged, with
one notable exception. The __arch_counter_get_cntvct() function does not
mark memory as clobbered, whereas the original code did.

The original code, which is being removed, used the following assembly
construction:

	asm volatile(
	ALTERNATIVE("isb\n mrs %0, cntvct_el0",
			"nop\n" __mrs_s("%0", SYS_CNTVCTSS_EL0),
			ARM64_HAS_ECV)
	: "=r" (res)
	:
	: "memory");

This code explicitly marked memory as clobbered using the "memory"
clobber specifier.
In contrast, the __arch_counter_get_cntvct() uses a similar assembly
instruction, but without the memory clobber specifier:

	asm volatile(
	ALTERNATIVE("isb\n mrs %0, cntvct_el0",
			"nop\n" __mrs_s("%0", SYS_CNTVCTSS_EL0),
			ARM64_HAS_ECV)
	: "=r" (cnt));

From my analysis, I understand that memory clobbering is not necessary
in this case. The assembly instruction only accesses registers and does
not modify memory. The use of explicit memory variable (res/cnt) in the
assembly code ensures that memory is safe.

Other than that, nothing else changes.

> Apologies for the noise.

Since you created *all* this noise regarding instruction ordering, can
I pick your brain in the same topic? :-P

If my machine has Speculation Barrier (sb)[1] support, is it a good
replacement for `isb` ? Do you happen to know?

[1] https://developer.arm.com/documentation/ddi0602/2022-06/Base-Instructions/SB--Speculation-Barrier-

Thanks for your review!
--breno

