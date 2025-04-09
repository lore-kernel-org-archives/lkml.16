Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CD9156F3C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191727; cv=none; b=oHcplalpuZ9jzHyhwN1UMhwAAjRMbYF96CAXdNbQjZ6g9OIse+pefhJ/w30Bmxuotfg3TIaAunYc25Gj4QhLNURRhcM0cR4PqQGkDB8D7AlMbax+15ExxCsC4V7zur1qBsDqUYbXX9uIPzEI9hlwBFhJvFPU6Pt1rmOK+bxfvH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191727; c=relaxed/simple;
	bh=rVApkUNk3ff/3p71dYO+SIQak76jrVvMcnZW8PkseQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQiiUtaSZY/Hs0N991LZCT93Z1aBHOw91gFSWste+NuuT4pf11gfqCvxDRf3BG2tJDHuer/ZBSRahPYes1QIHTEjO3iISYWZhSBjoWHdlmq4lYX1NTXQT3hLzLulFPG8SxjK4P5dw5J4aJXhqECYMHR7GMexjKPZmLI+n4cwo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSNDqyrs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSNDqyrs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so37732475e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744191724; x=1744796524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEOTBvrqUCulvlJbZj69guEZEEt1iBZChDyWd5PNGmk=;
        b=RSNDqyrszUSFZ7PFwk7RwtsD8XoOMjXSHUAeJWqFkwcrRrPkbTo6rWVnmJn8qxm4MY
         q9d0dOUqpASIS3leVO2i5dTB/ARDx0tRpjlfJCLMwkX9LazzV4uFbwDpZ6+RSVcjG7+9
         NxV94yKJgn0KXz90kCtjFinldGgnkaQlNVGFuHIwYeIWf44lXfg04JRadu1ifKuywpL2
         IV7wHckVWgjjEnQKPAyvftVUkiLIOkGZOcX3/hu+soA8wvQ0ZXc6O3MfQvQxRpibFU93
         z+19EDhe1WbKbzu5z5OwyJMUaSnTydCSjAFjI29ejgefM9r05MHX/OwilXXqAQj3HzxH
         3gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191724; x=1744796524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEOTBvrqUCulvlJbZj69guEZEEt1iBZChDyWd5PNGmk=;
        b=qv0rL/vl9UPAsgTMII5Pbhcv1geqMMB4jegC8gmfnpgrsd0GWWlzeHGhIbsbX4sz8a
         9YUbY57KlI+RMS3MwvGz7b+NPAC5UY5ozNufiAGjuzZgyyLuVqPR4sne39UFLi02RHni
         mzYepmzwebUqC0K/MVvmgli5U/2mhISdD9cs/HIpteAaH+SdVF3wPWjBGwOB64yilDvP
         Y/GKCtnZ/QR4WJSiggBwkZT38fihLGYdeWUsAq1nrjfqZVAS8MtwqFnPk+JL8dzbbl+L
         6f2/454oTkASrYAYP6uu40rJNUmFtUChGhJZyFsRQqg0hZsFLeazt5dOSZLz0eUClh1P
         sLpA==
X-Forwarded-Encrypted: i=1; AJvYcCVcmZudSupEWppeejOY3AYXe7bC9c0ij2wAZiGVYDxjWB3YEFkoEveFeurt1u7IB3LrLcSj6uohSAOeG2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHQYoBIMHlmI6QifXL/olOQLFvOTQSLBSlNPDwkkO7RwJicTA
	Y4tF24H/hiRgCHY20CV2AXExz1huDNjG5vSQNK1UmMWqp82pSyFkxkbaU3P3KUo=
X-Gm-Gg: ASbGncsgNMnRPsbRIzzt8J34QCj/7kmL7vAvUgqasIBHhks+1N84D1Ns0LmyFY4gPri
	2MkI6kaX0wky4XLh0KZWS4mo+NxySCP0Ci5mD1hRWsPcRx75/VGnazKc4b8zSTzTS5pjY/FwWzV
	iJFWhFkkXoAy0HcSFjiHTCGkWFMHTJyX+33MS5FP0dVNdwvCNRECgChp6THFtih7tWyzn7BaEa4
	Y92twGak+Gic9eXpwkQxEluSyoMgAdRJ2WamwmukB+5rqRwuk30pHThj3asOJBup7bo/6qBtii8
	D+0d+w/TNJEzrHJCN2BuZKK+mFXq/CPm5NlCVZvSxXIljA==
X-Google-Smtp-Source: AGHT+IGeeONB2K9xJ7mtZWOdimUjyHkmilumfVTBSGcYo8gSJBzT+FbL5fXTjFM/KfA+Pb7P8yClKg==
X-Received: by 2002:a05:6000:250d:b0:39c:12ce:1054 with SMTP id ffacd0b85a97d-39d87aa8367mr1929008f8f.8.1744191724142;
        Wed, 09 Apr 2025 02:42:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f206264a1sm14438905e9.9.2025.04.09.02.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:42:03 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:42:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Michael Rubin <matchstick@neverthere.org>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <ff353ebf-a1c4-4f4f-8cbb-b6c62e70151f@stanley.mountain>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
 <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
 <Z_Y2Sg1tDok_MX6u@egonzo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Y2Sg1tDok_MX6u@egonzo>

On Wed, Apr 09, 2025 at 10:56:42AM +0200, Dave Penkler wrote:
> On Wed, Apr 09, 2025 at 11:10:41AM +0300, Dan Carpenter wrote:
> > On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> > > diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > index 6202865278ea..4ddcbc2a81b0 100644
> > > --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> > > @@ -12,9 +12,9 @@
> > >  
> > >  #define GPIB_CODE 160
> > >  
> > > -typedef struct {
> > > +struct gpib_board_type_ioctl {
> > >  	char name[100];
> > > -} board_type_ioctl_t;
> > > +};
> > 
> > This breaks user API so now user space can't compile.  I don't think
> > any of these 21 patches can be applied.
> >
> > regards,
> > dan carpenter
> > 
>  
> These patches are OK. I will make a new release of the userspace libraries
> with a compat include that defines the typedefs.

Ah that's fine then.  Thanks.

regards,
dan carpenter
