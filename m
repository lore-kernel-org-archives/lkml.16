Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9FB14BFA2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327816; cv=none; b=MW9dqFYQBHrjNugYv76lfe0A9pHV4Q+mzAVqmUpdnPWOj/ULTW38k3KmJYUk5HB3sYmkWiXlie8FYc9n7rr6+9FZwF/8rSg0q4t/kR4OqgkzEAEy66kpyfYcKtVhZygXOlPEgDLt26ED2GKpJPK40vbgISBCCC8Ip+msHkIclBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327816; c=relaxed/simple;
	bh=MaJ0KTg/lw0pHF0ohqvoSddCrFkNPCpBd88fRNl46XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUYpwq902tXmctrXqcaJUH2ry+3/jXmaTFHYyVXbXAd9+U4/gt49i+qcxbvXXxvw7RE8dnueY5/4H6fm34P+NMLIEahocXEvDlxmBVhJLDqBCRzJsrfOVpG+g9LtdSIlvbgVJNauCBadbmnLHdSGmEERUeUQrGrGdnI4/u78vJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XAJea8G4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XAJea8G4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DA4C4CEE9;
	Tue, 22 Apr 2025 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745327814;
	bh=MaJ0KTg/lw0pHF0ohqvoSddCrFkNPCpBd88fRNl46XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAJea8G4oPFWYT8hcX0maNisJFXdrKSRypNi9ek8uiUpa+jQ1U1QUK9arCktKIWrK
	 wDybn5eV7MX/ZUOlyNyRBXV998KFToGVmsBRnZHhjaSnq6f5ZJrGZA9TxYNx8tEiAB
	 yGUV3IiuFvw9kF8AixCwDPoOFPtS8j7nccmXNc0o=
Date: Tue, 22 Apr 2025 15:16:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: zynqmp_nvmem: unbreak driver after cleanup
Message-ID: <2025042243-gladiator-sizable-a69e@gregkh>
References: <20250422130831.2309995-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422130831.2309995-1-peter@korsgaard.com>

On Tue, Apr 22, 2025 at 03:08:31PM +0200, Peter Korsgaard wrote:
> Commit 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
> changed the driver to expect the device pointer to be passed as the
> "context", but in nvmem the context parameter comes from nvmem_config.priv
> which is never set - Leading to null pointer exceptions when the device is
> accessed.
> 
> Fixes: 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  drivers/nvmem/zynqmp_nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
> index 8682adaacd692..7da717d6c7faf 100644
> --- a/drivers/nvmem/zynqmp_nvmem.c
> +++ b/drivers/nvmem/zynqmp_nvmem.c
> @@ -213,6 +213,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
>  	econfig.word_size = 1;
>  	econfig.size = ZYNQMP_NVMEM_SIZE;
>  	econfig.dev = dev;
> +	econfig.priv = dev;
>  	econfig.add_legacy_fixed_of_cells = true;
>  	econfig.reg_read = zynqmp_nvmem_read;
>  	econfig.reg_write = zynqmp_nvmem_write;
> -- 
> 2.39.5
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
