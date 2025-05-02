Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7925A64E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201525; cv=none; b=GxfNTeX+ptbZokESeQ+CxphLgZTR8my4zr/9DT9QyezpbwSGmAtmMLwBhQOYNLTSOJAhSpdPSqgAKLKpvRkoig4F42xdt8bdYrJJpcqnVxaJmjDzL+Bk1BPKN0K3F++VRPtDoJU7fdFBvtWBCt4K4J73VubQbLRULhgK+fvfC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201525; c=relaxed/simple;
	bh=5RQg0jFO3YwelNMJyzI18tPXYVp3HS0KWiJ/0p/cDlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEAPiaONsFdkvJT0tHYSYev2Isaeawz7vuhb/4Psnk3QAs3i0g6vnIa0r8jXidzEZQw/CvlqKS0slL8/cWrKClaj61u1Z/9bf6t/znoCuWmtVUXJIbWWYdle/9h+mQ+Ett4cPfeDuSXg6OcdKVWSyuHqpU6XZ29ucI7oBAke5hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPQ1JcOQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPQ1JcOQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c336fcdaaso28321025ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746201523; x=1746806323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+PQK7cd6vQouY+QWssyC04ldZ+G2r7jfC6DHSaivAY=;
        b=vPQ1JcOQ4dJ5rdCHoOxq+u419LvNdAN/KXawisHd0oK42XwhB+EnQanqiXZAcb1YWQ
         NZEw/CUywhL+s6w4FtottB3AssL/8aY3O9ZGZlATOpDRz86W8dJ2Ka4jjzuPt+34rNW7
         GfdRTDSCuqwW1/ftgxctK0MFP61RBeGywcaNuzl2jiF0vfWqmQZ9laM2gpMMWJjxa9Pp
         njV8L7IBl0UBpilfUAa0recq4Hc27g4rId0cQ1zf7obIeShycHcOmFiu8BOeoTNtjExI
         Y+3/8AyufxPpuQHWCIT6m/VO23MLItCijSL34tm5J/Pb5OyGCK1pS4vn+g7lcKvxqtia
         7hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201523; x=1746806323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+PQK7cd6vQouY+QWssyC04ldZ+G2r7jfC6DHSaivAY=;
        b=Rzn5dNFzF/uCVlQSEqVfh0IrVA6SXuyShTRPlIJ4yzFBPOsZwpYwaWahO6t+8FbLpl
         W/JgJ/llFp2sC0ehUrNvMhTF1AHbuMBoxpfhDhKYiubnxXiPM0V+YxR47S3pywHm1zVn
         YoXZKVmllsTpbKkLnprQV1dY6jiMBnxxEH1mjqWestm4T7BMs33fGayQb9pcifndpxA5
         dRc2aTZcWMaZXbj+SuJj2xbSgaTMig9f6eWueBTfgJdR4q7HEszXM2WVF8Uizzr+7f/0
         6XIz3Mafp5AEu5/5HsbPhKX/lkdq45ClJSBvSBKPLlMvd0Ad+mh/wPmPqjNtsgpH+ngq
         4ucA==
X-Forwarded-Encrypted: i=1; AJvYcCWGHQU2/fleR1vPoVYTKftcVhuJZdM97YiPZTyKQXriHeXPa0QIWjj2JEFEUA7MZTtlml0sumrLpmi3vLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMjm8TZdQrPSHJHolySyZ2nb90hOUoxnioeQhrUu6Weoa8b8y
	88tf9YPaFhXdDR0DElm+9OAjUBG8HpzrqjK0T1n3iCV2buduJxut5AKZAMjXbA==
X-Gm-Gg: ASbGncuvrcy6mW1cg2aZ21ZLgIkMqRDvWHwqM3lIVSxZZMyQiTubSclwoYq4AETTURN
	ttAGzvZoUcJeE5utZa2hJjXKkzqObrW07ozHGJV4+aaWlQbX8Sf/ameS1FHQo0z3W4eBd2dpqau
	mnv2hxKZAjsG+RtMQGey9c/QosihDdapHyKwD1byDts/vdeF35n/xsnXuNDLaOxkWAtfS3D979+
	ug1bH3sVreUo+Sj6/wdoZm4QUT92huLSo95F/5Cn7q5+sn/l0zLkRM7I18xjdYFbug01DTchyO4
	adDaGbbXqW3BQxjzxXQ1q2ngErYdyWqMrhQXMNaJIfXJAUIvxr89bysRQVfXW7EB
X-Google-Smtp-Source: AGHT+IFlt0LgLQmKQSlUwziRdLcwFuwYuvRWbdQ8rrLtwPvn17wSyVYVfRE70VydKdb5hQWDriS11A==
X-Received: by 2002:a17:902:da91:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22e1039fdebmr55655375ad.41.1746201522811;
        Fri, 02 May 2025 08:58:42 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522952csm9134125ad.185.2025.05.02.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:58:42 -0700 (PDT)
Date: Fri, 2 May 2025 21:28:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <hans.zhang@cixtech.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kbusch@kernel.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: Fix system hang when ASPM L1 is enabled during
 suspend
Message-ID: <z4bq25pr35cklwoodz34pnfaopfrtbjwhc6gvbhbsvnwblhxia@frmtb3t3m4nk>
References: <20250502150027.GA818097@bhelgaas>
 <be8321e5-d048-4434-9b2a-8159e9bdba43@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be8321e5-d048-4434-9b2a-8159e9bdba43@cixtech.com>

On Fri, May 02, 2025 at 11:49:07PM +0800, Hans Zhang wrote:
> 
> 
> On 2025/5/2 23:00, Bjorn Helgaas wrote:
> > EXTERNAL EMAIL
> > 
> > On Fri, May 02, 2025 at 11:20:51AM +0800, hans.zhang@cixtech.com wrote:
> > > From: Hans Zhang <hans.zhang@cixtech.com>
> > > 
> > > When PCIe ASPM L1 is enabled (CONFIG_PCIEASPM_POWERSAVE=y), certain
> > 
> > CONFIG_PCIEASPM_POWERSAVE=y only sets the default.  L1 can be enabled
> > dynamically regardless of the config.
> > 
> 
> Dear Bjorn,
> 
> Thank you very much for your reply.
> 
> Yes. To reduce the power consumption of the SOC system, we have enabled ASPM
> L1 by default.
> 
> > > NVMe controllers fail to release LPI MSI-X interrupts during system
> > > suspend, leading to a system hang. This occurs because the driver's
> > > existing power management path does not fully disable the device
> > > when ASPM is active.
> > 
> > I have no idea what this has to do with ASPM L1.  I do see that
> > nvme_suspend() tests pcie_aspm_enabled(pdev) (which seems kind of
> > janky and racy).  But this doesn't explain anything about what would
> > cause a system hang.
> 
> [   92.411265] [pid:322,cpu11,kworker/u24:6]nvme 0000:91:00.0: PM: calling
> pci_pm_suspend_noirq+0x0/0x2c0 @ 322, parent: 0000:90:00.0
> [   92.423028] [pid:322,cpu11,kworker/u24:6]nvme 0000:91:00.0: PM:
> pci_pm_suspend_noirq+0x0/0x2c0 returned 0 after 1 usecs
> [   92.433894] [pid:324,cpu10,kworker/u24:7]pcieport 0000:90:00.0: PM:
> calling pci_pm_suspend_noirq+0x0/0x2c0 @ 324, parent: pci0000:90
> [   92.445880] [pid:324,cpu10,kworker/u24:7]pcieport 0000:90:00.0: PM:
> pci_pm_suspend_noirq+0x0/0x2c0 returned 0 after 39 usecs
> [   92.457227] [pid:916,cpu7,bash]sky1-pcie a070000.pcie: PM: calling
> sky1_pcie_suspend_noirq+0x0/0x174 @ 916, parent: soc@0
> [   92.479315] [pid:916,cpu7,bash]cix-pcie-phy a080000.pcie_phy:
> pcie_phy_common_exit end
> [   92.487389] [pid:916,cpu7,bash]sky1-pcie a070000.pcie:
> sky1_pcie_suspend_noirq
> [   92.494604] [pid:916,cpu7,bash]sky1-pcie a070000.pcie: PM:
> sky1_pcie_suspend_noirq+0x0/0x174 returned 0 after 26379 usecs
> [   92.505619] [pid:916,cpu7,bash]sky1-audss-clk
> 7110000.system-controller:clock-controller: PM: calling
> genpd_suspend_noirq+0x0/0x80 @ 916, parent: 7110000.system-controller
> [   92.520919] [pid:916,cpu7,bash]sky1-audss-clk
> 7110000.system-controller:clock-controller: PM: genpd_suspend_noirq+0x0/0x80
> returned 0 after 1 usecs
> [   92.534214] [pid:916,cpu7,bash]Disabling non-boot CPUs ...
> 
> 
> Hans: Before I added the printk for debugging, it hung here.
> 
> 
> I added the log output after debugging printk.
> 
> Sky1 SOC Root Port driver's suspend function: sky1_pcie_suspend_noirq
> Our hardware is in STR(suspend to ram), and the controller and PHY will lose
> power.
> 
> So in sky1_pcie_suspend_noirq, the AXI,APB clock, etc. of the PCIe
> controller will be turned off. In sky1_pcie_resume_noirq, the PCIe
> controller and PHY will be reinitialized. If suspend does not close the AXI
> and APB clock, and the AXI is reopened during the resume process, the APB
> clock will cause the reference count of the kernel API to accumulate
> continuously.
> 

So this is the actual issue (controller loosing power during system suspend) and
everything else (ASPM, MSIX write) are all side effects of it.

Yes, this issue is more common with several vendors and we need to come up with
a generic solution instead of hacking up the client drivers. I'm planning to
work on it in the coming days. Will keep you in the loop.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
