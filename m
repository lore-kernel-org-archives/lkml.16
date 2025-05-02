Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF13D6F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209139; cv=none; b=t2yWtOTHn7iOhlI6s8gecQ1uwmOyLEi22bxZf4iZ857Spg7AST2rKYry6eoEPYRf94CXAxc9/x5d5QiDMHkuloLO5qceDcEpoCq8MhDFGZ0P8NuKBsp5wS7CIa498UkNYHT71Zg6y4WP79DgR+h9qpUEQeY85CakeTUTmVbr04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209139; c=relaxed/simple;
	bh=Pvjqugsj9+0gGq21AJX0rzcX8GqamVjbuB2k+vTiFrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVCbgbevq+/mqgiLd10hsSIX+7lQyhiSMat5ojeutwk3/lXolKWw+tTBkQfyi3YDJu5WqzzE1BksrJOxZIXO9JITtEAEDCmG1kyptMnvzwGzF+g89bHt5mgbt/1y67pWqqc/2ZcXp8/72Uy3xmVptrE+rKdBy8LCjbz+l9Nit5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDjRvKpH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDjRvKpH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso39714025ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746209134; x=1746813934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zcSLiUz4ebnW8auKGRYJu0KQ8ZdZMC2lQaQD2lbQrvw=;
        b=hDjRvKpHWQjxoVbYiuTGZxde1P+F4PGXIfJ1N2dnsgVh6870+RmsfrNfqfFObNp2v6
         rKdPZE+WNzEobzYxQBseBl7J3ck9uFS5+U59VH06ueYwUyvGPyWqDJliNhcKh7TL1/pV
         bk1zkW3tNv68G43Ceiw3BV5xgwoEcKgDe5rOtDEtu0Owey2DTo+1JwLuoLJsvs7KV0KM
         pf7KTizdYQY3cLXi/UbjfVQ0gvCce091J4xFmWUYzU7qiiylNL30cpEciD7MWcSljbJk
         m1R/3JsfpNfU5Q4ZyIFBQfaE4DG+iRKHxARTrfxgOtuVul0hyo3aBDssOn27Rno6Q428
         Rpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746209134; x=1746813934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcSLiUz4ebnW8auKGRYJu0KQ8ZdZMC2lQaQD2lbQrvw=;
        b=armMwAjtbo/cp1pqTaIOQQ4cTU5KmGwpLZat/3gD/LE4jbdxHwlYTqpIbqUTkxc+MP
         wqUOQg3qZ65/P0DavKWCMh0qUPG0hkgpHSsNEe5F+duodwYQGXlVHKVFY1d6C1dExvj0
         LW705mKZylCKlAD/Hm5wsHBC1dreqI6jpSym25/paFePPNmRICH84HREY/gI08Y9Ku3N
         8vBhuUondIz0J1M8npM7LeEg3OWAvXX7Sc39Oavxa8bdEpSW83xz8so2BQzZ0K4pRYGP
         JJGw9laZsTLG4H5JCFnqXr5tU2/1aHdxzhKyXBeL6cTFNF5ClMxf1mHwIwecfkp7qVdx
         SpLA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVV+sWX8xrYOy6U6ZX4/rBE6Y4G+ydJ6vWpGuyIFcGJq45l+rhjlIU8eg18yQUz0/EO8Aw8GyazHzdUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+SascmuW/mXfU6bBy/UsOnQMYLdvnZNaOLdSSQaI28IT1Fpb
	04kguoW9jztiC88ZDpaW6tsm7L2zz6qhhoZh98VYCSvpzdf3YOZZfJteCFGzXg==
X-Gm-Gg: ASbGncu8Bw/rHIAMqKOcqH0h3r93wYHh2k6kge5lyhfHG9EMUHceZlgyl+mv1MasUM7
	5zxXo7xRYMcx67C1vHkRr84w2ffEhO96nf31nupS1AyDP6FEDPLj9iirUdNSx68c+D2K+as1I4w
	XKFjoj2pGYbuPe+8GMq4pEIr0vxfIl4IGzSzM3qg4WT3SztXPGJ0Dgt1iyUukEg9ULYaJhCmMst
	WJqR9dAMggluaxKyQPo4dj/1SCLqniIs4MzudzB/zIQsAlWqp9eOPCVhveBh/vYHu9AYCVA32R9
	5ZAYvBDAIbxsySik2LdKirIrx9oSJhX9TYvl+ehDHEhAD2Eorh/DtA==
X-Google-Smtp-Source: AGHT+IEYeLUys5tfLkjUspsmDDI1Cb1YA+edBh30Ni418v1MT8XNeWwFc7kK/LBz4rDgcz2jBf4ikw==
X-Received: by 2002:a17:903:2c9:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22e102c79d0mr54635905ad.18.1746209133893;
        Fri, 02 May 2025 11:05:33 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae63sm10793605ad.18.2025.05.02.11.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 11:05:33 -0700 (PDT)
Date: Fri, 2 May 2025 23:35:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <hans.zhang@cixtech.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kbusch@kernel.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: Fix system hang when ASPM L1 is enabled during
 suspend
Message-ID: <onw47gzc6mda2unsew36b2cmp2et3ijrjqlmgpueeko5vucgph@wrkaiqlbo2fp>
References: <20250502150027.GA818097@bhelgaas>
 <be8321e5-d048-4434-9b2a-8159e9bdba43@cixtech.com>
 <z4bq25pr35cklwoodz34pnfaopfrtbjwhc6gvbhbsvnwblhxia@frmtb3t3m4nk>
 <433f2678-86c1-4ff6-88d1-7ed485cf44b7@cixtech.com>
 <58e343d9-adf3-4853-9dec-df7c1892d6b2@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58e343d9-adf3-4853-9dec-df7c1892d6b2@cixtech.com>

On Sat, May 03, 2025 at 12:20:52AM +0800, Hans Zhang wrote:
> 
> 
> On 2025/5/3 00:07, Hans Zhang wrote:
> > 
> > 
> > On 2025/5/2 23:58, Manivannan Sadhasivam wrote:
> > > EXTERNAL EMAIL
> > > 
> > > On Fri, May 02, 2025 at 11:49:07PM +0800, Hans Zhang wrote:
> > > > 
> > > > 
> > > > On 2025/5/2 23:00, Bjorn Helgaas wrote:
> > > > > EXTERNAL EMAIL
> > > > > 
> > > > > On Fri, May 02, 2025 at 11:20:51AM +0800, hans.zhang@cixtech.com wrote:
> > > > > > From: Hans Zhang <hans.zhang@cixtech.com>
> > > > > > 
> > > > > > When PCIe ASPM L1 is enabled (CONFIG_PCIEASPM_POWERSAVE=y), certain
> > > > > 
> > > > > CONFIG_PCIEASPM_POWERSAVE=y only sets the default.  L1 can be enabled
> > > > > dynamically regardless of the config.
> > > > > 
> > > > 
> > > > Dear Bjorn,
> > > > 
> > > > Thank you very much for your reply.
> > > > 
> > > > Yes. To reduce the power consumption of the SOC system, we have
> > > > enabled ASPM
> > > > L1 by default.
> > > > 
> > > > > > NVMe controllers fail to release LPI MSI-X interrupts during system
> > > > > > suspend, leading to a system hang. This occurs because the driver's
> > > > > > existing power management path does not fully disable the device
> > > > > > when ASPM is active.
> > > > > 
> > > > > I have no idea what this has to do with ASPM L1.  I do see that
> > > > > nvme_suspend() tests pcie_aspm_enabled(pdev) (which seems kind of
> > > > > janky and racy).  But this doesn't explain anything about what would
> > > > > cause a system hang.
> > > > 
> > > > [   92.411265] [pid:322,cpu11,kworker/u24:6]nvme 0000:91:00.0:
> > > > PM: calling
> > > > pci_pm_suspend_noirq+0x0/0x2c0 @ 322, parent: 0000:90:00.0
> > > > [   92.423028] [pid:322,cpu11,kworker/u24:6]nvme 0000:91:00.0: PM:
> > > > pci_pm_suspend_noirq+0x0/0x2c0 returned 0 after 1 usecs
> > > > [   92.433894] [pid:324,cpu10,kworker/u24:7]pcieport 0000:90:00.0: PM:
> > > > calling pci_pm_suspend_noirq+0x0/0x2c0 @ 324, parent: pci0000:90
> > > > [   92.445880] [pid:324,cpu10,kworker/u24:7]pcieport 0000:90:00.0: PM:
> > > > pci_pm_suspend_noirq+0x0/0x2c0 returned 0 after 39 usecs
> > > > [   92.457227] [pid:916,cpu7,bash]sky1-pcie a070000.pcie: PM: calling
> > > > sky1_pcie_suspend_noirq+0x0/0x174 @ 916, parent: soc@0
> > > > [   92.479315] [pid:916,cpu7,bash]cix-pcie-phy a080000.pcie_phy:
> > > > pcie_phy_common_exit end
> > > > [   92.487389] [pid:916,cpu7,bash]sky1-pcie a070000.pcie:
> > > > sky1_pcie_suspend_noirq
> > > > [   92.494604] [pid:916,cpu7,bash]sky1-pcie a070000.pcie: PM:
> > > > sky1_pcie_suspend_noirq+0x0/0x174 returned 0 after 26379 usecs
> > > > [   92.505619] [pid:916,cpu7,bash]sky1-audss-clk
> > > > 7110000.system-controller:clock-controller: PM: calling
> > > > genpd_suspend_noirq+0x0/0x80 @ 916, parent: 7110000.system-controller
> > > > [   92.520919] [pid:916,cpu7,bash]sky1-audss-clk
> > > > 7110000.system-controller:clock-controller: PM:
> > > > genpd_suspend_noirq+0x0/0x80
> > > > returned 0 after 1 usecs
> > > > [   92.534214] [pid:916,cpu7,bash]Disabling non-boot CPUs ...
> > > > 
> > > > 
> > > > Hans: Before I added the printk for debugging, it hung here.
> > > > 
> > > > 
> > > > I added the log output after debugging printk.
> > > > 
> > > > Sky1 SOC Root Port driver's suspend function: sky1_pcie_suspend_noirq
> > > > Our hardware is in STR(suspend to ram), and the controller and
> > > > PHY will lose
> > > > power.
> > > > 
> > > > So in sky1_pcie_suspend_noirq, the AXI,APB clock, etc. of the PCIe
> > > > controller will be turned off. In sky1_pcie_resume_noirq, the PCIe
> > > > controller and PHY will be reinitialized. If suspend does not
> > > > close the AXI
> > > > and APB clock, and the AXI is reopened during the resume
> > > > process, the APB
> > > > clock will cause the reference count of the kernel API to accumulate
> > > > continuously.
> > > > 
> > > 
> > > So this is the actual issue (controller loosing power during system
> > > suspend) and
> > > everything else (ASPM, MSIX write) are all side effects of it.
> > > 
> 
> Dear Mani,
> 
> There are some things I don't understand here. Why doesn't the NVMe SSD
> driver release the MSI/MSIx interrupt when ASPM is enabled? However, if ASPM
> is not enabled, the MSI/MSIx interrupt will be released instead.
> 

You mean by calling pci_free_irq_vectors()? If so, the reason is that if ASPM is
unavailable, then the NVMe cannot be put into low power APST state during
suspend. So shutting down it is the only sane option to save power, with the
cost of increased resume latency. But if ASPM is available, then the driver
doesn't shut the NVMe as it relies on APST to keep the NVMe controller/memory in
low power mode.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
