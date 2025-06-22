Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D22581;
	Sun, 22 Jun 2025 06:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750574923; cv=none; b=VbE2oCCXop2aZ5C0775kEWXAYGcHDjU5Q4bJFs8tJ0fTiIxG7zjEITtSRuW4V8bqSmt2dx7T+eDMmu8nrQQMxKH1YOv476JcWfV6OpzfuDQXZ5QUX0wp7oZMbZy4qlfbhPD2OktK3I382mez4g/mPsxqFNA0t5wv3NSk626shpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750574923; c=relaxed/simple;
	bh=ken8puwclcNgHFq68mfenvEGASAjx50Nx4u0UKKqKc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QllBXfj+LU1KFrlLNVIie0LRTgUBwekxbkOSpJDU+h6AO+S/sms+rM6EwwegWTdmY5q2amMrFmq/wxq2l9kUyMEmcyCvc+UWAqOBa+1Yuq73TdkRmq4LkBqruiQTHXXrZsNXAQOJn99zA2Vpm0nokv2ILmHcCF+dA63Wo+8eljM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9sbttc0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9sbttc0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso2280279a91.1;
        Sat, 21 Jun 2025 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750574921; x=1751179721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ikRz4wnk0lbFqmVhhlnU6ujDGF3hUYEk5WhcaI60D4=;
        b=h9sbttc0hlCVc9+wdhVD2ablsESwriA3udEjqm5Hv6dOtfnHW+Bor/KQMK0TdbTriw
         eXek6hReJglKLldvfeiF3zyVrO3nhS/uEGSTR5D4WqmWF8eBt9CLMBD7c1D2rYbvmikr
         c/1xsku+vvSCKzugA6YLDZlmqEsDiXfVgylkhb7b6AJrhlmpf5YvKpzvi98TaeDmITed
         ifaJ3IHZzwU3zU/HGTWGt82yoQlG3bDZJhY/HJK2dRGrbPTsZg90jRIiFMMYxvyfaumM
         rXJeueJCXR97YiwyfgGNYT8s9HV2zLnzstQlWCOpBd1u9K9EzRZ91vaTz1ek7SGPxebF
         9PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750574921; x=1751179721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ikRz4wnk0lbFqmVhhlnU6ujDGF3hUYEk5WhcaI60D4=;
        b=TpAr+YivjwBsXqGPtiX3z5VRm9zX1cLkVjADs8zVR9LrxhXZZdSXQVbLuj3faf/+pm
         o5lIlQoCsrgpOICN9YzA7knyEHWbDeXmoGqAFefnkPeJvzhkLwk9ZWtZ+N5UZmh3WDwj
         cmO3soKuiDp45/GJ4GZqGFDqo1/bceHRjo8ehDrzWIP7zdq38JHLL9jzEXEEEI5rLtl4
         d8mo9HXI0pe/nPu7J1jD7SiA37cRyVaWOOsJoJO+J0TzltUT2Pd3nAGs0vZFib/1KmO5
         fsaZPrRDuZ6Iq2ATZB8OCmWpQK+IbTgBwoxSPI3VSFQWqraPiib/XsieSJtb74R9on3M
         ERpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU4lVHJAF78O1ULUBRPv1HVpxE7LzeoR1EIwZi1WqzMi8raZsE6pWyXqQC0bKb+9lLq/Vg44LOfYJHGgAv2evrjjl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7smw238Epo6rtGZanOE7Zn/CbL0XC7Ij7TPRuhhTxpqUst9qH
	T8olWLDLzobLh6LTARRK46oHcxbOuSvmp9dIpcMqyDKOwHbueCnGXR4lVtQjC7Y3TNQ=
X-Gm-Gg: ASbGncsKG4JhCrKbpsWSj1p4RD8oYqaujfjgs5s6TdHrwe68UfxfckL+0VqpdPCyhxf
	Cxe/xwmyf+X/xPas4gbSetQlXvrbFurrL/30559dWYYlc+cUweDbEkB1YR4eBJb62x5I8eoS7Jk
	R20TkrE7g0v7DXfCqszaiIYvTbblKcR6qjDB0HKiFqPNDH6Cv++hEWEDtj43LXlIOHW81pwGcs/
	lKbbwO5Os7tUvXhII1ZWNRa47VAO76TG4lCI+LnaRDHbYmHqcyjQdM+dFFWkJkNvo5m/sg8It1z
	g1/f6duzM4vx24whSAedI9cfNOzfx+5oNpXc6LzHBZwPJIeoW4bOb4LnSZb1JYFhwKqA
X-Google-Smtp-Source: AGHT+IHfshealo1W0FfHBth8WYDVeEbFWywIsu2h8iW6w8zyRGEpc8wmAd32L6qLE/gwyiJxUvzjig==
X-Received: by 2002:a17:90b:57e7:b0:311:ffe8:20e9 with SMTP id 98e67ed59e1d1-3159d8c5337mr15089422a91.17.1750574920802;
        Sat, 21 Jun 2025 23:48:40 -0700 (PDT)
Received: from localhost ([203.123.65.120])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3159df71c4bsm5142980a91.2.2025.06.21.23.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 23:48:40 -0700 (PDT)
Date: Sun, 22 Jun 2025 16:48:35 +1000
From: Xiang Shen <turyshen@gmail.com>
To: Hans de Goede <hansg@kernel.org>, acelan.kao@canonical.com, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
Message-ID: <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6>
References: <20250620003849.54442-1-turyshen@gmail.com>
 <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org>

On Fri, Jun 20, 2025 at 12:00:03PM +1000, Hans de Goede wrote:
> Hi,
> 
> On 20-Jun-25 2:38 AM, Xiang Shen wrote:
> > Fix checkpatch code style errors:
> > 
> > ERROR: do not use assignment in if condition
> > +	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> > 
> > ERROR: do not use assignment in if condition
> > +	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> > 
> > Signed-off-by: Xiang Shen <turyshen@gmail.com>
> 
> Thank you for your patch, but this change really does not make
> the code more readable.
> 
> The contrary the suggested changes are making the code harder
> to read, so NACK.
> 
> Note checkpatch is just a tool, sometimes there are good reasons
> to deviate from the style checks done by checkpatch.
> 
> Next time when submitting a patch to fix checkpatch issues please
> take a look at the resulting code after the patch and only submit
> the patch upstream if it actually is an improvement.
> 
> Regards,
> 
> Hans
> 
Hi Hans,

Thanks for the feedback. 

That's fine if breaking the "rule" is the only way to keep the file readable.

However, there are only three files (x86/sony-laptop.c and x86/dell/dell_rbu.c) out of 273 files in the whole drivers/platform folder that have such an error.
Perhaps there are other approaches to make them more readable without breaking the rule.


BRs,
Xiang

> 
> 
> > ---
> >  drivers/platform/x86/intel/vbtn.c | 38 +++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> > index 232cd12e3c9f..bcc97b06844e 100644
> > --- a/drivers/platform/x86/intel/vbtn.c
> > +++ b/drivers/platform/x86/intel/vbtn.c
> > @@ -160,30 +160,34 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
> >  
> >  	guard(mutex)(&priv->mutex);
> >  
> > -	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> > +	ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event);
> > +	if (ke) {
> >  		if (!priv->has_buttons) {
> >  			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
> >  				 event);
> >  			return;
> >  		}
> >  		input_dev = priv->buttons_dev;
> > -	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> > -		if (!priv->has_switches) {
> > -			/* See dual_accel_detect.h for more info */
> > -			if (priv->dual_accel)
> > -				return;
> > -
> > -			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> > -			ret = input_register_device(priv->switches_dev);
> > -			if (ret)
> > -				return;
> > -
> > -			priv->has_switches = true;
> > -		}
> > -		input_dev = priv->switches_dev;
> >  	} else {
> > -		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> > -		return;
> > +		ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event);
> > +		if (ke) {
> > +			if (!priv->has_switches) {
> > +				/* See dual_accel_detect.h for more info */
> > +				if (priv->dual_accel)
> > +					return;
> > +
> > +				dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> > +				ret = input_register_device(priv->switches_dev);
> > +				if (ret)
> > +					return;
> > +
> > +				priv->has_switches = true;
> > +			}
> > +			input_dev = priv->switches_dev;
> > +		} else {
> > +			dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> > +			return;
> > +		}
> >  	}
> >  
> >  	if (priv->wakeup_mode) {
> 
