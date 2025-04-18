Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0601487ED
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985968; cv=none; b=RAgk6zwgPrG2DUifJCZ/wGJKntEt5pCP2hzyn6Eoq17lZLYaDRQlG3mh4OKZZtzOHmi4jfXNd4dJnZ1BHVYdxpjbw5SFk7Q5lKR+5A69bID9cFMWnS6CRzJvdX42UtBP0ZBK3IV4eQalQJ4ITUy28YdjjVUmOtDTMaUIvbZO+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985968; c=relaxed/simple;
	bh=jWBJDIpfJCgwpkVZxllIxEJnCFehqOuTWUxpAXb/WfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+vt0PlzNsv03K79oL3hJgjKZAjT7aKyTlYx3Bw0n6aQ8HhXIYv7NprSjiHn8UJ1rt3ze3qRGYfsrCL4RxWAkjx9ugg8DA4ulSMX45gsouFqUoi9MlHjrOXJrJRuUwgFfmrGJguyiZ4uf1EzYVSJSvgf14IWKshJAOBwSssTmZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M7K2Msr4; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M7K2Msr4"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c55500cf80so146801485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744985965; x=1745590765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6APAAgkdwXx+GMRkpzxt50sUuE/lXDS+eMQx0vd1bc=;
        b=M7K2Msr4MjtkvvM28Tv8I+kWisIwMN0BrtZ2pktOhIRcmiYczptPXhkyWydkMeBcPx
         onhseyWABrALhE5ZU/icjMOTZTi81UOmzjYkrBUoRYjEhQRYi07dig564IJ/bxwGzPqi
         K+6d/pIuiAPzpPw1FIBl84CpeAfhw+5lJzE4+6S3M4KyqiC+/KZ0oDr+G+s6olFzwd9W
         Bl/qJrC5Idm+oOAbhWmUjQ7lHxm/xIK5Nsnl0viPcD8++gBlpPeBF4btaeM7SPjx3TLS
         PV19k5JoSUczSIfQzj5GGxsnKNY/Z8sqCqeGs466iur4R6Lt+E2IKYdmn60Eg0jpZGFX
         ui5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985965; x=1745590765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6APAAgkdwXx+GMRkpzxt50sUuE/lXDS+eMQx0vd1bc=;
        b=CXRQ8cmH5qxjEWKKVN34Yo5Vil21Seo+LcZ7VmgnLc52gNXy1DlTyOVvn3FCg8W5fJ
         E9itsXSzKoMKiJ1KiolYgAMjqk6peTEo9q09KOgvBcBQZ3qUBXBjA+g4x0feBDD2tJrT
         o3LQh9aBX2wsJ+92DOuMC/BdD8e1eF71G+LvPCji2+BJuk1OqWIJkMWe1o5oogqqlye+
         u8VIJCZYUvWnOJj8Uiu7Nngjvi+HA2SKMYlduJ5tXjrktqhy586icbHKUn/i16JIs7RO
         o08EPD1gNHtWHNst4hE0ndqi1/U1FtuuoDle8m8gOn0237shr/lgsXfsnTi2bARuDPTo
         8WOw==
X-Forwarded-Encrypted: i=1; AJvYcCWUcIv2bh/ex+BhZAI/iq0dHoJkQFJMFAK9UcXRzQ+uqZ24HnN80jgeHTL9Erc5TihUVk0sC1thRvnjDYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyym6JFPn6s4sxId+RU5CWy3d8+cC38XyPUAwfzFErhbWMxprdf
	uBeahane0CQMYPx9iIuRm3gUQQM/e095+fuTAM4ggKglPu0Y9HXrnyRwllRVxxESy+W20lvNDXY
	=
X-Gm-Gg: ASbGncuc84zpiE9lh/mZLL9cfotVtHbuPXW8ZAo4+jNVa2C/OkcGxObKY1hhtJZa6JA
	dIXMUv4c4yZViNWUV5OJ9w03SUDkyYnh8ubn1Ui7TACTcHPAwyFAfQqJyWA57fKpNC0T2z130fc
	6B+IxZNqU36G0Lo+2B/2CnqJy9DCNSz73KWtox/qesBqUHyOjipIiuFWyzHNw1rHWHwiIOZi4FJ
	VXpcNl4lFzrYGD2Sss064OGeivzpA1IzV+bNoygSE8I7k6oMOzPYzeZgaJnqifZpdsk0hlLkXam
	0fRLRZM5hZNTmVGd2Onroy8FJc5wYXvOKFWVWujML3kxqsq6ml8TS+1BYQg=
X-Google-Smtp-Source: AGHT+IE8f6HsMD+WBgLjvzPKpK4xqq9qZvoM91B/zfoBpQsGcLkYXTAjkkZg1car0dsJqQrxiuo52Q==
X-Received: by 2002:a05:620a:29d5:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c927f5944emr445043885a.5.1744985965485;
        Fri, 18 Apr 2025 07:19:25 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac5472sm111387885a.63.2025.04.18.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:19:24 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	mika.westerberg@linux.intel.com, ribalda@chromium.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Prevent null pointer dereference in
 usb_acpi_add_usb4_devlink()
Message-ID: <b886efd9-a611-4e0d-86dd-ae88ba53c3f6@rowland.harvard.edu>
References: <20250417195032.1811338-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417195032.1811338-1-chenyuan0y@gmail.com>

On Thu, Apr 17, 2025 at 02:50:32PM -0500, Chenyuan Yang wrote:
> As demonstrated by the fix for update_port_device_state,
> commit 12783c0b9e2c ("usb: core: Prevent null pointer dereference in update_port_device_state"), 
> usb_hub_to_struct_hub() can return NULL in certain scenarios, 
> such as during hub driver unbind or teardown race conditions, 
> even if the underlying usb_device structure exists.

Those are not the conditions addressed by that commit.  The commit was 
specifically meant to handle a bizarre situation created by the lvstest 
driver (a child device added "by hand" after deconfiguring the parent 
hub).

> Plus, all other places that call usb_hub_to_struct_hub() in the same file
> do check for NULL return values.
> 
> If usb_hub_to_struct_hub() returns NULL, the subsequent access to
> hub->ports[udev->portnum - 1] will cause a null pointer dereference.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> 
> ---
>  drivers/usb/core/usb-acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 935c0efea0b6..ea1ce8beb0cb 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -165,6 +165,8 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  		return 0;
>  
>  	hub = usb_hub_to_struct_hub(udev->parent);
> +	if (!hub)
> +		return 0;
>  	port_dev = hub->ports[udev->portnum - 1];

While this test may not be strictly necessary, it doesn't hurt since 
this isn't a hot path.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
