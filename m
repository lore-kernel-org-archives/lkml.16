Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9A212F89;
	Wed, 16 Apr 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823047; cv=none; b=la1vXOpjSNEWU5w4jOnVSsk74NSdzTrRCdjYkg5j1jKke/4S0Ief2tTUSHbDXXnngOD871L+HT/4DXKicfkdDT+SsW8JJy+Z7NH+2gu4ug7PG0jcLZzz2zityUL7uQz86Asw6VAMnRgae7979MUodu70pCb28rY9b+kNdbF5fVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823047; c=relaxed/simple;
	bh=wgCJ0YY6y5mc3MKbBmKW0mnPzzpGjhPUNF1lKUnvhjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKAPH1aEWzSkLLqjKnbQviSc1esvf7yEuoax/B//7t/m7PeMgwpqSdoufzNQeLeP+ioDd4Ex8QZrHOwUwaGIheCQ8kODQrWD7fEhxN5sBQGzo+ITSBKdgRFevzBnkTnODrqnJmFse8JuabDIEyspQ5okRuVjhQ6uIcnTtWsUPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JM8UVWCL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JM8UVWCL"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C28D5965;
	Wed, 16 Apr 2025 19:01:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744822919;
	bh=wgCJ0YY6y5mc3MKbBmKW0mnPzzpGjhPUNF1lKUnvhjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JM8UVWCLlEpsxKhuY7rly7xb7D3TdDAMaJbLfQjeOOGpSoJZ6mV0Ae5/c9lXz0qRg
	 jaE0dvXZr+Fha3XA0vUNPWfTUWm9KG0rke7gzhAiTBg9vPm3GY2VFsFgGgYoq4MftH
	 Pmg24l3gVJDl2mmIFY69NRjMmHcgPQ+MB6z7lQgk=
Date: Wed, 16 Apr 2025 20:04:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
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
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"stefan.klug@ideasonboard.com" <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <20250416170400.GK9439@pendragon.ideasonboard.com>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
 <49a83fe4-863d-4f84-912c-cf58dc22ede6@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49a83fe4-863d-4f84-912c-cf58dc22ede6@leica-geosystems.com>

Hi Catalin,

On Wed, Apr 16, 2025 at 06:57:35AM +0000, POPESCU Catalin wrote:
> On 15/04/2025 17:52, Laurent Pinchart wrote:
> > On Tue, Apr 15, 2025 at 06:47:26PM +0300, Laurent Pinchart wrote:
> >> On Tue, Apr 15, 2025 at 03:42:22PM +0000, POPESCU Catalin wrote:
> >>> Hi Jai,
> >>>
> >>> This issue was already reported by Stefan. The problem is that I don't
> >>> have a Debix board to investigate.
> >>> The main difference b/w WFI and cpu-pd-wait is that the first doesn't
> >>> call PSCI/TF-A. So, the issue looks to be related to some settings in
> >>> the TF-A.
> >>
> >> Jai, are you using mainline U-Boot and TF-A, or a downstream version of
> >> either (or both) ?
> >
> > Actually, same question for Calatin :-)
> 
> Bonjour Laurent,
> 
> I'm running a yocto scarthgap custom build :
> 
> - barebox : http://barebox.org/download/barebox-2024.05.0.tar.bz2 _with_
> custom patches
> - kernel : 6.12.16 _with_ custom patches
> - TF-A :
> git://github.com/hexagon-geo-surv/trusted-firmware-a;protocol=https;branch=leica/v2.12
> / SRCREV=46c962c654de4ab734f936f472508edf20c6c049 (_no_ custom patches)

Could you please run tests with the latest mainline kernel ?

> > I'm running mainline U-Boot 2025.01 and TF-A rel_imx_5.4.70_2.3.6 (from
> > https://github.com/nxp-imx/imx-atf) and don't seem to experience the
> > issue:
> >
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
> >>> What I don't get is why I don't see this issue neither on our IMX8MP
> >>> specific design nor on the EVK, which uses the same PHY as the Debix board.
> >>>
> >>> On 14/04/2025 14:07, Jai Luthra wrote:
> >>>> On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> >>>>> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> >>>>>> So far, only WFI is supported on i.MX8mp platform. Add support for
> >>>>>> deeper cpuidle state "cpu-pd-wait" that would allow for better power
> >>>>>> usage during runtime. This is a port from NXP downstream kernel.
> >>>>>>
> >>>> Since the introduction of this patch in mainline, I am facing sluggish
> >>>> network performance with my Debix Model-A board with i.MX8mp SoC.
> >>>>
> >>>> The network latency jumps to >1s after almost every other packet:
> >>>>
> >>>> PING debix (10.0.42.5) 56(84) bytes of data.
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=1008 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=0.488 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=1025 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.810 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=590 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=6 ttl=64 time=0.351 ms
> >>>> ^C
> >>>> --- debix ping statistics ---
> >>>> 7 packets transmitted, 6 received, 14.2857% packet loss, time 6126ms
> >>>> rtt min/avg/max/mdev = 0.351/437.416/1024.755/459.370 ms, pipe 2
> >>>> darkapex at freya in ~
> >>>>
> >>>> If I revert the patch, or disable the deeper cpuidle state through
> >>>> sysfs, the issue goes away.
> >>>>
> >>>> # echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
> >>>>
> >>>> PING debix (10.0.42.5) 56(84) bytes of data.
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=0.482 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=2.28 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=2.26 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.848 ms
> >>>> 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=0.406 ms
> >>>> ^C
> >>>> --- debix ping statistics ---
> >>>> 5 packets transmitted, 5 received, 0% packet loss, time 4051ms
> >>>> rtt min/avg/max/mdev = 0.406/1.255/2.280/0.842 ms
> >>>>
> >>>>>> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> >>>>> Applied, thanks!

-- 
Regards,

Laurent Pinchart
