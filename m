Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEC23D2B1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963222; cv=none; b=YWtkgKfOPsKvJXRh3J9h9KLHTmRZ84DILoUe0wS/IsrfoXZ4KKQ3IZ+o82kYfn6IlCZr5XfF3etvxOd6nNHIyPgFR2Ku1Pp6Dh3PHaQ9xK/clr/62r+tWH3zk2fO2ErS1gpa5z9eCiemAAWka3iti1lBw+/4FHMspubNmK5k08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963222; c=relaxed/simple;
	bh=4IZ5oKC84SpAytK+/YroVFmKZEVsGLuTlwAkjUMiYWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ou6xtCxxR/gpWmNYR3WPKw2Tw8/nbaqaVpWUQhnm7FL4ZdTdjeJETVl2kTEedet65GOUIkaqZcJvTuGnt8YYA6fxeHI4eAEkOoUKWtK/TViUjnQwkbZ+/zu10CGUOkm/lgCpoNrxusWYRl1yrG6Q/LwB0GBYI+irApHspLhXiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hzVFUIqV; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hzVFUIqV"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a440a72584so41307801cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748963219; x=1749568019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBcw9pAxeIim4PFbO0EsYyzCi4VNpAby8oYVEtJWvZY=;
        b=hzVFUIqVrw65EjFUk0HQs2c+IoiqsdJiCTQE9lISAaB0vo7eP2zMFlsHxzXguLR9PJ
         PD7W01Ba34025x1bsISeCHU6oM3vPtnhs8zWnioU9AY8kxy11dWAkUWsbaGBlqVyu+LZ
         dwk1tA9klJgebjA5myvGCECIv8OxXJn22mBgQNtdO5fYRFbzXZ86ykY8klLurL/Xex3s
         O+0U3bmzGOXhxppKqJOdqN0BS0AgaZmcG4irktdY3bUT1yCxkLKVplOzlN+uHzkeEesu
         dpCxktWTM2l3znsymWNdcIevr7h0yA1hNHzpiwF7bg38Ot1iym5r8SWpkmi8vX8LRSHO
         PUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748963219; x=1749568019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBcw9pAxeIim4PFbO0EsYyzCi4VNpAby8oYVEtJWvZY=;
        b=txTWSzZRe4H5OwYY8plGBn+Nfp8JlMHPUgK4vvg3TW7n+8vB0TFknPGdBpxBEBgxGY
         Ot2wFx7nBry6Uf855wZzjHUhVz7I5zEDzwe8Sp084KVkN2tElGj9z7CuaMCJHDzlpR72
         PmpcI4PgBa79PlV0MmTg+ZEpe3DvJgrHA1RIUF/698VeZONCY3SI5w8z4o1aAMVJmTM2
         dujdNYtJujUaRX1ICBDnmsngNZj6P/pRKfOqwx090LyPBBQ+m6kYdM27znrpa2xPyi0q
         uIQnk2QUrtTYmcVd3Xspto0yM7vTUclocd6WJSMB9aTQzQSF30THJsp+EslApcR1vmVk
         Vw6w==
X-Forwarded-Encrypted: i=1; AJvYcCUSoVoYlQmR6T5TeTXBdoFizeuIrEECv22ET2QCXXbwCByY9AYgM4SPp8xp9zuew2l20udYTMeznznefH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3RRtmNjiiwNkpISQhWVKkdPkybgQ7H0NV+iAp/rDT4u4HoHU
	h/U+HZQXIdX+sSaZBsWZ24uVqXW0pvsqGy/Yub+/mMbz6ETw6BNbhgfHOQEt0Gsd2uI=
X-Gm-Gg: ASbGncvm1s/536rY5Sy1TYhfFuPJdN+F4Jlaz4hcebBCvtSSjHEQZRTK1Dui77APaW7
	c9B7G6lSM+SDtHpcyEIqJW91LcXOAm1A72WS3mNKelQcsVDmeHhlH4ZjHkk6lwf0K7mT1smKMoe
	IN6ZxJ6YGPXvc2755Yxg+NoBZmKtGgjOQy9xDg2hKhiEINUjLvs07Sj3PfiBw4gBmgGkZw7jyGz
	AwZYYhihtKKZ8GPUwBIOhhRxcF/r6CBjeTnsed4a+kg2nT1+SGv3R5Lkzc6mHP81WmG2w8+HqJF
	7hdZmJCxpsHZ6SkGPeJ7Cb+NU4PpPM4fGMHtw5TrPyVb/7+DFfSWt4/KWusO8S1YXcxLQTiv6V+
	aYH7ZZS31XcQZLtQvkJcnZdeCRDY=
X-Google-Smtp-Source: AGHT+IHhqCppZOqzSDLECb61u7AtZD5CcJCcyFWN2hijSJ8HSCck7H8cbHGZnWZ5+BV2Y7fY8nJzRw==
X-Received: by 2002:a05:622a:4c8c:b0:4a4:3fc0:6df5 with SMTP id d75a77b69052e-4a443dc4efcmr210075641cf.10.1748963217999;
        Tue, 03 Jun 2025 08:06:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a8435esm74774761cf.78.2025.06.03.08.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:06:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMTE9-00000001ipJ-03XW;
	Tue, 03 Jun 2025 12:06:57 -0300
Date: Tue, 3 Jun 2025 12:06:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Wei Wang <wei.w.wang@intel.com>
Cc: baolu.lu@linux.intel.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	dwmw2@infradead.org, jroedel@suse.de, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v1] iommu/vt-d: Remove dead code in
 intel_iommu_domain_alloc_paging_flags()
Message-ID: <20250603150656.GA407166@ziepe.ca>
References: <20250530091325.694456-1-wei.w.wang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530091325.694456-1-wei.w.wang@intel.com>

On Fri, May 30, 2025 at 05:13:25PM +0800, Wei Wang wrote:
> When dirty_tracking is enabled, first_stage is set to false to use the
> second stage translation table. dmar_domain->use_first_level, which is
> assigned from first_page, is guaranteed to be false when the execution
> reaches the location of the code to be removed by this patch. So the
> handling for dmar_domain->use_first_level being true there will never
> be executed.
> 
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I noticed this too

Jason
