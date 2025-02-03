Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC332046A3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595548; cv=none; b=i1KmuVYumFafX3800ou5C1W4DQH+RPn7wo/Fqmi4UT1QTJ/SKnPSG5KQCJopIQzlsip7A37eDFCOT600cjWbTzUYN7IiMI77UzBR/VPjdCmDHaTEU3S4tWeVIzvgKjd4JnKRkBWshF0MPg3tUqlXBbD38xSmaiZeHi1MKa6VArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595548; c=relaxed/simple;
	bh=De3tZJ+i6RyFMLShSETS1a0kwp/lElizeBd6vf1Kk1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efwwVNYpNPyGB/dMYSOKTConDzQ7+o7XbL6LR6ZI7ec3wk4Z8cIuh/Ky7FdCpbCD6/DaellJeYLWF/Kj+Mbjza+0N4TQL2T+frWpEHWdGByAmC93Ugfx83srh1o1OBDdn2pyU1fbF8EkEBtYYwyXZMZHpGBPw9T0r7dSd3hKXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Wr+bly4O; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Wr+bly4O"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678cd314b6so42347101cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738595546; x=1739200346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uRjRCoiTmQxPaUbLc8rVKhXS5CF+EA4SHG9IAe/UnA=;
        b=Wr+bly4OQKwdMoHg9Y0qe9L40TIko1GsFSUrkq2tX3li1sVXyzTNUvoF2QRYp1oqYU
         N4yt/UwTmaiSY+6i5iE6ScjQG/r3rkvhRHLnQ8d2yH3sewm8gMtsP86dRLbjnHus+H0/
         qDOq57vh3wFkq2TC0S+Zb6ySrOGUpP1lpNIqFv1bIkBpZeyqvFVfVjnAq/OXtj/8Khjy
         9txacgMhzIoRZDgSoWu/jDv3TI0k8aCJUd8ZdJnXkKk4mYYyx6iW51LBSYYcNYtFrg7F
         GkOOdzxsDnhXenaIrRA3Vt2o/sPyXzNqoq0rvRLtVdCB1TZLv7J1ysGZarggReTvDp6H
         TGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595546; x=1739200346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uRjRCoiTmQxPaUbLc8rVKhXS5CF+EA4SHG9IAe/UnA=;
        b=Hxp8uQtlaQgo2l2h4v/KEEJwJ5DMGk0/0vv6tfOTZbzrbYrUOwxlubQa0zbcV3YPpD
         owTMatFqc9fEmKPUrso5Yhth6Adj0Tcb6Jd5Z2YlSAHozX6d+CxNBVVrGwjQCNHtfT/w
         hE7q2U6aNgJsF+OSYmwSQuQ7f2L3bPf9kVMhfkNUGsO3ACXRTJTIb2DzJJe4AV094RcG
         PVb3of96UhCFiY4nx6tvCmAcyNQXYa9UqtvZIByT0aCulds447J+ei0vuxTznjKYEPDO
         6jn+2cgUaZhYxGRRhLCZCrrxSqCJuqyqWjeFWrOp5TbJ5B9R5jzFZ0tPMBKk19LVl/i9
         QDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfFctqEF+P64FczCqJ1M0VQdidRAKk+rmuhzQ/alv70HrjqWHrL14BvOkh2+J+ZGRiOqT8yaKKBgiSLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsneTwRDYKtXOfCU9okaaCZMCH0jR1dyAL8ZG3jrChxVuMqN1
	zhsXJHKrWxhxWx9fLOWGDZU1rTqrIaGzUVo1GSWK4s2+xRj6XwgQ6njFbFS1yA==
X-Gm-Gg: ASbGncvPHmW9aIxhRVzJfpdxMLewyXxMRaTyLKetgDDxN6Fp9uajD9/qbbtcYSrOyD0
	I/Hia0piP7g15uG36108QKWDQ0+nqI9OlG5BXNXqznDuUah84l79Ztnw/R+OI+bQDvv5qYSYDhr
	H6GuXLKI0mxNVkilers4hpoAmbbL0rqnwDGVqJgDgu+lNaU8n0oBvbbK2EmErTQVjZjMSU7CPNS
	cLWoIdJzgfrD3PniMmDwdFcE7q+qQ+skIXMyT1S9ERfIUKEzcvN6TxeO1DTJr2+Pb/ZJBuEFq6/
	ZY3fZf5zX2zr2NO4+IH5GneFjrELMkZIWw==
X-Google-Smtp-Source: AGHT+IHyUL2x0qBbG+DgG0G3rjDNRAFJ94tx2vEQWzKX0Qbs1ZMr7OqI1ExwtF+LFOaQezc0ZvX8xA==
X-Received: by 2002:a05:622a:13d4:b0:467:57c8:ca31 with SMTP id d75a77b69052e-46fd0ba39dfmr318463241cf.46.1738595545561;
        Mon, 03 Feb 2025 07:12:25 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46ff30fc6fesm33943751cf.27.2025.02.03.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:12:25 -0800 (PST)
Date: Mon, 3 Feb 2025 10:12:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: core: Enable root_hub's remote wakeup for wakeup
 sources
Message-ID: <61fecc0b-d5ac-4fcb-aca7-aa84d8219493@rowland.harvard.edu>
References: <20250131100630.342995-1-chenhuacai@loongson.cn>
 <2f583e59-5322-4cac-aaaf-02163084c32c@rowland.harvard.edu>
 <CAAhV-H7Dt1bEo8qcwfVfcjTOgXSKW71D19k3+418J6CtV3pVsQ@mail.gmail.com>
 <fbe4a6c4-f8ba-4b5b-b20f-9a2598934c42@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbe4a6c4-f8ba-4b5b-b20f-9a2598934c42@rowland.harvard.edu>

On Sat, Feb 01, 2025 at 11:55:03AM -0500, Alan Stern wrote:
> On Sat, Feb 01, 2025 at 02:42:43PM +0800, Huacai Chen wrote:
> > Hi, Alan,
> > 
> > On Fri, Jan 31, 2025 at 11:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, Jan 31, 2025 at 06:06:30PM +0800, Huacai Chen wrote:
> > > > Now we only enable the remote wakeup function for the USB wakeup source
> > > > itself at usb_port_suspend(). But on pre-XHCI controllers this is not
> > > > enough to enable the S3 wakeup function for USB keyboards,
> > >
> > > Why do you say this?  It was enough on my system with an EHCI/UHCI
> > > controller when I wrote that code.  What hardware do you have that isn't
> > > working?
> > >
> > > >  so we also
> > > > enable the root_hub's remote wakeup (and disable it on error). Frankly
> > > > this is unnecessary for XHCI, but enable it unconditionally make code
> > > > simple and seems harmless.
> > >
> > > This does not make sense.  For hubs (including root hubs), enabling
> > > remote wakeup means that the hub will generate a wakeup request when
> > > there is a connect, disconnect, or over-current change.  That's not what
> > > you want to do, is it?  And it has nothing to do with how the hub
> > > handles wakeup requests received from downstream devices.
> > >
> > > You need to explain what's going on here in much more detail.  What
> > > exactly is going wrong, and why?  What is the hardware actually doing,
> > > as compared to what we expect it to do?
> > OK, let me tell a long story:
> > 
> > At first, someone reported that on Loongson platform we cannot wake up
> > S3 with a USB keyboard, but no problem on x86. At that time we thought
> > this was a platform-specific problem.
> > 
> > After that we have done many experiments, then we found that if the
> > keyboard is connected to a XHCI controller, it can wake up, but cannot
> > wake up if it is connected to a non-XHCI controller, no matter on x86
> > or on Loongson. We are not familiar with USB protocol, this is just
> > observed from experiments.
> > 
> > You are probably right that enabling remote wakeup on a hub means it
> > can generate wakeup requests rather than forward downstream devices'
> > requests. But from experiments we found that if we enable the "wakeup"
> > knob of the root_hub via sysfs, then a keyboard becomes able to wake
> > up S3 (for non-XHCI controllers). So we guess that the enablement also
> > enables forwarding. So maybe this is an implementation-specific
> > problem (but most implementations have problems)?
> > 
> > This patch itself just emulates the enablement of root_hub's remote
> > wakeup automatically (then we needn't operate on sysfs).
> 
> I'll run some experiments on my system.  Maybe you're right about the 
> problem, but your proposed solution looks wrong.

I just tried running the experiment on my system.  I enabled wakeup for 
the mouse device, made sure it was disabled for the intermediate hub and 
the root hub, and made sure it was enabled for the host controller.  
(Those last three are the default settings.)  Then I put the system in 
S3 suspend by writing "mem" to /sys/power/state, and when the system was 
asleep I pressed one of the mouse buttons -- and the system woke up.  
This was done under a 6.12.10 kernel, with an EHCI host controller, not 
xHCI.

So it seems like something is wrong with your system in particular, not 
the core USB code in general.  What type of host controller is your 
mouse attached to?  Have you tested whether the mouse is able to wake up 
from runtime suspend, as opposed to S3 suspend?

Alan Stern
