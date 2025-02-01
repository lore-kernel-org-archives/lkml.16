Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BE208A9
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738428909; cv=none; b=PDyLTmL0HZU6QqS7ub88X+6blVZ3mdG17k4VNxwqyszjjSxVVUU053G8uWt0mWDhr4O8Jf+URyRW1qDkDi/xbwcOozbvDDICqyE6lUZm91IRHzUpzFEFkARoKSWDoRHj1PWsuospUksujvua9ykYFIRNlBwAjjfIvqxWyuTcH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738428909; c=relaxed/simple;
	bh=DQmCx1UzC+wZmb/DNTjP2+1lGenSItgsdE3BWkM4Ha4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQFpEHIroZfU4a3Ho+qEu4yW4V5PCK8lk+T25Hb9GJhUamFMhE1bxOLczFCKteh10Up/sLSyE/VTM5e+kslGy78p+xYu1v5g92CyVIAbkmdBKnmS8a0Kcn477E11EIbJpfCqnWtwPH/jNX7rCHbcixPP0cnP8Ce0MaEdQHAB8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e0C0ZVk3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e0C0ZVk3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6eeff1fdfso277265285a.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738428907; x=1739033707; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nxUHBFvGj81Oack1s7zBa0JySTAfnkZqGP49lK0Cew=;
        b=e0C0ZVk3WaxfugOokJjSxV81HRu0dc6wtSrSx48IlitK/9w8/XPJsdWWln2Yz/RaR0
         N67wsSv8uG3L1MI0r+wEyGZYJatNzOkA0PGJQmHiZq1XaPLwTYD6GGFkiF0hJWDkVAJc
         ew899cwT7w3/yrMh/N4zQqiiNIF9gcanlxqP3pkOg+X0mSeYWTTifA7hdzOJj44W4MHJ
         J7c+iCp/WzvUcy3RkGlmlLJlTFNqV8VhC/7myhz8UYxndVfoCki4jM14LHEwIg1rbJk5
         MQWSezZUFFtfpGiuEAvomARCSTCIrhTMYeJjoBAYBZ0d+IUw6ly3QyPSWs72tW1gb+EJ
         HfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738428907; x=1739033707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nxUHBFvGj81Oack1s7zBa0JySTAfnkZqGP49lK0Cew=;
        b=aOfTjqoQvHjbbNP7NWjQ8847tubYkesntl6JpVx3GAao3A2sWtANAdWW0xmlgLCv+t
         ibvbZWdmwoGNWHeRj/JAJj3mMZIwARv8e+hwydd7syGgbARYCEvdUD9jaiLajE+DtY82
         zknqJ/aQrs1LmO0MPqDiUNb9rmKKZaoVDd5BsmfKZnHhYKnIQLcdbN6KJMqBk+tWTgJU
         3U2f0evolpdld9uyfHeIe09iyV6XWruoR7tFDK2e3+s5bXCtVOJL+78XkPqxBwizCw5v
         r3H3JYbeqWa0YTOZyQMFzVmgFVLLsrXkElEtTwoszzlryJZRiDXB+1jpAXwy+XwfwXOa
         mD7g==
X-Forwarded-Encrypted: i=1; AJvYcCWGi/OmdiHeeS1tyTwnIhhID42dkEen18sL1cCGI6CfjsdjziymC4JAacH5rn04anyXWFVdv5HJDOpfDWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI32LqhCBBr1iUVefZluVCfG4j4AuUELRexPxNoVv92gQehG7N
	8R0m5FnWl6Z0MaLG1TMc33PwwyPAwvK3V1M74FKgrq9jjbS18mZnmTja/ZHd/g==
X-Gm-Gg: ASbGncuE0Iky9yS6HwhTiS5DM5JuFV1E3OiWcNldI6bTlX5L7Bt+Bio+qg3GcSvc3o3
	NfiTMaQ6ZkBTobxbCRVDCTREFNotZmNi5oxDJ1nor7Tc9gHB89n/JqT9mxScMEzxBn8zw72FeHt
	+Jl8yHD54sariJHixNAqy0GEV7OGmiOmkUAAbgOPypsX3+hgc0bFabG9NnVfZ8LFfqGg96NYLT8
	TB/C+82pDrZa6h5WkmtwH0n/+MPYIQFsR5X618bnVbTGO2jNcCWm+DETHFg43lp6J6tIKWCAazO
	vf1fhpWVOBMM3TgI
X-Google-Smtp-Source: AGHT+IEAmw5GFbOYKfZFPQolGMSY0m/awA0DFxPabq5SO2pH/P9s7vEQcjVulqZpIiIC0bo8IQJdDQ==
X-Received: by 2002:a05:620a:d86:b0:7b6:742d:c01e with SMTP id af79cd13be357-7bffcd06ab7mr2460374285a.25.1738428906791;
        Sat, 01 Feb 2025 08:55:06 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::2aef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a905597sm313250085a.88.2025.02.01.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:55:05 -0800 (PST)
Date: Sat, 1 Feb 2025 11:55:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: core: Enable root_hub's remote wakeup for wakeup
 sources
Message-ID: <fbe4a6c4-f8ba-4b5b-b20f-9a2598934c42@rowland.harvard.edu>
References: <20250131100630.342995-1-chenhuacai@loongson.cn>
 <2f583e59-5322-4cac-aaaf-02163084c32c@rowland.harvard.edu>
 <CAAhV-H7Dt1bEo8qcwfVfcjTOgXSKW71D19k3+418J6CtV3pVsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7Dt1bEo8qcwfVfcjTOgXSKW71D19k3+418J6CtV3pVsQ@mail.gmail.com>

On Sat, Feb 01, 2025 at 02:42:43PM +0800, Huacai Chen wrote:
> Hi, Alan,
> 
> On Fri, Jan 31, 2025 at 11:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, Jan 31, 2025 at 06:06:30PM +0800, Huacai Chen wrote:
> > > Now we only enable the remote wakeup function for the USB wakeup source
> > > itself at usb_port_suspend(). But on pre-XHCI controllers this is not
> > > enough to enable the S3 wakeup function for USB keyboards,
> >
> > Why do you say this?  It was enough on my system with an EHCI/UHCI
> > controller when I wrote that code.  What hardware do you have that isn't
> > working?
> >
> > >  so we also
> > > enable the root_hub's remote wakeup (and disable it on error). Frankly
> > > this is unnecessary for XHCI, but enable it unconditionally make code
> > > simple and seems harmless.
> >
> > This does not make sense.  For hubs (including root hubs), enabling
> > remote wakeup means that the hub will generate a wakeup request when
> > there is a connect, disconnect, or over-current change.  That's not what
> > you want to do, is it?  And it has nothing to do with how the hub
> > handles wakeup requests received from downstream devices.
> >
> > You need to explain what's going on here in much more detail.  What
> > exactly is going wrong, and why?  What is the hardware actually doing,
> > as compared to what we expect it to do?
> OK, let me tell a long story:
> 
> At first, someone reported that on Loongson platform we cannot wake up
> S3 with a USB keyboard, but no problem on x86. At that time we thought
> this was a platform-specific problem.
> 
> After that we have done many experiments, then we found that if the
> keyboard is connected to a XHCI controller, it can wake up, but cannot
> wake up if it is connected to a non-XHCI controller, no matter on x86
> or on Loongson. We are not familiar with USB protocol, this is just
> observed from experiments.
> 
> You are probably right that enabling remote wakeup on a hub means it
> can generate wakeup requests rather than forward downstream devices'
> requests. But from experiments we found that if we enable the "wakeup"
> knob of the root_hub via sysfs, then a keyboard becomes able to wake
> up S3 (for non-XHCI controllers). So we guess that the enablement also
> enables forwarding. So maybe this is an implementation-specific
> problem (but most implementations have problems)?
> 
> This patch itself just emulates the enablement of root_hub's remote
> wakeup automatically (then we needn't operate on sysfs).

I'll run some experiments on my system.  Maybe you're right about the 
problem, but your proposed solution looks wrong.

Alan Stern
