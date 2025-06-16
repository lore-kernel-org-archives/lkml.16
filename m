Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA001F8BCB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083728; cv=none; b=oCDVRVBSdP8/4dfBVKEnPoUr/zI9FFwKRFgkpZ3kZyYZYZuQV0qCcRrOI49+UfzQTqcra/SavPE2rlXHGwJT7FpjAz3JEkQEZjFJTeOTNmvaUQkN2f6pmHr23TTz+8w7R+HH1TMkooZfh4+jOT2yluD0yYCIrNT7fgpDrQGCJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083728; c=relaxed/simple;
	bh=EcxvIpEWclMxaJAsph2NWesfM1qns9ecQ6lEnW7wk6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvWzhoDZdchjCT+6vqt9jmEvv0rRzP5sXUb/Rk6pIoIUXKzZlNtbvcfg7SnWTHrbkw+GMw43LXbm9DIWP3RSSL3YmZC7aL9nLrHWV+6u7itvd6rB4fp7dpa4C0eCWGcoT5UWNPqDZQINyf1AJdY9JaEzIS6l4gdrq0yheQNWALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nj0pQHFS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nj0pQHFS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b3526e6so61200051cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083726; x=1750688526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fozdmCAWMyOAs3p72EEWYMApG9+X4azDWL8aPdMiZic=;
        b=nj0pQHFSdbZas/rfvZGCsOotygAIBiJvISmNekC01pEO++L2xy7jOv9JQnDAWh10Hx
         1pyPRH1uawqG7Ju2sLjfgk9uDaEcmK0zfPUrYx88rJh3E+Xey39lVds9ax9OwGMmqgIp
         bqU5YKBOYPXgJl4KaPpp5d/hYHsQG9Hi9A6OTEQdX0x+n9riyZXZpzhcnxqD4I5cFUqo
         4T9rKtACTZPyey4IpaulTAhF1HCO35y/BjgQo9bAANqqSEAFxqxhQKvsr5arsS0gte4D
         x5sxATA6EZWeFA4AdWBXQD2/WbUTjdjQ7N+UQtTx9MMhTPzlM2e6AkV0WNjCDHYT45gG
         33bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083726; x=1750688526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fozdmCAWMyOAs3p72EEWYMApG9+X4azDWL8aPdMiZic=;
        b=XgXnkSpY3NKDVD4ixMm96O1o1eiviGes39I9IaoKLKDqzP9dgMNPssdX3NytAiKJwK
         JBGugGavVnWjkGtewHBt87//0iHY6r1Sdqhqz5fdCjFM+RlaSESoWDDhebNBVyGQLQx1
         FXmMgCY1PPasv1iGmo8g6jdVY/+HrMMIfBUjGauzIva+R61krvZYR3XX+upZC70XH8b3
         zVxKnvtnPU2INs4XqN8BAs182dLoIQJbWgiD6DXWkgvFO26KnJU5Bq84YjVyv0o1nrKv
         a+wrOHjURFTt28vMDvICzZp0j8VxhoQzgs2pjJpQ+HYWjLmfLb55zVULNi+R7MT005mB
         i39Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0jHYOinT/yNDHg0KziI1ZzN2lObTS3iY5tToCPXWed2VNmvZ1IqRK0nCn9+6oEWYyxaYBgBgOVAhbQmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2URi+EkYhyH/eXEP2xnB07AUYcsVsORtXfmyImnXfkcYGNTrz
	WXdWQx0czyp+CIV8aSrRJo1qmUoywYIqfpoTVp675hpB2Hugiv8fEvZc3rRuE4RNSg==
X-Gm-Gg: ASbGncv8TLRJMhJJ7YDH3ggURqHRet+oIdq8PGLtwUk+c2nGz2BcyDgeqZ3aXPKQm8L
	skqz3qUx8XP0NqOdBiO+c7K+kr4OCiapfpJjvneO8yO/zYMQYUmDdbrlZxYlK5HCnGSNUE98UUA
	3pkCe6oMzexEUnpebi0Te+S02Xpo7wcaLaEQbNHuTwUxJCcl8zfbzc+Xlm/1rVJef0yC1FLGN2t
	E0hQMYPy8GoJbIZlcSGmfoInwjq8RoZcDl/yf0azq2M6ribLY6PSfI+wqNhD+LtxPZimnz8C7Ja
	lbCmuHAoPd3+VBW5hOfsKVpXIN49jGX9yZOPIXYTvJP2V8htWIXEOzMJC6GnQem522EJjf14Fid
	oaMno
X-Google-Smtp-Source: AGHT+IF+uW7h6BydcaXEhoofxRMfhUEGoTFOUQys1M++I5eYRv90JMsfWUu2mw7xHfP3lolLk7Wl8Q==
X-Received: by 2002:a05:622a:303:b0:476:8288:9558 with SMTP id d75a77b69052e-4a73c5c1853mr140268961cf.46.1750083725716;
        Mon, 16 Jun 2025 07:22:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a313418sm49589591cf.34.2025.06.16.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:22:05 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:22:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <7378855b-7ff0-4f9b-bb7a-f187aeb41956@rowland.harvard.edu>
References: <20250616061759.3384-2-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616061759.3384-2-mihai.sain@microchip.com>

On Mon, Jun 16, 2025 at 09:18:00AM +0300, Mihai Sain wrote:
> Use the dynamic device name instead of the hardcoded string "at91"
> when creating the OHCI host controller driver.
> This ensures that the device name is more flexible
> and correctly reflects the actual device in the system.
> This will be in sync with ehci at91 driver.
> 
> Before this patch:
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: at91
> 
> After this patch:
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-at91.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
> index 5df793dcb25d..12fdb18934cf 100644
> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -193,7 +193,7 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
>  	if (irq < 0)
>  		return irq;
>  
> -	hcd = usb_create_hcd(driver, dev, "at91");
> +	hcd = usb_create_hcd(driver, dev, dev_name(dev));
>  	if (!hcd)
>  		return -ENOMEM;
>  	ohci_at91 = hcd_to_ohci_at91_priv(hcd);
> 
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> -- 
> 2.49.0
> 
