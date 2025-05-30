Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F11662E7
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748574794; cv=none; b=pv3RbeU5R2+f9owxyjAaN7XGjfmRUS2/JZFZN5JcFkFPG5a5k/SrYPp0t7yZ4pTW7Nknd4eMTsRNoVMKYBdSX6Kb+P7kneU1VF4hbopLZa/CEWjyMqjq6o/YMWw6NA0Kv1MwH7TgoEH8lx3DlaQmpXhJym14iaNrhs11h0+f3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748574794; c=relaxed/simple;
	bh=wjaoZAmbH6sgCZnO1eKlzeSIJW3PNHdGlp3qm3MddRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxv9IIB10rNdxbKSCVAapvcp3jpo+RN46GHAOIFn1NhFr1eekBjoKgI7k27UqK9w4L9kJMOq2seg1MMITZ6TartNCqrV6dbVfbnbSuslIKlDYyKqrOaD3Zw8RdRudMS+/4T95rn7k0vH43/dzV6y/nLOPkKK7iPocDWxQLhlRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOqcLmnd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOqcLmnd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2353a2bc210so871315ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748574792; x=1749179592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+DPZC1n47L/JnKL6zmQew4sn71lUGxtinjfwrD9vf0=;
        b=WOqcLmndAkAcFugUJ5fzo13csOo72Lkf5bVisG8Q0/FBaUJhe6skj5vf/B/G+44eWl
         TLslrRUaxxw7E3S27M6OYlHfd0RTU2V4gtfQFtOafMWbSlsqtDiNl4cE1wdGPnIyf3e/
         qLH9ScgtzEnAl07i+m89rIRU5heDvWtWV//2WaM4igi+aY6UE0OOXle5p95ldGDUzZOc
         fkSCBJrmGjbql22PiEWUehU+Sb+vgQOTHpYqFJfrWUxUOeJIWEYstSZ4kvFqYO4zk1gq
         kSXA4kj0PR0ll4qVo016WHvxNb505XTXZaNrq/tWOwGhVObNlbaLoTDZTeoLmYd25IGj
         YO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748574792; x=1749179592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+DPZC1n47L/JnKL6zmQew4sn71lUGxtinjfwrD9vf0=;
        b=g0dnPQLtN+6pC5GsySBi5oeoEuZXgTynHqoqMw5YWAJ0fiftEl1ddlQPg+SrJlVIGC
         sd9o4q9i4M/uqhmWPFm0Vd+DYYxNipwGS7ch1QUnrR692qgeOLoxJuO4sDaUKoqY7/Qq
         rai5sQBrQ/I1LXQ1ud06TVjrMpGpwmbZYY9Sc1xhleOYZ1tCkoWVKL8eWhz4efijjxKS
         bWjzcx5/ES9v1Cgy2rhpWSC2WP8vTRfpcqAf6zLSpTuD6/APbrW/x4ld+Ho6+A2T3RQE
         huvFy7hvRvKle5ioGlQFVWZPDvlw0GBKHsNlDCroorfQXXQ7sbsTsbBm5Ato4fJFE433
         F2bw==
X-Forwarded-Encrypted: i=1; AJvYcCUhay1BnNwlGJ7XlLwYnwTCyX+2/yz8Jdwb1tFo8ZEN5+UFnWIqjoA5WtVV0si+mU9laW+ns9kNDk56UnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrpB5bTO2JR/JP/z+LA9wQ1QQ4gLJryEK2HSNDlv04r817XDA
	fetzr9IRVP/eLIHkI9dZ/eTJm0eugKp1F9ripl7Xsfa7v2Rt+j6MdYuTidFcOwt9Yw==
X-Gm-Gg: ASbGncv7Euah7/gNQZxvV4C8vm7MTmIdnRITJJ3eGYSVMSNoOz4/pLjw7yRlfHgz09m
	rydQuHB2EkCtvndrpxIjTFJ/bFduHBcyPIUgZxmv4iRu+JSd6CV/JGDTAHomrOIUn0gdXhGcrvM
	4UHOAbrZi5m4rd6YHxm4kWN86Rrno78SKhP0nD7fSXhQW9ZdurLKbidmlPrZduyt30ZgxQW2ffn
	WA73ts+N2UD7N5mCLF0KWFDRILvIl8dzQsAKZoA85ntvRhFz1fJr70VHSElkNsBvIe2EsJiIayi
	PlhyZMRWgsP6/RzY7qQKhRBRHhSt1Bb25wa5kox0Q4uuFvWAVUAo29y4Do4nmA==
X-Google-Smtp-Source: AGHT+IHV4IkY0i9cUrY7xh6Q0CSYoJYenoRdU0u9vfUOZ6yaj5pqiEraof9TCcZDB0o6anzhNBG2Pw==
X-Received: by 2002:a17:902:da47:b0:235:7c6:ebbf with SMTP id d9443c01a7336-235396b7f6amr8116355ad.35.1748574791920;
        Thu, 29 May 2025 20:13:11 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd89e4sm19118435ad.54.2025.05.29.20.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:13:11 -0700 (PDT)
Date: Fri, 30 May 2025 08:43:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
	Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof Wilczy??ski <kwilczynski@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jim Quinlan <james.quinlan@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/pwrctrl: Skip creating platform device unless
 CONFIG_PCI_PWRCTL enabled
Message-ID: <txhlqciq5zd4uilon3cnt7ao6as3llle3oachgudzfj5bka577@6mteq4zsvj34>
References: <nt2e4gqhefkqqhce62chepz7atytai2anymrn6ce47vcgubwsq@a6baualpdmty>
 <20250527222522.GA12969@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527222522.GA12969@bhelgaas>

On Tue, May 27, 2025 at 05:25:22PM -0500, Bjorn Helgaas wrote:
> On Sat, May 24, 2025 at 02:21:04PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, May 24, 2025 at 08:29:46AM +0200, Lukas Wunner wrote:
> > > On Fri, May 23, 2025 at 09:42:07PM -0500, Bjorn Helgaas wrote:
> > > > What I would prefer is something like the first paragraph in that
> > > > section: the #ifdef in a header file that declares the function and
> > > > defines a no-op stub, with the implementation in some pwrctrl file.
> > > 
> > > pci_pwrctrl_create_device() is static, but it is possible to #ifdef
> > > the whole function in the .c file and provide the stub in an #else
> > > branch.  That's easier to follow than #ifdef'ing portions of the
> > > function.
> > > 
> > 
> > +1
> 
> I dropped the ball here and didn't get any fix for this in v6.15.
> 

That's unfortunate. Let's try to get it backported through stable list.

> Why do we need pci_pwrctrl_create_device() in drivers/pci/probe.c?
> The obvious thing would have been to put the implementation in
> drivers/pci/pwrctrl with a stub in drivers/pci/pci.h, so I assume
> there's some reason we can't do that?

I assumed initially that pwrctrl dependency would always be there with PCI core.
Since now it is clear that we need to build the function conditionally, we could
move it to drivers/pci/pwrctrl/core.c with stub in drivers/pci/pci.h.

I will submit a patch for that.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
