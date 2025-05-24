Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B6128EB;
	Sat, 24 May 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102992; cv=none; b=l8ip7uQmWkxkE/GaN8pqkhTHPTnaRPAIRr814x1DXVzDJ8zFew0pqWRcwDIEClnqmCISW0psvaj4CVGPRiQl7jLISg/88uZ6Ity9CpiBzJE2cEbwP3MnNTl1suG4JUwvc4qJYuUv2W408kpvfGsqxlX3l5Qf8EGoxCoc+cmY7vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102992; c=relaxed/simple;
	bh=0pVO+6KQK+7gvYGZz1o8g2GLpTLjtwURPnQTls8/nhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myiV+14Re/jbr5Y3LbU00szGxVVKCIxecXAFFzqeR/It1hp7aZ6V41Lu3NyY+AQdZjj6VLDTXfhnMF/XVA9P9LSz0a7p79UxSF7hORdnGN7dek/T+CerW4xwT6vCaBkyKG6AVL637oW7csrA+0p4h9Up0gllWKMRftzrajNPuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDRF+uYR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDRF+uYR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d6f93316dso1085765e87.2;
        Sat, 24 May 2025 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102988; x=1748707788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tb/w3rI6ziugmXcmP7HoKq767/fmZNaAMBdJDjrQVmE=;
        b=nDRF+uYRT+gODrJ5CIeTbqF4Wk/i0Ys5vwRl2kBABcT4g3rNe2p8vFdpcOdRMp0ZA8
         +gwSzEoiLQJX009KthA5vYH7fxUuOvRNL/U/kXbWlooHG4qHMQ0fjBDDCkjsdfWfjZgL
         2gKa7mDXIryUfYBw3ZaTrAEoOsoONvbNNg9uWiPXVkLGQcBqnJl3sGev4FIjgSTbFUx8
         9D7kCMSmP9HeLu1dgC2WD1kZ8HY8ffqokUCFut62/bBXqZZ8qQ8Y/KgFceKv+ymblGbW
         /Gn0K19MVB3fWyZBts5Ygrrg6IGob4qDfE/uvuFfY21GXeuibeZEyEz+FQfVRY19rRih
         /xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102988; x=1748707788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb/w3rI6ziugmXcmP7HoKq767/fmZNaAMBdJDjrQVmE=;
        b=TjOfJKnh2wQAPrB++Q2T+61t+rgoZuM/RqNq4I8h8RXuODn1QlmlwH+T13TxDOoULa
         YzA9VvrgQeNNv8IP56q1kVZTUPPIjivj5fIDiACJ2arkIwfZTXlq7lvnz345DQ6nXprH
         Q02D8ruAM1d7O+NfvTsn5k1ec8s8tT9ZlccdXAJm9TeAgldta9thdQRxWNZ+GBzxcI9X
         ACbFBhGHDMo6hYJrGh04yLu/oyl9I1uPI4ZtT6l9bADvXAt5C4DwI121OjsShGBrUb4w
         63nINFN0D4TtHck8CHxpFW6ajK+abw6ZHhEXA6dewrCgLRW1o2ha8/ZyIhYXJJLwnhby
         65fw==
X-Forwarded-Encrypted: i=1; AJvYcCWSnyUPKoI30u23CfKwkWt2CEPBrZ+liPqYUSWi1ZJHG5dvBQT2bg6LiQwUag9DPs12esK0IDciVGL2sX+VHhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wH0BIcl5X7WtiqPgltcUid3X+aZdC1s8XOWRHWDoPBAeEP2f
	XPlGZtQGmdB9i3+VXhbJw4G8QQdvCOzmIEcqgReuYUfK8yp0BDdciUz4X+5SrZkv
X-Gm-Gg: ASbGncuvro8SjggKQ9dZVWApJ1zuPC51Cv6BBf+e7+O8VMusJY0lUDQTy+7K12GMOdw
	IEo+XTqamIqnF8PEq+G/rAZmCGAUWxQoEQE20nctT2P2dzh72z25MjHjIUm9ho3yY6ECocIHayi
	Be7dVv4fIojWEg1TZsrNpnshMX+foajBQgwKsQ4K8PM2OnWpT7fJNd3LTOJxSKmu9mJZvajAg32
	O/9p4QkEzmgNAowSU76epu8hBzn0r2LcjJVixtUM2dhR7L/MJ0GbXWRT7Pjn7pMePBrKS2oWPpG
	Skn6HxvElnxSR/sb8HdVdHer0VOR0z/Jtp+oumBTAfLCCSG6IUMpikr2SqxTlkFFJ2BuSZGi6uN
	FiMkr02/x2wvnLf9FGrw1vWqRk8ML6VPobF7nVviKYH0don3J3UaFjhus8XQ=
X-Google-Smtp-Source: AGHT+IFFCyCqcSoZYJ3lm3zpXv+H1YStSbGf2ED6N2LRYYO17ovSBaD4YnLRHxY9kZDW9zOWK0DwNg==
X-Received: by 2002:a05:6512:a8d:b0:551:db39:75c2 with SMTP id 2adb3069b0e04-5521c7a847dmr802226e87.4.1748102988075;
        Sat, 24 May 2025 09:09:48 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegel0mtun0nsea8-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:aab0:f0be:4d4c:9e50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm4386195e87.32.2025.05.24.09.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 09:09:47 -0700 (PDT)
Date: Sat, 24 May 2025 19:09:46 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add missing includes
Message-ID: <aDHvSicbJpYBY-dn@Lappari.v6.elisa-laajakaista.fi>
References: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
 <2025052136-backstab-dork-de2d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025052136-backstab-dork-de2d@gregkh>

Wed, May 21, 2025 at 01:43:24PM +0200, Greg KH kirjoitti:
> On Thu, May 15, 2025 at 10:40:13PM +0300, Heikki Huttu wrote:
> > Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
> > Add direct includes to make the headers self-contained.
> > 
> > Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.h      | 5 +++++
> >  drivers/staging/vme_user/vme_user.h | 2 ++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> > index 7753e736f9fd..55499b240dc3 100644
> > --- a/drivers/staging/vme_user/vme.h
> > +++ b/drivers/staging/vme_user/vme.h
> > @@ -3,6 +3,11 @@
> >  #define _VME_H_
> >  
> >  #include <linux/bitops.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <linux/list.h>
> > +#include <linux/mm.h>
> > +#include <linux/dma-mapping.h>
> 
> If you are going to add these, please do so in a sorted way.
> 
> But really, why is this needed at all?
> 
> >  
> >  /* Resource Type */
> >  enum vme_resource_type {
> > diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
> > index 19ecb05781cc..297b25fab164 100644
> > --- a/drivers/staging/vme_user/vme_user.h
> > +++ b/drivers/staging/vme_user/vme_user.h
> > @@ -2,6 +2,8 @@
> >  #ifndef _VME_USER_H_
> >  #define _VME_USER_H_
> >  
> > +#include <linux/types.h>
> 
> Same here, are you sure this is needed?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thank you for the feedback.

I was under the impression that it's generally preferred to use direct includes to make headers self-contained and avoid relying on transitive includes.  
If I was mistaken, apologies — feel free to disregard this.

Best regards,  
Heikki
