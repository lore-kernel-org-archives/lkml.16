Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB322B8A7;
	Wed, 21 May 2025 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801274; cv=none; b=ZKtyJtOkMzbo1WXAa9dzlWxQqVDSUAb8WnvJlgGEEiXbe1Kw4recbyAJyMSO1bBjaaX73NgL+JSVJl9ig37Ny19o2ZJm9brAWAoj3rVsxNChlvNFN5sRopzd93Nk00pH2sz0GQORE9hFiJruZHMp0CfRCMmL0L8zOiYD32QOW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801274; c=relaxed/simple;
	bh=EbjHwBst1kv6R88NJwKWtG1sty6i5/6Ngz/j9vr5B6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfOwr+HO6+jTwSKkFFkkQ/YmVUl/I5+lL7BKDIvgdsT06QiSpq5B/ZdB+QsJfuVwtytE7kgcJtnWHg8sDh6YONE9MFfWeoloVyQxE4O5zteiIw8ZzjWwt+sXpTBFa6wF9pBJHsVJN0kzU6ePbhsJg9mKI6Njbtr0RXguhqCHmo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r65b0z7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r65b0z7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FC1C4CEE4;
	Wed, 21 May 2025 04:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747801273;
	bh=EbjHwBst1kv6R88NJwKWtG1sty6i5/6Ngz/j9vr5B6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r65b0z7okjSVMsu3jB5yQTF4RnuUjNSPiyFIzoXQ+XGqxvDtcVl3z7FWtazP9ckFv
	 JaYTW+BTSOuOtms5dLk977vGbOUfEU5LkrC4WgVDv5kNZp/MFpvmPwWpWSVce2Yd6d
	 hHEWHHvbzbGE++XfQ/kUzPryqNHShzWbAkXyy76o=
Date: Wed, 21 May 2025 06:21:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny-Dev <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Message-ID: <2025052155-macaw-deplored-8eb9@gregkh>
References: <20250520222610.8776-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520222610.8776-1-donnyturizo13@gmail.com>

On Tue, May 20, 2025 at 10:26:10PM +0000, Donny-Dev wrote:
> This patch fixes a checkpatch
> warning by renaming the function
> _Read_EEPROM to follow the
> kernel coding style (snake_case).
> 
> Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 1c9e8b01d..557bfdf09 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -15,7 +15,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
>  	{GEN_CMD_CODE(_Write_BBREG), NULL},
>  	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
>  	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
> -	{GEN_CMD_CODE(_Read_EEPROM), NULL},
> +	{GEN_CMD_CODE(_read_eeprom), NULL},
>  	{GEN_CMD_CODE(_Write_EEPROM), NULL},
>  	{GEN_CMD_CODE(_Read_EFUSE), NULL},
>  	{GEN_CMD_CODE(_Write_EFUSE), NULL},
> diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> index cb44119ce..e4e7e350d 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> @@ -636,7 +636,7 @@ enum {
>  	GEN_CMD_CODE(_Write_BBREG),
>  	GEN_CMD_CODE(_Read_RFREG),
>  	GEN_CMD_CODE(_Write_RFREG), /*5*/
> -	GEN_CMD_CODE(_Read_EEPROM),
> +	GEN_CMD_CODE(_read_eeprom),
>  	GEN_CMD_CODE(_Write_EEPROM),
>  	GEN_CMD_CODE(_Read_EFUSE),
>  	GEN_CMD_CODE(_Write_EFUSE),
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> index 208040874..63373d665 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> @@ -684,7 +684,7 @@ enum {
>  	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
>  	GEN_EVT_CODE(_Read_BBREG),
>  	GEN_EVT_CODE(_Read_RFREG),
> -	GEN_EVT_CODE(_Read_EEPROM),
> +	GEN_EVT_CODE(_read_eeprom),
>  	GEN_EVT_CODE(_Read_EFUSE),
>  	GEN_EVT_CODE(_Read_CAM),			/*5*/
>  	GEN_EVT_CODE(_Get_BasicRate),
> -- 
> 2.43.0
> 
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
