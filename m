Received: from smtp81.iad3a.emailsrvr.com (smtp81.iad3a.emailsrvr.com [173.203.187.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831124B28
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610913; cv=none; b=dMcDz7pjctetUa0ML0EZhMkAiZTbQNGmXRfVYHXPR1AVKAL+6xIXuS6LBviu0626nyLQR1DU7IPK0OzS8ogpC+spy7RN6Ucd5LHuLiRwLHqLEDIRAYl3dJG2Ixwar9il/4Kz3f7XcXXrCEFLEvSKW+ikwEhIsC1UNrF74DCgCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610913; c=relaxed/simple;
	bh=tWlHgiNvsnU2mVtkjwXa2GDAJ15bTvUgokYNJtatffg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ejtH0J6lRbNCMLJj59Ei1dgT18fBYkvhCB/rZKuruN6rBrr5ByUG+gLUD/ToRYH7KzRLKMZgjkBNB2khcjp4NioBpuBFduD/HbPhYhh2vg+r3VCOZL8QDYRPOCJBBIOOdwgiztgHfx/YZDFHweLjgnqigVakyltjXsOO8gNvKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=NsxAUPtD; arc=none smtp.client-ip=173.203.187.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="NsxAUPtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1746608646;
	bh=tWlHgiNvsnU2mVtkjwXa2GDAJ15bTvUgokYNJtatffg=;
	h=Date:Subject:To:From:From;
	b=NsxAUPtDiQjOkUvRM2LTWVQ4tQoXyZcnmeLj1N8wtWjhD0wHXoWLNhzZRrN+tJrio
	 aHZTVtqpiSLY3aKcXgwyK5O/pdKlyrMh6AL39pRaLOetuOW0xBkDhbTJQAiy2lxpwy
	 VwwKqLaP9UfWiaw5Cw5yTfGMFqWoUMXHNUFbUWmk=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp19.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 80E735150;
	Wed,  7 May 2025 05:04:06 -0400 (EDT)
Message-ID: <d12145a2-6a84-48c7-8bb7-39ed25598432@mev.co.uk>
Date: Wed, 7 May 2025 10:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 typo errors
To: Heikki Huttu <heissendo88@gmail.com>, hsweeten@visionengravers.com,
 linux-kernel@vger.kernel.org
References: <aBoz0MJWkKk7zSZg@Lappari.v6.elisa-laajakaista.fi>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <aBoz0MJWkKk7zSZg@Lappari.v6.elisa-laajakaista.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 16c595c8-cdf2-463d-ba82-1e0af40d8ac8-1-1

On 06/05/2025 17:07, Heikki Huttu wrote:
> Fix errors produced by checkpath.pl about typos.
> 
> Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> ---
> 
> V2: Removed all modifications done to parenthesis. Edit Patch name and
> only typo fixes remain.
> 
>   drivers/comedi/drivers/adl_pci9118.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
> index a76e2666d583..67c663892e48 100644
> --- a/drivers/comedi/drivers/adl_pci9118.c
> +++ b/drivers/comedi/drivers/adl_pci9118.c
> @@ -32,7 +32,7 @@
>    * ranges).
>    *
>    * There are some hardware limitations:
> - * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
> + * a) You can't use mixture of unipolar/bipolar ranges or differential/single
>    *  ended inputs.
>    * b) DMA transfers must have the length aligned to two samples (32 bit),
>    *  so there is some problems if cmd->chanlist_len is odd. This driver tries
> @@ -227,7 +227,7 @@ struct pci9118_private {
>   	struct pci9118_dmabuf dmabuf[2];
>   	int softsshdelay;		/*
>   					 * >0 use software S&H,
> -					 * numer is requested delay in ns
> +					 * number is requested delay in ns
>   					 */
>   	unsigned char softsshsample;	/*
>   					 * polarity of S&H signal

The patch looks fine, thanks.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

I don't have commit access to any pulled trees, so could you please 
resend with Greg Kroah-Hartman <gregkh@linuxfoundation.org> in the Cc 
list?  Feel free to add my Reviewed-by: line above when resending.  You 
can leave the patch at version v2 since the patch and description hasn't 
changed.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
