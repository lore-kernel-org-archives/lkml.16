Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244D32C85;
	Thu, 10 Apr 2025 00:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246340; cv=none; b=fUkax/EP8tcFlfFSgo6/0Ao07/p6S3JZ/6WGwX1olhpGf4jdTLFuydeyVQvIeFIRGusTC/kACX0AS5QjkOMXfT5gXmDrvsyTNzPGOiWI/N5zwE8qwyF6NUHVxEUQOqdHG34jZx3bLA8GYpY0R8cfw46VpfXlyZxYH2jeB9HWSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246340; c=relaxed/simple;
	bh=ox8AgQfTLVA79rJ46te13DbxlMU54VNVSKxdcc5HLFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zavw4SUtnlgQtUJtgshhhSNZq9z76UzVCnIrVL6gCc0MZVoinIQBQLAsz/XJumFyhfXDOFnimgNNdoEf2YeO8wF5+AA1o7oZr9wgu6RG9Pwl6XrjXQq9GVjwE0iHEw1pE6cvz1xxKH1iOVSY+pKpWaDIXVjHAhuiFN4cXzNSOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQyA2jTB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQyA2jTB"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4775ce8a4b0so4036971cf.1;
        Wed, 09 Apr 2025 17:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246338; x=1744851138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs2WdD/B26OtprRfRLTt0LpyKmz5rmP8V5F0HnSmXgk=;
        b=UQyA2jTBO1XzoF4bPAXHbvxx6zvd8ZDf8jmn/RC8XxYQ1D+QrumSwop2dghgqe2aL9
         d1kTiX8KisXRDI4bs6ePVhUhmKUapB9a+h9R+u1KyIVVpLzUtLUp0EN+az/Fld9er63F
         toerjssKlXKUBf7ZoBGCglAu3pE6ZJAqhKhB/uasMpXh3Ec9gjoAoFFNtAvNNfsc1SMk
         4h+HJYEhEuPQ/i7R/RflnII8Qyfp2uvVbziTrfRRTJpGOMgTu7rMfOaZf3XniICwIhDv
         oi9pn/QXdsrSmIfHzu1D6pcROfVo9RJroZFfg4eF5y6fc3sjBnUZnP7chxgtYoZVcB4f
         VKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246338; x=1744851138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs2WdD/B26OtprRfRLTt0LpyKmz5rmP8V5F0HnSmXgk=;
        b=NfJk6ra1nN0xD7bzxJVzmmqEVZHhwNy08/IpBnVuW1r7OD5wtx46Nb0/lkf8NLZn3l
         dwpBZIlVx4fvN3CTivhHA+Nc1JSrFfQox4c2/10+7P2zsRZuo+2xa7uNXkWiLEpEOS5q
         YQyKw/RQgQ8zEALX7YaUBQgsnOc7OZdnmZp8Vnvpz3PkGhXOWEvfcSWs237uw6K94Ik3
         1/UWjyIyyghEfoWkGi4xpYJt6hNpih+PsFMusCzqS2SwruckWOjnCszZHkEjBacRiBQJ
         WdPdLMPvmkpzvZ9upmHtqQjkRIfB2soFKm+UMlUJMj+ZgHZra7x5VBKjrHVtuGrONRzG
         sV5A==
X-Forwarded-Encrypted: i=1; AJvYcCXbT29zu1XvfBxTDO7JfFO5s88f+nj11Yio88KWqAaX/ke7pqQYUt2+jpItyoy+qVdt3l3/A6Ok63Xs@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbEybuuKQwU/YMtNpG2M2TmawtZOzP8v8XmeLFADI+Ty8TDBp
	cRcwfdQbpQblBiygMZF6TA5on08nvO0pGjhqhIpHyRfnFvT0xx0J
X-Gm-Gg: ASbGncsiRLBLLTI01oa47p3cXpPAYVCER+/hN2wbpN2EU1NM+/y3MilN/+r/sOxp3g0
	STO1oSFcbECiCI/aUJOJlLvFLeO4IZ58sxFMobqBaVtQsE4zmvMSTwerDJIIO2seri9wHHVjiyT
	ueTjj0WyrFznLW6sXPNKXUR6tDamFqqxRmOxuxV9913ysIAhxpzcIiSCn+RoACnim0XEmhITZ1M
	yOVsfPpMBXHEM/w6kSMNAtn2ojXyof/8NrJjH6ZzEcZ+wMXKDSn1QH29I4uB79smyA1dOTmBGqD
	jjvigRQFx82HeOSv
X-Google-Smtp-Source: AGHT+IEnhl76pykbQfzu9PnuA4q6SybzAfrF021J7S6C5p2V+BNkLwoJw+XTI0wnALfnBZwhQfCB5Q==
X-Received: by 2002:a05:620a:f0c:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7c7a76546f6mr145282785a.1.1744246337937;
        Wed, 09 Apr 2025 17:52:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8a1c798sm7515285a.116.2025.04.09.17.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:52:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:51:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <fecggqyrkh222svtcudqoemw4vzisa6srod4jaumkrgd7xrm7j@vfs7xs5fo4i6>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-5-inochiama@gmail.com>
 <MA0P287MB2262DBC84878347B78CA50ECFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <87o6x5tbev.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6x5tbev.ffs@tglx>

On Wed, Apr 09, 2025 at 08:52:40PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 09 2025 at 15:53, Chen Wang wrote:
> 
> > On 2025/4/8 13:01, Inochi Amaoto wrote:
> >> Add support for Sophgo SG2044 MSI interrupt controller.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> >> ---
> >>   drivers/irqchip/irq-sg2042-msi.c | 61 ++++++++++++++++++++++++++++++--
> >>   1 file changed, 58 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> >> index 30a1d2bfd474..2935ca213306 100644
> >> --- a/drivers/irqchip/irq-sg2042-msi.c
> >> +++ b/drivers/irqchip/irq-sg2042-msi.c
> >> @@ -19,8 +19,6 @@
> >>   
> >>   #include "irq-msi-lib.h"
> >>   
> >> -#define SG2042_MAX_MSI_VECTOR	32
> >> -
> >>   struct sg204x_msi_chip_info {
> >>   	const struct irq_chip		*irqchip;
> >>   	const struct msi_parent_ops	*parent_ops;
> >> @@ -44,7 +42,7 @@ struct sg204x_msi_chipdata {
> >>   	u32					irq_first;
> >>   	u32					num_irqs;
> >>   
> >> -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> >> +	unsigned long				*msi_map;
> >
> > Regarding the common parts of SG2042 and SG2044, I noticed that you 
> > changed DECLARE_BITMAP back to dynamic application. If there is a next 
> > version, I suggest you mention it in the commit information.
> 
> Actually that should be part of the previous patch which prepares for
> configurable initialization. Then this one just adds the new variant.
> 

I think it is OK for me. I will merge this change in previous one.

Regards,
Inochi
