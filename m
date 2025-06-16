Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51B203706
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110317; cv=none; b=lkOjDFU91BeW+B+pPRnlKxdqD/71hlJSKgQiI3xijpnxr4gtBde5SZFMue6r2igaijbtqZU6nfqYhnmwElzOk0ZE7jV7acMgAf9MbOsmNaaYoJWcmCkZ7+yrkjVpWL9k+bpIsVOIeO2iIQ//XqQ0g2Jj2VzLocmmiYtaoW4e0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110317; c=relaxed/simple;
	bh=ue0zZGnlayFFocKO6DHpjurxQEhp5y8cZT9f9F34YpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWTEhZHLv30+/i8kkcNn0JIoF1waLN8dZWRSoA79xLE6ZreyjlNcq26UqVTvFfyhvMW6zvSfJNiN+xDOJ90VOUE2FAHxJAFwdqlDV7C6n64aM7Lwv/a5sEi2G0bDhoQK5DT9OM1EdQPMaVdtUtjdJroGsl55kkWQ/zn3Ux6/Dig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlXObMO6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlXObMO6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ca5eba8cso57995ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110316; x=1750715116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PkxtSh5lJN8oDluqdUpIdBWts0li7o6KCp4HMQP+7eU=;
        b=ZlXObMO6vZfQMyoE5FKd2xNZC0TUU4XYU6M5sc+UhP4rRwM/3DI2LA9XjtYFRNGkxZ
         bNoiBSKMhrkAU/8RLf41fW/6wy7nIwaxUlh7oSf0FrqS5t4mPPRCl2oyweKZjsPMlFAu
         ZWaEM3hgFfjMtLShUN8GPzZukM+ArTJ+oEIUwVzFD3TuphzyYOFReAEXNDyUo/94bfgv
         3r/nJJu9qZiCnSXOBMDEdDoXZdy4azkiDYbmambVtsyvGjd2Uv6BB2h/5SU0nFSzubwH
         RmYsc59zcUU8ix3aDvGYskpd8YZqdlGFfkuOMK6MD9Ex/J6EMhl4icHQJKMzKopnR8Wh
         aGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110316; x=1750715116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkxtSh5lJN8oDluqdUpIdBWts0li7o6KCp4HMQP+7eU=;
        b=oZr8V4eOqzOWgPkkHw2sEntZZ3yhikcLIy5Cyc+gvOUl12Hx8BOlJS+ldpKWqro5Fg
         lWcqZ9hJzbN61ODttOqN76D3xbWM/MUjuMDEQb8OxiIvMkg+0Wbzo+HLmXmA4ZuYPeXs
         swlKijtFoGQYSCIIKj7IoVEB2xYWWNT2PKAle16zBxQl1AoSQlKzz/w1lX8haH6IEenM
         qpk4azhwYVWZVeK+/UfCbM1P29r6OcpzFh+rpPgfrD+8kQNp1QQ4txAD+U6Hw9/sYxSR
         MWmoOsBOFVbY3rq9fHyUqZQ7ibj4+xB+zTrEsP9gEQS/QpReiQaDOtYGwQxNoadiLUf4
         Sebw==
X-Forwarded-Encrypted: i=1; AJvYcCVqowG2xAJKuEZG/PfjfGSjoBSGHRDcE5hbfe6ACvLvdZTGHEkiEqKhyNzw+Ae080Sd5XjPizuha3vFwb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXiBCh8ci/R4mQKAa9Y0awW7AMhWN2tr4HK1O0a8qwzmIOBuT
	tTpjQpduZrLWwGk3LS4v174aAp2B9+cQ3rKumpcpsDWwr5wpzDVMEjORPwfewMSXnA==
X-Gm-Gg: ASbGnct96x17iw5OeraLJtQMjKJreGS9f5u/CFnRgO0WzB1N+a7e586CCCXUi9u8thX
	yB4k/7GBZ5jkCWUs/teYvhmb6SebqZbOyo0IijYuN9rBxiejW7NTvBEIRFHcvxzgfJpGj1hlKzO
	s+8WXoBxwTO2Ym/CBTrMy/ZBgG8NsoVc0DUydj7hUp5KpgHlKTk93NaMrX/tOvqY31sgNa8EL4w
	lUJynDWD+EsjJ2o2UKV3WS8b4bjA3u4DLyolzc2rrlaTqUZY6fGb7oQJPLC1HWUYCUZwMPCS4lD
	bSpck/KDQQPP3PK5ZupCP5n8lZsrK9DP3ACEWOM512h5oVhZNmD3GJG7g/A/74pfVkM6+ENQ8h1
	w2MQI/dTZwTKuymcFEdqM
X-Google-Smtp-Source: AGHT+IHrQDyvVnwCf9csPzPlw1hS7k+ZaNmE2pdHcui8ltcFiMTENAodaPPmibhzeNqADUXMrthyDA==
X-Received: by 2002:a17:903:1a27:b0:234:bf4:98ba with SMTP id d9443c01a7336-2366c5bf768mr6063095ad.6.1750110315130;
        Mon, 16 Jun 2025 14:45:15 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d1ceesm7328258b3a.161.2025.06.16.14.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:45:14 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:45:06 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 03/14] iommufd: Use enum iommu_viommu_type for type in
 struct iommufd_viommu
Message-ID: <aFCQYqHostKg0YVt@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6ba5c0cd381594f17ae74355872d78d7a022c0.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:15PM -0700, Nicolin Chen wrote:
> Replace unsigned init, to make it clear. No functional changes.

Super nit: Typo: s/init/int

> 
> The viommu_alloc iommu op will be deprecated, so don't change that.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommufd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 498c9a768506..ac98e49e44fe 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -101,7 +101,7 @@ struct iommufd_viommu {
>  	struct list_head veventqs;
>  	struct rw_semaphore veventqs_rwsem;
>  
> -	unsigned int type;
> +	enum iommu_viommu_type type;
>  };

Reviewed-by: Pranjal Shrivastava <praan@google.com>

>  
>  /**
> -- 
> 2.43.0
> 
