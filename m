Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FBD5C603
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748575000; cv=none; b=EHc8qYLq7D1Mx8R8fNnFtmQ69G5SZDn5QbIFSEALtM+rW8B19VLxxMOZjLq60bC+EEd5dfhncvWcxj95Bj8rKIm9rJRuuhko/r3C4ZgkUX22BQf5e+Oe22f7S0/ilOnetXd4yC9SZZZbre3T4xMSKYp2MXwsXJsegSSbcb9iIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748575000; c=relaxed/simple;
	bh=XVANWFhgXMv40Jkl6FJe26HKPUpKGq1GAb0fbWJTo0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0Z7rp3Fy5f34h5GQ1dNOtPGDNZQGzqT/MRo/uTQrN7q3LNfhVhsnMBBnZBb+S/2485mx9mNrZ3HsYWofEO1Hf4Rr1u3B1rxECYeRMgmdPADIH+5By4BU6wO2O/X0QxOGgcpTOmlKFBmi5AlCo3p29azwAZyNB7ZXR0vlblj+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxEH+XKz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxEH+XKz"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af523f4511fso1287766a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748574998; x=1749179798; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hG2cMyUqEG6RKX+zXxbm5GFZDNa/fK0gHsKi+Pje0cY=;
        b=sxEH+XKzJEKHZm0P6h5RQS63CoSgTtrMbEm+J+20svx1J+1i6UpiiRIeqf89fBT2kO
         KYiarMEnw+5Sz00oOlCqoy2Z1xgc/8urVNRk1xqlFGbUvwqyHa5OR7TRbRAQjWfclhpC
         WGNdqwEo66R5JiW5hazmQFv1c/MvRjIqBLAAcJ2yopLTCNgWR+WIB+wLEAhIqT54xQUG
         dLt5xYmdmA3U5Tiiqv8E2FejE8KcWqwei9A3yBc2k9o8QKcWlIo+O05SCWoeps0EhvGQ
         6Uq745VVgRxYkcPv+U0BscwoC7WRNC1gBtExEsDNPyMFDKa1V5DpAldcJGw9xz80tin4
         IVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748574998; x=1749179798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hG2cMyUqEG6RKX+zXxbm5GFZDNa/fK0gHsKi+Pje0cY=;
        b=Y1Nkq0cd2WWKZntFSsfQLtBZvdVwQGq1IyijyEJgFb2i0dBQxjVqrZ+PrnFMgdDZ0J
         hTNl8B86OI5PFo0vcdwtEvM8rf7d1mHE7/yi/j/+BfYttni12lepQLdAhOYKVdvd+68B
         0tvNbnEIDDS519pthMVnTURNhTzvf8P/m8073hagKy8NHHJ41rQg9SkWDfkfurV4uqRi
         wEpYvKlcXzPvfAAYYWpd/2+F3Wyjj4vgr47/9HE6YabWSH3abuu8/pH4p2Lpe9UPyMY6
         17plsOLNx8VpSLdg1egDrUR1NmdyvBSMCE0FuQWxVL9QMl3pWYcXtitPIfevZMVpVjN/
         LlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Csbuvwf4We0ZOqEFMyNLyeRqxXnSb366ZdVK6TMbfLU4D3Umu6jX1DbiFhqgcmnais+IRu/WQC9wxeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zzXxq9ViT/khLVsvQUyi53JqQCshgGUXky2aSt4mr+fATbLg
	LMk50SqnL8Uhsiil51pvBXYUQRCaVM1QriCJeatmPWOvpUq9x7isqdZlt0iUcAbpOQ==
X-Gm-Gg: ASbGncvX7Q6F7ppZFKe4IPpFIojMAXf9WrZZtsv4c7C8k92wCV3/TeHetrRglZa87om
	EmL6VKp0xDcrf5320e3oKKTuaEOzphjY29pFZkkLnVaH5lVmxgBMeL4wv99sxJys4/7nY2yBoYl
	aXQlGgovTafcfUqDOZTCeORkhvLundN6sDUZScg5gbN1g36/6GGUsCmsBN0Z4dMVnKdUnHJqHFa
	7Bw0zUZ9MjWslGYavOTwTyFXgJcdwMmRBo+/4P6mGB4vUFgK6fsf8pvo5MZoTNXUSbpfCyVjezT
	4kLihXjbrHryjM4bFRvm7RuYz8MZxT8cuJcScgv02FJTiwKD+6EQL5BIITJylA==
X-Google-Smtp-Source: AGHT+IEEn8LVklbjuJd3wJMpBvcIz8GKfwJW4nlD2EaqRmi/httRb+A8B1jCr1nfQUSFXjBRRKtNHA==
X-Received: by 2002:a17:90b:3f10:b0:312:639:a064 with SMTP id 98e67ed59e1d1-3124198adefmr2623680a91.28.1748574997839;
        Thu, 29 May 2025 20:16:37 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1e9103sm267399a91.0.2025.05.29.20.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:16:37 -0700 (PDT)
Date: Fri, 30 May 2025 08:46:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-pci@vger.kernel.org, Cyril Brulebois <kibi@debian.org>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/pwrctrl: Skip creating platform device unless
 CONFIG_PCI_PWRCTL enabled
Message-ID: <otrstq3g55ddtlbelzgyirpt5ahfirgkhrrietyrgbhxbueiwp@hyu4pgj6m4eo>
References: <nt2e4gqhefkqqhce62chepz7atytai2anymrn6ce47vcgubwsq@a6baualpdmty>
 <20250527222522.GA12969@bhelgaas>
 <CA+-6iNwo54tp4pvUGHXYjbV8sT6FWhSrd2k4pDJgtUGQWYhGXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNwo54tp4pvUGHXYjbV8sT6FWhSrd2k4pDJgtUGQWYhGXg@mail.gmail.com>

On Thu, May 29, 2025 at 03:23:29PM -0400, Jim Quinlan wrote:
> On Tue, May 27, 2025 at 6:25 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Sat, May 24, 2025 at 02:21:04PM +0530, Manivannan Sadhasivam wrote:
> > > On Sat, May 24, 2025 at 08:29:46AM +0200, Lukas Wunner wrote:
> > > > On Fri, May 23, 2025 at 09:42:07PM -0500, Bjorn Helgaas wrote:
> > > > > What I would prefer is something like the first paragraph in that
> > > > > section: the #ifdef in a header file that declares the function and
> > > > > defines a no-op stub, with the implementation in some pwrctrl file.
> > > >
> > > > pci_pwrctrl_create_device() is static, but it is possible to #ifdef
> > > > the whole function in the .c file and provide the stub in an #else
> > > > branch.  That's easier to follow than #ifdef'ing portions of the
> > > > function.
> > > >
> > >
> > > +1
> >
> > I dropped the ball here and didn't get any fix for this in v6.15.
> 
> :-(
> 
> >
> >
> > Why do we need pci_pwrctrl_create_device() in drivers/pci/probe.c?
> > The obvious thing would have been to put the implementation in
> > drivers/pci/pwrctrl with a stub in drivers/pci/pci.h, so I assume
> > there's some reason we can't do that?
> 
> I was wondering if we could confine PWRCTL/_SLOT to work on a per PCIe
> controller basis.  For example, if we allow the port DT node to have
> boolean "pwrctrl;" property, it would direct the PWRCTL code to
> operate on the regulators within that node.  This would allow
> CONFIG_PWRCTL/_SLOT and the pcie-brcmstb.c way of controlling
> regulators to happily coexist.
> 
> One could argue that "pwrctrl;" does not describe the HW as a DT
> property should, but I think it should be considered nevertheless.
> 

No. There were a lot of attempts previously before the advent of pwrctrl
framework to add a DT property for powering the devices, but DT maintainer
clearly said that there should be no DT property for this purpose. So we came up
with this approach.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
