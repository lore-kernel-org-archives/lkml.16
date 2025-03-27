Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CF40849
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743041355; cv=none; b=bnH4cj0ZY2MhJ35wdSra9QkVGGfbSTwZ48GWTp43ios5lcfamChx9jGxx4G0aXk03NwwL680pN7u1zj6BO45f7fKeRhcwNtgFvBXnlRfeyvIlKIp4EUtLjFfHIa4yA6eonU2YC9S1qqVkZkGdrOAJhCE+2eG9nMw0t2BX8bZmwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743041355; c=relaxed/simple;
	bh=5spy1yKHVXpEg3P9hBw5222af7PjVTx5S03lVn/BFcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIUc3IoFU3Ea+DtCkr52SxBum1N3axcH0Wor2yuvll7TweT8tUXBWC7SO6uk51Dx5Mtyznvz5kiM8uZDL4D07MXgpcfiIup+n2JriGVLcf9WLu+lfs6T3psHCfPPqfgY1oHNPLR++HNb19Lu5CiK6OKVKTwU43tWll+DdIwI1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=d72qPCjL; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="d72qPCjL"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c542ffec37so56610985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 19:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743041353; x=1743646153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79cx+8ACjWKrZ89232rtiJEaOIGqZ26RyTWzZJhy7rQ=;
        b=d72qPCjLXFg2ujvQP06HaAQ35FvR0/ewvXDWnrEBS/+4q3UDIvnftbcSJxI37Q821r
         Zdys61KDWeIYIzhIu8CRfwY49coWuRiQA+5cgXQ6KgPvvMGwWsagvwByPgsQfq9pvhYq
         ZpL4w2tYaVIXn4Ui9wcD9NFE1hDPTbyHSYzcdLfKkisW5PDrvImO3p2/0NLhljYrmSK0
         o48ld+BkRNJEmYkdfCHay3G4utW6HpnjBRp1X8DQHZVolLv3Ww9KAvv+PDsb5WDhQViM
         8OyNwysFWyb006TOAfSfryGbzdYGRBdKJRj0COyFBmnOLb7lASrCmIZwe1YXRdeqiL+/
         rzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743041353; x=1743646153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79cx+8ACjWKrZ89232rtiJEaOIGqZ26RyTWzZJhy7rQ=;
        b=pnWNfLvuqZjlbhk271VgW+yYyg97NokpHLW8H9k4fBDnnEJtWaE1klyO5gLwb5DXqI
         oKiMQElEzNGeIKZq13+nGaw8nbLVt6+d7kC/QZO/wjbox9X2KNdP4ILrCG53B5doOcDU
         BxQYzApeQVzu844/dgZJ+sT23Ovpc02eZl3tF+s5U598UhLX0zeflO3x6gwnbCM3Krat
         e4bBwsOrOvt29081WtaGz2b6nJqGV+jV3fDvgu9KUPRKdA6EeMDzjvq8mYajJSlrwYpz
         C29QV/9OPN5M6uedtA/CWNWq/AohPlI74Rr3cMpqvBGhhca8AHwIDkRp4F+65PUfXVcw
         JExA==
X-Forwarded-Encrypted: i=1; AJvYcCW0NCnMYCBV0AJxbp7QEc+/ZULJyFnzZFqFraQLZ2EvyFd+SkuhwgbNalU/on9zi2644bA2mGwk8TzGqYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCduL2CXRqVaiPyLoKo0/8IjTcUcybX7aQ/OVwT3GJOURTrxV
	EKLEch+J9SHH44yCk2+DgFipWwWEC4yOQKE7Jq3Bbv2PYGKdfmmCqqM8uAm/yQ==
X-Gm-Gg: ASbGncunWwnIM/UNGwpoMTJUvdvTD6lv9Q+A+5xlJDySzwYQK9hjI00O9X3+BqSjx/l
	CePMPJc2N8b9243fdi5qZdnpCh4pItRvMPNxsSVq+MfOqAd0PF2Xeq6URF/4D31LJCAXg7OML59
	BqegswmL6/6WGlM3HYGyjy4mob5xr0vIANnnko2Nt9YSe7BkgCbnzpHKwv1mZKvCj1Pwsg6AdYb
	0i6Ngd1L511oyt6muC2roa0FR6BU9kSXhPtAJtgwBtIkCvM9oBSGeNbvcelaDBkAt7SwyC9Q+ye
	EXwKA0UlejaRkacYhUtqVqNwCNCPj8Yb0fw+OI3hHXjc/SbZWayOtn9E
X-Google-Smtp-Source: AGHT+IFnqxtiuuABbBZmtaPkF+aX7XG7GD0zxD8mthtjaohOMNrpHGKcsX6ZEzPbik1dgKeWFmUp+Q==
X-Received: by 2002:a05:620a:1a28:b0:7c5:47d3:10c2 with SMTP id af79cd13be357-7c5eda81867mr304509085a.52.1743041352647;
        Wed, 26 Mar 2025 19:09:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::419f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92cfe65sm835006885a.28.2025.03.26.19.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:09:12 -0700 (PDT)
Date: Wed, 26 Mar 2025 22:09:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] usb: ehci-fsl: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <1e82761e-8554-4168-8feb-561abbe49f7e@rowland.harvard.edu>
References: <Z-R9BcnSzrRv5FX_@kspp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-R9BcnSzrRv5FX_@kspp>

On Wed, Mar 26, 2025 at 04:17:41PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the structure. Notice
> that `struct ehci_hcd` is a flexible structure --a structure that
> contains a flexible-array member.
> 
> Fix the following warning:
> 
> drivers/usb/host/ehci-fsl.c:414:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/usb/host/ehci-fsl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 26f13278d4d6..c720d55f4982 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -411,12 +411,13 @@ static int ehci_fsl_setup(struct usb_hcd *hcd)
>  }
>  
>  struct ehci_fsl {
> -	struct ehci_hcd	ehci;
> -
>  #ifdef CONFIG_PM
>  	/* Saved USB PHY settings, need to restore after deep sleep. */
>  	u32 usb_ctrl;
>  #endif
> +
> +	/* Must be last --ends in a flexible-array member. */
> +	struct ehci_hcd	ehci;
>  };
>  
>  #ifdef CONFIG_PM

While the sentiment is laudable, this mechanical change simply will not 
work.  The driver was written incorrectly to begin with, and the change 
will probably break it.

I'll try to find time soon to create a proper fix.  In short, the 
usb_ctrl field should have been stored in the .priv flex member of the 
ehci_hcd structure all along, and the .extra_priv_size member of 
ehci_fsl_overrides should have been set to the size of this u32 field, 
not the size of the entire ehci_fsl structure.

Alan Stern
