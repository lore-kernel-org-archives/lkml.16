Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12B77111
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745538388; cv=none; b=NeAR7U2sZcQipwrfk1xvH7fsNKkIUwHYu4E5OI8gufMP3ysm96YinCDCuG2ZyWzjymGrqEOJQBeZH5QWxmiNw+8qwVUaj7iMckqz9zT5VXR3AYPmpJZzJl+XNWNNWYMY9OaThkhlknHms3WVeOfR2cEGn0SzpjjLKAMatURSCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745538388; c=relaxed/simple;
	bh=cgxkOOr+aArOC1h6OdPymoq0m6N6WQCGvPhZQ1eKE0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2B+i0v+XEDUnjJfROJFuWEKgkKCZhRSW4qGqxqgxFK0/mxPwDQAhcy/E6XhX3qYldlQRUpYU36y21uShlSeqwypz3Q1yWbuG41Gx8lQaCpoZJ4ixI5YaQJJXbdoyIneV+qd2cj1k3GVPIBtTt1bqdxEA+tLZ6JXEeilLQVhY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FoWVRyaS; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FoWVRyaS"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf0e07947so17034186d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745538385; x=1746143185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEAi2WhyTrKKsIEGS24DIqJtZonvDBpfYFt5yLGQVew=;
        b=FoWVRyaScCIVAPRY73nQGOurDAsgcEpPoM9CiPPWy2UU6YLXR2u+cw9XT5xSr+Rnlw
         73mBXSsxv4MVqhNyDiv0lQodta4MJBql2AYBwolAJU1gIiKSyMZnPkk2cFqpFhEDUR8G
         MTtikp3J77BQYBj6zUR57nXi0UNqAssjU0EKrmozmM43xEdx2EOBHT/gOJ9wM1UYHRkc
         vGG1y6+IvYi6xSiR8WDmCDainWZZMERLtAIDU4IF1fRDqtCLYgBnXsCqZkGvT+BEWbH1
         68FLW++07yPcapprEd5MP+JCGGpau/fIUlE2xZXB+kcKSlA0UWjKkGt5cB2N73OkpjUm
         bNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745538385; x=1746143185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEAi2WhyTrKKsIEGS24DIqJtZonvDBpfYFt5yLGQVew=;
        b=i+zZn982Msa5UhEIcLpnEaW6unTIC6Ea2Lnlqtb/oz8GBXzVDVBEW0gM/cgfaq5SWh
         hxQ1RkM4H6qme6poLbl7bv0xsxnA9/b2ddbGLQFCZVrFVq+ddG9cV6aZ08SR6sk6o8Pb
         e2Q7ktx7ipPdCV80BNrbb5+AqE07kNDgM6csh4MJp1xdIKDKLxFEYG47LNLBr6Gu9hOL
         dUNedsSq1vIJX+J9ZcvHzclaRpiGRjQQTgdl3EHQXt1nKOI71zJbc+DH2bOQZZc2JE6K
         MhrlhMZe10lRY1ykVmsGWEluLJZguijxMS24dvzorJLOD2IYBon09ueybTURLrzZeAs9
         UEzw==
X-Forwarded-Encrypted: i=1; AJvYcCUCaZ2OP+HyXnenSycIzFCSZY7csCbOxepXq/MqPYEfo4p9vJvdPtG4UvEC8X7Ir1hBTnzg6ICIller+0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6hQ5yrs0LaU3LtYv5XY1csxAgl+3ozZjqooLjj+i5s7vdLEi
	1uPiSHi2yHTPAqXLrX7Cb/417SNCM2MltxGev7ZRFOAnvLOw1uFYlbe5Wb3JpGM=
X-Gm-Gg: ASbGnctB0WKFyNabYzSfLnvQCmvyF6zF84AntksYwa+ZHgiQ7ChYZl0gANL7WScXARx
	MdoskOCjmjdJ7SQxwJpMvu2VZfgEP5I2JUeydIvVqTcu+lhI6W1wZsUk6DPYPv5dRgc6ydmV0DY
	xD9EsMruD4Jq28fmUmKT0VMzMooHGYs0I3B3kSnieIBW1WiBZ2pysdbNhyEwksnA3Rc2XInqk7e
	mEz8QALtr7W/ZuLRs3OVR0XtuHkTxKafgnTtU/xEuqR3IghxBmD+3dDLIhWF6Ut1nRf3SML9oC8
	GnxUz1nQ9vFm8pPDtfkRz7KmxxUC5SxYtw7mEN8gMzXVZZwmPe0tYs65pzzZoQ0IlrD3IH0X26f
	+I6lgqQnjPjApVggB68pqMgs=
X-Google-Smtp-Source: AGHT+IHVIQahRBRjFujQsX/oVEHpzhYjotm5kOcv092cB3rq2Z5DmpzekL+dkfwTQCm8OAdREUXkmA==
X-Received: by 2002:a05:6214:1d01:b0:6e4:3478:8ea7 with SMTP id 6a1803df08f44-6f4cc2f6dc9mr2543336d6.4.1745538384725;
        Thu, 24 Apr 2025 16:46:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c093501esm15412946d6.37.2025.04.24.16.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 16:46:24 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:46:22 -0400
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v2 06/15] cxl/region: Use endpoint's HPA range to find
 the port's decoder
Message-ID: <aArNTsJfIxdM9ybQ@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-7-rrichter@amd.com>
 <aAmFk1iQcS7UpslQ@gourry-fedora-PF4VCD3F>
 <aAqx74FWd--8aVw1@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAqx74FWd--8aVw1@gourry-fedora-PF4VCD3F>

On Thu, Apr 24, 2025 at 05:49:35PM -0400, Gregory Price wrote:
> On Wed, Apr 23, 2025 at 08:28:03PM -0400, Gregory Price wrote:
> > @@ -916,13 +921,14 @@ cxl_find_decoder_early(struct cxl_port *port,
> >  		       struct cxl_region *cxlr)
> >  {
> >  	struct device *dev;
> > +	struct mad_context mad = { .p = &cxlr->params,
> > +				   .r =&cxled->cxld.hpa_range };
>                                                ^^^^^^^^^^^^^^
> 					       spa_range
> 
> Woops, missed this.  Not sure if it goes here or a later patch, but
> that's needed to make this work.
> 
> ~Gregory

And for the sake of completeness - I've confirmed that this is
sufficient to get a Zen5 working on top of

   v6.13 + (v6.14, v6.15, cxl-next) PCI/CXL backports

So a smaller set of changes than I was expecting (some other mild fixups
but nothing major).  Just kind of have to decide what the shape of this
change looks like, if not like this.

I can share my modified line if you'd like, but I haven't incorporated
any suggestions from the chain here.

~Gregory
