Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFB7FBA2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745250078; cv=none; b=P5YrF1I5+Xu3dQujm7Igby8iW+lfvZYGSvrc+WiOAEoVquJujqUk4+q7bWzY3QDMoDe0Y6FfLGCojJKUsue+NMxZrqNceEzDA7K0bVVB0fKI4sGBCus8yGuJYQYL9hZoITGwyZtfAG9UroMyUBwKfNZ/coE1E8vVCGKzVSYikPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745250078; c=relaxed/simple;
	bh=TZkYtvAnbW0rAUB3UTKIF6BEsddz+3MGasPFK4AmhCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IryoBK3Ph1AkpLDfq8DLc5uHJi5lUu8aTKdapq7xUun8NZOTpnrGWTAVrSYtZPmaweiiTUBChBlM5A7fOjNSmnu9vnlMb6VLQqnU1wf+yctuN7dgtel7LslBVSGUw5XkHESF4CaJ/gki7XCHQRQZzJtuoXHP7dEdkpGDLLs1TZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=a7MVk4kr; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="a7MVk4kr"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so51675676d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745250076; x=1745854876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdyTPsWFY5MtuQCjcezK9f9howJswTIWUpgsS1wT9Wg=;
        b=a7MVk4krFlliNqF6xqR6gtXOR24S23NMQwN6NW7vMzvMc/K3i2y7F3ohn3CkUZBN1e
         thTNGpxmYGcrwI+fpYpC2JsaBUgzNyc8l+ZONQIlMl+om7maERsLKXcCSc7BgYIA7Ehc
         9nSKVDJgngvYGTcjpTSMWnb6ChzBfVf/4OaI0DkEKpxx2YhBoutTkiInMHEJoMp/aJwf
         oWkFbLZ0YqYCsAQ9NGXHy1J5tXh5a26rTCHkNn6RjRU1q6XX/wvvsmZAm3Pw5LJWV032
         XLexkWBZiNXMiCD9jbv+0KQfBHrAFIjIUMerh12vNkz6TKfbWADrIjwW6ZlnhyQoEBLg
         mJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745250076; x=1745854876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdyTPsWFY5MtuQCjcezK9f9howJswTIWUpgsS1wT9Wg=;
        b=N6RLbxRAqQH/kv/PF3wyR9XOJ0uVZuNXrjMYL6bkNGV+G4mcPXK52Kvu/fXidfy0HE
         xrl8rBktvHqLJ0zhld6xipU/KSdmiUy1SDQ82s/64ApZjg8hC8p1PWUAt0OM/lzrKZP6
         ixXkHq2SFzJWoE5EvNZUv+vAGBeCehxvLDrmnbZnNgk65q4N3tdXnmQcIZ7KT5pFQNha
         cEAoZXv1ACi1u8NmImX41Vh1TyxBbuhk245HXmog3hzauxv8WglibfWu8MwH0ZvKHtFb
         eJyOBqdItMzXAPNWFNIMYUNGv8R41UMTfGOM1Z5EqIhnSPx/O4VELRDEzT6zIrwbsMr2
         jABw==
X-Forwarded-Encrypted: i=1; AJvYcCVzgDCvcVpjlOHsL4P3CqQcEpQacPsksJVSwo1ycm1N3mTYLkVAl+i8XGSIVwNk1IpUE1UBKL8zcVUuMYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9k61rIiDogh2E8PB61SV3VOzZJq7zzKqHCbYeIWsQ1ObUy3P
	dycvYA7HvbQ5B2qv2mplnn1wK296Fh2cMGJbrS7hOAMzvHL81S82pXTvSl7Hl1QSaZRVCtLWNk0
	V
X-Gm-Gg: ASbGnctUV0Aj7rDvRevC9a+2IuPqLpLloTGXfGFB1CdJHJ7nLBWpeaZD1JwScUcl6yt
	IvjtIhqU4+splES+gOMRLlmjokCmJQGiVsh1FK+I5Vt9OvVs4GIjGL3jX2GKFkqHVZQg7G0kqTL
	UvIzeyEaNfg2GJ3bWBosYN5KpjWlWqhdVSxEw6e65RmNTPZL2jLU6xjlLrYDyslsVLGUzXZ32tn
	1775S1qcQDKjvFTIl05cP6XsQZ4vAzSHExSb+ZAMsTScQGADO/A6jEp7b4rsC65kBBN7SaQgNH6
	wMOcgMrOm6YiSHyxOMnyFTtHN0rpRIcm6Xf3We3dEoQ2nkFH/J7yloA16q9RcRvCh14kDmKm0R/
	0W0rWp0SmkXTfFbo2ATon0nI=
X-Google-Smtp-Source: AGHT+IGF+LAkUFbmnxnehWcc+xd6slRE1zOVmThwONU+nZGyCUWYHSGtySygUNijYDwjpSnYOhZnxw==
X-Received: by 2002:a05:6214:3211:b0:6ea:ee53:5751 with SMTP id 6a1803df08f44-6f2c27d0d1cmr224544946d6.21.1745250076062;
        Mon, 21 Apr 2025 08:41:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1278sm45218366d6.12.2025.04.21.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 08:41:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:41:13 -0400
From: Gregory Price <gourry@gourry.net>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, ming.li@zohomail.com,
	huang.ying.caritas@gmail.com, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl: core: Initialize eiw and eig to fix potential
 uninitialized use
Message-ID: <aAZnGTdN4lyZ9aaC@gourry-fedora-PF4VCD3F>
References: <20250419203530.45594-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419203530.45594-1-purvayeshi550@gmail.com>

On Sun, Apr 20, 2025 at 02:05:30AM +0530, Purva Yeshi wrote:
> Fix Smatch-detected issue:
> 
> drivers/cxl/core/region.c:1292 check_interleave_cap()
> error: uninitialized symbol 'eiw'.
> drivers/cxl/core/region.c:1297 check_interleave_cap()
> error: uninitialized symbol 'eig'.
> drivers/cxl/core/region.c:1299 check_interleave_cap()
> error: uninitialized symbol 'eig'.
> 
> Smatch reports possible uninitialized usage of these variables if
> the helper functions ways_to_eiw() or granularity_to_eig() fail to
> assign values under certain conditions.
> 
> Initialize the eiw and eig variables to zero when they are declared
> in check_interleave_cap() to prevent potential use of uninitialized
> values.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  drivers/cxl/core/region.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index c3f4dc244df7..edf8636f190a 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -1266,8 +1266,8 @@ static int check_interleave_cap(struct cxl_decoder *cxld, int iw, int ig)
>  	struct cxl_port *port = to_cxl_port(cxld->dev.parent);
>  	struct cxl_hdm *cxlhdm = dev_get_drvdata(&port->dev);
>  	unsigned int interleave_mask;
> -	u8 eiw;
> -	u16 eig;
> +	u8 eiw = 0;
> +	u16 eig = 0;
>  	int high_pos, low_pos;
>  
>  	if (!test_bit(iw, &cxlhdm->iw_cap_mask))
> -- 
> 2.34.1
> 
