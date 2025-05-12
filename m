Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAC19F101
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747049994; cv=none; b=qZkXTFjL5j587f8ezjTk5b+C89IwQM9z1sL8ZDUce8EU1YtRxTuX7brs/ZShdvmJLXqtlqli8mpOPyQtiwcTLTyEcBKko7IQUREBK9BWCQuuowJWodB5Fsq+EPc7pL6NP8O1H+lbHRAI2LywwhF0cx0Dlc6no8CMBa8ywItxYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747049994; c=relaxed/simple;
	bh=vvdv1oojC1mflejovSMP5mtKKQVsZOEk9gARXzsu9u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkJmrNszPxp4jS6XsRbxoNRRIVNpf5V+4BUEmhVR+KoNy284mxMeFBpcFYiu6q/PfoPt7od6WtLKiadJnrsy45KqwP0y0DYUplm8GfIZ+kmLNh0EMeaa+U4a+VR7ScmkGgOOmU+/NsYHXC55CL2f/TzJwjou19V+t0x1qHiLjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZgBpguFX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZgBpguFX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BED5F40E01ED;
	Mon, 12 May 2025 11:39:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aifAoQMaROQo; Mon, 12 May 2025 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747049985; bh=hpEHQ8YcTZ/63UB5aLcAw++eZZe1RzGiHTAUXUCymOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgBpguFXQ5blSkzXAmbBd4Rdwon1TpZVOiTT9LSzkBxtKYpL6nN6KyW4m8mNk3kQb
	 N6vDQwRqwANaYf/70IkJGLdKJiPKnF+RhMR//+EVCO9ZuEIAF+AHrqWxl4jmS3PZjo
	 PH7r3aRl9V8SBg0TgWDe2UlbLJFbrJVz0VQtYGC1dSzKuPjKyKc9vIaBOYGOi6oj4Q
	 epAsMAlTQbfOW+Jpx2hnSPURfVFCbx6la9EoAGL29Ck0s7cj+mYeXcWYwsQweLlJiP
	 9NviCoGW4axHEsxeHPLcwdDM1HTqv0n8MIloo1kQu7iFcvHlmIqiJQJxCP7YwtdSgJ
	 lcknp2E6Bqi3IUPSrAYB6K8SX/J4T/4I1aPsUWo82wBUKiN0EMBvAACVHkYNaeOsg3
	 YNdI7dddatxwqo/cJ3SUPNkkgx7goSzIjsMA0cio0jwLbOhyrY7j2CS7W7GlPs0Mks
	 74OB1aJmIrYSdNlvJykRwaK+dgjTEwC1MQqdL+KHw52S14vRn3uiGaJVAq1pQINRLU
	 Pn8vq2HFrinnDZxZrTMoWIMP2lxzAD90gx3fdxfc5lI7dccTtxbar0ICWoPd9v4Bjv
	 bgCdZ/w0PJhHFvoATTPTveaZ12hjupgeC5zue19GOhkJCp8FO/P7Ib60qSIPzodTOL
	 wRoXJKRoyR9kS/PAzDYMgdnc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ECE4B40E0241;
	Mon, 12 May 2025 11:39:42 +0000 (UTC)
Date: Mon, 12 May 2025 13:39:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove Alexey Makhalov
Message-ID: <20250512113936.GAaCHd-IWbVzIjKKi8@fat_crate.local>
References: <20250512113004.23050-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512113004.23050-1-jgross@suse.com>

On Mon, May 12, 2025 at 01:30:04PM +0200, Juergen Gross wrote:
> Mails to Alexey keep bouncing, so remove him from MAINTAINERS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f21f1dabb5fe..da3d37fdbb50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18432,7 +18432,6 @@ F:	include/uapi/linux/ppdev.h
>  PARAVIRT_OPS INTERFACE
>  M:	Juergen Gross <jgross@suse.com>
>  R:	Ajay Kaher <ajay.kaher@broadcom.com>
> -R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
>  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>  L:	virtualization@lists.linux.dev
>  L:	x86@kernel.org
> @@ -25918,7 +25917,6 @@ F:	drivers/misc/vmw_balloon.c
>  
>  VMWARE HYPERVISOR INTERFACE
>  M:	Ajay Kaher <ajay.kaher@broadcom.com>
> -M:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
>  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>  L:	virtualization@lists.linux.dev
>  L:	x86@kernel.org
> @@ -25946,7 +25944,6 @@ F:	drivers/scsi/vmw_pvscsi.h
>  VMWARE VIRTUAL PTP CLOCK DRIVER
>  M:	Nick Shi <nick.shi@broadcom.com>
>  R:	Ajay Kaher <ajay.kaher@broadcom.com>
> -R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
>  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>  L:	netdev@vger.kernel.org
>  S:	Supported
> -- 

https://lore.kernel.org/r/20250318004031.2703923-1-alexey.makhalov@broadcom.com

Looks like this fell through the cracks. :-(

Lemme fix.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
