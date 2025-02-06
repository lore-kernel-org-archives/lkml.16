Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E31DF971
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876838; cv=none; b=runBfeAeNHxcvgOYsdTE0OPHs3ppVY0HmDUqS4mDKb9XayfmyYMBggx6V4mNBTMoUcqVLpF82u8h4qEezZiuekPNQ9ey8x6fJBPhkZ8Yaa7CjWncNAK8xi+jQXggbhcpH3VhCuNh0YzFhCd87n86Q3/6avKYs+FNYI2RPbQALfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876838; c=relaxed/simple;
	bh=p3QuzxvMS3PRvwoFBFXATL/quLa4iaFMLFsFox2F2xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngMUw+/lNo6/VJOrmCYIVG8haEAzOJLGBPpsk/MBy9+I64vXq+dTXLmXY+Qu8mQwFtB4e3J4iJUVvnl43c2FWSot2OSGflQNyUTocb5EdVX28kl0E1PDhVwimkXS3vZ1D9snmO1Ky2OKRdr1ARoLIOfTpPnt49UIxQlZkRMo9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NG7zieQm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NG7zieQm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b9bc648736so131115985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738876835; x=1739481635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fgjl/ufk7pIrpNCmyfe0HAYZeW5k9LrjF++Wh+RnOU=;
        b=NG7zieQm0PeFVbBrMehNn9zPAHpAIT+ceuPOm0eqRY5XxCV+GuI1eGD5/14N/WFExi
         WhNvtenkNKhxKNJFUVKxSK0zTZZHG40bvHb9HLJdpAF6VS2CDRyb05vwkO04UOt4Ea7J
         mY1kpUxWNgdj3YlT/dSWeMS6AZ4c/y8q1kzwSYqiNu6F7DB5qjeeN8Frr/Sc4X9PLCzP
         /qtkMhkaX1w+b/rhs8h3Yj54icIk3x/ZHPVpeB9h5xdK0DgwzVILNhswkQGJdG6gX1dd
         i/6bVpmg+rCM+P0kVckZIDBzeeMbnnoEW7Ku7rYz9ZscoMSbhIF1OVvgUfmWMWQDHh1q
         e7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738876835; x=1739481635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fgjl/ufk7pIrpNCmyfe0HAYZeW5k9LrjF++Wh+RnOU=;
        b=FCpe3UdkT5M6Dzoz+6SsyQ7xG//kgdU1HsfLDmCei0xOVfeQ+cwKGjAsm9W23hAUS0
         4P2wa7fOlX0vXPXaE5opC3r3pN3qyl0j/4Si9/DRff8eLmwbKKbQHbVXTG8zVUVksjWP
         tcCmqLJLpOVU6cwAoUELtt+8JZ7FUhwmLXqdVfTNUtmBh+RvxUZ4jUROZEQinbvXELit
         pV9Nfca6dXdLzAR8OMaRY1+KDkJ3+/Ia892E5PW/Lw60xpUqlCoW433P2birxvAkk17x
         7KCv6ZfGKJAHu7Mka46tDAcxgQikbyIQan60I1rl7Z3QqK0YBIkrLnduLybXJKtoZ7RL
         33Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVgxp0klXEMnPDAYmIQAtfxNloSm10Pw6dxGH8bFRj/r6LUSRhl3/ZD1ciQE/ZeTYuSH93iFpRDgaNLGKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwARI26kms6PO9w3I6hfVq+1ypE4EJz2T4w7TVgjckqp2L7g2
	2lsmYdOYP1loAqcGTdPWopqQ+MM2Iz2ZAltjkqGmiz7XJ60WbfHIKjJuUihNNg==
X-Gm-Gg: ASbGnctbPEE7kZynkegecODe0Lnu2wYTzdT5UaKaZ+HvXI8hHWu7gg2QQzI+ztMKM+x
	Yb09gS1wney114Sw287zM5pENF4KfB0SjO3y/WT324KNNNNZGmwDxEA5kfUnth+ftxJlcfjQNAE
	hf+prS3CbZrVbCHwGpK7OdOrnhwUHNiOsGb7OOtRrfWTq4QxSsar9lI9VkesvO27Ak665NkruvB
	0gj3TLaTKV2mbbF9wheI/CyRM6rm4wxe9APwJfEv9qfkwnD+2KpzlDX4uG6Z9jOqLZ4OFfZCNJp
	ROTuOTcTIkCvnpUX
X-Google-Smtp-Source: AGHT+IHJ1O5ipnZCq3M/6yi420P1sh9Yqpq6gvV0pOtyen30uu9oo3nJYgCfnHAyfuHBOylpGSHzvQ==
X-Received: by 2002:a05:620a:2943:b0:7b6:d8aa:7ef9 with SMTP id af79cd13be357-7c047c58385mr126302685a.32.1738876835047;
        Thu, 06 Feb 2025 13:20:35 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9345])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f9bfsm105185885a.74.2025.02.06.13.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:20:34 -0800 (PST)
Date: Thu, 6 Feb 2025 16:20:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mingcong Bai <jeffbai@aosc.io>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH] USB: core: Enable root_hub's remote wakeup for wakeup
 sources
Message-ID: <425bf21b-8aa6-4de0-bbe4-c815b9df51a7@rowland.harvard.edu>
References: <20250131100630.342995-1-chenhuacai@loongson.cn>
 <2f583e59-5322-4cac-aaaf-02163084c32c@rowland.harvard.edu>
 <CAAhV-H7Dt1bEo8qcwfVfcjTOgXSKW71D19k3+418J6CtV3pVsQ@mail.gmail.com>
 <fbe4a6c4-f8ba-4b5b-b20f-9a2598934c42@rowland.harvard.edu>
 <61fecc0b-d5ac-4fcb-aca7-aa84d8219493@rowland.harvard.edu>
 <2a8d65f4-6832-49c5-9d61-f8c0d0552ed4@aosc.io>
 <06c81c97-7e5f-412b-b6af-04368dd644c9@rowland.harvard.edu>
 <6838de5f-2984-4722-9ee5-c4c62d13911b@aosc.io>
 <6363c5ba-c576-42a8-8a09-31d55768618c@rowland.harvard.edu>
 <9f363d74-24ce-43fe-b0e3-7aef5000abb3@aosc.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f363d74-24ce-43fe-b0e3-7aef5000abb3@aosc.io>

On Thu, Feb 06, 2025 at 11:49:49AM +0800, Mingcong Bai wrote:
> On both unpatched and patched kernels, I have set power/control to "auto"
> for both the root hub and the external hub and left the keyboard for 60
> seconds. Regardless if I plug the keyboard into the chassis or the external
> hub, the keyboard continues to work from the first key strike (no delay or
> lost input).

It's not necessary to wait 60 seconds; 10 seconds would be enough.

For the case where the keyboard is plugged into the hub, it would be
best if you removed the r8152 device (network or wifi, I guess).
Leaving it plugged in will prevent the external hub from going into
runtime suspend unless the network interface is turned off.

You can check whether these devices have gone into runtime suspend by
looking at the contents of the .../power/runtime_status attribute
file.  There are a couple of ways you can do this without disturbing the
keyboard's status, such as by using ssh or by doing something like:

	sleep 10 ; cat .../power/runtime_status

Or if you want to see the status of all your USB devices,

	sleep 10 ; grep . /sys/bus/usb/devices/*/power/runtime_status

> > This means there's something different between the way the keyboard
> > sends its wakeup signal and the way the Genesys Logic hub sends its
> > wakeup signal.
> > 
> > Can you post the output from "lsusb -t" for this system?
> 
> Keyboard plugged into the chassis:
> 
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
>     |__ Port 001: Dev 002, If 0, Class=Human Interface Device,
> Driver=usbhid, 1.5M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/6p, 480M
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/6p, 480M
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> 
> Keyboard plugged into the hub:
> 
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/6p, 480M
>     |__ Port 001: Dev 003, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 001: Dev 004, If 0, Class=Vendor Specific Class,
> Driver=r8152, 480M
>         |__ Port 004: Dev 005, If 0, Class=Human Interface Device,
> Driver=usbhid, 1.5M

Ah, okay, there's an important difference.  The hub connects to an EHCI
controller whereas the keyboard by itself connects to UHCI.

Also the output from "grep . /sys/bus/usb/devices/*/serial"?

And the contents of /sys/kernel/debug/usb/uhci/0000:00:1d.0?

> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/6p, 480M
> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> /:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=uhci_hcd/2p, 12M
> 
> > 
> > Also, can you enable dynamic debugging for usbcore by doing:
> > 
> > 	echo module usbcore =p >/sys/kernel/debug/dynamic_debug/control
> > 
> > and then post the dmesg log for a suspend/resume cycle?
> 
> Keyboard plugged into the chassis (does not wake up via the external
> keyboard, needed to strike Fn on the internal keyboard):

These logs are pretty much what I would expect, except for one thing:

> [  363.682633] ehci-pci 0000:00:1d.7: wakeup: 1
> [  363.682714] uhci_hcd 0000:00:1d.2: wakeup: 1
> [  363.682719] uhci_hcd 0000:00:1d.2: --> PCI D0
> [  363.682757] uhci_hcd 0000:00:1d.1: wakeup: 1
> [  363.682760] uhci_hcd 0000:00:1d.1: --> PCI D0
> [  363.682796] uhci_hcd 0000:00:1d.0: wakeup: 1
> [  363.682849] uhci_hcd 0000:00:1d.0: --> PCI D2
> [  363.683087] ehci-pci 0000:00:1a.7: wakeup: 1
> [  363.683153] uhci_hcd 0000:00:1a.2: wakeup: 1
> [  363.683215] uhci_hcd 0000:00:1a.2: --> PCI D2
> [  363.683254] uhci_hcd 0000:00:1a.1: wakeup: 1
> [  363.683257] uhci_hcd 0000:00:1a.1: --> PCI D0
> [  363.683293] uhci_hcd 0000:00:1a.0: wakeup: 1
> [  363.683338] uhci_hcd 0000:00:1a.0: --> PCI D2
> [  363.694561] ehci-pci 0000:00:1a.7: --> PCI D3hot
> [  363.694597] ehci-pci 0000:00:1d.7: --> PCI D3hot

Why do the 1d.1, 1d.2, and 1a.1 UHCI controllers remain in D0 during
suspend, whereas the 1d.0, 1a.0, and 1a.2 controllers get put in D2?
That's odd.

Can you send the output from "lspci -vv -s 1d.0" and "lspci -vv -s 1d.1",
running as root?  It may explain this behavior.

Reading through the source code, I found a comment in the UHCI driver
(drivers/usb/host/uhci-hcd.c, line 328) which is highly relevant:

	/*
	 * UHCI doesn't distinguish between wakeup requests from downstream
	 * devices and local connect/disconnect events.  There's no way to
	 * enable one without the other; both are controlled by EGSM. Thus
	 * if wakeups are disallowed then EGSM must be turned off -- in which
	 * case remote wakeup requests from downstream during system sleep
	 * will be lost.
	 * ...

Most likely this explains what you are seeing.  In particular, it
explains why the keyboard (when plugged directly into the computer)
can't wake up the system unless wakeup is enabled on the root hub.  It
even explains why wakeup from runtime suspend works, because wakeup is
always enabled on all USB devices during runtime suspend regardless
of the setting in .../power/wakeup.

(UHCI was the first USB host controller technology to be developed;
the spec is from 1996.  It is very primitive compared to later
controllers, in many ways.  Perhaps it shouldn't be surprising that
UHCI controllers can't do all that we want them to.)

Alan Stern
