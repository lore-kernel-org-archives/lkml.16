Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE711C6FF0;
	Mon, 14 Apr 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623291; cv=none; b=AI+czQQ2bzJ8S9hvUdtxS9TfdhRYEGwJIGRubXIIzUzZ781XKQmjG00Z0eAyaP4HOjea8rN4P65nC1OtWwLNntv5gSL/dH9M5QPtYy01TNNWAAL/sBpGInXciDcZUX2XH6BBSKGuW4UuHLmfJ42MdNMu3lfDGlrPOFUQAu99YXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623291; c=relaxed/simple;
	bh=s9P+lPWol/IuJoqkp1kwaVOcllKRdOOaYaTaD9BMsi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO7gDjigQFlITnr1CE7s5lKignzEp37ZBWyuRNJBxk/rBGMiwzS/MRnmBqiM9dofLF9IuGnBZbVTMr3TdQhrvjzRrR0f7/MjlC/dHMEp/bJeRqlAypJazYnqBjO7VBCk5bf4hrmm2pHdGcktEtFTUHsUFTolQSE28aYSzKXA+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1B71007;
	Mon, 14 Apr 2025 02:34:44 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DAB63F66E;
	Mon, 14 Apr 2025 02:34:43 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:34:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	<linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>

On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX95 System manager exports SCMI LMM protocol for linux to manage
> Logical Machines. The driver is to use the LMM Protocol interface to
> boot, shutdown a LM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
>  drivers/firmware/imx/Kconfig                  | 11 ++++
>  drivers/firmware/imx/Makefile                 |  1 +
>  drivers/firmware/imx/sm-lmm.c                 | 91 +++++++++++++++++++++++++++
>  include/linux/firmware/imx/sm.h               | 14 +++++
>  5 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> index b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f830810f8ba376ece9db93c8cded6d 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT
>  config IMX_SCMI_LMM_EXT
>  	tristate "i.MX SCMI LMM EXTENSION"
>  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> -	default y if ARCH_MXC
> +	depends on IMX_SCMI_LMM_DRV
> +	default y if ARCH_MXC && ARM64

I can't understand the ARM64 dependency on this and next patch.

-- 
Regards,
Sudeep
