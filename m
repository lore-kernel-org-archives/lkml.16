Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEB27466D;
	Fri,  9 May 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781176; cv=none; b=MAqYOnSVKzWAxbq8HRUhCJyPxEijCFlC7lN4DVf3YQotFPJQhTVZD6HvAgJafyCYJhwvahEAZ9570b32I6t4ek/4bngUZf/4NBfJo9BosE31853mUefhs0O++vvabapGs0gZGC9aeJaissFeaNsDjtXP6K+Pc6OIqoSWmuKDpKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781176; c=relaxed/simple;
	bh=G8kQrHH3OYQ47ahmGn1kqAZ1Tk03y/9R+YubZV04GLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJj15wTR150P1C+r5RfXvruZBipUVkJ6FeJPmQ7EvjJEaCDt4g0mwKBWZPj5edFYoa4ofX7mxDCXnbNsyp3PYpacCCqmXdzxeybEev9qcTz24gTOWsO0IWrmkryxOJ54qbgJEXGv1JouIFx4GvDV7iflcMN8w3C1QNDFGysxgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BHUfba6b; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BHUfba6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DLliCO1t/SFOSRBkUHeejJJ+CCq3T7Q5aAPydMePW8A=;
	b=BHUfba6bHY10VKBkg4+2RAhj1CXxl1F83mzJaW1LHlL0XRVVYjDD7TAipEINSk
	F1Scu973CVyhBa124FB01AsQkFPOGAct7JYS26uYZmmJVeg2qzOHfiLO0hyS4J2k
	nAEXiWZJ9lXbO22xIL2gvfp0V3j6+dom9oGaDORePilEc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXR_C5wx1oNGmpAA--.63149S3;
	Fri, 09 May 2025 16:58:35 +0800 (CST)
Date: Fri, 9 May 2025 16:58:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Message-ID: <aB3DuZMBIwsFXrVz@dragon>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-CM-TRANSID:Ms8vCgAXR_C5wx1oNGmpAA--.63149S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur18ZFWfGr15Xr1ktFWrKrg_yoW8XFyDpr
	18KFs3CFn8JFsrC3W2g3WYvwnIqFyvkFW8Xa9xu34qyasxtFsxtr4qqr15uFWDJr4fWr4F
	yrnIv347Aw4rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkOz3UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAlIZWgduuwjLgAAsO

On Fri, May 09, 2025 at 08:42:38AM +0000, Maud Spierings | GOcontroll wrote:
> On 5/9/25 10:17, Shawn Guo wrote:
> > On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay wrote:
> >> From: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> >> module bindings.
> >>
> >> This support is not officially done by Ka-Ro electronics, if they at
> >> some point will supporting mainline, this should be changed to them.
> >>
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> ---
> >>   MAINTAINERS | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -12779,6 +12779,12 @@ S:	Maintained
> >>   F:	Documentation/hwmon/k8temp.rst
> >>   F:	drivers/hwmon/k8temp.c
> >>   
> >> +KA-RO TX8P COM MODULE
> >> +M:	Maud Spierings <maudspierings@gocontroll.com>
> >> +L:	imx@lists.linux.dev
> >> +S:	Maintained
> >> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> >> +
> > 
> > I'm not fond of such changes, as MAINTAINERS file could be bloated
> > quickly by individual DTS.
> 
> Is there some way you would prefer to see it? I don't really know of a better
> way. 

There was some discussion about getting ./scripts/get_maintainer.pl pick
up the Author: field (in DTS header area).  But I'm not sure where it
ended.

Shawn

