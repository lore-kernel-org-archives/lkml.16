Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB679CF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011413; cv=none; b=cPkHj4OKPp8Qx6h54CQ1GvpCkyxpGiofdwBfNC5W4pUi6n8IF/FI6JMYqf0/xplf/WwqKZl1xNmi7VDasptjizPbDX/2vd0dR5A/wwurKTsEvddtfJZDTroJK8mvGqFa0eaBThT3HoLPZXRkYXDreay8JM0T6ImEyd7Zd6ePtEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011413; c=relaxed/simple;
	bh=koynGf8+CdcmajpfO3doLXZJyU8BUTJFfTEZhbf/uRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3wmQn+7jVpA/MIcUzoF81EqoyvAst6IIXZRBD856QHOT7ZTisZfRu+FnMiWVXBkRWuVp3WZMCecyDb8s3oWhPbhsV2wqBZRSouitqlhOowLleX1h0hTkURVrmztmf0AmFiCOiWeqqN/MVGN6o92SsH2FiiEG+OXh6s6KwUFnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4WLD5Ga; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4WLD5Ga"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3014678689aso3239377a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744011411; x=1744616211; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9hu9BIiKiLrAv9dyMtSU+8zo4UvBiFanlHUMy4ezNo=;
        b=I4WLD5GaIzNeIGjoGCdOqnrYe9v7149BWRuEz2zVrMWdxPs2tETmbzRpj5Lf4t2FXv
         bI15IeIxzA0o7fT2YHlDJMxYg5o4uBAWJY5ZVi3KdSp53OMxz1cM3LXpllQsd7joXlRZ
         7DrG1C25ZkOSkcoTPid3sjv880UdaJC4Q1rKSWCB9NwVJaoYkCVEuie/17mHOpL9dMGr
         ZN6y4t4A15VVZh4pSA20x7FV/pRg3A/BiflnNC9LHKc42ewUM6tgEoAOBW+UkXby3HMl
         aekpmlZe4OyIN52hDE4CwZuR+O9L5wzTiw9MYobEAbZva1uNOlSTSPqplhuihyw4Ma8Q
         yZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011411; x=1744616211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9hu9BIiKiLrAv9dyMtSU+8zo4UvBiFanlHUMy4ezNo=;
        b=OWTwokIJx1iKdOS/8vs2MGocKjqYprNh0CYVBLcicEsI+Vto5oTrz6aY9i03t6Xvh4
         zt0rfPXxMnt+xND5XAyCUNzPMTVtDOD+Fdx4W+CVZ8xytMtspk41lMylOT6mTnTh68Wi
         +AMOTjhX63eiiuzQBLakhuJEE79GiofhVQirQccCX7janxzXCWwGMAWpF7RXCU7/JMOg
         +VxmeEOBRDqaWcrrFWDq9P5rNyhWMjbTNOZ5JLGrhNRzfQLeB1uHAu2qSjbO9TJKMka8
         XKxDr/GB7X3hfEads0opjYxOeMu9CtGywP504tVK7+sJZhMSIBe73sXsYhOVsyI84SI7
         jPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXWmFjnxb7hlTeX0lZGGGDmPqmSpoWCjnOmrMaHMolXgf1YTk8QZZYzxSyQVEcqF4jnj4YOpLUp6A0b71s=@vger.kernel.org
X-Gm-Message-State: AOJu0YywdHUSI9YV4WgccKMFgeK3H3EIGWcnNKrtxXQ9byCnsO8ufg4H
	pFA5AFaw4S6ZV5E9NFSLsTSDlh6hBQ9aWBLkHpWy6Q4z7GOSCxRpxnKQBjIk2A==
X-Gm-Gg: ASbGncv1cNSUq5y5ImVTDVbE2dsZo2yGEL9JxTro01PI2M15D149aUhKco65OxXcUgi
	G37ULWLhm9VnvgjXxSpxsyDH7AOmB6rj7s0+1a4mMwzOpcjdV0CYN5tuuUv8sEAt/fAcgj7eish
	QHJFDYzk55h7JN3bPXzmuoQ6pdaXU8eIHjFU/OSKnLaf/OxCpoHL4FRBkg2I1zVnxnMjR0C5Ba3
	eQjilBcX6fAx0xtXfOxGdQGT3LFkmCqtAnUb+R0ykaypUtbITdnPvgTeL2Pata+XHYvALrowCN1
	b9Um/RQiNFHHCiJu4wBmg7/7yuABuwwyxS2u9t0seH5e3beCQw8TkWc=
X-Google-Smtp-Source: AGHT+IGzvdPdmWxd4WyWmrDKQ+6Kp6xrKgrTzXN8i5RbG1vlBal+aGVp4TmGrHiie98FKikeCFAn/g==
X-Received: by 2002:a17:90b:2fc5:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-306a48a2359mr19194444a91.16.1744011411044;
        Mon, 07 Apr 2025 00:36:51 -0700 (PDT)
Received: from thinkpad ([36.255.17.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb91b9esm8316402a91.45.2025.04.07.00.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:36:50 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:06:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI: Add sysfs support for exposing PTM context
Message-ID: <jh2kntthtj5dz4dmltc63ye3v4owsl5evcnzpf5anrzdzqzms6@hng6ciwzry3t>
References: <20250324-pcie-ptm-v2-0-c7d8c3644b4a@linaro.org>
 <20250324-pcie-ptm-v2-1-c7d8c3644b4a@linaro.org>
 <b76aaf39-1a03-ffbf-ae44-66dd01753bc7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b76aaf39-1a03-ffbf-ae44-66dd01753bc7@linux.intel.com>

On Mon, Mar 24, 2025 at 03:01:49PM +0200, Ilpo Järvinen wrote:
> On Mon, 24 Mar 2025, Manivannan Sadhasivam via B4 Relay wrote:
> 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.22 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> 
> Hi Mani,
> 
> PCIe r6.0.1 sec 6.22 is about Readiness Notification (RN) and PTM is 6.21, 
> did you perhaps mistype the section number?
> 

Oops, yeah. I referred the PCIe 5.0 spec, but mistakenly quoted 6.0. Will fix
it.

> > PCI core already supports enabling PTM in the root port and endpoint
> > devices through PTM Extended Capability registers. But the PTM context
> > supported by the PTM capable components such as Root Complex (RC) and
> > Endpoint (EP) controllers were not exposed as of now.
> > 
> > Hence, add the sysfs support to expose the PTM context to userspace from
> > both PCIe RC and EP controllers. Controller drivers are expected to call
> > pcie_ptm_create_sysfs() to create the sysfs attributes for the PTM context
> > and call pcie_ptm_destroy_sysfs() to destroy them. The drivers should also
> > populate the relevant callbacks in the 'struct pcie_ptm_ops' structure
> > based on the controller implementation.
> > 
> > Below PTM context are exposed through sysfs:
> > 
> > PCIe RC
> > =======
> > 
> > 1. PTM Local clock
> > 2. PTM T2 timestamp
> > 3. PTM T3 timestamp
> > 4. PTM Context valid
> > 
> > PCIe EP
> > =======
> > 
> > 1. PTM Local clock
> > 2. PTM T1 timestamp
> > 3. PTM T4 timestamp
> > 4. PTM Master clock
> > 5. PTM Context update
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/ABI/testing/sysfs-platform-pcie-ptm |  70 ++++++
> >  MAINTAINERS                                       |   1 +
> >  drivers/pci/pcie/ptm.c                            | 268 ++++++++++++++++++++++
> >  include/linux/pci.h                               |  35 +++
> >  4 files changed, 374 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-pcie-ptm b/Documentation/ABI/testing/sysfs-platform-pcie-ptm
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..010c3e32e2b8eaf352a8e1aad7420d8a3e948dae
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-pcie-ptm
> > @@ -0,0 +1,70 @@
> > +What:		/sys/devices/platform/*/ptm/local_clock
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM local clock in nanoseconds. Applicable for both Root
> > +		Complex and Endpoint controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/master_clock
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM master clock in nanoseconds. Applicable only for
> > +		Endpoint controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/t1
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM T1 timestamp in nanoseconds. Applicable only for
> > +		Endpoint controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/t2
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM T2 timestamp in nanoseconds. Applicable only for
> > +		Root Complex controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/t3
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM T3 timestamp in nanoseconds. Applicable only for
> > +		Root Complex controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/t4
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM T4 timestamp in nanoseconds. Applicable only for
> > +		Endpoint controllers.
> > +
> > +What:		/sys/devices/platform/*/ptm/context_update
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RW) Control the PTM context update mode. Applicable only for
> > +		Endpoint controllers.
> > +
> > +		Following values are supported:
> > +
> > +		* auto = PTM context auto update trigger for every 10ms
> > +
> > +		* manual = PTM context manual update. Writing 'manual' to this
> > +			   file triggers PTM context update (default)
> > +
> > +What:		/sys/devices/platform/*/ptm/context_valid
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RW) Control the PTM context validity (local clock timing).
> > +		Applicable only for Root Complex controllers. PTM context is
> > +		invalidated by hardware if the Root Complex enters low power
> > +		mode or changes link frequency.
> > +
> > +		Following values are supported:
> > +
> > +		* 0 = PTM context invalid (default)
> > +
> > +		* 1 = PTM context valid
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b4d09d52a750b320f689c1365791cdfa6e719fde..f1bac092877df739328347481bd14f6701a7df19 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18213,6 +18213,7 @@ Q:	https://patchwork.kernel.org/project/linux-pci/list/
> >  B:	https://bugzilla.kernel.org
> >  C:	irc://irc.oftc.net/linux-pci
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
> > +F:	Documentation/ABI/testing/sysfs-platform-pcie-ptm
> >  F:	Documentation/devicetree/bindings/pci/
> >  F:	drivers/pci/controller/
> >  F:	drivers/pci/pci-bridge-emul.c
> > diff --git a/drivers/pci/pcie/ptm.c b/drivers/pci/pcie/ptm.c
> > index 7cfb6c0d5dcb6de2a759b56d6877c95102b3d10f..bfa632b76a87ad304e966a8edfb5dba14d58a23c 100644
> > --- a/drivers/pci/pcie/ptm.c
> > +++ b/drivers/pci/pcie/ptm.c
> > @@ -10,6 +10,8 @@
> >  #include <linux/pci.h>
> >  #include "../pci.h"
> >  
> > +struct device *ptm_device;
> > +
> >  /*
> >   * If the next upstream device supports PTM, return it; otherwise return
> >   * NULL.  PTM Messages are local, so both link partners must support it.
> > @@ -252,3 +254,269 @@ bool pcie_ptm_enabled(struct pci_dev *dev)
> >  	return dev->ptm_enabled;
> >  }
> >  EXPORT_SYMBOL(pcie_ptm_enabled);
> > +
> > +static ssize_t context_update_store(struct device *dev,
> > +			      struct device_attribute *attr,
> > +			      const char *buf, size_t count)
> > +{
> > +	struct pcie_ptm *ptm = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (!ptm->ops->context_update_store)
> > +		return -EOPNOTSUPP;
> > +
> > +	ret = ptm->ops->context_update_store(ptm->pdata, buf);
> 
> Do these store funcs need some locking? Who is responsible about it?
> 

Good catch! I obviously missed the locking here.

> Why isn't buf parsed here and converted to some define/enum values, what 
> is the advantage of passing it on as char *?
> 

Only because I was not sure if the values are going to be the same across all
implementations. But since I document 'auto' and 'manual' in ABI documentation,
I think it makes sense to pass the values directly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
