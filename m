Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918928399
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042853; cv=none; b=rRhdvHqRUjzbvqK5L+SHM96biJ1m7FLgWGb/VRp+nE6lFlO20EdlXTefy9NB7fdzLQMM9+sGFimcjYdC0+uN+NYsaiFrbrXORf+cJmFDyVQg0VFHEO9RXIS8lUmey41G1hUNsAvZYeZK3GXXy4SOobtrDtHXZVEAjJcTBrrm8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042853; c=relaxed/simple;
	bh=3yap3ZzGTQYZ/vtwqCQHVg5FTg1hill/s2XBdCCadm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIHiQGs71c4zY4NraM/wYib/fcoeGEtLoJwvbFNifTJWTbhoeGvLLO61SxmDGhbx+RRjjDLU/47NP6d/4d1lwl0w+SkQj8Erx6Kiqqk4bfcv/w0M+ICnkO89D3j63wHqQvXaMYOM8LA4BTxrjgWz3FuYR7SnUd+pglT6RawBRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dLSkSCoa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dLSkSCoa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so3168885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746042851; x=1746647651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8wD0px5HjnR5pxkOK8NrG7Fm/ol5rI8jfr96COPSAI=;
        b=dLSkSCoaGZKJZ/VG6r3R/KRcMjLm0Ejk1cssuehU2pzRM+m1uRJx6iB5GE2+LfBVLB
         q9nK89UoPKyfklF7OV6bhyRMO8ytk9NnQDfaF5vOz2R1RuInQSUbxNhwXYghYndq+JXv
         +FOvb+uXNLkVLbguwo69L3CjORk8Dq7uaAFmeyzu2cXagK+B0hVML9XV/njD1rpkz9sW
         FBXVQCXk2fR1qqHWeF+jtGp06S73i1zza6NqaLf5eWPwMS0U7rvZ/sznfMTgaRIL+nIP
         UC56ZErNZMtN38HgRFDblJQ+1TDrO8iCwUmqLBukTVMo6330QV19Bkrb254gGKYUYNAq
         D74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042851; x=1746647651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8wD0px5HjnR5pxkOK8NrG7Fm/ol5rI8jfr96COPSAI=;
        b=HOdaNu3KyM/mqWBeu/tTvJhoMfhoQ4XgkBlMAp+Oq4RCIWxv3hXfdmM5jIwE1UuYeN
         P5euRJRiJK5tR3siZqrWeHEqX9Wbh3GAzBlSwCylHjltBE00vGm6NcqbAAYm8P3q5rvX
         NBLWAqQlQ8BQ5AKsJ82W3WdV5rWxPrdMIKqYw7BVyVFj+aOq7ykE32y0ie1398GULRN8
         X7Cyr1bz2VhG2fawj5pJVDIgGKtcwTOwd9ODRfbG6v261JZPbwiYz788o+8CnfxFsWTf
         neZ/UhzSnxALRnX80gIJOyBrpPzmSR/+7+IKK3fYqOVwECkDBD2TvSt8VGX4PGJCXD9Y
         1wjA==
X-Forwarded-Encrypted: i=1; AJvYcCVdwHhNRMNPiawJ8h2GAHtjU1z61I3J28OSIARjA0VOTfhtpN4h6kjKm7wIIMcpNC0/Q9ughPRBuC+mFiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKahHRd1XGJ8cD0EnqL1v9h7nddIK7JPYXG/J7gCXl7YXal40
	qrIjGs3NynGYaH4pACroh+qzjZlU8G2/Il++5gZvJ4Pw7JLGhstIKsdgBxBQ+w==
X-Gm-Gg: ASbGncvvJVFC9XmdV0BRdzPniZytFdoszrBWvEyOKcjdXDKPTtxCsLGUn9v176O61Ta
	MwxaYe2uxbpvN0f2FdD4O9El0ZbfBd1dtXftNjMmUfdiYpB6Osg6Ol3nLpkmzZ2uvVSAmmY5tOx
	soYUwWyeX58u9UL8rAvuoGbvQnUlVKMvOin703yr9JGzAFi7Xte8O35XSYPG+8wHDZHLyXTN5kA
	AM+qZ4rFnusKfc98h98FvYB427iqRiikPdEdvc7zNACbj2YE7rEf+MSHWsFxKIYj5agoOB0BJ1w
	H2i3SZzZ1N9Gq31XUkKvf28WTa4+WG4hB7+GE26YlrpS4MrNnzTqUrl8Oe2Vp838rPVt4ntBXUL
	t/D4KeE6AApRZ1tkk
X-Google-Smtp-Source: AGHT+IGuD6kTALubXNZirfBTu3m5HhSSf+bNLb+HyRwsXYMZcmIJMtVfVYD/Pd6uFMOtp50fXulIWg==
X-Received: by 2002:a17:903:2287:b0:224:13a4:d62e with SMTP id d9443c01a7336-22df3590c0cmr73354905ad.35.1746042850758;
        Wed, 30 Apr 2025 12:54:10 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102d31sm126707425ad.198.2025.04.30.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:54:10 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:54:06 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cdx: Fix driver_managed_dma check
Message-ID: <aBJ_3qI6WRXpJ3SL@google.com>
References: <20250425133929.646493-2-robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425133929.646493-2-robin.murphy@arm.com>

On 04/25/2025, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_cdx_driver(NULL)
> is already computed, and thus the check fails to work as intended.
> 
> Will and I both hit this with the platform bus, but the pattern here is
> the same, so fix it for correctness too.

Thanks!

Reviewed-by: Will McVicker <willmcvicker@google.com>

> 
> Reported-by: Will McVicker <willmcvicker@google.com>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/cdx/cdx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
> index 092306ca2541..8aa92a198b71 100644
> --- a/drivers/cdx/cdx.c
> +++ b/drivers/cdx/cdx.c
> @@ -348,7 +348,7 @@ static void cdx_shutdown(struct device *dev)
>  
>  static int cdx_dma_configure(struct device *dev)
>  {
> -	struct cdx_driver *cdx_drv = to_cdx_driver(dev->driver);
> +	const struct device_driver *drv = READ_ONCE(dev->driver);
>  	struct cdx_device *cdx_dev = to_cdx_device(dev);
>  	struct cdx_controller *cdx = cdx_dev->cdx;
>  	u32 input_id = cdx_dev->req_id;
> @@ -360,8 +360,8 @@ static int cdx_dma_configure(struct device *dev)
>  		return ret;
>  	}
>  
> -	/* @cdx_drv may not be valid when we're called from the IOMMU layer */
> -	if (!ret && dev->driver && !cdx_drv->driver_managed_dma) {
> +	/* @drv may not be valid when we're called from the IOMMU layer */
> +	if (!ret && drv && !to_cdx_driver(drv)->driver_managed_dma) {
>  		ret = iommu_device_use_default_domain(dev);
>  		if (ret)
>  			arch_teardown_dma_ops(dev);
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
