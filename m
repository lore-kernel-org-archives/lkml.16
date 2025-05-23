Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C358225792;
	Fri, 23 May 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000912; cv=none; b=ofyM6lxz1dU/X1d0iFsbBa6IZxHevpScjnVCqkKBWaKFb75RG5oy8y3hoV7yKyBvBXd6Cs/G3WS62aJxA/46pBnysBVHYuoW08zqU/4tJFzwG8Q/zJVtshJfp6e0IkgCjMle6j3x/EVOSGZxAZ4bMP8HiofbTMqVOb4Y2hbUqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000912; c=relaxed/simple;
	bh=3YZz4rOeDwWhYpmTSNXXc6PVKAno1p9sBBdFfd9SHVw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iinIgOftQes9mJD7RBorDbprvLqE4h7JEoUveKaUrnuykjI3v2o9b0IY2G021SHl/miOywdrHm899L6S/l3CQDTojOHHjSoJM83Yxor763jRj4sVmIl1xQCt7jgmXfQ+Gmkge8bppSMbMJbYfRDDZXMYXRpGopTlG2YMUmJwYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UaqSYdBh; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UaqSYdBh"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NBmNIm2097432;
	Fri, 23 May 2025 06:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748000903;
	bh=LFqQ/x0rQR3jGaXdDUYMOYK4fBwmieYoC7IJLscQxNo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UaqSYdBhMa7guOA2d6anhf7XqXa9f5YKUbwRzy8DqVBpsGuhvFfPZmXVG9r+bgdJY
	 HF6fInGHT2wAZ8dgHoHsujWhR8Pzw98QIjcK6FqTO2MqG0KGNmbIlxNWtTA1ONciak
	 aUNBCBSx5VglDUKnK0IWH5PNyT7sp+JL9RXeYUFg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NBmN7I036265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 06:48:23 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 06:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 06:48:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54NBmMbS1214510;
	Fri, 23 May 2025 06:48:22 -0500
Date: Fri, 23 May 2025 06:48:22 -0500
From: Nishanth Menon <nm@ti.com>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
Message-ID: <20250523114822.jrv73frz2wbzdd6d@falsify>
References: <20250522073426.329344-1-b-padhi@ti.com>
 <20250522155338.gpbcubkvygtju3qc@bagpipe>
 <5cfaed26-28ec-42dc-b9f6-836869ad3fa3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5cfaed26-28ec-42dc-b9f6-836869ad3fa3@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 14:27-20250523, Beleswar Prasad Padhi wrote:
> Hi Nishanth,
> 
> On 5/22/2025 9:23 PM, Nishanth Menon wrote:
> > On 13:04-20250522, Beleswar Padhi wrote:
> > > Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
> > > R5F cluster in the MCU domain which is configured for LockStep mode at
> > > the moment. Switch this R5F cluster to Split mode by default in all
> > > corresponding board level DTs to maximize the number of R5F cores.
> > Why? I can read the patch to understand what you are trying to do, but
> > the rationale needs to be explained.
> 
> 
> Sure, rationale is lot of users of our SoCs want to control the R5 core in
> the MCU domain as a general purpose remote processor to increase
> performance. That means able to load applications from

This follows the board, then?

> bootloader/kernel/userspace, poweroff/poweron core at runtime etc. The
> challenge with this is the MCU R5F cluster is reserved to run the central
> Device Manager (DM) Firmware.
> 
> However, since the MCU R5F cluster is lockstep enabled, it supports both
> lockstep mode and split mode of booting. So here we decide to boot the
> cluster in split mode by which we can reserve the primary core to run DM and
> use the secondary core as a general purpose remote processor.
> 
> Now why didn't we do this split mode booting since the inception? Well
> because MCU R5F Cluster is booted by ROM code, and when ROM boots it in
> split mode, it powers on the secondary core and puts it in WFI (as there is
> nothing to do for it yet). But the standard remoteproc drivers in Linux and
> other bootloaders can only load firmware on a core if it is powered off/held
> in reset. So there was some plumbing needed to be done at the bootloader
> stage to actually poweroff the secondary core in split mode; so that
> remoteproc drivers can then load & control the core as expected. Now that
> the plumbing[0] is posted for U-Boot, we can switch to split mode booting
> here in DT.
> 
> [0]: https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/

In effect, you are saying there are two set of usage models: one in
split and other in lock-step mode. U-Boot support for split mode was
missing and hence was not done yet. The benefit for users is the option
to get an extra processor to do what ever extra stuff they want to do.

> 
> > 
> > > Corresponding support to shutdown MCU R5F core 1 on SoC power on have
> > > been posted in U-Boot:
> > > https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/
> > > 
> > > While at it, correct the firmware-name property for MCU R5F cores of
> > > J742S2 SoC in [PATCH 1/2].
> > > 
> > > Testing Done:
> > > 1. Tested that each patch does not generate any new warnings/errors.
> > > 2. Build test on all existing TI K3 platforms.
> > > 3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
> > > applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
> > > J784S4-evm, J742S2-EVM)
> > > 
> > > Test logs:
> > > https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98
> > > 
> > > Thanks,
> > > Beleswar
> > > 
> > > Beleswar Padhi (2):
> > >    arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
> > >      R5F cores
> > >    arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode
> > NAK! We are once again churning downstream users again and for what
> > reason - coverletter and the patch is vague on that!
> > 
> > I would prefer the entire remote proc dts stuff cleaned up once for all
> > in a comprehensive series.
> > 
> > Let me be clear (once again): We DO NOT break backward compatibility.
> > We do not break downstream users without a clear cut rationale. We do
> > not break all other ecosystems depending on device tree without a very
> > very solid reason.
> 
> 
> I don't understand how this is breaking any backward compatibility. We are
> not removing the lockstep boot support entirely here. We are just switching
> to Split boot by default because of the usecases. If not today, someday we
> have to go with split mode booting by default.
> 
> That's exactly what we did for the MAIN domain R5F clusters: 1. First we did
> the plumbing to have power synchronization between the cores of a cluster:
> https://lore.kernel.org/all/20240430105307.1190615-1-b-padhi@ti.com/ 2. Then
> we switched the Cluster to boot in split mode by default:
> https://lore.kernel.org/all/20240826093024.1183540-1-b-padhi@ti.com/
> 
> Now, for users who prefer to use the fault-tolerant lockstep mode, they can
> still do that by setting `ti,cluster-mode` property to 1. However, I agree
> that we should not be doing 'hardware configuration' (split vs lockstep) in
> Device Tree which is supposed to be 'hardware description'. We have started
> to explore solutions where we can dictate this lockstep vs split core
> configuration from the firmware itself during runtime. Once that is done
> (long way to go thinking of upstream), we can get rid of this configuration
> from the DT entirely.

Please add this explanation to your patch. In addition, when you say
arm64: dts: ti: k3*: in subject line (implies you are touch soc dtsi)
and when co-related to the U-boot patch[1], it is confusing to know if
you have the same SoC dtsi change yet to be posted where you switch
from ti,cluster-mode = <1> to <0> - I am concerned if downstream board
dts files will have to consume the firmware names differently. This is
the reason to ask for a comprehensive list of patches for the remote
proc. If a downstream device board dts can continue to move to newer
kernel revisions with no mods, you should state so in your commit
message. There is all kinds of side implications with memory carveouts
etc for a new processor that has to be factored in as well.

Btw, [2] sounds like a bug fix.. So follow the stable kernel rules.

I suggest the following:
* SoC dts files - use a common standard for remote proc - lockstep makes
  sense as it is right now
* Modification to board specific dts files - call them out as board
  files specific patches to flip over to split mode - while considering
  the possibilities that users may NOT upgrade kernel and bootloader at
  the same time and the existence of EFI based dtb handover from
  bootloader to kernel - which means, kernel should be able to handle the
  same combinations correctly. Also handle the carveouts correctly for
  the new processors - at least state the strategy - overlays etc.. Come
  to think of it, I think we should fix up the carveout strategy for
  user programmable remote cores first before attempting all this new
  processor additions.
* Split out the fixes patches separately out - no reason to mix it up
  with the rest of the refactoring.
* Fix your commit messages and subject lines to indicate clearly what is
  impacted, rationale, backward compatibility status

[1] https://lore.kernel.org/all/20250522071828.285462-7-b-padhi@ti.com/#Z31dts:upstream:src:arm64:ti:k3-j7200-mcu-wakeup.dtsi
[2] https://lore.kernel.org/all/20250522073426.329344-2-b-padhi@ti.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
