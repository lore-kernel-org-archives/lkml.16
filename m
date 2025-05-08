Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269482066CF;
	Thu,  8 May 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708486; cv=none; b=rx7Rm3rZBI8CmdLkpBNLCciR/8a/es28md8ZPLdrqU7nNgYUb+tJdKQIflAbneF+ZcySxGEZO30WGKDUfmOXQveSTRGAMljEWtFtqZEZgX3ekjEdZQmBblXp5k4PN9qI3hPn4bN9ygBeor7ZIen6Gv0P5UDji+jmZ4AvEoQjy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708486; c=relaxed/simple;
	bh=32CtRKmrPA7nB/+f8XmyUNlfkbdkgk0lazsLdNElUp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVDT7dakbJ8eOFd8NcNWHv9YPoWqTPc8i+Z5gTgOui8aa0gaBJs0htZToXb6JONCJ1vOqTyQsATwXIU2eWiBIdZ11vQFS+WIknBD3ai5vTCea25gOl83ZXGP2ExXUwvXcn0VONjnc+/pd6/aIp3IP4Cs/u+xb67npaXJwT6f8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=0Gy0hFUn; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=j9Rxn0Nn; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="0Gy0hFUn";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="j9Rxn0Nn"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 157CF12FB439;
	Thu, 08 May 2025 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746708483; bh=32CtRKmrPA7nB/+f8XmyUNlfkbdkgk0lazsLdNElUp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0Gy0hFUnJwW7W4VikxFm8zEYloYZjmlt56duf6SD/a1jKj2920kTub7a76TU4Xtpl
	 8jtcYMFREVMr/r3tjrwO5V3rc3m2QYKKydHPSauHppvE6+eKuSzUEXNPPw3utZT5Nw
	 wx1CyQxTbqSwOJoJkCAhzyToVXy2ne2U8NOPAyO9njuJZHrtYJraIxkykswX9g8+KX
	 kbcfIK1xVTon+U1au/0jl8vOpIN154S4SRdlPYXhg7KkPpIc1IvHa/pDpIBFib3giU
	 KeXe1eNwcDCEdinqd/+qEaefNGzePho0FGbnAaNtF1DqvmJ1dy8vY8MCFHC1ur1P5j
	 5mLLm1dCj6LYA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ylu42rJHkAyE; Thu,  8 May 2025 05:47:27 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id B177312FB404;
	Thu, 08 May 2025 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746708446; bh=32CtRKmrPA7nB/+f8XmyUNlfkbdkgk0lazsLdNElUp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9Rxn0NnDtxFBNTZXaVNbdMlSNpg2FVTn1w7cyn9yZpuTnSC3saa0N6MeOBzX1uGD
	 M5V5CqijL2FQCjQLOfl4w885XKxkR65CLQenF20WoJB+QFBcRHu0aWeYBqzsjm/MxA
	 gTsZRNeRlk21Qg9K+213efdRner3P7bzuijDM1Itdjrls9SQlfSAys5wxq8tl+kZ9i
	 aG4Z+DLuU1KOEiiJPdzokK9bBrA4MNlFji0bmN8K9t82TNBoBjyU49vMoAvn2VjnFR
	 iE46+EBTQngIMS0MPAy8S4PJNhQs2OKApoHSHHXuEk7KnI8pN8s+rsTqPSVpRpkXvm
	 0+MTId2zsOavg==
Date: Thu, 8 May 2025 12:47:19 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <aByn187aRWyrzzF4@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com>
 <aBxDQ1_2xJjGlwNf@ketchup>
 <d2614363-1dab-4ea3-b79a-5d3c02c4bc17@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2614363-1dab-4ea3-b79a-5d3c02c4bc17@riscstar.com>

On Thu, May 08, 2025 at 06:55:17AM -0500, Alex Elder wrote:
> On 5/8/25 12:38 AM, Haylen Chu wrote:
> > On Tue, May 06, 2025 at 04:06:35PM -0500, Alex Elder wrote:
> > > Implement reset support for SpacemiT CCUs.  The code is structured to
> > > handle SpacemiT resets generically, while defining the set of specific
> > > reset controllers and their resets in an SoC-specific source file.  A
> > > SpacemiT reset controller device is an auxiliary device associated with
> > > a clock controller (CCU).
> > > 
> > > This initial patch defines the reset controllers for the MPMU, APBC, and
> > > MPMU CCUs, which already defined clock controllers.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/reset/Kconfig           |   1 +
> > >   drivers/reset/Makefile          |   1 +
> > >   drivers/reset/spacemit/Kconfig  |  12 +++
> > >   drivers/reset/spacemit/Makefile |   7 ++
> > >   drivers/reset/spacemit/core.c   |  61 +++++++++++
> > >   drivers/reset/spacemit/core.h   |  39 +++++++
> > >   drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
> > >   7 files changed, 298 insertions(+)
> > >   create mode 100644 drivers/reset/spacemit/Kconfig
> > >   create mode 100644 drivers/reset/spacemit/Makefile
> > >   create mode 100644 drivers/reset/spacemit/core.c
> > >   create mode 100644 drivers/reset/spacemit/core.h
> > >   create mode 100644 drivers/reset/spacemit/k1.c
> > > 
> > 
> > ...
> > 
> > > diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> > > new file mode 100644
> > > index 0000000000000..4ff3487a99eff
> > > --- /dev/null
> > > +++ b/drivers/reset/spacemit/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config RESET_SPACEMIT
> > > +	bool
> > > +
> > > +config RESET_SPACEMIT_K1
> > > +	tristate "SpacemiT K1 reset driver"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	select RESET_SPACEMIT
> > > +	default ARCH_SPACEMIT
> > > +	help
> > > +	  This enables the reset controller driver for the SpacemiT K1 SoC.

...

> > > diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> > > new file mode 100644
> > > index 0000000000000..3a064e9d5d6b4
> > > --- /dev/null
> > > +++ b/drivers/reset/spacemit/Makefile
> > > @@ -0,0 +1,7 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
> > 
> > As RESET_SPACEMIT is defined as bool, the reset driver will never be
> > compiled as a module... so either the RESET_SPACEMIT_K1 should be
> > limited to bool as well or you could take an approach similar to the
> > clock driver.
> 
> I'm not sure I understand this statement, at least in this
> context.  This pattern is used to define a single module
> "reset_spacemit.o" out of several source files.

The problem is that RESET_SPACEMIT could only evaluate to N or Y (it's a
bool entry), thus reset_spacemit.o will always be built into the kernel,
regardless whether RESET_SPACEMIT_K1 is set to Y or M.

In the clock driver, the platform config entry (SPACEMIT_CCU, bool type)
is used to hide SoC-specific entries instead of being really used in
Makefile.

> But I think you're saying that RESET_SPACEMIT and
> RESET_SPACEMIT_K1 should both be bool, or both be
> tristate.  I will resolve that question before I
> send the next version.

This isn't necessary, but making both of them bool will definitely
simplify your work, although I'd like to see the reset driver able to
be built as module, just like the clock one :)

> > > +reset_spacemit-y				:= core.o
> > > +
> > > +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o

Regards,
Haylen Chu
