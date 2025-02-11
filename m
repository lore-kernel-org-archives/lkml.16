Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580061F1527;
	Tue, 11 Feb 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268678; cv=none; b=W1rnCwuFHudWB7j7anrZ7bLaaNJCLrFcv/PiC5FpgDlpxXVjauZf5lIDEAOO5fegAFhNA+ubrRSrbIQ/yuSJri+0LN/RAtZM0I7sPvVWCzBXlWobzON1vegnVfX97FL2h/QTKz1slNI5UO1IN2Oq0NdP+Y6KMeXRVWwOS54a55w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268678; c=relaxed/simple;
	bh=BLMnHrrBxYwNEmforv64ll3sTdEYcLU2ckHm3a+dNns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJwKp6UBpwEojYAqUOVDgItiJUPWZxPehJmYCX+euYHFmj/haH3iI5Zj3bnpqxOsB2iDj62bC9yFw80ipIf5A7FV0kf7SMrbCzoA0taIdo3UHgDbOtHejSQB23bq3e8MDPBQg+ARAb1AJ6Ajo6+yMMTnoMMLc2+SiwC8btUMLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q1K3AHBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q1K3AHBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DFDC4CEDD;
	Tue, 11 Feb 2025 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739268678;
	bh=BLMnHrrBxYwNEmforv64ll3sTdEYcLU2ckHm3a+dNns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1K3AHBs91U7u4rJfmd7uAb0xsSec+KHA6lKWQYzs3gwycDYVX7Hizy0PfKJzkB4+
	 Z7Uu98mwifV+KMQx+s9EtWJdBexPcvB+mIvV9P3IgRfQNHlkXamH7Z5jlRRE0zoXbg
	 PL3KC9OAbDG9Tr5Zx7ka3s32t2CfLvuGls5gquHU=
Date: Tue, 11 Feb 2025 11:09:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Remove unnecessary TTY_LOG expansion
Message-ID: <2025021119-unsalted-shrink-1211@gregkh>
References: <20250210121552.33455-1-algonell@gmail.com>
 <20250211093051.15993-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211093051.15993-1-algonell@gmail.com>

On Tue, Feb 11, 2025 at 11:30:13AM +0200, Andrew Kreimer wrote:
> When drivers are successful, they should be quiet.
> 
> Remove the unnecessary TTY_LOG expansion.
> 
> Suggested-by: Greg KH <greg@kroah.com>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
> v2:
>   - Change commit message/body.
>   - Remove the TTY_LOG line as suggested.
> 
> v1:
>   - Fix a typo in TTY_LOG message.
> 
>  drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> index 85322af62c23..b2c4d1d26f12 100644
> --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> @@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
>  		return -EIO;
>  
>  	SHOW_STATUS(board);
> -	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
>  	return 0;
>  }
>  
> 
> Interdiff against v1:
>   diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
>   index 1c3e5dfcc9ec..b2c4d1d26f12 100644
>   --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
>   +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
>   @@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
>    		return -EIO;
>    
>    	SHOW_STATUS(board);
>   -	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
>    	return 0;
>    }
>    
> 
> Range-diff against v1:
> 1:  779e59d74722 ! 1:  463e7000d1a7 staging: gpib: Fix typo in TTY_LOG message
>     @@ Metadata
>      Author: Andrew Kreimer <algonell@gmail.com>
>      
>       ## Commit message ##
>     -    staging: gpib: Fix typo in TTY_LOG message
>     +    staging: gpib: Remove unnecessary TTY_LOG expansion
>      
>     -    There is a typo in TTY_LOG message:
>     -     - sucesfully -> successfully
>     +    When drivers are successful, they should be quiet.
>      
>     -    Fix it via codespell.
>     +    Remove the unnecessary TTY_LOG expansion.
>      
>     +    Suggested-by: Greg KH <greg@kroah.com>
>          Signed-off-by: Andrew Kreimer <algonell@gmail.com>
>      
>       ## drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c ##
>     @@ drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: static int usb_gpib_attach(g
>       
>       	SHOW_STATUS(board);
>      -	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
>     -+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
>       	return 0;
>       }
>       
> -- 
> 2.48.1.268.g9520f7d998
> 

What is the interdiff at the bottom here for?

thanks,

greg k-h
