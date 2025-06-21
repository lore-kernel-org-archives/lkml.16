Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFB196C7C;
	Sat, 21 Jun 2025 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750490559; cv=none; b=sYRv0PLlvOBFq18nLq+T0qvCb7VG6JbaAgDU9uoPZp5Ksp3f7FYvWOt7i4/NuxHV1sNz20042+A8w5Y31RlmFQlgtLinumSMThgQYC/oMy/QMck+MWk2xnWbJYLZaWR4oq2vUyPtCcLjFyhr6LndBaurKel1RW/2S1lCKG9X6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750490559; c=relaxed/simple;
	bh=oundpO0MzuwbebUlC6NeXUr8PiL9fGQdjYk3FvfM+kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbj6BqwFoFdMGctFHDm6LxyP7ib5I5Qsqyr29RROPAEMgE+mwtf0sLTMNkobrMaqH2gM28xa/Tdu8EjYd9fYz1YpL2y+NWsV26cYSOlYUT7lyo91sxE38/1lCHqgSD1ZkwOotzYIYOremYXWxI69LSYOipaSNuR6NfFYugS7XBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nCF2hhqU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nCF2hhqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1F6C4CEE7;
	Sat, 21 Jun 2025 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750490559;
	bh=oundpO0MzuwbebUlC6NeXUr8PiL9fGQdjYk3FvfM+kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCF2hhqUGiAm6EhzbRFQ34hm1J0Ia4r/t+lhmy8AOThvBubPmpziA9EHRwr3m7w5I
	 ruqVg+u8p8xTAOJjZTNfwbsQ0dto98UnE6S8V3y5HXIRV0KlxCHbaIViTxkbwVTyZa
	 K4NWbIPOLCt3hpxMh2OO24PGmn2Ujsfva1Yp9EVM=
Date: Sat, 21 Jun 2025 09:22:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nicolas.bouchinet@oss.cyber.gouv.fr
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Kannappan R <r.kannappan@intel.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pawel Laszczak <pawell@cadence.com>, Ma Ke <make_ruc2021@163.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
	Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] usb: core: Add Kconfig option to compile usb
 authorization
Message-ID: <2025062104-debate-compactly-9aee@gregkh>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-4-0d92261a5779@ssi.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-usb_authentication-v1-4-0d92261a5779@ssi.gouv.fr>

On Fri, Jun 20, 2025 at 04:27:19PM +0200, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> 
> This enables the usb authentication protocol implementation.
> 
> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---
>  drivers/usb/core/Kconfig  | 8 ++++++++
>  drivers/usb/core/Makefile | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/core/Kconfig b/drivers/usb/core/Kconfig
> index 58e3ca7e479392112f656384c664efc36bb1151a..07ba67137b7fe16ecb1e993a51dbbfd4dd3ada88 100644
> --- a/drivers/usb/core/Kconfig
> +++ b/drivers/usb/core/Kconfig
> @@ -143,3 +143,11 @@ config USB_DEFAULT_AUTHORIZATION_MODE
>  	  ACPI selecting value 2 is analogous to selecting value 0.
>  
>  	  If unsure, keep the default value.
> +
> +config USB_AUTHENTICATION
> +	bool "Enable USB authentication function"
> +	default n

Nit, "default n" is the default, no need to ever list it.

thanks,

greg k-h
