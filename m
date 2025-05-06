Received: from smtp116.iad3b.emailsrvr.com (smtp116.iad3b.emailsrvr.com [146.20.161.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C68827CB2C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532704; cv=none; b=Mh7sV46rh+1vvNOH5N7PXO0e+c6JjYh8Xm80q+Ppx0ElB3EWw+2LKrB/YAfVoIz/Cw5IVsUyWHe0nBVb9GqZNKBWAK/il5QWfyoN338BI6JYPbqc4Iq/2ZPAZ1OJlCjWaYD62QH71f3ry6tkOK6rPNP+7BGwM56VbX9IPO0yuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532704; c=relaxed/simple;
	bh=QQR8qWg7A5mduDFuvzDplm22sXNXPTKrRBTdPjRF9N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tsGuFch4a4RnK5bVK3KfVMEr07xu16VZB2tsN4dwQsLHoG5IVMmwxBqg1iz6rJ36t6fCbRaTtQv2pGy2MEayy1NhWWIizrp5FB967NJcxJdj59d0IDaDlyIGuybjWRr2l68mZPwlGEGRakjgCyUag/nMJKtN+1O774AAJ4tGd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=sCghYxR/; arc=none smtp.client-ip=146.20.161.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="sCghYxR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1746532695;
	bh=QQR8qWg7A5mduDFuvzDplm22sXNXPTKrRBTdPjRF9N8=;
	h=Date:Subject:To:From:From;
	b=sCghYxR/uWQ9vyO3omGaMh6L1exr4aZvS2wAZbwfY3RLONDiiq1dg29WX7qqq7fUe
	 d2ZVpmd6HWZlgeclgfDxar/l+9nDAVw9TTvlxZuvnmow/cte8XKR4GH/lAsIsASUtz
	 cv1XI6pawPCK2LLhOi09zTY0uKOCH0xISBNzSePI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp7.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 1F857601E2;
	Tue,  6 May 2025 07:58:14 -0400 (EDT)
Message-ID: <7a448fa7-d389-4822-9e18-54520c9dc1e9@mev.co.uk>
Date: Tue, 6 May 2025 12:58:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: comedi: drivers: adl_pci9118.c: Edit file so
 that checkpatch.pl has 0 errors
To: Heikki Huttu <heissendo88@gmail.com>, hsweeten@visionengravers.com,
 linux-kernel@vger.kernel.org
References: <aBelroMtikijLKuk@Lappari.v6.elisa-laajakaista.fi>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <aBelroMtikijLKuk@Lappari.v6.elisa-laajakaista.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 6cf4e193-e6eb-492c-99c3-60069b98f492-1-1

On 04/05/2025 18:36, Heikki Huttu wrote:
> Change lines that checkpatch.pl throws errors about.
> Errors were about extra parenthesies and typos.

In general, patches should be split into logically different things, so 
coding clean-ups should be separate from typo/spelling corrections in 
comments.

Also, the "Staging" tag in the subject line should only be used for code 
in the "drivers/staging" directory.

> 
> Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> ---
>   drivers/comedi/drivers/adl_pci9118.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
> index a76e2666d583..691c8d6bb767 100644
> --- a/drivers/comedi/drivers/adl_pci9118.c
> +++ b/drivers/comedi/drivers/adl_pci9118.c
> @@ -32,7 +32,7 @@
>    * ranges).
>    *
>    * There are some hardware limitations:
> - * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
> + * a) You can't use mixture of unipolar/bipolar ranges or differencial/single

Note that "differential" is also spelled incorrectly in the above comment.

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
> @@ -946,8 +946,8 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
>   	devpriv->ai_add_back = 0;
>   	if (devpriv->master) {
>   		devpriv->usedma = 1;
> -		if ((cmd->flags & CMDF_WAKE_EOS) &&
> -		    (cmd->scan_end_arg == 1)) {
> +		if (cmd->flags & CMDF_WAKE_EOS &&
> +		    cmd->scan_end_arg == 1) {
>   			if (cmd->convert_src == TRIG_NOW)
>   				devpriv->ai_add_back = 1;
>   			if (cmd->convert_src == TRIG_TIMER) {
> @@ -958,9 +958,9 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
>   					 */
>   			}
>   		}
> -		if ((cmd->flags & CMDF_WAKE_EOS) &&
> -		    (cmd->scan_end_arg & 1) &&
> -		    (cmd->scan_end_arg > 1)) {
> +		if (cmd->flags & CMDF_WAKE_EOS &&
> +		    cmd->scan_end_arg & 1 &&
> +		    cmd->scan_end_arg > 1) {
>   			if (cmd->scan_begin_src == TRIG_FOLLOW) {
>   				devpriv->usedma = 0;
>   				/*
> @@ -983,7 +983,7 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
>   	 */
>   	if (cmd->convert_src == TRIG_NOW && devpriv->softsshdelay) {
>   		devpriv->ai_add_front = 2;
> -		if ((devpriv->usedma == 1) && (devpriv->ai_add_back == 1)) {
> +		if (devpriv->usedma == 1 && devpriv->ai_add_back == 1) {
>   							/* move it to front */
>   			devpriv->ai_add_front++;
>   			devpriv->ai_add_back = 0;
> @@ -1185,7 +1185,7 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
>   	    (!(cmd->convert_src & (TRIG_TIMER | TRIG_NOW))))
>   		err |= -EINVAL;
>   
> -	if ((cmd->scan_begin_src == TRIG_FOLLOW) &&
> +	if (cmd->scan_begin_src == TRIG_FOLLOW &&
>   	    (!(cmd->convert_src & (TRIG_TIMER | TRIG_EXT))))
>   		err |= -EINVAL;
>   
> @@ -1210,8 +1210,8 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
>   	if (cmd->scan_begin_src & (TRIG_FOLLOW | TRIG_EXT))
>   		err |= comedi_check_trigger_arg_is(&cmd->scan_begin_arg, 0);
>   
> -	if ((cmd->scan_begin_src == TRIG_TIMER) &&
> -	    (cmd->convert_src == TRIG_TIMER) && (cmd->scan_end_arg == 1)) {
> +	if (cmd->scan_begin_src == TRIG_TIMER &&
> +	    cmd->convert_src == TRIG_TIMER && cmd->scan_end_arg == 1) {
>   		cmd->scan_begin_src = TRIG_FOLLOW;
>   		cmd->convert_arg = cmd->scan_begin_arg;
>   		cmd->scan_begin_arg = 0;

In my opinion, I don't think it is worth removing a few, harmless extra 
parentheses unless the lines of code need to be changed for other 
reasons.  It just increases the maintenance burden by increasing the 
likelihood of backported bug-fix patches failing to apply.

> @@ -1279,8 +1279,8 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
>   			} else {
>   				arg = cmd->convert_arg * cmd->chanlist_len;
>   			}
> -			err |= comedi_check_trigger_arg_min(
> -				&cmd->scan_begin_arg, arg);
> +			err |= comedi_check_trigger_arg_min
> +				(&cmd->scan_begin_arg, arg);

In my opinion, moving that opening parenthesis of the function call to 
the next line makes the code less readable.  There is a checkpatch.pl 
rule that prohibits spaces between the function name and opening 
parenthesis of a function call, but that rule is not detected when the 
opening parenthesis is moved onto the next line.

>   		}
>   	}
>   


-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
