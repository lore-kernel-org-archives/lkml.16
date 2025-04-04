Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F8E282EE;
	Fri,  4 Apr 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781140; cv=none; b=a04NdQj2YQGoBUMSL6GE7iRRH48HtalDECfGXyM3roMkgIrkI10+PPktJRJM4BN8PyWgEyk+aNFmep/WDdLsG3sySTBUQBirCnsBSHCGCTfAHuqNlL+og9KzyKv48TVixgM4znjAqiwylDpPGRqsqmrPJeFlYITMG+q+mFBASPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781140; c=relaxed/simple;
	bh=MJ8gi+tG+9w7E6JAgGJyxRT9HR+3XqjoIb/hCQhDaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLkKU1Rgig2u+4YnBeJYCofU8bhm4NFmsjrq7y/i3lZPkkWOXDhiy9/UOg7gsdiVOG2nnXaDx3AyJLDJdUtouf+rs+OOm7BOtuiu0g9j5buQLsJQ9StVpUPWWhX/OLovGUWM6iV1q5qnUtxTe+gxRwPT70Ugd/1nYSAcbHI2nWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQF0rQbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQF0rQbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF36C4CEDD;
	Fri,  4 Apr 2025 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781139;
	bh=MJ8gi+tG+9w7E6JAgGJyxRT9HR+3XqjoIb/hCQhDaLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQF0rQbAUwPvf4cMDeHtzMToEc+cqoBfo5M3qEt60EAZXk+SyMO2ZMd8NAzBI5oEL
	 TxSVB3eWgpxQ2SJFeB4n/azx7GII9N+1wQLX2KZXzOVhp8iYH6fSAO/kxXiJV+Hhyd
	 lE8djtO4fLcrq35dmDwKckBwo9Sso5VvJdyGcTrMVVndHO5GWoCLdTkSIWvVjojzNQ
	 8wVvxbPe1CSxU+BeQtKEbvDV3tLNvPDUqwBZNjIDlOBAV8QipZz7BY99I/y+UBZRTw
	 yMr8Nu/mVaUEdzmSJeqcc1+VIBsCWVanv49MdyjFNTFS2Jt/X3MVEfwpt1NhwdmkWD
	 m/W2YY+HwaPVA==
Date: Fri, 4 Apr 2025 16:38:54 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v7 05/10] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250404153854.GG372032@google.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
 <20250316-bcm59054-v7-5-4281126be1b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316-bcm59054-v7-5-4281126be1b8@gmail.com>

On Sun, 16 Mar 2025, Artur Weber wrote:

> The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
> used on devices with the BCM21664/BCM23550 chipsets.
> 
> Prepare the BCM590xx driver for supporting other devices by adding the
> PMUID register values for supported chip types and store them in the
> MFD data struct as "pmu_id". (These will be checked against the actual
> PMUID register values in a later commit.)
> 
> Then, add a DT compatible for the BCM59054, and provide the PMU ID as
> OF match data.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Move PMUID value to MFD header
> - Use PMUID value as OF data/device type value
> - Add bcm59054 to I2C ID table
> 
> Changes in v4:
> - Rewrite commit message description
> - Rename "device_type" member to "dev_type"
> - Drop awkward line break to fit function call
> - Add PMU ID/revision parsing function
> 
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
>  include/linux/mfd/bcm590xx.h |  7 +++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

Looks like the Regulator changes depend on this.

Let me know when they're ready to go.

-- 
Lee Jones [李琼斯]
