Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1C2EAF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530632; cv=none; b=lxiDCWx8xZhgJLTpu3/fgzrVdbck1Yz8rI/brsQ1Vonl5C7OrvSs0aKK+dEVCNw16rHb6Od9+KDlh9elD4+iL3i014S+Cv2NTMObgfSCrkB8aNc2E7uO7M6qndF2jgVheG0lB60hIN8/vY3hyCiGT3x6tmc6tg5UM88ki/i7SIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530632; c=relaxed/simple;
	bh=fa9Yg66rJ5KL6eWvE5zAgPcslLj7QNNF1zTzQ1VFLIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz4vHEPiDxmzPbXuQTPH1Fk5k8JpsRUHuXQi6JAt3gkRdIk2BQDYUFI38plYWkDzDUVYmVeHrpnJLY3gVh30j7XTQN4wVrOXCi6sfdce1UwzDLKiJEKGJ/UAqmu5Ps0mG+1UxOsZnDr3Y5RauAsbQgiFiYf3SHQG/GyEwOx/ZTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NlFRbqIe; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NlFRbqIe"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47663aeff1bso55582811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743530630; x=1744135430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/pmtjLBaI1GK3c3R4g+2ziQwqKlgj707RNFDRmc4/E=;
        b=NlFRbqIeLy8yKPn12gvadvigHbE/UrD4681/NkSew2XcBeUjbbDhjUEaoM1K/PeDuP
         ciRgiclX7eWA/R0D7nrGbj63E09uajnn6mz53sL+/81goxmVX6rAm7wqVO8of3jg2fNn
         FhwMxW1zStkz1yyusaOtfJx2OxtpaENZ+1duHkGvZwSB3bptlNX5PnxIIIsQoTo4xnG8
         uaS8CTIGfQ4XBJw4kCtBREQBKPd7YQ39FuWZeRFtOKDFkC8Aji9juxaOalF/ylqDjymK
         KL07SMXj48AFNZD72oxZO4lOTNGhCsLlxKwVOizyYUnXGAlbIGbS0ZjpORmWjgcE+h4U
         xeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530630; x=1744135430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/pmtjLBaI1GK3c3R4g+2ziQwqKlgj707RNFDRmc4/E=;
        b=s6XOszOG4kADBfSy+GM0TboJdmLPbc1DDvL0QRB1d4PzEeD9iBKNEd5Bt+11rtZZ3z
         vcSK3DQmTiDsaOlsK7zmVELDoaiMNRYdN/DqFTy2L2OqhUYNwmQNdG7WXEpVGNIqNL8a
         NT3FO3W5zlGa3MVefaB8YOJDy7gVJ+ISRLTUSFNstjPkMwquCG/RHaiFFoqDl93tqou5
         8FycLVaCGxKhJpWaqGCSpeQaDMGnxvJOLGCrw6EpgMCltZSW4Sou1uTAm+sIDqt6BGuU
         V9yNJradL32cFFMY7cWNyK1DCFY652N7Chk8oz2GHEQYolq0ak2NBmUNHakj84E5rBTa
         kNnA==
X-Forwarded-Encrypted: i=1; AJvYcCUEJBhMa/05NXamOjhr95f/KbknVJKhfCnK3VgU7LCpY2849MV+40yft49CC85w/LOib8CelxrnfYA8Y74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4wsNIAkA5G7AXrVc/LAMc1iBSuFT5PcJS25JAA89alwwPepkj
	LwZJzRL+Lp2U2diH5ldenYH3LiEChasSae0BzabaARyho3SMYPzlICm6InuKy0w=
X-Gm-Gg: ASbGnct/WytT/mRIlz0vIpnrywrxuwe6CdW5Zbmnk5RYEYTS9qvcW4HUOAByv7wf52q
	iGagLtRbyOX4740Rn39u2623rMLkxd9y/EQrsGTgOEyI/DK34F1AYI62pkH4sTHNrvLT8kVz48f
	IY9QUUE1JwZW5MV8MfPUwzgd+zS4f2RROp47zKhmJwUiB1uvWjuxiJFqruiU2DXKaCyeXGcfZZg
	RNlAAGfSrdhdmTjmgi93yMosVSyw+0oWkAE3MhVLfi0Eu8nwSda7+EhKlk/V1HN8yCMqruZGB52
	3xgmTnlHiQFmQXEA5c+xaHdxjYDQkAvGKVnHUNJHqaUiOyoRg7a2cudq8PfNDgIiiwoe2qIwRwI
	K1z9G+lsq6ykrRlysyJEL534C38gmYypJ5A55cg==
X-Google-Smtp-Source: AGHT+IFWulk+PKL6z0sywIwGtZBfiIm2z+K2664jV7oKth7BWn/oo0zgj6aMDW6mSS6Zur5TnBRWhA==
X-Received: by 2002:ac8:7dc8:0:b0:476:b02d:2b4a with SMTP id d75a77b69052e-477ed75af82mr200365901cf.27.1743530629711;
        Tue, 01 Apr 2025 11:03:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a10459sm68534151cf.4.2025.04.01.11.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:03:49 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:03:47 -0400
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
Subject: Re: [PATCH v2 10/15] cxl/region: Use root decoders interleaving
 parameters to create a region
Message-ID: <Z-wqg92rgqY1WY8v@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-11-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-11-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:51PM +0100, Robert Richter wrote:
> Endpoints requiring address translation might not be aware of the
> system's interleaving configuration. Instead, interleaving can be
> configured on an upper memory domain (from an endpoint view) and thus
> is not visible to the endpoint. For region creation this might cause
> an invalid interleaving config that does not match the CFMWS entries.
> 
> Use the interleaving configuration of the root decoders to create a
> region which bases on CFMWS entries. This always matches the system's
> interleaving configuration and is independent of the underlying memory
> topology.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>
... snip ...
> @@ -1955,12 +1971,23 @@ static int cxl_port_calc_interleave(struct cxl_port *port,
>  	if (is_cxl_root(port))
>  		return 0;
>  
> -	rc = find_pos_and_ways(port, ctx->hpa_range, &parent_pos, &parent_ways);
> +	rc = find_pos_and_ways(port, ctx->hpa_range, &parent_pos, &parent_ways,
> +			&parent_granularity);
>  	if (rc)
>  		return rc;
>  
>  	ctx->pos = ctx->pos * parent_ways + parent_pos;
>  
> +	if (ctx->interleave_ways)
> +		ctx->interleave_ways *= parent_ways;
> +	else
> +		ctx->interleave_ways = parent_ways;
> +
> +	if (ctx->interleave_granularity)
> +		ctx->interleave_granularity *= ctx->interleave_ways;
> +	else
> +		ctx->interleave_granularity = parent_granularity;
> +
>  	return ctx->pos;
>  }


The root is always build from the CFMWS, so you don't need to do any
math, you just need to take the root.  Since the logic calling this will
always climb to the root, you'll always get the right value.

So I think you just want this

--- 

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index fe23dc106956..05b24b008a1b 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -1977,17 +1977,8 @@ static int cxl_port_calc_interleave(struct cxl_port *port,
                return rc;

        ctx->pos = ctx->pos * parent_ways + parent_pos;
-
-       if (ctx->interleave_ways)
-               ctx->interleave_ways *= parent_ways;
-       else
-               ctx->interleave_ways = parent_ways;
-
-       if (ctx->interleave_granularity)
-               ctx->interleave_granularity *= ctx->interleave_ways;
-       else
-               ctx->interleave_granularity = parent_granularity;
-
+       ctx->interleave_ways = parent_ways;
+       ctx->interleave_granularity = parent_granularity;
        return ctx->pos;
 }
