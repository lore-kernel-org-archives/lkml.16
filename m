Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A31991BF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093395; cv=none; b=P7L7N8omFhjddhvC2AOAzSxvgqbruqTaEnvBYppk1U0/mA0vW+dBMzS5OTJoKCkZoGM/1SIxXaXtsbPRXnIK6gELFTamabNcGrVb5kkbad1lEH5mur/1yZ5d8cbD1g7l8f8e5s4x0xUTIiFV+hR3oh4bd8UV7L1Vsnv1X7pmuxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093395; c=relaxed/simple;
	bh=nReZi+VOeU0Ba5miapQ8WL6XYIaNx00NZdiZI3kjEWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amH2QBG40o5rpXKMUXnM3WS1WCPJhPy19ckb9O6nRB0QbKrfTJPFgcum7VTlZnVHb+hcsQg/7WHY9AhMGLRMcVQUURkgurnFsWSahN20rflT7T9ltPkTDzwM09ACSBdcFWDIUkpkckEwCGy7Ts5PR+yIu4ZTxxPb/OSCEuLQuh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MN9inE9y; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MN9inE9y"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476ae781d21so11734571cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743093392; x=1743698192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6nmPtMcFozMVlKfXWHui9y98FPxfLmhj5/nXxFuAmQ=;
        b=MN9inE9yHBvXHZaMVm3yJ2RZJYm/z9JErkboC5ShGYDeCpTqJXPbCyWe6WsUvBfe5k
         YMq5DF7q8BSvMLBglQ6+VXc99xH58gOnZj6d8Md0ANkd6Q/f1dxbHtBi9n777+cmG3o/
         KB6aLwDJInYlAu/OEII2WU4CLdODhGSu8IHVSWCA/dJu6EORcAG3j0+qjyOdILOY2Qv5
         0ytBtWsXFKjkGHJ+qsewSzdgZf4aYgTX2R+yGTB+UnRKxMyfMVteNsU7+MHnn03qkB/3
         PBEkZxmNEqGHcEPDwpAn0V2YNEjxTtmUHndOIEvpApGxY/QTqHhhS9B5+fI1TWUG2TZW
         XLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093392; x=1743698192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6nmPtMcFozMVlKfXWHui9y98FPxfLmhj5/nXxFuAmQ=;
        b=boI1cJdZDVHyDnQDpcsqgnt2poPjAARYw8Y5RUruCfbRk1pNuqeFFCjCEJhLkGeckL
         aBgL3fOiFd4ZCwEjLjs6n8LzlsXIC1p4Ryz8c12Tw7LmQJlPuhomDo+Z08XBxWW5TUI9
         2Ga7Zx4sSADR1wAmB9QyM+mQn+GYGh55NJrWPsc6kgN30wBdQ50l3n5E+T46E4sr0zPa
         27ylhTu0CooYFYBYaTzv7t7jrG+oZEyYDK4TrX7waqzvM8HZJSRM7fd4FQKB9R11VP06
         nFi1gmZLbccqPk+YkGnyFBQ4G+XlAbsq/1O4zXgw8Fmi7Dh8/CASrwgWxFnm3raEFCc0
         XAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxzvTbypDadRH/ufVDBx18qjfnxCE2rjr60Id8muYXU7957Mp5ZXC8R6yVyHD70eVoN+ekqAGcaFpWSKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeYBMQywpl+sDlnHXIqi/4XQDGD88UtRa/LX7YIwqjfOXW51Ry
	wrDlyInLPJTHTyvDbu+hOYOaxr5/m/Ic8f6vEZcofoX2E1tau4MYDgWk+RV/7JM=
X-Gm-Gg: ASbGnctWT5p2W6+zo5vugOKJO1iCoGJJxPIB58Vn17kSrCZz3nDv1pyI7wcz8rYlwJQ
	4M0A6NbNBZbHkIWlGoJXQ690n1sq/AsUGF/ua/Lnip9cg+1aU6Ci1wt0TTk6XQ8wkjdt9zDfZMu
	qVz1PkgmIFb7zjqXZTMNrDgVOZzyN8ivLpQzI9TgVDdTjAD2kNEHGLJPYOKdtf29u/q9is9Of7A
	ugFg67yfN83qyyz02IFuDNVxBFEdaZANZqGkSDrHm6dYakTuCtpcNvX5LDFSjVupsHCGps5Zkzw
	+CVr807dVV//Ig0vVKsn62irPFoy0aQh1of4aUos+hvqeu/bQIocwdcDzXqrSpds3TZw1/AwhNr
	OA0iz7/40Q6VD3m0xb+2N25FddWU=
X-Google-Smtp-Source: AGHT+IEKDp2tVzjqYEf/u9Xf5dq7fgG/yV3w98pY6ajt4Xqr/WEW1Ke87vrKun1BWfCdi8hBKkoBkQ==
X-Received: by 2002:a05:622a:540b:b0:476:a895:7e87 with SMTP id d75a77b69052e-4776e237a2emr74047841cf.48.1743093392404;
        Thu, 27 Mar 2025 09:36:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d520103sm86026311cf.58.2025.03.27.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:36:31 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:36:29 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	lsf-pc@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM] CXL Boot to Bash - Section 0: ACPI and Linux Resources
Message-ID: <Z-V-jXYsOfQDvCzc@gourry-fedora-PF4VCD3F>
References: <Z226PG9t-Ih7fJDL@gourry-fedora-PF4VCD3F>
 <Z8jORKIWC3ZwtzI4@gourry-fedora-PF4VCD3F>
 <20250313165539.000001f4@huawei.com>
 <Z+Ubvvrj9DovVs71@phytium.com.cn>
 <Z-VGN79KVjuRg41K@gourry-fedora-PF4VCD3F>
 <67e550f39d57d_13cb2941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e550f39d57d_13cb2941c@dwillia2-mobl3.amr.corp.intel.com.notmuch>

On Thu, Mar 27, 2025 at 09:21:55AM -0400, Dan Williams wrote:
> Gregory Price wrote:
> > On Thu, Mar 27, 2025 at 05:34:54PM +0800, Yuquan Wang wrote:
> > > 
> > > In the future, srat.c would add one seperate NUMA node for each
> > > Generic Port in SRAT.
> > > 
> > > System firmware should know the performance characteristics between
> > > CPU/GI to the GP, and the static HMAT should include this coordinate.
> > > 
> > > Is my understanding right?
> > > 
> > > 
> > 
> > HMAT is static configuration data.  A GI/GP might not have its
> > performance data known until the device is added.
> 
> The GP data is static and expected to be valid for all host bridges in
> advance of any devices arriving.
>

Sorry, just shuffling words here for clarity.  Making sure I understand:

The GP data is static and enables Linux to do things like reserve numa
nodes for any devices might arrive in the future (i.e. create static
objects that cannot be created post-__init).

If there's no device, there should not be any HMAT data.  If / when a
device arrives, it's up to the OS to acquire that information from the
device (e.g. CDAT).  At this point the ACPI tables are not (shouldn't
be) involved - it's all OS/device interactions.

I should note that I don't have a full grasp of the GP ACPI stuff yet,
so doing my best to grok it as I go here.

~Gregory
