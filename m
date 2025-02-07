Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C122F175D5D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951590; cv=none; b=C6hxySbchfJMFeKcU/ZUooudtzaly8Ltp9l970/YNIHMH/rAVLfmzFas3UXlQIUrOlheHP7u5QlnRIOgMdJT29Pcn2JKHWZd/Vy/cLs0o8KlTy4qmBFcMr51XnoIj2s+YQ331k3ZZEmBdkfiBEWc/NhkM2uXJm9JHzcXP74pEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951590; c=relaxed/simple;
	bh=aaCF+T3kwqSNGwdlNP8Ra02AVmhslrWD5RoAm7K8Rog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wxz+43Qou2VK0MkvmJx4Omfj/sCEqLOPEqnnva/2UWSfxy/93cq8u+cYeFuXSlNtpQLdfbPQJqWXKJ+KEiUlvWRyFcmVzzx1xjBooymK4+sOLV+4ObD8C3UEsa5haCsZaGh489VB7ir+Fqz85NKce56u1POp6Ws+F3WZ/cSQ+bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLfNteYL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLfNteYL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163dc5155fso50002145ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738951588; x=1739556388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkglN50gfuQ6erp2z8Ofp6pXI2FMc5IUlP0T/eiB6Ig=;
        b=WLfNteYL5LXmPGVYALjoEwXo42JUMUwBXj7RPU0wh93MOLodae9JxjS7H/iWP3Usyv
         VOQ0zEPcK/gTWqI090qYN90KarX13RWcmhWx4NjI3Lhn3OBEAzGvgG5bDqxqFgLMcUN7
         FCwWVmuB0JjXjqtnrMHCEIuyxSDNlhLOf0/vC0j99ivVBCd9mwnkU2r8OsIyHAYRVS5F
         uatI8M6qmMNtfOXOVGoeNHRdHDvhSspzjd8jf++BxuESd8IMjJlOfN4Uem6WHEphy+ko
         F1svtvfUwvnAwemyZJmuyxzRGD1aoVNJOF3iBtYRbdgZW76uRvLnAgucNs9+5slbVfhA
         +D4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951588; x=1739556388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkglN50gfuQ6erp2z8Ofp6pXI2FMc5IUlP0T/eiB6Ig=;
        b=BBOnpujxAZMAE6hwxPsesR2/dVsyxUpDgek7WWWG581JQRw2AdyTcpkzHTwrkxlCn8
         4H/qVdd8Pwd5RG2XB5qBZjz1n0Ksv+uKCaeh6htKUiw764pLn8Pe91g9wcYG0kl62hnZ
         kNni6ExsShTKA0grsJqgmkPQHtV7owUR8mVwPgqM+FJirkCHveH/QktXCds8wmTLNM2h
         Nwv2h7ZgAIRaDah/5j7mRNq6IngHlpT7TQny/xAbIyFkROndGz2z4/H2nNtEFautZEwA
         ucT5oWDqWnrGsH5zlNAu8m4FTJrC9k8YdAgGcuH2aETbnhtYYO2+PqMdkLLY2E5zYCJr
         AKCw==
X-Forwarded-Encrypted: i=1; AJvYcCWQNdKTa9/9BueAdobOxh1yIxOz2yeuBtTPVyb6tXI4zrE5V8F42FPw6Ek5Ae0uFaTxtxqOeVxO4nHvvSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9NuJ0ojgFJWlsA7fyXnBcBLNQo8GxQ74E7z/Dntpa5xuXlJtM
	kQbro4Ll/i9nW5ovbogStxZ/mPOzgfMw4wkjknWEm2gpqeJwG2fQ6ENrM5CXgA==
X-Gm-Gg: ASbGncs5m7iytxZ5BMfx6uyWb8cBDmv0w/qmF8ESPSjNPNU84m/EeB+HgKr1qESefs/
	KmvShwhbFtnXddFp0R4asUPjJYicoLFwszAbUb6yAcGtP3MU/uddTlO7oMriSwG7H+SOZDFIgXt
	lf+3KE7LHJtT8sR0/96ztfGyT0CiX8ZjRbeDnaoFLUBkHO0noDnuj+C+8NAgFe4N4B9j1JFPj73
	GYLpDhhiIRUSZYynbEqHI+LoFQXerXRQI8G7P1neg46mRoDKENgOkvECWnwWycy29Jcxx7AEJBg
	kdsHR2/7LS/XZ/tJHFgCQk8mVQ==
X-Google-Smtp-Source: AGHT+IEGQbMoB6GFj06Ak8dhhWj5Td9SePkG/cyThscF6f8JtfnvZUjmhrcJv2M2U3gusWXIG8uxLg==
X-Received: by 2002:a17:902:d4cd:b0:21f:14e8:e87 with SMTP id d9443c01a7336-21f4e6e87admr72467985ad.26.1738951587987;
        Fri, 07 Feb 2025 10:06:27 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af7b744sm3400169a12.77.2025.02.07.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:06:27 -0800 (PST)
Date: Fri, 7 Feb 2025 23:36:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	helgaas@kernel.org
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
Message-ID: <20250207180622.dugcctzfbef7sshw@thinkpad>
References: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>
 <CAPDyKFqfJmpFvNgjj3P3+vmiSooiU4sr=dnVuBfXOijPdcbt-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFqfJmpFvNgjj3P3+vmiSooiU4sr=dnVuBfXOijPdcbt-A@mail.gmail.com>

On Tue, Feb 04, 2025 at 05:03:33PM +0100, Ulf Hansson wrote:
> On Sun, 26 Jan 2025 at 06:03, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On these platforms, power to the PCIe bus is not retained if the SoC enters
> > its own deep low power state called, CX power collapse state during system
> > suspend. Once the SoC resumes after going through CX power collapse, all
> > the PCIe bus state will be lost. So the NVMe devices on these platforms
> > won't resume properly, rendering the machines useless until forcefully
> > restarted by the users.
> >
> > To workaround this issue, the PCIe controller driver is keeping a minimal
> > vote on the PCIe-MEM interconnect path in its system suspend callback
> > current currently. While this gives a working system suspend, it also
> > results in increased power consumption during suspend as the SoC never
> > enters its low power state. So with this change, the workaround can finally
> > be removed.
> >
> > Also it should be noted that the actual fix to this issue lies in the
> > PCI/PM core. But currently there is no such fix exist as of now and the
> > consensus to reach it is also taking a lot of time.
> >
> > So use this quirk to allow users to save battery life on these platforms
> > until the PCI/PM core comes up with an API that tells the PCI client
> > drivers when to turn off the devices.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> FWIW, feel free to add:
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks!

> 
> > ---
> >
> > Hi,
> >
> > I'm sending this patch as there seems to be no consensus so far (as been
> > discussed in this thread [1]) in coming up with a PCI/PM API that tells the
> > client drivers when to safely turn off the devices. Since coming up with these
> > kind of generic APIs are bound to take time (I do intend to pursue), it makes
> > sense to allow these platforms to make use of the existing
> 
> In whatever form you intend to continue to try to move this forward,
> feel free to keep me in the loop. I am interested and will try to
> provide as much feedback as I possibly can.
> 

Sure, will keep you in the loop.

> I can also keep an eye for a conference where we can bring this up
> again, last time we discussed this was in LPC in Richmond 2023, I
> think. It looks like we have some more data for discussion now, but
> let's see how far we can get on LKML.
> 

Ack.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
