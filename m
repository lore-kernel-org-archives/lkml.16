Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6C4B1E53
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747278804; cv=none; b=RPu/dmOMHOPob5G142WXet2aUJDoBPC4Pu7nKKyEFd4rkRFtxZL1JmGLUd97r31+ojcDWUPqKGKQDG9X+y7yv2xz7EtKKlZASSRaLBn4rrJo9WNMAvNuEMyJhtFsMS6Ix4PpsIFcsFocq7gpRpx2foJboivrXXwn6OL4HNC0Dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747278804; c=relaxed/simple;
	bh=vEooOq1mF3JcMpF75SUZAU/F0rlija40yShoDfFFhe0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEG/rDync0hWWEJn9vfN6s04V9bVcJpPtm8kVRtmQ6kGQejIUdP0S/nwi0/fGTyxcjL9mJ4tewsRL0eINz5+96O9YfhJh3Zvs6PqqKIhoTN7F0yWYFwURbDXNrAL53Rr4xb1pChkyWC55mAdINlBeQ9XD5Q2Vq5d7igeSsGN3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54F3Caka051801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 May 2025 11:12:36 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 11:12:36 +0800
Date: Thu, 15 May 2025 11:12:36 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <aCVbpNkyHlfg+vc7@atctrx.andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-5-ben717@andestech.com>
 <20250514150102.GA2180131-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250514150102.GA2180131-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54F3Caka051801

On Wed, May 14, 2025 at 10:01:02AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Wed, May 14, 2025 at 05:53:45PM +0800, Ben Zong-You Xie wrote:
> > Add the DT binding documentation for Andes machine-level software
> > interrupt controller.
> >
> > In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > second time with all interrupt sources tied to zero as the software
> > interrupt controller (PLICSW). PLICSW can generate machine-level software
> > interrupts through programming its registers.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../andestech,plicsw.yaml                     | 54 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> 
> This won't apply for me due to MAINTAINERS conflict with this series. So
> apply the bindings patches with the dts files.
> 
> Rob

The conflict is due to the second patch in this series not being applied.
Should I wait for that patch to be applied, or is there something specific
I can do to resolve the conflict?

Thanks,
Ben

