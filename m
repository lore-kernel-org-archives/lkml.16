Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D8222594
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876489; cv=none; b=p8s+u1WF7n4NwUGtQE2eBboiyug7uRLIBbarlx6tB6YTGn3woskc3pnDHfc/WViqalFrwtj06lKYp2I5rMaFzhhx9EwbqGN7wZ+kBVkehZMSZ1KPMNIWlkr5b2DrLTzv4hddwAssqOzRwqCuwZcNG6lCF56/epTrkLJbXhrOrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876489; c=relaxed/simple;
	bh=G2wbLDTBuDuot2uMyXXKGIFRZm9zNrwNLtVXgIYuceY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGthPzaetSjkilANooes+AIJjyVETfOKcIlWLXmus7lJE06fMH3OsOI/y+YZZL+bZi41sDxcuQJj29irrWeG3D8nVcDp1eKA6QZRYY9qqfOEQxV2hxLo7VMuPSdmmBmrImQR2wXxie47r+sheAOwiw22qBaq3nDPK1+3aus34ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wG9uc4w3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wG9uc4w3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30332dfc820so468244a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876487; x=1745481287; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=wG9uc4w3y66E0GeVCyjISU03ftpy1Q4tEfO80mk3nz3WtZxabOH5DE8yzgmeWzUDCx
         re5AEW+yeJ9kUF/ZOFgPVI/xWVx8TcHBrgZ5VAOwCwdisvE6sa7VK9EIcbx/iL2vP+BV
         fkveyoWcQjoQvpFRKFWxftTOFlA78J9y9k8J0ArDDwxyShJrc/GKWoubCzekyyTDTCqT
         EAsnv4WAoz0bpBQp4IUgZ9pEui+TBni1434iSzPvj4bVYAn0Za1eYWyeVWw99285Eo4V
         XFaA3z4B6so7vtKL7Fo5ulqcbhI3wpiCNM5Y2jHM61424hwtZSLFtMtWKOuB1j912qv+
         Bffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876487; x=1745481287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=XSaLhcKkEnnArkSfPa8SMBSnmESP1b498NofoGiyPTAk+vI14Uk+eM5KIZqkOaLvNY
         ZMNcQBMK+Nlag8dU5AyMH09vY3H5jOLZSCkpczWVyF/9OfSu+/xdj1QB3Vs3pIQwumyI
         aRkoAcgp0rnOscT+HE4u7aq0C6M0UwN83bUxw6UEtRsG6fM+OLcuy3eLYvBjfs8Fdeo6
         m7zdJ7gpq1RICtgAXU47JMYvZ6kAGIzCQU5naSc6pbD6FWnlRAf9W1cjpcXqdcLItp+z
         mVsKMDMqli+kX2FK28fZAV48ZR54jVHyKZF6rQgSjf0fSCZg6PnolZD3q0yuzyUJozq1
         2Weg==
X-Forwarded-Encrypted: i=1; AJvYcCVqGBcj6B/NQuXcBS90lph70bdkJGxlKB/5azcl3grxRMwoYt0T2BX0WwwLM0tyGFZ+ApfzVaQ1ch2iric=@vger.kernel.org
X-Gm-Message-State: AOJu0YycSYSmIWlNv1l50C5E4CcztPqjBR5LS+ENS7h+6HEnrmA6HyUM
	3ktQoOkuZQ3xOIufJ3S05o1DoZDr602L0dFaBTfqnLZWKvtnFhvtgIl+Ve2yFg==
X-Gm-Gg: ASbGncuUY19lAccwcRMk8K+zlg0zdp9mH7Fdqulzz+s6MabE9Z0AV7IBHtD5jN/q6dB
	CPceN7QsjhUj4LDvQczN27X7FmkgG6j9CuU+1ew65NA8Mcx4uGp4zRLUDpF1ubRshon7IOoStqH
	0VwDaNdTuy4liRbOOpY8qSyErp9OyaSQ/m8Iie4YOrWV41jSvAP1PbKYqQPM8dqZpl9oLract60
	EtFEztF9l0fSGfgAxyS+35IDuTFgOHO6ssc6p0VuoT2B6sPREHxg9aAbAlFsfGrSRiul3QUFUXh
	+bHHYXVGqPZ9Rz24uMo1v/9L5hb0AulJBSRl3qvDrqwEN1Jy
X-Google-Smtp-Source: AGHT+IHr4TLOn+vWmMUG8we+6H82JH3XHC68smquEz0SW0g3spOjs92CiF0f680vTLzBzdTTUPC87Q==
X-Received: by 2002:a17:90b:5824:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-30863f19571mr7527508a91.13.1744876487050;
        Thu, 17 Apr 2025 00:54:47 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2f13sm3318363a91.36.2025.04.17.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:54:46 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:24:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>

On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pcie_do_slot_reset() will be called for each slots, which will reset the
> > slots using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> > 
> > In case if the AER support is not enabled in the kernel, only
> > pci_bus_error_reset() will be called for each slots as there is no way we
> > could inform the drivers about link recovery.
> > 
> The PCIe endpoint drivers are registering with err_handlers and they
> will be invoked only from pcie_do_recovery, but there are getting built
> by default irrespective of AER is enabled or not.
> 

AER is *one* of the functionalities of an endpoint. And the endpoint could
mostly work without AER reporting (except for AER fatal/non-fatal where recovery
need to be performed by the host). So it wouldn't make sense to add AER
dependency for them.

> Does it make sense to built err.c irrespective of AER is enabled or not
> to use common logic without the need of having dependency on AER.
> 

Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
DPC driver itself is functional dependent on AER. So I don't think it is really
required to build err.c independent of AER. But I will try to rework the code in
the future for fixing things like 'AER' prefix added to logs and such.

> Also since err.c is tied with AER, DPC also had a hard requirement
> to enable AER which is not needed technically.
> 

DPC driver is functional dependent on AER.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
