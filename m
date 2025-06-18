Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937B277804;
	Wed, 18 Jun 2025 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231953; cv=none; b=jMYaMtNvEavgvyswJmghqNE5qHmKvjO/OnqHEOgLOCrEO6GD9H98meGnf5yLFVwtcC0mdf4Xa8KV+xfgpyYj2HNvNtqvPkY1sKxx1hQixhMIO0oqgpENOWFAHODJCBLyyyFfEX8xIRSNKoXszPP8J/DDyurdwWoGin053oJ5YTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231953; c=relaxed/simple;
	bh=LVwGURChkwBiY5Cp8D81sB5+JCpkpaZuIaeZH9YkgHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRascUizKidCdAtTY55v9tBbfS8kNmPOwwGB6dlQoFFZDxj/ZDwxUxhSOlzg1H8pGYdt3LopNH4eI6M17/ZtmpSfamO4itJn6atCIOKCwx76Yc8Dp3KvdMbZvEd3DCCt0rUvgTYieM//RgvL2G2GtCxzdtWXFTr6UMFdBDu46j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DW+0m7jR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DW+0m7jR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515DBC4CEE7;
	Wed, 18 Jun 2025 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750231952;
	bh=LVwGURChkwBiY5Cp8D81sB5+JCpkpaZuIaeZH9YkgHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW+0m7jRs/ZwWQqb9KQfAt2SnRbzJ1aNs3noi5fYOAV7sLyIBY7seJdnXx5EhFXoZ
	 GERSSH9N4LL0CmXRnhimezKbLk0cvKY/tN3/4CLcM3q5/Q9bzMmjkd1xtCPhE0rTKb
	 PkedKCSa3CYpS32YUBRIADUXaB+wVbmP7rqqA568=
Date: Wed, 18 Jun 2025 09:32:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xiehongyu1@kylinos.cn
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [PATCH v1] xhci: Disable stream for xHC controller with
 XHCI_BROKEN_STREAMS
Message-ID: <2025061838-grumbly-basically-d01e@gregkh>
References: <20250618055133.62638-1-xiehongyu1@kylinos.cn>
 <2025061801-gosling-urchin-c2cb@gregkh>
 <b623ea20-84cd-414d-9b5a-f94d972f819f@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b623ea20-84cd-414d-9b5a-f94d972f819f@kylinos.cn>

On Wed, Jun 18, 2025 at 03:08:09PM +0800, xiehongyu1@kylinos.cn wrote:
> From: Hongyu Xie
> 
> Hi Greg

Please do not sent html email, the mailing lists reject it :(

> 在 2025/6/18 14:03, Greg KH 写道:
> 
>     On Wed, Jun 18, 2025 at 01:51:33PM +0800, xiehongyu1@kylinos.cn wrote:
> 
>         From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
>         Disable stream for platform xHC controller with broken stream.
> 
>         Signed-off-by: Hongyu Xie
>         ---
>          drivers/usb/host/xhci-plat.c | 3 ++-
>          1 file changed, 2 insertions(+), 1 deletion(-)
> 
>         diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>         index 6dab142e72789..c79d5ed48a08b 100644
>         --- a/drivers/usb/host/xhci-plat.c
>         +++ b/drivers/usb/host/xhci-plat.c
>         @@ -328,7 +328,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>                 }
> 
>                 usb3_hcd = xhci_get_usb3_hcd(xhci);
>         -       if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
>         +       if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
>         +           !(xhci->quirks & XHCI_BROKEN_STREAMS))
>                         usb3_hcd->can_do_streams = 1;
> 
>                 if (xhci->shared_hcd) {
>         --
>         2.25.1
> 
> 
> 
>     Should this be backported to stable kernels?  if so, how far back?
> 
> At least 5.4 lts.

Great, please mark it properly.

>     What commit id does this fix?  Or what hardware does this fix?
> 
> I'm not sure. can_do_streams was introduced by 14aec589327a6 ("storage: accept
> some UAS devices if streams are unavailable") in Feb 11 20:36:04 2014
> 
> before XHCI_BROKEN_STREAMS was introduced by 8f873c1ff4ca0 ("xhci: Blacklist
> using streams on the Etron EJ168 controller") in Fri Jul 25 22:01:18 2014.

Pick the proper one as you obviously have hardware here that you have
tested that needs this change, right?  :)

thanks,

greg k-h
