Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F93209663;
	Mon,  3 Feb 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595389; cv=none; b=rtv/hRn5fEpRQTEkmuz6KnMAE4eg6do8JUaZmGcR7cgpAtrwpxi8qkZYRPEuQLYWQw5+3Mxi7JvwcOgufXlukg8OUN8Po1EAOzAtGg5cQZtTVdAJ4su0bPK7GaAmMkQh/TWHTqKyV9ycW9Gtfq2Fijwl3AZRpkt6hov4xE6dNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595389; c=relaxed/simple;
	bh=8qgfryZ7viPhhxNGgEyY95CPaKiRcFphlVNW5fD5P1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyChAccn2p50b1mnolEZcSCGxu1iX1gPuMDpbOolqYM3xPwMGDWgx7JqFeIrVKBJ8zJSvD1QSf7V6AY950h3CPY7qIEcsMeBUXFISfTHWnr9/jMQbPnVyPzDbFyZx5nSlWGmPxAQGPQDLZWq1MkuOvqjDU/vQrmmLK1av77c04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SDHl1Rgn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SDHl1Rgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37450C4CEE3;
	Mon,  3 Feb 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738595388;
	bh=8qgfryZ7viPhhxNGgEyY95CPaKiRcFphlVNW5fD5P1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDHl1Rgnb2fCvfroAKmsLrnwfKbe4OoU9dNW+Ic97SulEsC9/7Ero23QyZBrdBPzg
	 zJVRKoZnEU/mXGQrQXl9p9PpBgm7B7z6rVqlF9PZVmtcBYX7UmVRZLFLWXBDJsW3ol
	 2/h5e+pRydITNP4Vyfz8s7Uay5GAeHFgakpmyTU4=
Date: Mon, 3 Feb 2025 16:09:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ian To <onlyian4981@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: format no multiple blank lines
Message-ID: <2025020335-impromptu-renewable-83e8@gregkh>
References: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>

On Fri, Jan 31, 2025 at 12:22:33AM -0800, Ian To wrote:
> Avoid adding multiple blank lines. Reported by checkpatch.
> 
> Signed-off-by: Ian To <onlyian4981@gmail.com>
> ---
>  drivers/staging/gpib/hp_82341/hp_82341.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
> index 0065ebd9747c..d3cf1f43a1ef 100644
> --- a/drivers/staging/gpib/hp_82341/hp_82341.h
> +++ b/drivers/staging/gpib/hp_82341/hp_82341.h
> @@ -26,7 +26,6 @@ struct hp_82341_priv {
>  	enum hp_82341_hardware_version hw_version;
>  };
>  
> -
>  // interface functions
>  int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
>  			size_t *bytes_read);
> -- 
> 2.45.3
> 
> 

Does not apply cleanly to 6.14-rc1 :(
