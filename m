Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2722B8AC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126241; cv=none; b=DfwMQFackuNXmwLM3B96FOwYFytzgtOE2KIWqVIZZ80SmomKDm7ePsFxmJl8orZHbkTWJt562YSv8BHPaBfFbkdflXKbxQZXWcnUPermAtO8jQZRawR/9KSBMJMESms5r89SFLZEI6WU0AttZTqovpsL8gjokH/ZT0GluBXLCVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126241; c=relaxed/simple;
	bh=wJ2kWEXqmHIVVFcKNKQQWAV8NF977MZH28l4p0Emvxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sje+M8AJqWJOob5zA5vLZHwjHh4Gfzy/3O6/BN6m0YGB6KfzFgMOCumDKfF64dKudhUESqvBiT4zp0+TtwQRUf8V6diiqI7fv5DhWGC+q8GBUSVymQVpPuFNx/GHBZ/NTI3rlZC3KBucQgGYaggFTQkLJMmHQWnQsX9qsDbGIP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=apPG4qGQ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="apPG4qGQ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5ba363f1aso777344485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744126238; x=1744731038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80p7iIkcfWVt6T0ZDUkow3T09KI306nMAUN+A5Nla/Q=;
        b=apPG4qGQmLPErLeUoH1I9UR0jhp/GnCUtMeLo3o0N6PW0GerSXjX/gz9zVIrBxf/sS
         /yD+BoSLmBN13K28Ofd9f43NYpIf+KTFlQJp5p0tN6DnKscdZgzcnjU9r7xZJOcJKxNK
         ESgYXgFVE1Q80zIvv+CBZf28gB4Qr1ZhH6n6NTMbMW0Tcn7V91KfxoRCPhpcii7JJLr7
         /nAnogKmfXIDX+qh4Rt77Mq+Myx63Ypu5kaIkVTejl1q/qP/v19xsDHOUz9wMp9GLPuj
         zIUlfGH7ip1/WnOWnk/sTAtZDGZ98jq/hEbmVCF6SjbE3OnT80hdP4SEgTziwIR7UVtd
         Z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126238; x=1744731038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80p7iIkcfWVt6T0ZDUkow3T09KI306nMAUN+A5Nla/Q=;
        b=bERA7N5KY3pCcgTJkLoFSoeVBp8UzgcbBBsNCAbQYtK7Tn/Fn1fZe8UGBN3MBGHToM
         mdpt59TZW/KMo0GHtMywI7S9R38YTqeJYBAnvtrKZXA/DOQOveAEbm1X5AuOTAG803GY
         hBYVXS/LCyfPZwAgnXauZ5qravbyom+EZim1wlJdPaftc9+0yk3UIafAjzLRWEBtroec
         EzNWgXIEmHR29FrHokazBgU3zdzKpOnDZ7HMg8kdwaWfRW/AYWfVlPiVXJ4iRQ8//n/e
         Sg/sdz3V3uB2wx1IDePJIjVpZCibht+KVO+nGS4pr5GGFFR3YOVNmh4cY+GXAgybUS2D
         obKg==
X-Forwarded-Encrypted: i=1; AJvYcCWXezal+bRhU2MclDniv2LOxkgWW8t5dNlC9LzODJYbaKl5lBmVDsqPBuBKXtxlj/gW9EWJimo8daz+70k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfWGSPuKrboV8eOLd2smeb2pFCniSnkp9AoCTAblWbYgG4G+0H
	rTHXnKmH8WPVkshFEP73n1gtoe5toMeOgjGu8dy0LrfrlZyMqoflDVbOj21ARWw=
X-Gm-Gg: ASbGncuDPZtfeyPigFJEdy3ugYMSjFLLJVpIAbo5GeIyIrFUfdRo4ydnZiE9yaXUVsF
	+MmcnMzl5xckdMssmhrVH1epXoIQdb3EtTQKQY3PNLqxdvUOcDFwgQeXGjfrp+AxaQsPyItiDVJ
	AyIU+bAJDJOZNCdwzngRObJdQFiMA+eFYF+rJD61eRJeu3/mL2zWkyXOgxq4gAK4krVbnFUCRrR
	bdEc6FzqOd+jKswIO4cQSAC4IOnS2FkCINP+TG2pLcCRR7akvvR/o9nAVg8mzOs04wXE46+IAGn
	JxHoxIHJB90RR+syJO8cv99JTbel9eKehktvfI+ifelQgxZLyoV7Sa7sdR1MrFbKS4MycTuRDZ1
	h9u/S1uyLOqfZvtK1e+fRmREavjmq8j+k582wBg==
X-Google-Smtp-Source: AGHT+IElG3B7qmkd4bwP3vsCYukqysH6g7f63YBrkPa7XO7hD1VZI5XzBRmSCmw2vJvB7Cw/9Ps8Lw==
X-Received: by 2002:a05:620a:1994:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7c774e24d8bmr2328284285a.51.1744126238373;
        Tue, 08 Apr 2025 08:30:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75acabsm771487885a.28.2025.04.08.08.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:30:37 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:30:36 -0400
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
Subject: Re: [PATCH] cxl region: recalculate interleave pos during region
 probe
Message-ID: <Z_VBHN375pEl_MhI@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-5-rrichter@amd.com>
 <Z_CW6AIE1zoA80qB@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_CW6AIE1zoA80qB@gourry-fedora-PF4VCD3F>

On Fri, Apr 04, 2025 at 10:35:20PM -0400, Gregory Price wrote:
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index 934dcb2daa15..5c9e2b747731 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -1879,7 +1879,7 @@ static int cxl_calc_interleave_pos(struct cxl_endpoint_decoder *cxled)
>  	int pos = 0;
> 
>  	ctx = (struct cxl_interleave_context) {
> -		.hpa_range = &cxled->cxld.hpa_range,
> +		.hpa_range = &cxled->spa_range,
>  	};
>

Realizing just now that this line belongs to the next patch.

~Gregory
