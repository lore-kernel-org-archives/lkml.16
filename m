Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB07A2356D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584514; cv=none; b=fofVEJ/y5A9G0r1xGDFm60AO6wzJcI6UON6N+1+GzIgNOYl/OMLLQmwhoseON6W/gY9L3tZse5xQUPsD5hBnANYFwzqcBk8O4oqUtEgykbloxqWBJHUqAUS6sB29ph/lATxKtU/BkSUc9s73cG4QwIXjl42pT7E5oPEOxkM75BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584514; c=relaxed/simple;
	bh=khFh/H164zEVgoF53v/j7GpFHIz/D/1a+c3tJyNrRxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoH/pd0uNeLy6PIjTh4jhfdhI5I4S/UkYmzf0uYFle2dZiIa3mCtIBDwqf7q1XQY48+FuiycjdApL55x1gGJuR1Lr2KdObynWPvhpeq3oqpVBXE+qf6V0dNeCDHOl13D7sgnzu1F99cFK/unDoC7SdJ1x1WJ3ySYczCapqNGiqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FA6612FC;
	Wed,  2 Apr 2025 02:01:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937A73F694;
	Wed,  2 Apr 2025 02:01:51 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:01:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
Message-ID: <20250402090147.GF115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
 <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>

Hi Jie,

[ + Rob ]

On Wed, Apr 02, 2025 at 08:55:51AM +0800, Jie Gan wrote:

[...]

> > >   {
> > > -    struct clk *pclk = NULL;
> > > +    WARN_ON(!pclk);
> > >       if (!dev_is_amba(dev)) {
> > > -        pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > > -        if (IS_ERR(pclk))
> > > -            pclk = devm_clk_get_enabled(dev, "apb");
> > > +        *pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > > +        if (IS_ERR(*pclk))
> > > +            *pclk = devm_clk_get_enabled(dev, "apb");
> > > +        if (IS_ERR(*pclk))
> > > +            return PTR_ERR(*pclk);
> > > +    } else {
> > > +        /* Don't enable pclk for an AMBA device */
> > > +        *pclk = NULL;
> > 
> > Now the "apb" clock won't be enabled for amba devices. I'm assuming
> > that's fine if the clock was always called "apb_pclk" for them, but the
> > commit that added the new clock name didn't specify any special casing
> > either.
> > 
> > Can we have a comment that says it's deliberate? But the more I think
> > about it the more I'm confused why CTCU needed a different clock name to
> > be defined, when all the other Coresight devices use "apb_pclk".
> 
> Hi James,
> 
> The original clock-name for CTCU is apb_pclk, but the dt-binding maintainer
> request me to change it to apb, that's why the clock name is different from
> others.
> 
> I am not why we need apb instead of apb_pclk in dt-binding. Maybe some rules
> have changed for dt-binding requirement.

My conclusion is that if a device is an Arm Primecell peripheral, it
should use the clock name "apb_pclk" (See the DT binding doc [1]).

CTCU is not an Arm Primecell peripheral, so it does not need to strictly
follow up the clock naming for Primecell peripheral.

In Arm CoreSight framework, for code consistency, I would suggest
using the clock naming "apb_pclk" for the APB clock for a newly added
device that even it is not a Primecell peripheral.

(We don't need to make any change to the CTCU driver, as we need to
remain compatible with existed DTB blobs).

Cc'ing Rob in case he has any suggestions.

Thanks,
Leo

[1] Documentation/devicetree/bindings/arm/primecell.yaml
