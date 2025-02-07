Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD59156236
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945851; cv=none; b=DQh87BXDCA9BL0nFGgSHbVhfi84gN9zTQN2v4YMf47Y8gXULKFobL26GCOW0SlBQqKEBKdMsoZXtX0YO0MQ3uSrmTWsyXt79VEjG2RomvR42M6x0NCyOqt++FaHm88JKgdYQPx9gwvrpAQkhwJFan8PS6nO1dhDJWYZljbJUpNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945851; c=relaxed/simple;
	bh=Ijfj0q6MLOVMyRdQ07uyaRYvZdP27Sa5gpSKK8sH32U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbHmcEyz9FJ/dS0Jf56dSSzUEULOI/Z+N4GiNMtGhqQ65bvUmHaRSSwVBhWgHVoQhUnWwX/P0ukrh8gUWEUesI3+k2owjLLB1KSLYTPfYCCuUaLRzNNAqX0TZOwBRk3/VXCBTc3hVH1898x5GFDpH4Mw7OWz5PvgWeKw0NZb4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=h3sr346R; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="h3sr346R"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd0d09215aso17554186d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738945849; x=1739550649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n047GxOF/6B17NuKH3fttxHpdcTkmFoC+Qx5gIWUBTo=;
        b=h3sr346RCtd6JbqlOt6DH9vJvV+X+F+THl1kNI4rZN/Q+5P9y4S8HB4OVkOHjaM1+s
         g778kzUtC4N8CLqYlDyyu4SaRbwmKZwdDp0s7Cdm47YDbpWhz181swqGpTLL36PqU28c
         gFh3dec0qhTiETsnazOHFYRWCX/CctZbnXQYnyAOTbIvhjhlNTFKbUvEi8gjNld9oUHp
         ocLBNqgzzGhF2nARmFcwFitNqyUJy5rjk+6w1bsq0KZkgYyk7Ds0IiXUgbt8rM6mYKmM
         y0qrkfZodls4U603p7WPX63bwO6+JpotPO9pjuLAPWz1f9iwYu3lkkg2eZ9xNO0Wzf1r
         Ukxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945849; x=1739550649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n047GxOF/6B17NuKH3fttxHpdcTkmFoC+Qx5gIWUBTo=;
        b=lli64j91Vc67Z72TUofk8qO87NlMgfIwHPbTjJYF4reIDeOWkluP7b8b8jxJaf7Byz
         YueSvxeEqhv4lbQg2dfQoD2m/u6V8MJEEpY5E4zQV+A651MaKCh42/zFO6utIZIzHegH
         sxayF/renTxmZqmETfM3V4H2Ob7aE8eIn5FtpaWHFsty2oTxidjPQXBktI0cZ/ugkHpL
         2pORKOyhODNbTgm7Q3rkYA8m36Iy8YRa/QYZGT3q37Qdr/cqS/z78qLKVZpc52dzMAlp
         o1/6GcHtN91FK5x71PGeS15z9j2/9FiGvPEA9Cqk4dhUFxo+xh4iQk5j5DeNQTbTLU9s
         LxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH39g0UsTqDB6eDOFzhRAPEaMHjJqssfjk6Pcu0ik9JcizujJGGjc6OQWN8nP7HZ6R09YiHMqarPWJii4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/gRMVm9yMG8sH/ql0dwvU3LW49ovY7qkarZNFBPo5PXU2MVjV
	9qQPS152mW4gbXMe69BmNI4GhnQWhHWKhLb2XW2krJN7z24bPJityBtTG3UayDw=
X-Gm-Gg: ASbGncujKyXoGPqXT5+VIG2BGKA9/xv6bKj5tCcd96eyPaz9ZObvEJJAt1PDJPWRDgf
	BHANU4ICwzyrsh7sOzOA2qZ6NoGDP94iNUG120HQUOi2O7qosf7cWlfEvjaUEBP2Gn6z26JLH3g
	gPR7KS8USN+P9RxYgGLY9MxVW1quf9Rr054AVF3MTMJbImfSk1wc2Cu3LDHZYLj8JJa+z4eOj39
	E3WHFfYo48lSHtcbUus1fmJhq98ymWWlCjK0TWHvm/dDFPAL5nGVCasiz741q0fGPIzrW+TQagv
	07GGPWp/tkpvo64eY/ig9pjalZ6tKCllgTsUksBSrzOpl45ukmibphHSdINufT2r5T97fcnOzQ=
	=
X-Google-Smtp-Source: AGHT+IHyvvZ4n7fuu5XAqR8Gn+c6EeG9F8wKLFAfXqxR3mTdPo+r0XyLMsPyLNxl849TZ4VS3a6Dsg==
X-Received: by 2002:a05:6214:1bcc:b0:6d3:f1ff:f8d6 with SMTP id 6a1803df08f44-6e4456fd4e9mr47684616d6.40.1738945848853;
        Fri, 07 Feb 2025 08:30:48 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e442fd3407sm12357656d6.82.2025.02.07.08.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:30:48 -0800 (PST)
Date: Fri, 7 Feb 2025 11:30:46 -0500
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
Subject: Re: [PATCH v2 18/18] cxl/acpi: Unify CFMWS memory log messages with
 SRAT messages
Message-ID: <Z6Y1NloQyDCal8EP@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-19-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-19-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:53PM +0100, Robert Richter wrote:
> CFMWS entries have a similar importance as SRAT table entries to
> describe memory regions. For CXL error analysis and memory debugging
> information of both is needed. Unify output of both messages to
> improve logging. Change the style of CFMWS message according to SRAT
> output. Also, turn messages into a dev_info() same as for SRAT.
> 
> SRAT pr_info() for reference:
> 
> drivers/acpi/numa/srat.c:
>   pr_info("SRAT: Node %u PXM %u [mem %#010Lx-%#010Lx]%s%s\n",
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  drivers/cxl/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/acpi.c b/drivers/cxl/acpi.c
> index 3e75e612cbc4..93c73b163c28 100644
> --- a/drivers/cxl/acpi.c
> +++ b/drivers/cxl/acpi.c
> @@ -447,7 +447,7 @@ static int cxl_parse_cfmws(union acpi_subtable_headers *header, void *arg,
>  			cfmws->base_hpa,
>  			cfmws->base_hpa + cfmws->window_size - 1, rc);
>  	else
> -		dev_dbg(dev, "decode range: node: %d range [%#llx - %#llx]\n",
> +		dev_info(dev, "ACPI: CFMWS: Node %u [mem %#010Lx-%#010Lx]\n",
>  			phys_to_target_node(cfmws->base_hpa), cfmws->base_hpa,
>  			cfmws->base_hpa + cfmws->window_size - 1);
>  
> -- 
> 2.39.5
> 
