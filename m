Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9431D5CE5;
	Thu,  3 Jul 2025 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751569692; cv=none; b=q/grgXdUtLn1xH2ldZzUFJPZ9Z9N+PmYP2CSlLjYtr/2cj5yn9e7WUYBsPNNGmeaVckGx5V78gTc3Id3JX3StMkNKye8AsPkHLR12jtwG0SYzwSjGJQF05KrpQVdmxiz0j1nz6rKqNFneG+0uBXaWQaP1MI4TWo1o66RDrrB42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751569692; c=relaxed/simple;
	bh=OOHxmdACIVQQer+dO9X0b+FWtWrJwbSjdxM4TjscUmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pT2YrW36FfrWLiD3ugdfw/nbY5TuzUc21PGH2FQAha6VWOcGnKMyNNz/sLpsOcVBV/wlfEKxwJvWMjJEh3nSUt8srK7pQmclY0pGW2R15zAz9qfEZrnqbnOHddp5cIPlSQ/uuliOUeZK1cUwuYRYkqyIBxFVr/LsQg4m5bHHYPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=znr3S6uW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="znr3S6uW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1852C4CEE3;
	Thu,  3 Jul 2025 19:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751569692;
	bh=OOHxmdACIVQQer+dO9X0b+FWtWrJwbSjdxM4TjscUmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=znr3S6uWelYY4CwMnYAiyqbGe9vwf9zfTQXk8ghEajRiLvJow1IRZ+EmecTAbKUXW
	 Bs5FmHRuGa9/93xIs0FLUlsS0OFZvYb5AHQNJA8M85zwd56A/UEV5HjGf1BA32e0Ni
	 TgvQf6C2LUPVQeoJCA2/C3DGuFKGAfFjMJF74ZYM=
Date: Thu, 3 Jul 2025 21:08:08 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Ryan Mann <rmann@ndigital.com>
Cc: "johan@kernel.org" <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] NDI FTDI USB driver support
Message-ID: <2025070338-snorkel-monastery-994d@gregkh>
References: <YQXPR01MB498723CF19D915DD09C8C0B5DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQXPR01MB498723CF19D915DD09C8C0B5DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>

On Thu, Jul 03, 2025 at 06:53:06PM +0000, Ryan Mann wrote:
> Hi John and Greg,
> Tag: ndi-usb-serial-ftdi-6.16-rc4
> Public branch: https://github.com/rmann-ndi/linux-kernel/tree/ndi_usb_serial_ftdi
> This represents changes to the FTDI USB serial device drivers to support a new NDI (Northern Digital Inc.) product called the EMGUIDE GEMINI. The EMGUIDE GEMINI will support 1.2Mbaud the same as other NDI FTDI virtual COM port devices. It was noticed in making this change that the NDI Aurora was included in this "quirk", but it does not support rates as high as 1.2Mbaud, so it was replaced by the EMGUIDE.
> Previous FTDI devices produced by NDI all used the FTDI VID (0x0403) and a very limited set of PIDs that Future Technology Devices allowed NDI to use (0xda70 to 0xda74). Since then, NDI has reserved its own VID (0x23f2), and used two of the PIDs for two experimental, non-production products that didn't use the FTDI chip for USB connection.
> This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header file. It also reserves PID 0x0003 for the EMGUIDE GEMINI, as well as stubbing out PIDs 0x0004 through 0x0009 for "future" NDI devices. In the unlikely event that the NDI hardware team chooses to implement the USB functionality using something other than FTDI chips, those "future device" lines may need to get removed.
> As the EMGUIDE GEMINI product development has not been completed and the step to write over the default VID and PID has not been completed, these code changes have not been tested with an EMGUIDE GEMINI. However, the code changes were compiled successfully using Ubuntu 24.04 locally and tested as a module using an NDI Aurora system.
> Thanks,
> -------------------------------------
> Ryan Mann
> Software Development Lead
> 103 Randall Drive
> Waterloo, ON, Canada N2V 1C5
> www.ndigital.com


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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

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
