Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0FD20F099;
	Tue,  4 Feb 2025 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677984; cv=none; b=b+wdtV51mpocu//7e97i8P7IgUuH/Q7qZffWuUv7FiMRIfLQwyaGCde22vG44A+ztnRkQcgjpnFrKhbWW3Nmz9ePNMcwum2Qn4+nloQW3ZHUf6JaHRqrOs+K0/7sGYCmD10hmpp5CrS5KWOFqm14v7N2vw4Q4QjKO3xcjNMBp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677984; c=relaxed/simple;
	bh=TWL4iLNw5cm5rAfKnMS5XyAWJzggv/DuQS/HPjQKqFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJcKTkL4MIhN4+jUTSxGWT5CeYDtNKR+AdsoV6h6UGKIXDY7ZjkdiAZj4rutmqi1lffhJno2JhDrrkpX+eaEfVBTDY6FyA9xiKaF5qA9tCAAdIS/UwUTtuwf5ZpjN1yeAl/11bTJEJF9uacYSyJw+5szxYo/PFuMGo0rltBuYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w9reTlay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w9reTlay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E45C4CEE2;
	Tue,  4 Feb 2025 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738677983;
	bh=TWL4iLNw5cm5rAfKnMS5XyAWJzggv/DuQS/HPjQKqFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w9reTlaylSepHHhBSXTUROojiobUZ82MfC1RxPosSsehhYFnQMhxVK1p4LR4M15ba
	 53J4dVwvaesJoccrRMiFe/PvgeAsQQ1IduLgFTRu2EWYT0jFafAPxonGv8mU2qQxYE
	 +647IS9PH4ZWkoJsrU6fo03MclOjL3QahYE7l2ls=
Date: Tue, 4 Feb 2025 15:06:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Message-ID: <2025020401-unloved-judiciary-2fb8@gregkh>
References: <20250204135131.3094-1-ajithpv.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204135131.3094-1-ajithpv.linux@gmail.com>

On Tue, Feb 04, 2025 at 07:21:31PM +0530, Ajith P V wrote:
> - pr_info() of hp_82341_attach() in hp_82341 uses 0x%u which is defective.
> - The iobase is of u32 and correct prefix is 0x%x.
> - This error reported by checkpatch with below message:
>   ERROR: Prefixing 0x with decimal output is defective.
> 
> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
>  drivers/staging/gpib/hp_82341/hp_82341.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
> index 800f99c05566..740c450914dc 100644
> --- a/drivers/staging/gpib/hp_82341/hp_82341.c
> +++ b/drivers/staging/gpib/hp_82341/hp_82341.c
> @@ -723,7 +723,7 @@ static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *confi
>  		hp_priv->hw_version = HW_VERSION_82341C;
>  		hp_priv->io_region_offset = 0x400;
>  	}
> -	pr_info("hp_82341: base io 0x%u\n", iobase);
> +	pr_info("hp_82341: base io 0x%x\n", iobase);

When drivers work properly, they are quiet.  Lines like this should just
be removed.

thanks,

greg k-h
