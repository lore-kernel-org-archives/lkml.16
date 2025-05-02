Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02825D20C;
	Fri,  2 May 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202595; cv=none; b=lmx8wEOWUXSYhNhndZqvhBKYrTN0EBRP4ybi2E+TWeTE22Vnm8zU1rB7EoUP27CiGpiM3bV0w2g8YU2+EjJWItPNPEbaOmwez/D/aaMZfkRQ+RYwQpqv7l1aoTH3MkRdkga6m+sXZoUBO8s2Bivd8eWiTq1NeFtJiLZdVeqVWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202595; c=relaxed/simple;
	bh=xwC6411AfiwsXF+xKeK2uSxZOyw8ub8uJR3YfkdNtZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLPxnRT/5qQUZzLotxhf892i7F3Itoo44TuZYNRvKuLZxYvtIskW5AgNhQ5eSGK4EfILRwdc+ifVx+GXfNy4V5f5wbOOF0XaekPWPs1pAM1ztgJH6Q8+uOsXfFpGqMEgZQYefxUTtScnIT7blxHCwsOwg7NjSWTB49W18Uq0eks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WICHQwMH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WICHQwMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1CBC4CEEE;
	Fri,  2 May 2025 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746202593;
	bh=xwC6411AfiwsXF+xKeK2uSxZOyw8ub8uJR3YfkdNtZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WICHQwMHh8mziGfE3MnSXM7TplK/5s5V8q+aRYbe873PjgIONvAo17lkduRnc8jru
	 ZO+lqp/4AbgnSR70Ul7HCAC3tvxEFlrifqebho9WhdRO0hU2BlHaFDFPWeCI74ohty
	 ghT4u1zX9+bNaJEVqiOaTlL7mlHIOT8ksh+da+tanLDu3Zf3jzDeYuiMIElldDwafQ
	 lmiiGSKx6LJYSPHnFcCnD8wfZz44oT9BZP1GYVEY9Z8kgjldnPeiP7D+oxbFdUAlBr
	 /fNkoBWhgU6x/TS98kM3c7bE3MdK0LzseVFu0jPL4DJUOKENyiRAZ/eLadyh2AyFQS
	 nnqwVkyEeANoA==
Date: Fri, 2 May 2025 18:16:25 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBTv2cLX4rOQxl+L@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
 <aBIlOrqLtbB5e7B/@lpieralisi>
 <86y0vgh35t.wl-maz@kernel.org>
 <aBR7bk62H3PEUbfi@lpieralisi>
 <87tt6310hu.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt6310hu.wl-maz@kernel.org>

On Fri, May 02, 2025 at 04:43:57PM +0100, Marc Zyngier wrote:
> On Fri, 02 May 2025 08:59:42 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > It looks like the msi_prepare() ITS callback (ie where the its_device is
> > allocated) is called everytime an endpoint device driver requests a
> > wired IRQ through:
> > 
> > gicv5_its_msi_prepare+0x68c/0x6f8
> > its_pmsi_prepare+0x16c/0x1b8
> > __msi_domain_alloc_irqs+0x70/0x448
> > __msi_domain_alloc_irq_at+0xf8/0x194
> > msi_device_domain_alloc_wired+0x88/0x10c
> > irq_create_fwspec_mapping+0x3a0/0x4c0
> > irq_create_of_mapping+0xc0/0xe8
> > of_irq_get+0xa0/0xe4
> > platform_get_irq_optional+0x54/0x1c4
> > platform_get_irq+0x1c/0x50
> > 
> > so it becomes "shared" if multiple IWB wires are requested by endpoint
> > drivers.
> 
> Right, I've reproduced on D05 with MBIGEN:
> 
> [    5.505530] Reusing ITT for devID 40000
> [    5.505532] CPU: 36 UID: 0 PID: 557 Comm: (udev-worker) Not tainted 6.15.0-rc4-00079-geef147df4841-dirty #4403 PREEMPT 
> [    5.505535] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
> [    5.505536] Call trace:
> [    5.505537]  show_stack+0x20/0x38 (C)
> [    5.505540]  dump_stack_lvl+0x80/0xf8
> [    5.505543]  dump_stack+0x18/0x28
> [    5.505546]  its_msi_prepare+0xe4/0x1d0
> [    5.505549]  its_pmsi_prepare+0x15c/0x1d0
> [    5.505552]  __msi_domain_alloc_irqs+0x80/0x398
> [    5.505556]  __msi_domain_alloc_irq_at+0x100/0x168
> [    5.505560]  msi_device_domain_alloc_wired+0x9c/0x128
> [    5.505564]  irq_create_fwspec_mapping+0x180/0x388
> [    5.505567]  acpi_irq_get+0xac/0xe8
> [    5.505570]  platform_get_irq_optional+0x1e8/0x208
> [    5.505574]  devm_platform_get_irqs_affinity+0x58/0x298
> [    5.505578]  hisi_sas_v2_interrupt_preinit+0x60/0xb0 [hisi_sas_v2_hw]
> [    5.505582]  hisi_sas_probe+0x164/0x278 [hisi_sas_main]
> [    5.505588]  hisi_sas_v2_probe+0x20/0x38 [hisi_sas_v2_hw]
> [    5.505591]  platform_probe+0x70/0xd0
> [    5.505595]  really_probe+0xc8/0x3a0
> [    5.505598]  __driver_probe_device+0x84/0x170
> [    5.505600]  driver_probe_device+0x44/0x120
> [    5.505603]  __driver_attach+0xfc/0x210
> [    5.505606]  bus_for_each_dev+0x7c/0xe8
> [    5.505608]  driver_attach+0x2c/0x40
> [    5.505611]  bus_add_driver+0x118/0x248
> [    5.505613]  driver_register+0x68/0x138
> [    5.505616]  __platform_driver_register+0x2c/0x40
> [    5.505619]  hisi_sas_v2_driver_init+0x28/0xff8 [hisi_sas_v2_hw]
> [    5.505623]  do_one_initcall+0x4c/0x2c0
> [    5.505626]  do_init_module+0x60/0x230
> [    5.505629]  load_module+0xa64/0xb30
> [    5.505631]  init_module_from_file+0x8c/0xd8
> [    5.505634]  idempotent_init_module+0x1c4/0x2b8
> [    5.505637]  __arm64_sys_finit_module+0x74/0xe8
> [    5.505640]  invoke_syscall+0x50/0x120
> [    5.505642]  el0_svc_common.constprop.0+0x48/0xf0
> [    5.505644]  do_el0_svc+0x24/0x38
> [    5.505646]  el0_svc+0x34/0xf0
> [    5.505650]  el0t_64_sync_handler+0x10c/0x138
> [    5.505654]  el0t_64_sync+0x1ac/0x1b0
> [    5.505681] ID:78 pID:8382 vID:143
> 
> And that a few dozen times.

Yep that matches my expectations, thanks a lot for testing it.

> I'll have a think at how to unfsck this. This was previously avoided
> by (IIRC) populating the domain upfront and letting the domain
> matching code do its job. That behaviour seems to have been lost. On
> the other hand, as long as you don't expect the ITT to *grow*, nothing
> horrible should happen.

Yes - I can remove the "shared" ITS device flag but should keep the
logic preventing an ITS device with same deviceID to be allocated
if found.

> But I also get an interesting crash in msi_domain_debig_show(), so
> there is more than just this corner case that is screwed.

That I can try on my side too to try to help you untangle it.

Possibly this was introduced when the MBIgen switched to MSI parent
with 752e021f5b9b ? It is pure speculation at this stage just noticed
that's a point in time where the domain code changed.

Is MBIgen the only example of an IC relying on the ITS as MSI parent ?

Thanks,
Lorenzo
