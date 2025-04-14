Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F908200BA1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614733; cv=none; b=i1Bpds280TNLllPo2kSISVSPYgdv2eYR6FqKFvQaqearijuATtfnMtdOz0OFQGw05E6vfR9DHwEZw6QGk/jsf6zkWRNMphovMxp0FWjwreb8Ii5v3TrkTnr4ijx4V2tTQkipT9MixfDyIlL5PziHUSgCI05IHDZOhnqqBzBjicQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614733; c=relaxed/simple;
	bh=r8xAmv1iqMx/1BORD/0eJN03iCjzNzsvU9CRWngwkhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA+3FBd/a/U0lYMelFCpfygvnEoHo7j7zkz74hk8lmGvtBjJn+s0lQYSyUJla/kW+SCyp3U8ihCCFToHWuSp/j2hvMo/dxU6xXhv1ZsGptDRbpkWEerkHo0ZYt1qCZL+bFZ+DS3KTm7HI/HXSK2VoTJtUE1N20ZII3rw3yyseH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDAsUWO0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDAsUWO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7A4C4CEE2;
	Mon, 14 Apr 2025 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614732;
	bh=r8xAmv1iqMx/1BORD/0eJN03iCjzNzsvU9CRWngwkhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDAsUWO0owCUuxtLr1Szl4tL/qtWhQMs3Y8ATeswXQv/pk6jY2PjHDe22XK2uLlOv
	 5kFrpU5XJXyzGtOfxyrGYeNsp8Tp8vXFcXsYEvbFwdi43ZFexJ9J6jfpoJz7H+UlrT
	 eNT2uz2qiKqHFpQ62nQXpqZ2DXr81WQVbxPTWpkXIOA05I0kEoKhAEeFyutnhb67ZK
	 pfoO1GiNUmVW/ZkIakHUqTci2lJy5UV3nCpLKflJlKzYyFBGc/+1rxgFxutUrX1f7r
	 CsDGZsYcn0wB1d+uPsQVEtqGUhZWen1l9i/E/rSbE+ZfdrfwqtX6vq2Tuoc+qD37G0
	 kU3/JXk+1iBXA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4DzD-000000001Vq-3VR5;
	Mon, 14 Apr 2025 09:12:08 +0200
Date: Mon, 14 Apr 2025 09:12:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Adam Xue <zxue@semtech.com>
Cc: dnlplm@gmail.com, fabio.porcedda@gmail.com, chester.a.unal@arinc9.com,
	larsm17@gmail.com, vanillanwang@163.com, mank.wang@netprisma.com,
	michal.hrusecky@turris.com, linux-kernel@vger.kernel.org,
	imocanu@semtech.com
Subject: Re: [PATCH] USB: serial: option: Add Sierra Wireless EM9291
Message-ID: <Z_y1R58dXXUNTnOt@hovoldconsulting.com>
References: <20250411170538.711844-1-zxue@semtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411170538.711844-1-zxue@semtech.com>

On Fri, Apr 11, 2025 at 10:05:38AM -0700, Adam Xue wrote:
> Add Sierra Wireless EM9291.
> 
> Interface 0: MBIM control
> 	  1: MBIM data
> 	  3: AT port
>           4: Diagnostic port
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1199 ProdID=90e3 Rev=00.06
> S:  Manufacturer=Sierra Wireless, Incorporated
> S:  Product=Sierra Wireless EM9291
> S:  SerialNumber=xxxxxxxxxxxxxxxx
> C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=(none)
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Adam Xue <zxue@semtech.com>
> ---

Thanks for the update.

In the future, when you revise patches remember to include the version
number in Subject (e.g. "[PATCH v2] USB: ...") and also a short
changelog here below the --- line (so that it does not end up in the
commit message).
 
>  /* UNISOC (Spreadtrum) products */
>  #define UNISOC_VENDOR_ID			0x1782
> @@ -2432,6 +2433,9 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0xff, 0x40) },

> +	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9291, 0xff, 0, 0) },

Why do you need this third entry?

>  	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */

Johan
