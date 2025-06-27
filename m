Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791927A10D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014041; cv=none; b=CpC9sozrPPhKWipk0cFPmNO7RvYLXLDw1GuQFGsPnrYv5TjmRaj7QnMAFKX9j4T75Jqje2ekLNuVvzIyweC7Kj0JnbYRw9GJgdzaUwYtizRzXmUBrgV2d051N5PdD6q88we0rQQWdakrhB7ooiAmQ5Tu/2MDyR4SOHOofDrxeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014041; c=relaxed/simple;
	bh=S9R1daGF0xfRUHuD8kFU/fIW4cXvRKaYSgRGFQpd0/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8YAYaT7mCw0S/M/QpNQqY8xd9sS/naRV1hdS0LDqknk9PDN3zKF1NDfpIHiyhnVhT6B1eYAfeGW20bFCwCydBdg2PjocrNuIf2Gfm8vnD6HVVHR74sIQmQpxM6KB+LHMXiwEOiNl9Ph3afh5Cf09wzZdS009VkL7Mw0xxDjUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4ja-0003zL-Vq; Fri, 27 Jun 2025 10:46:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4jW-005aNg-0W;
	Fri, 27 Jun 2025 10:46:54 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4jW-003X1G-02;
	Fri, 27 Jun 2025 10:46:54 +0200
Date: Fri, 27 Jun 2025 10:46:53 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Message-ID: <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi,

your e-mail configuration mixed my e-mail with your answer, which makes
it hard to read. Can you please check the quoting next time :)

On 25-06-27, Pankaj Gupta wrote:
> >> Add driver for enabling MU based communication interface to
> secure-enclave.
> >>
> >> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
> >> embedded in the SoC to support the features like HSM, SHE & V2X, using 
> >> message based communication interface.
> >>
> >> The secure enclave FW communicates with Linux over single or multiple 
> >> dedicated messaging unit(MU) based interface(s).
> >> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> > You write single or multiple MUs are possible. I'm aware that the i.MX93
> > has two MUs one for the secure and one for the non-secure world. But I'm
> > really concerned about the fact that both MUs can't be used at the same time
> > from both world:
>
> Yes, you are correct.
> 
> Fix is still work in progress.

So after ~6 months no fix is available :(

> > Also how is the secure and non-secure world talking to the ELE if there is
> > only one MU as you have written?
> 
> Till the fix is WIP, either Linux or OPTEE can use the ELE, at one point in
> time.

That has nothing to do with the fix. The fix is for platforms/SoCs which
do have 2-MUs, but you also have written that there are platforms with
only 1-MU.

This MU can't be shared between secure and non-secure world.

> > IMHO it makes much more sense to put the complete ELE communication into
> > (OP-)TEE and let the secure OS taking care of it. All non-secure world
> > requests are passed via (OP-)TEE to the ELE. This involves:
> > - eFuse access (done via OP-TEE i.MX specific PTA)
> > - ELE 23h59m ping (kernel SMC WDG driver, requires OP-TEE watchdog driver)
> > - HW-RNG (kernel OP-TEE HWRNG driver + OP-TEE HWRNG PTA)
> 
> There is a dedicated MU "trusted-MU" for OPTEE-OS. The idea to converge to a

Yes for systems with 2-MUs there is a "trusted-MU" and a
"non-trusted-MU". As of now, there is no fix available for using both
MUs at the same time. Furhtermore there are platforms/SoCs with only
1-MU, as you have written in your commit message. This 1-MU system can
have the MU either trusted or non-trusted.

> single path via OPTEE-OS, is good. But it will impact the performance of the
> features at Linux side.

Performance? We are talking about a ping every 23h59m (I still don't
know if this is a feature or bug), eFuse write/read, and the HW-RNG
which can seed the Linux PRNG.

> Since the fix is still WIP. Let's wait till then.

The fix is for the 2-MUs SoCs but not the 1-MU case.

I would like to have a system design which doesn't differ too much
between SoCs which are equipped with the ELE engine.

Regards,
  Marco
