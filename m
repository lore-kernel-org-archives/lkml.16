Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8A20311;
	Sat,  5 Apr 2025 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743846572; cv=none; b=Z2Iy9+GqwHaTd6ETEKMQUBfCgfJ2Ui6WtEKwPSbC8Wgto2CyAGbXIrOyn+m4yEqYMLRbdw4q8zxGJl4yiNU4Xy5uzBeK5N8ktD2IobWVMWWEh2GffHdcgF3rPFsiNK45cX5JOActReK7I4w7IMRCNvn1OYTvaiJhJTChKFg388A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743846572; c=relaxed/simple;
	bh=YePnyT9QUdD2q2CtBUn2fBF926m7nqM6jMZPAlJ0zrM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GOJa9oGGJ1OSAPFcc2n7S9thUy9aHI2NtrgMO2lIWhhGoUmJ9kqbRbg/yBzRrX9wsII/uVFl2PGaTCyWgQJeXNIDNTtfbM2mHql7l2VuND7g1s6Y9RhwSk7ldN0CULY/I/+1sE7OSYrXFIFrKFRLSNMgHF9kmGdbFF0WzYVjl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV/U2uuS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV/U2uuS"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso28273561fa.3;
        Sat, 05 Apr 2025 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743846569; x=1744451369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7AimxU+oKOgWYx/OE9KFwGFdBLZbbxWXRS4QeoFcc4=;
        b=PV/U2uuSrrusnRDakpQ2UXwawOUMbRyBlIsEHScbIOadu55xa2F3lf3hZJ82fByvNS
         16unIxgb1SveUss6Togcifnq+AVE1dhDyv5SKIEgODv9kRMEIlUa7g43JDahQg+Mcv4h
         gDsM/OIpCZc5kgw6DCzBBISjDmO47cE2iKFeh3azo67VGNRVe7VHz0kOWbpOM1rgU9Iu
         Ng2HQdgpWO5RsxWwXiYQiANO1Np25/01XOrgQyqcP97GryaEcHEUs+F/ETh5nWyb5Dq8
         XlURAazO4AGxtea9h6ei60lcIar0i0AEGuZ9NKWJcTRDkQzszbyPpCxJPDN+cSnqjfrq
         K40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743846569; x=1744451369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7AimxU+oKOgWYx/OE9KFwGFdBLZbbxWXRS4QeoFcc4=;
        b=Y7g2r7fKoeF8UVoCCq3JxprxlPiZVoS1FsaUJz/+rQWu23RfCgctTaxeVhesa776PM
         EcPK0a8nsA88pgCuVORjbZsGsQIjfYLfH5oUHUZVA7bcq4nAgSisP/rsK1JrDTGsNTqB
         3+h+U+tPpK7PU0YMXYdhEjnNZUvbn3f4aEzwoWDBGbJlVIJJFB0gUYppGl7td7SitV+q
         pp21CZeXbWq6cDnRg3j27tL5rlgIgx3JIHj+pQEQsCRelAgyPJjPXvjQKTiqqE++Ax+f
         ZdKTWAvGjQmSMxH1snwKU73M6npuZKTDsosBPpajdOsl5qA8JYGInjmgW6aqs1xauahm
         REqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9AxgM2zgrUS7DupMHrzcpZEPpvYeZsBbu25H6YuLbJ72Pv4OYtQVkzXvI4zKw9f4vxlvXf6zm6KpfEgA=@vger.kernel.org, AJvYcCUOkztLHYs1qo+T1RfypO+GJQEQWMbXmBmuUuqm8DrodZ15FI2uyhzU0B/NSQ25ywCceLpgvgoa0nH9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qC+S1yepQkIvYtDA98IQny1OtR5XnrbSDCoHLiiNbW941yEt
	VQcrCPDCSmH+Ea6iR2jYeuwAATBac25UIK2la6e0e42MLJryqX23/GvV0A==
X-Gm-Gg: ASbGnctlNtEH9qx5xLNDCpK8NN8/x2iSEI1Otx92xaBbxzkvrUBzgMXhTtGFfDHPmhJ
	0jiWTlWELKelHESZzvOi30bbDxZjR6KfchJXFfK6JnSWgvrnL4hMZCKiG/dnC6n1Ghdn0Qcrosj
	mxJZDvZOhbHrnHHvKU190WOuhiSY46B7by5pkGvK7MnjjdNA4CMoAXj9gePhzu1gae0TUhW3poR
	DDKP3ucmKRkIJnX5/NUbjGz5Pb+0YSLZxnxbPv/qr44vXg3m8LKpYQf7hzlXXH+zlSBP/5+s0NP
	+vI3/YhOXIwqs9s1UnGo0kuz25RLphXN+F/M8MAdzd38OMKDFZRTD6p0DWB/24+MsrI+bim0
X-Google-Smtp-Source: AGHT+IG0WDHucp12BYOMINtWrCdlBwo0XWtVO26gpcwfa/dw269DNT+i/mN9O5M1D3nHF+W3qsApUQ==
X-Received: by 2002:a05:651c:1602:b0:30b:f924:3554 with SMTP id 38308e7fff4ca-30f0a131924mr21968031fa.21.1743846568727;
        Sat, 05 Apr 2025 02:49:28 -0700 (PDT)
Received: from foxbook (adtu253.neoplus.adsl.tpnet.pl. [79.185.232.253])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031263b3sm8324551fa.22.2025.04.05.02.49.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Apr 2025 02:49:28 -0700 (PDT)
Date: Sat, 5 Apr 2025 11:49:24 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250405114924.7aa7f3a1@foxbook>
In-Reply-To: <7ec5ba1d-1de7-409d-882c-2efab4922ed4@molgen.mpg.de>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<20250405084307.4080edf4@foxbook>
	<7ec5ba1d-1de7-409d-882c-2efab4922ed4@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 5 Apr 2025 09:36:03 +0200, Paul Menzel wrote:
> > And the problem appears to be that some USB device gets reset
> > periodically, probably /dev/sda, whatever it is. This reset loop is
> > also visible in your new log today. =20
> I guess it=E2=80=99s the SD/eMMC card slot, which I do not use though.

Yep, I just realized that your dmesg shows it clearly:

[   37.517985] usb 4-1.4: new SuperSpeed USB device number 5 using xhci_hcd
[   37.535773] usb 4-1.4: New USB device found, idVendor=3D058f, idProduct=
=3D8468, bcdDevice=3D 1.00
[   37.535780] usb 4-1.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[   37.535782] usb 4-1.4: Product: Mass Storage Device
[   37.535783] usb 4-1.4: Manufacturer: Generic
[   37.535785] usb 4-1.4: SerialNumber: 058F84688461
[   37.552531] usb-storage 4-1.4:1.0: USB Mass Storage device detected

> > 3. is it reproducible on 6.14, 6.13, ...
>
> As written, from my logs it happened sporadically in the past, but
> since at least commit a2cc6ff5ec8f it happens almost always. I didn=E2=80=
=99t
> see it with commit 08733088b566, and after that I didn=E2=80=99t use any
> USB-C adapters for three days.

To be exact, I'm wondering if the reset loop itself is a regression, or
business as usual. So simply look for this repeating every few seconds:

[   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_h=
cd

Relevant commits in your range are:

0c74d232578b xhci: Avoid queuing redundant Stop Endpoint command for stalle=
d endpoint
860f5d0d3594 xhci: Prevent early endpoint restart when handling STALL error=
s.

Reverting 0c74d232578b will remove the warning, but this means that
860f5d0d3594 isn't having the intended effect. Not sure  if reverting
the latter will solve the reset loop or if it was always there. And
these commits look alright, so IDK what's going wrong.

I could send a debug patch which might clear some things up.

> PS: Hints on how to try to reproduce this in QEMU would be welcome.=20
> (Passing the controller and device to the VM.)

If you need help setting up PCI passthrough, I'm afraid I can't help.
As for reproduction, simply booting a buggy kernel should give those
repeating resets and xHCI warnings if you are lucky.
