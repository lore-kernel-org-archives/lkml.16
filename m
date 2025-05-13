Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCA5DF42;
	Tue, 13 May 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157134; cv=none; b=tPV2pVQXEeS8eoD0MnQgJYhHsBQPZnyYuSeQt1hZyixdrMVljptmtBQg9WqtnMTZs2QxQmq6TzT5J5c1GEMveCbOspU0iMQRW5Uuw4XRPlrDn4jO+qFfAhWpbIqIeppdiPPrjdCnI48NUU5Y33l3kIIf40GGYzb3hW+1NmD1b4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157134; c=relaxed/simple;
	bh=KwBHwUKbPrI8zFSIj23WEdv0CSSQb5m1yVfuhttKX9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj24hB+JViPcU8efULffv2pFK5KnRnsS9I9UOW28CRCqeV6emdcMX+8gw5R9WTMBeL4y1YgTcP/s6Bfy7jNaI0lVuPf35YM/mO9AZPj1ui0HAlKb4T77+46ll6GXuTAOWjimdbGtAV1Y50yEhPDTJKiVyW807RNHLTV79nP9TCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E6562247;
	Tue, 13 May 2025 10:25:21 -0700 (PDT)
Received: from bogus (unknown [10.57.45.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFBB13F63F;
	Tue, 13 May 2025 10:25:29 -0700 (PDT)
Date: Tue, 13 May 2025 18:25:28 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,
 code for protocol@81
Message-ID: <20250513-whimsical-almond-quoll-e3ad5b@sudeepholla>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
 <20250409160029.GE27988@nxa18884-linux>
 <2804473.mvXUDI8C0e@steina-w>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2804473.mvXUDI8C0e@steina-w>

On Tue, May 13, 2025 at 05:37:36PM +0200, Alexander Stein wrote:
> Hi Sudeep,
> 
> Am Mittwoch, 9. April 2025, 18:00:29 CEST schrieb Peng Fan:
> > Hi Sudeep,
> > 
> > On Wed, Apr 09, 2025 at 01:31:58PM +0100, Sudeep Holla wrote:
> > >On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> > >> + SCMI maintainer, Sudeep and Cristian
> > >> 
> > >> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> > >> >Hi,
> > >> >
> > >> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> > >> >> BBM protocol supports a single power button, supported by driver
> > >> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> > >> >> using linux,code. Add a reference to this schema and add linux,code as a
> > >> >> supported property.
> > >> >> 
> > >> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >> >
> > >> >Is there any other feedback or things to do here?
> > >> 
> > >> I see Rob already gave R-b.
> > >> 
> > >> Not sure this should go through Shawn's or Sudeep's tree.
> > >> 
> > >
> > >I am fine either way. Peng, just let me know if you want to pick this up.
> > 
> > Not my patch :)
> > 
> > Since scmi driver changes go through your tree, the binding changes
> > should follow same.
> > 
> > It would be good that if you could pick it up. 
> 
> A gentle ping.
> 

Sorry I missed Peng's response. I have already sent my PR for v6.16
Since there is no driver changes, I thought it would be routed elsewhere.
See if Rob or Shawn can pick it up for v6.16, else I can pick it up for
v6.17, sorry for that.

-- 
Regards,
Sudeep
