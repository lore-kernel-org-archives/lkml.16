Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54C208962;
	Mon,  3 Feb 2025 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595805; cv=none; b=P0hMqLxSjmFPYDmDk6ZUKtniNXVmewFZemBKydeHXMq3TGm/6r8/JJS3nPvbPrY6SAkaITVaJRUr84rr4FYg9AbZzWkkOdFqiv6TJYulBtYUyfaRaN+pFPGX/trh+5Ir1gPfL5sTolDTeLVme+sotijWRV0vIbwAGzjFkT60CGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595805; c=relaxed/simple;
	bh=0EPvOJXELd0wVjfKkyXE14sRhGTOYJ39nTUg8LeXyqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPY7n423zCyvxCNFf7jN3FGaByxLBtmfEYS2TDjrMNcH3+aI6FQgTiyPAA3vnrDOCfIXKYUlNfFLWBSIpVpCx4ctRSwD29Vk0/iM/1HKu/NExZ95PNVc2oQ2zZl71f0tjU7l+MZsU3JRoJfiuB0MABsAEYY64CP4VoGr8H2o+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ipf33lRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ipf33lRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB634C4CED2;
	Mon,  3 Feb 2025 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738595805;
	bh=0EPvOJXELd0wVjfKkyXE14sRhGTOYJ39nTUg8LeXyqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipf33lRHtQMbAnYoHGCXJBuowF97giKjprXfPQzpuNAAPMshjYWjmhFTv/5MXeMLu
	 diAQg2B4Rog0pt6fbu0znIlbTzn4Gur9vNICtXS+M/z1IGLFQBLX/5Kh0MmrF3KKo/
	 MAgBHpT2YQ/+RruDeZkrwFGF9w0Tzr/syOFiWlPg=
Date: Mon, 3 Feb 2025 16:16:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: U Michel <ulv@on2.de>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW support
Message-ID: <2025020308-anemic-sasquatch-efbe@gregkh>
References: <20250125094005.1132785-1-ulv@on2.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125094005.1132785-1-ulv@on2.de>

On Sat, Jan 25, 2025 at 10:40:05AM +0100, U Michel wrote:
> From: U M <ulv@on2.de>

We need a full name, sorry.

And where is patch 1/2 of this series?


> 
> Update the USB serial option driver to support Wistron NeWeb M18QW.
> 
> ID 1435:3185 WNC M18QW
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1435 ProdID=3185 Rev= 3.18
> S:  Manufacturer=Android
> S:  Product=Android
> S:  SerialNumber=WNC_ADB
> C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
> E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=(none)
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=125us
> 
> Tested successfully connecting via picocom and submitting at commands
> 
> Signed-off-by: U M <ulv@on2.de>
> ---
>  drivers/usb/serial/option.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 1e2ae0c6c41c..b166f1607b0e 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2285,6 +2285,7 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1435, 0xd191, 0xff),			/* Wistron Neweb D19Q1 */
>  	  .driver_info = RSVD(1) | RSVD(4) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) },   /* Wistron Neweb M18QW */

You forgot a tab before the comment :(

thanks,

greg k-h
