Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD39299A99;
	Thu, 22 May 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929242; cv=none; b=oX+zi8ct2nbvKpqws2mTMXzLSkci1/SLPeZlCuycsOaGdDsb5ROWejaEZo3qKmJ7DbpW00YxG/dIhVFhNec9RSUJRck6hVOEBiExWS+Sgzv/iStOv2hGkDKEark8EBVk8brmxMng/Tw0T0HlPuZaPgNHR0xfdv4MZYIMJDGyX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929242; c=relaxed/simple;
	bh=tgpHzJFSP0rnDppwYe1l14XBM48ZnUDrZRXBK1lQJZE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nF5eC2gwoluC3YpgfcGoNdXF58s7mlFX5C1OQu3poOej5hPVbk4ASVTEkwygW83k33jIEQuK+6U9akWbRWyk8XG15MzUrgaJb/2lpbvwClhhFSF5nnL/bapHw2aokl3mCONjOIdG6ZG8t/hJsSgehmrjVMUzkmkeidSTE1SiiiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W3i23DkB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W3i23DkB"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54MFrcMV1855269;
	Thu, 22 May 2025 10:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747929218;
	bh=jySRI/8bFMF3lqKUnU42PqyJe/L7FVdEHZlxB5NuuwI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=W3i23DkBWlVYARl6EhAZFr0Y45cTG7ZQVSO+Qo95JHu11xxtwnszehXoaeDHkiuOU
	 fUgIE2MxKZ4Y3mMcim1JPH4bgRos4+YfUETWGsWjIrdhzdMfPCgzXk1qD3z8HgPtst
	 FXjk+uOvdjnrLxy35TlHPzOAJO8oxDoW3up4hLOo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54MFrcBs3103726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 10:53:38 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 10:53:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 10:53:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54MFrccP111653;
	Thu, 22 May 2025 10:53:38 -0500
Date: Thu, 22 May 2025 10:53:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
Message-ID: <20250522155338.gpbcubkvygtju3qc@bagpipe>
References: <20250522073426.329344-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250522073426.329344-1-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:04-20250522, Beleswar Padhi wrote:
> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
> R5F cluster in the MCU domain which is configured for LockStep mode at
> the moment. Switch this R5F cluster to Split mode by default in all
> corresponding board level DTs to maximize the number of R5F cores.

Why? I can read the patch to understand what you are trying to do, but
the rationale needs to be explained.

> 
> Corresponding support to shutdown MCU R5F core 1 on SoC power on have
> been posted in U-Boot:
> https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/
> 
> While at it, correct the firmware-name property for MCU R5F cores of
> J742S2 SoC in [PATCH 1/2].
> 
> Testing Done:
> 1. Tested that each patch does not generate any new warnings/errors.
> 2. Build test on all existing TI K3 platforms.
> 3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
> applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
> J784S4-evm, J742S2-EVM)
> 
> Test logs:
> https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98
> 
> Thanks,
> Beleswar
> 
> Beleswar Padhi (2):
>   arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
>     R5F cores
>   arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode

NAK! We are once again churning downstream users again and for what
reason - coverletter and the patch is vague on that!

I would prefer the entire remote proc dts stuff cleaned up once for all
in a comprehensive series.

Let me be clear (once again): We DO NOT break backward compatibility.
We do not break downstream users without a clear cut rationale. We do
not break all other ecosystems depending on device tree without a very
very solid reason.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
