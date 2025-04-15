Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC31527B1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724007; cv=none; b=IvxJq+9Pz9X2YBLrECUep887XTGnwnuJtaODnbD0Mv82D7p/4LkwJlctbczDHHXAOSyBu93vtK4Tuelbp0XdQflbFjgtYfta653zKtdDLaIwZ9JfNhmXRvgv5jaK0OsfwL7fUtxJ9ZD6bSmkdU9EQ1ES7h3ITlrxLO8NyB4ouUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724007; c=relaxed/simple;
	bh=ek3xtokJGLel1uaqoh04AFgye1w5Sn7lMzo5cXs8j9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMChCHbIVzWbh5tRSJs4aP0qZPHcErpRkCiNZambENhbU63ZQtnNmMZSCKa86f4eqjJDpOVydgVCszwAwZNAZxpyLMuEWrH/im/jgxUC2zJdxXci9f2MDmJmjjUdA3v+8yjGG/FEqUudmsJzOpp7HDLJYyU33/SPlBd0GFEWfdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rdVPHELa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rdVPHELa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2255003f4c6so56978615ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724004; x=1745328804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kb+FJnw86VvRtE36N+d+X7ug1k6Yvpc1Ae1wFjKr7M=;
        b=rdVPHELastes4u4eSCnFjKQw7B7P1s0RLzwNZABoObyN90lgUr5+TurKQ69r8n2uXn
         MHfg47nAbXTfsR5LSyIwD1VE8xH+d3zDPpD2ftrh6x4rmzAt9GS5lYrfHTFI0GP+MSXs
         iiz+QIzVLYV1dh3p7zlsUdG8PBly9+putZ3XLh5TuK+Hr4FwPcprVneTuvCB78am3MEU
         14kclh2tkbfi05PNLtYeT9P8qihEI01jMm5iSyDogKOM6vjD3fv8PWcQcu6I2t3o4fPU
         oPZ4CNqjtSUHj34t/d6mOxgOn6KLFXI5fgfno2DhBmqZ/wB2M2ykRhUB3oHaeJMZ09eY
         GTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724004; x=1745328804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kb+FJnw86VvRtE36N+d+X7ug1k6Yvpc1Ae1wFjKr7M=;
        b=rNP4XDh/ujKX5sff6ublVWv4O3iVUC2gx5oURUOIkW2Vedm4wPRwFdb7pbQj6nFvo3
         oEJUsAb0ga2ZUncXiK34f82yZdtNL0ffFIJdpmAfMt9WLO3D0I5n2kUSXHLDwZd4cVfC
         S7JzD0Nyn3XJpepPOKRRdM6TVhSMHSnWG/KX3q2JbVblDessTCmMne+sitFUSolO/Qag
         DoA5cvVf2GGKRgGDuZKih5WKJdBUx/e2vzWposjrWylGj2ZO1mq/cJmQ8RkthR0i5XnS
         oaiFr6tzLOoou+9dyyIU+tjVGbPGWW0/HqDFL5+fHX75sN8+OqbZDOHeY8jxoepbXSUy
         8FMA==
X-Forwarded-Encrypted: i=1; AJvYcCXqSrENg9jwj+GJLUBm7LoWOf2prXusQ3oXJKLoKXpJXKJ0aCX/SGYKQq5SwH+rX85dfa73ms1uWxhGtas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdT5Px4Cbc4hJA0ljv+VV4z9bFbWn0Xp7xkgWLreU2F+GfFevK
	O/ySOEtWMSIJuXmfcPyPyB83Skp3/iAzH3X1XgE1V81lwv02NWTJLFVFj3TL8g==
X-Gm-Gg: ASbGncsOzNrEA5MMAQzHHUC2EqsI49F62E3c89BD8mQlYhyCd7FAR9/CyzIaMxjgzmh
	n7k4OYIxhCJeeQ/5Yy5P6/WpEYVTgIJSIVZE/NrTBPSQKjs8Um2N58JlKA5JpclmNwR84ZFB0/a
	YH1RpeL676Elj2NN5MHajYHiZ8ElPRBc+Aifj0LlLuN0u6pGGGIgJvTnkA6sAja1BLXfLruqKZF
	thsVLr+WgKlVRjJOtypdhxSnGQP3bHmP9wXkJOkjgUesjLOsTRLNV6Sw6I4pJSjj2CuF0hVFiKR
	G2fsG52jDI+wYYZPIrfKcXf46VEiDFga8mCp+KzJ9YwZan5q+w==
X-Google-Smtp-Source: AGHT+IH6VniJgzO2ge6ikLonScHc+/MusL7v3em7u0V8pMku3ZWCkwH976lsW0jgobFIzeciiAD5CQ==
X-Received: by 2002:a17:902:f705:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22bea4fdc7amr267687405ad.53.1744724004231;
        Tue, 15 Apr 2025 06:33:24 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb6876sm117199985ad.181.2025.04.15.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:33:23 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:03:17 +0530
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
Message-ID: <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z--cY5Uf6JyTYL9y@wunner.de>

On Fri, Apr 04, 2025 at 10:46:27AM +0200, Lukas Wunner wrote:
> On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > When the PCI error handling requires resetting the slot, reset it using the
> > host bridge specific 'reset_slot' callback if available before calling the
> > 'slot_reset' callback of the PCI drivers.
> > 
> > The 'reset_slot' callback is responsible for resetting the given slot
> > referenced by the 'pci_dev' pointer in a platform specific way and bring it
> > back to the working state if possible. If any error occurs during the slot
> > reset operation, relevant errno should be returned.
> [...]
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -234,11 +234,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  	}
> >  
> >  	if (status == PCI_ERS_RESULT_NEED_RESET) {
> > -		/*
> > -		 * TODO: Should call platform-specific
> > -		 * functions to reset slot before calling
> > -		 * drivers' slot_reset callbacks?
> > -		 */
> > +		if (host->reset_slot) {
> > +			ret = host->reset_slot(host, bridge);
> > +			if (ret) {
> > +				pci_err(bridge, "failed to reset slot: %d\n",
> > +					ret);
> > +				status = PCI_ERS_RESULT_DISCONNECT;
> > +				goto failed;
> > +			}
> > +		}
> > +
> 
> This feels like something that should be plumbed into
> pcibios_reset_secondary_bus(), rather than pcie_do_recovery().
> 

I did consider that, but didn't go for it since there was no platform reset code
present in that function. But I will try to use it as I don't have a strong
preference to do reset slot in pcie_do_recovery().

> Note that in the DPC case, pcie_do_recovery() doesn't issue a reset
> itself.  The reset has already happened, it was automatically done
> by the hardware and all the kernel needs to do is bring up the link
> again.  Do you really need any special handling for that in the
> host controller driver?
> 

I haven't tested DPC, so I'm not sure if reset slot is needed or not.

> Only in the AER case do you want to issue a reset on the secondary bus
> and if there's any platform-specific support needed for that, it needs
> to go into pcibios_reset_secondary_bus().
> 

Ok. I'm trying out this right now and will see if it satisfies my requirement
(for both AER fatal and Link Down recovery).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
