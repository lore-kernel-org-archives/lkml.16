Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4942F42
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743741487; cv=none; b=b9FvqzppehnQzlCqq8kWDjeCzIU/YxcQk8HBTKqgCu4rf8cY/ivv/ieyDsQQWna4sBTEcbCL/NtUlmKJ6/s3zkMgoPxA05YT1fMxFIKbwZ0Z6F3EAHpy/C1kAUP1Zta2v3slqvDMD/xcbw7Ie06oWt+G8zLsftvYthBBl8inxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743741487; c=relaxed/simple;
	bh=lyb2jGaCjo1NEHvNQYWY2lxpwtBPgNfuUJiDItCeBmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diLIyWsyixHavmBEcts9qcdDDnj48887++OIPOhCaF+q64yMkk7nCDiIb+P5RU/0rD0vV7En+b96thWSby+f7HpBu9bN2WSQ2aTRjLFNrbrSoiBRaRxBHmYnG44yEXHqixwW5CvDXW2GsKbOMjdbZoQhGkSdB92EIu2tEQp6MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WuaJEOhU; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WuaJEOhU"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8efefec89so14151466d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 21:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743741484; x=1744346284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgobn806xhKSiPfo1W2VopYWNjJP/gOq+m3fHHTdi2s=;
        b=WuaJEOhUod01D0Iko8V/5TtEkjgmYdkrrG1ozvJDKiyhiVh1BZwTkNi9ZQfaOwTa/g
         WqYkRZHkPs9++oA2MKUvOda1pgYfE8j5Ve330ppsyOhSn4VRvyTVOeHkIj8zTwAH3U85
         CxZicwerw+eW1Pg+vyBFJ4zfMMpqTWZmuG2gP5IjhPj71DvS0KXib9/M9xR73iCif3yx
         iNUOmZ7VNVTQHSb1umzN8/+fL9qJvC5AHu00R3A98c/I8nc3GwgcFBpEzvlPAZF2NJt8
         tINI9jDRAwo4yeRAXrwoEN1UhPDZuSugiYUmy16dAHgRgzLO5zv58/G22bP8AjUlrHl1
         G+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743741484; x=1744346284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgobn806xhKSiPfo1W2VopYWNjJP/gOq+m3fHHTdi2s=;
        b=Y85xJj8uoSDF8ns8A4GQE4XlqKhmpkTWNu8FY2BWX/7RqO8zpWZTSqjgr8beQNy5Wq
         88d5Dq4V3OAfd06JIfCCZIi8G5+1Hn5fXHes93w9g5Z0PycSOZ16VcCLMbCgUmmbOT+z
         +/BHubqY/4WEp3nYCI89ctk5ho1qMGPBJT891VNFDo+dbUo0f+Rp0DPsAQIg5R810I4Z
         zkKTXkdXB6VmVBUXnVKXJYoe0RW7Ar5SkLmZVH4+iZsEHHVp6UKJzzkm8HUWD4RKhlYd
         9ovptR+QdMFlhN8w5hO4pk1KmIlm4s7ABLf8FnW8oQpJioCv+UEPaBShlize+qM3zdrj
         IMMA==
X-Forwarded-Encrypted: i=1; AJvYcCUvaYbV2wCFj6m8Ot+lW/Pn9DnH9ZUHiaXKE2frXjyKR7xxxL+SHE7PuWT9sJpU+145pRvipj7kgxP1CN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMmPB8ovo/NDiyDlvKepUb8oikCKzEQPLs46E1J40/qZQaP6C
	4oM8wdQlAkMABBRx64jwSKHYgDfXXjzJ1QCsqkIQaVKh+EgG6V1Ui03akjzoNrw=
X-Gm-Gg: ASbGncv2DjG5pLbwgCt3nnKG3F/w+l5VrkXvfVuxF/LVA4BFyppabC6jAGHxpy48BYs
	lWEMZfx3C3uTtwO+OoyPjhPvSTPsELpVBCOu4hw7QbAoptbmL1sfcr3Ufbuw0BD7vixtfDUnBcv
	vlsCI7lXI1KbLVVFpnzRRy8qLBxjeBSW4+06szaEDT8Y0XBq6be06G8dZuzxd3n3xIaDUk/2eL7
	UN7Tqpx9J9zyYQvxoZYobIXW46ynwXKxv1iiYI2e+7MDJeMxPUYizfWCUOJX19d1TcoiKomBwH1
	IppcoOw1lzWRQDDdz/SPzJY07eijgFhdP7VoaslbTsCZCP5LLOvKXfYr+57Zq5jrZq0nUwtY/VU
	ytIFFcbWInFXo5xLo4A==
X-Google-Smtp-Source: AGHT+IG0tiqh2XJ5WKz3Vnn960XkpZHBV0gj4tAJnX8Jtr1GU395rOC3NcojK69dTK/y/U4mNmPtYQ==
X-Received: by 2002:a05:6214:212f:b0:6e4:4331:aae6 with SMTP id 6a1803df08f44-6f01e7ba36cmr27027806d6.39.1743741484049;
        Thu, 03 Apr 2025 21:38:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (syn-098-000-145-135.biz.spectrum.com. [98.0.145.135])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0ee7565bsm16429746d6.0.2025.04.03.21.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 21:38:03 -0700 (PDT)
Date: Fri, 4 Apr 2025 00:38:01 -0400
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
Subject: Re: [PATCH v2 04/15] cxl/region: Calculate endpoint's region
 position during init
Message-ID: <Z-9iKcmVz2Fj2q7Y@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-5-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-5-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:45PM +0100, Robert Richter wrote:
> The calculation of an endpoint's position in a region traverses all
> ports up to the root port and determines the corresponding decoders
> for that particular address range. For address translation the HPA
> range must be recalculated between ports. In order to prepare the
> implementation of address translation, move code to
> cxl_endpoint_decoder_initialize() and reuse the existing iterator
> there.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>
> ---
>  drivers/cxl/core/region.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index ad4a6ce37216..6f106bfa115f 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -1903,7 +1903,6 @@ static int cxl_region_sort_targets(struct cxl_region *cxlr)
>  	for (i = 0; i < p->nr_targets; i++) {
>  		struct cxl_endpoint_decoder *cxled = p->targets[i];
>  
> -		cxled->pos = cxl_calc_interleave_pos(cxled);
>  		/*

This change breaks the entire sort process, because in
cxl_region_attach_auto the positions are temporarily overwritten

To make this work, I had to drop over-write of the position when doing
the attach process - but this is just incorrect as we now have a
cxled->pos that indexes incorrectly into p->targets[N]

The result of the above change (without the below hack) is that decoder
probe order causes a race condition - whoever shows up first gets
position 0, and the sort does nothing (because the above line is
dropped).

TL;DR: This line should just be left as-is.  It's perfectly fine to
re-calculate the position.

~Gregory

--- DO NOT USE - added for context ---

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 902b04b875b3..e75eb1c815f1 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -1855,7 +1855,6 @@ static int cxl_region_attach_auto(struct cxl_region *cxlr,
         */
        pos = p->nr_targets;
        p->targets[pos] = cxled;
-       cxled->pos = pos;
        p->nr_targets++;

        return 0;

