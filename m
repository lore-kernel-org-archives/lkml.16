Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FD1C4A10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815870; cv=none; b=lY/n6V2CTogsOV+1NBhRfEb3uOZd2l9TOH0LmA09bnnKlbPyoEvoP7mOQKGqNfab+5LBj4H3rM3cKqeYhc9960nlhdahE6ekW7uDusVK6aJnqknFhgC1mu2+Vg9gcMFJfxX+bSHknq67x8/y6a86dL0MkJewbL3/jBy/dTzn5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815870; c=relaxed/simple;
	bh=EFuzooIfLCsjOofu0bOd+t/uEt0Xb2K3xAAPKZW9FK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJEuBIzwUSuCXILsEc20/75vpIRWdP54Md2DOcHcVxDFFM7F0BFBCiw5X9jksF++8wU5HlFzsBcO0Yh7NTOD9FpPTEqx//J/KH32fmxHKooNTaqAEQKHgllpUKYSc6SdolZf4YD8VA43ldEUpaEgwrfiPF72QaumYNoazQHl48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1lsu1tj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1lsu1tj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso7739701a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744815868; x=1745420668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nfVG8rZrRwVZOKz6TlWppVwoQCGAxCeOOP1j7MIZGRw=;
        b=k1lsu1tjnRrr6CJQ5miPePeaCRTHTwmtgDx8thwYYoZml2vf78q7fkmohu1cUhNRPo
         ZuZ6N33mYpallPfps/SvUmc1hZwsDlxJs4DSt7ou3WpZ9cKr2qpzZU0myrZFmj9403cD
         HtfnqZfCtJxOTbh7heLhMTtugw2P2hIOF5TOb2KZgBb0WQVq54bmCIKIYtmpLc/97Dvd
         9v46Zoa0UjjnVHq6226NZnucyM5gMTmc9JEyIzNYJVGAj4P9D580NoMe6ET/PqAQdAjS
         NjAlPa18DPRpoVPkM7olNDuRZ/LHpdDcm6uAawbVnEnT16fC82ASI95q77rnZB/XOJpH
         YD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815868; x=1745420668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfVG8rZrRwVZOKz6TlWppVwoQCGAxCeOOP1j7MIZGRw=;
        b=V4uvfBHnd78gm58IqAxUs2VG/0lJFVYndJAng98YRREvWWhhh4JPFvzndOqiKDu7s9
         NAKQso0D6D4ioDGndG39fGUva7sdh9GUktgav4LjlShEoGK7EwemOiFgL5htfgwT2+6D
         B5/zCJuAFUehkvxdfbKlFJfMqGmbBhzKNHClf8xJ7lZXoAeooMez0aHrW1QrD9xDKThp
         CsLlCuUwTShG4gtAuW7n/UrQEUEnf1XNMewqePv1lZk/Lk381p+ZtifuGZ1UPRQBly0c
         znhUUbmkg8PFGp1SgZ/QKrQpz95A5oO4xPT0J8tRcaJYF8gLWJJ1WEwJuHrtA55quENM
         Sb5g==
X-Forwarded-Encrypted: i=1; AJvYcCUSld9/+8Ek12QrzZbZOmJqyx9G2svf+3hptKQvSNDouWtSYcJhG3TGFdNX8gFyyBYIrRHxXHExGw55HxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbr3I9zyTTFTPpkvJnuofjC3qgmIYUBVXan21OF56d+XeBaWJs
	DuiJbRvgOWp2DBmFe7MHSiKVWTHuPTruQtXe3hW+1PT18IvqbV8ysqEKtPKEzA==
X-Gm-Gg: ASbGncvM2ayMh9jpPkOgj1ThdU5zZ0L/nCCHSrVzqKe8ee1Mt66wU8SZ77Ig5lwEwEg
	broZ6XDHKfpIccJnv8jHfia7/lhZaFQCebmu18IRzdsC4FtqWL15shvnJBHw7ogDKyzH6qvSbOx
	/aIsiMmqUtXY0+fbQbNMen4A3jNXNgLeFQQ/LM4lBdZ+aSRl1DtvIg762SfKAyMl0YdTF5n1Yfm
	G2YFmOeT/Z/pJK9RU/poMpCJxr5MsUzxc9YzHZpTcr4Q9UW3JxJ9IXNrdvcC8GDeRWulMEEMRiL
	+jcMAsYclfSuc3ZOICuSIIpK6oFHYMgVh2YI6YowqUOWHO2x9to=
X-Google-Smtp-Source: AGHT+IGhtyNmiMmaDXqhLwWa1sShCSn/DUyQsAgpk7UXgCpMw78TMynnnA2HPDDqv4w0w9QstcvPGQ==
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-203b400cfdfmr2815792637.41.1744815867897;
        Wed, 16 Apr 2025 08:04:27 -0700 (PDT)
Received: from thinkpad ([120.60.130.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220a988bsm1391403a12.14.2025.04.16.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:04:27 -0700 (PDT)
Date: Wed, 16 Apr 2025 20:34:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <rrqn7hlefn7klaczi2jkfta72pwmtentj3zp37yvw3brwpnalk@3eapwfeo5y4d>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
 <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
 <Z__AyQeZmXiNwT7c@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z__AyQeZmXiNwT7c@wunner.de>

On Wed, Apr 16, 2025 at 04:38:01PM +0200, Lukas Wunner wrote:
> On Tue, Apr 15, 2025 at 07:03:17PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Apr 04, 2025 at 10:46:27AM +0200, Lukas Wunner wrote:
> > > On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > When the PCI error handling requires resetting the slot, reset it
> > > > using the host bridge specific 'reset_slot' callback if available
> > > > before calling the 'slot_reset' callback of the PCI drivers.
> > > > 
> > > > The 'reset_slot' callback is responsible for resetting the given slot
> > > > referenced by the 'pci_dev' pointer in a platform specific way and
> > > > bring it back to the working state if possible. If any error occurs
> > > > during the slot reset operation, relevant errno should be returned.
> > > 
> > > This feels like something that should be plumbed into
> > > pcibios_reset_secondary_bus(), rather than pcie_do_recovery().
> > 
> > I did consider that, but didn't go for it since there was no platform
> > reset code present in that function. But I will try to use it as I
> > don't have a strong preference to do reset slot in pcie_do_recovery().
> 
> The only platform overriding pcibios_reset_secondary_bus() is powerpc,
> and it only does that on PowerNV.
> 
> I think you could continue to stick with the approach of adding a
> ->reset_slot() callback to struct pci_host_bridge, but it would
> be good if at the same time you could convert PowerNV to use the
> newly introduced callback as well.  And then remove the way to
> override the reset procedure via pcibios_reset_secondary_bus().
> 
> All pci_host_bridge's which do not define a ->reset_slot() could be
> assigned a default callback which just calls pci_reset_secondary_bus().
> 
> Alternatively, pcibios_reset_secondary_bus() could be made to invoke the
> pci_host_bridge's ->reset_slot() callback if it's not NULL, else
> pci_reset_secondary_bus(). 

Yes. This is what I now tried locally as well.

> And in that case, the __weak attribute
> could be removed as well as the powerpc-specific version of
> pcibios_reset_secondary_bus().
> 

I don't think it is possible to get rid of the powerpc version. It has its own
pci_dev::sysdata pointing to 'struct pci_controller' pointer which is internal
to powerpc arch code. And the generic code would need 'struct pci_host_bridge'
to access the callback.

> I guess what I'm trying to say is, you don't *have* to plumb this
> into pcibios_reset_secondary_bus().  In fact, having a host bridge
> specific callback could be useful if the SoC contains several
> host bridges which require different callbacks to perform a reset.
> 
> I just want to make sure that the code remains maintainable,
> i.e. we don't have two separate ways to override how a bus reset
> is performed.
> 

I think we need to have the override in powerpc anyway. But I will move the
'reset_slot' callback to it and get it called from pci_bus_error_reset() (for
both AER and Link Down).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
