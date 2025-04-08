Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDB235C00
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127159; cv=none; b=F2jnr4AGbYSwFmJkBG2dluO7zPpkMPKBokzB8eE96v0OJWLLx9oMM1ILwZ7HHm2knPyN9qj2dt6582OGSKXwOr+XhyakAU0HOfPgMRUiyAKlsWmbTDBJgW+dWSD+y+7Zv5vSPAoi7mmNJQ71HIWTbmT9f0hUByYA8BgyW7rHePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127159; c=relaxed/simple;
	bh=mjBuZ4+ZgrBFpY/9zvDNPYwTF8Lw4OT1AFFQ3ui0A8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8U4mLIiTmYi9kmOmgfaMypqGUno+CPt8Gt4hk4uBlVCJg1M1BLDsenHBPdFLoegHvIDimroZPMeaqEytenFZGz7WfdWPYhp8vd/cUEI+AjFOldUBl+x8myOXpd94DsEJqpAapvAV0aWemoBA6+dXsaS3dlKCeaVyYLhVbtnYiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=niCnm59S; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="niCnm59S"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4775ce8a4b0so101783811cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744127156; x=1744731956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoXkx7vCK0V8Vdi8YRN6LJcm0AotHEaK6mdkVU4exog=;
        b=niCnm59So3Ij29BsoGLZF141Hw63RbHoWrnJwoFwjvtN6RxgBFEwEGGugA64wHRSN7
         JB/xyfsBkI0Ob9ZWXE3+4XZVpfBmTvKFKHQthGLKNNZdSeoFfm6O9ct2KFt827KJ+VWC
         rC2rSec/pMaKZFesovKj5DJ2twY5LW7MMhHLaiDyqdfK9hAo0/ZqHDUwxCd8cejhbw8G
         3BIpGJzzO3XzmDoEK2i0+ywcCzEX/HqwLsfTD5I6scBY4Q5y6IY48y+I/YBKfp9+x0eB
         BZnJeFBmd9PkHRlEpGoEFgPQUgKnsMD9215zFo6yuqX8qT5DqEpgm5IDI0lBKBXcD5RW
         aq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127156; x=1744731956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoXkx7vCK0V8Vdi8YRN6LJcm0AotHEaK6mdkVU4exog=;
        b=lhtoPhRqu5GEIXdA8eU8ELgnX1u+xP6EZw6Npae4ttyH+sr2spjJR630z30xs2wvC9
         IkoEje+BJVfxC17T429bGD9Ii3xqsdyFH4ccLEiYeOv576D83Qs46l1e9tYbz8Gp5nJ6
         +lNgtmwzRwLo63QFKGtk5NaGx6iKrl6lCzWFKlbDsBCm3394qjYUBZtaellrQxeQIbXX
         4jPvFCWBqZltctDos4EdQFIO0ZvTlHbedzFcPsDEkiDYcpr4A4eVQu67GYByrvH1J3t6
         i7pW5KDNC8FlWNCQCSHjGq996RXupxF1En8XW+trO319uUcXbrpMTMMaNrfpZfZmiTQt
         rkug==
X-Forwarded-Encrypted: i=1; AJvYcCVJoJJNx+yJxQX30VRBsRyY2aObXfXZAdxJFAOYitHo34vaJ4UI78bmjpeTCuDVI28ZHNciHp16AK+p/+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5PV9N49dzm51B/+5oa5CAQoCkfemqH2RhaYVfwfSs4Y6J2Dmu
	+kRTJhm0hrfvOxqSOxpwYdZvT1hGiMPGHvpErNzpnkVCErJBTE+RK2AV/OkQ6KU=
X-Gm-Gg: ASbGncvfZVpmMvLrsaLdqXcm5J06Yuvbbo2NeEwLgkjPHHgWhXjQIPLS8tzYCRcTWf5
	//omF8xnKMf0s5VLSrKEdOtqans1FLfer2AyyzJ+OolHJooCfn0tvJkD84CngWkVtSxzvQIIZGB
	iwAXqTUuNVfPt14Y2vsFV7wPmmzPqGnDSPI1RYOyyKMNdXqlH53cLV06VBLkmwG5L/K3InN3Ybs
	n7scIf7SgOdEzhoLcgTNQ5TiASC1/mKdGzna7xgiwbYAO7QSjDgTnobKOliLSEpYzNAlgOsDp1w
	Il7s1OqS7Hsg+JOg+5iY8vl3KKZizA9pVdmC1mqj7/txgksGFKRaNPyOQEHRw+jsmTvjR9D2dyE
	ueypTy5F+I4ZaUh1Q69uwyWx2Gig=
X-Google-Smtp-Source: AGHT+IE0t0oHePrcFXYkuYevl7iuOHqLSKUup+qyVgXocIBtQicJgUL+StRyzSINlW/hNULuQT1bVw==
X-Received: by 2002:ac8:7f01:0:b0:476:b06a:716e with SMTP id d75a77b69052e-479249a7ef6mr322034311cf.34.1744127155544;
        Tue, 08 Apr 2025 08:45:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b07456csm77885091cf.32.2025.04.08.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:45:55 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:45:53 -0400
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
Subject: Re: [PATCH v2 08/15] cxl/region: Use the endpoint's SPA range to
 find a region
Message-ID: <Z_VEsYYevJ-BPJnx@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-9-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-9-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:49PM +0100, Robert Richter wrote:
> To find the correct region and root port of an endpoint of a system
> needing address translation, the endpoint's HPA range must be
> translated to each of the parent port address ranges up to the root
> decoder.
> 
> Use the calculated SPA range of an endpoint to find the endpoint's
> region.
> 

After debugging some other patches, I think this patch needs to just be
rolled in with the introduction of cxled->spa_range (Patch 5).

(spa_range == hpa_range) up to this point, so this is effectively a NOP.

> Signed-off-by: Robert Richter <rrichter@amd.com>
> ---
>  drivers/cxl/core/region.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index 6d5ede5b4c43..ffe6038249ed 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -3535,7 +3535,6 @@ static struct cxl_region *construct_region(struct cxl_root_decoder *cxlrd,
>  
>  static int cxl_endpoint_decoder_add(struct cxl_endpoint_decoder *cxled)
>  {
> -	struct range *hpa = &cxled->cxld.hpa_range;
>  	struct cxl_root_decoder *cxlrd = cxled->cxlrd;
>  	struct cxl_region_params *p;
>  	struct cxl_region *cxlr;
> @@ -3547,7 +3546,7 @@ static int cxl_endpoint_decoder_add(struct cxl_endpoint_decoder *cxled)
>  	 * one does the construction and the others add to that.
>  	 */
>  	mutex_lock(&cxlrd->range_lock);
> -	cxlr = cxl_find_region_by_range(cxlrd, hpa);
> +	cxlr = cxl_find_region_by_range(cxlrd, &cxled->spa_range);
>  	if (!cxlr)
>  		cxlr = construct_region(cxlrd, cxled);
>  	mutex_unlock(&cxlrd->range_lock);
> -- 
> 2.39.5
> 
