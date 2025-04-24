Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092D17F7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454489; cv=none; b=UjM82RGffckD7IFNQmPDEEpvQQhHFcOoe6CSE1lVRDwIRIkJ3iL3atag3d8yrd+FE80xV7JVFUUlJX5MZpVzgaDUW7y3uYAC7i50rcaDo0z4ooB9rWpRQdE4asuAPxxZcDfNHWrbsEyY9atWwM8ay383MoiYHj8CLs5udq05AQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454489; c=relaxed/simple;
	bh=OFSnTDstLNCA40+74rLNXib5Y+YQDqR9VC7j5XzjQQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLnAFkN7VzBkhzWoobGEW0u5DPuD40k9dqPIyLI5Bf9vDQXIYJ026kUimj9Cb1vnTsaNXRfb4YjaLfG4oVIIvTfkjcCDv1CBa+Mjh2a/ReE3s/Qz6ojNbWDnJdbz43wyzC1RWV//B8s+MSSoq/htiaoHnfA0In8kQ2BrkX99PQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JugQ9Q48; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JugQ9Q48"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769aef457bso6282301cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745454486; x=1746059286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8xiHmz6l58Zf9juB6tacJsT8mDdcuOlMyNOhcDtbek=;
        b=JugQ9Q48YB2cNSLvMNgGy3HI+lcHt+kuu2EUt+3/YJ3cO4lOUTqrvUGNGMIbOBD2ac
         Y8OHB0bCxmYoHqMZ013SDUis4kX2iOR51GVWEjzp2mmD+D/bczSylevz84m+cHbDIMoJ
         6Bi93gUaHEr+gDKBCf0rU+Lnu99sX8+kITcqR4cDNoq7Owl4GG+SPFLOVRPVymQSujB4
         Sc0obg+AQLWxIFLPa7OPfhng6abXK9wpE9w9eUZd5IoeoVlEYEuNg2jNmKAERuaV24Ah
         n5oeth54E1b6lL3tlGgbBDg5c55qsIhGkE02OyuGnkSH0KxSsHphXL9YUIyyOHC+W+Jc
         Pf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745454486; x=1746059286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8xiHmz6l58Zf9juB6tacJsT8mDdcuOlMyNOhcDtbek=;
        b=cQRfjEQINGCOK0q3m28x/Vplg5cCtgMKfTe1go1l2/Ga2NmMMM71zoMhU5s4eCT2hu
         pbj26vVg5Jiv9jFYnsbUPUzmbceF+IGJ7XSEgysUaGF0E1latXNH4WYqO7+XAlvN+JwA
         hl/n1kZc7+q1drqNV5hk/x8gJRbYPzkxD4bDX5h2i4USFmIyV/Mm+AeuPCvYcskl3knb
         FoCAFnmV3q76LYVTu5+emJ7x6DggQzler6E/LC+ReBYxQ70GGIyiPrDTxKGatcCHk0+f
         YRCHZM+9M5tjdjlAgnGxoGGeJ986y24YuiYyaRFVhhe7Yl1xWSZIuO774EzCaHjbJYTE
         uRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn2LMnA5U8oTrlUP4Cknll/WgCee5S0xNRwpUG3+mWKRZcLbypZxcueouk30R4OB+MR4z7OKK9Pgtg1q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Xb98gqEPh59w+Cuw41sNPh7vQbBXJgli56XHq8P/RtJhiwAZ
	1wLWewh8ADfjSZ3rGya2sBlVTME5sc+4fl3aIoa1TWOTA6B4zaPF+zdOAylHy0M=
X-Gm-Gg: ASbGncuRidY9bcueVsHKOEeCwWMP60LwahmImDTVtu5FkCMFpUBz9TeUKr+29LMyKqT
	r2VB5CUxm5grIMsSknpZsHUIhiejK37/5yRw6Wp7akTpO2n31NHo5NhqgRAvvO+cZCahfDpxa/g
	ydteJ/GtJbqvknZAIlfVtwZBaVO6Ttjo3T1axHdwT1l6f6shLaDnYYv76CKn26qBYy9dxrdtb6P
	NTABtgcJ9o7qFxuvB31oEeeoN5/GbkDsbhpGzHB2W/dFZ/petjPFwyk9W2I3fc1D2jbtNk3BG1v
	23k89ZZBGIqv7+FZ/hZ3dd9PjHw3vscOX9cTHC2hQjfbvaLBwBz33Rs7GzsUhFCjr8Y6FBTa5J1
	DT5salKNhAantKwob2g/hiY0=
X-Google-Smtp-Source: AGHT+IGnByHDgMG45Gdl1zjy6uCSmDPBy2o/HP/BPYo2mmBMn7Umr+TeI+0fJtWBOGffWKptPVhA0w==
X-Received: by 2002:a05:622a:199a:b0:477:ea0:1b27 with SMTP id d75a77b69052e-47eb33a68afmr6741001cf.26.1745454486518;
        Wed, 23 Apr 2025 17:28:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1d8f8edsm3229831cf.80.2025.04.23.17.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:28:05 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:28:03 -0400
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
Message-ID: <aAmFk1iQcS7UpslQ@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-7-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-7-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:47PM +0100, Robert Richter wrote:
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index d898c9f51113..5048511f9de5 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -906,7 +905,7 @@ cxl_find_decoder_early(struct cxl_port *port,
>  		return &cxled->cxld;
>  
>  	if (test_bit(CXL_REGION_F_AUTO, &cxlr->flags))
> -		dev = device_find_child(&port->dev, &cxlr->params,
> +		dev = device_find_child(&port->dev, &cxled->cxld.hpa_range,
>  					match_auto_decoder);

This semantic has now changed because of the linear caching set.

Working around this with something like this hack for now

Probably we want to pull the range out of the resource and put it right
in the params instead of the local variable, but just getting it working
for testing for now

~Gregory

---

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index eac873125e6d..c8d38ce55045 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -833,7 +833,8 @@ static int match_free_decoder(struct device *dev, const void *data)
 }

 static bool region_res_match_cxl_range(const struct cxl_region_params *p,
-				       struct range *range)
+				       const struct range *range1,
+				       const struct range *range2)
 {
 	if (!p->res)
 		return false;
@@ -843,8 +844,8 @@ static bool region_res_match_cxl_range(const struct cxl_region_params *p,
 	 * to be fronted by the DRAM range in current known implementation.
 	 * This assumption will be made until a variant implementation exists.
 	 */
-	return p->res->start + p->cache_size == range->start &&
-		p->res->end == range->end;
+	return range1->start + p->cache_size == range2->start &&
+		range1->end == range2->end;
 }

 static int cxl_port_calc_hpa(struct cxl_port *port, struct cxl_decoder *cxld,
@@ -885,11 +886,15 @@ static int cxl_port_calc_hpa(struct cxl_port *port, struct cxl_decoder *cxld,
 	return 1;
 }

+struct mad_context {
+	struct cxl_region_params *p;
+	struct range *r;
+};
 static int match_auto_decoder(struct device *dev, const void *data)
 {
-	const struct cxl_region_params *p = data;
+	const struct range *r;
 	struct cxl_decoder *cxld;
-	struct range *r;
+	const struct mad_context *ctx = data;

 	if (!is_switch_decoder(dev))
 		return 0;
@@ -897,7 +902,7 @@ static int match_auto_decoder(struct device *dev, const void *data)
 	cxld = to_cxl_decoder(dev);
 	r = &cxld->hpa_range;

-	if (region_res_match_cxl_range(p, r))
+	if (region_res_match_cxl_range(ctx->p, ctx->r, r))
 		return 1;

 	return 0;
@@ -916,13 +921,14 @@ cxl_find_decoder_early(struct cxl_port *port,
 		       struct cxl_region *cxlr)
 {
 	struct device *dev;
+	struct mad_context mad = { .p = &cxlr->params,
+				   .r =&cxled->cxld.hpa_range };

 	if (port == cxled_to_port(cxled))
 		return &cxled->cxld;

 	if (test_bit(CXL_REGION_F_AUTO, &cxlr->flags))
-		dev = device_find_child(&port->dev, &cxlr->params,
-					match_auto_decoder);
+		dev = device_find_child(&port->dev, &mad, match_auto_decoder);
 	else
 		dev = device_find_child(&port->dev, NULL, match_free_decoder);
 	if (!dev)
@@ -1363,6 +1369,7 @@ static int cxl_port_setup_targets(struct cxl_port *port,
 	struct cxl_decoder *cxld = cxl_rr->decoder;
 	struct cxl_switch_decoder *cxlsd;
 	struct cxl_port *iter = port;
+	struct range r;
 	u16 eig, peig;
 	u8 eiw, peiw;

@@ -1488,10 +1495,12 @@ static int cxl_port_setup_targets(struct cxl_port *port,
 		return -ENXIO;
 	}

+	r.start = p ? p->res->start : 0;
+	r.end = p ? p->res->end : 0;
 	if (test_bit(CXL_REGION_F_AUTO, &cxlr->flags)) {
 		if (cxld->interleave_ways != iw ||
 		    cxld->interleave_granularity != ig ||
-		    !region_res_match_cxl_range(p, &cxld->hpa_range) ||
+		    !region_res_match_cxl_range(p, &r, &cxld->hpa_range) ||
 		    ((cxld->flags & CXL_DECODER_F_ENABLE) == 0)) {
 			dev_err(&cxlr->dev,
 				"%s:%s %s expected iw: %d ig: %d %pr\n",
