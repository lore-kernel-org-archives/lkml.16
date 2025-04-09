Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D372528FC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189008; cv=none; b=QQ+SzlIINtri9LMa6Pa/Jl3SKE7qGX/WPMVI0h21jkDlQYuGNxU+mQy2zylkzUubW7UObnwNKvwacW9INFq7Bff4lZK4n2otzNhjtWaHrW2u5FYxTwP/mIfI+9sChO/fxC/vtT0cuTQ++s4LkQowq0Tt7AKI03OivtBV+1IEWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189008; c=relaxed/simple;
	bh=9FKzHiZkyVqJIEUKOBCkb0+X287tOTOwgifqFsa3J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK6F3rCv9pMvMoo5Zdn4TAsqx0pHIRjGeaKPm7rGURRWPzTQHXSfg5DLPcrn88zYHiTxamHlFeMZ+NHLcH/dvlUtItUpsIOBfY79nJFGfp8mGv/uD1yEqgkBAix+WbB/rZwubtGNBAyYigDC4DT9ds/m5YZH2VzJ68vEk8OSXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO0edmRI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO0edmRI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3829252f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744189005; x=1744793805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4JUvz8afTc7HG6/FXYMalLsIL/FarPH6ddKiz9jFrk=;
        b=gO0edmRIUoPDevjivlm2aQtiqR4hnqeyXquz0TShLqdYdKJRpGBy9mqzloIs0ODnkO
         EfrD+udFOSYFvN35N+TzU2dk2cslI9R/PqszROyEHkR6ZKhyW88E70LNroQGaWO6NxWp
         jxj5KP7ySBvyc9+Bw/kPE8/00ApuRLgRHgZVBfCusrd+MRdJqIUaeGZSrfyrUXNx+NSZ
         cD7/cAwUHNHbxSZKePWwCIMPy5LSTXOPPm38zUgZNyw2zOYgS6ip6iXsJayItEzIwa2X
         iOORehBXrZJroVhldUguXvM46zc79BLWLiYPDTIhieHt2Ikn4PNlknM2wgvgrnhdCjHV
         3j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189005; x=1744793805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4JUvz8afTc7HG6/FXYMalLsIL/FarPH6ddKiz9jFrk=;
        b=h6WIMqhtqHq4ssMTIkOplRg7YrYBnqMCKV9BNE0b6PSuKfdURJNZI477ZsPGMsuMwu
         QCtQxh4u2mBsutZQV9H5oV8U4AylJP7NT/wDLW3iJXfdStS+epG/KrF7Fw62TY8KuNWn
         RktO3nry0K5wP4SSXv+8HO6RANsRjwtjiRh0GViqOGgatVFc5DAVhy5MbtZ2ey+x3iSd
         VN0gDNBWneMRSKUYUHjMUBKufE6Hg+BLEbhC4+5p5x0UcWj2qXUQWPdFQQek5JbkyEVR
         7iBJ9JrmWYZ4DTo0x9NK1VunAljnT0r1Qhl4uHFfaKaN/QgrJmmjgRzh6GRMxybp7dyd
         uNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDJiH9cdZAUpdaNOev3jn+BLIFxSPa1YRts0B2jSPYWVPv3VIivQb9a6yIui4AuY6+laiIlN1mdPziCVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvH3ywfmlLXBUjm9N6dM9OsklCfjgpvoQNw4ufTuw1gdhDgO7m
	8D9TcRUCJn2VUXfiiba2DGdqtkjkJOwKGhidmY0sWT7plj26xsh+a756LVEK
X-Gm-Gg: ASbGnctJq+OROk40fGzcDvy80NLsoKoMtwvHqZ7hstBMtQ8xBKqDAW8sdLoQJ8Agfez
	aaU+07i2G/yQsiX41gt2G7gOv6dBbbKZrAlGhMfV5OfCE4j4gSH7jXRIpCSrZ4h2HUlUOMB/IYN
	A+hVD45IWJKpVjCA5bURDfbs2zXJsvPkwhhKsOWsgzRyw/bw0R/KxQv/yWu5UFU84BEJtHGsUT3
	uWGQt3JLl127Vg72t+n7bgecPBTHSZeOiiNKeo1iQyX2he7NNE78mk4jdKhPTGJ6Dq0uXHy8BB9
	TputTBHC31GEtSky1E0MznREvwo+5ltpHDxEJjHcvsiF5cXQwkd0p/36
X-Google-Smtp-Source: AGHT+IFYophTFBfoBk+6EWJfbHdMU/Z8k+vo558UaGYrCpc1xC8rg6vdLxD4hv17xkKSTLflQi8oDw==
X-Received: by 2002:a05:6000:1786:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-39d87cdbdbemr1553050f8f.50.1744189004914;
        Wed, 09 Apr 2025 01:56:44 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572bb2sm9102605e9.29.2025.04.09.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:56:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:56:42 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Rubin <matchstick@neverthere.org>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <Z_Y2Sg1tDok_MX6u@egonzo>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
 <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>

On Wed, Apr 09, 2025 at 11:10:41AM +0300, Dan Carpenter wrote:
> On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> > diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > index 6202865278ea..4ddcbc2a81b0 100644
> > --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> > +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > @@ -12,9 +12,9 @@
> >  
> >  #define GPIB_CODE 160
> >  
> > -typedef struct {
> > +struct gpib_board_type_ioctl {
> >  	char name[100];
> > -} board_type_ioctl_t;
> > +};
> 
> This breaks user API so now user space can't compile.  I don't think
> any of these 21 patches can be applied.
>
> regards,
> dan carpenter
> 
 
These patches are OK. I will make a new release of the userspace libraries
with a compat include that defines the typedefs.
cheers,
-Dave

