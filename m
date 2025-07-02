Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE052D9481;
	Wed,  2 Jul 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469725; cv=none; b=Jea/asSA672lkLfMTdwXUfog25xwsU47+CkiPzT8M954iRci0RD4WRsmHFXJjN5KaNqAQ3Mh18vxkbd35DptQtQZEDbdoaBbja8Q3IsA0spdYUFrGm1DKaSXperp5483Af1SkoOsXJDPPQw9Ot6iXgxzhaO9NgsSleVg3Rxn5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469725; c=relaxed/simple;
	bh=9pKDLw6zEO/Fyzgnt9qlMRp6WLwvS4H2qvnlfLKEMeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJvpQSG5jok2VJuRzN+aS9+hwcImPISGtcUiNpwRuqaPCb3/Iluz7BUfdIIBlEBVRkVhb6uzumbZUCy0kVvqtYXCStOmAshdEPfH0tc1ADvq/6ldvTISIxhyBv+WGiNx5cW5Jry8lvPUSVIqrYsmudeBz0upnaKBN8QE0rYogb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 956881424;
	Wed,  2 Jul 2025 08:21:48 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE14D3F6A8;
	Wed,  2 Jul 2025 08:22:01 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:21:58 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>

On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> MISC protocol supports getting the System Manager(SM) mode selection
> and configuration name. Add the API for user to retrieve the information
> from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_cfg_info_out {
> +	__le32 msel;

Now, I realise, this mode select is not properly defined in the document.
Just 32-bit word. What are those values ? Any fixed list of values with
well defined modes or configurations ? If so, please add to the document.

-- 
Regards,
Sudeep
