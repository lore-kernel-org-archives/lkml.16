Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18E2F8C33;
	Fri,  4 Jul 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645787; cv=none; b=BTZiTkjVkdz5T7HnqQkU2u1Y9Q8HwPWJz7mPIoK24DKy7VaBlB1TNF0lKxyilEXAfULOPtN0oV3VVQnFgSicVUZbPPopFUfpn7DXls0a1QWcKvm85WtiShLsNwcPCnjmeBXcvyayyB7X0dsiWLXaTYrBPx1gFu1YRAINHC1ihl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645787; c=relaxed/simple;
	bh=5lH6lYE8m6b9Zr5mOukyCfPbFiVSeDoSxhhm/wkmjwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzoZziv7Z2MdOqdLywqdP++EtHDqVlFHgOxK9wuKGqu5ViYJoBrlTZ1s94F9EuPdm+nsbkhFcxKSYDD3nLuXLewgOC3hi2BkZ2fNZq4DDgcr92Zf15CT8SI61ZaJv2MXGP+S77vhrurkDjjaYp74Kx3A/sO42Wv1gZYvrWbLW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xOW3QqQS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xOW3QqQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC63C4CEE3;
	Fri,  4 Jul 2025 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751645786;
	bh=5lH6lYE8m6b9Zr5mOukyCfPbFiVSeDoSxhhm/wkmjwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xOW3QqQS+yr9YRyGOUQNJKDXCuo1RVy6ED/RpidKtCxSef2jdEbcvyuzdj+9QytN4
	 O1zl7Yp5/7KqJ3Vvnxc0RgP3EJvTsvJPONggaJIadDhtMGoGZClPkJIs3ZPOP/z3Gl
	 RlPgijz43/G+Q2PHXlzj6+J/8qrqTaJzSN7tRv4I=
Date: Fri, 4 Jul 2025 18:16:23 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Ryan Mann <rmann@ndigital.com>
Cc: "johan@kernel.org" <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] NDI FTDI USB driver support
Message-ID: <2025070427-pebble-stir-d4b0@gregkh>
References: <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
 <YQXPR01MB49879486E5B552D1B0A0E5F6DF42A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQXPR01MB49879486E5B552D1B0A0E5F6DF42A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>

On Fri, Jul 04, 2025 at 02:44:46PM +0000, Ryan Mann wrote:
> NDI (Northern Digital Inc.) is introducing a new product called the EMGUIDE GEMINI that will use an FTDI chip for USB serial communications. The EMGUIDE GEMINI will support 1.2Mbaud the same as other NDI FTDI USB serial devices, by mapping the 19200. It was noticed in making this change that the NDI Aurora was included in this "quirk", but it does not support rates as high as 1.2Mbaud, so it was replaced by the EMGUIDE.
> This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header file. It also reserves PID 0x0003 for the EMGUIDE GEMINI. Finally, it adds this VID/PID combination to the USB_DEVICE list in the ftdi_sio.c.

Please take the time, read the documentation, and then resend new
versions :)

You forgot to wrap your lines here.

And you forgot to version your patch.

And you included the old version of the patch below this patch, making
it impossible to apply.

Take the weekend, relax, and come back with a version 3 of this next
week.  There's no rush here.

thanks,

greg k-h
