Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBB2405E4;
	Tue, 15 Apr 2025 23:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744758089; cv=none; b=JjA4HEtKE5RYf831cNmX3GXqCAZvt8LXbP85RjkRrO1A59619RrNq83O94iNz9Z5T3iPkiQNdEtwlVvW+M+1VVYgRG0/QlrosLc6vu56GXTmjbzerhVeh/Sbve3koyWM4RFdGuKs8afK9rVHUOB2zqS1qAyD9pZflqBDvFIl3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744758089; c=relaxed/simple;
	bh=reONu9DCX8yIdj7GLfXXkccHOkCnNJe0Ef9D9h6QGQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1ifjyJ51UhTty0Rn9oos38J/7Oqj7f5Bo4b+Du9ineY0/SC/dH8fGCJR8C4efna77tzHNKDa/ip3R9ju31vMGlIdgaL8hWJyRUI1rH/0sKRwVYDa60jYlfn16cPOrY/FJSa6BzOGJFq/12Veu6fnviwx0297X7WuRb5rDV24IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LNinphU2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LNinphU2"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16373353;
	Wed, 16 Apr 2025 00:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744757963;
	bh=reONu9DCX8yIdj7GLfXXkccHOkCnNJe0Ef9D9h6QGQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNinphU21VM8OFnnSnZNbt5K+oDpNQ119G58IJinl3fPGKbpdtvWtuwTZNeC4uVwP
	 zDUZYnkigre8k9BnHfz0utab+c0D7EoR7/Bq2dh/mlLw9pv+KOD0yWcF4k9fYySv4X
	 g0VC6PFm+O/41wyVA4Q2yQinKO8r452Bwp7rsM8U=
Date: Wed, 16 Apr 2025 02:01:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: POPESCU Catalin <catalin.popescu@leica-geosystems.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Shawn Guo <shawnguo2@yeah.net>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"stefan.klug@ideasonboard.com" <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <20250415230124.GJ9439@pendragon.ideasonboard.com>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
 <20250415181423.qderfey4wpmp2bjm@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415181423.qderfey4wpmp2bjm@pengutronix.de>

Hi Marco,

On Tue, Apr 15, 2025 at 08:14:23PM +0200, Marco Felsch wrote:
> On 25-04-15, Laurent Pinchart wrote:
> > On Tue, Apr 15, 2025 at 06:47:26PM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 15, 2025 at 03:42:22PM +0000, POPESCU Catalin wrote:
> > > > Hi Jai,
> > > > 
> > > > This issue was already reported by Stefan. The problem is that I don't 
> > > > have a Debix board to investigate.
> > > > The main difference b/w WFI and cpu-pd-wait is that the first doesn't 
> > > > call PSCI/TF-A. So, the issue looks to be related to some settings in 
> > > > the TF-A.
> > > 
> > > Jai, are you using mainline U-Boot and TF-A, or a downstream version of
> > > either (or both) ?
> > 
> > Actually, same question for Calatin :-)
> > 
> > I'm running mainline U-Boot 2025.01 and TF-A rel_imx_5.4.70_2.3.6 (from
> > https://github.com/nxp-imx/imx-atf) and don't seem to experience the
> > issue:
> 
> Interessting, can you share your imx-atf build-config please?

I've followed the instructions in the doc/board/nxp/imx8mp_evk.rst file
(in the U-Boot source):

```
Get and Build the ARM Trusted firmware
--------------------------------------

Get ATF from: https://github.com/nxp-imx/imx-atf
branch: imx_5.4.70_2.3.0

.. code-block:: bash

   $ make PLAT=imx8mp bl31
```

I had to patch the TF-A makefile as follows to fix errors with recent
versions of gcc:

```
diff --git a/Makefile b/Makefile
index 2ae12fda741a..46512993c6e0 100644
--- a/Makefile
+++ b/Makefile
@@ -285,7 +285,8 @@ ASFLAGS			+=	$(CPPFLAGS) $(ASFLAGS_$(ARCH))			\
 				-ffreestanding -Wa,--fatal-warnings
 TF_CFLAGS		+=	$(CPPFLAGS) $(TF_CFLAGS_$(ARCH))		\
 				-ffreestanding -fno-builtin -Wall -std=gnu99	\
-				-Os -ffunction-sections -fdata-sections
+				-Os -ffunction-sections -fdata-sections		\
+				-Wno-error=array-bounds

 ifeq (${SANITIZE_UB},on)
 TF_CFLAGS		+=	-fsanitize=undefined -fno-sanitize-recover
@@ -300,9 +301,11 @@ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
 ifneq ($(findstring armlink,$(notdir $(LD))),)
 TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
 TF_LDFLAGS		+=	--remove --info=unused,unusedsymbols
+TF_LDFLAGS		+=	-Wl,--no-warn-rwx-segment
 else
 TF_LDFLAGS		+=	--fatal-warnings -O1
 TF_LDFLAGS		+=	--gc-sections
+TF_LDFLAGS		+=	--no-warn-rwx-segment
 endif
 TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))

```

> I checked the code base and found a missing SLPCR_A53_FASTWUP_STOP_MODE
> during the imx_set_sys_lpm() which is called during
> .pwr_domain_suspend(). Can you check/trace if pwr_domain_suspend() was
> entered?

I'm no TF-A expert, can you tell me how to check/trace that ?

> > # cat /sys/devices/system/cpu/cpu*/cpuidle/state1/disable
> > 0
> > 0
> > 0
> > 0
> > 
> > $ ping debix
> > PING debix.farm.ideasonboard.com (192.168.2.230) 56(84) bytes of data.
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=1 ttl=64 time=1.03 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=2 ttl=64 time=0.800 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3 ttl=64 time=0.935 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=4 ttl=64 time=0.902 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=5 ttl=64 time=0.738 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=6 ttl=64 time=0.939 ms
> > 
> > > > What I don't get is why I don't see this issue neither on our IMX8MP 
> > > > specific design nor on the EVK, which uses the same PHY as the Debix board.
> > > >
> > > > On 14/04/2025 14:07, Jai Luthra wrote:
> > > > > On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> > > > >> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> > > > >>> So far, only WFI is supported on i.MX8mp platform. Add support for
> > > > >>> deeper cpuidle state "cpu-pd-wait" that would allow for better power
> > > > >>> usage during runtime. This is a port from NXP downstream kernel.
> > > > >>>
> > > > > Since the introduction of this patch in mainline, I am facing sluggish
> > > > > network performance with my Debix Model-A board with i.MX8mp SoC.
> > > > >
> > > > > The network latency jumps to >1s after almost every other packet:
> > > > >
> > > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=1008 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=0.488 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=1025 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.810 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=590 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=6 ttl=64 time=0.351 ms
> > > > > ^C
> > > > > --- debix ping statistics ---
> > > > > 7 packets transmitted, 6 received, 14.2857% packet loss, time 6126ms
> > > > > rtt min/avg/max/mdev = 0.351/437.416/1024.755/459.370 ms, pipe 2
> > > > > darkapex at freya in ~
> > > > >
> > > > > If I revert the patch, or disable the deeper cpuidle state through
> > > > > sysfs, the issue goes away.
> > > > >
> > > > > # echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
> > > > >
> > > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=0.482 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=2.28 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=2.26 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.848 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=0.406 ms
> > > > > ^C
> > > > > --- debix ping statistics ---
> > > > > 5 packets transmitted, 5 received, 0% packet loss, time 4051ms
> > > > > rtt min/avg/max/mdev = 0.406/1.255/2.280/0.842 ms
> > > > >
> > > > >>> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> > > > >>
> > > > >> Applied, thanks!

-- 
Regards,

Laurent Pinchart
