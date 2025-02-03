Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBFD20A5D6;
	Mon,  3 Feb 2025 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606923; cv=none; b=jaH6FdSEptOW5AWTBEqtPHy9oOAZfjT73HLNUQB5I7zp5bE9OgLysfePSeq5nNMsrra82qkESw3G1Oo0qhsuXG0UIfw2qixVSpViIgvtIjbAebrknzNYfnv9Grv3oREMJo/LkUOg8WAP46NQv22BZ5dn4R+Py8xHk06AoEfOgAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606923; c=relaxed/simple;
	bh=ff9LOYVWeZGJ4TX27DW8rbUdYIQJ8XkCIwqaBvwjJNQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DCGpIsTldPUBJpbC+15lGIKxYrF8skJyUP5SOZPQIwrcpSuvsZYvp6vAQKZvRnC5r9Mj8cDYoc1qW9M96lOTfJ1bOyIxgvygWSgLYxlV7oe22rRQeNVLsPlkYwkcyS3LfgbfmcZZ6a+Z+CzC3NiiW6kSvQG3kgrF0j0hsQriAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=bi2NZCBi; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="bi2NZCBi"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F62DA1B01;
	Mon,  3 Feb 2025 19:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1738606912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbah6WO9K8AOSoHgCHY9ffMDZ0t900yYN0eOxbcrQHk=;
	b=bi2NZCBiSOYPuuGb62GZir7P9MvINm8AvcRtl/yiNZKlzYhECK8YO1bKxibQOdLlErmF2L
	sCGtiNgmlu8vWXjYEumSoeq9nAijWayi5EZEJFkKxTMDuKmucwY1DAL1hvZZHmGkCod3Ux
	RqFN7xDhQRS6fFQYMM1QYkWFMjVeksOSo6zT0oQT7voeLCYwfa3/xWEBdO5JNAUCyNtuih
	+80sWY5aUAGwakDsAFYqEWNg98/dy7HJlwrJ78c+kz863JIz+z+SqBSJ7q4Q+J6+bOsqUw
	I2LuE+XU1Bfs4Qnj4czkE9Oq4yi6PcjebIe3vIlnVJsgA9vDQtWIaAiuESUHeA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 19:21:51 +0100
From: nb@tipi-net.de
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: xhci: Restore xhci_pci support for Renesas HCs
In-Reply-To: <20250128104529.58a79bfc@foxbook>
References: <20250127151051.1a91bbe6@foxbook>
 <20250128104529.58a79bfc@foxbook>
Message-ID: <4bc1580689b3eebc529cc0436b62798b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 28.1.2025 10:45, Michal Pecio wrote:
> Some Renesas HCs require firmware upload to work, this is handled by 
> the
> xhci_pci_renesas driver. Other variants of those chips load firmware 
> from
> a SPI flash and are ready to work with xhci_pci alone.
> 
> A refactor merged in v6.12 broke the latter configuration so that users
> are finding their hardware ignored by the normal driver and are forced 
> to
> enable the firmware loader which isn't really necessary on their 
> systems.
> 
> Let xhci_pci work with those chips as before when the firmware loader 
> is
> disabled by kernel configuration.
> 
> Fixes: 25f51b76f90f ("xhci-pci: Make xhci-pci-renesas a proper modular 
> driver")
> CC: stable@vger.kernel.org
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219616
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219726
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Can confirm that this patch restores the old behavior, where xhci-pci 
supported the Renesas controllers when an external SPI flash is 
attached. I've tested with a PCIe extension card on arm64 and x86 as 
well as with a arm64 (Raspberry CM4) based Revolution Pi Connect 4.

Tested-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks!

Nicolai

> ---
> 
> new in v2:
> - changed #ifdef CONFIG_XXX to if (IS_ENABLED(CONFIG_XXX))
> - renamed the PCI IDs table to clarify code intent
> - small commit message improvements
> 
>  drivers/usb/host/xhci-pci.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 5a5f0b2dba4d..54460d11f7ee 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -657,8 +657,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, 
> const struct pci_device_id *id)
>  }
>  EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, "xhci");
> 
> -static const struct pci_device_id pci_ids_reject[] = {
> -	/* handled by xhci-pci-renesas */
> +/* handled by xhci-pci-renesas if enabled */
> +static const struct pci_device_id pci_ids_renesas[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0014) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0015) },
>  	{ /* end: all zeroes */ }
> @@ -666,7 +666,8 @@ static const struct pci_device_id pci_ids_reject[] 
> = {
> 
>  static int xhci_pci_probe(struct pci_dev *dev, const struct 
> pci_device_id *id)
>  {
> -	if (pci_match_id(pci_ids_reject, dev))
> +	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
> +			pci_match_id(pci_ids_renesas, dev))
>  		return -ENODEV;
> 
>  	return xhci_pci_common_probe(dev, id);
