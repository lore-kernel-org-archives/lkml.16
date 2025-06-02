Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23419924E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845760; cv=none; b=jOIzRyOMitiEApCTK/BbDJEOv7AtyNHKQRf64V2HfUkF9mHGd1cwg92Hz3zzPI599MV+m7s1yJNd0JQ6YdCDQkze0osjB/vv5AfEGeKHjaXef/FyG8tisXxwXRqSp4TV7JEE/F5rZqxiRimXhMG/kICNzk6SRqcrafbi7DJMPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845760; c=relaxed/simple;
	bh=E+SQoAnccRz/KoH4Y5O3thh2KGLR0mDj1gtwthOEJy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdDsiW3zQnmngAmMLTPy/KxrtfmAY//2CdKWdUdmaFYOadiE2pV++8tOjorVPEgzPvRZNwUQ7MXB7gJK/whbu5mSm6GUpRtZD9kHihBAb/Uf4txNxwEVlxqVAqnLQ9FojDo8GCA/Q4QAqdZH7i23nOZQRCZ0B6HzCpmtWEJMla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GH5ssrUm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GH5ssrUm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d366e5f2so51810665ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845756; x=1749450556; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jlrRp4TuMS0KMF0pTkra7PYNbVvzO12XDEsiGsNU3Vk=;
        b=GH5ssrUmkvvzN7/RmL0IbbkHtDFuI8iQ3JCd/v50brjatmnm9ibsJnTo2GFpdAWBde
         gl79NLrmSCSkjds0Q1OpmYJpmTIKxjJrdQR9gYaZEXmd6wJh5yZjoOyx/5B/YuwT4koL
         V9yQG8DK8KOqYaAjPuV0Bvjcfb1DyoXLp6tCtT+1njHr8y2h6EUnG01aw3pYEyyEUvns
         iC6M/+U0ljKS7+3BHFk5pP4hwvw6dKWFaPBEFojofrFSqBFAfT/d1AFrPb94fKEMmlmG
         uEor/F6TkLxn2SVMlCkVJz3s4dmheFYRZH+ZURNlQ+yMSuziHp63wpFW7JVWpur+0evs
         TAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845756; x=1749450556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlrRp4TuMS0KMF0pTkra7PYNbVvzO12XDEsiGsNU3Vk=;
        b=jIJl4sgqmTk5l6QeOVGxPKSzwyf8LU6bxte1V3StpDBFj9e85Q6rrSu5u/XnAclHdP
         fglqg9nnEqtJDtCmlDwwR8c7aRP1u3RGA0F13QOxxyfaSxY0PpjwTlxrf9BS+dRI7hXw
         jrxHILW4kb/OAwy8+bqI8L6eVERU6wlZSmwmjDv62Pm6y/AILK+RXa2nCu/DFHRmx6Zx
         +hAT0kcwUz21D6JEATgVZZTjqkKUWSPSG4soQEcoeD9lV1RfNZ61R8a32xNqMJ1laFGk
         8xkS4V/uIlBpvRIq2WyxsuM+0cFfefAx9CxnbnObQ7uPyfdD1f7IG42LwPhtIy0xfUjw
         K8IA==
X-Forwarded-Encrypted: i=1; AJvYcCU3okSdjiPDC/uFufypiDf+B3bJqX7PFVp7osLJpsvnJ5RseY0PCm3pvQdy13bvJSNX/A+mll8e3Fca1u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM22xRuWn26ocASlCHNKD4PFDmzsipIDgWAtxRYjnlAldrxvrk
	lcX77KanpZt5KfIP/CL8pYetCtEJGn1Uy6Wpw+RvsW+CyXNYkq2fDw67AGsFPWx4Ag==
X-Gm-Gg: ASbGncuuyeBiDyOvNeZOWqaIyGryqMOFr1ulvD0ELqxQUG9cpJDa5aidR0sG0uY/BHF
	FqhuHAe6Wnqy/IuBPLCnNGPAm1EeMPiG7td3FuBMh2ycZq/16nmbZrBmPEdH5mfBV1yyltMB39r
	uO4zWkfUXbNHO/BF7ZMmGvDQIcjn/KDq2RP70qEIzGMfZmSLn6yAG7GJCoMtIDvi1xhXzKPwWZl
	ybnMNzgeYbhAt/iEcocnGHqpV9fJk/hyit7Bwl1wRG0LnEuUwGFSZ4FvJe216/bWMlz9IXkxeyG
	GNkSVHrUbYZ2yXxIcTE6WBV4MRr7UQtNwTaK09P8i8yv+7QGDQKr33tKKktYdfG/FgafgDhk
X-Google-Smtp-Source: AGHT+IEGUkykHIXPq8r3wZozZPyQxM0wbptjLj0o40QPDDSWAMj26UWcej7zbg4yqxmWIQ2cKGSbHQ==
X-Received: by 2002:a17:90a:da8f:b0:312:1b53:5e9f with SMTP id 98e67ed59e1d1-3127c850853mr11447234a91.24.1748845756106;
        Sun, 01 Jun 2025 23:29:16 -0700 (PDT)
Received: from thinkpad ([120.56.204.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3d8dfcsm4904950a91.49.2025.06.01.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:29:15 -0700 (PDT)
Date: Mon, 2 Jun 2025 11:59:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] PCI: Add Extended Tag + MRRS quirk for Xeon 6
Message-ID: <6t4ahnarwfa6xzhmdnhv2tzwrd6w7lincrjfwwwpr7xcpvityd@g7ypm4olmk7n>
References: <20250422130207.3124-1-ilpo.jarvinen@linux.intel.com>
 <xwcoamcgyprdiru3z3qyamqxjmolis23vps4axzkpesgjrag4p@wnp63ospijyw>
 <45809733-1e02-0109-a929-3cdd6c960646@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45809733-1e02-0109-a929-3cdd6c960646@linux.intel.com>

On Mon, Jun 02, 2025 at 08:10:42AM +0300, Ilpo Järvinen wrote:
> On Sun, 1 Jun 2025, Manivannan Sadhasivam wrote:
> 
> > On Tue, Apr 22, 2025 at 04:02:07PM +0300, Ilpo Järvinen wrote:
> > > When bifurcated to x2, Xeon 6 Root Port performance is sensitive to the
> > > configuration of Extended Tags, Max Read Request Size (MRRS), and 10-Bit
> > > Tag Requester (note: there is currently no 10-Bit Tag support in the
> > > kernel). While those can be configured to the recommended values by FW,
> > > kernel may decide to overwrite the initial values.
> > > 
> > > Unfortunately, there is no mechanism for FW to indicate OS which parts
> > > of PCIe configuration should not be altered. Thus, the only option is
> > > to add such logic into the kernel as quirks.
> > > 
> > > There is a pre-existing quirk flag to disable Extended Tags. Depending
> > > on CONFIG_PCIE_BUS_* setting, MRRS may be overwritten by what the
> > > kernel thinks is the best for performance (the largest supported
> > > value), resulting in performance degradation instead with these Root
> > > Ports. (There would have been a pre-existing quirk to disallow
> > > increasing MRRS but it is not identical to rejecting >128B MRRS.)
> > > 
> > > Add a quirk that disallows enabling Extended Tags and setting MRRS
> > > larger than 128B for devices under Xeon 6 Root Ports if the Root Port is
> > > bifurcated to x2. Reject >128B MRRS only when it is going to be written
> > > by the kernel (this assumes FW configured a good initial value for MRRS
> > > in case the kernel is not touching MRRS at all).
> > > 
> > > It was first attempted to always write MRRS when the quirk is needed
> > > (always overwrite the initial value). That turned out to be quite
> > > invasive change, however, given the complexity of the initial setup
> > > callchain and various stages returning early when they decide no changes
> > > are necessary, requiring override each. As such, the initial value for
> > > MRRS is now left into the hands of FW.
> > > 
> > > Link: https://cdrdv2.intel.com/v1/dl/getContent/837176
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > > 
> > > v2:
> > > - Explain in changelog why FW cannot solve this on its own
> > > - Moved the quirk under arch/x86/pci/
> > > - Don't NULL check value from pci_find_host_bridge()
> > > - Added comment above the quirk about the performance degradation
> > > - Removed all setup chain 128B quirk overrides expect for MRRS write
> > >   itself (assumes a sane initial value is set by FW)
> > > 
> > >  arch/x86/pci/fixup.c | 30 ++++++++++++++++++++++++++++++
> > >  drivers/pci/pci.c    | 15 ++++++++-------
> > >  include/linux/pci.h  |  1 +
> > >  3 files changed, 39 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
> > > index efefeb82ab61..aa9617bc4b55 100644
> > > --- a/arch/x86/pci/fixup.c
> > > +++ b/arch/x86/pci/fixup.c
> > > @@ -294,6 +294,36 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_MCH_PB1,	pcie_r
> > >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_MCH_PC,	pcie_rootport_aspm_quirk);
> > >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_MCH_PC1,	pcie_rootport_aspm_quirk);
> > >  
> > > +/*
> > > + * PCIe devices underneath Xeon6 PCIe Root Port bifurcated to 2x have slower
> > > + * performance with Extended Tags and MRRS > 128B. Workaround the performance
> > > + * problems by disabling Extended Tags and limiting MRRS to 128B.
> > > + *
> > > + * https://cdrdv2.intel.com/v1/dl/getContent/837176
> > > + */
> > > +static void quirk_pcie2x_no_tags_no_mrrs(struct pci_dev *pdev)
> > > +{
> > > +	struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->bus);
> > > +	u32 linkcap;
> > > +
> > > +	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &linkcap);
> > > +	if (FIELD_GET(PCI_EXP_LNKCAP_MLW, linkcap) != 0x2)
> > > +		return;
> > > +
> > > +	bridge->no_ext_tags = 1;
> > > +	bridge->only_128b_mrrs = 1;
> > 
> > My 2 cents here. Wouldn't it work if you hardcode MRRS to 128 in PCI_EXP_DEVCTL
> > here and then set pci_host_bridge::no_inc_mrrs to 1? This would avoid
> > introducing an extra flag and also serve the same purpose.
> 
> Hi Mani,
> 
> Thanks for the suggestion but it won't work because this is the Root Port. 
> The devices underneath it need this setting so we cannot set them to 128B 
> reliable here (is there anything that guarantees those devices have been 
> enumerated at this point?).
> 

I was under assumption that the kernel would honor the Root Port MRRS value
while setting the device MRRS, but I was wrong. Kernel just takes the MPS
value (but that considers the Root Port's MPS) for MRRS and scales it down if
the hardware doesn't support it.

So yes, setting the Root Port's MRRS would have no effect in limiting the device
MRRS. And I believe, Xeon6 Root Ports doesn't suffer from same 128B MRRS
limitation for MPS, otherwise, you could just set Root Port MPS to 128B and it
will make sure that both MPS and MRRS of endpoint devices will be capped to this
value. 

> I've v3 already prepared which uses the enable device hook as suggested by 
> Lukas. I'll send it soon.
> 

The callback is supposed to be used for performing enablement steps required by
the *Host Bridge* devices, not Root Ports. So I do have a concern to use it to
address the Root Port quirks. That's why I thought of limiting it to the PCI
quirks.

But feel free to submit the patch. Let's see what Bjorn and others feel about
it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
