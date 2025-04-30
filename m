Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C137E107
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014752; cv=none; b=RYjQ23mw3qbDvxaUQD1OArEdw1MrvcITojrmkkMgdSzq7b4v7uR+dyOVNOHjmxQ8vSK8gS/lsy1TH7Wr9Yf4eXfRksJzDC5Vms+GTeuK5YIRxVTTvYb2m9tbNx2TyxNULIjFnQWPUnwjCGximWvj/kiTRQcve3SJ7UQkpb70hMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014752; c=relaxed/simple;
	bh=iuF4qsmIoy02nl8tvmkWalwES4KqQZm4f38Hi7k2PM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPomrC7UGt0nOtRAjNLmAlMUMAXhtHyJv8x+SOOmfZPBbNDJIOHsAg7dJsMigfu5DD6YNOH0+ov7JqPnfjrmW02twuU4AeKINpFLnREMHqyKEGHU2hoPJGWUPzic2uiWajOnNukQWpNow34YP44qJPipL/7U/N4w8rWX6J1qA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LmNiAgBN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LmNiAgBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C56C4CEE9;
	Wed, 30 Apr 2025 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014752;
	bh=iuF4qsmIoy02nl8tvmkWalwES4KqQZm4f38Hi7k2PM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmNiAgBNTpUltVkPFao59ewr2pvpyx53kSALCg5XZz5fNQR7CtHpiNhgYkoCa91Pg
	 torreztM7t3wN+glfcLz7IyRN7xLXh8PjAwWDQCAxbPvb0m0022Hvx/T1GllLsILwF
	 VIpbX4zDnC4ZUcy7XmpQ2hGLaDmf+pFYYsw8yMWU=
Date: Wed, 30 Apr 2025 09:25:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux@treblig.org
Cc: tglx@linutronix.de, fei1.li@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [REPOST PATCH] virt: acrn: Remove unused list
 'acrn_irqfd_clients'
Message-ID: <2025043030-theology-driveway-20b8@gregkh>
References: <20250430003623.313541-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430003623.313541-1-linux@treblig.org>

On Wed, Apr 30, 2025 at 01:36:23AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> It doesn't look like this was ever used.
> 
> Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> Acked-by: Fei Li <fei1.li@intel.com>
> ---
> This is a repost of the patch originally posted last in May
> last year as id 20240504174725.93495-1-linux@treblig.org and
> Ack'd by Fei Li on 20th May, in Zkq183IzBA6cV9FE@louislifei-OptiPlex-7090
> No one picked it up.
> (Fixed one typo in the subject line)
> 
>  drivers/virt/acrn/irqfd.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/virt/acrn/irqfd.c b/drivers/virt/acrn/irqfd.c
> index b7da24ca1475..64d32c8fbf79 100644
> --- a/drivers/virt/acrn/irqfd.c
> +++ b/drivers/virt/acrn/irqfd.c
> @@ -16,8 +16,6 @@
>  
>  #include "acrn_drv.h"
>  
> -static LIST_HEAD(acrn_irqfd_clients);
> -

Odd, why doesn't the compiler complain about this?

I'll queue it up in a bit, thanks!

greg k-h
