Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064D158520;
	Wed, 16 Apr 2025 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786213; cv=none; b=jfOOjiVuFZGliTlDepkwZrfzwX8/lrAVKSbVu8EaisLpaU5ET0HaNxvGy3x7AlFxvAtE3/7KgagjVV2JY1pFvhbPBEYApMTYtbRQvufriBz+6GICPW3G/W/Rbfzr3sURffVpVd9b6fBJaN3IcVXZy5XkqVOaCd5HfcFotKK5mlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786213; c=relaxed/simple;
	bh=asBMeECU2HsBzDeNTI//gVVSxeF5UyT7mE0ZoRLepfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcmFWbDlrdwn2NHvTUjY3xciveTpUDcyrD+8wLCRsZFBCiUNjE1lErta6TQSBYRQBSnA47y2UG7PEuGFtYyXleV1/eqvlp5EuOIJZ0Y9wTdcdm2HXIsvEQ5bVMq9Dx9dYTbxpHfL8JwovIsTZ4fpjUx6nTf7Ly50yNKwF4ms/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mg5//rod; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mg5//rod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA623C4CEE2;
	Wed, 16 Apr 2025 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744786213;
	bh=asBMeECU2HsBzDeNTI//gVVSxeF5UyT7mE0ZoRLepfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg5//rodLrev1guMYmm3XxtOo2OToMYPwkHuDDBaf5M760qOmptEfMf2n8qZfGSdu
	 JgzPBb8oD00+Sm5ua3uGbNlLrxshbySrw4Zup5T+0P/6CM8pgnJ+5I8hPBR7lguMJT
	 gFNXrUAnh0r0sVew+1R3Pg5ZIharP+YaAgd8l0R8=
Date: Wed, 16 Apr 2025 08:50:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <2025041628-glacial-mumbling-1fe2@gregkh>
References: <20250415111003.064e0ab8@foxbook>
 <2025041508-rockslide-endpoint-a48b@gregkh>
 <20250416082958.20c34504@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416082958.20c34504@foxbook>

On Wed, Apr 16, 2025 at 08:29:58AM +0200, Michał Pecio wrote:
> On Tue, 15 Apr 2025 14:26:26 +0200, Greg Kroah-Hartman wrote:
> > > This fixes a 6.15-rc1 regression reported by Paul, which I was able
> > > to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
> > > endpoint_disable() not followed by add_endpoint(). If a configured
> > > device is reset, stalling endpoints start to get stuck permanently.
> >
> > As this fixes a bug, can you add a Fixes: tag with the needed
> > information?
> 
> Hi Greg,
> 
> Sorry for bothering you, the real bug is that I forgot to carry over
> the RFC tag from v1.
> 
> The 6.15 regression is currently solved by reverts Mathias sent you.

Oh good!

> The underlying bug is much older, I would have to research where it
> went wrong exactly. It was very obscure; a class driver would need to:
> 
> 1. call usb_set_interface(), usb_reset_device() or something like that
> 2. submit some URBs to make the toggle/sequence state non-zero
> 3. call usb_clear_halt() on a not yet halted endpoint
> 
> Then the host endpoint wouldn't be reset, but the device would.
> 
> I know of drivers which do 1 and 2 or even 2 and 3, but I have not
> yet encountered a driver doing all three in this order.

Ick, I don't think we want the individual drivers to have to do this,
the host controller _should_ handle it as you are trying to do here.

Anyway, I'll let this one be on the list for now and wait for others to
review.

thanks,

greg k-h
