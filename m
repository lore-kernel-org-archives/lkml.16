Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A613774D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306690; cv=none; b=jlRVvyZu3rbxvCsgzeIZqXa1Xn/03/Lr2YZWGgIcJW5W8YyUAmbqdsT2L/X87XlaA/VGFl2TOSB5xPjekFjfWNa4ViG8xxuoimCUQ7kdU+ioQsKZED1CmJ6XiU8sRaWlHBepiRbqKmzGj6R5xCCfzYK2iXOZCK0KALbO+s3h3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306690; c=relaxed/simple;
	bh=cW3X/1l5DA3SyHYpoeE3wmWFl5HQHupNn4AGDvpECGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8nBg7eIcRTRi3it3bhwM8EK9VusOfUhKMfA7KiIgV5ODRauVqFDXdpwbR0BPoSahzS6hBBEKYNUOGPlpwsQVt8jP82U91nNkz2JiERwHUh2qbEhNn14aaynGqn1Ve90vydHSYitbbqmV2drIg01zrYQuWqOb/dfXezDorRJiTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LXLNY+TD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LXLNY+TD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58c2430edso51426171cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751306688; x=1751911488; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=erEsNKokw34c6fzVq8Iff8Xr2LxtRfcIefrOmooELf0=;
        b=LXLNY+TDXb6kXB2SYPTDaLy3lShmJ02tvFw9U9+YXXXVHo/gIGzeunQDF4cnTT1zdF
         wBPlLo1Ql2vWwbD71+X1WMXwjqu10jhTbaqkU/oEOQdbzho0cJhN6af/duop0xL/MGlw
         gbXxdcJFsjU6CFMQyAKCrw1BBZio3w5dkZuNz8bs4vAiIaxPITwQPRsEl6zCpcuHIAPI
         lXpqRdm12UN7Yl08/+9Of3hQ/avddO/LoXpx+AZo/yu5m7467GNcSysbD78kKXM2+CKT
         ZB7i8TuLCeIVb8w/6jFZjnyGuShPJlh0V7LwChYBvl5Nl48ZJ43owQxjjxa2TOq31zbb
         EkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306688; x=1751911488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erEsNKokw34c6fzVq8Iff8Xr2LxtRfcIefrOmooELf0=;
        b=MuRh2CE0yZpjxLwnKeUDGxtcoqz7FWl90dOwjnQCCCHUFM3dmMKRU6kkhqKYfkvjnC
         65SpF0+LNbcitzJiNAm+gzJU9nzvC+UCmGvS6XJZWyoulvbRQWlJ+49BB8AkHeG3BUgx
         P0aQdu3ZH9puGeotLTOlQWrL27ItEXmrl8BiNpSRirhghqaY1/xPkhuSH3562TloRKwI
         LW4viFqKkRzx8H3Y5kuyXq/7+fhOPD+KHjstWsuwjZMxPSjl3euXD1KEcBlweGJVhwys
         Fo7tnbQvotwQRaLgbd/17WiiiDlTlI01QvTf7OxO5qMASs3gvZpbOQSnRBquojiRyrAA
         3ZOw==
X-Forwarded-Encrypted: i=1; AJvYcCVcMCI7NsG5rEXCH99KBOg1YEuZJDngilfRn43aH69clqPIqGjrlXAdItDjWuP5t2EYMzHUARwcHEtKBtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHZJcNa2UQu+DR9o2KeqmA8uXHVk8aZgTfTtxruck2GNKHLzg
	vjQZeaYlkdMJry+sRuUcTZYRWvWSa8ghPQejQT+XBveRaywanDOViKqKuvuOKELOpw==
X-Gm-Gg: ASbGncsDb+W7da/fb/BMQDdZHlEodOPcp5JLpqELTyShPTLwy9kXhKG4EHw3fad7pRs
	l1sUpHt9KQB97InE93r5eLnfu6+3cvix+65jaFsAjajOJE89NF8Ms3q7qSIixPaM/T1xnp3RlG9
	SBTPmN4NdllFCQjbtMPkgN3+4uEfxURFtee88BMmZI1Cu/6DLPokRpK+n293KgLb4hRQRIc1QFb
	fIdyE8boYPfoc/bcKXqHFTPDbpXZt7CxV8DjDJqscXru4jpb/cPL6wWmGmWxBc98dI+VEZSLIy0
	3W+KIbf4KYSKyik1/DuJiMR2fpsFJjyq56YNd0kRmG+2geD9XDMvHmwV4G5hIBJMoPm5N0Hq9qT
	ZhkQNEINR2fZK5/tRbdGH54wK9HetLBj+qnDq8N2FOu1HxvvSLPqWpAwhczLnV0iLig==
X-Google-Smtp-Source: AGHT+IHVplLr2izmjHui16C2/FXqXP9pOtf9cY3ZF0du3ZM+vGUwMiL0nF8egmOoDqrGlYkWhHcZ4w==
X-Received: by 2002:a05:622a:1a95:b0:4a6:f823:5b3a with SMTP id d75a77b69052e-4a82ea82a34mr8860541cf.15.1751306687859;
        Mon, 30 Jun 2025 11:04:47 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c252sm64310111cf.43.2025.06.30.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:04:47 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:04:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kannappan R <r.kannappan@intel.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pawel Laszczak <pawell@cadence.com>, Ma Ke <make_ruc2021@163.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
	Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
Message-ID: <892491bb-e7f4-4096-b502-f1bf2fd0fdec@rowland.harvard.edu>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <1a85b3c3-66e1-4a31-ad39-391b03393bf9@rowland.harvard.edu>
 <8cc10112-23a7-41af-b81f-7fc0c097d34d@oss.cyber.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cc10112-23a7-41af-b81f-7fc0c097d34d@oss.cyber.gouv.fr>

On Mon, Jun 30, 2025 at 01:20:27PM +0200, Nicolas Bouchinet wrote:
> We moved the `usb_authenticate_dev()` call in `usb_new_device()` in order to
> perform the authentication only once the device configuration is complete.

usb_new_device() does device initialization, not device configuration.  
The default configuration is selected by usb_choose_configuration(), but 
the config can be changed at any time by the user (via sysfs or usbfs).

> Also
> we think we need to split the problem of handling the authentication vs
> authorization in two parts.
> 
> - which component has authority to set the two fields ?
> - where/how is it enforced ?
> 
> To answer the first question :
> 
> - We think that the authenticated field can only be set by the
> `usb_authenticate_dev()` function.
> 
> - it is less clear for the authorized status which is already manipulated by
> the sysfs (usbguard) and the default hcd policy.
> 
> The reconciliation between the two fields could be done at the enforcement
> point. In `usb_probe_interface()` instead of simply checking the authorized
> flag
> it could check a more complex policy. For example:
> 
> +-------------------+----------------------------------------+----------------+
> 
> |                   | authorized                             | not
> authorized |
> +-------------------+----------------------------------------+----------------+
> 
> | authenticated     | OK                                     | NOK         
>   |
> +-------------------+----------------------------------------+----------------+
> 
> | not authenticated | Depends on tolerance in local security
> |                |
> |                   | policy (set by cmdline or sysctl)      | NOK     
>       |
> +-------------------+----------------------------------------+----------------+
> 
> 
> This way it would also help to handle internal devices. When
> `hcd->dev_policy` is
> set to USB_DEVICE_AUTHORIZE_INTERNAL, only internal devices are authorized
> by
> default on connection. So external devices will have to be authenticated and
> then authorized via the sysfs. Internal devices will be authorized and not
> authenticated.

Okay, that seems like a reasonable approach.

Alan Stern
